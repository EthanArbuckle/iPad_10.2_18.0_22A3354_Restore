@implementation STUConfigurationManager

- (void)dealloc
{
  objc_super v3;

  -[STUASMCourseLibrary removeObserver:forKeyPath:context:](self->_ASMCourseLibrary, "removeObserver:forKeyPath:context:", self, CFSTR("enrollmentRecords"), CFSTR("ObservationContext"));
  -[STUASMCourseLibrary removeObserver:forKeyPath:context:](self->_ASMCourseLibrary, "removeObserver:forKeyPath:context:", self, CFSTR("signedInToStudentMAID"), CFSTR("ObservationContext"));
  -[CRKUserProviding removeObserver:forKeyPath:context:](self->_meCardUserProvider, "removeObserver:forKeyPath:context:", self, CFSTR("user"), CFSTR("ObservationContext"));
  v3.receiver = self;
  v3.super_class = (Class)STUConfigurationManager;
  -[STUConfigurationManager dealloc](&v3, "dealloc");
}

- (STUConfigurationManager)init
{
  return -[STUConfigurationManager initWithASMCourseLibrary:featureDataStore:mobileKeyBagPrimitives:](self, "initWithASMCourseLibrary:featureDataStore:mobileKeyBagPrimitives:", 0, 0, 0);
}

- (STUConfigurationManager)initWithASMCourseLibrary:(id)a3 featureDataStore:(id)a4 mobileKeyBagPrimitives:(id)a5
{
  return -[STUConfigurationManager initWithSystemDataStore:userDataStore:userImageStore:ASMCourseLibrary:featureDataStore:mobileKeyBagPrimitives:](self, "initWithSystemDataStore:userDataStore:userImageStore:ASMCourseLibrary:featureDataStore:mobileKeyBagPrimitives:", 0, 0, 0, a3, a4, a5);
}

- (STUConfigurationManager)initWithSystemDataStore:(id)a3 userDataStore:(id)a4 userImageStore:(id)a5 ASMCourseLibrary:(id)a6 featureDataStore:(id)a7 mobileKeyBagPrimitives:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  STUConfigurationManager *v20;
  void *v21;
  uint64_t v22;
  CRKFeatureFlags *featureFlags;
  STUConfigurationDataStoreProtocol *v24;
  STUConfigurationDataStoreProtocol *systemDataStore;
  STUFileBackedDirectoryDataStore *v26;
  STUFileBackedDirectoryDataStore *v27;
  STUConfigurationDataStoreProtocol *v28;
  STUConfigurationDataStoreProtocol *v29;
  STUConfigurationDataStoreProtocol *userDataStore;
  STUFileBackedDirectoryDataStore *v31;
  STUFileBackedDirectoryDataStore *v32;
  STUConfigurationDataStoreProtocol *v33;
  CRKKeyedDataStoreProtocol *v34;
  CRKKeyedDataStoreProtocol *userImageStore;
  id v36;
  CRKKeyedDataStoreProtocol *v37;
  CRKKeyedDataStoreProtocol *v38;
  CRKFeatureDataStoreProtocol *v39;
  CRKFeatureDataStoreProtocol *featureDataStore;
  uint64_t v41;
  CRKFeatureDataStoreProtocol *v42;
  uint64_t v43;
  CRKUserProviding *meCardUserProvider;
  void *v45;
  NSCache *v46;
  NSCache *credentialCache;
  CNContactStore *v48;
  CNContactStore *contactStore;
  void *v50;
  STUMobileKeyBagPrimitives *mobileKeyBagPrimitives;
  uint64_t v52;
  CRKCancelable *firstUnlockSubscription;
  id v55;
  _QWORD v56[4];
  id v57;
  id location;
  objc_super v59;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v59.receiver = self;
  v59.super_class = (Class)STUConfigurationManager;
  v20 = -[STUConfigurationManager init](&v59, "init");
  if (v20)
  {
    v55 = v17;
    v21 = (void *)objc_opt_new(CRKFeatureFlagsFactory);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "makeFeatureFlags"));
    featureFlags = v20->_featureFlags;
    v20->_featureFlags = (CRKFeatureFlags *)v22;

    if (v14)
    {
      v24 = (STUConfigurationDataStoreProtocol *)v14;
      systemDataStore = v20->_systemDataStore;
      v20->_systemDataStore = v24;
    }
    else
    {
      v26 = [STUFileBackedDirectoryDataStore alloc];
      systemDataStore = (STUConfigurationDataStoreProtocol *)objc_claimAutoreleasedReturnValue(+[NSFileManager systemDataStoreDirectoryURL](NSFileManager, "systemDataStoreDirectoryURL"));
      v27 = -[STUFileBackedDirectoryDataStore initWithBaseURL:](v26, "initWithBaseURL:", systemDataStore);
      v28 = v20->_systemDataStore;
      v20->_systemDataStore = (STUConfigurationDataStoreProtocol *)v27;

    }
    if (v15)
    {
      v29 = (STUConfigurationDataStoreProtocol *)v15;
      userDataStore = v20->_userDataStore;
      v20->_userDataStore = v29;
    }
    else
    {
      v31 = [STUFileBackedDirectoryDataStore alloc];
      userDataStore = (STUConfigurationDataStoreProtocol *)objc_claimAutoreleasedReturnValue(+[NSFileManager studentdLibraryURL](NSFileManager, "studentdLibraryURL"));
      v32 = -[STUFileBackedDirectoryDataStore initWithBaseURL:](v31, "initWithBaseURL:", userDataStore);
      v33 = v20->_userDataStore;
      v20->_userDataStore = (STUConfigurationDataStoreProtocol *)v32;

    }
    if (v16)
    {
      v34 = (CRKKeyedDataStoreProtocol *)v16;
      userImageStore = v20->_userImageStore;
      v20->_userImageStore = v34;
    }
    else
    {
      v36 = objc_alloc((Class)CRKFileBasedKeyedDataStore);
      userImageStore = (CRKKeyedDataStoreProtocol *)objc_claimAutoreleasedReturnValue(+[NSFileManager userImagesDirectoryURL](NSFileManager, "userImagesDirectoryURL"));
      v37 = (CRKKeyedDataStoreProtocol *)objc_msgSend(v36, "initWithDirectoryURL:", userImageStore);
      v38 = v20->_userImageStore;
      v20->_userImageStore = v37;

    }
    if (v18)
    {
      v39 = (CRKFeatureDataStoreProtocol *)v18;
      featureDataStore = v20->_featureDataStore;
      v20->_featureDataStore = v39;
    }
    else
    {
      featureDataStore = (CRKFeatureDataStoreProtocol *)objc_opt_new(CRKFeatureDataStoreProvider);
      v41 = objc_claimAutoreleasedReturnValue(-[CRKFeatureDataStoreProtocol makeFeatureDataStore](featureDataStore, "makeFeatureDataStore"));
      v42 = v20->_featureDataStore;
      v20->_featureDataStore = (CRKFeatureDataStoreProtocol *)v41;

    }
    objc_storeStrong((id *)&v20->_mobileKeyBagPrimitives, a8);
    v43 = objc_claimAutoreleasedReturnValue(+[CRKUser stu_sharedMeCardUserProvider](CRKUser, "stu_sharedMeCardUserProvider"));
    meCardUserProvider = v20->_meCardUserProvider;
    v20->_meCardUserProvider = (CRKUserProviding *)v43;

    -[STUConfigurationManager deleteOldCloudDirectory](v20, "deleteOldCloudDirectory");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v45, "removeObjectForKey:", CFSTR("STUPreviouslyCloudEnrolled"));

    v46 = (NSCache *)objc_alloc_init((Class)NSCache);
    credentialCache = v20->_credentialCache;
    v20->_credentialCache = v46;

    v48 = objc_opt_new(CNContactStore);
    contactStore = v20->_contactStore;
    v20->_contactStore = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v50, "addObserver:selector:name:object:", v20, "updateEffectiveConfiguration", NSSystemClockDidChangeNotification, 0);

    objc_storeStrong((id *)&v20->_ASMCourseLibrary, a6);
    -[STUASMCourseLibrary addObserver:forKeyPath:options:context:](v20->_ASMCourseLibrary, "addObserver:forKeyPath:options:context:", v20, CFSTR("enrollmentRecords"), 0, CFSTR("ObservationContext"));
    -[STUASMCourseLibrary addObserver:forKeyPath:options:context:](v20->_ASMCourseLibrary, "addObserver:forKeyPath:options:context:", v20, CFSTR("signedInToStudentMAID"), 0, CFSTR("ObservationContext"));
    -[CRKUserProviding addObserver:forKeyPath:options:context:](v20->_meCardUserProvider, "addObserver:forKeyPath:options:context:", v20, CFSTR("user"), 0, CFSTR("ObservationContext"));
    objc_initWeak(&location, v20);
    mobileKeyBagPrimitives = v20->_mobileKeyBagPrimitives;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10006B814;
    v56[3] = &unk_1000C9F38;
    objc_copyWeak(&v57, &location);
    v52 = objc_claimAutoreleasedReturnValue(-[STUMobileKeyBagPrimitives subscribeToFirstUnlockNotificationsWithHandler:](mobileKeyBagPrimitives, "subscribeToFirstUnlockNotificationsWithHandler:", v56));
    firstUnlockSubscription = v20->_firstUnlockSubscription;
    v20->_firstUnlockSubscription = (CRKCancelable *)v52;

    -[STUConfigurationManager updateEffectiveConfiguration](v20, "updateEffectiveConfiguration");
    v17 = v55;
    -[STUConfigurationManager disableAdHocIfNeeded](v20, "disableAdHocIfNeeded");
    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);
  }

  return v20;
}

- (void)deleteOldCloudDirectory
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager studentdLibraryURL](NSFileManager, "studentdLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("CloudStorage")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v5 = objc_msgSend(v4, "crk_safeRemoveItemAtURL:error:", v3, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = sub_10006B900();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10007DFA4(v6);

  }
}

