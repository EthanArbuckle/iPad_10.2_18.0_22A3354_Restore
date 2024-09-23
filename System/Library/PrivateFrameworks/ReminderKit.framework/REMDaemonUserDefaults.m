@implementation REMDaemonUserDefaults

- (NSDate)lastDismissedNotificationsPermissionInlineRequestDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastDismissedNotificationsPermissionInlineRequestDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSNumber)tipKitCachedCountOfListsWithCustomBadge
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tipKitCachedCountOfListsWithCustomBadge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSURL)preferredDefaultListObjectIDUrl
{
  void *v2;
  void *v3;
  void *v4;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("preferredDefaultListObjectIDUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSNumber)tipKitCachedCountOfCustomSmartLists
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tipKitCachedCountOfCustomSmartLists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfCustomSmartLists:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("tipKitCachedCountOfCustomSmartLists"));

}

- (void)setTipKitCachedCountOfListsWithCustomBadge:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("tipKitCachedCountOfListsWithCustomBadge"));

}

- (REMDaemonUserDefaults)initWithSuiteName:(id)a3 containerURL:(id)a4
{
  REMDaemonUserDefaults *v4;
  REMDaemonUserDefaults *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)REMDaemonUserDefaults;
  v4 = -[REMUserDefaults initWithSuiteName:containerURL:](&v10, sel_initWithSuiteName_containerURL_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[REMUserDefaults userDefaults](v4, "userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMDaemonUserDefaults defaultValues](REMDaemonUserDefaults, "defaultValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerDefaults:", v7);

    -[REMUserDefaults userDefaults](v5, "userDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMUserDefaults setShowRemindersAsOverdue_cached:](v5, "setShowRemindersAsOverdue_cached:", objc_msgSend(v8, "BOOLForKey:", CFSTR("showRemindersAsOverdue")));

  }
  return v5;
}

- (void)setTipKitCachedCountOfHashtags:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("tipKitCachedCountOfHashtags"));

}

- (NSNumber)tipKitCachedCountOfHashtags
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tipKitCachedCountOfHashtags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)remCurrentRuntimeVersionDebuggingOverride
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("remCurrentRuntimeVersionDebuggingOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (id)defaultValues
{
  return &unk_1E6837048;
}

- (NSData)hashtagLabelsInCustomSmartListFilterCache
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("hashtagLabelsInCustomSmartListFilterCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)accountsListCategorizedCountsCache
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("accountsListCategorizedCountsCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)newAppShouldTakeoverEKReminderNotifications
{
  return 1;
}

- (BOOL)dataaccessDaemonStopSyncingReminders
{
  return 1;
}

- (BOOL)siriShouldRouteIntentsToNewRemindersApp
{
  return 1;
}

- (BOOL)databaseMigrationTestModeEnabled
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("databaseMigrationTestModeEnabled"));

  return v3;
}

- (void)setDatabaseMigrationTestModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("databaseMigrationTestModeEnabled"));

}

- (BOOL)isDatabaseMigrated
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("isDatabaseMigrated"));

  return v3;
}

- (void)setIsDatabaseMigrated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("isDatabaseMigrated"));

}

- (BOOL)databaseMigrationTimedOut
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("databaseMigrationTimedOut"));

  return v3;
}

- (void)setDatabaseMigrationTimedOut:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("databaseMigrationTimedOut"));

}

- (NSString)lastDatabaseMigrationSystemBuildVersion
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("lastDatabaseMigrationSystemBuildVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLastDatabaseMigrationSystemBuildVersion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastDatabaseMigrationSystemBuildVersion"));

}

- (NSNumber)cloudKitMigrationMaxNumInvocations
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMigrationMaxNumInvocations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationMaxNumInvocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMigrationMaxNumInvocations"));

}

- (NSNumber)cloudKitMigrationMaxNumFailures
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMigrationMaxNumFailures"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationMaxNumFailures:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMigrationMaxNumFailures"));

}

- (NSNumber)cloudKitMigrationDelayAfterError
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMigrationDelayAfterError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationDelayAfterError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMigrationDelayAfterError"));

}

