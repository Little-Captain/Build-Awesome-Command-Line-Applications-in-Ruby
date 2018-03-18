#!/usr/bin/env ruby

# 获取第一个参数, 并转换为整型变量
task_number = ARGV.shift.to_i

# 打开文件
File.open("todo.txt", "r") do |file|
  # 创建一个中间文件
  File.open("todo.txt.new", 'w') do |new_file|
    # 任务计数器
    counter = 1
    # 以行的方式读取所有的行
    file.readlines.each do |line|
      # 对每行以 `,` 进行分割. 分别对应 name, created, completed
      name, created, completed = line.chomp.split(/,/)
      # 如果找到用户输入的任务编号
      if task_number == counter
        # 写入文件, 并添加完成时间
        new_file.puts("#{name},#{created},#{Time.now}")
        puts "Task#{counter} completed"
      else
        # 原样写入文件
        new_file.puts("#{name},#{created},#{completed}")
      end
      # 任务计数器加 1
      counter += 1
    end
  end
end

# 将新文件改名
`mv todo.txt.new todo.txt`