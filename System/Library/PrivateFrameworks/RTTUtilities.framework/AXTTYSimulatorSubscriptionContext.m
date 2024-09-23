@implementation AXTTYSimulatorSubscriptionContext

- (AXTTYSimulatorSubscriptionContext)init
{
  AXTTYSimulatorSubscriptionContext *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXTTYSimulatorSubscriptionContext;
  v2 = -[AXTTYSimulatorSubscriptionContext init](&v5, sel_init);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000001"));
  -[AXTTYSimulatorSubscriptionContext setTestUuid:](v2, "setTestUuid:", v3);

  return v2;
}

- (NSUUID)testUuid
{
  return self->_testUuid;
}

- (void)setTestUuid:(id)a3
{
  objc_storeStrong((id *)&self->_testUuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testUuid, 0);
}

@end
