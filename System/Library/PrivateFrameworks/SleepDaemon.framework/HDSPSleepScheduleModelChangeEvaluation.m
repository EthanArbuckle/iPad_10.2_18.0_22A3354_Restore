@implementation HDSPSleepScheduleModelChangeEvaluation

- (HDSPSleepScheduleModelChangeEvaluation)initWithIsSignificantChange:(BOOL)a3 topLevelChangeKeys:(id)a4
{
  id v7;
  HDSPSleepScheduleModelChangeEvaluation *v8;
  HDSPSleepScheduleModelChangeEvaluation *v9;
  HDSPSleepScheduleModelChangeEvaluation *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepScheduleModelChangeEvaluation;
  v8 = -[HDSPSleepScheduleModelChangeEvaluation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isSignificantChange = a3;
    objc_storeStrong((id *)&v8->_topLevelChangeKeys, a4);
    v10 = v9;
  }

  return v9;
}

+ (id)combinedEvaluation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  HDSPSleepScheduleModelChangeEvaluation *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 |= objc_msgSend(v11, "isSignificantChange", (_QWORD)v15);
        objc_msgSend(v11, "topLevelChangeKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  v13 = -[HDSPSleepScheduleModelChangeEvaluation initWithIsSignificantChange:topLevelChangeKeys:]([HDSPSleepScheduleModelChangeEvaluation alloc], "initWithIsSignificantChange:topLevelChangeKeys:", v8 & 1, v4);
  return v13;
}

+ (id)emptyEvaluation
{
  HDSPSleepScheduleModelChangeEvaluation *v2;
  void *v3;
  HDSPSleepScheduleModelChangeEvaluation *v4;

  v2 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDSPSleepScheduleModelChangeEvaluation initWithIsSignificantChange:topLevelChangeKeys:](v2, "initWithIsSignificantChange:topLevelChangeKeys:", 0, v3);

  return v4;
}

+ (id)significantChangeWithTopLevelChangeKeys:(id)a3
{
  id v3;
  HDSPSleepScheduleModelChangeEvaluation *v4;

  v3 = a3;
  v4 = -[HDSPSleepScheduleModelChangeEvaluation initWithIsSignificantChange:topLevelChangeKeys:]([HDSPSleepScheduleModelChangeEvaluation alloc], "initWithIsSignificantChange:topLevelChangeKeys:", 1, v3);

  return v4;
}

- (NSString)description
{
  return (NSString *)-[HDSPSleepScheduleModelChangeEvaluation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_24D4E68A0);
}

- (id)succinctDescriptionBuilder
{
  return -[HDSPSleepScheduleModelChangeEvaluation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_24D4E68A0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPSleepScheduleModelChangeEvaluation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_isSignificantChange, CFSTR("isSignificantChange"), 1);
  v6 = (id)objc_msgSend(v4, "appendInteger:withName:", -[NSSet count](self->_topLevelChangeKeys, "count"), CFSTR("topLevelChangeKeys"));
  return v4;
}

- (BOOL)isSignificantChange
{
  return self->_isSignificantChange;
}

- (NSSet)topLevelChangeKeys
{
  return self->_topLevelChangeKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelChangeKeys, 0);
}

@end
