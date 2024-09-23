@implementation VTGestureMonitorPhone

- (VTGestureMonitorPhone)init
{
  VTGestureMonitorPhone *v2;
  uint64_t v3;
  CMWakeGestureManager *gestureManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTGestureMonitorPhone;
  v2 = -[VTGestureMonitorPhone init](&v6, sel_init);
  if (v2 && objc_msgSend(MEMORY[0x24BDC1440], "isWakeGestureAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDC1440], "sharedManager");
    v3 = objc_claimAutoreleasedReturnValue();
    gestureManager = v2->_gestureManager;
    v2->_gestureManager = (CMWakeGestureManager *)v3;

  }
  return v2;
}

- (void)startObserving
{
  -[CMWakeGestureManager setDelegate:](self->_gestureManager, "setDelegate:", self);
  -[CMWakeGestureManager startWakeGestureUpdates](self->_gestureManager, "startWakeGestureUpdates");
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v6 = a3;
  if (a4 == 3)
  {
    v8.receiver = self;
    v8.super_class = (Class)VTGestureMonitorPhone;
    -[VTGestureMonitor delegate](&v8, sel_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gestureMonitorDidReceiveSleepGesture:", self);
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)VTGestureMonitorPhone;
    -[VTGestureMonitor delegate](&v9, sel_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gestureMonitorDidReceiveWakeGesture:", self);
LABEL_5:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
}

@end
