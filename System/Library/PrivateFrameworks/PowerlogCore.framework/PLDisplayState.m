@implementation PLDisplayState

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDisplayState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLDisplayState)init
{
  PLDisplayState *v2;
  PLDisplayState *v3;

  v2 = -[PLState initWithStateId:entryKey:currValue:](self, "initWithStateId:entryKey:currValue:", 4, CFSTR("PLDisplayAgent_EventPoint_Display"), MEMORY[0x1E0C9AAA0]);
  v3 = v2;
  if (v2)
    -[PLState updateWithLastEntry](v2, "updateWithLastEntry");
  return v3;
}

- (BOOL)updateWithEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Block"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDisplayState getDisplayBlock](PLDisplayState, "getDisplayBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLState updateWithValue:](self, "updateWithValue:", v8);
    if (v9)
    {
      objc_msgSend(v4, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLState setStateChangeTime:](self, "setStateChangeTime:", v10);

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)getDisplayBlock
{
  return CFSTR("Backlight");
}

@end
