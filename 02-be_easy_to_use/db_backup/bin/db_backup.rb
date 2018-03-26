#!/usr/bin/env ruby

# Bring OptionParser into the namespace
require 'optparse'

# 创建一个空 Hash, 用于存储所有的用户参数
options = {}

# 理解 Blocks
option_parser = OptionParser.new do | opts |
  
  # Create a switch
  # 解析 -i --iteration 开关(switch)
  opts.on("-i", "--iteration") do
    options[:iteration] = true
  end
  
  # Create a flag
  # 解析 -u USER 标志(flag)
  opts.on("-u USER") do | user |
    options[:user] = user
  end
  
  # 解析 -p PASSWORD 标志(flag)
  opts.on("-p PASSWORD") do | password |
    options[:password] = password
  end
  
end

# 方法后为?, 表示返回布尔值
# 方法后为!, 表示方法有破坏性. 修改原来的对象(没有copy)
option_parser.parse!
# inspect: to_s 的别名, 将 Hash 转换为 String
puts options.inspect