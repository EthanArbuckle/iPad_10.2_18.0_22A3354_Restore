@implementation MapsAppTestMultitaskResizeWindow

- (MapsAppTestMultitaskResizeWindow)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestMultitaskResizeWindow *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MapsAppTestMultitaskResizeWindow;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v13, "initWithApplication:testName:options:", a3, a4, v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeoutInSeconds")));
    v9->_timeoutInSeconds = (int64_t)objc_msgSend(v10, "integerValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfResizes")));
    v9->_numberOfResizes = (int64_t)objc_msgSend(v11, "integerValue");

  }
  return v9;
}

- (BOOL)runTest
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[3];
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;

  -[MapsAppTest startedTest](self, "startedTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v15 = CFSTR("com.apple.AppStore");
  v4 = SBSOpenApplicationOptionKeyLayoutRole;
  v13 = SBSOpenApplicationOptionKeyLayoutRole;
  v14 = SBSOpenApplicationLayoutRoleSideNarrow;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v16 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  v11[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v11[1] = v4;
  v12[0] = &__kCFBooleanTrue;
  v12[1] = SBSOpenApplicationLayoutRolePrimary;
  v11[2] = SBSOpenApplicationOptionKeyAdditionalApplications;
  v12[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v7));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AC4794;
  v10[3] = &unk_1011E1BC8;
  v10[4] = self;
  objc_msgSend(v3, "openApplication:withOptions:completion:", CFSTR("com.apple.Maps"), v8, v10);

  return 1;
}

@end
