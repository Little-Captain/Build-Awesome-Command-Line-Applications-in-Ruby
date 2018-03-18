#!/usr/bin/env ruby

# 获取第一个参数
new_task = ARGV.shift

# 打开文件. a: 以追加方式打开文件, 不存在就创建
File.open("todo.txt", "a") do |file|
  # 向文件中打印
  file.puts "#{new_task},#{Time.now}"
  # 向屏幕中输出
  puts "Task added."
end