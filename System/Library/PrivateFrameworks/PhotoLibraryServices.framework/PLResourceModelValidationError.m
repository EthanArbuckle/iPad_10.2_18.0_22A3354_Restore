@implementation PLResourceModelValidationError

- (PLResourceModelValidationError)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLResourceModelValidationError;
  return -[PLResourceModelValidationError init](&v3, sel_init);
}

- (id)description
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[PLResourceModelValidationError code](self, "code");
  if ((unint64_t)(v3 - 1) > 0xA)
    v4 = 0;
  else
    v4 = off_1E3664778[v3 - 1];
  v5 = (void *)MEMORY[0x1E0CB37A0];
  -[PLResourceModelValidationError userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("PLResourceModelValidationError <%p>: %@, %@"), self, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLResourceModelValidationError userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dataStoreKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "keyData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" keyData: %@"), v10);

  }
  return v7;
}

+ (id)allPossibleErrorCodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E375DDE8, &unk_1E375DE00, &unk_1E375DE18, &unk_1E375DE30, &unk_1E375DE48, &unk_1E375DE60, &unk_1E375DE78, &unk_1E375DE90, &unk_1E375DEA8, &unk_1E375DEC0, 0);
}

+ (id)missingRequiredResourcesErrorForAsset:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceModelValidationError.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v9 = objc_alloc((Class)objc_opt_class());
  v15[0] = CFSTR("assetUUID");
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("message");
  v16[0] = v10;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 8, v11);

  return v12;
}

+ (id)duplicateResourceErrorAmongResources:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceModelValidationError.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resources"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceModelValidationError.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = objc_alloc((Class)objc_opt_class());
  v17[0] = CFSTR("resources");
  v17[1] = CFSTR("assetUUID");
  v18[0] = v7;
  objc_msgSend(v9, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 7, v12);

  return v13;
}

+ (id)duplicatedCPLTypeAssetErrorForAsset:(id)a3 cplType:(unint64_t)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceModelValidationError.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v8 = objc_alloc((Class)objc_opt_class());
  v15[0] = CFSTR("cplType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("assetUUID");
  v16[0] = v9;
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 9, v11);

  return v12;
}

+ (id)localAvailabilityInconsistencyErrorForResource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v9 = CFSTR("resource");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 5, v6);

  if (!v3)
  return v7;
}

+ (id)unexpectedLocalResourceError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v9 = CFSTR("resource");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 6, v6);

  if (!v3)
  return v7;
}

+ (id)malformedKeyErrorForKey:(id)a3 resource:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceModelValidationError.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v9 = objc_alloc((Class)objc_opt_class());
  v15[0] = CFSTR("dataStoreKey");
  v15[1] = CFSTR("resource");
  v16[0] = v7;
  v10 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 1, v11);

  if (!v8)
  return v12;
}

+ (id)malformedTableThumbnailKeyErrorForKey:(id)a3 assetID:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceModelValidationError.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v9 = objc_alloc((Class)objc_opt_class());
  v16[0] = CFSTR("dataStoreKey");
  v16[1] = CFSTR("assetUUID");
  v17[0] = v7;
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "uuid");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 2, v12);

  return v13;
}

+ (id)unreachableKeyErrorForKey:(id)a3 atURL:(id)a4 resource:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceModelValidationError.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v12 = objc_alloc((Class)objc_opt_class());
  v20[0] = v9;
  v19[0] = CFSTR("dataStoreKey");
  v19[1] = CFSTR("fileURL");
  v13 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v13;
  v19[2] = CFSTR("resource");
  v14 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 3, v15);

  if (!v11)
  {

    if (v10)
      goto LABEL_9;
LABEL_11:

    goto LABEL_9;
  }
  if (!v10)
    goto LABEL_11;
LABEL_9:

  return v16;
}

+ (id)unreachableTableThumbnailErrorForKey:(id)a3 assetID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc((Class)objc_opt_class());
  v13[0] = CFSTR("dataStoreKey");
  v13[1] = CFSTR("assetUUID");
  v14[0] = v5;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "uuid");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 4, v10);

  return v11;
}

+ (id)unreachableFileThumbnailErrorForKey:(id)a3 assetID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc((Class)objc_opt_class());
  v13[0] = CFSTR("dataStoreKey");
  v13[1] = CFSTR("assetUUID");
  v14[0] = v5;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "uuid");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 10, v10);

  return v11;
}

+ (id)tableThumbUUIDMistmatchErrorForKey:(id)a3 indexFromKey:(unint64_t)a4 assetID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc((Class)objc_opt_class());
  v17[0] = v7;
  v16[0] = CFSTR("dataStoreKey");
  v16[1] = CFSTR("tableEntryIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16[2] = CFSTR("assetUUID");
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("com.apple.photos.resourcemodel.validation"), 11, v13);

  if (!v11)
  return v14;
}

@end
