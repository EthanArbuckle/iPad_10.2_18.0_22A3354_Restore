@implementation ForegroundOnlyDataActivationPopupAssertion

- (ForegroundOnlyDataActivationPopupAssertion)init
{
  ForegroundOnlyDataActivationPopupAssertion *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  ForegroundOnlyDataActivationPopupAssertion *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ForegroundOnlyDataActivationPopupAssertion;
  v2 = -[DataActivationPopupAssertion initAndTakeAssertion:](&v10, "initAndTakeAssertion:", 0);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance"));
    objc_msgSend(v3, "startObserving");

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_willEnterForeground:", MKApplicationStateWillEnterForegroundNotification, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_didEnterBackground:", MKApplicationStateDidEnterBackgroundNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance"));
    v7 = objc_msgSend(v6, "isInBackground");

    if ((v7 & 1) == 0)
      -[DataActivationPopupAssertion _takeAssertion](v2, "_takeAssertion");
    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance"));
  objc_msgSend(v3, "stopObserving");

  v4.receiver = self;
  v4.super_class = (Class)ForegroundOnlyDataActivationPopupAssertion;
  -[DataActivationPopupAssertion dealloc](&v4, "dealloc");
}

- (void)_willEnterForeground:(id)a3
{
  if (self->super._active)
    -[DataActivationPopupAssertion _takeAssertion](self, "_takeAssertion", a3);
}

- (void)_didEnterBackground:(id)a3
{
  if (self->super._active)
    -[DataActivationPopupAssertion _releaseAssertion](self, "_releaseAssertion", a3);
}

@end
