@implementation DeepLaunchIntentHandler

- (_TtC20SiriAppLaunchIntents23DeepLaunchIntentHandler)init
{
  return (_TtC20SiriAppLaunchIntents23DeepLaunchIntentHandler *)sub_229141468();
}

- (void)resolvePageNameForDeepLaunch:(DeepLaunchIntent *)a3 withCompletion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1D95B0, (uint64_t)&unk_255A2B930);
}

- (void)resolveRequestedApplicationForDeepLaunch:(DeepLaunchIntent *)a3 withCompletion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1D9588, (uint64_t)&unk_255A2B920);
}

- (void)confirmDeepLaunch:(DeepLaunchIntent *)a3 completion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1D9560, (uint64_t)&unk_255A2B910);
}

- (void)handleDeepLaunch:(DeepLaunchIntent *)a3 completion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1D9538, (uint64_t)&unk_255A2B900);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents23DeepLaunchIntentHandler_appsSearcher);
  sub_22912250C((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents23DeepLaunchIntentHandler_hsqaRunner, &qword_255A2B8E8);
}

@end
