@implementation BKAppStoreReviewManager

- (void)attemptToPresentStoreReviewIn:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  BKAppStoreReviewManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100069958(v6, a4);

}

- (BKAppStoreReviewManager)init
{
  return (BKAppStoreReviewManager *)AppStoreReviewManager.init()();
}

- (void)applicationDidForeground
{
  uint64_t v2;
  BKAppStoreReviewManager *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppStoreReviewManager_remoteConfig);
  v3 = self;
  if ((sub_10002903C(0xD00000000000001DLL, 0x80000001007B7580, v2) & 1) != 0)
    objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR___BKAppStoreReviewManager_sharedStoreReview), "applicationDidForeground");

}

- (void)userCustomizedReadingGolsWithNotification:(id)a3
{
  sub_100212A6C((char *)self, (uint64_t)a2, a3, 0xD00000000000002DLL, 0x80000001007B7600, (unsigned int *)&enum case for LocationType.postReadingGoalChange(_:));
}

- (void)userPurchasedContentWithNotification:(id)a3
{
  id v4;
  BKAppStoreReviewManager *v5;

  v4 = a3;
  v5 = self;
  sub_1002127C0(v4);

}

- (void)userDidRateContentWithNotification:(id)a3
{
  sub_100212A6C((char *)self, (uint64_t)a2, a3, 0xD000000000000021, 0x80000001007B75D0, (unsigned int *)&enum case for LocationType.postRatingAContent(_:));
}

- (void)userAddContentToWTRCollectionWithNotification:(id)a3
{
  sub_100212A6C((char *)self, (uint64_t)a2, a3, 0xD000000000000021, 0x80000001007B75A0, (unsigned int *)&enum case for LocationType.postWTR(_:));
}

- (void)userMarkedBookAsFinishedWithNotification:(id)a3
{
  id v4;
  BKAppStoreReviewManager *v5;

  v4 = a3;
  v5 = self;
  sub_100212B60(v4);

}

- (void).cxx_destruct
{

}

+ (void)cleanAppStoreReviewCache
{
  void *v0;
  id v1;
  NSString v2;
  id v3;
  NSString v4;
  id v5;
  id v6;

  v0 = (void *)objc_opt_self(NSUserDefaults);
  v1 = objc_msgSend(v0, "standardUserDefaults");
  v2 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "removeObjectForKey:", v2);

  v3 = objc_msgSend(v0, "standardUserDefaults");
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "removeObjectForKey:", v4);

  v5 = objc_msgSend(v0, "standardUserDefaults");
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

@end
