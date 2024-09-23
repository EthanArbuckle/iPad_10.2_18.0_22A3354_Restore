@implementation MCProvisioningProfileJanitor

- (MCProvisioningProfileJanitor)init
{
  MCProvisioningProfileJanitor *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  id v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  MDMProvisioningProfileTrust *v11;
  MDMProvisioningProfileTrust *profileTrust;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCProvisioningProfileJanitor;
  v2 = -[MCProvisioningProfileJanitor init](&v14, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("MCProvisioningProfileJanitor work queue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc((Class)MDMProvisioningProfileTrust);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("MIS Validate UPP queue", v9);
    v11 = (MDMProvisioningProfileTrust *)objc_msgSend(v7, "initWithValidationQueue:", v10);
    profileTrust = v2->_profileTrust;
    v2->_profileTrust = v11;

  }
  return v2;
}

+ (id)sharedJanitor
{
  if (qword_1000FD948 != -1)
    dispatch_once(&qword_1000FD948, &stru_1000E3EB0);
  return (id)qword_1000FD940;
}

- (void)updateMISTrust
{
  -[MCProvisioningProfileJanitor updateMISTrustAndValidateApps:validateManagedApps:completion:](self, "updateMISTrustAndValidateApps:validateManagedApps:completion:", 0, 1, 0);
}

- (void)updateMISTrustAndValidateApps:(id)a3 validateManagedApps:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-UpdateMISTrustValidateApps"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063790;
  block[3] = &unk_1000E3ED8;
  block[4] = self;
  v16 = v8;
  v19 = a4;
  v17 = v10;
  v18 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, block);

}

- (BOOL)_updateTrustedCodeSigningIdentitiesWithManagedAppSigners:(id)a3 outError:(id *)a4
{
  id v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v5 = a3;
  v6 = objc_opt_new(NSMutableDictionary);
  if (objc_msgSend(v5, "count"))
  {
    v7 = MCFeatureTrustedCodeSigningIdentities;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    -[NSMutableDictionary MCSetUnionRestriction:values:](v6, "MCSetUnionRestriction:values:", v7, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v10 = MCLocalizedFormat(CFSTR("MANAGED_CODE_SIGNING_IDS_CLIENT_TYPE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v16 = 0;
  LOBYTE(v15) = 0;
  objc_msgSend(v9, "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v6, 0, 0, 1, CFSTR("com.apple.profiled.managedcodesigningidentities"), CFSTR("com.apple.profiled.managedcodesigningidentities"), CFSTR("MCProvisioningProfileJanitor._updateTrustedCodeSigningIdentitiesWithManagedAppSigners"), v11, 0, v15, 0, 0, 0, &v16);
  v12 = v16;

  if (v12)
  {
    v13 = _MCLogObjects[11];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set managed code signing identities. Error: %{public}@", buf, 0xCu);
    }
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v12 == 0;
}

- (id)earliestRequiredManagedAppValidationDate
{
  void *v2;

  if (+[MDMProvisioningProfileTrust anyUPPExistsForManagedAppSigners](MDMProvisioningProfileTrust, "anyUPPExistsForManagedAppSigners"))v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  else
    v2 = 0;
  return v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (MDMProvisioningProfileTrust)profileTrust
{
  return self->_profileTrust;
}

- (void)setProfileTrust:(id)a3
{
  objc_storeStrong((id *)&self->_profileTrust, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileTrust, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