- (NSNumber)cloudKitMigrationObserverPollingInterval
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMigrationObserverPollingInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationObserverPollingInterval:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMigrationObserverPollingInterval"));

}

- (NSNumber)cloudKitMigrationSimulatedError
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMigrationSimulatedError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationSimulatedError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMigrationSimulatedError"));

}

- (NSNumber)cloudKitResultsLimitPerSyncOperation
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitResultsLimitPerSyncOperation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitResultsLimitPerSyncOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitResultsLimitPerSyncOperation"));

}

- (BOOL)cloudKitMigrationDisableCleanUp
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("cloudKitMigrationDisableCleanUp"));

  return v3;
}

- (void)setCloudKitMigrationDisableCleanUp:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("cloudKitMigrationDisableCleanUp"));

}

- (REMObjectID)preferredDefaultListID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("preferredDefaultListID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[REMObjectID objectIDWithURL:](REMObjectID, "objectIDWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (REMObjectID *)v5;
}

- (void)setPreferredDefaultListID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  -[REMDaemonUserDefaults deletePreferredDefaultListObjectIDUrl](self, "deletePreferredDefaultListObjectIDUrl");
  objc_msgSend(v4, "urlRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("preferredDefaultListID"));

  +[REMLog utility](REMLog, "utility");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for preferredDefaultListID to paired device.", v12, 2u);
  }

  v9 = (void *)objc_opt_new();
  -[REMUserDefaults suiteName](self, "suiteName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836E68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronizeUserDefaultsDomain:keys:", v10, v11);

}

- (void)deletePreferredDefaultListID
{
  id v3;

  -[REMDaemonUserDefaults deletePreferredDefaultListObjectIDUrl](self, "deletePreferredDefaultListObjectIDUrl");
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("preferredDefaultListID"));

}

- (void)deletePreferredDefaultListObjectIDUrl
{
  id v2;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("preferredDefaultListObjectIDUrl"));

}

- (id)observePreferredDefaultListIDWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__REMDaemonUserDefaults_observePreferredDefaultListIDWithBlock___block_invoke;
  v8[3] = &unk_1E67F8868;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startObservingValuesForKey:block:](self, "_startObservingValuesForKey:block:", CFSTR("preferredDefaultListID"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __64__REMDaemonUserDefaults_observePreferredDefaultListIDWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "preferredDefaultListID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setPreferredDefaultListObjectIDUrl:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("preferredDefaultListObjectIDUrl"));

}

- (NSArray)preferredLocalizations
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("preferredLocalizations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setPreferredLocalizations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("preferredLocalizations"));

}

- (NSString)acAccountIdentifierToMergeLocalDataIntoSyncData
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("acAccountIdentifierToMergeLocalDataIntoSyncData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAcAccountIdentifierToMergeLocalDataIntoSyncData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("acAccountIdentifierToMergeLocalDataIntoSyncData"));

}

- (NSArray)acAccountIdentifiersToMigrateInactivatedCalDavData
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("acAccountIdentifiersToMigrateInactivatedCalDavData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setAcAccountIdentifiersToMigrateInactivatedCalDavData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("acAccountIdentifiersToMigrateInactivatedCalDavData"));

}

- (NSDate)cloudKitMergeLocalLastDateMaxRetryReached
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMergeLocalLastDateMaxRetryReached"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setCloudKitMergeLocalLastDateMaxRetryReached:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMergeLocalLastDateMaxRetryReached"));

}

- (NSString)cloudKitMergeLocalLastBuildVersionMaxRetryReached
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMergeLocalLastBuildVersionMaxRetryReached"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudKitMergeLocalLastBuildVersionMaxRetryReached:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMergeLocalLastBuildVersionMaxRetryReached"));

}

- (NSDate)cloudKitSchemaCatchUpSyncLastSuccessDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitSchemaCatchUpSyncLastSuccessDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncLastSuccessDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitSchemaCatchUpSyncLastSuccessDate"));

}

- (NSString)cloudKitSchemaCatchUpSyncLastSuccessBuildVersion
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitSchemaCatchUpSyncLastSuccessBuildVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncLastSuccessBuildVersion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitSchemaCatchUpSyncLastSuccessBuildVersion"));

}

