@implementation EstablishUserIntentHandler

- (_TtC20SiriIdentityInternal26EstablishUserIntentHandler)init
{
  return (_TtC20SiriIdentityInternal26EstablishUserIntentHandler *)sub_2463B67D4();
}

- (void)resolveIdentityForUserIdentify:(UserIdentifyIntent *)a3 withCompletion:(id)a4
{
  sub_2463B724C(self, (int)a2, a3, a4, (uint64_t)&unk_251795F88, (uint64_t)&unk_257571250);
}

- (void)confirmUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4
{
  sub_2463B724C(self, (int)a2, a3, a4, (uint64_t)&unk_251795F60, (uint64_t)&unk_257571240);
}

- (void)handleUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4
{
  sub_2463B724C(self, (int)a2, a3, a4, (uint64_t)&unk_251795EC0, (uint64_t)&unk_257571200);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
