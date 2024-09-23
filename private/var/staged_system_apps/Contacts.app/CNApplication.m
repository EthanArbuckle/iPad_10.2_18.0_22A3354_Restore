@implementation CNApplication

- (id)_extendLaunchTest
{
  -[CNApplication checkInLaunchTasks:](self, "checkInLaunchTasks:", 1);
  return CFSTR("contactsExtendedLaunch");
}

- (void)checkInLaunchTasks:(unint64_t)a3
{
  int *p_launchTaskCompletionMask;
  unsigned int v5;
  BOOL *p_extendedLaunchFinished;
  unsigned __int8 v7;
  id v8;

  p_launchTaskCompletionMask = &self->_launchTaskCompletionMask;
  do
    v5 = __ldaxr((unsigned int *)p_launchTaskCompletionMask);
  while (__stlxr(v5 | a3, (unsigned int *)p_launchTaskCompletionMask));
  if (-[CNApplication areAllLaunchTasksComplete](self, "areAllLaunchTasksComplete"))
  {
    p_extendedLaunchFinished = &self->_extendedLaunchFinished;
    do
      v7 = __ldaxr((unsigned __int8 *)p_extendedLaunchFinished);
    while (__stlxr(1u, (unsigned __int8 *)p_extendedLaunchFinished));
    if ((v7 & 1) == 0)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[CNApplication _launchTestName](self, "_launchTestName"));
      -[CNApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", v8, 0);

    }
  }
}

- (BOOL)areAllLaunchTasksComplete
{
  unsigned int v2;

  v2 = atomic_load((unsigned int *)&self->_launchTaskCompletionMask);
  return v2 == 63;
}

- (CNApplication)init
{
  CNApplication *v2;
  void *v3;
  CNApplication *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNApplication;
  v2 = -[CNApplication init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment"));
    objc_msgSend(v3, "setLaunchCheckinRegistrar:", v2);
    v4 = v2;

  }
  return v2;
}

+ (void)prewarmResourcesForLaunch
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  kdebug_trace(725483524, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ContactsSplitViewController prewarmContactStoreDataSourceBlock](ContactsSplitViewController, "prewarmContactStoreDataSourceBlock"));
  v3 = objc_claimAutoreleasedReturnValue(+[ContactsSplitViewController resourcesPrewarmingQueue](ContactsSplitViewController, "resourcesPrewarmingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004874;
  block[3] = &unk_10001C5C0;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

- (BOOL)openURL:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("tel"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v8 = objc_msgSend(v7, "openSensitiveURL:withOptions:", v4, 0);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNApplication;
    v8 = -[CNApplication openURL:](&v10, "openURL:", v4);
  }

  return v8;
}

@end
