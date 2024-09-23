@implementation CKRecordZoneID

+ (int64_t)ic_defaultDatabaseScopeForOwnerName:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CKCurrentUserDefaultName))
    return 2;
  else
    return 3;
}

- (id)ic_loggingDescription
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](self, "ownerName"));
  v4 = objc_msgSend(v3, "isEqualToString:", CKCurrentUserDefaultName);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID zoneName](self, "zoneName"));
    v6 = CKDatabaseScopeString(-[CKRecordZoneID databaseScope](self, "databaseScope"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %@>"), v5, v7));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](self, "ownerName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID zoneName](self, "zoneName"));
    v9 = CKDatabaseScopeString(-[CKRecordZoneID databaseScope](self, "databaseScope"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v5, v7, v10));

  }
  return v8;
}

- (int64_t)rd_ckDatabaseScope
{
  int64_t result;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  result = (int64_t)-[CKRecordZoneID databaseScope](self, "databaseScope");
  if (!result)
  {
    v5 = (void *)objc_opt_class(self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](self, "ownerName"));
    v7 = objc_msgSend(v5, "ic_defaultDatabaseScopeForOwnerName:", v6);

    return (int64_t)v7;
  }
  return result;
}

- (BOOL)ic_isOwnedByCurrentUser
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](self, "ownerName"));
  v3 = objc_msgSend(v2, "isEqualToString:", CKCurrentUserDefaultName);

  return v3;
}

@end
