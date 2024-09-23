@implementation RunningProgressSuppressionStateMachine.State

- (BOOL)canTransitionToState:(id)a3
{
  return sub_1C18606F4() & 1;
}

- (BOOL)shouldStartTimer
{
  return sub_1C1860768();
}

- (double)timeoutDuration
{
  return sub_1C18607A4();
}

- (void)cancel
{
  _TtCC11WorkflowKit38RunningProgressSuppressionStateMachineP33_D75DF74A866BF93BDD94A2803CD087FC5State *v2;

  v2 = self;
  sub_1C18607CC();

}

- (NSString)description
{
  _TtCC11WorkflowKit38RunningProgressSuppressionStateMachineP33_D75DF74A866BF93BDD94A2803CD087FC5State *v2;
  void *v3;

  v2 = self;
  sub_1C1860890();

  v3 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtCC11WorkflowKit38RunningProgressSuppressionStateMachineP33_D75DF74A866BF93BDD94A2803CD087FC5State)init
{
  sub_1C18609BC();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
