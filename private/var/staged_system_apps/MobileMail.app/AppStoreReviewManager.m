@implementation AppStoreReviewManager

- (_TtC10MobileMail21AppStoreReviewManager)initWithEligibilityTracker:(id)a3 requirementStorage:(id)a4 externalRequirementsProvider:(id)a5
{
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  return (_TtC10MobileMail21AppStoreReviewManager *)sub_1001F9380((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (_TtC10MobileMail21AppStoreReviewManager)initWithEligibilityTracker:(id)a3 requirementStorage:(id)a4
{
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  return (_TtC10MobileMail21AppStoreReviewManager *)sub_1001F95E4((uint64_t)a3, (uint64_t)a4);
}

- (void)attemptToShowPromptIn:(id)a3 reason:(int64_t)a4
{
  id v5;
  _TtC10MobileMail21AppStoreReviewManager *v6;

  v5 = a3;
  v6 = self;
  sub_1001F96F4(a3, a4);

}

- (void)notifyCriterionMet:(int64_t)a3
{
  _TtC10MobileMail21AppStoreReviewManager *v3;

  v3 = self;
  sub_1001FD2CC(a3);

}

- (void)didForeground
{
  _TtC10MobileMail21AppStoreReviewManager *v2;

  v2 = self;
  sub_1001FE4F4();

}

- (_TtC10MobileMail21AppStoreReviewManager)init
{
  return (_TtC10MobileMail21AppStoreReviewManager *)sub_1001FE588();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10MobileMail21AppStoreReviewManager_eligibilityTracker));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10MobileMail21AppStoreReviewManager_requirementStorage));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10MobileMail21AppStoreReviewManager_externalRequirementsProvider));

}

@end
