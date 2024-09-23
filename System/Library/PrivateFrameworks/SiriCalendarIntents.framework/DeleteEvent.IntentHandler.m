@implementation DeleteEvent.IntentHandler

- (void)resolveTargetEventIdentifierForDeleteEvent:(INDeleteEventIntent *)a3 withCompletion:(id)a4
{
  sub_228BC1CB8(self, (int)a2, a3, a4, (uint64_t)&unk_24F181DB8, (uint64_t)&unk_2559EE3A8);
}

- (void)resolveDeleteAllOccurrencesForDeleteEvent:(INDeleteEventIntent *)a3 withCompletion:(id)a4
{
  sub_228BC1CB8(self, (int)a2, a3, a4, (uint64_t)&unk_24F181D90, (uint64_t)&unk_2559EE398);
}

- (void)handleDeleteEvent:(INDeleteEventIntent *)a3 completion:(id)a4
{
  sub_228BC1CB8(self, (int)a2, a3, a4, (uint64_t)&unk_24F181CF0, (uint64_t)&unk_2559EE350);
}

- (_TtCO19SiriCalendarIntents11DeleteEvent13IntentHandler)init
{
  sub_228AE9FA0();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCO19SiriCalendarIntents11DeleteEvent13IntentHandler_eventProvider);
}

@end
