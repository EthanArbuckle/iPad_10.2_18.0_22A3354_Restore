@implementation RWIProtocolNetworkResponse

- (RWIProtocolNetworkResponse)initWithUrl:(id)a3 status:(int)a4 statusText:(id)a5 headers:(id)a6 mimeType:(id)a7 source:(int64_t)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  RWIProtocolNetworkResponse *v18;
  RWIProtocolNetworkResponse *v19;
  objc_super v21;

  v12 = *(_QWORD *)&a4;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RWIProtocolNetworkResponse;
  v18 = -[RWIProtocolJSONObject init](&v21, sel_init);
  if (v18)
  {
    if (!v14)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("url"));
    if (!v15)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("statusText"));
    if (!v16)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("headers"));
    if (!v17)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("mimeType"));
    -[RWIProtocolNetworkResponse setUrl:](v18, "setUrl:", v14);
    -[RWIProtocolNetworkResponse setStatus:](v18, "setStatus:", v12);
    -[RWIProtocolNetworkResponse setStatusText:](v18, "setStatusText:", v15);
    -[RWIProtocolNetworkResponse setHeaders:](v18, "setHeaders:", v16);
    -[RWIProtocolNetworkResponse setMimeType:](v18, "setMimeType:", v17);
    -[RWIProtocolNetworkResponse setSource:](v18, "setSource:", a8);
    v19 = v18;
  }

  return v18;
}

- (void)setUrl:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("url"));
}

- (NSString)url
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("url"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setStatus:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("status"));
}

- (int)status
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("status"));
}

- (void)setStatusText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("statusText"));
}

- (NSString)statusText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("statusText"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHeaders:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
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
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("headers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
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

- (void)setMimeType:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("mimeType"));
}

- (NSString)mimeType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("mimeType"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSource:(int64_t)a3
{
  __asm { BR              X9 }
}

- (int64_t)source
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolNetworkResponse;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("source"));
  MEMORY[0x2207574E0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    v4 = 0x100000000;
  }
  for (i = 0; i != 18; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkResponseSource>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkResponseSource>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 18);
  v6 = (&Inspector::fromProtocolString<RWIProtocolNetworkResponseSource>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

- (void)setRequestHeaders:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("requestHeaders"));
}

- (RWIProtocolNetworkHeaders)requestHeaders
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
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("requestHeaders"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("requestHeaders"));
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

- (void)setTiming:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("timing"));
}

- (RWIProtocolNetworkResourceTiming)timing
{
  void *v3;
  RWIProtocolNetworkResourceTiming *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolNetworkResourceTiming *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("timing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolNetworkResourceTiming alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("timing"));
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

- (void)setSecurity:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("security"));
}

- (RWIProtocolSecurity)security
{
  void *v3;
  RWIProtocolSecurity *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolSecurity *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("security"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolSecurity alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("security"));
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
