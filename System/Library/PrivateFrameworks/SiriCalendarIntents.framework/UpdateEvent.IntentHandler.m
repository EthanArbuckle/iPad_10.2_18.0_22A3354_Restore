@implementation UpdateEvent.IntentHandler

- (void)resolveTargetEventIdentifierForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveSetTitleForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveSetDateTimeRangeForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveSetLocationForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveAddParticipantsForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveRemoveParticipantsForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveRemoveLocationForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)resolveUpdateAllOccurrencesForUpdateEvent:(INUpdateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (void)handleUpdateEvent:(INUpdateEventIntent *)a3 completion:(id)a4
{
  sub_228AE94DC(self, (int)a2, a3, a4);
}

- (_TtCO19SiriCalendarIntents11UpdateEvent13IntentHandler)init
{
  sub_228AE9FA0();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11UpdateEvent13IntentHandler_eventProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11UpdateEvent13IntentHandler_locationProvider);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
