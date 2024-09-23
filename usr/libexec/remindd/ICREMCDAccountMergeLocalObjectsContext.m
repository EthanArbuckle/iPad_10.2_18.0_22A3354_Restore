@implementation ICREMCDAccountMergeLocalObjectsContext

- (ICREMCDAccountMergeLocalObjectsContext)initWithAccountIdentifier:(id)a3
{
  id v4;
  ICREMCDAccountMergeLocalObjectsContext *v5;
  ICREMCDAccountMergeLocalObjectsContext *v6;
  void *v7;
  ICREMCDAccountMergeLocalObjectsContext *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICREMCDAccountMergeLocalObjectsContext;
    v5 = -[ICREMCDAccountMergeLocalObjectsContext init](&v11, "init");
    v6 = v5;
    if (v5)
    {
      -[ICREMCDAccountMergeLocalObjectsContext setAccountIdentifier:](v5, "setAccountIdentifier:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      -[ICREMCDAccountMergeLocalObjectsContext setObjectIDsOfClassesEligibleForLocalObjectMerge:](v6, "setObjectIDsOfClassesEligibleForLocalObjectMerge:", v7);

      -[ICREMCDAccountMergeLocalObjectsContext setWasMigrated:](v6, "setWasMigrated:", 0);
      -[ICREMCDAccountMergeLocalObjectsContext setDidNotFinishMigration:](v6, "setDidNotFinishMigration:", 0);
      -[ICREMCDAccountMergeLocalObjectsContext setNeedsToFetchUserRecord:](v6, "setNeedsToFetchUserRecord:", 0);
      -[ICREMCDAccountMergeLocalObjectsContext setIsInactive:](v6, "setIsInactive:", 0);
      -[ICREMCDAccountMergeLocalObjectsContext setDidChooseToMigrate:](v6, "setDidChooseToMigrate:", 0);
    }
    self = v6;
    v8 = self;
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_10067D40C();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountIdentifier");
    v8 = 0;
  }

  return v8;
}

- (void)validateWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remObjectID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remObjectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICREMCDAccountMergeLocalObjectsContext accountIdentifier](self, "accountIdentifier"));
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeControllerManagedObjectContext"));
      v12 = v11;
      if (!v11)
      {
        v35 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          sub_10067D594();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "managedObjectContext");
        goto LABEL_36;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeController"));
      if (!v13)
      {
        v36 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          sub_10067D658();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "storeController");
        goto LABEL_35;
      }
      -[ICREMCDAccountMergeLocalObjectsContext setDidChooseToMigrate:](self, "setDidChooseToMigrate:", objc_msgSend(v4, "didChooseToMigrate"));
      -[ICREMCDAccountMergeLocalObjectsContext setWasMigrated:](self, "setWasMigrated:", objc_msgSend(v4, "daWasMigrated"));
      -[ICREMCDAccountMergeLocalObjectsContext setIsInactive:](self, "setIsInactive:", objc_msgSend(v4, "inactive"));
      if (-[ICREMCDAccountMergeLocalObjectsContext needsToMergeLocalObjects](self, "needsToMergeLocalObjects"))
      {
        if (objc_msgSend(v4, "didChooseToMigrate")
          && (objc_msgSend(v4, "didFinishMigration") & 1) == 0)
        {
          -[ICREMCDAccountMergeLocalObjectsContext setDidNotFinishMigration:](self, "setDidNotFinishMigration:", 1);
          goto LABEL_35;
        }
        if ((objc_msgSend(v4, "didChooseToMigrate") & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ckUserRecordName"));

          if (!v14)
          {
            -[ICREMCDAccountMergeLocalObjectsContext setNeedsToFetchUserRecord:](self, "setNeedsToFetchUserRecord:", 1);
            goto LABEL_35;
          }
          v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICREMCDAccountMergeLocalObjectsContext accountIdentifier](self, "accountIdentifier"));
            *(_DWORD *)buf = 138543362;
            v42 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "MergeLocalObjectsContext.validate:(MERGE.LOCAL) Gathering all cloud objectIDs that should run attempt merging local objects {accountIdentifier: %{public}@}", buf, 0xCu);

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "__unsafe_doesNotWorkUniversally_affectedStores"));
          v18 = objc_msgSend(v17, "count");

          if (v18 != (id)1)
          {
            v38 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              sub_10067D748();

          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "__unsafe_doesNotWorkUniversally_affectedStores"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "firstObject"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "persistentStore"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
          v24 = objc_msgSend(v20, "isEqual:", v23);

          if ((v24 & 1) == 0)
          {
            v39 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
              sub_10067D71C();

          }
          v25 = objc_claimAutoreleasedReturnValue(+[ICCloudContext allCloudObjectIDsOfClassesPassingTest:inContext:](ICCloudContext, "allCloudObjectIDsOfClassesPassingTest:inContext:", &stru_1007D9750, v12));
          -[ICREMCDAccountMergeLocalObjectsContext setObjectIDsOfClassesEligibleForLocalObjectMerge:](self, "setObjectIDsOfClassesEligibleForLocalObjectMerge:", v25);
        }
        else
        {
          v25 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            sub_10067D774(self, v25);
        }
      }
      else
      {
        v25 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICREMCDAccountMergeLocalObjectsContext accountIdentifier](self, "accountIdentifier"));
          *(_DWORD *)buf = 138543362;
          v42 = v37;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "MergeLocalObjectsContext.validate:(MERGE.LOCAL) Account does not need to merge local objects {accountIdentifier: %{public}@}", buf, 0xCu);

        }
      }

