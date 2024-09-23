@implementation RMHeadphoneActivityManager

+ (id)sharedInstance
{
  if (qword_10002C948 != -1)
    dispatch_once(&qword_10002C948, &stru_100024E88);
  return (id)qword_10002C940;
}

- (RMHeadphoneActivityManager)init
{
  RMHeadphoneActivityManager *v2;
  CMHeadphoneActivityManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMHeadphoneActivityManager;
  v2 = -[RMHeadphoneActivityManager init](&v5, "init");
  if (v2)
  {
    v3 = objc_opt_new(CMHeadphoneActivityManager);
    -[RMHeadphoneActivityManager setActivityManager:](v2, "setActivityManager:", v3);

  }
  return v2;
}

- (BOOL)mslLoggingEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneActivityManager activityManager](self, "activityManager"));
  v3 = objc_msgSend(v2, "mslLoggingEnabled");

  return v3;
}

- (void)startMslLogging
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = sub_1000146FC();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/HeadphoneActivity/MSL/"), v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneActivityManager activityManager](self, "activityManager"));
  objc_msgSend(v5, "startMslLoggingWithFilenamePrefix:filePath:", CFSTR("headphoneactivity"), v6);

}

- (void)stopMslLogging
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RMHeadphoneActivityManager activityManager](self, "activityManager"));
  objc_msgSend(v2, "stopMslLogging");

}

- (CMHeadphoneActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
