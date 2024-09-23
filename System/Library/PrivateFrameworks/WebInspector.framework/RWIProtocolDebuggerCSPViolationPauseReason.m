@implementation RWIProtocolDebuggerCSPViolationPauseReason

- (RWIProtocolDebuggerCSPViolationPauseReason)initWithDirective:(id)a3
{
  id v4;
  RWIProtocolDebuggerCSPViolationPauseReason *v5;
  RWIProtocolDebuggerCSPViolationPauseReason *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDebuggerCSPViolationPauseReason;
  v5 = -[RWIProtocolJSONObject init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("directive"));
    -[RWIProtocolDebuggerCSPViolationPauseReason setDirective:](v5, "setDirective:", v4);
    v6 = v5;
  }

  return v5;
}

- (void)setDirective:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCSPViolationPauseReason;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("directive"));
}

- (NSString)directive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCSPViolationPauseReason;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("directive"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
