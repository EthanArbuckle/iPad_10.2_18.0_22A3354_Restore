@implementation BACloudKitDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BACloudKitDownload)init
{
  BACloudKitDownload *result;
  int v3;
  const char *v4;

  result = (BACloudKitDownload *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BACloudKitDownload cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BACloudKitDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 recordName:(id)a5 assetKey:(id)a6 applicationGroupIdentifier:(id)a7
{
  return -[BACloudKitDownload initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:](self, "initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:", a3, a4, CFSTR("Name"), a5, a6, a7);
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BACloudKitDownload *v22;
  void *v25;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer defaultContainer](CKContainer, "defaultContainer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "containerIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecordZone defaultRecordZone](CKRecordZone, "defaultRecordZone"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneID"));
  v22 = -[BACloudKitDownload initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:containerIdentifier:zoneID:databaseScope:priority:](self, "initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:containerIdentifier:zoneID:databaseScope:priority:", v18, v17, v16, v15, v14, v13, v19, v21, 1, 0);

  return v22;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8 containerIdentifier:(id)a9 zoneID:(id)a10 databaseScope:(int64_t)a11 priority:(int64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  BACloudKitDownload *v40;
  NSExceptionName v41;
  const __CFString *v42;
  id v44;
  id v45;

  v45 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v26 = objc_opt_class(NSString, v25);
  if ((objc_opt_isKindOfClass(v19, v26) & 1) == 0 || !objc_msgSend(v19, "length"))
  {
    v41 = NSInvalidArgumentException;
    v42 = CFSTR("expectedFieldKey must be a valid string.");
LABEL_11:
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v41, v42, 0));
    objc_msgSend(v37, "raise");
    v40 = 0;
    goto LABEL_12;
  }
  if (!v20)
  {
    v41 = NSInvalidArgumentException;
    v42 = CFSTR("expectedFieldValue cannot be passed in as nil.");
    goto LABEL_11;
  }
  v28 = objc_opt_class(NSString, v27);
  if ((objc_opt_isKindOfClass(v20, v28) & 1) == 0)
  {
    v30 = objc_opt_class(NSNumber, v29);
    if ((objc_opt_isKindOfClass(v20, v30) & 1) == 0)
    {
      v32 = objc_opt_class(NSDate, v31);
      if ((objc_opt_isKindOfClass(v20, v32) & 1) == 0)
      {
        v34 = objc_opt_class(NSData, v33);
        if ((objc_opt_isKindOfClass(v20, v34) & 1) == 0)
        {
          v36 = objc_opt_class(NSArray, v35);
          if ((objc_opt_isKindOfClass(v20, v36) & 1) == 0)
          {
            v41 = NSInvalidArgumentException;
            v42 = CFSTR("expectedFieldValue must be of type: NSString, NSNumber, NSDate, NSData, or NSArray.");
            goto LABEL_11;
          }
        }
      }
    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ == %%@"), v19));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v37, v20));
  v44 = v18;
  v39 = objc_msgSend(objc_alloc((Class)CKQuery), "initWithRecordType:predicate:", v18, v38);
  self = (BACloudKitDownload *)sub_10000E438(self, v45, v39, v21, v22, v23, v24, a11, a12);

  v18 = v44;
  v40 = self;
LABEL_12:

  return v40;
}

- (BACloudKitDownload)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BACloudKitDownload *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BACloudKitDownload;
  v6 = -[BADownload initWithCoder:](&v22, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKContainerID, v5), CFSTR("BACKD.ContainerID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[BACloudKitDownload setContainerID:](v6, "setContainerID:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKQuery, v9), CFSTR("BACKD.query"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[BACloudKitDownload setQuery:](v6, "setQuery:", v11);

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v12), CFSTR("BACKD.assetKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[BACloudKitDownload setAssetKey:](v6, "setAssetKey:", v14);

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKRecordZoneID, v15), CFSTR("BACKD.zoneID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[BACloudKitDownload setZoneID:](v6, "setZoneID:", v17);

    -[BACloudKitDownload setDatabaseScope:](v6, "setDatabaseScope:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BACKD.databaseScope")));
    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v18), CFSTR("masqueradeIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[BACloudKitDownload setMasqueradeIdentifier:](v6, "setMasqueradeIdentifier:", v20);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BACloudKitDownload;
  -[BADownload encodeWithCoder:](&v11, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload containerID](self, "containerID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("BACKD.ContainerID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload query](self, "query"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("BACKD.query"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload assetKey](self, "assetKey"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("BACKD.assetKey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload zoneID](self, "zoneID"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("BACKD.zoneID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BACloudKitDownload databaseScope](self, "databaseScope"), CFSTR("BACKD.databaseScope"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload masqueradeIdentifier](self, "masqueradeIdentifier"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload masqueradeIdentifier](self, "masqueradeIdentifier"));
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("masqueradeIdentifier"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BACloudKitDownload;
  v5 = -[BADownload copyWithZone:](&v9, "copyWithZone:");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload masqueradeIdentifier](self, "masqueradeIdentifier"));
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setMasqueradeIdentifier:", v7);

  }
  return v5;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_containerID, a3);
}

- (CKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetKey, a3);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (NSString)masqueradeIdentifier
{
  return self->_masqueradeIdentifier;
}

