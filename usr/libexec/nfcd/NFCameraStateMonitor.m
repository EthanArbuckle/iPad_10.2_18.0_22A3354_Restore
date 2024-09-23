@implementation NFCameraStateMonitor

- (NFCameraStateMonitor)init
{
  NFCameraStateMonitor *v2;
  NFCameraStateMonitor *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  NSMapTable *delegates;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NFCameraStateMonitor;
  v2 = -[NFCameraStateMonitor init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cameraStates = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);

    v8 = dispatch_queue_create("com.apple.nfcd.cameraMonitor", v7);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    delegates = v3->_delegates;
    v3->_delegates = (NSMapTable *)v10;

    v3->_delegatesLock._os_unfair_lock_opaque = 0;
    v3->_cameraStateBeforeDebounceStarted = -1;

  }
  return v3;
}

- (void)dealloc
{
  IONotificationPort *ioNotifyPort;
  io_object_t notificationObj;
  objc_super v5;

  ioNotifyPort = self->_ioNotifyPort;
  if (ioNotifyPort)
    IONotificationPortDestroy(ioNotifyPort);
  notificationObj = self->_notificationObj;
  if (notificationObj)
    IOObjectRelease(notificationObj);
  v5.receiver = self;
  v5.super_class = (Class)NFCameraStateMonitor;
  -[NFCameraStateMonitor dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sbActionHandlerIdentifer, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_debounceCameraNotificationTimer, 0);
}

@end
