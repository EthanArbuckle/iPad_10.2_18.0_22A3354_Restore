@implementation PLUserIdleState

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLUserIdleState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLUserIdleState)init
{
  PLUserIdleState *v2;
  PLUserIdleState *v3;

  v2 = -[PLState initWithStateId:entryKey:currValue:](self, "initWithStateId:entryKey:currValue:", 64, CFSTR("PLSleepWakeAgent_EventForward_UserIdle"), MEMORY[0x1E0C9AAB0]);
  v3 = v2;
  if (v2)
    -[PLState updateWithLastEntry](v2, "updateWithLastEntry");
  return v3;
}

- (BOOL)updateWithEntry:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Idle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLState updateWithValue:](self, "updateWithValue:", v5);
  if (v6)
  {
    objc_msgSend(v4, "entryDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLState setStateChangeTime:](self, "setStateChangeTime:", v7);

  }
  return v6;
}

@end
