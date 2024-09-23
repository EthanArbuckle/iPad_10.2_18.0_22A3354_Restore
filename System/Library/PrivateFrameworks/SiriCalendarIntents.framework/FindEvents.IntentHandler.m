@implementation FindEvents.IntentHandler

- (void)resolveSearchQueryForFindEvents:(INFindEventsIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveDateTimeRangeForFindEvents:(INFindEventsIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveParticipantsForFindEvents:(INFindEventsIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveLocationForFindEvents:(INFindEventsIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveRequestedEventAttributeForFindEvents:(INFindEventsIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)handleFindEvents:(INFindEventsIntent *)a3 completion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (_TtCO19SiriCalendarIntents10FindEvents13IntentHandler)init
{
  sub_228AE9FA0();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_eventProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_locationProvider);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_deviceState);
  swift_bridgeObjectRelease();
}

@end
