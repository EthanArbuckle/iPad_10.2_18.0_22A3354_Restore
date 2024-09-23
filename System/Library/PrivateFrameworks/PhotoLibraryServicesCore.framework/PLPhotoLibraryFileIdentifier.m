@implementation PLPhotoLibraryFileIdentifier

- (PLPhotoLibraryFileIdentifier)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid initializer used: %s"), "-[PLPhotoLibraryFileIdentifier init]");

  return 0;
}

- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 resourceType:(unsigned int)a7
{
  return -[PLPhotoLibraryFileIdentifier initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:](self, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 0, 0);
}

- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 recipeID:(unsigned int)a7
{
  return -[PLPhotoLibraryFileIdentifier initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:](self, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", a3, a4, a5, *(_QWORD *)&a6, 31, *(_QWORD *)&a7, 0);
}

- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 resourceType:(unsigned int)a7 recipeID:(unsigned int)a8 originalFilename:(id)a9
{
  id v15;
  unint64_t v16;
  unint64_t v17;
  PLPhotoLibraryFileIdentifier *v18;
  uint64_t v19;
  NSString *uuid;
  void *v21;
  void *v23;
  void *v24;
  objc_super v26;

  v15 = a3;
  v16 = (unint64_t)a5;
  v17 = (unint64_t)a9;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryFileIdentifier.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  if (!(v16 | v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryFileIdentifier.m"), 46, CFSTR("Either UTI or originalFilename must be non-nil"));

  }
  v26.receiver = self;
  v26.super_class = (Class)PLPhotoLibraryFileIdentifier;
  v18 = -[PLPhotoLibraryFileIdentifier init](&v26, sel_init);
  if (v18)
  {
    objc_msgSend(v15, "uppercaseString");
    v19 = objc_claimAutoreleasedReturnValue();
    uuid = v18->_uuid;
    v18->_uuid = (NSString *)v19;

    v18->_bundleScope = a4;
    objc_storeStrong((id *)&v18->_uti, a5);
    v18->_resourceType = a7;
    v18->_resourceVersion = a6;
    v18->_recipeId = a8;
    objc_storeStrong((id *)&v18->_originalFilename, a9);
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18->_isData = objc_msgSend(v21, "conformsToType:", *MEMORY[0x1E0CEC4A0]);

    }
  }

  return v18;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSString *uti;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryFileIdentifier uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLPhotoLibraryFileIdentifier bundleScope](self, "bundleScope");
  uti = self->_uti;
  v8 = -[PLPhotoLibraryFileIdentifier resourceVersion](self, "resourceVersion");
  v9 = -[PLPhotoLibraryFileIdentifier resourceType](self, "resourceType");
  v10 = -[PLPhotoLibraryFileIdentifier recipeId](self, "recipeId") >> 16;
  v11 = (unsigned __int16)-[PLPhotoLibraryFileIdentifier recipeId](self, "recipeId") >> 1;
  -[PLPhotoLibraryFileIdentifier originalFilename](self, "originalFilename");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ (%p), uuid=%@, bundleScope=%d uti=%@, resourceVersion=%d, resourceType=%d, recipeClassID=%d, recipeVarationID=%d originalFilename=%@"), v4, self, v5, v6, uti, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)extension
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PLPhotoLibraryFileIdentifier uti](self, "uti");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLPhotoLibraryFileIdentifier resourceType](self, "resourceType") == 5
      && objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CEC4A0]))
    {
      v5 = (id)*MEMORY[0x1E0D75A70];
LABEL_7:
      v6 = v5;
      goto LABEL_14;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D752F0], "preferredOrFallbackFilenameExtensionForType:fallbackIdentifier:", v4, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_7;
  -[PLPhotoLibraryFileIdentifier originalFilename](self, "originalFilename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D752F0], "preferredOrFallbackFilenameExtensionForType:fallbackIdentifier:", v10, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      v6 = v9;

  }
  else
  {
    v6 = 0;
  }

LABEL_14:
  return v6;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
  objc_storeStrong((id *)&self->_originalFilename, a3);
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (unsigned)resourceVersion
{
  return self->_resourceVersion;
}

- (unsigned)recipeId
{
  return self->_recipeId;
}

