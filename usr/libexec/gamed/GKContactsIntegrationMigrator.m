@implementation GKContactsIntegrationMigrator

- (GKContactsIntegrationMigrator)initWithUserDefaults:(id)a3
{
  id v5;
  GKContactsIntegrationMigrator *v6;
  GKContactsIntegrationMigrator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKContactsIntegrationMigrator;
  v6 = -[GKContactsIntegrationMigrator init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userDefaults, a3);

  return v7;
}

- (void)performMigrationsWithContext:(id)a3 list:(id)a4
{
  id v6;
  id v7;
  void *v8;
  signed __int16 v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "version"));
  v9 = (unsigned __int16)objc_msgSend(v8, "intValue");

  if (GKCDContactInfoListCurrentVersion > v9)
  {
    if (!os_log_GKGeneral)
      v11 = (id)GKOSLoggers(v10);
    v12 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_100118C94(v12, v13, v14, v15, v16, v17, v18, v19);
    objc_msgSend(v7, "setChangeHistoryToken:", 0);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationMigrator userDefaults](self, "userDefaults"));
  v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("GKContactsIntegrationHasMigratedCredentials"));

  if ((v21 & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v23 = (id)GKOSLoggers(v22);
    v24 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_100118C60(v24, v25, v26, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:](GKPlayerProfileCacheObject, "localPlayerInManagedObjectContext:", v6));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contactsAssociationID"));
    v36 = objc_msgSend(v32, "contactsIntegrationConsent");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "serviceLastUpdatedTimestamp"));
    objc_msgSend(v34, "setContactAssociationID:contactIntegrationConsent:serviceLastUpdateTimestamp:forEnvironment:forcefully:completionHandler:", v35, v36, v37, objc_msgSend(v33, "environment"), 1, &stru_1002C3DB8);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationMigrator userDefaults](self, "userDefaults"));
    objc_msgSend(v38, "setBool:forKey:", 1, CFSTR("GKContactsIntegrationHasMigratedCredentials"));

  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
