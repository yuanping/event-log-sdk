# EventLog::Client

A Ruby interface to the EventLog API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'event-log-sdk', git: 'git://github.com/yuanping/event-log-sdk.git'
```

And then execute:

    $ bundle


## Usage

```ruby
client = EventLog::Client.new host: 'http://lvh.me:3000', token: '1922:RkPYCtz7v9p-KHh7LCxv', version: 'v1'

event = { 
  name: 'Order',
  category: 'CRM',
  content: 'price 20=>30',
  event: 'update',
  operator: 'yp',
  operator_id: 'yuanping@fishtrip.cn',
  link: 'http://fishtrip.cn'
}

client.create_event_log event.to_json
 #=> success response code: 201
 
client.event_logs
 #=> [{name: 'Order', content: 'update price: 20 => 30', ...}, {...}]
```
## Contributing

1. Fork it ( https://github.com/yuanping/event-log-sdk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