- (void)deviceDidUnlockForFirstTime
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager firstUnlockSubscription](self, "firstUnlockSubscription"));
  objc_msgSend(v3, "cancel");

  -[STUConfigurationManager setFirstUnlockSubscription:](self, "setFirstUnlockSubscription:", 0);
  if (-[STUConfigurationManager isManaged](self, "isManaged"))
  {
    v4 = sub_10006B900();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updating effective configuration due to first unlock of device", v6, 2u);
    }

    -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");
  }
}

- (BOOL)isDisabled
{
  return -[STUConfigurationManager configurationType](self, "configurationType") == 0;
}

- (BOOL)isManaged
{
  return -[STUConfigurationManager configurationType](self, "configurationType") & 1;
}

- (BOOL)isAdHoc
{
  return (-[STUConfigurationManager configurationType](self, "configurationType") >> 1) & 1;
}

- (BOOL)isASM
{
  return (-[STUConfigurationManager configurationType](self, "configurationType") >> 2) & 1;
}

- (NSDictionary)effectiveManagedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  NSObject *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager profileConfiguration](self, "profileConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));

  if (-[STUConfigurationManager installedEDUProfile](self, "installedEDUProfile")
    || !objc_msgSend(v4, "count")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration")), v6 = objc_msgSend(v5, "isEDUPayloadInstalled"), v5, (v6 & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager auxiliaryUsersByIdentifier](self, "auxiliaryUsersByIdentifier"));
    if (objc_msgSend(v7, "count"))
    {
      v8 = kCRKEDUUsersKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCRKEDUUsersKey));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v9));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
      objc_msgSend(v10, "addObjectsFromArray:", v11);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v8);
    }
    if (objc_msgSend(v4, "count"))
      v12 = objc_msgSend(v4, "copy");
    else
      v12 = 0;

  }
  else
  {
    v14 = sub_10006B900();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10007E01C();

    v12 = 0;
  }

  return (NSDictionary *)v12;
}

- (NSSet)organizationUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager enrolledControlGroupIdentifiers](self, "enrolledControlGroupIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("organizationUUID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID crk_zerosUUID](NSUUID, "crk_zerosUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self != %@"), v5));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredSetUsingPredicate:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedOrganizationUUID](self, "managedOrganizationUUID"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedOrganizationUUID](self, "managedOrganizationUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));

    if (v7)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setByAddingObjectsFromSet:", v10));

      v7 = (id)v11;
    }
    else
    {
      v7 = v10;
    }

  }
  return (NSSet *)v7;
}

- (NSSet)enrolledControlGroupIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecords](self, "groupEnrollmentRecords"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("groupIdentifier")));

  return (NSSet *)v3;
}

- (NSSet)visibleGroupEnrollmentRecords
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecords](self, "groupEnrollmentRecords"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000CBC80));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filteredSetUsingPredicate:", v3));

  return (NSSet *)v4;
}

- (NSDictionary)adHocConfiguration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stu_plistObjectForKey:", CFSTR("AdHocConfiguration.plist")));
  v5 = (void *)v4;
  v6 = &__NSDictionary0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  if (-[STUConfigurationManager isManaged](self, "isManaged") || -[STUConfigurationManager isASM](self, "isASM"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocDefaultStudentInformation](self, "adHocDefaultStudentInformation"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, kCRKAdHocConfigurationDefaultStudentInformationKey);

    v10 = objc_msgSend(v8, "copy");
    v7 = v10;
  }
  v19[0] = kCRKAdHocConfigurationAutoAssistEnabledKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUConfigurationManager automaticallyJoinClasses](self, "automaticallyJoinClasses")));
  v20[0] = v11;
  v19[1] = kCRKAdHocConfigurationAutoAssistModifiableKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[STUConfigurationManager isAutomaticallyJoinClassesForcedOn](self, "isAutomaticallyJoinClassesForcedOn") ^ 1));
  v20[1] = v12;
  v19[2] = kCRKAdHocConfigurationRequestPermissionToLeaveClassesEnabledKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUConfigurationManager requestPermissionToLeaveClasses](self, "requestPermissionToLeaveClasses")));
  v20[2] = v13;
  v19[3] = kCRKAdHocConfigurationRemoteLearningMaxIdleLengthKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:"));
  v15 = v14;
  if (!v14)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3600.0));
  v20[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_dictionaryByAddingEntriesFromDictionary:", v16));

  if (!v14)
  return (NSDictionary *)v17;
}

- (BOOL)automaticallyJoinClasses
{
  if (-[STUConfigurationManager adHocConfigAllowsAutomaticallyJoinClasses](self, "adHocConfigAllowsAutomaticallyJoinClasses"))
  {
    return 1;
  }
  else
  {
    return -[STUConfigurationManager isAutomaticallyJoinClassesForcedOn](self, "isAutomaticallyJoinClassesForcedOn");
  }
}

- (BOOL)requestPermissionToLeaveClasses
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[STUConfigurationManager isAdHoc](self, "isAdHoc");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager featureDataStore](self, "featureDataStore"));
    v5 = objc_msgSend(v4, "isClassroomRequestPermissionToLeaveClassesForced");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSSet)allStudentIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager visibleGroupEnrollmentRecords](self, "visibleGroupEnrollmentRecords"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crk_mapUsingBlock:", &stru_1000CBCC0));

  return (NSSet *)v3;
}

- (CRKIdentity)resourceIdentity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager resourcePersistentID](self, "resourcePersistentID"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keychain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identityWithPersistentID:", v2));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRKMDMIdentityProvider identity](CRKMDMIdentityProvider, "identity"));
  }

  return (CRKIdentity *)v5;
}

- (BOOL)setProfileConfiguration:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager systemDataStore](self, "systemDataStore"));
  v6 = objc_msgSend(v5, "stu_setPlistObject:forKey:", v4, CFSTR("StudentConfiguration.plist"));

  if (v6)
    v7 = objc_msgSend(v4, "count") != 0;
  else
    v7 = 0;
  -[STUConfigurationManager setInstalledEDUProfile:](self, "setInstalledEDUProfile:", v7);
  -[STUConfigurationManager setAuxiliaryUsers:](self, "setAuxiliaryUsers:", 0);
  -[STUConfigurationManager setAuxiliaryEnrolledGroupsByUserIdentifier:](self, "setAuxiliaryEnrolledGroupsByUserIdentifier:", 0);
  -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");

  return v6;
}

- (id)profileCourseConfigurationMetadataForCourseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager profileConfigurationMetadata](self, "profileConfigurationMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  return v7;
}

- (BOOL)setProfileCourseConfigurationMetadata:(id)a3 courseIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  STUConfigurationManager *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v23 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager profileConfigurationMetadata](self, "profileConfigurationMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v18));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v20);

  v21 = -[STUConfigurationManager setProfileConfigurationMetadata:updateEffectiveConfiguration:](v23, "setProfileConfigurationMetadata:updateEffectiveConfiguration:", v9, 1);
  return v21;
}

- (BOOL)setProfileConfigurationMetadata:(id)a3 updateEffectiveConfiguration:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
  v8 = objc_msgSend(v7, "stu_setPlistObject:forKey:", v6, CFSTR("StudentConfigurationMetadata.plist"));

  if (v4)
    -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");
  return v8;
}

- (void)disableAdHocIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocConfiguration](self, "adHocConfiguration"));
  v4 = kCRKAdHocConfigurationEnabledKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKAdHocConfigurationEnabledKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      v9 = objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v4);
      -[STUConfigurationManager writeAdHocConfiguration:](self, "writeAdHocConfiguration:", v9);
      v10 = sub_10006B900();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Disabling adhoc because user has no adhoc enrollment records", v12, 2u);
      }

    }
  }

}

- (id)profileConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager systemDataStore](self, "systemDataStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stu_plistObjectForKey:", CFSTR("StudentConfiguration.plist")));

  return v3;
}

- (id)profileConfigurationMetadata
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stu_plistObjectForKey:", CFSTR("StudentConfigurationMetadata.plist")));

  return v3;
}

- (BOOL)setAdHocConfiguration:(id)a3
{
  _BOOL4 v4;

  v4 = -[STUConfigurationManager writeAdHocConfiguration:](self, "writeAdHocConfiguration:", a3);
  if (v4)
    -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");
  return v4;
}

- (id)enrollmentRecordWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecordsByGroupIdentifier](self, "groupEnrollmentRecordsByGroupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (BOOL)upsertEnrollmentRecord:(id)a3 error:(id *)a4 shouldUpdateConfiguration:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v5 = a5;
  v8 = a3;
  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentRecord"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupIdentifier"));

  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentRecord.groupIdentifier"));

  }
  if (objc_msgSend(v8, "type") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rollingCourseIdentitySet"));

    if (!v10)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 385, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentRecord.rollingCourseIdentitySet"));

    }
  }
  v11 = objc_alloc((Class)NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
  v13 = objc_msgSend(v11, "initWithDictionary:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupIdentifier"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v14);

  -[STUConfigurationManager setAdHocEnrollmentRecordsByGroupIdentifier:](self, "setAdHocEnrollmentRecordsByGroupIdentifier:", v13);
  if (v5)
    -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");

  return 1;
}

- (BOOL)upsertEnrollmentRecord:(id)a3 error:(id *)a4
{
  return -[STUConfigurationManager upsertEnrollmentRecord:error:shouldUpdateConfiguration:](self, "upsertEnrollmentRecord:error:shouldUpdateConfiguration:", a3, a4, 1);
}

