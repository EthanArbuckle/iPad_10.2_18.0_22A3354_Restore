@implementation RWIProtocolRuntimeExecutionContextDescription

- (RWIProtocolRuntimeExecutionContextDescription)initWithIdentifier:(int)a3 type:(int64_t)a4 name:(id)a5 frameId:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  RWIProtocolRuntimeExecutionContextDescription *v12;
  RWIProtocolRuntimeExecutionContextDescription *v13;
  objc_super v15;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  v12 = -[RWIProtocolJSONObject init](&v15, sel_init);
  if (v12)
  {
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("name"));
    if (!v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("frameId"));
    -[RWIProtocolRuntimeExecutionContextDescription setIdentifier:](v12, "setIdentifier:", v8);
    -[RWIProtocolRuntimeExecutionContextDescription setType:](v12, "setType:", a4);
    -[RWIProtocolRuntimeExecutionContextDescription setName:](v12, "setName:", v10);
    -[RWIProtocolRuntimeExecutionContextDescription setFrameId:](v12, "setFrameId:", v11);
    v13 = v12;
  }

  return v12;
}

- (void)setIdentifier:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("id"));
}

- (int)identifier
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("id"));
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
  v6.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
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
  v9.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
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
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolRuntimeExecutionContextType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolRuntimeExecutionContextType>(WTF::String const&)::mappings)[i + 1]))
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
  v6 = (&Inspector::fromProtocolString<RWIProtocolRuntimeExecutionContextType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("name"));
}

- (NSString)name
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("name"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFrameId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("frameId"));
}

- (NSString)frameId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("frameId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
