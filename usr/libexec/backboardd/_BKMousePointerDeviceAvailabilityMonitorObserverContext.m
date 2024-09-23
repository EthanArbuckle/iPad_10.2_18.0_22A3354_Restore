@implementation _BKMousePointerDeviceAvailabilityMonitorObserverContext

- (_BKMousePointerDeviceAvailabilityMonitorObserverContext)initWithObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _BKMousePointerDeviceAvailabilityMonitorObserverContext *v8;
  _BKMousePointerDeviceAvailabilityMonitorObserverContext *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BKMousePointerDeviceAvailabilityMonitorObserverContext;
  v8 = -[_BKMousePointerDeviceAvailabilityMonitorObserverContext init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (BKMousePointerDeviceAvailabilityMonitorObserver)observer
{
  return (BKMousePointerDeviceAvailabilityMonitorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
