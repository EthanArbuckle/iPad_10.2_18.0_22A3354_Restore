@implementation PLFilesystemDeletionInfo

- (PLFilesystemDeletionInfo)initWithObjectIDURI:(id)a3 directory:(id)a4 filename:(id)a5 fileURLs:(id)a6 thumbnailIndex:(unint64_t)a7 thumbnailIdentifier:(id)a8 uuid:(id)a9 timestamp:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  PLFilesystemDeletionInfo *v20;
  uint64_t v21;
  PLFilesystemDeletionInfo *v22;
  int v23;
  uint64_t v24;
  NSString *directory;
  uint64_t v26;
  NSString *filename;
  unint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  objc_super v38;

  v30 = a3;
  v32 = a4;
  v31 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v38.receiver = self;
  v38.super_class = (Class)PLFilesystemDeletionInfo;
  v20 = -[PLFilesystemDeletionInfo init](&v38, sel_init);
  if (!v20)
    goto LABEL_11;
  if (a7 != 0x7FFFFFFFFFFFFFFFLL || v18)
  {
    if (!v19)
      goto LABEL_12;
    goto LABEL_8;
  }
  v21 = objc_msgSend(v17, "count");
  v22 = 0;
  if (v19 && v21)
  {
LABEL_8:
    if (!PLIsAssetsd())
      goto LABEL_10;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1;
    pl_dispatch_once();
    v33 = v30;
    pl_dispatch_sync();
    v23 = *((unsigned __int8 *)v35 + 24);

    _Block_object_dispose(&v34, 8);
    if (v23)
    {
LABEL_10:
      v24 = objc_msgSend(v32, "copy", a7);
      directory = v20->_directory;
      v20->_directory = (NSString *)v24;

      v26 = objc_msgSend(v31, "copy");
      filename = v20->_filename;
      v20->_filename = (NSString *)v26;

      objc_storeStrong((id *)&v20->_objectIDURI, a3);
      objc_storeStrong((id *)&v20->_fileURLs, a6);
      v20->_thumbnailIndex = v29;
      objc_storeStrong((id *)&v20->_thumbnailIdentifier, a8);
      objc_storeStrong((id *)&v20->_uuid, a9);
      v20->_timestamp = a10;
LABEL_11:
      v22 = v20;
      goto LABEL_13;
    }
LABEL_12:
    v22 = 0;
  }
LABEL_13:

  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PLFilesystemDeletionInfo;
  -[PLFilesystemDeletionInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@, %@, [%lu, %@] %@ %llu"), v4, self->_objectIDURI, self->_fileURLs, self->_thumbnailIndex, self->_thumbnailIdentifier, self->_uuid, self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)objectIDURI
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)fileURLs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileURLs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)thumbnailIndex
{
  return self->_thumbnailIndex;
}

- (NSString)thumbnailIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setThumbnailIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_thumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_objectIDURI, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

uint64_t __126__PLFilesystemDeletionInfo_initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp__processedDeletions, "containsObject:", *(_QWORD *)(a1 + 32));
  if (!(_DWORD)result)
    return objc_msgSend((id)initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp__processedDeletions, "addObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

void __126__PLFilesystemDeletionInfo_initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.assetsd.filesystemDeletionInfo.isolation", 0);
  v1 = (void *)initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp__filesystemDeletionInfoIsolation;
  initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp__filesystemDeletionInfoIsolation = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp__processedDeletions;
  initWithObjectIDURI_directory_filename_fileURLs_thumbnailIndex_thumbnailIdentifier_uuid_timestamp__processedDeletions = v2;

}

+ (id)deletionInfoWithAsset:(id)a3
{
  id v3;
  void *v4;
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
  NSObject *v15;
  PLFilesystemDeletionInfo *v16;
  PLFilesystemDeletionInfo *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "directory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length"))
    {
      objc_msgSend(v4, "allFileURLs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hasPrefix:", CFSTR("DCIM")) & 1) == 0)
      {
        v28 = v7;

        v6 = 0;
        v5 = 0;
LABEL_20:
        v17 = [PLFilesystemDeletionInfo alloc];
        objc_msgSend(v4, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URIRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v4, "effectiveThumbnailIndex");
        objc_msgSend(v4, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = mach_absolute_time();
        v24 = v21;
        v7 = v28;
        v16 = -[PLFilesystemDeletionInfo initWithObjectIDURI:directory:filename:fileURLs:thumbnailIndex:thumbnailIdentifier:uuid:timestamp:](v17, "initWithObjectIDURI:directory:filename:fileURLs:thumbnailIndex:thumbnailIdentifier:uuid:timestamp:", v19, v5, v6, v20, v24, v28, v22, v23);

        goto LABEL_21;
      }
      if (objc_msgSend(v8, "count"))
      {
        if (PLIsAssetsd())
        {
          v9 = (void *)MEMORY[0x1E0C97B48];
          +[PLManagedAsset entityName](PLManagedAsset, "entityName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("directory = %@ AND filename = %@"), v5, v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setPredicate:", v12);

          objc_msgSend(v11, "setIncludesPropertyValues:", 0);
          objc_msgSend(v11, "setIncludesPendingChanges:", 0);
          objc_msgSend(v4, "managedObjectContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "executeFetchRequest:error:", v11, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count") && objc_msgSend(v14, "indexOfObjectIdenticalTo:", v4) == 0x7FFFFFFFFFFFFFFFLL)
          {
            PLBackendGetLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v30 = v8;
              v31 = 2112;
              v32 = v4;
              v33 = 2112;
              v34 = v14;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Denying attempt to delete file paths %@ from %@ since we found duplicates %@", buf, 0x20u);
            }

            v8 = 0;
            v7 = 0;
          }

        }
      }
      else
      {

        v5 = 0;
        v6 = 0;
      }
      if ((objc_msgSend(v4, "couldBeStoredInDCIM") & 1) != 0)
      {
        v28 = v7;
        goto LABEL_20;
      }
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "mainFileURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v4;
        v31 = 2112;
        v32 = v27;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Denying attempt to delete %@ from %@", buf, 0x16u);

      }
    }
    else
    {

    }
    v16 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

@end