- (void)setRequestUnenroll:(BOOL)a3 forCourseWithIdentifier:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(id, _QWORD);
  id v21;

  v6 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("courseIdentifier"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager enrollmentRecordWithIdentifier:](self, "enrollmentRecordWithIdentifier:", v9));
  v12 = objc_msgSend(v11, "copy");

  if (objc_msgSend(v12, "isRequestingUnenroll") == v6)
  {
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    objc_msgSend(v12, "setRequestingUnenroll:", v6);
    if (v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRKPlatformInternetDateProvider sharedProvider](CRKPlatformInternetDateProvider, "sharedProvider"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10006CAE0;
      v18[3] = &unk_1000CBCE8;
      v20 = v10;
      v18[4] = self;
      v19 = v12;
      objc_msgSend(v13, "fetchInternetDateWithCompletion:", v18);

    }
    else
    {
      objc_msgSend(v12, "setAutomaticRemovalDate:", 0);
      v21 = 0;
      -[STUConfigurationManager upsertEnrollmentRecord:error:](self, "upsertEnrollmentRecord:error:", v12, &v21);
      v14 = v21;
      if (v14)
      {
        v15 = sub_10006B900();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_10007E048(v14);

      }
      if (v10)
        ((void (**)(id, id))v10)[2](v10, v14);

    }
  }

}

- (void)didFetchInternetDate:(id)a3 record:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v10 = a4;
  if (objc_msgSend(v10, "isRequestingUnenroll"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager removalDateFromBaseDate:](self, "removalDateFromBaseDate:", v8));
    objc_msgSend(v10, "setAutomaticRemovalDate:", v11);

  }
  else
  {
    objc_msgSend(v10, "setAutomaticRemovalDate:", 0);
  }
  v15 = 0;
  -[STUConfigurationManager upsertEnrollmentRecord:error:](self, "upsertEnrollmentRecord:error:", v10, &v15);

  v12 = v15;
  if (v12)
  {
    v13 = sub_10006B900();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10007E048(v12);

  }
  if (v9)
    v9[2](v9, v12);

}

- (BOOL)removeEnrollmentRecordsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 470, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifiers"));

  }
  v8 = -[STUConfigurationManager removeEnrollmentRecordsWithIdentifiers:updateEffectiveConfiguration:error:](self, "removeEnrollmentRecordsWithIdentifiers:updateEffectiveConfiguration:error:", v7, 1, a4);

  return v8;
}

- (BOOL)removeEnrollmentRecordWithIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier"));

  }
  v8 = -[STUConfigurationManager removeEnrollmentRecordWithIdentifier:updateEffectiveConfiguration:error:](self, "removeEnrollmentRecordWithIdentifier:updateEffectiveConfiguration:error:", v7, 1, a4);

  return v8;
}

- (BOOL)removeEnrollmentRecordWithIdentifier:(id)a3 updateEffectiveConfiguration:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  id v20;

  v6 = a4;
  v9 = a3;
  if (!v9)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
  v20 = 0;
  v11 = -[STUConfigurationManager removeEnrollmentRecordsWithIdentifiers:updateEffectiveConfiguration:error:](self, "removeEnrollmentRecordsWithIdentifiers:updateEffectiveConfiguration:error:", v10, v6, &v20);
  v12 = v20;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CRKPartialErrorsByItemIdentifier")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));

  if (!v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
    if (!objc_msgSend(v16, "isEqualToString:", CRKErrorDomain))
    {
LABEL_8:

      goto LABEL_9;
    }
    v17 = objc_msgSend(v12, "code");

    if (v17 == (id)29 && v15)
    {
      v16 = v12;
      v12 = v15;
      goto LABEL_8;
    }
  }
LABEL_9:
  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)removeEnrollmentRecordsWithIdentifiers:(id)a3 updateEffectiveConfiguration:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  STUEnrollmentRecordDeleter *v10;
  void *v11;
  STUEnrollmentRecordDeleter *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = a4;
  v9 = a3;
  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifiers"));

  }
  v10 = [STUEnrollmentRecordDeleter alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
  v12 = -[STUEnrollmentRecordDeleter initWithEnrollmentRecordsByIdentifier:identifiersToDelete:](v10, "initWithEnrollmentRecordsByIdentifier:identifiersToDelete:", v11, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter deleteEnrollmentRecords](v12, "deleteEnrollmentRecords"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remainingRecordsByIdentifier"));
  -[STUConfigurationManager setAdHocEnrollmentRecordsByGroupIdentifier:](self, "setAdHocEnrollmentRecordsByGroupIdentifier:", v14);

  if (v6)
    -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));

  if (a5 && v15)
    *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));

  return v15 == 0;
}

- (id)clientIdentityForGroupIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  int v21;
  void *v22;

  v4 = a3;
  v5 = sub_10006B900();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    v21 = 138543362;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetching client identity for %{public}@", (uint8_t *)&v21, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecordsByGroupIdentifier](self, "groupEnrollmentRecordsByGroupIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v4));

  if (objc_msgSend(v9, "isASM"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager ASMCourseLibrary](self, "ASMCourseLibrary"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientIdentityForCourseIdentifier:", v11));
    goto LABEL_14;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rollingCourseIdentitySet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeIdentityPersistentID"));

  if (v9)
  {
    if (v10)
    {
LABEL_7:
      v11 = objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject keychain](v11, "keychain"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identityWithPersistentID:", v10));

      goto LABEL_14;
    }
  }
  else
  {
    v15 = sub_10006B900();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "No enrollment record found when fetching client identity, defaulting to managed", (uint8_t *)&v21, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedRollingDeviceIdentitySet](self, "managedRollingDeviceIdentitySet"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeIdentityPersistentID"));

    v10 = (void *)v18;
    if (v18)
      goto LABEL_7;
  }
  v19 = sub_10006B900();
  v11 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10007E138();
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)stagedClientIdentityForGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecordsByGroupIdentifier](self, "groupEnrollmentRecordsByGroupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if ((objc_msgSend(v6, "isASM") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rollingCourseIdentitySet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stagedIdentityPersistentID"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keychain"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identityWithPersistentID:", v9));

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)trustedAnchorCertificatesForGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecordsByGroupIdentifier](self, "groupEnrollmentRecordsByGroupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (objc_msgSend(v6, "isASM"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager ASMCourseLibrary](self, "ASMCourseLibrary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trustedAnchorCertificatesForCourseIdentifier:", v8));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trustedAnchorCertificatePersistentIDs"));
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedAnchorPersistentIDs](self, "managedAnchorPersistentIDs"));
    v7 = v12;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006D51C;
    v14[3] = &unk_1000CBD10;
    v14[4] = self;
    v15 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_mapUsingBlock:", v14));

  }
  return v9;
}

- (void)setActiveUserIdentifier:(id)a3
{
  NSString *v4;
  NSString *activeUserIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  activeUserIdentifier = self->_activeUserIdentifier;
  self->_activeUserIdentifier = v4;

  -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");
}

- (id)adHocUserIdentifierForCourseWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocBaseUserIdentifier](self, "adHocBaseUserIdentifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocBaseUserIdentifier](self, "adHocBaseUserIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)userDictionaryForCourseWithIdentifier:(id)a3 studentInformation:(id)a4
{
  id v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v9 = objc_opt_new(NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocUserIdentifierForCourseWithIdentifier:](self, "adHocUserIdentifierForCourseWithIdentifier:", v7));
  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, kCRKEDUUserIdentifierKey);
  v11 = kCRKAdHocConfigurationStudentDisplayNameKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentDisplayNameKey));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, kCRKEDUUserNameKey);

  }
  v14 = kCRKAdHocConfigurationStudentGivenNameKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentGivenNameKey));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v14));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, kCRKEDUUserGivenNameKey);

  }
  v17 = kCRKAdHocConfigurationStudentPhoneticGivenNameKey;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentPhoneticGivenNameKey));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v17));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v19, kCRKEDUUserPhoneticGivenNameKey);

  }
  v20 = kCRKAdHocConfigurationStudentFamilyNameKey;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentFamilyNameKey));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v20));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v22, kCRKEDUUserFamilyNameKey);

  }
  v23 = kCRKAdHocConfigurationStudentPhoneticFamilyNameKey;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentPhoneticFamilyNameKey));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v23));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v25, kCRKEDUUserPhoneticFamilyNameKey);

  }
  v26 = kCRKAdHocConfigurationStudentImageIdentifierKey;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentImageIdentifierKey));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v26));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v28, v26);

  }
  v29 = kCRKAdHocConfigurationStudentImageDataKey;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentImageDataKey));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v29));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v31, v29);

  }
  return v9;
}

- (id)storeUserImageData:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v15;

  v7 = a3;
  if (!v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageData"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userImageStore](self, "userImageStore"));
  v11 = objc_msgSend(v10, "setData:forKey:error:", v7, v9, a4);

  if (v11)
    v12 = v9;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)userImageDataWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userImageStore](self, "userImageStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataForKey:error:", v6, a4));

  return v8;
}

- (BOOL)deleteUserImageDataWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userImageStore](self, "userImageStore"));
  LOBYTE(a4) = objc_msgSend(v7, "removeDataForKey:error:", v6, a4);

  return (char)a4;
}

- (void)updateMeCardInfo
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  STUSetUserPropertiesOperation *v23;
  void *v24;
  id v25;
  uint64_t v26;
  STUConfigurationManager *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = objc_msgSend(v3, "crk_isBeingTested");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager meCardUserProvider](self, "meCardUserProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "user"));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager visibleGroupEnrollmentRecords](self, "visibleGroupEnrollmentRecords"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (!v8)
      goto LABEL_20;
    v9 = v8;
    v10 = *(_QWORD *)v33;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupUser", v30));
        v14 = objc_msgSend(v13, "isMeCardUser");
        v15 = v14;
        if (v6)
        {
          if (v14)
          {

          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupUser"));
            v19 = objc_msgSend(v18, "shouldUseMeCardIfAvailable");

            if (!v19)
              continue;
          }
          v17 = v6;
        }
        else
        {

          if ((v15 & 1) == 0)
            continue;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupUser"));
          v17 = (id)objc_claimAutoreleasedReturnValue(+[CRKUser customUserFromMeCardUser:](CRKUser, "customUserFromMeCardUser:", v16));

          objc_msgSend(v17, "setUseMeCardIfAvailable:", 1);
          if (!v17)
            continue;
        }
        v31 = 0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupUser"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager requestToUpdateUser:withUser:courseIdentifier:outUsersEqual:](self, "requestToUpdateUser:withUser:courseIdentifier:outUsersEqual:", v20, v17, v21, &v31));

        if (!v31)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedXPCContext](self, "managedXPCContext"));
          v23 = -[STUTaskOperation initWithRequest:context:delegate:]([STUSetUserPropertiesOperation alloc], "initWithRequest:context:delegate:", v22, v30, self);
          v24 = v6;
          v25 = v9;
          v26 = v10;
          v27 = self;
          v28 = v7;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
          objc_msgSend(v29, "addOperation:", v23);

          v7 = v28;
          self = v27;
          v10 = v26;
          v9 = v25;
          v6 = v24;

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (!v9)
      {
LABEL_20:

        return;
      }
    }
  }
}

