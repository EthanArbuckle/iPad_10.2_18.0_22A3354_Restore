@implementation SSDistributedNotificationCenterObserver

- (SSDistributedNotificationCenterObserver)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  SSDistributedNotificationCenterObserver *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSDistributedNotificationCenterObserver;
  v8 = -[SSDistributedNotificationCenterObserver init](&v10, sel_init);
  if (v8)
  {
    v8->_block = (id)objc_msgSend(a5, "copy");
    v8->_name = (NSString *)objc_msgSend(a3, "copy");
    if (a4)
    {
      v8->_dispatchQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)SSDistributedNotificationCenterObserver;
  -[SSDistributedNotificationCenterObserver dealloc](&v3, sel_dealloc);
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)name
{
  return self->_name;
}

@end
