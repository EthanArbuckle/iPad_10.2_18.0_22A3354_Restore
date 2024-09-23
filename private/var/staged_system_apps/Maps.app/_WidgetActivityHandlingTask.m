@implementation _WidgetActivityHandlingTask

- (void)performTask
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSString *v8;
  NSString *widgetFamily;
  id v10;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  self->_analyticsAction = 9001;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appSessionController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentlyNavigatingPlatformController"));

  if (v5)
    v6 = 676;
  else
    v6 = 675;
  self->_analyticsTarget = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityHandlingTask userActivity](self, "userActivity"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", WGWidgetUserInfoKeyFamily));
  widgetFamily = self->_widgetFamily;
  self->_widgetFamily = v8;

  -[_WidgetActivityHandlingTask taskFailed](self, "taskFailed");
}

- (void)taskFinished:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_WidgetActivityHandlingTask;
  -[UserActivityHandlingTask taskFinished:](&v4, "taskFinished:", a3);
  -[_WidgetActivityHandlingTask _sendWidgetAnalytics](self, "_sendWidgetAnalytics");
}

- (void)taskFailed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WidgetActivityHandlingTask;
  -[RichMapsActivityCreatingTaskImpl taskFailed](&v3, "taskFailed");
  -[_WidgetActivityHandlingTask _sendWidgetAnalytics](self, "_sendWidgetAnalytics");
}

- (void)_sendWidgetAnalytics
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", self->_analyticsAction, self->_analyticsTarget, self->_widgetFamily);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetFamily, 0);
}

@end
