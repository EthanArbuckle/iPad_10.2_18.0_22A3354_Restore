@implementation WiFiNetworkDenyListManager

- (WiFiNetworkDenyListManager)initWithArgs:(__WiFiDeviceManager *)a3 interfaceName:(id)a4
{
  WiFiNetworkDenyListManager *v6;
  id v7;
  void *v8;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiNetworkDenyListManager;
  v6 = -[WiFiNetworkDenyListManager init](&v11, "init");
  if (!v6)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s Failed to allocate", "-[WiFiNetworkDenyListManager initWithArgs:interfaceName:]");
    goto LABEL_9;
  }
  v7 = objc_msgSend(objc_alloc((Class)CWFNetworkDenyList), "initWithDenyListDeviceProfile:", 1);
  if (!v7)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s deviceManager is nil", "-[WiFiNetworkDenyListManager initWithArgs:interfaceName:]");
LABEL_9:
    objc_autoreleasePoolPop(v10);

    return 0;
  }
  v8 = v7;
  -[WiFiNetworkDenyListManager setDeviceMgr:](v6, "setDeviceMgr:", a3);
  -[WiFiNetworkDenyListManager setIfName:](v6, "setIfName:", a4);
  objc_msgSend(v8, "setEnabled:", 1);
  -[WiFiNetworkDenyListManager setNetworkDenyList:](v6, "setNetworkDenyList:", v8);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiNetworkDenyListManager;
  -[WiFiNetworkDenyListManager dealloc](&v3, "dealloc");
}

- (BOOL)retrieveBatteryInfo:(BOOL *)a3 batteryLevel:(unsigned int *)a4
{
  int v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned __int8 v12;

  v12 = 0;
  v11 = 0;
  if (!a3 || !a4)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s Batterylevel:%p. externalPowerSupply:%p", "-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]", a4, a3);
    goto LABEL_11;
  }
  v6 = sub_10011A160((uint64_t)self->_deviceMgr, (uint64_t)&v12, (uint64_t)&v11);
  v7 = objc_autoreleasePoolPush();
  if (!v6)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s Callbacks not available ", "-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]", v9, v10);
LABEL_11:
    objc_autoreleasePoolPop(v7);
    return 0;
  }
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s BatteryInfo. batterylevel:%u. externalPowerSupply:%u", "-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]", v11, v12);
  objc_autoreleasePoolPop(v7);
  *a3 = v12 != 0;
  *a4 = v11;
  return 1;
}

- (BOOL)isUserModeInteractive
{
  return sub_10011A19C((uint64_t)self->_deviceMgr);
}

- (void)denyListDidUpdate
{
  sub_1000F8630((uint64_t)self->_deviceMgr);
  sub_1001233EC((uint64_t)self->_deviceMgr);
}

- (CWFNetworkDenyList)networkDenyList
{
  return (CWFNetworkDenyList *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNetworkDenyList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (__WiFiDeviceManager)deviceMgr
{
  return self->_deviceMgr;
}

- (void)setDeviceMgr:(__WiFiDeviceManager *)a3
{
  self->_deviceMgr = a3;
}

- (NSString)ifName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIfName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
