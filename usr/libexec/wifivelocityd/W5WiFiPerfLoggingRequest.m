@implementation W5WiFiPerfLoggingRequest

- (W5WiFiPerfLoggingRequest)init
{
  W5WiFiPerfLoggingRequest *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5WiFiPerfLoggingRequest;
  v2 = -[W5WiFiPerfLoggingRequest init](&v5, "init");
  if (v2)
  {
    v3 = os_transaction_create("com.apple.wifivelocity.W5WiFiPerfLoggingRequest");
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.W5WiFiPerfLoggingRequest", v3);
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
  v3.super_class = (Class)W5WiFiPerfLoggingRequest;
  -[W5WiFiPerfLoggingRequest dealloc](&v3, "dealloc");
}

- (id)description
{
  NSMutableString *v3;

  v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("UUID: %@\n"), self->_uuid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Configuration: %@\n"), self->_configuration);
  return -[NSMutableString copy](v3, "copy");
}

- (BOOL)isEqualToWiFiPerfLoggingRequest:(id)a3
{
  return -[NSUUID isEqual:](self->_uuid, "isEqual:", objc_msgSend(a3, "uuid"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 == self)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class(self, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
      return -[W5WiFiPerfLoggingRequest isEqualToWiFiPerfLoggingRequest:](self, "isEqualToWiFiPerfLoggingRequest:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5WiFiPerfLoggingRequest *v4;

  v4 = -[W5WiFiPerfLoggingRequest init](+[W5WiFiPerfLoggingRequest allocWithZone:](W5WiFiPerfLoggingRequest, "allocWithZone:", a3), "init");
  -[W5WiFiPerfLoggingRequest setUuid:](v4, "setUuid:", self->_uuid);
  -[W5WiFiPerfLoggingRequest setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5WiFiPerfLoggingRequest setReply:](v4, "setReply:", self->_reply);
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
