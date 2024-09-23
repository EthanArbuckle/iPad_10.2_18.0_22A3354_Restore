@implementation PLPrimaryResourceDataStoreFilePathKey

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[PLPrimaryResourceDataStoreFilePathKey fileURLForAssetID:](self, "fileURLForAssetID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    +[PLResourceModelValidationError unreachableKeyErrorForKey:atURL:resource:](PLResourceModelValidationError, "unreachableKeyErrorForKey:atURL:resource:", self, v7, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)keyData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PLPrimaryResourceDataStoreFilePathKey filePathSuffix](self, "filePathSuffix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") + 2;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBytes:length:", &self->_keyStruct, 2);
  -[PLPrimaryResourceDataStoreFilePathKey filePathSuffix](self, "filePathSuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "length") <= 0xF)
  {
    v8 = malloc_type_calloc(0x10uLL, 1uLL, 0xCFF50BBBuLL);
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    __strncpy_chk();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v8, 16);

  }
  objc_msgSend(v5, "appendData:", v7);

  return v5;
}

- (PLPrimaryResourceDataStoreFilePathKey)initWithKeyStruct:(const void *)a3
{
  PLPrimaryResourceDataStoreFilePathKey *v4;
  PLPrimaryResourceDataStoreFilePathKey *v5;
  __int16 v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  v4 = -[PLPrimaryResourceDataStoreKey _initWithKeyStruct:](&v9, sel__initWithKeyStruct_);
  v5 = v4;
  if (v4)
  {
    v6 = *(_WORD *)a3;
    *(_WORD *)&v4->_keyStruct = *(_WORD *)a3;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", (char *)a3 + 2, v6, 4);
    -[PLPrimaryResourceDataStoreFilePathKey setFilePathSuffix:](v5, "setFilePathSuffix:", v7);

  }
  return v5;
}

