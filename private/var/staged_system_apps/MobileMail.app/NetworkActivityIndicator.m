@implementation NetworkActivityIndicator

- (NetworkActivityIndicator)init
{
  NetworkActivityIndicator *v2;
  NetworkActivityIndicator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NetworkActivityIndicator;
  v2 = -[NetworkActivityIndicator init](&v5, "init");
  v3 = v2;
  if (v2)
    pthread_mutex_init(&v2->_activityLock, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_activityLock);
  v3.receiver = self;
  v3.super_class = (Class)NetworkActivityIndicator;
  -[NetworkActivityIndicator dealloc](&v3, "dealloc");
}

- (void)networkActivityStarted:(id)a3
{
  id v4;
  NSMutableSet *networkMonitors;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  pthread_mutex_lock(&self->_activityLock);
  v4 = -[NSMutableSet count](self->_networkMonitors, "count");
  if (v10)
  {
    networkMonitors = self->_networkMonitors;
    if (!networkMonitors)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v7 = self->_networkMonitors;
      self->_networkMonitors = v6;

      networkMonitors = self->_networkMonitors;
    }
    -[NSMutableSet addObject:](networkMonitors, "addObject:", v10);
  }
  v8 = -[NSMutableSet count](self->_networkMonitors, "count");
  pthread_mutex_unlock(&self->_activityLock);
  if ((v4 == 0) == (v8 != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8 != 0));
    -[NetworkActivityIndicator setStatusBarShowsMailProgress:](self, "setStatusBarShowsMailProgress:", v9);

  }
}

- (void)networkActivityEnded:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  pthread_mutex_lock(&self->_activityLock);
  v4 = -[NSMutableSet count](self->_networkMonitors, "count");
  if (v7)
    -[NSMutableSet removeObject:](self->_networkMonitors, "removeObject:", v7);
  v5 = -[NSMutableSet count](self->_networkMonitors, "count");
  pthread_mutex_unlock(&self->_activityLock);
  if ((v4 == 0) == (v5 != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5 != 0));
    -[NetworkActivityIndicator setStatusBarShowsMailProgress:](self, "setStatusBarShowsMailProgress:", v6);

  }
}

- (void)setStatusBarShowsProgress:(BOOL)a3
{
  if (byte_1005AA4D0 != a3)
  {
    byte_1005AA4D0 = a3;
    objc_msgSend(UIApp, "setStatusBarShowsProgress:");
  }
}

- (void)setStatusBarShowsMailProgress:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  id v11;

  v11 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (objc_msgSend(v11, "BOOLValue"))
    {
      v5 = qword_1005AA4D8;
      if (*(double *)&qword_1005AA4D8 == 0.0)
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate", *(double *)&qword_1005AA4D8);
        qword_1005AA4D8 = v5;
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_hideStatusBarProgress", 0, *(double *)&v5);
      -[NetworkActivityIndicator setStatusBarShowsProgress:](self, "setStatusBarShowsProgress:", 1);
    }
    else
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v7 = v6 - *(double *)&qword_1005AA4D8;
      v8 = 1.0 - v7;
      v9 = v7 < 1.0;
      v10 = 0.200000003;
      if (v9)
        v10 = v8;
      -[NetworkActivityIndicator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_hideStatusBarProgress", 0, v10);
    }
  }
  else
  {
    -[NetworkActivityIndicator performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v11, 0);
  }

}

- (void)_hideStatusBarProgress
{
  id v2;

  -[NetworkActivityIndicator setStatusBarShowsProgress:](self, "setStatusBarShowsProgress:", 0);
  qword_1005AA4D8 = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", MailApplicationStatusBarProgressDidHideNotification, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitors, 0);
}

@end
