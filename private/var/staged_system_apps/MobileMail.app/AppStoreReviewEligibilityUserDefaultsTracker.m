@implementation AppStoreReviewEligibilityUserDefaultsTracker

- (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker)initWithUserDefaults:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *)sub_1001F3610(a3);
}

- (int64_t)countOf:(int64_t)a3
{
  _TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *v3;
  int64_t v7;

  v3 = self;
  v7 = sub_1001F42F8(a3);

  return v7;
}

- (void)incrementCountOf:(int64_t)a3
{
  _TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *v3;

  v3 = self;
  sub_1001F4D20(a3);

}

- (void)resetCounts
{
  _TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *v2;

  v2 = self;
  sub_1001F4E80();

}

- (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker)init
{
  return (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *)sub_1001F59BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker_userDefaults));
  sub_1001ED890((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker_criteriaCounts));
}

@end
