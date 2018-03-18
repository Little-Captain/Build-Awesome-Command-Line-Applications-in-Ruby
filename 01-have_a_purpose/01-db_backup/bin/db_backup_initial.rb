#!/usr/bin/env ruby

# Hash
databases = {
  big_client: {
    database: 'big_client',
    username: 'big',
    password: 'big'
  },
  small_client: {
    database: 'small_client',
    username: 'small',
    password: 'p@ssWord!'
  }
}

# ARGV 表示传入该程序的参数, 不包括脚本程序名
# db_backup_initial.rb 1 2 3
# ARGV 为 [1, 2, 3]
# ARGV.shift 第一次就为1, 第二次就为2
end_of_iter = ARGV.shift

# 遍历 databases
# key: name, value: config
# 使用 each 将 Hash 变成可迭代对象
databases.each do |name,config|
  if end_of_iter.nil? # end_of_iter 为 nil, 就是用当前日期为文件拼接符
    backup_file = config[:database] + '_' + Time.now.strftime('%Y%m%d')
  else # end_of_iter 不为 nil, 使用之
    backup_file = config[:database] + '_' + end_of_iter
  end
  # 拼接 mysqldump 命令
  mysqldump = "mysqldump -u#{config[:username]} -p#{config[:password]} " + "#{config[:database]}"
  
  # 使用 `` 执行 shell 命令
  `#{mysqldump} > #{backup_file}.sql`
  `gzip #{backup_file}.sql`
end