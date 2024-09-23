@implementation DADaemonDiscovery

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMap, a3);
}

- (DADiscovery)discoveryObj
{
  return self->_discoveryObj;
}

- (void)setDiscoveryObj:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryObj, a3);
}

- (NSMutableSet)discoverySet
{
  return self->_discoverySet;
}

- (void)setDiscoverySet:(id)a3
{
  objc_storeStrong((id *)&self->_discoverySet, a3);
}

- (NSMutableDictionary)statefulDeviceMap
{
  return self->_statefulDeviceMap;
}

- (void)setStatefulDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_statefulDeviceMap, a3);
}

- (NSMutableDictionary)deviceAppAccessInfoMap
{
  return self->_deviceAppAccessInfoMap;
}

- (void)setDeviceAppAccessInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAppAccessInfoMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAppAccessInfoMap, 0);
  objc_storeStrong((id *)&self->_statefulDeviceMap, 0);
  objc_storeStrong((id *)&self->_discoverySet, 0);
  objc_storeStrong((id *)&self->_discoveryObj, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
}

@end
