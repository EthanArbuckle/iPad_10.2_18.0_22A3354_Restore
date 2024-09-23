@implementation MCProfileDaemonManagedConfigurationHelper

- (void)removeProfileWithIdentifier:(id)a3 async:(BOOL)a4
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  if (a3)
  {
    v5 = a3;
    v6 = dispatch_semaphore_create(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100091B0C;
    v9[3] = &unk_1000E3500;
    v8 = v6;
    v10 = v8;
    objc_msgSend(v7, "removeProfileWithIdentifier:installationType:source:completion:", v5, 1, CFSTR("com.apple.managedconfiguration.profiled"), v9);

    if (!a4)
      dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

  }
}

- (void)removeApplicationWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMFConnection currentUserConnection](DMFConnection, "currentUserConnection"));
  v8 = (void *)objc_opt_new(DMFRemoveAppRequest);
  objc_msgSend(v8, "setBundleIdentifier:", v5);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100091BEC;
  v11[3] = &unk_1000E4588;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "performRequest:completion:", v8, v11);

}

@end
