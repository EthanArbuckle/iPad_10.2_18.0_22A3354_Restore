@implementation RWIProtocolConsoleCallFrame

- (RWIProtocolConsoleCallFrame)initWithFunctionName:(id)a3 url:(id)a4 scriptId:(id)a5 lineNumber:(int)a6 columnNumber:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  RWIProtocolConsoleCallFrame *v15;
  RWIProtocolConsoleCallFrame *v16;
  objc_super v18;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RWIProtocolConsoleCallFrame;
  v15 = -[RWIProtocolJSONObject init](&v18, sel_init);
  if (v15)
  {
    if (!v12)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("functionName"));
    if (!v13)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("url"));
    if (!v14)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("scriptId"));
    -[RWIProtocolConsoleCallFrame setFunctionName:](v15, "setFunctionName:", v12);
    -[RWIProtocolConsoleCallFrame setUrl:](v15, "setUrl:", v13);
    -[RWIProtocolConsoleCallFrame setScriptId:](v15, "setScriptId:", v14);
    -[RWIProtocolConsoleCallFrame setLineNumber:](v15, "setLineNumber:", v8);
    -[RWIProtocolConsoleCallFrame setColumnNumber:](v15, "setColumnNumber:", v7);
    v16 = v15;
  }

  return v15;
}

- (void)setFunctionName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("functionName"));
}

- (NSString)functionName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("functionName"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setUrl:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("url"));
}

- (NSString)url
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("url"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setScriptId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("scriptId"));
}

- (NSString)scriptId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("scriptId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLineNumber:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("lineNumber"));
}

- (int)lineNumber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("lineNumber"));
}

- (void)setColumnNumber:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("columnNumber"));
}

- (int)columnNumber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("columnNumber"));
}

@end
