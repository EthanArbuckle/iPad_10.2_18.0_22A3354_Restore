@implementation CFXEngineNotificationQueueTransientWrapper

- (void)setEngineNotificationQueue:(__CFXEngineNotificationQueue *)a3
{
  objc_storeWeak(&self->_queue, a3);
}

- (__CFXEngineNotificationQueue)engineNotificationQueue
{
  return (__CFXEngineNotificationQueue *)objc_loadWeak(&self->_queue);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_queue, 0);
  v3.receiver = self;
  v3.super_class = (Class)CFXEngineNotificationQueueTransientWrapper;
  -[CFXEngineNotificationQueueTransientWrapper dealloc](&v3, sel_dealloc);
}

@end