- (id)fileURLForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPrimaryResourceDataStoreFilePathKey filePathSuffix](self, "filePathSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_11;
  if ((*(_WORD *)&self->_keyStruct & 0x1C00) != 0)
  {
    if (v4)
    {
      objc_msgSend(v4, "libraryID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLDataStoreForClassIDAndLibraryID(0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "pathManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photoDirectoryWithType:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "stringByAppendingString:", off_1E366EE78[((unint64_t)*(_WORD *)&self->_keyStruct >> 10) & 7]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPrimaryResourceDataStoreFilePathKey filePathSuffix](self, "filePathSuffix");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_5;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  -[PLPrimaryResourceDataStoreFilePathKey filePathSuffix](self, "filePathSuffix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_11;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v14 = objc_msgSend((id)objc_opt_class(), "refreshSandboxExtensionForURL:assetID:error:", v13, v4, &v18);
  v15 = v18;
  if ((v14 & 1) == 0)
  {
    PLImageManagerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to get sandbox extension for path: %@, error: %@", buf, 0x16u);
    }

    v13 = 0;
  }

LABEL_12:
  return v13;
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  v8 = -[PLPrimaryResourceDataStoreKey _initFromExistingLocationOfExternalResource:asset:](&v18, sel__initFromExistingLocationOfExternalResource_asset_, v6, v7);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v6, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v6, "resourceType") == 3)
      {
        objc_msgSend(v7, "pathForVideoComplementFile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
LABEL_10:
          objc_msgSend(v7, "assetID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "libraryID");
          v16 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)objc_msgSend(v9, "initWithFilePath:andLibraryID:", v13, v16);
          v9 = (void *)v16;
          goto LABEL_11;
        }
LABEL_7:
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v7, "mainFileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v11;
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_10;
    goto LABEL_7;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)uniformTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PLPrimaryResourceDataStoreFilePathKey extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceModelTypeForFilenameExtension:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PLPrimaryResourceDataStoreFilePathKey)initWithFilePath:(id)a3 andLibraryID:(id)a4
{
  id v7;
  id v8;
  _WORD *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  char v17;
  __int16 v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  _WORD *v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  unsigned __int8 v34;
  void *v36;
  objc_super v37;

  v7 = a3;
  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  v9 = -[PLPrimaryResourceDataStoreKey _init](&v37, sel__init);
  if (!v9)
    goto LABEL_24;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PLPrimaryResourceDataStoreFilePathKey.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filePath"));

  }
  PLPathManagerFromLibraryID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoDirectoryWithType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13 = v11;
  v14 = v13;
  if (!v13)
    goto LABEL_20;
  v15 = CFSTR("/PhotoData/Thumbnails/V2/PhotoData/CPLAssets/group");
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("/PhotoData/Thumbnails/V2/PhotoData/CPLAssets/group"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "hasPrefix:", v16);

  if ((v17 & 1) == 0)
  {
    v15 = CFSTR("/PhotoData/Metadata/PhotoData/CPLAssets/group");
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("/PhotoData/Metadata/PhotoData/CPLAssets/group"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v12, "hasPrefix:", v19);

    if ((v20 & 1) != 0)
    {
      v18 = 4096;
      goto LABEL_19;
    }
    v15 = CFSTR("/PhotoData/CPLAssets/group");
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("/PhotoData/CPLAssets/group"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "hasPrefix:", v21);

    if ((v22 & 1) != 0)
    {
      v18 = 6144;
      goto LABEL_19;
    }
    v15 = CFSTR("/PhotoData/Thumbnails/V2/PhotoData/");
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("/PhotoData/Thumbnails/V2/PhotoData/"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v12, "hasPrefix:", v23);

    if ((v24 & 1) != 0)
    {
      v18 = 3072;
      goto LABEL_19;
    }
    v15 = CFSTR("/PhotoData/");
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("/PhotoData/"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v12, "hasPrefix:", v25);

    if ((v26 & 1) != 0)
    {
      v18 = 1024;
      goto LABEL_19;
    }
    v15 = CFSTR("/DCIM/");
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("/DCIM/"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v12, "hasPrefix:", v27);

    if ((v28 & 1) != 0)
    {
      v18 = 2048;
      goto LABEL_19;
    }
    if (objc_msgSend(v12, "hasPrefix:", v14))
    {
      v15 = &stru_1E36789C0;
      v18 = 7168;
      goto LABEL_19;
    }
LABEL_20:

    v29 = v9 + 4;
    v9[4] &= 0xE3FFu;
    v31 = v12;
    goto LABEL_21;
  }
  v18 = 5120;
LABEL_19:

  v29 = v9 + 4;
  v9[4] = v9[4] & 0xE3FF | v18;
  objc_msgSend(v14, "stringByAppendingString:", v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v30, "length"));
  v31 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
  objc_msgSend(v9, "setFilePathSuffix:", v31);
  objc_msgSend(v31, "dataUsingEncoding:", 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  v34 = 16;
  if (v33 > 0x10)
    v34 = v33;
  *v29 = *v29 & 0xFC00 | v34;

LABEL_24:
  return (PLPrimaryResourceDataStoreFilePathKey *)v9;
}

- (id)extension
{
  void *v2;
  void *v3;

  -[PLPrimaryResourceDataStoreFilePathKey filePathSuffix](self, "filePathSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionForAssetID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t keyStruct;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  -[PLPrimaryResourceDataStoreKey descriptionForAssetID:](&v13, sel_descriptionForAssetID_, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  keyStruct = (unint64_t)self->_keyStruct;
  v9 = off_1E366EEB8[(keyStruct >> 10) & 7];
  if ((keyStruct & 0x300) != 0)
    v10 = 0;
  else
    v10 = CFSTR("v1");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@, (%@, %@)"), v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)keyStruct
{
  return (PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)*(_WORD *)&self->_keyStruct;
}

- (void)setKeyStruct:(PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)a3
{
  *(_WORD *)&self->_keyStruct = a3;
}

- (NSString)filePathSuffix
{
  return self->_filePathSuffix;
}

- (void)setFilePathSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePathSuffix, 0);
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPrimaryResourceDataStoreFilePathKey.m"), 177, CFSTR("fileURLForPayload not supported for filePath key."));

  return 0;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return a3 + 2;
}

@end