- (void)setMasqueradeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_masqueradeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masqueradeIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  BACloudKitDownloadManager *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  BOOL v27;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  _QWORD block[5];
  uint8_t buf[4];
  BACloudKitDownload *v35;

  v6 = a3;
  v7 = -[BADownload downloadLock](self, "downloadLock");
  os_unfair_lock_lock(v7);
  -[BADownload setDelegate:](self, "setDelegate:", v6);
  sub_10002FBB8(self, -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationIdentifier](self, "applicationIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BACloudKitDownload.%@.%@"), v8, v10));
  -[BADownload setUniqueIdentifier:](self, "setUniqueIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
  if (!v12)
    goto LABEL_5;
  v13 = sub_100012A44();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v35 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Download %{public}@ is restricted, validating.", buf, 0xCu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload applicationInfo](self, "applicationInfo"));
  v16 = objc_msgSend(v15, "remainingDownloadAllowanceWithNecessity:", 0) == 0;

  if (v16)
  {
    v29 = sub_100012A44();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_100037B50((uint64_t)self, v30);

    if (a4)
    {
      v31 = sub_1000272FC(203);
      v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v31);
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
LABEL_5:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[BADownload setDownloadStartDate:](self, "setDownloadStartDate:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload uniqueIdentifier](self, "uniqueIdentifier"));
    -[BADownload _addActivityWithIdentifier:takePowerAssertion:](self, "_addActivityWithIdentifier:takePowerAssertion:", v18, 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
      v21 = objc_opt_respondsToSelector(v20, "downloadDidBegin:");

      if ((v21 & 1) != 0)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002E6D4;
        block[3] = &unk_100058998;
        block[4] = self;
        dispatch_async(v22, block);

      }
    }
    v23 = -[BACloudKitDownloadManager initWithDownload:withDelegate:]([BACloudKitDownloadManager alloc], "initWithDownload:withDelegate:", self, self);
    -[BACloudKitDownload setDownloadManager:](self, "setDownloadManager:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload downloadManager](self, "downloadManager"));
    v32 = 0;
    v25 = objc_msgSend(v24, "startDownloadWithError:", &v32);
    v26 = v32;

    if ((v25 & 1) == 0)
      -[BACloudKitDownload _downloadFailedWithError:](self, "_downloadFailedWithError:", v26);

    v27 = 1;
  }
  os_unfair_lock_unlock(v7);

  return v27;
}

- (void)cancelDownload
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload downloadManager](self, "downloadManager"));
  objc_msgSend(v2, "cancelDownload");

}

- (void)pauseDownload
{
  id v3;

  os_unfair_lock_lock(-[BADownload downloadLock](self, "downloadLock"));
  sub_10002FBB8(self, 4);
  os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BACloudKitDownload downloadManager](self, "downloadManager"));
  objc_msgSend(v3, "pauseDownload");

}

- (void)downloadSucceededWithURL:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(-[BADownload downloadLock](self, "downloadLock"));
  -[BACloudKitDownload _downloadSucceededWithURL:](self, "_downloadSucceededWithURL:", v4);

  os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
}

- (void)downloadDidPause
{
  os_unfair_lock_lock(-[BADownload downloadLock](self, "downloadLock"));
  -[BACloudKitDownload _downloadDidPause](self, "_downloadDidPause");
  os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
}

- (void)downloadFailedWithError:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(-[BADownload downloadLock](self, "downloadLock"));
  -[BACloudKitDownload _downloadFailedWithError:](self, "_downloadFailedWithError:", v4);

  os_unfair_lock_unlock(-[BADownload downloadLock](self, "downloadLock"));
}

- (void)_downloadFailedWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  BACloudKitDownload *v14;
  id v15;

  v4 = a3;
  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  sub_10002FBB8(self, -1);
  -[BADownload setDownloadError:](self, "setDownloadError:", v4);
  v5 = objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "download:failedWithError:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
      v10 = _NSConcreteStackBlock;
      v11 = 3221225472;
      v12 = sub_10002E96C;
      v13 = &unk_100058A10;
      v14 = self;
      v15 = v4;
      dispatch_async(v9, &v10);

    }
  }
  -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion", v10, v11, v12, v13, v14);

}

- (void)_downloadDidPause
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD block[5];

  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  sub_10002FBB8(self, 5);
  v3 = objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "downloadDidPause:");

    if ((v6 & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002EA80;
      block[3] = &unk_100058998;
      block[4] = self;
      dispatch_async(v7, block);

    }
  }
  -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
}

- (void)_downloadSucceededWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  _QWORD block[5];
  char *v18;
  id v19;

  v4 = a3;
  os_unfair_lock_assert_owner(-[BADownload downloadLock](self, "downloadLock"));
  sub_10002FBB8(self, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload downloadCachePath](self, "downloadCachePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v7));

  v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = 0;
  LOBYTE(v7) = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v4, v9, &v19);

  v11 = v19;
  if ((v7 & 1) != 0)
  {
    sub_10002FC00(self, v9);
    v12 = objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownload delegate](self, "delegate"));
      v15 = objc_opt_respondsToSelector(v14, "download:finishedWithFileURL:");

      if ((v15 & 1) != 0)
      {
        v16 = objc_claimAutoreleasedReturnValue(-[BADownload responseQueue](self, "responseQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002EC94;
        block[3] = &unk_100058A10;
        block[4] = self;
        v18 = v9;
        dispatch_async(v16, block);

      }
    }
    -[BADownload _removeActivityAndPowerAssertion](self, "_removeActivityAndPowerAssertion");
  }
  else
  {
    -[BACloudKitDownload _downloadFailedWithError:](self, "_downloadFailedWithError:", v11);
  }

}

- (BACloudKitDownloadManager)downloadManager
{
  return (BACloudKitDownloadManager *)objc_getAssociatedObject(self, off_100065398);
}

- (void)setDownloadManager:(id)a3
{
  objc_setAssociatedObject(self, off_100065398, a3, (void *)1);
}

@end
