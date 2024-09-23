@implementation WFRunningProgressSuppressionStateMachine

- (WFRunningProgressSuppressionStateMachineDelegate)delegate
{
  return (WFRunningProgressSuppressionStateMachineDelegate *)(id)sub_1C1860FE4();
}

- (void)setDelegate:(id)a3
{
  WFRunningProgressSuppressionStateMachine *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1C1861074();

}

- (WFRunningProgressSuppressionStateMachine)init
{
  return (WFRunningProgressSuppressionStateMachine *)RunningProgressSuppressionStateMachine.init()();
}

- (void)startedRunningShortcut:(id)a3 withDialogAttribution:(id)a4
{
  id v6;
  id v7;
  WFRunningProgressSuppressionStateMachine *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C1861360(v6, v7);

}

- (void)startedRunningAction:(id)a3 inShortcut:(id)a4
{
  id v6;
  id v7;
  WFRunningProgressSuppressionStateMachine *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C186148C(v6, v7);

}

- (void)decideRunningProgressIsAllowed:(BOOL)a3 withReason:(id)a4
{
  WFRunningProgressSuppressionStateMachine *v6;

  sub_1C1B0F224();
  v6 = self;
  sub_1C186187C(a3);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1C1606884((uint64_t)self + OBJC_IVAR___WFRunningProgressSuppressionStateMachine_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___WFRunningProgressSuppressionStateMachine_initialDialogAttribution));
  swift_release();
}

@end