- (BOOL)isData
{
  return self->_isData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)isValidFileIdentifierParametersForUUID:(id)a3 utiString:(id)a4 originalFilename:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "isDynamic") ^ 1;
    if (!v10)
    {
LABEL_8:
      if (!v10)
        goto LABEL_9;
      goto LABEL_7;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
    if (!v10)
      goto LABEL_8;
  }
  if ((v13 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v9, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (!v15)
  {
LABEL_9:
    if (PFOSVariantHasInternalDiagnostics() && (PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      PLBackendGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v21 = 138543874;
        v22 = v7;
        v23 = 2114;
        v24 = v8;
        v25 = 2112;
        v26 = v9;
        v18 = v17;
        v19 = OS_LOG_TYPE_FAULT;
        goto LABEL_15;
      }
    }
    else
    {
      PLBackendGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = 138543874;
        v22 = v7;
        v23 = 2114;
        v24 = v8;
        v25 = 2112;
        v26 = v9;
        v18 = v17;
        v19 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_199DF7000, v18, v19, "isValidFileIdentifierParameters failed validation with uuid: %{public}@, utiString: %{public}@, originalFilename: %@", (uint8_t *)&v21, 0x20u);
      }
    }

    v16 = 0;
    goto LABEL_17;
  }
LABEL_7:
  v16 = 1;
LABEL_17:

  return v16;
}

+ (id)uuidFromURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") < 0x24)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", 36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    v6 = v5;
    if (v5
      && (objc_msgSend(v5, "UUIDString"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqualToString:", v4),
          v7,
          v8))
    {
      v9 = v4;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

+ (BOOL)isValidOriginalURL:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "fileIdentifierForValidOriginalURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)fileIdentifierForValidOriginalURL:(id)a3
{
  return (id)objc_msgSend(a1, "fileIdentifierForValidOriginalURL:originalsDirectoryName:", a3, CFSTR("originals"));
}

+ (id)fileIdentifierForValidOriginalURL:(id)a3 originalsDirectoryName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryFileIdentifier.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalsDirectoryName"));

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1337;
  v24 = __Block_byref_object_dispose__1338;
  v25 = 0;
  objc_msgSend(a1, "uuidFromURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PLAllowedResourceTypesForOriginalResources();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89__PLPhotoLibraryFileIdentifier_fileIdentifierForValidOriginalURL_originalsDirectoryName___block_invoke;
    v15[3] = &unk_1E3768948;
    v16 = v9;
    v17 = v7;
    v18 = v8;
    v19 = &v20;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

    v11 = v16;
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_DEFAULT, "FileIdentifier - filenameUUID is nil for url: %@", buf, 0xCu);
    }
  }

  v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __89__PLPhotoLibraryFileIdentifier_fileIdentifierForValidOriginalURL_originalsDirectoryName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  PLPhotoLibraryFileIdentifier *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  PLPhotoLibraryFileIdentifier *obj;

  v5 = a2;
  v6 = [PLPhotoLibraryFileIdentifier alloc];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = objc_msgSend(v5, "integerValue");
  objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  obj = -[PLPhotoLibraryFileIdentifier initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:](v6, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v7, 0, 0, 0, v8, 0, v9);

  v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  -[PLPhotoLibraryFileIdentifier extension](obj, "extension");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "UTF8String");
  LODWORD(v9) = objc_msgSend(v5, "integerValue");

  PLPathForResourceProperties(v10, v12, v9, 0, 0, -[PLPhotoLibraryFileIdentifier isData](obj, "isData"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), objc_msgSend(CFSTR("resources/renders"), "UTF8String"), objc_msgSend(CFSTR("resources/derivatives"), "UTF8String"), objc_msgSend(CFSTR("resources/caches/compute"), "UTF8String"), objc_msgSend(CFSTR("resources/derivatives/masters"), "UTF8String"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pathComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pathComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "count");
  if (v17 > objc_msgSend(v16, "count"))
  {
    objc_msgSend(v15, "subarrayWithRange:", objc_msgSend(v15, "count") - objc_msgSend(v16, "count"), objc_msgSend(v16, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToArray:", v16);

    if (v19)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
      *a4 = 1;
    }
  }

}

@end
