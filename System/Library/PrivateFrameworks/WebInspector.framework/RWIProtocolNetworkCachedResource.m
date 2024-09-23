@implementation RWIProtocolNetworkCachedResource

- (RWIProtocolNetworkCachedResource)initWithUrl:(id)a3 type:(int64_t)a4 bodySize:(double)a5
{
  id v8;
  RWIProtocolNetworkCachedResource *v9;
  RWIProtocolNetworkCachedResource *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolNetworkCachedResource;
  v9 = -[RWIProtocolJSONObject init](&v12, sel_init);
  if (v9)
  {
    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("url"));
    -[RWIProtocolNetworkCachedResource setUrl:](v9, "setUrl:", v8);
    -[RWIProtocolNetworkCachedResource setType:](v9, "setType:", a4);
    -[RWIProtocolNetworkCachedResource setBodySize:](v9, "setBodySize:", a5);
    v10 = v9;
  }

  return v9;
}

- (void)setUrl:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("url"));
}

- (NSString)url
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("url"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setType:(int64_t)a3
{
  __CFString *v4;
  _DWORD *v5;
  objc_super v6;
  _DWORD *v7;

  Inspector::toProtocolString(a3);
  if (v7)
    v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v4, CFSTR("type"));

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2)
      WTF::StringImpl::destroy();
    else
      *v5 -= 2;
  }
}

- (int64_t)type
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
  v9.super_class = (Class)RWIProtocolNetworkCachedResource;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("type"));
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
  for (i = 0; i != 36; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 36);
  v6 = (&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setResponse:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("response"));
}

- (RWIProtocolNetworkResponse)response
{
  void *v3;
  RWIProtocolNetworkResponse *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolNetworkResponse *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("response"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolNetworkResponse alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkCachedResource;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("response"));
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

- (void)setBodySize:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("bodySize"), a3);
}

- (double)bodySize
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("bodySize"));
  return result;
}

- (void)setSourceMapURL:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("sourceMapURL"));
}

- (NSString)sourceMapURL
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("sourceMapURL"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
