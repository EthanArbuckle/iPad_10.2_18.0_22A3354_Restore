@implementation PLPTPAssetReader

- (PLPTPAssetReader)initWithPath:(id)a3
{
  id v4;
  PLPTPAssetReader *v5;
  uint64_t v6;
  NSString *path;
  PLPTPAssetReader *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPTPAssetReader;
  v5 = -[PLPTPAssetReader init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (PLPTPAssetReader)initWithTemporaryFileDeletedOnDeallocPath:(id)a3
{
  PLPTPAssetReader *v3;
  PLPTPAssetReader *v4;
  PLPTPAssetReader *v5;

  v3 = -[PLPTPAssetReader initWithPath:](self, "initWithPath:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_shouldDeleteTemporaryFileOnDeallocation = 1;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSString *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSString *path;
  int v16;
  id v17;
  NSObject *v18;
  NSString *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  NSString *v24;
  objc_super v25;
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_shouldDeleteTemporaryFileOnDeallocation)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -1;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_path, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v8 = objc_msgSend(v3, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v28, v7, v4, &v27);
    v9 = v27;

    if ((v8 & 1) == 0)
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        *(_DWORD *)buf = 138412546;
        v30 = path;
        v31 = 2112;
        v32 = v9;
        v12 = "Unable to get relationship between temp dir and %@: %@";
        v13 = v10;
        v14 = 22;
        goto LABEL_8;
      }
LABEL_16:

      goto LABEL_17;
    }
    if (v28)
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = self->_path;
        *(_DWORD *)buf = 138412290;
        v30 = v11;
        v12 = "Refusing to delete item not in temporary directory %@";
        v13 = v10;
        v14 = 12;
LABEL_8:
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    v26 = v9;
    v16 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v26);
    v17 = v26;

    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v10 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = self->_path;
        *(_DWORD *)buf = 138412290;
        v30 = v19;
        v20 = "Deleted temporary ptp asset reader file %@";
        v21 = v10;
        v22 = OS_LOG_TYPE_DEBUG;
        v23 = 12;
LABEL_14:
        _os_log_impl(&dword_199541000, v21, v22, v20, buf, v23);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_path;
      *(_DWORD *)buf = 138412546;
      v30 = v24;
      v31 = 2112;
      v32 = v17;
      v20 = "Unable to delete PTP asset reader temporary file %@: %@";
      v21 = v10;
      v22 = OS_LOG_TYPE_ERROR;
      v23 = 22;
      goto LABEL_14;
    }
    v9 = v17;
    goto LABEL_16;
  }
LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)PLPTPAssetReader;
  -[PLPTPAssetReader dealloc](&v25, sel_dealloc);
}

- (id)dataSourcePathForDataRange:(_NSRange)a3 error:(id *)a4
{
  return self->_path;
}

- (id)description
{
  void *v3;
  void *v4;

  +[PLDescriptionBuilder descriptionBuilderWithObject:](PLDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:typeCode:value:", CFSTR("path"), "@", &self->_path);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)path
{
  return self->_path;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