- (NSNumber)cloudKitSchemaCatchUpSyncSchedulingState
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitSchemaCatchUpSyncSchedulingState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncSchedulingState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitSchemaCatchUpSyncSchedulingState"));

}

- (NSDate)cloudKitSchemaCatchUpSyncLastScheduledDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitSchemaCatchUpSyncLastScheduledDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncLastScheduledDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitSchemaCatchUpSyncLastScheduledDate"));

}

- (BOOL)debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling"));

  return v3;
}

- (void)setDebugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling"));

}

- (NSNumber)cloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("cloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride"));

}

- (NSNumber)debugSimulatedCKErrorCode
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("debugSimulatedCKErrorCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setDebugSimulatedCKErrorCode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("debugSimulatedCKErrorCode"));

}

- (NSNumber)spotlightIndexVersion
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("spotlightIndexVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setSpotlightIndexVersion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("spotlightIndexVersion"));

}

- (NSDate)nextScheduledAlarmDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("nextScheduledAlarmDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setNextScheduledAlarmDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("nextScheduledAlarmDate"));

}

- (NSDate)lastPresentAlarmDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastPresentAlarmDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastPresentAlarmDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastPresentAlarmDate"));

}

- (NSData)lastSuggestedAttributesAutoTrainingToken
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastSuggestedAttributesAutoTrainingToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setLastSuggestedAttributesAutoTrainingToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastSuggestedAttributesAutoTrainingToken"));

}

- (NSDate)lastSuggestedAttributesAutoTrainingExecutionDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastSuggestedAttributesAutoTrainingExecutionDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastSuggestedAttributesAutoTrainingExecutionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastSuggestedAttributesAutoTrainingExecutionDate"));

}

- (void)setSuggestedAttributesHarvestingOverrides:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("suggestedAttributesHarvestingOverrides"));

}

- (void)setMuteNotificationForSharedList:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("muteNotificationForSharedList"));

  +[REMLog utility](REMLog, "utility");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for muteNotificationForSharedList to paired device.", v10, 2u);
  }

  v7 = (void *)objc_opt_new();
  -[REMUserDefaults suiteName](self, "suiteName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836E80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeUserDefaultsDomain:keys:", v8, v9);

}

- (unint64_t)muteNotificationOptionsForSharedList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[REMDaemonUserDefaults muteNotificationForSharedList](self, "muteNotificationForSharedList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 2;

  return v7;
}

- (void)setMuteNotificationOptions:(unint64_t)a3 forSharedList:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[REMDaemonUserDefaults muteNotificationForSharedList](self, "muteNotificationForSharedList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v8, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[REMDaemonUserDefaults setMuteNotificationForSharedList:](self, "setMuteNotificationForSharedList:", v9);
}

- (void)removeMuteNotificationOptionsForSharedList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[REMDaemonUserDefaults muteNotificationForSharedList](self, "muteNotificationForSharedList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "removeObjectForKey:", v7);
    -[REMDaemonUserDefaults setMuteNotificationForSharedList:](self, "setMuteNotificationForSharedList:", v5);
  }

}

- (void)setHideEmptySectionsForGroceryList:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("hideEmptySectionsForGroceryList"));

  +[REMLog utility](REMLog, "utility");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for hideEmptySectionsForGroceryList to paired device.", v10, 2u);
  }

  v7 = (void *)objc_opt_new();
  -[REMUserDefaults suiteName](self, "suiteName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836E98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeUserDefaultsDomain:keys:", v8, v9);

}

- (void)setHideEmptySections:(BOOL)a3 forGroceryList:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  -[REMDaemonUserDefaults hideEmptySectionsForGroceryList](self, "hideEmptySectionsForGroceryList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v8, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[REMDaemonUserDefaults setHideEmptySectionsForGroceryList:](self, "setHideEmptySectionsForGroceryList:", v9);
}

- (BOOL)hideEmptySectionsForGroceryList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[REMDaemonUserDefaults hideEmptySectionsForGroceryList](self, "hideEmptySectionsForGroceryList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 1;

  return v7;
}

