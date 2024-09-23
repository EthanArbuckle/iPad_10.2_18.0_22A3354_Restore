@implementation PLSharedStreamsDataStoreKey

- (PLSharedStreamsDataStoreKey)initWithAsset:(id)a3 album:(id)a4 type:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  PLSharedStreamsDataStoreKey *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PLSharedStreamsDataStoreKey *v33;
  id v34;
  PLSharedStreamsDataStoreKey *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = *(_QWORD *)&a5;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "cloudGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
    goto LABEL_7;
  objc_msgSend(v9, "cloudPersonID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v8, "filename");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v8, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isUBF");

    if (v15)
    {
      v16 = (void *)objc_opt_class();
      objc_msgSend(v9, "cloudPersonID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudGUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filename");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_relativeFilePathForPersonID:albumID:fileName:", v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "assetID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "directory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)objc_opt_class();
      objc_msgSend(v9, "cloudPersonID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudGUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filename");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_relativeDCIMFilePathForPersonID:albumID:dcimDirectory:fileName:", v18, v19, v17, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v31, "length") > 0xFC)
    {
      v35 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_keyDataWithRelativePath:type:", v20, v5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = [PLSharedStreamsDataStoreKey alloc];
      v34 = objc_retainAutorelease(v32);
      v35 = -[PLSharedStreamsDataStoreKey initWithKeyStruct:](v33, "initWithKeyStruct:", objc_msgSend(v34, "bytes"));

    }
    v25 = v35;

    if (v25)
      goto LABEL_12;
    goto LABEL_9;
  }
LABEL_8:

LABEL_9:
  PLImageManagerGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "cloudGUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudPersonID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filename");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138412802;
    v37 = v22;
    v38 = 2112;
    v39 = v23;
    v40 = 2112;
    v41 = v24;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "[RM]: Attempt to init PLSharedStreamsDataStoreKey with missing info. cloudGUID: %@, cloudPersonID: %@, filename: %@", (uint8_t *)&v36, 0x20u);

  }
  v25 = 0;
LABEL_12:

  return v25;
}

- (id)keyData
{
  return (id)objc_msgSend((id)objc_opt_class(), "_keyDataWithRelativePath:type:", self->_relativePath, self->_sharedStreamsResourceType);
}

- (PLSharedStreamsDataStoreKey)initWithKeyStruct:(const void *)a3
{
  PLSharedStreamsDataStoreKey *v4;
  PLSharedStreamsDataStoreKey *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *relativePath;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLSharedStreamsDataStoreKey;
  v4 = -[PLSharedStreamsDataStoreKey init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(unsigned __int8 *)a3;
    v4->_sharedStreamsResourceType = *((unsigned __int8 *)a3 + 2);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", (char *)a3 + 3, v6 - 3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v8;

  }
  return v5;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (BOOL)isEqual:(id)a3
{
  PLSharedStreamsDataStoreKey *v4;
  BOOL v5;

  v4 = (PLSharedStreamsDataStoreKey *)a3;
  if (v4 == self)
    v5 = 1;
  else
    v5 = (objc_opt_respondsToSelector() & 1) != 0
      && -[PLSharedStreamsDataStoreKey isEqualToKey:](self, "isEqualToKey:", v4);

  return v5;
}

- (id)uniformTypeIdentifier
{
  unsigned int v2;
  void *v3;

  v2 = self->_sharedStreamsResourceType - 3;
  if (v2 > 5)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(**((id **)&unk_1E3675ED8 + v2), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (-[NSString length](self->_relativePath, "length"))
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    +[PLResourceModelValidationError malformedKeyErrorForKey:resource:](PLResourceModelValidationError, "malformedKeyErrorForKey:resource:", self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PLSharedStreamsDataStoreKey fileURLForAssetID:](self, "fileURLForAssetID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) == 0)
  {
    +[PLResourceModelValidationError unreachableKeyErrorForKey:atURL:resource:](PLResourceModelValidationError, "unreachableKeyErrorForKey:atURL:resource:", self, v10, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
  }

  return v8;
}

- (unsigned)resourceType
{
  uint64_t sharedStreamsResourceType;

  sharedStreamsResourceType = self->_sharedStreamsResourceType;
  if (sharedStreamsResourceType > 9)
    return 3;
  else
    return dword_199B9B604[sharedStreamsResourceType];
}

- (unsigned)resourceVersion
{
  return 0;
}

- (BOOL)isDerivative
{
  return 1;
}

- (unsigned)recipeIDForAssetID:(id)a3
{
  uint64_t sharedStreamsResourceType;

  sharedStreamsResourceType = self->_sharedStreamsResourceType;
  if (sharedStreamsResourceType > 9)
    return 65741;
  else
    return dword_199B9B5C8[sharedStreamsResourceType];
}

- (id)descriptionForAssetID:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSharedStreamsDataStoreKey fileURLForAssetID:](self, "fileURLForAssetID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>, fileURL: %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fileURLForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "libraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoDirectoryWithType:", 22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_replacementPathExtensionForType:", self->_sharedStreamsResourceType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_relativePath;
  v11 = v10;
  if (v9)
  {
    -[NSString stringByDeletingPathExtension](v10, "stringByDeletingPathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  objc_msgSend(v8, "stringByAppendingPathComponent:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v16 = objc_msgSend((id)objc_opt_class(), "refreshSandboxExtensionForURL:assetID:error:", v15, v4, &v20);
    v17 = v20;
    if ((v16 & 1) == 0)
    {
      PLImageManagerGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v14;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to get sandbox extension for path: %@, error: %@", buf, 0x16u);
      }

      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePath, 0);
}

+ (id)_replacementPathExtensionForType:(unsigned int)a3
{
  if (a3 - 4 > 4)
    return 0;
  else
    return off_1E3675EB0[a3 - 4];
}

+ (id)_relativeFilePathForPersonID:(id)a3 albumID:(id)a4 fileName:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v11, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_relativeDCIMFilePathForPersonID:(id)a3 albumID:(id)a4 dcimDirectory:(id)a5 fileName:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v17[0] = a3;
  v17[1] = a4;
  v17[2] = a5;
  v17[3] = a6;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_keyDataWithRelativePath:(id)a3 type:(unsigned int)a4
{
  char v4;
  void *v5;
  void *v6;
  char v8;
  char v9;
  char v10;

  v4 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v5, "length") + 3);
  v10 = objc_msgSend(v5, "length") + 3;
  v9 = 0;
  v8 = v4;
  objc_msgSend(v6, "appendBytes:length:", &v10, 1);
  objc_msgSend(v6, "appendBytes:length:", &v9, 1);
  objc_msgSend(v6, "appendBytes:length:", &v8, 1);
  objc_msgSend(v6, "appendData:", v5);

  return v6;
}

+ (unint64_t)dataLengthFromPreviewByte:(unsigned __int8)a3
{
  return a3;
}

@end
