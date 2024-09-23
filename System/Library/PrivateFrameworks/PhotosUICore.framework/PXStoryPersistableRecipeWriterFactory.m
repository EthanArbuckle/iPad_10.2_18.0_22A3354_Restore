@implementation PXStoryPersistableRecipeWriterFactory

+ (BOOL)canPersistForConfiguration:(id)a3
{
  void *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryPersistableRecipeWriter.m"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v12, v13);

      }
      v7 = objc_msgSend(v6, "pendingState");
      v8 = (v7 < 4) & (0xBu >> (v7 & 0xF));

    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

+ (id)defaultPersistableRecipeWriterForConfiguration:(id)a3
{
  id v3;
  void *v4;
  PXStoryPHMemoryPersistableRecipeWriter *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[PXStoryPersistableRecipeWriterFactory canPersistForConfiguration:](PXStoryPersistableRecipeWriterFactory, "canPersistForConfiguration:", v3))
  {
    v5 = -[PXStoryPHMemoryPersistableRecipeWriter initWithMemory:]([PXStoryPHMemoryPersistableRecipeWriter alloc], "initWithMemory:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0CD1620]);
      objc_msgSend(v3, "referencePersons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, v12, 0, 0, 0, 0);

      v5 = -[PXStoryPHAssetCollectionPersistableRecipeWriter initWithAssetCollection:referencePersons:]([PXStoryPHAssetCollectionPersistableRecipeWriter alloc], "initWithAssetCollection:referencePersons:", v4, v15);
    }
    else
    {
      PXStoryErrorCreateWithCodeDebugFormat(4, CFSTR("Can't persist recipe with asset collection %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PXStoryNullPersistableRecipeWriter initWithError:]([PXStoryNullPersistableRecipeWriter alloc], "initWithError:", v12);
    }

  }
  return v5;
}

@end
