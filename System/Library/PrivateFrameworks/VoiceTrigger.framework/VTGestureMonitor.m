@implementation VTGestureMonitor

+ (id)defaultGestureMonitor
{
  return objc_alloc_init(VTGestureMonitorPhone);
}

- (VTGestureMonitorDelegate)delegate
{
  return (VTGestureMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
