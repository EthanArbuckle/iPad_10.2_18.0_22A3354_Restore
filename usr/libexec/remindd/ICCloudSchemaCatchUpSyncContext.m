@implementation ICCloudSchemaCatchUpSyncContext

- (ICCloudSchemaCatchUpSyncContext)initWithAccountIdentifier:(id)a3 syncReason:(id)a4 schedulingStateStorage:(id)a5 managedObjectContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ICCloudSchemaCatchUpSyncContext *v14;
  ICCloudSchemaCatchUpSyncContext *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ICCloudSchemaCatchUpSyncContext;
  v14 = -[ICCloudSchemaCatchUpSyncContext init](&v23, "init");
  v15 = v14;
  if (v14)
  {
    -[ICCloudSchemaCatchUpSyncContext setAccountIdentifier:](v14, "setAccountIdentifier:", v10);
    -[ICCloudSchemaCatchUpSyncContext setSyncReason:](v15, "setSyncReason:", v11);
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSchemaCatchUpSyncContext accountIdentifier](v15, "accountIdentifier"));
    v17 = +[ICCloudSchemaCompatibilityUtils isCloudSchemaCatchUpSyncNeededForAccountIdentifier:context:outPersistenceCloudSchemaVersion:](ICCloudSchemaCompatibilityUtils, "isCloudSchemaCatchUpSyncNeededForAccountIdentifier:context:outPersistenceCloudSchemaVersion:", v16, v13, &v22);

    if (v17)
      -[ICCloudSchemaCatchUpSyncContext setPersistenceCloudSchemaVersion:](v15, "setPersistenceCloudSchemaVersion:", v22);
    -[ICCloudSchemaCatchUpSyncContext setIsCloudSchemaCatchUpSyncNeeded:](v15, "setIsCloudSchemaCatchUpSyncNeeded:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storeController"));
    -[ICCloudSchemaCatchUpSyncContext _computeShouldPerformCloudSchemaCatchUpSyncFrom:storeController:](v15, "_computeShouldPerformCloudSchemaCatchUpSyncFrom:storeController:", v12, v18);

    v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSchemaCatchUpSyncContext description](v15, "description"));
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "ICCloudSchemaCatchUpSyncContext: finished initizing context: %@", buf, 0xCu);

    }
  }

  return v15;
}

- (void)_computeShouldPerformCloudSchemaCatchUpSyncFrom:(id)a3 storeController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if (!-[ICCloudSchemaCatchUpSyncContext isCloudSchemaCatchUpSyncNeeded](self, "isCloudSchemaCatchUpSyncNeeded"))
  {
    v15 = 0;
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSchemaCatchUpSyncContext syncReason](self, "syncReason"));
  v9 = isCloudContextSyncReasonUserInitiated(v8);

  v10 = objc_msgSend(v7, "supportsCloudSchemaCatchUpSyncBackgroundScheduling");
  v11 = objc_msgSend(v6, "debugForceSupportBackgroundScheduling");
  v12 = objc_msgSend(v6, "schedulingState");
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSchemaCatchUpSyncContext syncReason](self, "syncReason"));
    v17[0] = 67110146;
    v17[1] = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 1024;
    v21 = v11;
    v22 = 2048;
    v23 = v12;
    v24 = 2114;
    v25 = v14;

  }
  if ((v10 & (v9 ^ 1) | v11) != 1)
  {
LABEL_11:
    v15 = 1;
    goto LABEL_12;
  }
  if ((unint64_t)v12 >= 3)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_10067EB98((uint64_t)v12, v16);

    goto LABEL_11;
  }
  v15 = v12 == (id)2;
LABEL_12:
  -[ICCloudSchemaCatchUpSyncContext setShouldPerformCloudSchemaCatchUpSync:](self, "setShouldPerformCloudSchemaCatchUpSync:", v15);

}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSchemaCatchUpSyncContext accountIdentifier](self, "accountIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSchemaCatchUpSyncContext syncReason](self, "syncReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, accountIdentifier: %@, syncReason: %@, persistenceCloudSchemaVersion: %ld, isCloudSchemaCatchUpSyncNeeded: %d, shouldPerformCloudSchemaCatchUpSync: %d>"), v3, self, v4, v5, -[ICCloudSchemaCatchUpSyncContext persistenceCloudSchemaVersion](self, "persistenceCloudSchemaVersion"), -[ICCloudSchemaCatchUpSyncContext isCloudSchemaCatchUpSyncNeeded](self, "isCloudSchemaCatchUpSyncNeeded"), -[ICCloudSchemaCatchUpSyncContext shouldPerformCloudSchemaCatchUpSync](self, "shouldPerformCloudSchemaCatchUpSync")));

  return v6;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)syncReason
{
  return self->_syncReason;
}

- (void)setSyncReason:(id)a3
{
  objc_storeStrong((id *)&self->_syncReason, a3);
}

- (BOOL)isCloudSchemaCatchUpSyncNeeded
{
  return self->_isCloudSchemaCatchUpSyncNeeded;
}

- (void)setIsCloudSchemaCatchUpSyncNeeded:(BOOL)a3
{
  self->_isCloudSchemaCatchUpSyncNeeded = a3;
}

- (BOOL)shouldPerformCloudSchemaCatchUpSync
{
  return self->_shouldPerformCloudSchemaCatchUpSync;
}

- (void)setShouldPerformCloudSchemaCatchUpSync:(BOOL)a3
{
  self->_shouldPerformCloudSchemaCatchUpSync = a3;
}

- (int64_t)persistenceCloudSchemaVersion
{
  return self->_persistenceCloudSchemaVersion;
}

- (void)setPersistenceCloudSchemaVersion:(int64_t)a3
{
  self->_persistenceCloudSchemaVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncReason, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
