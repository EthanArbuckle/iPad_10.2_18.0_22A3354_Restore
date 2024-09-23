@implementation PLPrimaryResourceDataStoreUniformFileKey

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return 6;
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  unint64_t v5;

  v5 = a3;
  objc_msgSend(a1, "_fileURLFromKeyStruct:assetID:", &v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_fileURLFromKeyStruct:(PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1 *)a3 assetID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "libraryID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "keyHelperForBundleScope:", objc_msgSend(v6, "bundleScope"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldUseFileIdentifierForBundleScope:", objc_msgSend(v6, "bundleScope"));

  if (v11)
  {
    objc_msgSend(v6, "uuid");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    _fileExtensionFromFileType((*((unsigned __int16 *)a3 + 2) >> 7), (*((unsigned __int16 *)a3 + 2) >> 5) & 3);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "UTF8String");
    *(_QWORD *)&v23 = *(_QWORD *)(v9 + 40);
    v22 = *(_OWORD *)(v9 + 24);
    PLURLForResourceProperties();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _fileExtensionFromFileType((*((unsigned __int16 *)a3 + 2) >> 7), ((*(_DWORD *)a3 | ((unint64_t)*((unsigned __int16 *)a3 + 2) << 32)) >> 37) & 3);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    objc_msgSend(v6, "filename");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "directory");
    v15 = v8;
    v16 = a1;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_OWORD *)(v9 + 16);
    v23 = *(_OWORD *)(v9 + 32);
    PLDCIMURLForResourceProperties();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v16;
    v8 = v15;
  }

  if (v14)
  {
    v24 = 0;
    v18 = objc_msgSend(a1, "refreshSandboxExtensionForURL:assetID:error:", v14, v6, &v24, v22, (_QWORD)v23);
    v19 = v24;
    if ((v18 & 1) == 0)
    {
      PLImageManagerGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v14;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to get sandbox extension for url: %@, error: %@", buf, 0x16u);
      }

      v14 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v14;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "libraryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isUBF");
  v12 = *(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int16 *)&self->_keyStruct + 2) << 32);
  if ((v12 & 0x7F8000000000) == 0 || (*(_DWORD *)&self->_keyStruct & 0x1F000) == 0x1F000)
  {

    goto LABEL_7;
  }
  if ((v11 & 1) != 0)
  {
    v13 = v12 & 0x6000000000;

    if (!v13)
      goto LABEL_9;
LABEL_7:
    v14 = v7;
    +[PLResourceModelValidationError malformedKeyErrorForKey:resource:](PLResourceModelValidationError, "malformedKeyErrorForKey:resource:", self, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v17 = ((v12 >> 37) & 3) - 1;

  if (v17 >= 2)
    goto LABEL_7;
LABEL_9:
  v14 = v7;
  v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_10:
  -[PLPrimaryResourceDataStoreUniformFileKey fileURLForAssetID:](self, "fileURLForAssetID:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

  if ((v21 & 1) == 0)
  {
    if (-[PLPrimaryResourceDataStoreUniformFileKey isDerivative](self, "isDerivative")
      && (*(_DWORD *)&self->_keyStruct & 0x1E0000) == 0x80000)
    {
      +[PLResourceModelValidationError unreachableFileThumbnailErrorForKey:assetID:](PLResourceModelValidationError, "unreachableFileThumbnailErrorForKey:assetID:", self, v6);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PLResourceModelValidationError unreachableKeyErrorForKey:atURL:resource:](PLResourceModelValidationError, "unreachableKeyErrorForKey:atURL:resource:", self, v18, v14);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;
    objc_msgSend(v16, "arrayByAddingObject:", v22);
    v24 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v24;
  }

  return v16;
}

- (id)keyData
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_keyStruct, 6);
}

- (PLPrimaryResourceDataStoreUniformFileKey)initWithKeyStruct:(const void *)a3
{
  PLPrimaryResourceDataStoreUniformFileKey *result;
  __int16 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLPrimaryResourceDataStoreUniformFileKey;
  result = -[PLPrimaryResourceDataStoreKey _initWithKeyStruct:](&v6, sel__initWithKeyStruct_);
  if (result)
  {
    v5 = *((_WORD *)a3 + 2);
    *(_DWORD *)&result->_keyStruct = *(_DWORD *)a3;
    *((_WORD *)&result->_keyStruct + 2) = v5;
  }
  return result;
}

