@implementation RWIProtocolDebuggerAssertPauseReason

- (void)setMessage:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerAssertPauseReason;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("message"));
}

- (NSString)message
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerAssertPauseReason;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("message"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
