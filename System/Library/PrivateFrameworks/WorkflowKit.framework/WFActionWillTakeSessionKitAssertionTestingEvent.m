@implementation WFActionWillTakeSessionKitAssertionTestingEvent

- (WFActionWillTakeSessionKitAssertionTestingEvent)initWithAction:(id)a3 sessionConfiguration:(id)a4
{
  WFActionWillTakeSessionKitAssertionTestingEvent *result;

  ActionWillTakeSessionKitAssertionTestingEvent.init(action:sessionConfiguration:)(a3, (uint64_t)a4);
  return result;
}

- (WFActionWillTakeSessionKitAssertionTestingEvent)initWithAction:(id)a3
{
  id v3;

  v3 = a3;
  ActionWillTakeSessionKitAssertionTestingEvent.init(action:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___WFActionWillTakeSessionKitAssertionTestingEvent_sessionConfiguration));
}

@end
