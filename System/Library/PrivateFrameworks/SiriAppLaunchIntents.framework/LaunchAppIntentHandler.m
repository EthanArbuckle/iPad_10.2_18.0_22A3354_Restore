@implementation LaunchAppIntentHandler

- (_TtC20SiriAppLaunchIntents22LaunchAppIntentHandler)init
{
  _TtC20SiriAppLaunchIntents22LaunchAppIntentHandler *result;

  LaunchAppIntentHandler.init()();
  return result;
}

- (void)resolveApplicationForLaunchApp:(LaunchAppIntent *)a3 withCompletion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1DC640, (uint64_t)&unk_255A2EE90);
}

- (void)confirmLaunchApp:(LaunchAppIntent *)a3 completion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1DC618, (uint64_t)&unk_255A2EE80);
}

- (void)handleLaunchApp:(LaunchAppIntent *)a3 completion:(id)a4
{
  sub_229142A38(self, (int)a2, a3, a4, (uint64_t)&unk_24F1DC578, (uint64_t)&unk_255A2EE40);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_appsSearcher);
  OUTLINED_FUNCTION_63_4(OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps);
  OUTLINED_FUNCTION_63_4(OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_carPlaySupportProvider);
  OUTLINED_FUNCTION_63_4(OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_offloadedAppInstaller);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_featureFlags);
}

@end
