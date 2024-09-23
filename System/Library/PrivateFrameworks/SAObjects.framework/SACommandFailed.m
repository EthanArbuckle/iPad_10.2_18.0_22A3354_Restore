@implementation SACommandFailed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CommandFailed");
}

+ (id)commandFailed
{
  return objc_alloc_init((Class)a1);
}

+ (SACommandFailed)commandFailedWithErrorCode:(int64_t)a3
{
  return -[SACommandFailed initWithErrorCode:]([SACommandFailed alloc], "initWithErrorCode:", a3);
}

+ (SACommandFailed)commandFailedWithReason:(id)a3
{
  id v3;
  SACommandFailed *v4;

  v3 = a3;
  v4 = -[SACommandFailed initWithReason:]([SACommandFailed alloc], "initWithReason:", v3);

  return v4;
}

- (SACommandFailed)initWithErrorCode:(int64_t)a3
{
  SACommandFailed *v4;
  SACommandFailed *v5;

  v4 = -[AceObject init](self, "init");
  v5 = v4;
  if (v4)
    -[SACommandFailed setErrorCode:](v4, "setErrorCode:", a3);
  return v5;
}

- (SACommandFailed)initWithReason:(id)a3
{
  id v4;
  SACommandFailed *v5;
  SACommandFailed *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SACommandFailed setReason:](v5, "setReason:", v4);

  return v6;
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("errorCode"));
}

- (void)setErrorCode:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("errorCode"), a3);
}

- (NSString)reason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reason"));
}

- (void)setReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reason"), a3);
}

- (NSString)turnId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("turnId"));
}

- (void)setTurnId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("turnId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
