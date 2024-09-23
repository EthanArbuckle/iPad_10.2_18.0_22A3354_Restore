@implementation W5DiagnosticsTestRequestInternal

- (W5DiagnosticsTestRequestInternal)init
{
  W5DiagnosticsTestRequestInternal *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsTestRequestInternal;
  v2 = -[W5DiagnosticsTestRequestInternal init](&v5, "init");
  if (v2)
  {
    v3 = os_transaction_create("com.apple.wifivelocity.W5DiagnosticsTestRequestInternal");
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.W5DiagnosticsTestRequestInternal", v3);
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", self->_transaction);

  self->_transaction = 0;
  v3.receiver = self;
  v3.super_class = (Class)W5DiagnosticsTestRequestInternal;
  -[W5DiagnosticsTestRequestInternal dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5DiagnosticsTestRequestInternal *v4;

  v4 = -[W5DiagnosticsTestRequestInternal init](+[W5DiagnosticsTestRequestInternal allocWithZone:](W5DiagnosticsTestRequestInternal, "allocWithZone:", a3), "init");
  -[W5DiagnosticsTestRequestInternal setUuid:](v4, "setUuid:", self->_uuid);
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v4, "setIncludeEvents:", self->_includeEvents);
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v4, "setTestRequests:", self->_testRequests);
  -[W5DiagnosticsTestRequestInternal setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5DiagnosticsTestRequestInternal setReply:](v4, "setReply:", self->_reply);
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSArray)testRequests
{
  return self->_testRequests;
}

- (void)setTestRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)includeEvents
{
  return self->_includeEvents;
}

- (void)setIncludeEvents:(BOOL)a3
{
  self->_includeEvents = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
