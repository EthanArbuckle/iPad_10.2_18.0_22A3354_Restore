@implementation MIWatchKitAppSnapshot

- (MIWatchKitAppSnapshot)initWithBundleID:(id)a3 snapshotTo:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6
{
  id v11;
  id v12;
  MIWatchKitAppSnapshot *v13;
  MIWatchKitAppSnapshot *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MIWatchKitAppSnapshot;
  v13 = -[MIWatchKitAppSnapshot init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleID, a3);
    v14->_onlyV1 = a5;
    v14->_placeholderOnly = a6;
    objc_storeStrong((id *)&v14->_destURL, a4);
    v14->_identifierLocked = 0;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[MIWatchKitAppSnapshot identifierLocked](self, "identifierLocked"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIWatchKitAppSnapshot bundleID](self, "bundleID"));
    sub_10004E89C(v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)MIWatchKitAppSnapshot;
  -[MIWatchKitAppSnapshot dealloc](&v4, "dealloc");
}

- (BOOL)createSnapshotWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIWatchKitAppSnapshot bundleID](self, "bundleID"));
  sub_10004E778(v5);

  -[MIWatchKitAppSnapshot setIdentifierLocked:](self, "setIdentifierLocked:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIWatchKitAppSnapshot bundleID](self, "bundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIWatchKitAppSnapshot destURL](self, "destURL"));
  v13 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:withError:", v7, v8, -[MIWatchKitAppSnapshot onlyV1](self, "onlyV1"), -[MIWatchKitAppSnapshot placeholderOnly](self, "placeholderOnly"), &v13));
  v10 = v13;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIWatchKitAppSnapshot bundleID](self, "bundleID"));
  sub_10004E89C(v11);

  -[MIWatchKitAppSnapshot setIdentifierLocked:](self, "setIdentifierLocked:", 0);
  if (v9)
  {
    -[MIWatchKitAppSnapshot setResultDict:](self, "setResultDict:", v9);
  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    MOLogWrite(qword_10009E048, 3, "-[MIWatchKitAppSnapshot createSnapshotWithError:]", CFSTR("Error from helper service creating app snapshot: %@"));
  }
  if (a3 && v10)
    *a3 = objc_retainAutorelease(v10);

  return v9 != 0;
}

- (NSDictionary)resultDict
{
  return self->_resultDict;
}

- (void)setResultDict:(id)a3
{
  objc_storeStrong((id *)&self->_resultDict, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)watchKitAppBundleID
{
  return self->_watchKitAppBundleID;
}

- (void)setWatchKitAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)onlyV1
{
  return self->_onlyV1;
}

- (BOOL)placeholderOnly
{
  return self->_placeholderOnly;
}

- (NSURL)destURL
{
  return self->_destURL;
}

- (unint64_t)diskUsage
{
  return self->_diskUsage;
}

- (void)setDiskUsage:(unint64_t)a3
{
  self->_diskUsage = a3;
}

- (BOOL)identifierLocked
{
  return self->_identifierLocked;
}

- (void)setIdentifierLocked:(BOOL)a3
{
  self->_identifierLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);
  objc_storeStrong((id *)&self->_watchKitAppBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_resultDict, 0);
}

@end
