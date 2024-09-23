@implementation PPSClient

- (PPSClient)initWithConnection:(id)a3 remoteProxy:(id)a4
{
  id v7;
  id v8;
  PPSClient *v9;
  PPSClient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSClient;
  v9 = -[PPSClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_remoteProxy, a4);
  }

  return v10;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PPSMetricMonitorClientInterface)remoteProxy
{
  return (PPSMetricMonitorClientInterface *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PPSMetricMonitorConfiguration)config
{
  return (PPSMetricMonitorConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableSet)monitoredPIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMonitoredPIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)requestedProcessNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequestedProcessNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PPSMetricCollection)metricCollection
{
  return (PPSMetricCollection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetricCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricCollection, 0);
  objc_storeStrong((id *)&self->_requestedProcessNames, 0);
  objc_storeStrong((id *)&self->_monitoredPIDs, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
