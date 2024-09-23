@implementation W5IOPowerManagement

- (W5IOPowerManagement)init
{
  W5IOPowerManagement *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5IOPowerManagement;
  v2 = -[W5IOPowerManagement init](&v5, "init");
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.iopm", 0), (v2->_queue = (OS_dispatch_queue *)v3) != 0))
  {
    dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0);
  }
  else
  {

    return 0;
  }
  return v2;
}

- (void)setUpdatedPowerManagementCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerManagementCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100079FC8;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  v4.receiver = self;
  v4.super_class = (Class)W5IOPowerManagement;
  -[W5IOPowerManagement dealloc](&v4, "dealloc");
}

- (void)startEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A0B8;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A318;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)updatedPowerManagementCallback
{
  return self->_updatedPowerManagementCallback;
}

@end
