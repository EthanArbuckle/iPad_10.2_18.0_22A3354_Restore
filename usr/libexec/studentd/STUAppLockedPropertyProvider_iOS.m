@implementation STUAppLockedPropertyProvider_iOS

- (STUAppLockedPropertyProvider_iOS)init
{
  STUAppLockedPropertyProvider_iOS *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUAppLockedPropertyProvider_iOS;
  v2 = -[STUAppLockedPropertyProvider init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "didApplyAppLock:", CFSTR("STUDidApplyAppLockNotificationName"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "didRemoveAppLock:", CFSTR("STUDidRemoveAppLockNotificationName"), 0);

  }
  return v2;
}

- (void)didApplyAppLock:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockedPropertyProvider_iOS.m"), 39, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[STUAppLockedPropertyProvider setAppLocked:](self, "setAppLocked:", 1);
}

- (void)didRemoveAppLock:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLockedPropertyProvider_iOS.m"), 44, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[STUAppLockedPropertyProvider setAppLocked:](self, "setAppLocked:", 0);
}

@end
