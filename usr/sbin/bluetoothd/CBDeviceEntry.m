@implementation CBDeviceEntry

- (CBDeviceEntry)init
{
  CBDeviceEntry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *hostMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBDeviceEntry;
  v2 = -[CBDeviceEntry init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hostMap = v2->_hostMap;
    v2->_hostMap = v3;

  }
  return v2;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hostMap:%@"), self->_hostMap);
}

- (NSMutableDictionary)hostMap
{
  return self->_hostMap;
}

- (void)setHostMap:(id)a3
{
  objc_storeStrong((id *)&self->_hostMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostMap, 0);
}

@end
