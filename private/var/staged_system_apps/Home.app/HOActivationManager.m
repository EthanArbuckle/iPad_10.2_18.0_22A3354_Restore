@implementation HOActivationManager

- (HOActivationManager)init
{
  HOActivationManager *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HOActivationManager;
  v2 = -[HOActivationManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[HOActivationManager setLastEnteredForegroundDate:](v2, "setLastEnteredForegroundDate:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_enteredForeground:", UIApplicationWillEnterForegroundNotification, 0);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1000D2808 != -1)
    dispatch_once(&qword_1000D2808, &stru_1000B7AE8);
  return (id)qword_1000D2810;
}

- (void)setLastEnteredForegroundDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastEnteredForegroundDate, a3);
}

- (void)_enteredForeground:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  -[HOActivationManager setLastEnteredForegroundDate:](self, "setLastEnteredForegroundDate:", v4);

}

- (NSDate)lastEnteredForegroundDate
{
  return self->_lastEnteredForegroundDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEnteredForegroundDate, 0);
}

@end
