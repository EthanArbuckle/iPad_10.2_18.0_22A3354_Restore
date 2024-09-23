@implementation RBSystemPowerAssertion

- (RBSystemPowerAssertion)init
{
  RBSystemPowerAssertion *v2;
  RBSystemPowerAssertion *v3;
  NSString *baseName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBSystemPowerAssertion;
  v2 = -[RBPowerAssertion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    baseName = v2->super._baseName;
    v2->super._baseName = (NSString *)CFSTR("runningboardd.system");

  }
  return v3;
}

- (id)_preventIdleSleepIdentifiers
{
  return -[RBSystemState preventIdleSleepIdentifiers](self->_state, "preventIdleSleepIdentifiers");
}

- (int)_targetPid
{
  int result;

  result = -[RBSystemState preventIdleSleep](self->_state, "preventIdleSleep");
  if (result)
    return getpid();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
