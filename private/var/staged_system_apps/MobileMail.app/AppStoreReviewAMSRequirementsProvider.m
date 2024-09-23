@implementation AppStoreReviewAMSRequirementsProvider

- (void)didForeground
{
  _TtC10MobileMail37AppStoreReviewAMSRequirementsProvider *v2;

  v2 = self;
  sub_1001F7818();

}

- (void)checkPromptAllowed:(id)a3
{
  _TtC10MobileMail37AppStoreReviewAMSRequirementsProvider *v4;
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v4 = self;
  v6 = swift_allocObject(&unk_100524B30, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  sub_1001F78A4((uint64_t)sub_1001F8BA4, v6);
  swift_release(v6);

}

- (void)didAttemptPrompt
{
  _TtC10MobileMail37AppStoreReviewAMSRequirementsProvider *v2;

  v2 = self;
  sub_1001F8BB0();

}

- (_TtC10MobileMail37AppStoreReviewAMSRequirementsProvider)init
{
  return (_TtC10MobileMail37AppStoreReviewAMSRequirementsProvider *)sub_1001F8C3C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37AppStoreReviewAMSRequirementsProvider_storeReview));
}

@end
