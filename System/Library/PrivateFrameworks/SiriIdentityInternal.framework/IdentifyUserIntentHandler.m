@implementation IdentifyUserIntentHandler

- (void)resolveIdentityForUserIdentify:(UserIdentifyIntent *)a3 withCompletion:(id)a4
{
  sub_2463A907C(self, (int)a2, a3, a4, (uint64_t)&unk_251795748, (uint64_t)&unk_257570938);
}

- (void)confirmUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4
{
  sub_2463A907C(self, (int)a2, a3, a4, (uint64_t)&unk_251795720, (uint64_t)&unk_257570928);
}

- (void)handleUserIdentify:(UserIdentifyIntent *)a3 completion:(id)a4
{
  sub_2463A907C(self, (int)a2, a3, a4, (uint64_t)&unk_2517956F8, (uint64_t)&unk_257570918);
}

- (_TtC20SiriIdentityInternal25IdentifyUserIntentHandler)init
{
  return (_TtC20SiriIdentityInternal25IdentifyUserIntentHandler *)IdentifyUserIntentHandler.init()();
}

@end