- (void)removeHideEmptySectionsForGroceryList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[REMDaemonUserDefaults hideEmptySectionsForGroceryList](self, "hideEmptySectionsForGroceryList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "removeObjectForKey:", v7);
    -[REMDaemonUserDefaults setHideEmptySectionsForGroceryList:](self, "setHideEmptySectionsForGroceryList:", v5);
  }

}

- (void)setBestKForKNN:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("suggestedAttributesHarvestingOverrides"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "dictionaryForKey:", CFSTR("suggestedAttributesHarvestingOverrides"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("embedding"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("embedding"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, CFSTR("neighborsToConsider"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("embedding"));
      -[REMUserDefaults userDefaults](self, "userDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("suggestedAttributesHarvestingOverrides"));

    }
    else
    {
      v19 = CFSTR("neighborsToConsider");
      v20 = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v17, CFSTR("embedding"));

      -[REMUserDefaults userDefaults](self, "userDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v10, CFSTR("suggestedAttributesHarvestingOverrides"));

    }
    v8 = v10;
  }
  else
  {
    v22 = v4;
    v23 = CFSTR("embedding");
    v21 = CFSTR("neighborsToConsider");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("suggestedAttributesHarvestingOverrides"));

  }
}

- (void)setSuggestedAttributesTrainingOverrides:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("suggestedAttributesTrainingOverrides"));

}

- (void)setCoreBehaviorTrainingParameters:(id)a3
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
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("suggestedAttributesTrainingOverrides"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "dictionaryForKey:", CFSTR("suggestedAttributesTrainingOverrides"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v12, "setObject:forKey:", v4, CFSTR("corebehavior"));
    -[REMUserDefaults userDefaults](self, "userDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("suggestedAttributesTrainingOverrides"));

  }
  else
  {
    v13 = CFSTR("corebehavior");
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("suggestedAttributesTrainingOverrides"));
  }
}

- (NSDate)lastSyncPoll
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastSyncPoll"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastSyncPoll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastSyncPoll"));

}

- (NSDate)lastCloudConfigurationDownload
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastCloudConfigurationDownload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastCloudConfigurationDownload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastCloudConfigurationDownload"));

}

- (NSDate)staledFileAttachmentCleanupLastExecutionDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("staledFileAttachmentCleanupLastExecutionDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setStaledFileAttachmentCleanupLastExecutionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("staledFileAttachmentCleanupLastExecutionDate"));

}

- (BOOL)staledFileAttachmentCleanupContainerDeemedClean
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("staledFileAttachmentCleanupContainerDeemedClean"));

  return v3;
}

- (void)setStaledFileAttachmentCleanupContainerDeemedClean:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("staledFileAttachmentCleanupContainerDeemedClean"));

}

- (BOOL)extraneousAlarmsCollectorContainerDeemedClean
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("extraneousAlarmsCollectorContainerDeemedClean"));

  return v3;
}

- (void)setExtraneousAlarmsCollectorContainerDeemedClean:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("extraneousAlarmsCollectorContainerDeemedClean"));

}

- (NSDate)lastExtraneousAlarmsCollectorExecutionDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastExtraneousAlarmsCollectorExecutionDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastExtraneousAlarmsCollectorExecutionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastExtraneousAlarmsCollectorExecutionDate"));

}

- (NSDate)imageDeduplicationLastExecutionDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("imageDeduplicationLastExecutionDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setImageDeduplicationLastExecutionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("imageDeduplicationLastExecutionDate"));

}

- (NSDate)suggestConversionToGroceryListLastExecutionDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("suggestConversionToGroceryListLastExecutionDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setSuggestConversionToGroceryListLastExecutionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("suggestConversionToGroceryListLastExecutionDate"));

}

- (NSDate)analyticsActivityLastExecutionDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("analyticsActivityLastExecutionDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setAnalyticsActivityLastExecutionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("analyticsActivityLastExecutionDate"));

}

- (NSArray)imageDeduplicationLegacyAttachmentsMarkedForDeletion
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("imageDeduplicationLegacyAttachmentsMarkedForDeletion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setImageDeduplicationLegacyAttachmentsMarkedForDeletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("imageDeduplicationLegacyAttachmentsMarkedForDeletion"));

}

