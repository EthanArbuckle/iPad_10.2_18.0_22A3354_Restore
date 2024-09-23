@implementation RWIProtocolNetworkWebSocketResponse

- (RWIProtocolNetworkWebSocketResponse)initWithStatus:(int)a3 statusText:(id)a4 headers:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  RWIProtocolNetworkWebSocketResponse *v10;
  RWIProtocolNetworkWebSocketResponse *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  v10 = -[RWIProtocolJSONObject init](&v13, sel_init);
  if (v10)
  {
    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("statusText"));
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("headers"));
    -[RWIProtocolNetworkWebSocketResponse setStatus:](v10, "setStatus:", v6);
    -[RWIProtocolNetworkWebSocketResponse setStatusText:](v10, "setStatusText:", v8);
    -[RWIProtocolNetworkWebSocketResponse setHeaders:](v10, "setHeaders:", v9);
    v11 = v10;
  }

  return v10;
}

- (void)setStatus:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("status"));
}

- (int)status
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("status"));
}

- (void)setStatusText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("statusText"));
}

- (NSString)statusText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("statusText"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHeaders:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("headers"));
}

- (RWIProtocolNetworkHeaders)headers
{
  void *v3;
  RWIProtocolNetworkHeaders *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolNetworkHeaders *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("headers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("headers"));
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

@end