- (id)requestToUpdateUser:(id)a3 withUser:(id)a4 courseIdentifier:(id)a5 outUsersEqual:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  unsigned __int8 v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  unsigned __int8 v67;
  void *v68;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new(CRKSetUserPropertiesRequest);
  objc_msgSend(v13, "setCourseIdentifier:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userIdentifier"));
  objc_msgSend(v13, "setUserIdentifier:", v14);

  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
  if (v15 | v16)
    v17 = objc_msgSend((id)v15, "isEqual:", v16);
  else
    v17 = 1;

  if ((v17 & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
    if (v18)
    {
      objc_msgSend(v13, "setDisplayName:", v18);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v13, "setDisplayName:", v19);

    }
  }
  v20 = v17 ^ 1;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "givenName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "givenName"));
  v23 = v21;
  v24 = v22;
  if (v23 | v24)
  {
    v25 = (void *)v24;
    v26 = objc_msgSend((id)v23, "isEqual:", v24);

    if ((v26 & 1) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "givenName"));
      if (v27)
      {
        objc_msgSend(v13, "setGivenName:", v27);
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v13, "setGivenName:", v28);

      }
      v20 = 1;
    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "familyName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "familyName"));
  v31 = v29;
  v32 = v30;
  if (v31 | v32)
  {
    v33 = (void *)v32;
    v34 = objc_msgSend((id)v31, "isEqual:", v32);

    if ((v34 & 1) == 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "familyName"));
      if (v35)
      {
        objc_msgSend(v13, "setFamilyName:", v35);
      }
      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v13, "setFamilyName:", v36);

      }
      v20 = 1;
    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "phoneticGivenName"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "phoneticGivenName"));
  v39 = v37;
  v40 = v38;
  if (v39 | v40)
  {
    v41 = (void *)v40;
    v42 = objc_msgSend((id)v39, "isEqual:", v40);

    if ((v42 & 1) == 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "phoneticGivenName"));
      if (v43)
      {
        objc_msgSend(v13, "setPhoneticGivenName:", v43);
      }
      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v13, "setPhoneticGivenName:", v44);

      }
      v20 = 1;
    }
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "phoneticFamilyName"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "phoneticFamilyName"));
  v47 = v45;
  v48 = v46;
  if (v47 | v48)
  {
    v49 = (void *)v48;
    v50 = objc_msgSend((id)v47, "isEqual:", v48);

    if ((v50 & 1) == 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "phoneticFamilyName"));
      if (v51)
      {
        objc_msgSend(v13, "setPhoneticFamilyName:", v51);
      }
      else
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v13, "setPhoneticFamilyName:", v52);

      }
      v20 = 1;
    }
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userSource"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userSource"));
  v55 = v53;
  v56 = v54;
  if (v55 | v56)
  {
    v57 = (void *)v56;
    v58 = objc_msgSend((id)v55, "isEqual:", v56);

    if ((v58 & 1) == 0)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userSource"));
      if (v59)
      {
        objc_msgSend(v13, "setUserSource:", v59);
      }
      else
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v13, "setUserSource:", v60);

      }
      v20 = 1;
    }
  }
  v61 = objc_msgSend(v10, "shouldUseMeCardIfAvailable");
  if (v61 != objc_msgSend(v11, "shouldUseMeCardIfAvailable"))
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v11, "shouldUseMeCardIfAvailable")));
    objc_msgSend(v13, "setUseMeCardIfAvailable:", v62);

    v20 = 1;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager effectiveUserImageDataForUser:](self, "effectiveUserImageDataForUser:", v10));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager effectiveUserImageDataForUser:](self, "effectiveUserImageDataForUser:", v11));
  v65 = v63;
  v66 = v64;
  if (v65 | v66)
  {
    v67 = objc_msgSend((id)v65, "isEqual:", v66);

    if ((v67 & 1) == 0)
    {
      if (v66)
      {
        objc_msgSend(v13, "setImageData:", v66);
      }
      else
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v13, "setImageData:", v68);

      }
      v20 = 1;
    }
  }
  if (a6)
    *a6 = v20 ^ 1;

  return v13;
}

- (id)effectiveUserImageDataForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userImageData"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userImageData"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageIdentifier"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userImageDataWithIdentifier:error:](self, "userImageDataWithIdentifier:error:", v8, 0));

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)taskOperation:(id)a3 needsToEnqueueOperation:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = sub_10006B900();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10007E210();

}

- (BOOL)isAutomaticallyJoinClassesForcedOn
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager featureDataStore](self, "featureDataStore"));
  v4 = objc_msgSend(v3, "isClassroomAutomaticClassJoiningForced");

  if (-[STUConfigurationManager isManaged](self, "isManaged"))
  {
    LOBYTE(v4) = 1;
  }
  else if (-[STUConfigurationManager isASM](self, "isASM"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration"));
    v4 |= objc_msgSend(v5, "isSupervised");

  }
  return v4;
}

- (BOOL)isStudentConfiguration:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;

  if (!a3)
    return 0;
  v3 = kCRKEDUPayloadCertificatePersistentIDKey;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v3));
  v6 = objc_opt_class(NSData);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCRKEDUPayloadLeaderCertificateAnchorPersistentIDKey));
  v9 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  v12 = isKindOfClass & (v5 != 0);
  v13 = objc_msgSend(v11, "count");

  return v13 && v12;
}

- (void)postConfigurationChangeNotification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("STUConfigurationManagerDidUpdateConfigurationNotificationName"), self);

}

- (void)updateEffectiveConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  STURollingDeviceIdentitySet *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  STUAdHocConfigurationIdentityDeleter *v52;
  uint64_t v53;
  STUAdHocConfigurationIdentityDeleter *v54;
  STUAdHocConfigurationIdentityDeleter *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  NSMutableDictionary *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *i;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL8 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "updateEffectiveConfiguration", 0);
  -[STUConfigurationManager cleanupAdHocEnrollmentRecords](self, "cleanupAdHocEnrollmentRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager effectiveManagedConfiguration](self, "effectiveManagedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager ASMCourseLibrary](self, "ASMCourseLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentRecords"));

  v80 = v5;
  v78 = v3;
  if (!-[STUConfigurationManager isStudentConfiguration:](self, "isStudentConfiguration:", v3))
  {
    v8 = objc_msgSend(v5, "count");
    -[STUConfigurationManager setManagedOrganizationUUID:](self, "setManagedOrganizationUUID:", 0);
    -[STUConfigurationManager setResourcePersistentID:](self, "setResourcePersistentID:", 0);
    -[STUConfigurationManager setManagedIdentity:](self, "setManagedIdentity:", 0);
    -[STUConfigurationManager setManagedRollingDeviceIdentitySet:](self, "setManagedRollingDeviceIdentitySet:", 0);
    -[STUConfigurationManager setIsInstructorOnEDU:](self, "setIsInstructorOnEDU:", 0);
    if (v8)
    {
      -[STUConfigurationManager setAdHocBaseUserIdentifier:](self, "setAdHocBaseUserIdentifier:", 0);
      -[STUConfigurationManager setAdHocDefaultStudentInformation:](self, "setAdHocDefaultStudentInformation:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager makeEnrollmentRecordsByIdentifierWithEnrollmentRecords:](self, "makeEnrollmentRecordsByIdentifierWithEnrollmentRecords:", v5));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stu_plistObjectForKey:", CFSTR("AdHocConfiguration.plist")));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kCRKAdHocConfigurationAutoAssistEnabledKey));
      -[STUConfigurationManager setAdHocConfigAllowsAutomaticallyJoinClasses:](self, "setAdHocConfigAllowsAutomaticallyJoinClasses:", objc_msgSend(v12, "BOOLValue"));

      v13 = 0;
      v79 = 4;
      goto LABEL_50;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stu_plistObjectForKey:", CFSTR("AdHocConfiguration.plist")));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v24 = objc_msgSend(v23, "isSharedIPad");

    if ((v24 & 1) != 0)
    {
      -[STUConfigurationManager setAdHocBaseUserIdentifier:](self, "setAdHocBaseUserIdentifier:", 0);
      -[STUConfigurationManager setManagedRollingDeviceIdentitySet:](self, "setManagedRollingDeviceIdentitySet:", 0);
      -[STUConfigurationManager setAdHocDefaultStudentInformation:](self, "setAdHocDefaultStudentInformation:", 0);
      v9 = 0;
      v25 = 0;
      v79 = 0;
LABEL_49:
      v13 = (void *)v25;

      goto LABEL_50;
    }
    if (!v22)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager defaultAdHocProfile](self, "defaultAdHocProfile"));
      v27 = -[STUConfigurationManager writeAdHocConfiguration:](self, "writeAdHocConfiguration:", v26);

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stu_plistObjectForKey:", CFSTR("AdHocConfiguration.plist")));

      }
      else
      {
        v22 = 0;
      }
    }
    v36 = kCRKAdHocConfigurationStudentIdentifierKey;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentIdentifierKey));
    -[STUConfigurationManager setAdHocBaseUserIdentifier:](self, "setAdHocBaseUserIdentifier:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocBaseUserIdentifier](self, "adHocBaseUserIdentifier"));
    if (v38)
    {
      v39 = 0;
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "UUIDString"));
      -[STUConfigurationManager setAdHocBaseUserIdentifier:](self, "setAdHocBaseUserIdentifier:", v41);

      v39 = objc_msgSend(v22, "mutableCopy");
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocBaseUserIdentifier](self, "adHocBaseUserIdentifier"));
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, v36);

    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocBaseUserIdentifier](self, "adHocBaseUserIdentifier"));
    v44 = objc_claimAutoreleasedReturnValue(-[STUConfigurationManager rollingDeviceIdentitySetInAdHocConfiguration:studentIdentifier:](self, "rollingDeviceIdentitySetInAdHocConfiguration:studentIdentifier:", v22, v43));

    v77 = (void *)v44;
    -[STUConfigurationManager updateEnrollmentRecordIdentitiesWithDefaultIdentitySet:](self, "updateEnrollmentRecordIdentitiesWithDefaultIdentitySet:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", kCRKAdHocConfigurationDefaultStudentInformationKey));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", kCRKAdHocConfigurationEnabledKey));
    if (objc_msgSend(v46, "BOOLValue"))
    {
      v9 = objc_msgSend(v45, "count");

      if (v9)
      {
        v9 = v45;
        v47 = 2;
        goto LABEL_32;
      }
    }
    else
    {

      v9 = 0;
    }
    v47 = 0;
