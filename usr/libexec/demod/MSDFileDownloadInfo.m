@implementation MSDFileDownloadInfo

- (MSDFileDownloadInfo)init
{
  MSDFileDownloadInfo *v2;
  MSDFileDownloadInfo *v3;
  void *v4;
  MSDFileDownloadInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDFileDownloadInfo;
  v2 = -[MSDFileDownloadInfo init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDFileDownloadInfo setFile:](v2, "setFile:", 0);
    -[MSDFileDownloadInfo setFileHash:](v3, "setFileHash:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoManifestCheck sharedInstance](MSDDemoManifestCheck, "sharedInstance"));
    -[MSDFileDownloadInfo setChecker:](v3, "setChecker:", v4);

    -[MSDFileDownloadInfo setSkipHashCheck:](v3, "setSkipHashCheck:", 0);
    v5 = v3;
  }

  return v3;
}

- (BOOL)entitlementCheckForFile:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo checker](self, "checker"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo file](self, "file")),
        v7,
        v6,
        !v7))
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1000BFBEC((uint64_t)v4, v13);
    v11 = 1;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo checker](self, "checker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo file](self, "file"));
  v10 = objc_msgSend(v8, "checkFileForEntitlements:forCorrespondingManifestEntry:", v4, v9);

  if ((v10 & 1) == 0)
  {
    v14 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BFC60((uint64_t)v4, v13, v15);
    v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)hashCheckForFile:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  if (-[MSDFileDownloadInfo skipHashCheck](self, "skipHashCheck"))
  {
    v13 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping file hash check for: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v8 = 1;
  }
  else
  {
    if (!v4)
    {
      v8 = 1;
      goto LABEL_9;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileHashWithPath:](MSDFileMetadata, "fileHashWithPath:", v4));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hexStringRepresentation"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo fileHash](self, "fileHash"));
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if ((v8 & 1) == 0)
    {
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo fileHash](self, "fileHash"));
        v14 = 138543874;
        v15 = v4;
        v16 = 2114;
        v17 = v6;
        v18 = 2114;
        v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "The file (%{public}@) is corrupted - File hash:  %{public}@ - Expected:  %{public}@", (uint8_t *)&v14, 0x20u);

      }
    }
  }

LABEL_9:
  return v8;
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)file
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MSDDemoManifestCheck)checker
{
  return (MSDDemoManifestCheck *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChecker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)skipHashCheck
{
  return self->_skipHashCheck;
}

- (void)setSkipHashCheck:(BOOL)a3
{
  self->_skipHashCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checker, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
}

@end
