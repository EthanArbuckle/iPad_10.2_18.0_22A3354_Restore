@implementation PLPluggedState

- (BOOL)updateWithEntry:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
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

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPluggedState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLPluggedState)init
{
  PLPluggedState *v2;
  PLPluggedState *v3;

  v2 = -[PLState initWithStateId:entryKey:currValue:](self, "initWithStateId:entryKey:currValue:", 1, CFSTR("PLBatteryAgent_EventBackward_Battery"), MEMORY[0x1E0C9AAA0]);
  v3 = v2;
  if (v2)
    -[PLState updateWithLastEntry](v2, "updateWithLastEntry");
  return v3;
}

@end
