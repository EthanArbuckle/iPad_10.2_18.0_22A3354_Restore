@implementation RTScenarioTriggerNotification

- (RTScenarioTriggerNotification)initWithScenarioTrigger:(id)a3
{
  id v5;
  RTScenarioTriggerNotification *v6;
  RTScenarioTriggerNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTScenarioTriggerNotification;
  v6 = -[RTNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scenarioTrigger, a3);

  return v7;
}

- (RTScenarioTrigger)scenarioTrigger
{
  return self->_scenarioTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenarioTrigger, 0);
}

@end
