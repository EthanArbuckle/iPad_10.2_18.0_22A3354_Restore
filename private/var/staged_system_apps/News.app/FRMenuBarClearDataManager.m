@implementation FRMenuBarClearDataManager

- (FRMenuBarClearDataManager)initWithAccount:(id)a3 clearReadingHistoryManager:(id)a4 personalizationData:(id)a5 analyticsController:(id)a6 newsletterManager:(id)a7 userEventHistoryStorage:(id)a8 userActivityManager:(id)a9 clearableUserEmbedding:(id)a10
{
  id v17;
  FRMenuBarClearDataManager *v18;
  FRMenuBarClearDataManager *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)FRMenuBarClearDataManager;
  v18 = -[FRMenuBarClearDataManager init](&v28, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_clearReadingHistoryManager, a4);
    objc_storeStrong((id *)&v19->_personalizationData, a5);
    objc_storeStrong((id *)&v19->_analyticsController, a6);
    objc_storeStrong((id *)&v19->_newsletterManager, a7);
    objc_storeStrong((id *)&v19->_userEventHistoryStorage, a8);
    objc_storeStrong((id *)&v19->_userActivityManager, a9);
    objc_storeStrong((id *)&v19->_clearableUserEmbedding, a10);
  }

  return v19;
}

- (BOOL)isSyncingEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager account](self, "account"));
  v3 = objc_msgSend(v2, "isPrivateDataSyncingEnabled");

  return v3;
}

- (void)clearAllData
{
  id v3;

  -[FRMenuBarClearDataManager clearHistory](self, "clearHistory");
  -[FRMenuBarClearDataManager clearRecommendations](self, "clearRecommendations");
  -[FRMenuBarClearDataManager resetIdentifier](self, "resetIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager userActivityManager](self, "userActivityManager"));
  objc_msgSend(v3, "clearAllSavedUserActivities");

}

- (void)clearHistory
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager clearReadingHistoryManager](self, "clearReadingHistoryManager"));
  objc_msgSend(v3, "clearHistory");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager userActivityManager](self, "userActivityManager"));
  objc_msgSend(v4, "clearAllSavedUserActivities");

}

- (void)clearRecommendations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager personalizationData](self, "personalizationData"));
  objc_msgSend(v3, "clearPersonalizationData");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager userEventHistoryStorage](self, "userEventHistoryStorage"));
  objc_msgSend(v4, "clearHistory");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager clearableUserEmbedding](self, "clearableUserEmbedding"));
  objc_msgSend(v5, "clearHistory");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager newsletterManager](self, "newsletterManager"));
  objc_msgSend(v6, "deletePersonalizationVector");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager userActivityManager](self, "userActivityManager"));
  objc_msgSend(v7, "clearAllSavedUserActivities");

}

- (void)resetIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager analyticsController](self, "analyticsController"));
  objc_msgSend(v7, "endSessionForReason:byStartingNewSession:resetUserID:forSceneID:", 1, 1, 1, v9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRMenuBarClearDataManager userActivityManager](self, "userActivityManager"));
  objc_msgSend(v8, "clearAllSavedUserActivities");

}

- (FCAppleAccount)account
{
  return self->_account;
}

- (FCClearableReadingHistory)clearReadingHistoryManager
{
  return self->_clearReadingHistoryManager;
}

- (FCPersonalizationData)personalizationData
{
  return self->_personalizationData;
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (FCNewsletterManager)newsletterManager
{
  return self->_newsletterManager;
}

- (FCUserEventHistoryStorageType)userEventHistoryStorage
{
  return self->_userEventHistoryStorage;
}

- (TSNewsActivityManagerType)userActivityManager
{
  return self->_userActivityManager;
}

- (FCClearableUserEmbedding)clearableUserEmbedding
{
  return self->_clearableUserEmbedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearableUserEmbedding, 0);
  objc_storeStrong((id *)&self->_userActivityManager, 0);
  objc_storeStrong((id *)&self->_userEventHistoryStorage, 0);
  objc_storeStrong((id *)&self->_newsletterManager, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_personalizationData, 0);
  objc_storeStrong((id *)&self->_clearReadingHistoryManager, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
