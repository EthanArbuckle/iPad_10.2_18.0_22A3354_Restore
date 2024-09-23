@implementation SBActivityCoverSheetObserver

- (SBActivityCoverSheetObserver)init
{
  SBActivityCoverSheetObserver *v2;
  uint64_t v3;
  CSActivityManager *activityManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityCoverSheetObserver;
  v2 = -[SBActivityCoverSheetObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1BB50], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    activityManager = v2->_activityManager;
    v2->_activityManager = (CSActivityManager *)v3;

  }
  return v2;
}

- (void)activityDidStart:(id)a3
{
  CSActivityManager *activityManager;
  id v4;

  activityManager = self->_activityManager;
  objc_msgSend(a3, "contentUpdate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager addActivityWithContentUpdate:](activityManager, "addActivityWithContentUpdate:", v4);

}

- (void)activityDidUpdate:(id)a3
{
  CSActivityManager *activityManager;
  id v4;

  activityManager = self->_activityManager;
  objc_msgSend(a3, "contentUpdate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager updateActivityWithContentUpdate:](activityManager, "updateActivityWithContentUpdate:", v4);

}

- (void)activityDidDismiss:(id)a3
{
  CSActivityManager *activityManager;
  id v4;

  activityManager = self->_activityManager;
  objc_msgSend(a3, "contentUpdate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager removeActivityWithContentUpdate:](activityManager, "removeActivityWithContentUpdate:", v4);

}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  char v9;

  if (!a3)
    return 0;
  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_105);

  +[SBLiveActivityDomain rootSettings](SBLiveActivityDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hideActivitiesInLockScreen");

  v9 = v6 & ~v8;
  return v9;
}

BOOL __57__SBActivityCoverSheetObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination") == 0;
}

- (void)activityWasBlocked:(id)a3
{
  CSActivityManager *activityManager;
  id v4;

  activityManager = self->_activityManager;
  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager setActivityHidden:forIdentifier:](activityManager, "setActivityHidden:forIdentifier:", 1, v4);

}

- (void)activityWasUnblocked:(id)a3
{
  CSActivityManager *activityManager;
  id v4;

  activityManager = self->_activityManager;
  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager setActivityHidden:forIdentifier:](activityManager, "setActivityHidden:forIdentifier:", 0, v4);

}

- (void)activityDidExceedReducedPushBudget:(id)a3
{
  CSActivityManager *activityManager;
  id v4;

  activityManager = self->_activityManager;
  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityManager handleActivityExceedingReducedPushBudgetForIdentifier:](activityManager, "handleActivityExceedingReducedPushBudgetForIdentifier:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