- (NSDate)savedImageDeduplicationLastExecutionDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("savedImageDeduplicationLastExecutionDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setSavedImageDeduplicationLastExecutionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("savedImageDeduplicationLastExecutionDate"));

}

- (NSArray)savedImageDeduplicationLegacyAttachmentsMarkedForDeletion
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("savedImageDeduplicationLegacyAttachmentsMarkedForDeletion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setSavedImageDeduplicationLegacyAttachmentsMarkedForDeletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("savedImageDeduplicationLegacyAttachmentsMarkedForDeletion"));

}

- (NSData)userInteractionsData
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("userInteractionsData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setUserInteractionsData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("userInteractionsData"));

}

- (BOOL)simulateMAIDAccount
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("simulateMAIDAccount"));

  return v3;
}

- (void)setSimulateMAIDAccount:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("simulateMAIDAccount"));

}

- (void)setShowRemindersAsOverdue:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[REMUserDefaults setShowRemindersAsOverdue_cached:](self, "setShowRemindersAsOverdue_cached:");
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("showRemindersAsOverdue"));

}

- (BOOL)showRemindersAsOverdueWithShouldBypassCache:(BOOL)a3
{
  void *v5;
  char v6;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("showRemindersAsOverdue"));

  if (a3)
    return v6;
  else
    return -[REMUserDefaults showRemindersAsOverdue_cached](self, "showRemindersAsOverdue_cached");
}

- (id)observeShowRemindersAsOverdueWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__REMDaemonUserDefaults_observeShowRemindersAsOverdueWithBlock___block_invoke;
  v8[3] = &unk_1E67FA0A0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startObservingValuesForKey:block:](self, "_startObservingValuesForKey:block:", CFSTR("showRemindersAsOverdue"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __64__REMDaemonUserDefaults_observeShowRemindersAsOverdueWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("showRemindersAsOverdue"));

  objc_msgSend(*(id *)(a1 + 32), "setShowRemindersAsOverdue_cached:", v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)enableWelcomeScreen
{
  void *v2;
  void *v3;
  char v4;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("enableWelcomeScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setEnableWelcomeScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("enableWelcomeScreen"));

}

- (BOOL)forceShowWelcomeScreen
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forceShowWelcomeScreen"));

  return v3;
}

- (void)setForceShowWelcomeScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("forceShowWelcomeScreen"));

}

- (BOOL)forceShowWhatsNewScreen
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forceShowWhatsNewScreen"));

  return v3;
}

- (void)setForceShowWhatsNewScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("forceShowWhatsNewScreen"));

}

- (BOOL)enableInAppDebugMenu
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableInAppDebugMenu"));

  return v3;
}

- (void)setEnableInAppDebugMenu:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("enableInAppDebugMenu"));

}

- (BOOL)enableAutoGenerateCKPersonIDSalt
{
  return 1;
}

- (BOOL)enableHashingUserIdentifiablesWithPersonIDSalt
{
  void *v2;
  void *v3;
  char v4;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("enableHashingUserIdentifiablesWithPersonIDSalt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setEnableHashingUserIdentifiablesWithPersonIDSalt:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("enableHashingUserIdentifiablesWithPersonIDSalt"));

}

+ (id)todayNotificationFireTimeFromStorageNumber:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "integerValue");
  if (v4 == -1)
  {
    v5 = 0;
  }
  else
  {
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v5, "setHour:", objc_msgSend(v3, "integerValue") / 100);
      v7 = objc_msgSend(v3, "integerValue") % 100;
      v6 = v5;
    }
    else
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v5, "setHour:", 9);
      v6 = v5;
      v7 = 0;
    }
    objc_msgSend(v6, "setMinute:", v7);
  }

  return v5;
}

