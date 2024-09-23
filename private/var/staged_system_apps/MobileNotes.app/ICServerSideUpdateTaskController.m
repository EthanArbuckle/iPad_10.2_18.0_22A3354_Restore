@implementation ICServerSideUpdateTaskController

- (ICServerSideUpdateTaskController)initWithWorkerContext:(id)a3
{
  id v5;
  ICServerSideUpdateTaskController *v6;
  ICServerSideUpdateTaskController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICServerSideUpdateTaskController;
  v6 = -[ICServerSideUpdateTaskController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workerContext, a3);

  return v7;
}

- (ICCloudContext)cloudContext
{
  ICCloudContext *cloudContext;

  cloudContext = self->_cloudContext;
  if (cloudContext)
    return cloudContext;
  else
    return (ICCloudContext *)(id)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
}

- (void)runServerSideTasksIfNeeded:(id)a3
{
  id v4;
  dispatch_group_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_queue_global_t global_queue;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[5];
  NSObject *v21;

  v4 = a3;
  v5 = dispatch_group_create();
  if (-[ICServerSideUpdateTaskController isInternetReachable](self, "isInternetReachable"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController workerContext](self, "workerContext"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000817C8;
    v20[3] = &unk_10054FE80;
    v20[4] = self;
    v21 = v5;
    objc_msgSend(v6, "performBlockAndWait:", v20);

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100407E38(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  global_queue = dispatch_get_global_queue(-32768, 0);
  v16 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081AD4;
  block[3] = &unk_10054FFA8;
  v19 = v4;
  v17 = v4;
  dispatch_group_notify(v5, v16, block);

}

- (void)runServerSideTaskWithClient:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100407F0C(v9, self, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSideUpdateTaskLastCompletedBuild"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSideUpdateTaskLastCompletedVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController currentBuild](self, "currentBuild"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController currentVersion](self, "currentVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController platformName](self, "platformName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSideUpdateTaskContinuationToken"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100081CEC;
  v21[3] = &unk_100552280;
  v21[4] = self;
  v22 = v9;
  v23 = v8;
  v24 = v10;
  v18 = v10;
  v19 = v8;
  v20 = v9;
  objc_msgSend(v19, "didCompleteInstallOrUpdateWithPreviousBuildNumber:previousVersion:currentBuildNumber:currentVersion:platformName:continuationToken:callback:", v12, v13, v14, v15, v16, v17, v21);

}

- (void)resetState
{
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController workerContext](self, "workerContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100082244;
  v6[3] = &unk_100550110;
  v6[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Successfully reset state for all accounts", v5, 2u);
  }

}

- (id)accountsNeedingServerUpgrade
{
  void *v3;
  unsigned __int16 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  unsigned __int16 v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v4 = (unsigned __int16)objc_msgSend(v3, "serverSideUpdateTaskMaxFailureCount");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController workerContext](self, "workerContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", v5));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100082490;
  v9[3] = &unk_1005522A8;
  v10 = v4;
  v9[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_objectsPassingTest:", v9));

  return v7;
}

- (BOOL)isInternetReachable
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;

  if (-[ICServerSideUpdateTaskController overrideInternetReachabilityToNotReachable](self, "overrideInternetReachabilityToNotReachable"))
  {
    v2 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      sub_10040836C(v2, v3, v4, v5, v6, v7, v8, v9);

    return 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
    v10 = objc_msgSend(v11, "currentReachabilityStatus") != 0;

  }
  return v10;
}

- (id)invernessClientForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController overrideInvernessClient](self, "overrideInvernessClient"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController overrideInvernessClient](self, "overrideInvernessClient"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController cloudContext](self, "cloudContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "invernessClientForAccountID:", v8));

  }
  return v6;
}

- (id)currentVersion
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController overrideCurrentVersion](self, "overrideCurrentVersion"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController overrideCurrentVersion](self, "overrideCurrentVersion"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceSupport productVersion](ICDeviceSupport, "productVersion"));
  return v4;
}

- (id)currentBuild
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController overrideCurrentBuild](self, "overrideCurrentBuild"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICServerSideUpdateTaskController overrideCurrentBuild](self, "overrideCurrentBuild"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceSupport productBuildVersion](ICDeviceSupport, "productBuildVersion"));
  return v4;
}

- (id)platformName
{
  return +[ICDeviceSupport productName](ICDeviceSupport, "productName");
}

- (BOOL)overrideInternetReachabilityToNotReachable
{
  return self->_overrideInternetReachabilityToNotReachable;
}

- (void)setOverrideInternetReachabilityToNotReachable:(BOOL)a3
{
  self->_overrideInternetReachabilityToNotReachable = a3;
}

- (ICNotesInvernessClient)overrideInvernessClient
{
  return self->_overrideInvernessClient;
}

- (void)setOverrideInvernessClient:(id)a3
{
  objc_storeStrong((id *)&self->_overrideInvernessClient, a3);
}

- (NSString)overrideCurrentVersion
{
  return self->_overrideCurrentVersion;
}

- (void)setOverrideCurrentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)overrideCurrentBuild
{
  return self->_overrideCurrentBuild;
}

- (void)setOverrideCurrentBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerContext, a3);
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_overrideCurrentBuild, 0);
  objc_storeStrong((id *)&self->_overrideCurrentVersion, 0);
  objc_storeStrong((id *)&self->_overrideInvernessClient, 0);
}

@end
