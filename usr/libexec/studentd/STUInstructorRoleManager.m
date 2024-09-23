@implementation STUInstructorRoleManager

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUInstructorRoleManager launchServicesPrimitives](self, "launchServicesPrimitives"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STUInstructorRoleManager;
  -[STUInstructorRoleManager dealloc](&v4, "dealloc");
}

- (STUInstructorRoleManager)initWithLSPrimitives:(id)a3 featureDataStore:(id)a4
{
  id v7;
  id v8;
  STUInstructorRoleManager *v9;
  STUInstructorRoleManager *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STUInstructorRoleManager;
  v9 = -[STUInstructorRoleManager init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureDataStore, a4);
    objc_storeStrong((id *)&v10->_launchServicesPrimitives, a3);
    -[STUInstructorRoleManager updateInstructorRoleEnabledState](v10, "updateInstructorRoleEnabledState");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUInstructorRoleManager launchServicesPrimitives](v10, "launchServicesPrimitives"));
    objc_msgSend(v11, "addObserver:", v10);

  }
  return v10;
}

- (void)updateInstructorRoleEnabledState
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  unsigned __int8 v7;

  v3 = +[CRKClassroomInstallation anyInstallationExists](CRKClassroomInstallation, "anyInstallationExists");
  v4 = sub_1000639A0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D28C;
  v6[3] = &unk_1000C9B70;
  v6[4] = self;
  v7 = v3;
  dispatch_async(v5, v6);

}

- (BOOL)proxiesContainClassroomApp:(id)a3
{
  return objc_msgSend(a3, "crk_containsObjectMatchingPredicate:", &stru_1000C9BB0);
}

- (void)applicationsDidInstall:(id)a3
{
  if (-[STUInstructorRoleManager proxiesContainClassroomApp:](self, "proxiesContainClassroomApp:", a3))
    -[STUInstructorRoleManager updateInstructorRoleEnabledState](self, "updateInstructorRoleEnabledState");
}

- (void)applicationsDidUninstall:(id)a3
{
  if (-[STUInstructorRoleManager proxiesContainClassroomApp:](self, "proxiesContainClassroomApp:", a3))
    -[STUInstructorRoleManager updateInstructorRoleEnabledState](self, "updateInstructorRoleEnabledState");
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (STULSPrimitives)launchServicesPrimitives
{
  return self->_launchServicesPrimitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchServicesPrimitives, 0);
  objc_storeStrong((id *)&self->_featureDataStore, 0);
}

@end
