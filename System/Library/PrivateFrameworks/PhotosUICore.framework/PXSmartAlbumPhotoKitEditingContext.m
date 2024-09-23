@implementation PXSmartAlbumPhotoKitEditingContext

- (PXSmartAlbumPhotoKitEditingContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitEditingContext.m"), 37, CFSTR("%s is not available as initializer"), "-[PXSmartAlbumPhotoKitEditingContext init]");

  abort();
}

- (PXSmartAlbumPhotoKitEditingContext)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXSmartAlbumPhotoKitEditingContext *v7;
  PXSmartAlbumPhotoKitEditingContext *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSmartAlbumPhotoKitEditingContext.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSmartAlbumPhotoKitEditingContext;
  v7 = -[PXSmartAlbumPhotoKitEditingContext init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_photoLibrary, a3);

  return v8;
}

- (NSArray)conditionTypeValues
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  NSArray *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PXSmartAlbumLocalizedStringsForConditionTypeValues(&unk_1E53E9060);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PXSmartAlbumPhotoKitEditingContext_conditionTypeValues__block_invoke;
  v8[3] = &unk_1E5129B08;
  v9 = &unk_1E53E9060;
  v4 = v2;
  v10 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v5 = v10;
  v6 = (NSArray *)v4;

  return v6;
}

- (NSArray)albumValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[8];
  _QWORD v11[4];
  NSObject *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PXSmartAlbumPhotoKitEditingContext_albumValues__block_invoke;
    v11[3] = &unk_1E5141588;
    v12 = v3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
    v8 = v12;
  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no albums", v10, 2u);
    }
  }

  return (NSArray *)v3;
}

- (id)apertureValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, CFSTR("aperture"), a3);
}

- (NSArray)cameraModels
{
  return (NSArray *)_StringValuesForKeyPath(self->_photoLibrary, CFSTR("cameraModel"));
}

- (id)focalLengthValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, CFSTR("focalLength"), a3);
}

- (id)ISOValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, CFSTR("iso"), a3);
}

- (NSArray)lensModels
{
  return (NSArray *)_StringValuesForKeyPath(self->_photoLibrary, CFSTR("lensModel"));
}

- (id)shutterSpeedValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, CFSTR("shutterSpeed"), a3);
}

- (NSArray)keywordValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSArray *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D718A0], "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("assetAttributes");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("assetAttributes"), CFSTR("asset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v10);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke;
  v17[3] = &unk_1E51457C8;
  v18 = v5;
  v19 = v8;
  v11 = v3;
  v20 = v11;
  v12 = v8;
  v13 = v5;
  objc_msgSend(v13, "performBlockAndWait:", v17);
  v14 = v20;
  v15 = (NSArray *)v11;

  return v15;
}

- (NSArray)personNames
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  __int16 v11;
  _QWORD v12[4];
  NSObject *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludedDetectionTypes:", v5);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke;
    v12[3] = &unk_1E5131250;
    v7 = v3;
    v13 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
    if (-[NSObject count](v7, "count"))
    {
      -[NSObject sortUsingComparator:](v7, "sortUsingComparator:", &__block_literal_global_82_67792);
    }
    else
    {
      PLUIGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no named persons", (uint8_t *)&v11, 2u);
      }

    }
    v8 = v13;
  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no persons", (uint8_t *)&v11, 2u);
    }
  }

  return (NSArray *)v3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a2, "px_localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "length");
  v4 = v7;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke_2;
    v8[3] = &unk_1E511FC78;
    v6 = v7;
    v9 = v6;
    if (objc_msgSend(v5, "indexOfObjectPassingTest:", v8) == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

    v4 = v7;
  }

}

uint64_t __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCaseInsensitiveCompare:");
}

BOOL __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

void __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    if (-[NSObject count](v4, "count"))
    {
      -[NSObject sortedArrayUsingComparator:](v4, "sortedArrayUsingComparator:", &__block_literal_global_67805);
      v6 = objc_claimAutoreleasedReturnValue();

      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke_3;
      v8[3] = &unk_1E511FC50;
      v9 = *(id *)(a1 + 48);
      -[NSObject enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);

      v4 = v6;
    }
    else
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no keywords", buf, 2u);
      }

    }
  }
  else
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "PXSmartAlbums: failed to fetch keywords: %@", buf, 0xCu);
    }
  }

}

void __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  PXLabeledValue *v7;

  objc_msgSend(a2, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E5149688;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  v7 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v6, v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

uint64_t __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

void __49__PXSmartAlbumPhotoKitEditingContext_albumValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  PXLabeledValue *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "uuid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = &stru_1E5149688;
  if (v4)
    v5 = v4;
  v6 = v5;

  v7 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v8, v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __57__PXSmartAlbumPhotoKitEditingContext_conditionTypeValues__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  PXLabeledValue *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v10, v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  if (objc_msgSend(v10, "integerValue") == 17)
  {
    v8 = *(void **)(a1 + 40);
    +[PXLabeledValue separatorLabeledValue](PXLabeledValue, "separatorLabeledValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

@end
