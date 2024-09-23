@implementation FRUserNotificationResponseHandler

- (FRUserNotificationResponseHandler)initWithNavigator:(id)a3 feldsparContext:(id)a4 cloudContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  FRUserNotificationResponseHandler *v12;
  FRUserNotificationResponseHandler *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FRUserNotificationResponseHandler;
  v12 = -[FRUserNotificationResponseHandler init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_navigator, a3);
    objc_storeStrong((id *)&v13->_feldsparContext, a4);
    objc_storeStrong((id *)&v13->_cloudContext, a5);
  }

  return v13;
}

- (void)showArticleWithID:(id)a3 notificationID:(id)a4 channelID:(id)a5 title:(id)a6 forceArticleUpdate:(BOOL)a7 userActionDate:(id)a8
{
  id v13;
  id v14;
  void *v15;
  id v16;

  v13 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler _articleContextFromNotificationID:notificationSenderChannelID:title:userActionDate:](self, "_articleContextFromNotificationID:notificationSenderChannelID:title:userActionDate:", a4, a5, a6, a8));
  v14 = objc_msgSend(objc_alloc((Class)TSNewsActivityData), "initWithActivity:identifier:object:", 0, v13, v16);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler navigator](self, "navigator"));
  objc_msgSend(v15, "navigateWithActivityData:", v14);

}

- (void)saveArticleWithID:(id)a3 notificationID:(id)a4 sourceChannelID:(id)a5 isFreeArticle:(BOOL)a6 headline:(id)a7 userActionDate:(id)a8
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v9 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler feldsparContext](self, "feldsparContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cloudContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readingList"));
  objc_msgSend(v11, "addArticleToReadingList:eventInitiationLevel:origin:", v9, 1, 3);

}

- (void)showHeadline:(id)a3 notificationID:(id)a4 userActionDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceChannelID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  v17 = (id)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler _articleContextFromNotificationID:notificationSenderChannelID:title:userActionDate:](self, "_articleContextFromNotificationID:notificationSenderChannelID:title:userActionDate:", v9, v11, v12, v8));

  v13 = objc_alloc((Class)TSNewsActivityData);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "articleID"));

  v15 = objc_msgSend(v13, "initWithActivity:identifier:object:", 0, v14, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler navigator](self, "navigator"));
  objc_msgSend(v16, "navigateWithoutAnimationWithActivityData:", v15);

}

- (void)navigateToSpotlight
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler feldsparContext](self, "feldsparContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudContext"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appConfigurationManager"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appConfiguration"));
  v6 = objc_alloc((Class)TSNewsActivityData);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exploreArticleID"));
  v8 = objc_msgSend(v6, "initWithActivity:identifier:object:", 0, v7, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler navigator](self, "navigator"));
  objc_msgSend(v9, "navigateWithActivityData:", v8);

}

- (void)navigateToNotificationSettings
{
  void *v3;
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)TSNewsActivityData), "initWithActivity:identifier:", 8, CFSTR("notifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserNotificationResponseHandler navigator](self, "navigator"));
  objc_msgSend(v3, "navigateWithActivityData:", v4);

}

- (id)_articleContextFromNotificationID:(id)a3 notificationSenderChannelID:(id)a4 title:(id)a5 userActionDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  LOBYTE(v15) = 0;
  v13 = objc_msgSend(objc_alloc((Class)TSArticleContext), "initWithUrl:title:sourceApplication:previousArticleID:previousArticleVersion:adPreviewSessionID:adPreviewID:adQToken:maximumAdRequestsForCurrentAdPreviewID:userActionDate:presentationReason:notificationID:notificationSenderChannelID:referral:shouldAutoPlayVideo:", 0, v10, 0, 0, 0, 0, 0, 0, 0, v9, 13, v12, v11, 0, v15);

  return v13;
}

- (TSBridgedNewsActivityNavigator)navigator
{
  return self->_navigator;
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setFeldsparContext:(id)a3
{
  objc_storeStrong((id *)&self->_feldsparContext, a3);
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
  objc_storeStrong((id *)&self->_navigator, 0);
}

@end