LABEL_35:
LABEL_36:

      goto LABEL_37;
    }
    v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      sub_10067D7F4();

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remObjectID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "uuid"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUIDString"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICREMCDAccountMergeLocalObjectsContext accountIdentifier](self, "accountIdentifier"));
    v34 = objc_msgSend(v32, "isEqualToString:", v33);

    if ((v34 & 1) == 0)
    {
      v28 = "[cdAccount.remObjectID.uuid.UUIDString isEqualToString:self.accountIdentifier]";
      goto LABEL_23;
    }
  }
  else
  {
    v26 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      sub_10067D4D0();

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remObjectID"));
    if (!v27)
    {
      v28 = "cdAccount.remObjectID";
LABEL_23:
      NSLog(CFSTR("'%s' is unexpectedly nil"), v28);
    }
  }
LABEL_37:

}

- (BOOL)needsToMergeLocalObjects
{
  _BOOL4 v3;

  v3 = -[ICREMCDAccountMergeLocalObjectsContext wasMigrated](self, "wasMigrated");
  if (v3)
    LOBYTE(v3) = !-[ICREMCDAccountMergeLocalObjectsContext isInactive](self, "isInactive");
  return v3;
}

- (BOOL)shouldRetryMergeLocalObjects
{
  _BOOL4 v3;

  v3 = -[ICREMCDAccountMergeLocalObjectsContext didChooseToMigrate](self, "didChooseToMigrate");
  if (v3)
  {
    if (-[ICREMCDAccountMergeLocalObjectsContext didNotFinishMigration](self, "didNotFinishMigration")
      || -[ICREMCDAccountMergeLocalObjectsContext needsToFetchUserRecord](self, "needsToFetchUserRecord"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = -[ICREMCDAccountMergeLocalObjectsContext isInactive](self, "isInactive");
    }
  }
  return v3;
}

- (id)loggableDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICREMCDAccountMergeLocalObjectsContext accountIdentifier](self, "accountIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(accountIdentifier: %@, didChooseToMigrate: %d, wasMigrated: %d, didNotFinishMigration: %d, needsToFetchUserRecord: %d, isInactive: %d)"), v3, -[ICREMCDAccountMergeLocalObjectsContext didChooseToMigrate](self, "didChooseToMigrate"), -[ICREMCDAccountMergeLocalObjectsContext wasMigrated](self, "wasMigrated"), -[ICREMCDAccountMergeLocalObjectsContext didNotFinishMigration](self, "didNotFinishMigration"), -[ICREMCDAccountMergeLocalObjectsContext needsToFetchUserRecord](self, "needsToFetchUserRecord"), -[ICREMCDAccountMergeLocalObjectsContext isInactive](self, "isInactive")));

  return v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSSet)objectIDsOfClassesEligibleForLocalObjectMerge
{
  return self->_objectIDsOfClassesEligibleForLocalObjectMerge;
}

- (void)setObjectIDsOfClassesEligibleForLocalObjectMerge:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsOfClassesEligibleForLocalObjectMerge, a3);
}

- (BOOL)wasMigrated
{
  return self->_wasMigrated;
}

- (void)setWasMigrated:(BOOL)a3
{
  self->_wasMigrated = a3;
}

- (BOOL)didNotFinishMigration
{
  return self->_didNotFinishMigration;
}

- (void)setDidNotFinishMigration:(BOOL)a3
{
  self->_didNotFinishMigration = a3;
}

- (BOOL)needsToFetchUserRecord
{
  return self->_needsToFetchUserRecord;
}

- (void)setNeedsToFetchUserRecord:(BOOL)a3
{
  self->_needsToFetchUserRecord = a3;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (BOOL)didChooseToMigrate
{
  return self->_didChooseToMigrate;
}

- (void)setDidChooseToMigrate:(BOOL)a3
{
  self->_didChooseToMigrate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsOfClassesEligibleForLocalObjectMerge, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