LABEL_32:
    v79 = v47;
    v76 = v45;
    if (v22)
    {
      v48 = objc_msgSend(v39, "copy");
      v75 = v39;
      v49 = v48;
      if (v48)
        v50 = v48;
      else
        v50 = v22;
      v51 = v50;

      v52 = [STUAdHocConfigurationIdentityDeleter alloc];
      v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allValues"));
      v54 = -[STUAdHocConfigurationIdentityDeleter initWithConfiguration:enrollmentRecords:](v52, "initWithConfiguration:enrollmentRecords:", v51, v53);

      v55 = v54;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter deleteIdentities](v54, "deleteIdentities"));
      LOBYTE(v53) = objc_msgSend(v51, "isEqual:", v56);

      if ((v53 & 1) != 0)
      {
        v57 = v75;
      }
      else
      {
        v57 = objc_msgSend(v56, "mutableCopy");

      }
      v39 = v57;
    }
    v58 = kCRKAdHocConfigurationCloudSyncingEnabledKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", kCRKAdHocConfigurationCloudSyncingEnabledKey, v75));
    if (v59)
    {

    }
    else
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", kCRKAdHocConfigurationCloudSyncingModifiableKey));

      if (!v60)
      {
LABEL_46:
        if (v39)
          -[STUConfigurationManager writeAdHocConfiguration:](self, "writeAdHocConfiguration:", v39);
        -[STUConfigurationManager setAdHocDefaultStudentInformation:](self, "setAdHocDefaultStudentInformation:", v25);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", kCRKAdHocConfigurationAutoAssistEnabledKey));
        -[STUConfigurationManager setAdHocConfigAllowsAutomaticallyJoinClasses:](self, "setAdHocConfigAllowsAutomaticallyJoinClasses:", objc_msgSend(v61, "BOOLValue"));

        -[STUConfigurationManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "updateEffectiveConfiguration", 0, CRKDayInterval);
        goto LABEL_49;
      }
    }
    if (!v39)
      v39 = objc_msgSend(v22, "mutableCopy");
    objc_msgSend(v39, "setObject:forKeyedSubscript:", 0, v58);
    objc_msgSend(v39, "setObject:forKeyedSubscript:", 0, kCRKAdHocConfigurationCloudSyncingModifiableKey);
    goto LABEL_46;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUOrganizationUUIDKey));
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v6);
    -[STUConfigurationManager setManagedOrganizationUUID:](self, "setManagedOrganizationUUID:", v7);

  }
  else
  {
    -[STUConfigurationManager setManagedOrganizationUUID:](self, "setManagedOrganizationUUID:", 0);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedOrganizationUUID](self, "managedOrganizationUUID"));

  v79 = v14 != 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUPayloadCertificatePersistentIDKey));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager credentialCache](self, "credentialCache"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v15));

  if (!v17 && v15)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "keychain"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identityWithPersistentID:", v15));

    if (v17)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager credentialCache](self, "credentialCache"));
      objc_msgSend(v20, "setObject:forKey:", v17, v15);

    }
    else
    {
      v29 = sub_10006B900();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_10007E23C();

      v17 = 0;
    }
  }
  -[STUConfigurationManager setManagedIdentity:](self, "setManagedIdentity:", v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUPayloadLeaderCertificateAnchorPersistentIDKey));
  -[STUConfigurationManager setManagedAnchorPersistentIDs:](self, "setManagedAnchorPersistentIDs:", v31);

  v32 = -[STURollingUserIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:]([STURollingDeviceIdentitySet alloc], "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:", v15, 0, CFSTR("INVALID"));
  -[STUConfigurationManager setManagedRollingDeviceIdentitySet:](self, "setManagedRollingDeviceIdentitySet:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedIdentity](self, "managedIdentity"));
  if (-[STUConfigurationManager isInstructorIdentity:](self, "isInstructorIdentity:", v33))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    -[STUConfigurationManager setIsInstructorOnEDU:](self, "setIsInstructorOnEDU:", objc_msgSend(v34, "isSharedIPad"));

  }
  else
  {
    -[STUConfigurationManager setIsInstructorOnEDU:](self, "setIsInstructorOnEDU:", 0);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUResourcePayloadCertificatePersistentIDKey));
  -[STUConfigurationManager setResourcePersistentID:](self, "setResourcePersistentID:", v35);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager enrollmentRecordsByGroupIdentifierInConfiguration:type:](self, "enrollmentRecordsByGroupIdentifierInConfiguration:type:", v3, 0));
  -[STUConfigurationManager setAdHocBaseUserIdentifier:](self, "setAdHocBaseUserIdentifier:", 0);
  -[STUConfigurationManager setAdHocDefaultStudentInformation:](self, "setAdHocDefaultStudentInformation:", 0);

  v13 = 0;
LABEL_50:
  v62 = objc_opt_new(NSMutableDictionary);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager synthesizedEnrollmentRecords](self, "synthesizedEnrollmentRecords"));
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "groupIdentifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v68, v69);

      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    }
    while (v65);
  }

  -[NSMutableDictionary addEntriesFromDictionary:](v62, "addEntriesFromDictionary:", v9);
  -[STUConfigurationManager setGroupEnrollmentRecordsByGroupIdentifier:](self, "setGroupEnrollmentRecordsByGroupIdentifier:", v62);
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v62, "allValues"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v70));
  -[STUConfigurationManager setGroupEnrollmentRecords:](self, "setGroupEnrollmentRecords:", v71);

  if (-[STUConfigurationManager configurationType](self, "configurationType") != v79)
    -[STUConfigurationManager setConfigurationType:](self, "setConfigurationType:");
  if (-[STUConfigurationManager isManaged](self, "isManaged"))
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedIdentity](self, "managedIdentity"));
    v73 = v72 != 0;

  }
  else
  {
    v73 = 1;
  }
  -[STUConfigurationManager setHasIdentities:](self, "setHasIdentities:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager ASMCourseLibrary](self, "ASMCourseLibrary"));
  -[STUConfigurationManager setSignedInToStudentMAID:](self, "setSignedInToStudentMAID:", objc_msgSend(v74, "isSignedInToStudentMAID"));

  -[STUConfigurationManager updateStudentRoleEnabledState](self, "updateStudentRoleEnabledState");
  -[STUConfigurationManager updateDefaultPermissions](self, "updateDefaultPermissions");
  -[STUConfigurationManager updateASMCourseLibrary](self, "updateASMCourseLibrary");
  -[STUConfigurationManager postConfigurationChangeNotification](self, "postConfigurationChangeNotification");

}

- (void)updateASMCourseLibrary
{
  unsigned int v3;
  void *v4;
  id v5;

  v3 = -[STUConfigurationManager isManaged](self, "isManaged");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager ASMCourseLibrary](self, "ASMCourseLibrary"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "disconnectFromDataSource");
  else
    objc_msgSend(v4, "connectToDataSource");

}

- (id)makeEnrollmentRecordsByIdentifierWithEnrollmentRecords:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier", (_QWORD)v14));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = -[NSMutableDictionary copy](v4, "copy");
  return v12;
}

- (id)rollingDeviceIdentitySetInAdHocConfiguration:(id)a3 studentIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  STURollingDeviceIdentitySet *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKAdHocConfigurationRollingDeviceIdentitySetKey));
  if (v7)
  {
    v8 = -[STURollingUserIdentitySet initWithDictionary:]([STURollingDeviceIdentitySet alloc], "initWithDictionary:", v7);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKAdHocConfigurationStudentIdentityPersistentIDKey));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKAdHocConfigurationStagedStudentIdentityPersistentIDKey));
    if (v9 | v10)
      v8 = -[STURollingUserIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:]([STURollingDeviceIdentitySet alloc], "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:", v9, v10, v6);
    else
      v8 = 0;

  }
  return v8;
}

- (BOOL)updateEnrollmentRecordIdentitiesWithDefaultIdentitySet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v15;
  id v16;
  NSObject *v17;
  void *v18;
  STURollingCourseIdentitySet *v19;
  void *v20;
  void *v21;
  void *v22;
  STURollingCourseIdentitySet *v23;
  void *v24;
  unsigned int v25;
  unsigned __int8 v26;
  id v27;
  id v28;
  NSObject *v29;
  char v31;
  STUConfigurationManager *v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[16];
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];

  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v32 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v7)
  {
    v8 = v7;
    v31 = 0;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "isHidden") & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rollingCourseIdentitySet"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeIdentityPersistentID"));

          if (v4)
            v14 = v13 == 0;
          else
            v14 = 0;
          v15 = v14;
          if (v14)
          {
            v16 = sub_10006B900();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
              *(_DWORD *)buf = 138543362;
              v41 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Inserting device identity into enrollment record with identifier %{public}@", buf, 0xCu);

            }
            v19 = [STURollingCourseIdentitySet alloc];
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupUser"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userIdentifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
            v23 = -[STURollingCourseIdentitySet initWithRollingIdentity:userIdentifier:groupIdentifier:](v19, "initWithRollingIdentity:userIdentifier:groupIdentifier:", v4, v21, v22);
            objc_msgSend(v11, "setRollingCourseIdentitySet:", v23);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rollingCourseIdentitySet"));
          v25 = objc_msgSend(v24, "refreshIdentities");

          if ((v15 | v25) == 1)
          {
            v34 = 0;
            v26 = -[STUConfigurationManager upsertEnrollmentRecord:error:shouldUpdateConfiguration:](v32, "upsertEnrollmentRecord:error:shouldUpdateConfiguration:", v11, &v34, 0);
            v27 = v34;
            if ((v26 & 1) != 0)
            {
              v31 = 1;
            }
            else
            {
              v28 = sub_10006B900();
              v29 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                sub_10007E268((uint64_t)v39, (uint64_t)v27);

            }
          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v8);
  }
  else
  {
    v31 = 0;
  }

  return v31 & 1;
}

