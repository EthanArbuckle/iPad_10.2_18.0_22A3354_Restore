@implementation RWIProtocolDebuggerBreakpointPauseReason

- (RWIProtocolDebuggerBreakpointPauseReason)initWithBreakpointId:(id)a3
{
  id v4;
  RWIProtocolDebuggerBreakpointPauseReason *v5;
  RWIProtocolDebuggerBreakpointPauseReason *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDebuggerBreakpointPauseReason;
  v5 = -[RWIProtocolJSONObject init](&v8, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("breakpointId"));
    -[RWIProtocolDebuggerBreakpointPauseReason setBreakpointId:](v5, "setBreakpointId:", v4);
    v6 = v5;
  }

  return v5;
}

- (void)setBreakpointId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointPauseReason;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("breakpointId"));
}

- (NSString)breakpointId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointPauseReason;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("breakpointId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
