@implementation PLDarkWakeState

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDarkWakeState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLDarkWakeState)init
{
  return -[PLState initWithStateId:entryKey:currValue:](self, "initWithStateId:entryKey:currValue:", 16, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), MEMORY[0x1E0C9AAA0]);
}

- (BOOL)updateWithEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  BOOL v9;
  uint64_t v10;
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

  v9 = v8 == 1 || v8 == 6;
  v10 = MEMORY[0x1E0C9AAA0];
  if (!v9)
    v10 = 0;
  if (v6 != 1)
    v10 = 0;
  if ((v6 - 5) >= 2)
    v11 = v10;
  else
    v11 = MEMORY[0x1E0C9AAB0];
  if ((v6 & 0xFFFFFFFD) != 0)
    v12 = v11;
  else
    v12 = MEMORY[0x1E0C9AAA0];
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