- (void)updateStudentRoleEnabledState
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager visibleGroupEnrollmentRecords](self, "visibleGroupEnrollmentRecords"));
  v4 = objc_msgSend(v3, "count") != 0;

  v5 = sub_1000639A0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006F6FC;
  v7[3] = &unk_1000C9B70;
  v7[4] = self;
  v8 = v4;
  dispatch_async(v6, v7);

}

- (void)updateDefaultPermissions
{
  STUConfigurationManager *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unsigned __int8 v12;
  char v13;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecords](self, "groupEnrollmentRecords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager effectiveManagedConfiguration](v2, "effectiveManagedConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCRKEDUScreenObservationPermissionModificationAllowedKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  LOBYTE(v2) = -[STUConfigurationManager isManaged](v2, "isManaged");
  v7 = sub_1000639A0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006F828;
  v10[3] = &unk_1000CBD58;
  v11 = v3;
  v12 = v6;
  v13 = (char)v2;
  v9 = v3;
  dispatch_async(v8, v10);

}

- (void)cleanupAdHocEnrollmentRecords
{
  void *v3;
  _QWORD v4[5];

  -[STUConfigurationManager cleanupLegacyTombstones](self, "cleanupLegacyTombstones");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKPlatformInternetDateProvider sharedProvider](CRKPlatformInternetDateProvider, "sharedProvider"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006FC04;
  v4[3] = &unk_1000CA4F8;
  v4[4] = self;
  objc_msgSend(v3, "fetchInternetDateWithCompletion:", v4);

}

- (void)cleanupLegacyTombstones
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = objc_alloc((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
  v5 = objc_msgSend(v3, "initWithDictionary:", v4);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006FD18;
  v6[3] = &unk_1000CBD80;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (void)didFetchInternetDateForCleanupAdHocEnrollmentRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[16];
  _BYTE v37[128];

  v25 = a3;
  v4 = objc_alloc((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
  v6 = objc_msgSend(v4, "initWithDictionary:", v5);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v29;
    *(_QWORD *)&v9 = 138543618;
    v24 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13, v24));
        if (objc_msgSend(v14, "isRequestingUnenroll"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "automaticRemovalDate"));

          if (v15)
          {
            if (!objc_msgSend(v14, "shouldRemoveRecordToday:", v25))
              goto LABEL_17;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupIdentifier"));
            v26 = 0;
            -[STUConfigurationManager removeEnrollmentRecordWithIdentifier:updateEffectiveConfiguration:error:](self, "removeEnrollmentRecordWithIdentifier:updateEffectiveConfiguration:error:", v16, 0, &v26);
            v17 = v26;

            if (v17)
            {
              v18 = sub_10006B900();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "verboseDescription"));
                *(_DWORD *)buf = v24;
                v33 = v13;
                v34 = 2114;
                v35 = v20;
                v21 = (void *)v20;
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to remove enrollment record with group identifier %{public}@: %{public}@", buf, 0x16u);

              }
              goto LABEL_15;
            }
          }
          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager removalDateFromBaseDate:](self, "removalDateFromBaseDate:", v25));
            objc_msgSend(v14, "setAutomaticRemovalDate:", v22);

            v27 = 0;
            -[STUConfigurationManager upsertEnrollmentRecord:error:](self, "upsertEnrollmentRecord:error:", v14, &v27);
            v17 = v27;
            if (v17)
            {
              v23 = sub_10006B900();
              v19 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                sub_10007E3A8((uint64_t)v36, (uint64_t)v17);
LABEL_15:

            }
          }

        }
LABEL_17:

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v10);
  }

}

- (BOOL)isInstructorIdentity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "certificate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commonNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("leader"));

  return v7;
}

- (id)defaultUserDictionaryForProfileConfiguration:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v6 = objc_msgSend(v5, "isSharedIPad");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentUser"));
    v9 = objc_msgSend(v8, "isLoginUser");

    if (!v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentUser"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "username"));

      v12 = objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDictionaryWithAppleID:inConfiguration:](self, "userDictionaryWithAppleID:inConfiguration:", v11, v4));
      goto LABEL_7;
    }
    v10 = objc_claimAutoreleasedReturnValue(-[STUConfigurationManager activeUserIdentifier](self, "activeUserIdentifier"));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCRKEDUSingleUserIdentifierKey));
  }
  v11 = (void *)v10;
  v12 = objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDictionaryWithIdentifier:inConfiguration:](self, "userDictionaryWithIdentifier:inConfiguration:", v10, v4));
LABEL_7:
  v15 = (void *)v12;

  return v15;
}

- (id)studentInformationForProfileConfiguration:(id)a3
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager defaultUserDictionaryForProfileConfiguration:](self, "defaultUserDictionaryForProfileConfiguration:", a3));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = kCRKEDUUserNameKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUUserNameKey));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, kCRKAdHocConfigurationStudentDisplayNameKey);

    }
    v8 = kCRKEDUUserGivenNameKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUUserGivenNameKey));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v8));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, kCRKAdHocConfigurationStudentGivenNameKey);

    }
    v11 = kCRKEDUUserFamilyNameKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUUserFamilyNameKey));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, kCRKAdHocConfigurationStudentFamilyNameKey);

    }
    v14 = kCRKEDUUserImageURLKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUUserImageURLKey));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v14));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, kCRKAdHocConfigurationStudentImageURLKey);

    }
    v17 = kCRKEDUUserPhoneticGivenNameKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUUserPhoneticGivenNameKey));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v17));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, kCRKAdHocConfigurationStudentPhoneticGivenNameKey);

    }
    v20 = kCRKEDUUserPhoneticFamilyNameKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUUserPhoneticFamilyNameKey));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v20));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, kCRKAdHocConfigurationStudentPhoneticFamilyNameKey);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)defaultAdHocProfile
{
  uint64_t v3;
  void *v4;

  v3 = kCRKAdHocConfigurationAutoAssistEnabledKey;
  v4 = &__kCFBooleanTrue;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

- (BOOL)writeAdHocConfiguration:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
  v6 = objc_msgSend(v5, "stu_setPlistObject:forKey:", v4, CFSTR("AdHocConfiguration.plist"));

  return v6;
}

- (id)adHocEnrollmentRecordsByGroupIdentifier
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  STUControlGroupEnrollmentRecord *v14;
  STUControlGroupEnrollmentRecord *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocBaseUserIdentifier](self, "adHocBaseUserIdentifier"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stu_plistObjectForKey:", CFSTR("AdHocEnrollmentRecords.plist")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = -[STUControlGroupEnrollmentRecord initWithDictionary:type:hidden:]([STUControlGroupEnrollmentRecord alloc], "initWithDictionary:type:hidden:", v12, 1, 0);
        v15 = v14;
        if (v14)
        {
          if (v4)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord rollingCourseIdentitySet](v14, "rollingCourseIdentitySet"));
            objc_msgSend(v16, "setUserIdentifier:", v4);

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupIdentifier](v15, "groupIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, v17);

        }
        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v18 = -[NSMutableDictionary copy](v3, "copy");
  return v18;
}

- (void)setAdHocEnrollmentRecordsByGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager adHocEnrollmentRecordsByGroupIdentifier](self, "adHocEnrollmentRecordsByGroupIdentifier"));
  -[STUConfigurationManager removeStaleStudentImagesWithOldEnrollmentRecords:newEnrollmentRecords:](self, "removeStaleStudentImagesWithOldEnrollmentRecords:newEnrollmentRecords:", v5, v4);

  v6 = objc_opt_new(NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDataStore](self, "userDataStore"));
  objc_msgSend(v16, "stu_setPlistObject:forKey:", v6, CFSTR("AdHocEnrollmentRecords.plist"));

}

- (void)removeStaleStudentImagesWithOldEnrollmentRecords:(id)a3 newEnrollmentRecords:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  id v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];

  v5 = a3;
  v49 = a4;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v46 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v62;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v62 != v48)
          objc_enumerationMutation(obj);
        v51 = v6;
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v8));

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupUser"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupUser"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageIdentifier"));
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = 0;
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userImageStore](self, "userImageStore"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupUser"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageIdentifier"));
          v60 = 0;
          v19 = objc_msgSend(v16, "removeDataForKey:error:", v18, &v60);
          v15 = v60;

          if ((v19 & 1) == 0)
          {
            v20 = sub_10006B900();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupUser"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "imageIdentifier"));
              *(_DWORD *)buf = 138543618;
              v67 = v45;
              v68 = 2114;
              v69 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to remove student image for enrollment record. Image identifier %{public}@. Error: %{public}@", buf, 0x16u);

            }
          }
        }
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instructorsByIdentifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allValues"));

        v54 = v23;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v57;
          do
          {
            v27 = 0;
            v53 = v25;
            do
            {
              if (*(_QWORD *)v57 != v26)
                objc_enumerationMutation(v54);
              v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instructorsByIdentifier"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userIdentifier"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", v30));

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageIdentifier"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "imageIdentifier"));
              v34 = objc_msgSend(v32, "isEqualToString:", v33);

              if ((v34 & 1) == 0)
              {
                v35 = v26;
                v36 = v9;
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userImageStore](self, "userImageStore"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageIdentifier"));
                v55 = v15;
                v39 = objc_msgSend(v37, "removeDataForKey:error:", v38, &v55);
                v40 = v55;

                if ((v39 & 1) == 0)
                {
                  v41 = sub_10006B900();
                  v42 = objc_claimAutoreleasedReturnValue(v41);
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageIdentifier"));
                    *(_DWORD *)buf = 138543618;
                    v67 = v43;
                    v68 = 2114;
                    v69 = v40;
                    _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to remove instructor image for enrollment record. Image identifier %{public}@. Error: %{public}@", buf, 0x16u);

                  }
                }
                v15 = v40;
                v9 = v36;
                v26 = v35;
                v25 = v53;
              }

              v27 = (char *)v27 + 1;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          }
          while (v25);
        }

        v6 = v51 + 1;
      }
      while ((id)(v51 + 1) != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v50);
  }

}

