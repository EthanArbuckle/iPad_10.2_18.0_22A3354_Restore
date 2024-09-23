@implementation CBWHBHostEntry

- (CBWHBHostEntry)init
{
  CBWHBHostEntry *v2;
  CBWHBHostEntry *v3;
  CBWHBCoexUsage *v4;
  CBWHBCoexUsage *coexUsage;
  NSMutableDictionary *v6;
  NSMutableDictionary *deviceList;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CBWHBHostEntry;
  v2 = -[CBWHBHostEntry init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cpuUsage = 1;
    v4 = objc_alloc_init(CBWHBCoexUsage);
    coexUsage = v3->_coexUsage;
    v3->_coexUsage = v4;

    v3->_estimatedConnections = 0;
    v3->_estimatedConnectionsLastUpdatedTicks = 0;
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceList = v3->_deviceList;
    v3->_deviceList = v6;

  }
  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CPU Usage:%llu  COEX Usage:%@ \n\tDevice list:%@"), self->_cpuUsage, self->_coexUsage, self->_deviceList);
}

- (NSMutableDictionary)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
  objc_storeStrong((id *)&self->_deviceList, a3);
}

- (unint64_t)cpuUsage
{
  return self->_cpuUsage;
}

- (void)setCpuUsage:(unint64_t)a3
{
  self->_cpuUsage = a3;
}

- (CBWHBCoexUsage)coexUsage
{
  return self->_coexUsage;
}

- (void)setCoexUsage:(id)a3
{
  objc_storeStrong((id *)&self->_coexUsage, a3);
}

- (unint64_t)estimatedConnections
{
  return self->_estimatedConnections;
}

- (void)setEstimatedConnections:(unint64_t)a3
{
  self->_estimatedConnections = a3;
}

- (unint64_t)estimatedConnectionsLastUpdatedTicks
{
  return self->_estimatedConnectionsLastUpdatedTicks;
}

- (void)setEstimatedConnectionsLastUpdatedTicks:(unint64_t)a3
{
  self->_estimatedConnectionsLastUpdatedTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coexUsage, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);
}

@end
