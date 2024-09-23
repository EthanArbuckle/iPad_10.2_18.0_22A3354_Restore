@implementation PLWakeState

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLWakeState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLWakeState)init
{
  return -[PLState initWithStateId:entryKey:currValue:](self, "initWithStateId:entryKey:currValue:", 8, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), MEMORY[0x1E0C9AAB0]);
}

- (BOOL)updateWithEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = MEMORY[0x1E0C9AAA0];
  if (v8 == 1 || v8 == 6)
    v11 = MEMORY[0x1E0C9AAA0];
  else
    v11 = 0;
  if (v6 != 1)
    v11 = 0;
  if ((v6 - 5) >= 2)
    v9 = v11;
  if ((v6 & 0xFFFFFFFD) != 0)
    v12 = v9;
  else
    v12 = MEMORY[0x1E0C9AAB0];
  v13 = -[PLState updateWithValue:](self, "updateWithValue:", v12);
  if (v13)
  {
    objc_msgSend(v4, "entryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLState setStateChangeTime:](self, "setStateChangeTime:", v14);

  }
  return v13;
}

@end
