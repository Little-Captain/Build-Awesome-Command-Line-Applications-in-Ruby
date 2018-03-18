#!/usr/bin/env ruby

# 以只读的方式打开文件
File.open("todo.txt", "r") do |file|
  # 任务计数器
  counter = 1
  # 以行的方式读取所有的行
  file.readlines.each do |line|
    # 对每行以 `,` 进行分割. 分别对应 name, created, completed
    name, created, completed = line.chomp.split(/,/)
    # 打印输出
    printf("%3d - %s\n", counter, name)
    printf("      Created   : %s\n", created)
    # completed 不为 nil, 表示完成了. 打印完成时间
    unless completed.nil?
      printf("      Completed : %s\n", completed)
    end
    # 计数器加 1
    counter += 1
  end
end

# unless 条件为假时
#   执行的语句
# end