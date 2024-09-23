@implementation NFTouchSensorMonitor

- (void)dealloc
{
  objc_super v3;

  if (self && self->_started)
    -[HIDEventSystemClient cancel](self->_eventMonitorClient, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)NFTouchSensorMonitor;
  -[NFTouchSensorMonitor dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventMonitorClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
