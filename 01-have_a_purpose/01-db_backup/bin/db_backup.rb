#!/usr/bin/env ruby
# 获取第一个参数
database = ARGV.shift
# 获取第二个参数
username = ARGV.shift
# 获取第三个参数
password = ARGV.shift
# 获取第四个参数
end_of_iter = ARGV.shift

if end_of_iter.nil? # end_of_iter 为 nil, 就是用当前日期为文件拼接符
  backup_file = database + Time.now.strftime("%Y%m%d")
else # end_of_iter 不为 nil, 使用之
  backup_file = database + end_of_iter
end

# 使用 `` 执行 shell 命令
`mysqldump -u#{username} -p#{password} #{database} > #{backup_file}.sql`
`gzip #{backup_file}.sql`