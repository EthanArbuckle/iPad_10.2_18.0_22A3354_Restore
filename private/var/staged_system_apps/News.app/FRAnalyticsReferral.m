@implementation FRAnalyticsReferral

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_widgetModeGroupID, 0);
  objc_storeStrong((id *)&self->_referringURL, 0);
  objc_storeStrong((id *)&self->_referringApplication, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignID, 0);
  objc_storeStrong((id *)&self->_creativeID, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
}

- (FRAnalyticsReferral)initWithUserActivityType:(id)a3 creativeID:(id)a4 campaignID:(id)a5 campaignType:(id)a6 referringApplication:(id)a7 referringURL:(id)a8 appOpenedByUserActivity:(BOOL)a9 widgetModeGroupID:(id)a10 widgetEngagement:(id)a11 appSessionStartMethod:(int64_t)a12 appSessionStartNotificationType:(int64_t)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  FRAnalyticsReferral *v27;
  NSString *v28;
  NSString *userActivityType;
  NSString *v30;
  NSString *creativeID;
  NSString *v32;
  NSString *campaignID;
  NSString *v34;
  NSString *campaignType;
  NSString *v36;
  NSString *referringApplication;
  NSString *v38;
  NSString *referringURL;
  NSString *v40;
  NSString *widgetModeGroupID;
  NTPBWidgetEngagement *v42;
  NTPBWidgetEngagement *widgetEngagement;
  objc_super v45;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a10;
  v26 = a11;
  v45.receiver = self;
  v45.super_class = (Class)FRAnalyticsReferral;
  v27 = -[FRAnalyticsReferral init](&v45, "init");
  if (v27)
  {
    v28 = (NSString *)objc_msgSend(v19, "copy");
    userActivityType = v27->_userActivityType;
    v27->_userActivityType = v28;

    v30 = (NSString *)objc_msgSend(v20, "copy");
    creativeID = v27->_creativeID;
    v27->_creativeID = v30;

    v32 = (NSString *)objc_msgSend(v21, "copy");
    campaignID = v27->_campaignID;
    v27->_campaignID = v32;

    v34 = (NSString *)objc_msgSend(v22, "copy");
    campaignType = v27->_campaignType;
    v27->_campaignType = v34;

    v36 = (NSString *)objc_msgSend(v23, "copy");
    referringApplication = v27->_referringApplication;
    v27->_referringApplication = v36;

    v38 = (NSString *)objc_msgSend(v24, "copy");
    referringURL = v27->_referringURL;
    v27->_referringURL = v38;

    v27->_appOpenedByUserActivity = a9;
    v40 = (NSString *)objc_msgSend(v25, "copy");
    widgetModeGroupID = v27->_widgetModeGroupID;
    v27->_widgetModeGroupID = v40;

    v42 = (NTPBWidgetEngagement *)objc_msgSend(v26, "copy");
    widgetEngagement = v27->_widgetEngagement;
    v27->_widgetEngagement = v42;

    v27->_appSessionStartMethod = a12;
    v27->_appSessionNotificationType = a13;
  }

  return v27;
}

- (NSString)referringURL
{
  return self->_referringURL;
}

- (NSString)referringApplication
{
  return self->_referringApplication;
}

- (FRAnalyticsReferral)initWithAppSessionStartFromNotificationType:(int64_t)a3
{
  FRAnalyticsReferral *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRAnalyticsReferral;
  result = -[FRAnalyticsReferral init](&v5, "init");
  if (result)
  {
    result->_appSessionStartMethod = 3;
    result->_appSessionNotificationType = a3;
  }
  return result;
}

- (FRAnalyticsReferral)initWithAppSessionStartMethod:(int64_t)a3
{
  FRAnalyticsReferral *v4;
  FRAnalyticsReferral *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FRAnalyticsReferral;
  v4 = -[FRAnalyticsReferral init](&v7, "init");
  v5 = v4;
  if (v4)
    -[FRAnalyticsReferral setAppSessionStartMethod:](v4, "setAppSessionStartMethod:", a3);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FRAnalyticsReferral *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = -[FRAnalyticsReferral init](+[FRAnalyticsReferral allocWithZone:](FRAnalyticsReferral, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral userActivityType](self, "userActivityType"));
  -[FRAnalyticsReferral setUserActivityType:](v4, "setUserActivityType:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral creativeID](self, "creativeID"));
  -[FRAnalyticsReferral setCreativeID:](v4, "setCreativeID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral campaignID](self, "campaignID"));
  -[FRAnalyticsReferral setCampaignID:](v4, "setCampaignID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral campaignType](self, "campaignType"));
  -[FRAnalyticsReferral setCampaignType:](v4, "setCampaignType:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral referringApplication](self, "referringApplication"));
  -[FRAnalyticsReferral setReferringApplication:](v4, "setReferringApplication:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral referringURL](self, "referringURL"));
  -[FRAnalyticsReferral setReferringURL:](v4, "setReferringURL:", v10);

  -[FRAnalyticsReferral setAppOpenedByUserActivity:](v4, "setAppOpenedByUserActivity:", -[FRAnalyticsReferral appOpenedByUserActivity](self, "appOpenedByUserActivity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral widgetModeGroupID](self, "widgetModeGroupID"));
  -[FRAnalyticsReferral setWidgetModeGroupID:](v4, "setWidgetModeGroupID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRAnalyticsReferral widgetEngagement](self, "widgetEngagement"));
  -[FRAnalyticsReferral setWidgetEngagement:](v4, "setWidgetEngagement:", v12);

  -[FRAnalyticsReferral setAppSessionStartMethod:](v4, "setAppSessionStartMethod:", -[FRAnalyticsReferral appSessionStartMethod](self, "appSessionStartMethod"));
  return v4;
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)creativeID
{
  return self->_creativeID;
}

- (void)setCreativeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)campaignID
{
  return self->_campaignID;
}

- (void)setCampaignID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setReferringApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setReferringURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)widgetModeGroupID
{
  return self->_widgetModeGroupID;
}

- (void)setWidgetModeGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)appOpenedByUserActivity
{
  return self->_appOpenedByUserActivity;
}

- (void)setAppOpenedByUserActivity:(BOOL)a3
{
  self->_appOpenedByUserActivity = a3;
}

- (int64_t)appSessionStartMethod
{
  return self->_appSessionStartMethod;
}

- (void)setAppSessionStartMethod:(int64_t)a3
{
  self->_appSessionStartMethod = a3;
}

- (int64_t)appSessionNotificationType
{
  return self->_appSessionNotificationType;
}

- (void)setAppSessionNotificationType:(int64_t)a3
{
  self->_appSessionNotificationType = a3;
}

@end