- (BOOL)setAuxiliaryUsers:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager systemDataStore](self, "systemDataStore"));
  v6 = objc_msgSend(v5, "stu_setPlistObject:forKey:", v4, CFSTR("AuxiliaryUsers.plist"));

  return v6;
}

- (id)auxiliaryUsersByIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager systemDataStore](self, "systemDataStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stu_plistObjectForKey:", CFSTR("AuxiliaryUsers.plist")));

  return v3;
}

- (BOOL)setAuxiliaryEnrolledGroupsByUserIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager systemDataStore](self, "systemDataStore"));
  v6 = objc_msgSend(v5, "stu_setPlistObject:forKey:", v4, CFSTR("AuxiliaryEnrollment.plist"));

  return v6;
}

- (id)auxiliaryEnrolledGroupsByUserIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager systemDataStore](self, "systemDataStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stu_plistObjectForKey:", CFSTR("AuxiliaryEnrollment.plist")));

  return v3;
}

- (id)userDictionaryWithAppleID:(id)a3 inConfiguration:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", kCRKEDUUsersKey, 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = kCRKEDUUserAppleIDKey;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) != 0)
        {
          v15 = v12;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)userDictionaryWithIdentifier:(id)a3 inConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCRKEDUUsersKey, 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      v12 = kCRKEDUUserIdentifierKey;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));
          v16 = objc_msgSend(v15, "isEqualToString:", v5);

          if ((v16 & 1) != 0)
          {
            v17 = v14;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_12:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)enrollmentRecordsByGroupIdentifierInConfiguration:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSMutableDictionary *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  STURollingCourseIdentitySet *v32;
  void *v33;
  STURollingCourseIdentitySet *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  STUControlGroupEnrollmentRecord *v50;
  id v51;
  STUControlGroupEnrollmentRecord *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *j;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  NSMutableDictionary *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  id obj;
  STURollingCourseIdentitySet *v75;
  id v76;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKEDUOrganizationUUIDKey));
  if (v6)
    v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v6);
  else
    v7 = 0;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKEDUPayloadLeaderCertificateAnchorPersistentIDKey));
  if (v7)
  {
    v62 = v6;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager defaultUserDictionaryForProfileConfiguration:](self, "defaultUserDictionaryForProfileConfiguration:", v5));
    v76 = objc_msgSend(objc_alloc((Class)CRKUser), "initWithDictionary:", v61);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "userIdentifier"));
    if (a4)
    {
      v9 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager profileConfigurationMetadata](self, "profileConfigurationMetadata"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

    }
    v73 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
    v63 = objc_msgSend(v12, "mutableCopy");

    v64 = objc_opt_new(NSMutableDictionary);
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKEDUGroupsKey));
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
    if (v79)
    {
      v13 = *(_QWORD *)v93;
      v14 = kCRKEDUGroupMemberIdentifiersKey;
      v69 = kCRKEDUGroupNameKey;
      v68 = kCRKEDUGroupDescriptionKey;
      v67 = kCRKEDUGroupBeaconIDKey;
      v66 = kCRKEDUGroupLeaderIdentifiersKey;
      v71 = *(_QWORD *)v93;
      v72 = v8;
      v78 = v9;
      v70 = kCRKEDUGroupMemberIdentifiersKey;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v93 != v13)
            objc_enumerationMutation(obj);
          v83 = v15;
          v16 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v14));
          v18 = objc_msgSend(v17, "containsObject:", v8);

          if (v18)
          {
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v69));
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v68));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v67));
            v19 = objc_opt_new(NSMutableDictionary);
            v88 = 0u;
            v89 = 0u;
            v90 = 0u;
            v91 = 0u;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v66));
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v89;
              do
              {
                for (i = 0; i != v22; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v89 != v23)
                    objc_enumerationMutation(v20);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDictionaryWithIdentifier:inConfiguration:](self, "userDictionaryWithIdentifier:inConfiguration:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i), v5));
                  v26 = objc_msgSend(objc_alloc((Class)CRKUser), "initWithDictionary:", v25);
                  v27 = v26;
                  if (v26)
                  {
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userIdentifier"));

                    if (v28)
                    {
                      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "userIdentifier"));
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v27, v29);

                    }
                  }

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
              }
              while (v22);
            }

            v30 = objc_msgSend(objc_alloc((Class)DMFControlGroupIdentifier), "initWithOrganizationUUID:groupID:", v73, (unsigned __int16)objc_msgSend(v82, "unsignedIntValue"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager rollingDeviceIdentitySetForEnrollmentRecordType:](self, "rollingDeviceIdentitySetForEnrollmentRecordType:", a4));
            v32 = [STURollingCourseIdentitySet alloc];
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "userIdentifier"));
            v34 = -[STURollingCourseIdentitySet initWithRollingIdentity:userIdentifier:groupIdentifier:](v32, "initWithRollingIdentity:userIdentifier:groupIdentifier:", v31, v33, v30);

            if (v30)
            {
              v75 = v34;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringValue"));
              objc_msgSend(v63, "removeObject:", v35);

              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringValue"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", v36));

              v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("mascotType")));
              if (!v38
                || (v39 = (void *)v38,
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("colorType"))),
                    v40,
                    v39,
                    !v40))
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v37));
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("mascotType")));

                if (!v42)
                  objc_msgSend(v41, "setObject:forKeyedSubscript:", &off_1000D4248, CFSTR("mascotType"));
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("colorType")));

                if (!v43)
                  objc_msgSend(v41, "setObject:forKeyedSubscript:", &off_1000D4248, CFSTR("colorType"));
                v44 = objc_msgSend(v41, "copy");

                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringValue"));
                objc_msgSend(v78, "setObject:forKeyedSubscript:", v44, v45);

                v37 = v44;
              }
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("mascotType")));
              v47 = objc_msgSend(v46, "unsignedIntegerValue");

              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("colorType")));
              v49 = objc_msgSend(v48, "unsignedIntegerValue");

              v50 = [STUControlGroupEnrollmentRecord alloc];
              LOBYTE(v60) = 0;
              LOBYTE(v59) = 0;
              v51 = v49;
              v34 = v75;
              v52 = -[STUControlGroupEnrollmentRecord initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:](v50, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:", v30, v81, v80, v47, v51, v75, v19, v65, v76, v59, 0, a4, v60);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v64, "setObject:forKeyedSubscript:", v52, v30);

            }
            v13 = v71;
            v8 = v72;
            v9 = v78;
            v14 = v70;
          }
          v15 = v83 + 1;
        }
        while ((id)(v83 + 1) != v79);
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
      }
      while (v79);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v53 = v63;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v55; j = (char *)j + 1)
        {
          if (*(_QWORD *)v85 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)j));
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
      }
      while (v55);
    }

    if (!a4)
      -[STUConfigurationManager setProfileConfigurationMetadata:updateEffectiveConfiguration:](self, "setProfileConfigurationMetadata:updateEffectiveConfiguration:", v9, 0);
    v10 = -[NSMutableDictionary copy](v64, "copy");

    v6 = v62;
    v7 = v73;
  }
  else
  {
    v10 = &__NSDictionary0__struct;
  }

  return v10;
}

- (id)rollingDeviceIdentitySetForEnrollmentRecordType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  SEL v9;
  STUConfigurationManager *v10;
  uint64_t v11;

  if (a3 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = v6;
    v8 = CFSTR("ASM does not support rolling identity sets. Instead, ASM identities come from the roster.");
    v9 = a2;
    v10 = self;
    v11 = 1393;
LABEL_6:
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("STUConfigurationManager.m"), v11, v8);

    v5 = 0;
    return v5;
  }
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = v6;
    v8 = CFSTR("Cannot return device private identity for invalid type");
    v9 = a2;
    v10 = self;
    v11 = 1397;
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager managedRollingDeviceIdentitySet](self, "managedRollingDeviceIdentitySet"));
  return v5;
}

- (BOOL)hasNonSynthesizedEnrollmentRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager groupEnrollmentRecords](self, "groupEnrollmentRecords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("groupIdentifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager synthesizedEnrollmentRecords](self, "synthesizedEnrollmentRecords"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("groupIdentifier")));

  objc_msgSend(v5, "minusSet:", v7);
  LOBYTE(v6) = objc_msgSend(v5, "count") != 0;

  return (char)v6;
}

- (id)synthesizedEnrollmentRecords
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUControlGroupEnrollmentRecord managedXPCEnrollmentRecord](STUControlGroupEnrollmentRecord, "managedXPCEnrollmentRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[STUControlGroupEnrollmentRecord adHocXPCEnrollmentRecord](STUControlGroupEnrollmentRecord, "adHocXPCEnrollmentRecord", v2));
  v8[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STUControlGroupEnrollmentRecord asmXPCEnrollmentRecord](STUControlGroupEnrollmentRecord, "asmXPCEnrollmentRecord"));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  return v6;
}

- (id)removalDateFromBaseDate:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v4, "setDay:", CRKClassroomEnrollmentRecordMaxDaysBeforeCleanup);
  v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v4, v3, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startOfDayForDate:", v6));
  return v7;
}

