class Article < ApplicationRecord

    has_rich_text :content

    belongs_to :user
    has_many :has_categories
    has_many :categories, through: :has_categories

    attr_accessor :category_elements

    def save_categories
        return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

        has_categories.where.not(category_id: category_elements).destroy

        # categories_array = category_elements.split(",")
        categories_array.each do |category_id|
            # unless HashCategory.where(article: self, category_id: category_id).any?
            #     HashCategory.create(article: self, category_id: category_id)
            # end
            HashCategory.find_or_create_by(article: self, category_id: category_id)
        end
    end

end
