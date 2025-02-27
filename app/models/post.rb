class Post < ApplicationRecord
  belongs_to :user
  has_many :post_moods, dependent: :destroy
  has_many :moods, through: :post_moods
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :post_image
  
  validates :body, presence: true, length: { maximum: 40 }
  validate :one_post_per_day, on: :create
  validates :post_image, content_type: {in:[:png, :jpg, :jpeg], message: "はpng, jpg, jpegいずれかの形式にして下さい"}
  
  # 気分が空の時、選択された気分が１つの時、選択が複数の際の条件分岐↓
  def background_color
    if moods.empty?
      '#f5f5f5'
    elsif moods.size == 1
      moods.first.color
    else
      colors = moods.map(&:color).join(', ')
      "linear-gradient(to right, #{colors})"
    end
  end
  
  # いいねが重複しないように定義↓
  def favorited?(user)
    favorites.exists?(user_id: user.id)
  end
  
  # ユーザーのお気に入り投稿一覧を取得↓
  scope :favorited_by, ->(user_id) {
    joins(:favorites).where(favorites: { user_id: user_id }).order('favorites.created_at DESC')
  }

   # 検索の際に完全一致と部分一致で検索がかかるように↓
  def self.search_for(content,method)
    if method == 'perfect'
      Post.where(name: content)
    else
      Post.where('name LIKE ?', '%' +  content  + '%')
    end
  end
  
  private

  # 1日1投稿のバリデーション↓
  def one_post_per_day
    if Post.where(user_id: user_id, created_at: Time.zone.today.all_day).exists?
      errors.add(:base, "本日は既に投稿済みです")
    end
  end
  
  # 公開非公開設定用↓
  def self.public_posts
    where(is_public: true)
  end

  # 画像が添付されていない場合のエラー回避のための記述、view側で使用はしていない↓
  def get_post_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end
  
end