+ (id)storageNumberForTodayNotificationTime:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  if (!a3)
    return &unk_1E6836FD0;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  v5 = objc_msgSend(v4, "hour");
  v6 = objc_msgSend(v4, "minute");

  objc_msgSend(v3, "numberWithInteger:", v6 + 100 * v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDateComponents)todayNotificationFireTime
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("todayNotificationFireTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_opt_class();
  REMCheckedDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "todayNotificationFireTimeFromStorageNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (void)setTodayNotificationFireTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "storageNumberForTodayNotificationTime:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("todayNotificationFireTime"));

  +[REMLog utility](REMLog, "utility");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for todayNotificationFireTime to paired device.", v11, 2u);
  }

  v8 = (void *)objc_opt_new();
  -[REMUserDefaults suiteName](self, "suiteName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836EB0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronizeUserDefaultsDomain:keys:", v9, v10);

}

- (id)streamTodayNotificationFireTime:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__REMDaemonUserDefaults_streamTodayNotificationFireTime___block_invoke;
  v8[3] = &unk_1E67F8868;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startStreamingValuesForKey:block:](self, "_startStreamingValuesForKey:block:", CFSTR("todayNotificationFireTime"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__REMDaemonUserDefaults_streamTodayNotificationFireTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "todayNotificationFireTime");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)observeTodayNotificationFireTimeWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__REMDaemonUserDefaults_observeTodayNotificationFireTimeWithBlock___block_invoke;
  v8[3] = &unk_1E67F8868;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startObservingValuesForKey:block:](self, "_startObservingValuesForKey:block:", CFSTR("todayNotificationFireTime"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __67__REMDaemonUserDefaults_observeTodayNotificationFireTimeWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "todayNotificationFireTime");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)disableAlarmEngineDataSourcePrefetching
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("disableAlarmEngineDataSourcePrefetching"));

  return v3;
}

- (void)setDisableAlarmEngineDataSourcePrefetching:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("disableAlarmEngineDataSourcePrefetching"));

}

- (BOOL)enableAssignmentNotifications
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("enableAssignmentNotifications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("enableAssignmentNotifications"));

  return v6;
}

- (void)setEnableAssignmentNotifications:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("enableAssignmentNotifications"));

}

- (id)observeEnableAssignmentNotificationsWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__REMDaemonUserDefaults_observeEnableAssignmentNotificationsWithBlock___block_invoke;
  v8[3] = &unk_1E67F8868;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startObservingValuesForKey:block:](self, "_startObservingValuesForKey:block:", CFSTR("enableAssignmentNotifications"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __71__REMDaemonUserDefaults_observeEnableAssignmentNotificationsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "enableAssignmentNotifications"));
}

- (BOOL)enableAutoCompleteReminders
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("enableAutoCompleteReminders"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("enableAutoCompleteReminders"));

  return v6;
}

- (void)setEnableAutoCompleteReminders:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("enableAutoCompleteReminders"));

}

- (id)observeEnableAutoCompleteRemindersWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__REMDaemonUserDefaults_observeEnableAutoCompleteRemindersWithBlock___block_invoke;
  v8[3] = &unk_1E67F8868;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startObservingValuesForKey:block:](self, "_startObservingValuesForKey:block:", CFSTR("enableAutoCompleteReminders"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __69__REMDaemonUserDefaults_observeEnableAutoCompleteRemindersWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "enableAutoCompleteReminders"));
}

- (NSDictionary)suggestedAttributesTrainingOverrides
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("suggestedAttributesTrainingOverrides"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)suggestedAttributesHarvestingOverrides
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("suggestedAttributesHarvestingOverrides"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)muteNotificationForSharedList
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("muteNotificationForSharedList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)hideEmptySectionsForGroceryList
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("hideEmptySectionsForGroceryList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setAccountsListCategorizedCountsCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("accountsListCategorizedCountsCache"));

}

- (void)setHashtagLabelsInCustomSmartListFilterCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("hashtagLabelsInCustomSmartListFilterCache"));

}

- (BOOL)debugSimulateSqliteFull
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("debugSimulateSqliteFull"));

  return v3;
}

- (void)setDebugSimulateSqliteFull:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("debugSimulateSqliteFull"));

}

- (NSNumber)tipKitCachedCountOfUncompletedReminders
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tipKitCachedCountOfUncompletedReminders"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfUncompletedReminders:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("tipKitCachedCountOfUncompletedReminders"));

}

