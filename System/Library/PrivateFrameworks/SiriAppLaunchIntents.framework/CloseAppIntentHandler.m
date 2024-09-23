@implementation CloseAppIntentHandler

- (_TtC20SiriAppLaunchIntents21CloseAppIntentHandler)init
{
  _TtC20SiriAppLaunchIntents21CloseAppIntentHandler *result;

  CloseAppIntentHandler.init()();
  return result;
}

- (void)resolveApplicationForCloseApp:(CloseAppIntent *)a3 withCompletion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1DB480, (uint64_t)&unk_255A2DCA0);
}

- (void)confirmCloseApp:(CloseAppIntent *)a3 completion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1DB458, (uint64_t)&unk_255A2DC90);
}

- (void)handleCloseApp:(CloseAppIntent *)a3 completion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1DB430, (uint64_t)&unk_255A2DC80);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents21CloseAppIntentHandler_appsSearcher);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents21CloseAppIntentHandler_installedApps);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents21CloseAppIntentHandler_terminationProvider);
}

@end