- (id)managedXPCContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  STUSystemClockDateProvider *v8;
  STUTaskOperationContext *v9;
  void *v10;
  void *v11;
  void *v12;
  STUTaskOperationContext *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[STUControlGroupEnrollmentRecord managedXPCEnrollmentRecord](STUControlGroupEnrollmentRecord, "managedXPCEnrollmentRecord"));
  v4 = objc_alloc((Class)DMFControlSessionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  v7 = objc_msgSend(v4, "initWithString:", v6);

  v8 = objc_opt_new(STUSystemClockDateProvider);
  v9 = [STUTaskOperationContext alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUSystemClockDateProvider distantPast](v8, "distantPast"));
  v13 = -[STUTaskOperationContext initWithConfigurationManager:sessionInfo:sessionIdentifier:enrollmentRecord:tokenAuthenticator:sessionToken:courseFirstSeenDate:dateProvider:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:operationQueue:studentIdentity:IDSMessageBroadcaster:keychain:screenshotServiceProxy:serverResourceCache:featureDataStore:lockScreenMonitor:daemon:device:primitives:classSessionReporter:applicationWorkspace:idleStateProvider:signInHistoryStorage:classKitReSyncer:](v9, "initWithConfigurationManager:sessionInfo:sessionIdentifier:enrollmentRecord:tokenAuthenticator:sessionToken:courseFirstSeenDate:dateProvider:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:operationQueue:studentIdentity:IDSMessageBroadcaster:keychain:screenshotServiceProxy:serverResourceCache:featureDataStore:lockScreenMonitor:daemon:device:primitives:classSessionReporter:applicationWorkspace:idleStateProvider:signInHistoryStorage:classKitReSyncer:", self, 0, v7, v3, 0, v11, v12, v8, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0);

  return v13;
}

- (id)userDictionaryWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v12;
  NSString *v13;
  void *v14;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
  v8 = objc_msgSend(v7, "isLoginUser");

  if ((v8 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 1465, CFSTR("%@ can only be called from the login window"), v14);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager effectiveManagedConfiguration](self, "effectiveManagedConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDictionaryWithIdentifier:inConfiguration:](self, "userDictionaryWithIdentifier:inConfiguration:", v5, v9));

  return v10;
}

- (BOOL)upsertUserDictionary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v16;
  NSString *v17;
  void *v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
  v8 = objc_msgSend(v7, "isLoginUser");

  if ((v8 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 1471, CFSTR("%@ can only be called from the login window"), v18);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCRKEDUUserIdentifierKey));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager profileConfiguration](self, "profileConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager userDictionaryWithIdentifier:inConfiguration:](self, "userDictionaryWithIdentifier:inConfiguration:", v9, v10));

    v12 = v11 == 0;
    if (!v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager auxiliaryUsersByIdentifier](self, "auxiliaryUsersByIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));

      objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, v9);
      -[STUConfigurationManager setAuxiliaryUsers:](self, "setAuxiliaryUsers:", v14);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addEnrolledControlGroupIdentifiers:(id)a3 forUserWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentUser"));
  v11 = objc_msgSend(v10, "isLoginUser");

  if ((v11 & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v24 = NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 1490, CFSTR("%@ can only be called from the login window"), v25);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager auxiliaryEnrolledGroupsByUserIdentifier](self, "auxiliaryEnrolledGroupsByUserIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v14));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v20), "stringValue"));
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v8);

  -[STUConfigurationManager setAuxiliaryEnrolledGroupsByUserIdentifier:](self, "setAuxiliaryEnrolledGroupsByUserIdentifier:", v13);
}

- (id)groupNameWithBeaconID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v25;
  NSString *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
  v8 = objc_msgSend(v7, "isLoginUser");

  if ((v8 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConfigurationManager.m"), 1505, CFSTR("%@ can only be called from the login window"), v27);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager effectiveManagedConfiguration](self, "effectiveManagedConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kCRKEDUGroupsKey));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    v15 = kCRKEDUGroupBeaconIDKey;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));
        v19 = objc_msgSend(v18, "isEqual:", v5);

        if ((v19 & 1) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kCRKEDUGroupNameKey));
          v22 = (void *)v21;
          v23 = &stru_1000CDD50;
          if (v21)
            v23 = (__CFString *)v21;
          v20 = v23;

          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v13)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_15:

  return v20;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a4;
  if (a6 == CFSTR("ObservationContext"))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager ASMCourseLibrary](self, "ASMCourseLibrary"));

    if (v11 == v10)
    {
      -[STUConfigurationManager updateEffectiveConfiguration](self, "updateEffectiveConfiguration");
    }
    else
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[STUConfigurationManager meCardUserProvider](self, "meCardUserProvider"));

      if (v12 == v10)
        -[STUConfigurationManager updateMeCardInfo](self, "updateMeCardInfo");
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STUConfigurationManager;
    -[STUConfigurationManager observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }

}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (NSDictionary)adHocDefaultStudentInformation
{
  return self->_adHocDefaultStudentInformation;
}

- (void)setAdHocDefaultStudentInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)adHocBaseUserIdentifier
{
  return self->_adHocBaseUserIdentifier;
}

- (void)setAdHocBaseUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasIdentities
{
  return self->_hasIdentities;
}

- (void)setHasIdentities:(BOOL)a3
{
  self->_hasIdentities = a3;
}

- (BOOL)isInstructorOnEDU
{
  return self->_isInstructorOnEDU;
}

- (void)setIsInstructorOnEDU:(BOOL)a3
{
  self->_isInstructorOnEDU = a3;
}

- (NSSet)groupEnrollmentRecords
{
  return self->_groupEnrollmentRecords;
}

- (void)setGroupEnrollmentRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (STUASMCourseLibrary)ASMCourseLibrary
{
  return self->_ASMCourseLibrary;
}

- (BOOL)isSignedInToStudentMAID
{
  return self->_signedInToStudentMAID;
}

- (void)setSignedInToStudentMAID:(BOOL)a3
{
  self->_signedInToStudentMAID = a3;
}

- (STUConfigurationDataStoreProtocol)systemDataStore
{
  return self->_systemDataStore;
}

- (void)setSystemDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_systemDataStore, a3);
}

- (STUConfigurationDataStoreProtocol)userDataStore
{
  return self->_userDataStore;
}

- (void)setUserDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_userDataStore, a3);
}

- (CRKKeyedDataStoreProtocol)userImageStore
{
  return self->_userImageStore;
}

- (void)setUserImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_userImageStore, a3);
}

- (STUMobileKeyBagPrimitives)mobileKeyBagPrimitives
{
  return self->_mobileKeyBagPrimitives;
}

- (CRKCancelable)firstUnlockSubscription
{
  return self->_firstUnlockSubscription;
}

- (void)setFirstUnlockSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockSubscription, a3);
}

- (NSCache)credentialCache
{
  return self->_credentialCache;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CRKIdentity)managedIdentity
{
  return self->_managedIdentity;
}

- (void)setManagedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_managedIdentity, a3);
}

- (NSArray)managedAnchorPersistentIDs
{
  return self->_managedAnchorPersistentIDs;
}

- (void)setManagedAnchorPersistentIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)resourcePersistentID
{
  return self->_resourcePersistentID;
}

- (void)setResourcePersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)adHocConfigAllowsAutomaticallyJoinClasses
{
  return self->_adHocConfigAllowsAutomaticallyJoinClasses;
}

- (void)setAdHocConfigAllowsAutomaticallyJoinClasses:(BOOL)a3
{
  self->_adHocConfigAllowsAutomaticallyJoinClasses = a3;
}

- (NSDictionary)groupEnrollmentRecordsByGroupIdentifier
{
  return self->_groupEnrollmentRecordsByGroupIdentifier;
}

- (void)setGroupEnrollmentRecordsByGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSUUID)managedOrganizationUUID
{
  return self->_managedOrganizationUUID;
}

- (void)setManagedOrganizationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)activeUserIdentifier
{
  return self->_activeUserIdentifier;
}

- (STURollingDeviceIdentitySet)managedRollingDeviceIdentitySet
{
  return self->_managedRollingDeviceIdentitySet;
}

- (void)setManagedRollingDeviceIdentitySet:(id)a3
{
  objc_storeStrong((id *)&self->_managedRollingDeviceIdentitySet, a3);
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (CRKUserProviding)meCardUserProvider
{
  return self->_meCardUserProvider;
}

- (CRKFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)installedEDUProfile
{
  return self->_installedEDUProfile;
}

- (void)setInstalledEDUProfile:(BOOL)a3
{
  self->_installedEDUProfile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_meCardUserProvider, 0);
  objc_storeStrong((id *)&self->_featureDataStore, 0);
  objc_storeStrong((id *)&self->_managedRollingDeviceIdentitySet, 0);
  objc_storeStrong((id *)&self->_activeUserIdentifier, 0);
  objc_storeStrong((id *)&self->_managedOrganizationUUID, 0);
  objc_storeStrong((id *)&self->_groupEnrollmentRecordsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_resourcePersistentID, 0);
  objc_storeStrong((id *)&self->_managedAnchorPersistentIDs, 0);
  objc_storeStrong((id *)&self->_managedIdentity, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_credentialCache, 0);
  objc_storeStrong((id *)&self->_firstUnlockSubscription, 0);
  objc_storeStrong((id *)&self->_mobileKeyBagPrimitives, 0);
  objc_storeStrong((id *)&self->_userImageStore, 0);
  objc_storeStrong((id *)&self->_userDataStore, 0);
  objc_storeStrong((id *)&self->_systemDataStore, 0);
  objc_storeStrong((id *)&self->_ASMCourseLibrary, 0);
  objc_storeStrong((id *)&self->_groupEnrollmentRecords, 0);
  objc_storeStrong((id *)&self->_adHocBaseUserIdentifier, 0);
  objc_storeStrong((id *)&self->_adHocDefaultStudentInformation, 0);
}

@end
