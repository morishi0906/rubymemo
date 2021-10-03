require "csv"
    puts " これはメモアプリです"
loop do
    puts "※ ↓ 1か2を入力しEnterキーを押してください ↓　※"
    puts " 1(新規でメモを作成) 2(既存のメモ編集する)"
 
    memo_type = gets.chomp
 
 case memo_type
 when "1","１"
    puts " メモを作成します" 
    puts " ファイル名を入力し『Enter』キーを押してください"
    memo_tittle = gets.chomp
    puts " メモの内容を入力し『Enter』キーを押してください"
    puts " その後『control』 + 『D』キーを押ししてください"
    memo_content = STDIN.read
    CSV.open("memofile/#{memo_tittle}.csv",'w') do |memo|
        memo << ["#{memo_content}"]
    end
when "2","２"
    puts " メモを編集します"
    puts " 編集したいファイル名を入力し『Enter』キーを押してください"
    memo_tittle = gets.chomp
    puts " メモの内容を入力し『Enter』キーを押してください"
    puts " その後『control』 + 『D』キーを押ししてください"
    memo_content = STDIN.read
    CSV.open("memofile/#{memo_tittle}.csv",'a') do |memo|
        memo << ["#{memo_content}"]
    end
else
    puts "※無効な値が入力されました※"
end
end