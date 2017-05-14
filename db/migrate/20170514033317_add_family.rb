class AddFamily < ActiveRecord::Migration[5.1]
  def change
    SeeAndSay.create!(display_text: 1, category: 0, audio_file: "http://www.macmillandictionary.com/us/media/american/us_pron/o/one/one_A/one_American_English_pronunciation.mp3")
    SeeAndSay.create!(display_text: 2, category: 0, audio_file: "http://www.macmillandictionary.com/us/media/american/us_pron/t/two/two_A/two_American_English_pronunciation.mp3")
    SeeAndSay.create!(display_text: 3, category: 0, audio_file: "http://www.macmillandictionary.com/us/media/american/us_pron/t/thr/three/three_American_English_pronunciation.mp3")
    SeeAndSay.create!(display_text: 4, category: 0, audio_file: "http://www.macmillandictionary.com/us/media/american/us_pron/f/fou/four_/four_American_English_pronunciation_21079.mp3")
    SeeAndSay.create!(display_text: "papa.jpg", category: 1, audio_file: "papa.mp3")
    SeeAndSay.create!(display_text: "mama.jpg", category: 1, audio_file: "mama.mp3")
    SeeAndSay.create!(display_text: "dadi.jpg", category: 1, audio_file: "dadi.mp3")
    SeeAndSay.create!(display_text: "dada.jpg", category: 1, audio_file: "dada.mp3")
    SeeAndSay.create!(display_text: "nani.jpg", category: 1, audio_file: "nani.mp3")
    SeeAndSay.create!(display_text: "nana.jpg", category: 1, audio_file: "nana.mp3")
    SeeAndSay.create!(display_text: "vihu.jpg", category: 1, audio_file: "vihu.mp3")
  end
end
