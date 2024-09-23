@implementation RWIProtocolDOMEventListener

- (RWIProtocolDOMEventListener)initWithEventListenerId:(int)a3 type:(id)a4 useCapture:(BOOL)a5 isAttribute:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  RWIProtocolDOMEventListener *v11;
  RWIProtocolDOMEventListener *v12;
  objc_super v14;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMEventListener;
  v11 = -[RWIProtocolJSONObject init](&v14, sel_init);
  if (v11)
  {
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("type"));
    -[RWIProtocolDOMEventListener setEventListenerId:](v11, "setEventListenerId:", v8);
    -[RWIProtocolDOMEventListener setType:](v11, "setType:", v10);
    -[RWIProtocolDOMEventListener setUseCapture:](v11, "setUseCapture:", v7);
    -[RWIProtocolDOMEventListener setIsAttribute:](v11, "setIsAttribute:", v6);
    v12 = v11;
  }

  return v11;
}

- (void)setEventListenerId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("eventListenerId"));
}

- (int)eventListenerId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("eventListenerId"));
}

- (void)setType:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("type"));
}

- (NSString)type
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("type"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setUseCapture:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("useCapture"));
}

- (BOOL)useCapture
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("useCapture"));
}

- (void)setIsAttribute:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isAttribute"));
}

- (BOOL)isAttribute
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isAttribute"));
}

- (void)setNodeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("nodeId"));
}

- (int)nodeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("nodeId"));
}

- (void)setOnWindow:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("onWindow"));
}

- (BOOL)onWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("onWindow"));
}

- (void)setLocation:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("location"));
}

- (RWIProtocolDebuggerLocation)location
{
  void *v3;
  RWIProtocolDebuggerLocation *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDebuggerLocation *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDebuggerLocation alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMEventListener;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setHandlerName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("handlerName"));
}

- (NSString)handlerName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("handlerName"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPassive:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("passive"));
}

- (BOOL)passive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("passive"));
}

- (void)setOnce:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("once"));
}

- (BOOL)once
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("once"));
}

- (void)setDisabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("disabled"));
}

- (BOOL)disabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("disabled"));
}

- (void)setHasBreakpoint:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("hasBreakpoint"));
}

- (BOOL)hasBreakpoint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("hasBreakpoint"));
}

@end
