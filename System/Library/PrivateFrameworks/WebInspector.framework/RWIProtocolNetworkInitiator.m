@implementation RWIProtocolNetworkInitiator

- (RWIProtocolNetworkInitiator)initWithType:(int64_t)a3
{
  RWIProtocolNetworkInitiator *v4;
  RWIProtocolNetworkInitiator *v5;
  RWIProtocolNetworkInitiator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolNetworkInitiator;
  v4 = -[RWIProtocolJSONObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[RWIProtocolNetworkInitiator setType:](v4, "setType:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)setType:(int64_t)a3
{
  _DWORD *v4;
  __CFString *v5;
  objc_super v6;
  _DWORD *v7;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = v7;
  if (v7)
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v5, CFSTR("type"));

  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
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
  v9.super_class = (Class)RWIProtocolNetworkInitiator;
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
  for (i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkInitiatorType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkInitiatorType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 9);
  v6 = (&Inspector::fromProtocolString<RWIProtocolNetworkInitiatorType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setStackTrace:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("stackTrace"));
}

- (RWIProtocolConsoleStackTrace)stackTrace
{
  void *v3;
  RWIProtocolConsoleStackTrace *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolConsoleStackTrace *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("stackTrace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolConsoleStackTrace alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkInitiator;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("stackTrace"));
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

- (void)setUrl:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("url"));
}

- (NSString)url
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("url"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLineNumber:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("lineNumber"), a3);
}

- (double)lineNumber
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("lineNumber"));
  return result;
}

- (void)setNodeId:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkInitiator;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("nodeId"));
}

- (int)nodeId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkInitiator;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("nodeId"));
}

@end
