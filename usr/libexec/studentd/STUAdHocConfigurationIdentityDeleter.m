@implementation STUAdHocConfigurationIdentityDeleter

- (STUAdHocConfigurationIdentityDeleter)init
{
  NSSet *v3;
  STUAdHocConfigurationIdentityDeleter *v4;

  v3 = objc_opt_new(NSSet);
  v4 = -[STUAdHocConfigurationIdentityDeleter initWithConfiguration:claimedIdentityPersistentIDs:](self, "initWithConfiguration:claimedIdentityPersistentIDs:", &__NSDictionary0__struct, v3);

  return v4;
}

- (STUAdHocConfigurationIdentityDeleter)initWithConfiguration:(id)a3 enrollmentRecords:(id)a4
{
  id v6;
  id v7;
  STUClaimedIdentityPersistentIDs *v8;
  void *v9;
  STUAdHocConfigurationIdentityDeleter *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[STUClaimedIdentityPersistentIDs initWithEnrollmentRecords:]([STUClaimedIdentityPersistentIDs alloc], "initWithEnrollmentRecords:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUClaimedIdentityPersistentIDs persistentIDs](v8, "persistentIDs"));
  v10 = -[STUAdHocConfigurationIdentityDeleter initWithConfiguration:claimedIdentityPersistentIDs:](self, "initWithConfiguration:claimedIdentityPersistentIDs:", v7, v9);

  return v10;
}

- (STUAdHocConfigurationIdentityDeleter)initWithConfiguration:(id)a3 claimedIdentityPersistentIDs:(id)a4
{
  id v6;
  id v7;
  STUAdHocConfigurationIdentityDeleter *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *mutableConfiguration;
  NSSet *v11;
  NSSet *claimedIdentityPersistentIDs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUAdHocConfigurationIdentityDeleter;
  v8 = -[STUAdHocConfigurationIdentityDeleter init](&v14, "init");
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    mutableConfiguration = v8->_mutableConfiguration;
    v8->_mutableConfiguration = v9;

    v11 = (NSSet *)objc_msgSend(v7, "copy");
    claimedIdentityPersistentIDs = v8->_claimedIdentityPersistentIDs;
    v8->_claimedIdentityPersistentIDs = v11;

  }
  return v8;
}

- (id)deleteIdentities
{
  void *v3;
  id v4;

  -[STUAdHocConfigurationIdentityDeleter performDeletion](self, "performDeletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter mutableConfiguration](self, "mutableConfiguration"));
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (void)performDeletion
{
  -[STUAdHocConfigurationIdentityDeleter deleteStandaloneIdentityPersistentID](self, "deleteStandaloneIdentityPersistentID");
  -[STUAdHocConfigurationIdentityDeleter deleteStandaloneStagedPersistentID](self, "deleteStandaloneStagedPersistentID");
  -[STUAdHocConfigurationIdentityDeleter deleteRollingIdentitySet](self, "deleteRollingIdentitySet");
}

- (void)deleteStandaloneIdentityPersistentID
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter fetchAndNilOutObjectForKey:](self, "fetchAndNilOutObjectForKey:", kCRKAdHocConfigurationStudentIdentityPersistentIDKey));
  if (v3)
  {
    v4 = sub_100053A00();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting old standalone identity persistent ID from ad-hoc configuration", v6, 2u);
    }

    -[STUAdHocConfigurationIdentityDeleter deletePersistentIDIfNeeded:](self, "deletePersistentIDIfNeeded:", v3);
  }

}

- (void)deleteStandaloneStagedPersistentID
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter fetchAndNilOutObjectForKey:](self, "fetchAndNilOutObjectForKey:", kCRKAdHocConfigurationStagedStudentIdentityPersistentIDKey));
  if (v3)
  {
    v4 = sub_100053A00();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting old standalone staged identity persistent ID from ad-hoc configuration", v6, 2u);
    }

    -[STUAdHocConfigurationIdentityDeleter deletePersistentIDIfNeeded:](self, "deletePersistentIDIfNeeded:", v3);
  }

}

- (void)deleteRollingIdentitySet
{
  void *v3;
  id v4;
  NSObject *v5;
  STURollingDeviceIdentitySet *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter fetchAndNilOutObjectForKey:](self, "fetchAndNilOutObjectForKey:", kCRKAdHocConfigurationRollingDeviceIdentitySetKey));
  if (v3)
  {
    v4 = sub_100053A00();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting device rolling identity set from ad-hoc configuration", v9, 2u);
    }

    v6 = -[STURollingUserIdentitySet initWithDictionary:]([STURollingDeviceIdentitySet alloc], "initWithDictionary:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet activeIdentityPersistentID](v6, "activeIdentityPersistentID"));
    -[STUAdHocConfigurationIdentityDeleter deletePersistentIDIfNeeded:](self, "deletePersistentIDIfNeeded:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet stagedIdentityPersistentID](v6, "stagedIdentityPersistentID"));
    -[STUAdHocConfigurationIdentityDeleter deletePersistentIDIfNeeded:](self, "deletePersistentIDIfNeeded:", v8);

  }
}

- (id)fetchAndNilOutObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter mutableConfiguration](self, "mutableConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter mutableConfiguration](self, "mutableConfiguration"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v4);

  return v6;
}

- (void)deletePersistentIDIfNeeded:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[STUAdHocConfigurationIdentityDeleter isPersistentIDClaimed:](self, "isPersistentIDClaimed:", v4);
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keychain"));

      objc_msgSend(v7, "removeItemWithPersistentID:", v8);
      v4 = v8;
    }
  }

}

- (BOOL)isPersistentIDClaimed:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAdHocConfigurationIdentityDeleter claimedIdentityPersistentIDs](self, "claimedIdentityPersistentIDs"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)claimedIdentityPersistentIDs
{
  return self->_claimedIdentityPersistentIDs;
}

- (NSMutableDictionary)mutableConfiguration
{
  return self->_mutableConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableConfiguration, 0);
  objc_storeStrong((id *)&self->_claimedIdentityPersistentIDs, 0);
}

@end
