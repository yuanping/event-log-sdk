require_relative "../lib/event-log-sdk/client"
require "minitest/autorun"

  describe EventLog::Client do
    before do
      @client = EventLog::Client.new host: 'http://lvh.me:3000', token: '1:RkPYCtz7v9p-KHh7LCxv'
      
      @log_hash = { 
        name: 'Order',
        category: 'CRM',
        content: 'price 20=>30',
        event: 'update',
        operator: 'yp',
        operator_id: 'yuanping@fishtrip.cn',
        link: 'http://fishtrip.cn'
      }
    end

    describe "get event_logs" do
      it "should be success" do
        res = @client.event_logs
        
        res.status.must_equal 200
        res.body.must_be_instance_of Array
      end
    end

    describe "post event log" do
      it "should be success" do
        res = @client.create_event_log @log_hash.to_json
        res.status.must_equal 201
      end
      
      it "should be 401 when invalid token" do
        @client.token = "1:invalidtoken"
        res = @client.create_event_log @log_hash.to_json
        res.status.must_equal 401
      end
    end
    
    
  end