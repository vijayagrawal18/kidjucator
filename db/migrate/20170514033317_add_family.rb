class AddFamily < ActiveRecord::Migration[5.1]
  def change
    SeeAndSay.connection.schema_cache.clear!
    SeeAndSay.create!(display_text: 1, category: 0, audio_file: "audio/one.mp3")
    SeeAndSay.create!(display_text: 2, category: 0, audio_file: "audio/two.mp3")
    SeeAndSay.create!(display_text: 3, category: 0, audio_file: "audio/three.mp3")
    SeeAndSay.create!(display_text: 4, category: 0, audio_file: "audio/four.mp3")
    SeeAndSay.create!(display_text: "papa.jpg", category: 1, audio_file: "audio/papa.mp3")
    SeeAndSay.create!(display_text: "mama.jpg", category: 1, audio_file: "audio/mama.mp3")
    SeeAndSay.create!(display_text: "dadi.jpg", category: 1, audio_file: "audio/dadi.mp3")
    SeeAndSay.create!(display_text: "dada.jpg", category: 1, audio_file: "audio/dada.mp3")
    SeeAndSay.create!(display_text: "nani.jpg", category: 1, audio_file: "audio/nani.mp3")
    SeeAndSay.create!(display_text: "nana.jpg", category: 1, audio_file: "audio/nana.mp3")
    SeeAndSay.create!(display_text: "vihu.jpg", category: 1, audio_file: "audio/vihu.mp3")
  end
end
