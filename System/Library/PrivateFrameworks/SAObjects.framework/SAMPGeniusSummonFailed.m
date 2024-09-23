@implementation SAMPGeniusSummonFailed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GeniusSummonFailed");
}

+ (id)geniusSummonFailed
{
  return objc_alloc_init((Class)a1);
}

+ (id)geniusSummonFailedWithErrorCode:(int64_t)a3
{
  return -[SAMPGeniusSummonFailed initWithErrorCode:]([SAMPGeniusSummonFailed alloc], "initWithErrorCode:", a3);
}

+ (id)geniusSummonFailedWithReason:(id)a3
{
  id v3;
  SAMPGeniusSummonFailed *v4;

  v3 = a3;
  v4 = -[SAMPGeniusSummonFailed initWithReason:]([SAMPGeniusSummonFailed alloc], "initWithReason:", v3);

  return v4;
}

- (SAMPGeniusSummonFailed)initWithErrorCode:(int64_t)a3
{
  SAMPGeniusSummonFailed *v4;
  SAMPGeniusSummonFailed *v5;

  v4 = -[AceObject init](self, "init");
  v5 = v4;
  if (v4)
    -[SAMPGeniusSummonFailed setErrorCode:](v4, "setErrorCode:", a3);
  return v5;
}

- (SAMPGeniusSummonFailed)initWithReason:(id)a3
{
  id v4;
  SAMPGeniusSummonFailed *v5;
  SAMPGeniusSummonFailed *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAMPGeniusSummonFailed setReason:](v5, "setReason:", v4);

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

- (BOOL)requiresResponse
{
  return 0;
}

@end
