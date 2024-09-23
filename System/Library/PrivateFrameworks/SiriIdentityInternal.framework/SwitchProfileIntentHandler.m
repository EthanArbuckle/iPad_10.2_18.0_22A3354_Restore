@implementation SwitchProfileIntentHandler

- (_TtC20SiriIdentityInternal26SwitchProfileIntentHandler)init
{
  return (_TtC20SiriIdentityInternal26SwitchProfileIntentHandler *)SwitchProfileIntentHandler.init()();
}

- (void)resolveAccountForSwitchProfile:(SwitchProfileIntent *)a3 withCompletion:(id)a4
{
  sub_2463989F8(self, (int)a2, a3, a4);
}

- (void)confirmSwitchProfile:(SwitchProfileIntent *)a3 completion:(id)a4
{
  sub_2463989F8(self, (int)a2, a3, a4);
}

- (void)handleSwitchProfile:(SwitchProfileIntent *)a3 completion:(id)a4
{
  sub_2463989F8(self, (int)a2, a3, a4);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_assistantServices);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender);
}

@end
