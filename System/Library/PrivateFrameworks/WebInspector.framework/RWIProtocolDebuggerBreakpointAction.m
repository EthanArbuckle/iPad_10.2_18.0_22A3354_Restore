@implementation RWIProtocolDebuggerBreakpointAction

- (RWIProtocolDebuggerBreakpointAction)initWithType:(int64_t)a3
{
  RWIProtocolDebuggerBreakpointAction *v4;
  RWIProtocolDebuggerBreakpointAction *v5;
  RWIProtocolDebuggerBreakpointAction *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  v4 = -[RWIProtocolJSONObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[RWIProtocolDebuggerBreakpointAction setType:](v4, "setType:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)setType:(int64_t)a3
{
  __asm { BR              X9 }
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
  v9.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
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
  for (i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDebuggerBreakpointActionType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDebuggerBreakpointActionType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 12);
  v6 = (&Inspector::fromProtocolString<RWIProtocolDebuggerBreakpointActionType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("data"));
}

- (NSString)data
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("data"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setIdentifier:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("id"));
}

- (int)identifier
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("id"));
}

- (void)setEmulateUserGesture:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("emulateUserGesture"));
}

- (BOOL)emulateUserGesture
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("emulateUserGesture"));
}

@end
