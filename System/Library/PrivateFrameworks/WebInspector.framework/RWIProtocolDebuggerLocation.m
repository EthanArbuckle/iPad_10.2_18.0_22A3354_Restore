@implementation RWIProtocolDebuggerLocation

- (RWIProtocolDebuggerLocation)initWithScriptId:(id)a3 lineNumber:(int)a4
{
  uint64_t v4;
  id v6;
  RWIProtocolDebuggerLocation *v7;
  RWIProtocolDebuggerLocation *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolDebuggerLocation;
  v7 = -[RWIProtocolJSONObject init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("scriptId"));
    -[RWIProtocolDebuggerLocation setScriptId:](v7, "setScriptId:", v6);
    -[RWIProtocolDebuggerLocation setLineNumber:](v7, "setLineNumber:", v4);
    v8 = v7;
  }

  return v7;
}

- (void)setScriptId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("scriptId"));
}

- (NSString)scriptId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("scriptId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLineNumber:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("lineNumber"));
}

- (int)lineNumber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("lineNumber"));
}

- (void)setColumnNumber:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("columnNumber"));
}

- (int)columnNumber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("columnNumber"));
}

@end
