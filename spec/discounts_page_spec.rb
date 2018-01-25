RSpec.describe DiscountsPage do
  describe '#url' do
    let(:page) do
      described_class.new(
        discount_type_url: url,
        discount_parser: discount_parser
      )
    end
    let(:url) { 'https://myshop.ua/discounts/good' }
    let(:discount_parser) { DiscountParser.new({}) }

    subject { page.url }

    context 'without pagination' do
      it { is_expected.to eq url }
    end

    context 'with pagination' do
      let(:page) do
        described_class.new(
          discount_type_url: url,
          discount_parser: discount_parser,
          pagination: {
            pages_count_xpath: "//a[contains(@class, 'pagination')]"
          }
        )
      end

      it { is_expected.to eq "#{url}?page=1" }
    end
  end
end
