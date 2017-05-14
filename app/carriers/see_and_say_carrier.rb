class SeeAndSayCarrier
  include ActionView::Helpers::AssetTagHelper
  attr_accessor :seeAndSay, :options
  COLORS = %w(lemonchiffon green cadetblue lightcoral orange gray sienna)

  delegate :display_text, :audio_file, :family?, :numbers?, to: :seeAndSay

  def initialize(seeAndSay, options)
    @seeAndSay = seeAndSay
    @options = options
  end

  def display
    if family?
      image_tag(display_text, data: {audio_src: audio_file})
    else
      content_tag("span", display_text, data: {audio_src: audio_file})
    end
  end

  def css
    if family?
      "image #{options[:class]}"
    else
      "text #{options[:class]}"
    end
  end

  def self.wrap(seeAndSays)

    colors = COLORS.shuffle.take(4)
    seeAndSays = seeAndSays.to_a.sort_by{ |obj| obj.display_text }
    seeAndSays.each_with_index.map { |obj, index| new(obj, class: colors[index]) }
  end

end
