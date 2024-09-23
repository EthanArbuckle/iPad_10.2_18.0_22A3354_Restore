@implementation PAAggregateVisibilityStateMonitor

- (PAAggregateVisibilityStateMonitor)initWithRawMonitor:(id)a3 startupInterval:(double)a4
{
  id v7;
  PAAggregateVisibilityStateMonitor *v8;
  PAAggregateVisibilityStateMonitor *v9;
  PAAggregateVisibilityStateMonitor *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PAAggregateVisibilityStateMonitor;
  v8 = -[PAAggregateVisibilityStateMonitor init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rawMonitor, a3);
    v9->_startupInterval = a4;
    v10 = v9;
  }

  return v9;
}

- (id)startMonitoringAggregateVisibilityStateForBundleIdentifiers:(id)a3 onQueue:(id)a4 withDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  PAAggregateVisibilityStateMonitorHandle *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = -[PAAggregateVisibilityStateMonitorHandle initWithStartupInterval:onQueue:delegate:]([PAAggregateVisibilityStateMonitorHandle alloc], "initWithStartupInterval:onQueue:delegate:", v9, v10, self->_startupInterval);
    -[PAProcessStateMonitoring startMonitoringVisibilityStateForBundleIdentifiers:onQueue:withDelegate:](self->_rawMonitor, "startMonitoringVisibilityStateForBundleIdentifiers:onQueue:withDelegate:", v8, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAAggregateVisibilityStateMonitorHandle bindToRawHandle:](v11, "bindToRawHandle:", v12);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawMonitor, 0);
}

@end
