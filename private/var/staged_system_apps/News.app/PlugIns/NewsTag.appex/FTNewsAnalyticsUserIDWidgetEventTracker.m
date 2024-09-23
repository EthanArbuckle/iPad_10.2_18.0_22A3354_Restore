@implementation FTNewsAnalyticsUserIDWidgetEventTracker

- (FTNewsAnalyticsUserIDWidgetEventTracker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTNewsAnalyticsUserIDWidgetEventTracker;
  return -[FTNewsAnalyticsUserIDWidgetEventTracker init](&v3, "init");
}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "userID", a3, a6));
  -[FTNewsAnalyticsUserIDWidgetEventTracker setUserID:](self, "setUserID:", v7);

}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