- (id)uniformTypeIdentifier
{
  void *v2;
  void *v3;

  PLUTTypeFromUniformFileType((*((unsigned __int16 *)&self->_keyStruct + 2) >> 7));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  PLPrimaryResourceDataStoreUniformFileKey *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PLPrimaryResourceDataStoreUniformFileKey *v18;
  void *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PLPrimaryResourceDataStoreUniformFileKey;
  v8 = -[PLPrimaryResourceDataStoreKey _initFromExistingLocationOfExternalResource:asset:](&v21, sel__initFromExistingLocationOfExternalResource_asset_, v6, v7);
  if (!v8)
    goto LABEL_6;
  v9 = v8;
  objc_msgSend(v6, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {

LABEL_6:
    v18 = 0;
    goto LABEL_7;
  }
  v11 = [PLPrimaryResourceDataStoreUniformFileKey alloc];
  objc_msgSend(v6, "fileURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "version");
  v14 = objc_msgSend(v6, "resourceType");
  v15 = objc_msgSend(v6, "recipeID");
  v16 = objc_msgSend(v7, "bundleScope");
  objc_msgSend(v7, "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PLPrimaryResourceDataStoreUniformFileKey initWithFilePath:resourceVersion:resourceType:recipeID:bundleScope:pathManager:](v11, "initWithFilePath:resourceVersion:resourceType:recipeID:bundleScope:pathManager:", v12, v13, v14, v15, v16, v17);

  if (!v18)
    v18 = -[PLPrimaryResourceDataStoreFilePathKey initFromExistingLocationOfExternalResource:asset:]([PLPrimaryResourceDataStoreFilePathKey alloc], "initFromExistingLocationOfExternalResource:asset:", v6, v7);
LABEL_7:

  return v18;
}

- (PLPrimaryResourceDataStoreUniformFileKey)initWithFilePath:(id)a3 resourceVersion:(unsigned int)a4 resourceType:(unsigned int)a5 recipeID:(unsigned int)a6 bundleScope:(unsigned __int16)a7 pathManager:(id)a8
{
  uint64_t v9;
  char v12;
  id v14;
  id v15;
  _DWORD *v16;
  _DWORD *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  int v31;
  unint64_t v32;
  objc_super v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v9 = a7;
  v12 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a8;
  v34.receiver = self;
  v34.super_class = (Class)PLPrimaryResourceDataStoreUniformFileKey;
  v16 = -[PLPrimaryResourceDataStoreKey _init](&v34, sel__init);
  v17 = v16;
  if (v16)
  {
    if (a5 == 31)
      goto LABEL_22;
    v16[2] = ((a5 & 0x1F) << 12) | ((v12 & 3) << 10) | v16[2] & 0xFFFE0000 | 3;
    objc_msgSend(v14, "pathExtension");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (onceToken == -1)
    {
      if (v18)
      {
LABEL_5:
        objc_msgSend((id)kFileIdentifierKeyExtensionsToFileTypes, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v21) = objc_msgSend(v20, "unsignedShortValue");

        v21 = v21;
LABEL_10:

        v23 = (v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32)) & 0xFFFF807FFFFFFFFFLL;
        v17[2] = v17[2];
        *((_WORD *)v17 + 6) = (v23 | (v21 << 39)) >> 32;

        if ((objc_msgSend(v15, "isUBF") & 1) != 0
          || objc_msgSend(v15, "shouldUseFileIdentifierForBundleScope:", v9))
        {
          v24 = (v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32)) & 0xFFFFFF9FFFFFFFFFLL;
          *((_WORD *)v17 + 6) = WORD2(v24);
        }
        else
        {
          objc_msgSend(v14, "pathExtension");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lowercaseString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "isEqualToString:", v27);

          if ((v28 & 1) != 0)
          {
            v29 = 0x2000000000;
          }
          else
          {
            objc_msgSend(v26, "uppercaseString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v26, "isEqualToString:", v30);

            if (!v31)
            {

              v17 = 0;
              goto LABEL_22;
            }
            v29 = 0x4000000000;
          }
          v32 = (v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32)) & 0xFFFFFF9FFFFFFFFFLL | v29;
          v17[2] = v32;
          *((_WORD *)v17 + 6) = WORD2(v32);

          v24 = v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32);
        }
        if ((v24 & 0x7F8000000000) != 0 && !(a6 >> 20))
        {
          v25 = v24 & 0xFFE00001FFFFLL | (2 * a6) & 0x1E0000 | ((unint64_t)((unsigned __int16)a6 >> 1) << 21);
          v17[2] = v25;
          *((_WORD *)v17 + 6) = (v25 | ((unint64_t)(a6 & 1) << 36)) >> 32;
          goto LABEL_23;
        }
LABEL_22:

        v17 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_once(&onceToken, &__block_literal_global_69712);
      if (v19)
        goto LABEL_5;
    }
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Cannot determine file type from extension: %{public}@", buf, 0xCu);
    }

    v21 = 0;
    goto LABEL_10;
  }
LABEL_23:

  return (PLPrimaryResourceDataStoreUniformFileKey *)v17;
}

- (id)fileURLForAssetID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_fileURLFromKeyStruct:assetID:", &self->_keyStruct, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)resourceType
{
  return (*(_DWORD *)&self->_keyStruct >> 12) & 0x1F;
}

- (unsigned)resourceVersion
{
  return (*(_DWORD *)&self->_keyStruct >> 10) & 3;
}

- (BOOL)isDerivative
{
  return (*((unsigned __int16 *)&self->_keyStruct + 2) >> 4) & 1;
}

- (unsigned)recipeIDForAssetID:(id)a3
{
  return (*(_DWORD *)&self->_keyStruct >> 1) & 0xF0000 | ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int16 *)&self->_keyStruct + 2) << 32)) >> 20) & 0xFFFE | (*((unsigned __int16 *)&self->_keyStruct + 2) >> 4) & 1;
}

- (PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)keyStruct
{
  return (PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)(*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int16 *)&self->_keyStruct + 2) << 32));
}

- (void)setKeyStruct:(PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)a3
{
  *((_WORD *)&self->_keyStruct + 2) = *((_WORD *)&a3 + 2);
  *(_DWORD *)&self->_keyStruct = a3;
}

@end
