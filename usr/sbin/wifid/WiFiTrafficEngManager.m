@implementation WiFiTrafficEngManager

- (WiFiTrafficEngManager)initWithArgs:(__WiFiLQAMgr *)a3
{
  WiFiTrafficEngManager *v4;
  id v5;
  void *v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiTrafficEngManager;
  v4 = -[WiFiTrafficEngManager init](&v9, "init");
  if (!v4)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s Failed to allocate", "-[WiFiTrafficEngManager initWithArgs:]");
    goto LABEL_9;
  }
  v5 = objc_msgSend(objc_alloc((Class)WFTrafficEngManager), "initWithTrafficEngDelegate:", v4);
  if (!v5)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s lqaMgr is nil", "-[WiFiTrafficEngManager initWithArgs:]");
LABEL_9:
    objc_autoreleasePoolPop(v8);

    return 0;
  }
  v6 = v5;
  -[WiFiTrafficEngManager setLqaMgr:](v4, "setLqaMgr:", a3);
  -[WiFiTrafficEngManager setTrafficEng:](v4, "setTrafficEng:", v6);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiTrafficEngManager;
  -[WiFiTrafficEngManager dealloc](&v3, "dealloc");
}

- (__CFDictionary)retrieveCurrentLinkHealth
{
  return sub_100049DDC((const UInt8 *)-[WiFiTrafficEngManager lqaMgr](self, "lqaMgr"));
}

- (void)handleCriticalAppEvent:(id)a3
{
  sub_10004A070((uint64_t)-[WiFiTrafficEngManager lqaMgr](self, "lqaMgr"), a3);
}

- (void)discoveryIndication
{
  __WiFiLQAMgr *v2;
  uint64_t v3;

  v2 = -[WiFiTrafficEngManager lqaMgr](self, "lqaMgr");
  nullsub_3(v2, v3);
}

- (__CFDictionary)retrieveEventDetails
{
  return sub_10004A2E0((uint64_t *)-[WiFiTrafficEngManager lqaMgr](self, "lqaMgr"));
}

- (WFTrafficEngManager)trafficEng
{
  return (WFTrafficEngManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrafficEng:(id)a3
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

- (__WiFiLQAMgr)lqaMgr
{
  return self->_lqaMgr;
}

- (void)setLqaMgr:(__WiFiLQAMgr *)a3
{
  self->_lqaMgr = a3;
}

@end
