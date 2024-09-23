@implementation SAGetSingleClientStateFailed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetSingleClientStateFailed");
}

+ (id)getSingleClientStateFailed
{
  return objc_alloc_init((Class)a1);
}

+ (id)getSingleClientStateFailedWithErrorCode:(int64_t)a3
{
  return -[SAGetSingleClientStateFailed initWithErrorCode:]([SAGetSingleClientStateFailed alloc], "initWithErrorCode:", a3);
}

+ (id)getSingleClientStateFailedWithReason:(id)a3
{
  id v3;
  SAGetSingleClientStateFailed *v4;

  v3 = a3;
  v4 = -[SAGetSingleClientStateFailed initWithReason:]([SAGetSingleClientStateFailed alloc], "initWithReason:", v3);

  return v4;
}

- (SAGetSingleClientStateFailed)initWithErrorCode:(int64_t)a3
{
  SAGetSingleClientStateFailed *v4;
  SAGetSingleClientStateFailed *v5;

  v4 = -[AceObject init](self, "init");
  v5 = v4;
  if (v4)
    -[SAGetSingleClientStateFailed setErrorCode:](v4, "setErrorCode:", a3);
  return v5;
}

- (SAGetSingleClientStateFailed)initWithReason:(id)a3
{
  id v4;
  SAGetSingleClientStateFailed *v5;
  SAGetSingleClientStateFailed *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAGetSingleClientStateFailed setReason:](v5, "setReason:", v4);

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

- (SAAceClientState)attemptedClientState
{
  return (SAAceClientState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("attemptedClientState"));
}

- (void)setAttemptedClientState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("attemptedClientState"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
