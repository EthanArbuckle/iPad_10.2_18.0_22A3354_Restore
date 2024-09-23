@implementation RWIProtocolConsoleChannel

- (RWIProtocolConsoleChannel)initWithSource:(int64_t)a3 level:(int64_t)a4
{
  RWIProtocolConsoleChannel *v6;
  RWIProtocolConsoleChannel *v7;
  RWIProtocolConsoleChannel *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolConsoleChannel;
  v6 = -[RWIProtocolJSONObject init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[RWIProtocolConsoleChannel setSource:](v6, "setSource:", a3);
    -[RWIProtocolConsoleChannel setLevel:](v7, "setLevel:", a4);
    v8 = v7;
  }

  return v7;
}

- (void)setSource:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolConsoleChannel;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v4, CFSTR("source"));

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
  v9.super_class = (Class)RWIProtocolConsoleChannel;
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
  for (i = 0; i != 51; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelSource>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelSource>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 51);
  v6 = (&Inspector::fromProtocolString<RWIProtocolConsoleChannelSource>(WTF::String const&)::mappings)[i + 2];
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

- (void)setLevel:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolConsoleChannel;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v5, CFSTR("level"));

  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
}

- (int64_t)level
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
  v9.super_class = (Class)RWIProtocolConsoleChannel;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("level"));
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
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelLevel>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelLevel>(WTF::String const&)::mappings)[i + 1]))
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
  v6 = (&Inspector::fromProtocolString<RWIProtocolConsoleChannelLevel>(WTF::String const&)::mappings)[i + 2];
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

@end
