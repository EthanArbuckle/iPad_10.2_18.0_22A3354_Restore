@implementation IOHIDDisplayStateMonitor

- (IOHIDDisplayStateMonitor)initWithTargetQueue:(id)a3
{
  IOHIDDisplayStateMonitor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOHIDDisplayStateMonitor;
  result = -[IOHIDDisplayStateMonitor init](&v5, "init");
  if (result)
    result->_targetQueue = (OS_dispatch_queue *)a3;
  return result;
}

- (id)monitorDisplayOnStateForReason:(id)a3 handler:(id)a4
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000291B8;
  v5[3] = &unk_10007DCF0;
  v5[4] = a4;
  return +[DarwinNotificationWatcher monitorNotificationKey:forReason:queue:handler:](DarwinNotificationWatcher, "monitorNotificationKey:forReason:queue:handler:", CFSTR("com.apple.iokit.hid.displayStatus"), a3, -[IOHIDDisplayStateMonitor targetQueue](self, "targetQueue"), v5);
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
