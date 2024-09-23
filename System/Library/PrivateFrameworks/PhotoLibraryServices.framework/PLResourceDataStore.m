@implementation PLResourceDataStore

- (PLResourceDataStore)initWithPathManager:(id)a3
{
  id v6;
  PLResourceDataStore *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLResourceDataStore;
  v7 = -[PLResourceDataStore init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLResourceDataStore.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    }
    objc_storeStrong((id *)&v7->_pathManager, a3);
  }

  return v7;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (id)name
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 72, CFSTR("Subclass to implement"));

  return 0;
}

- (id)descriptionForSubtype:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
}

- (id)keyFromKeyStruct:(const void *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 99, CFSTR("Subclass to implement"));

  return 0;
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 104, CFSTR("Subclass to implement"));

  return 0;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 109, CFSTR("Subclass to implement"));

  return 0;
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 114, CFSTR("Subclass to implement"));

  return 0;
}

- (id)virtualResourcesForAsset:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 124, CFSTR("Subclass to implement"));

  return 0;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 129, CFSTR("Subclass to implement"));

  return 0;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 134, CFSTR("Subclass to implement"));

  return 0;
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 139, CFSTR("Subclass to implement"));

  return 0;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 144, CFSTR("Subclass to implement"));

  return 0;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return 0;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLResourceDataStore.m"), 153, CFSTR("Subclass to implement"));

  return 0;
}

- (BOOL)canStreamResource:(id)a3
{
  return 0;
}

- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  if (a10)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74600];
    v12 = a10;
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))a10 + 2))(v12, 0, 0, 0, 0, v13);

  }
}

- (id)guessUTIForExternalResource:(id)a3 forAssetKind:(signed __int16)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "resourceType");
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLGuessResourceUTIForResourceType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  return 0;
}

- (BOOL)supportsTimeRange
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
}

+ (BOOL)isMasterThumbRecipeID:(unsigned int)a3
{
  return a3 == 269159 || a3 == 272155 || a3 == 272151;
}

+ (unsigned)storeClassID
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceDataStore.m"), 58, CFSTR("Subclass to implement"));

  return 0;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceDataStore.m"), 81, CFSTR("Subclass to implement"));

  return 0;
}

+ (BOOL)keyDataIsValid:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
    v6 = v5 == objc_msgSend(a1, "keyLengthWithDataPreview:", *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v4), "bytes"));
  else
    v6 = 0;

  return v6;
}

+ (id)supportedRecipes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceDataStore.m"), 119, CFSTR("Subclass to implement"));

  return 0;
}

@end
