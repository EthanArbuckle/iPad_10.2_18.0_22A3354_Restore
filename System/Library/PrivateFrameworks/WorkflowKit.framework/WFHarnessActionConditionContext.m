@implementation WFHarnessActionConditionContext

- (WFHarnessActionConditionContext)initWithVariableDataSource:(id)a3
{
  id v5;
  WFHarnessActionConditionContext *v6;
  WFHarnessActionConditionContext *v7;
  WFHarnessActionConditionContext *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFHarnessActionConditionContext;
  v6 = -[WFHarnessActionConditionContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_variableDataSource, a3);
    v8 = v7;
  }

  return v7;
}

- (WFVariableDataSource)variableDataSource
{
  return self->_variableDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableDataSource, 0);
}

@end
