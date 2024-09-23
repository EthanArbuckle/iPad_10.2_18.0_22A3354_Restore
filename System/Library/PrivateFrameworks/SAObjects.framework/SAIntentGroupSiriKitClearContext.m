@implementation SAIntentGroupSiriKitClearContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitClearContext");
}

+ (id)siriKitClearContext
{
  return objc_alloc_init((Class)a1);
}

+ (id)siriKitClearContextWithReason:(id)a3
{
  id v3;
  SAIntentGroupSiriKitClearContext *v4;

  v3 = a3;
  v4 = -[SAIntentGroupSiriKitClearContext initWithReason:]([SAIntentGroupSiriKitClearContext alloc], "initWithReason:", v3);

  return v4;
}

- (SAIntentGroupSiriKitClearContext)initWithReason:(id)a3
{
  id v4;
  SAIntentGroupSiriKitClearContext *v5;
  SAIntentGroupSiriKitClearContext *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAIntentGroupSiriKitClearContext setReason:](v5, "setReason:", v4);

  return v6;
}

- (NSString)reason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reason"));
}

- (void)setReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reason"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
