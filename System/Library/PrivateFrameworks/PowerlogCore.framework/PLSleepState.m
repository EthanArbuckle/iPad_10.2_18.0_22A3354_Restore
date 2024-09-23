@implementation PLSleepState

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSleepState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLSleepState)init
{
  PLSleepState *v2;
  PLSleepState *v3;

  v2 = -[PLState initWithStateId:entryKey:currValue:](self, "initWithStateId:entryKey:currValue:", 32, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), MEMORY[0x1E0C9AAB0]);
  v3 = v2;
  if (v2)
    -[PLState updateWithLastEntry](v2, "updateWithLastEntry");
  return v3;
}

- (BOOL)updateWithEntry:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;
  uint64_t v9;
  _BOOL4 v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v6 <= 6)
  {
    if (((1 << v6) & 0x65) != 0)
    {
      v9 = MEMORY[0x1E0C9AAA0];
      goto LABEL_12;
    }
    if (v6 == 1)
    {
      if (v8 == 1 || v8 == 6)
        v9 = MEMORY[0x1E0C9AAB0];
      else
        v9 = 0;
      goto LABEL_12;
    }
  }
  v9 = 0;
LABEL_12:
  v11 = -[PLState updateWithValue:](self, "updateWithValue:", v9);
  if (v11)
  {
    objc_msgSend(v4, "entryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLState setStateChangeTime:](self, "setStateChangeTime:", v12);

  }
  return v11;
}

@end
