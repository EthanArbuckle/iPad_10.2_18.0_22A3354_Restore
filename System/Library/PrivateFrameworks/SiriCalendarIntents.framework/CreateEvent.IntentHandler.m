@implementation CreateEvent.IntentHandler

- (void)resolveTitleForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228B8A4F8(self, (int)a2, a3, a4, (uint64_t)&unk_24F17FA80, (uint64_t)&unk_2559ECED0);
}

- (void)resolveDateTimeRangeForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228B8A4F8(self, (int)a2, a3, a4, (uint64_t)&unk_24F17FA58, (uint64_t)&unk_2559ECEC0);
}

- (void)resolveParticipantsForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228B8A4F8(self, (int)a2, a3, a4, (uint64_t)&unk_24F17FA30, (uint64_t)&unk_2559ECEA8);
}

- (void)resolveLocationForCreateEvent:(INCreateEventIntent *)a3 withCompletion:(id)a4
{
  sub_228B8A4F8(self, (int)a2, a3, a4, (uint64_t)&unk_24F17FA08, (uint64_t)&unk_2559ECE98);
}

- (void)confirmCreateEvent:(INCreateEventIntent *)a3 completion:(id)a4
{
  sub_228B8A4F8(self, (int)a2, a3, a4, (uint64_t)&unk_24F17F9E0, (uint64_t)&unk_2559ECE88);
}

- (void)handleCreateEvent:(INCreateEventIntent *)a3 completion:(id)a4
{
  sub_228B8A4F8(self, (int)a2, a3, a4, (uint64_t)&unk_24F17F9B8, (uint64_t)&unk_2559ECE78);
}

- (_TtCO19SiriCalendarIntents11CreateEvent13IntentHandler)init
{
  sub_228AE9FA0();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_correctionsFlowProvider);
  OUTLINED_FUNCTION_193(OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_featureManager);
  OUTLINED_FUNCTION_193(OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_eventProvider);
  OUTLINED_FUNCTION_193(OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_deviceState);
  swift_release();
  OUTLINED_FUNCTION_193(OBJC_IVAR____TtCO19SiriCalendarIntents11CreateEvent13IntentHandler_locationProvider);
  swift_release();
}

@end