- (NSNumber)tipKitCachedCountOfLists
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tipKitCachedCountOfLists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfLists:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("tipKitCachedCountOfLists"));

}

- (NSDate)lastViewedNotificationsPermissionWarmingSheetDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastViewedNotificationsPermissionWarmingSheetDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastViewedNotificationsPermissionWarmingSheetDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastViewedNotificationsPermissionWarmingSheetDate"));

}

- (void)setLastDismissedNotificationsPermissionInlineRequestDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastDismissedNotificationsPermissionInlineRequestDate"));

}

- (BOOL)hasViewedContactsAccessAlertForLocation
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasViewedContactsAccessAlertForLocation"));

  return v3;
}

- (void)setGroceryTipDismissed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("groceryTipDismissed"));

}

- (BOOL)groceryTipDismissed
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("groceryTipDismissed"));

  return v3;
}

- (void)setHasCreatedGroceryList:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("hasCreatedGroceryList"));

}

- (BOOL)hasCreatedGroceryList
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasCreatedGroceryList"));

  return v3;
}

- (void)setHasViewedContactsAccessAlertForLocation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("hasViewedContactsAccessAlertForLocation"));

}

- (BOOL)hasViewedContactsAccessAlertForMessaging
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasViewedContactsAccessAlertForMessaging"));

  return v3;
}

- (void)setHasViewedContactsAccessAlertForMessaging:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("hasViewedContactsAccessAlertForMessaging"));

}

- (BOOL)hasViewedContactsAccessAlertForCalDAVSharing
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasViewedContactsAccessAlertForCalDAVSharing"));

  return v3;
}

- (void)setHasViewedContactsAccessAlertForCalDAVSharing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("hasViewedContactsAccessAlertForCalDAVSharing"));

}

- (BOOL)didShowReminderDeletePrivacyWarning
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("didShowReminderDeletePrivacyWarning"));

  return v3;
}

- (void)setDidShowReminderDeletePrivacyWarning:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("didShowReminderDeletePrivacyWarning"));

}

- (BOOL)hasSeenGroceryFeedbackSurvey
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasSeenGroceryFeedbackSurvey"));

  return v3;
}

- (void)setHasSeenGroceryFeedbackSurvey:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("hasSeenGroceryFeedbackSurvey"));

}

- (BOOL)enableGroceryFeedbackSurvey
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableGroceryFeedbackSurvey"));

  return v3;
}

- (void)setEnableGroceryFeedbackSurvey:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("enableGroceryFeedbackSurvey"));

}

- (void)setRemCurrentRuntimeVersionDebuggingOverride:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("remCurrentRuntimeVersionDebuggingOverride"));

}

- (BOOL)forceEligibleForAutoCloudKitMigration
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forceEligibleForAutoCloudKitMigration"));

  return v3;
}

- (void)setForceEligibleForAutoCloudKitMigration:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("forceEligibleForAutoCloudKitMigration"));

}

- (BOOL)forceBasicAAAccountEligibleForCloudKitReminders
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forceBasicAAAccountEligibleForCloudKitReminders"));

  return v3;
}

- (void)setForceBasicAAAccountEligibleForCloudKitReminders:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("forceBasicAAAccountEligibleForCloudKitReminders"));

}

- (NSDictionary)dataSeparationAppDocumentsURLDebugOverride
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("dataSeparationAppDocumentsURLDebugOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setDataSeparationAppDocumentsURLDebugOverride:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("dataSeparationAppDocumentsURLDebugOverride"));

}

- (NSDate)lastDataSeparationMigrationDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastDataSeparationMigrationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastDataSeparationMigrationDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastDataSeparationMigrationDate"));

}

- (NSDictionary)syncActivityNotificationEngine_accountSignInTime
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("syncActivityNotificationEngine_accountSignInTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setSyncActivityNotificationEngine_accountSignInTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("syncActivityNotificationEngine_accountSignInTime"));

}

- (void)setSharedListActivityNotifications_demoMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("sharedListActivityNotifications_demoMode"));

}

