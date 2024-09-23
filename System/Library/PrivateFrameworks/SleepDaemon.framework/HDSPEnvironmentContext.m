@implementation HDSPEnvironmentContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeEvaluation, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

+ (id)contextWithSource:(id)a3
{
  id v3;
  HDSPEnvironmentContext *v4;

  v3 = a3;
  v4 = -[HDSPEnvironmentContext initWithSource:changeEvaluation:]([HDSPEnvironmentContext alloc], "initWithSource:changeEvaluation:", v3, 0);

  return v4;
}

- (HDSPEnvironmentContext)initWithSource:(id)a3 changeEvaluation:(id)a4
{
  id v7;
  id v8;
  HDSPEnvironmentContext *v9;
  HDSPEnvironmentContext *v10;
  HDSPEnvironmentContext *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSPEnvironmentContext;
  v9 = -[HDSPEnvironmentContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_changeEvaluation, a4);
    v11 = v10;
  }

  return v10;
}

- (id)contextByApplyingChangeEvaluation:(id)a3
{
  id v4;
  HDSPEnvironmentContext *v5;
  HDSPEnvironmentContext *v6;
  HDSPSource *source;
  void *v8;
  void *v9;
  HDSPEnvironmentContext *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [HDSPEnvironmentContext alloc];
  v6 = v5;
  source = self->_source;
  if (self->_changeEvaluation)
  {
    v12[0] = self->_changeEvaluation;
    v12[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:](HDSPSleepScheduleModelChangeEvaluation, "combinedEvaluation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HDSPEnvironmentContext initWithSource:changeEvaluation:](v6, "initWithSource:changeEvaluation:", source, v9);

  }
  else
  {
    v10 = -[HDSPEnvironmentContext initWithSource:changeEvaluation:](v5, "initWithSource:changeEvaluation:", self->_source, v4);
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)-[HDSPEnvironmentContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_24D4E68A0);
}

- (id)succinctDescriptionBuilder
{
  return -[HDSPEnvironmentContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_24D4E68A0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPEnvironmentContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPEnvironmentContext source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("source"));

  -[HDSPEnvironmentContext changeEvaluation](self, "changeEvaluation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v7, CFSTR("changeEvaluation"), 1);

  return v4;
}

- (HDSPSource)source
{
  return self->_source;
}

- (HDSPSleepScheduleModelChangeEvaluation)changeEvaluation
{
  return self->_changeEvaluation;
}

@end