- (BOOL)sharedListActivityNotifications_demoMode
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("sharedListActivityNotifications_demoMode"));

  return v3;
}

- (void)setShouldIncludeRemindersDueTodayInBadgeCount:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("shouldIncludeRemindersDueTodayInBadgeCount"));

}

- (BOOL)shouldIncludeRemindersDueTodayInBadgeCount
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("shouldIncludeRemindersDueTodayInBadgeCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("shouldIncludeRemindersDueTodayInBadgeCount"));

  return v6;
}

- (id)streamShouldIncludeRemindersDueTodayInBadgeCount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__REMDaemonUserDefaults_streamShouldIncludeRemindersDueTodayInBadgeCount___block_invoke;
  v8[3] = &unk_1E67F8868;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startStreamingValuesForKey:block:](self, "_startStreamingValuesForKey:block:", CFSTR("shouldIncludeRemindersDueTodayInBadgeCount"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __74__REMDaemonUserDefaults_streamShouldIncludeRemindersDueTodayInBadgeCount___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "shouldIncludeRemindersDueTodayInBadgeCount"));
}

- (id)observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__REMDaemonUserDefaults_observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock___block_invoke;
  v8[3] = &unk_1E67F8868;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[REMUserDefaults _startObservingValuesForKey:block:](self, "_startObservingValuesForKey:block:", CFSTR("shouldIncludeRemindersDueTodayInBadgeCount"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __84__REMDaemonUserDefaults_observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "shouldIncludeRemindersDueTodayInBadgeCount"));
}

- (BOOL)isSpotlightQueryLoggingEnabled
{
  void *v2;
  char v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("isSpotlightQueryLoggingEnabled"));

  return v3;
}

- (void)setIsSpotlightQueryLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("isSpotlightQueryLoggingEnabled"));

}

- (NSString)trialAssetsDirectoryDebugOverride
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("trialAssetsDirectoryDebugOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTrialAssetsDirectoryDebugOverride:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("trialAssetsDirectoryDebugOverride"));

}

- (NSDate)automaticSecondaryGroceryLocalesLastModifiedDate
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("automaticSecondaryGroceryLocalesLastModifiedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setAutomaticSecondaryGroceryLocalesLastModifiedDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("automaticSecondaryGroceryLocalesLastModifiedDate"));

}

- (NSArray)automaticSecondaryGroceryLocales
{
  void *v2;
  void *v3;

  -[REMUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("automaticSecondaryGroceryLocales"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setAutomaticSecondaryGroceryLocales:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("automaticSecondaryGroceryLocales"));

}

- (id)_pptPreferredDefaultListIDKey
{
  return (id)objc_msgSend(CFSTR("preferredDefaultListID"), "stringByAppendingString:", CFSTR("_temp"));
}

- (void)ppt_handleInstall
{
  void *v3;
  void *v4;
  id v5;

  -[REMDaemonUserDefaults preferredDefaultListID](self, "preferredDefaultListID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[REMDaemonUserDefaults deletePreferredDefaultListID](self, "deletePreferredDefaultListID");
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDaemonUserDefaults _pptPreferredDefaultListIDKey](self, "_pptPreferredDefaultListIDKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObjectID:forKey:", v5, v4);

}

- (void)ppt_handleRestore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[REMDaemonUserDefaults deletePreferredDefaultListID](self, "deletePreferredDefaultListID");
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDaemonUserDefaults _pptPreferredDefaultListIDKey](self, "_pptPreferredDefaultListIDKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[REMObjectID objectIDWithURL:](REMObjectID, "objectIDWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDaemonUserDefaults setPreferredDefaultListID:](self, "setPreferredDefaultListID:", v6);

  }
  -[REMUserDefaults userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDaemonUserDefaults _pptPreferredDefaultListIDKey](self, "_pptPreferredDefaultListIDKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (NSDate)batchDeleteExpiredRemindersLastExecutionDate
{
  return self->_batchDeleteExpiredRemindersLastExecutionDate;
}

- (void)setBatchDeleteExpiredRemindersLastExecutionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchDeleteExpiredRemindersLastExecutionDate, 0);
}

@end
