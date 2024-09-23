@implementation PXPersonsSectionedDataSourceManager

- (PXPersonsSectionedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXPersonsSectionedDataSourceManager *v6;
  PXPersonsSectionedDataSourceManager *v7;
  void *v8;
  uint64_t v9;
  PXPhotoLibraryLocalDefaults *localDefaults;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPersonsSectionedDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    -[PXPersonsSectionedDataSourceManager photoLibrary](v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_localDefaults");
    v9 = objc_claimAutoreleasedReturnValue();
    localDefaults = v7->_localDefaults;
    v7->_localDefaults = (PXPhotoLibraryLocalDefaults *)v9;

  }
  return v7;
}

- (id)createInitialDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPersonsSectionedDataSource *v9;

  -[PXPersonsSectionedDataSourceManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_registerChangeObserver:", self);
  peopleHomeFetchResults(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXFlatMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities personFaceTileByPersonIdForPersons:](PXPeopleUtilities, "personFaceTileByPersonIdForPersons:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryLocalDefaults numberForKey:](self->_localDefaults, "numberForKey:", CFSTR("PXPeopleHomeSortingType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v7 = (void *)objc_msgSend(v7, "unsignedIntegerValue");
  self->_peopleHomeSortingType = (unint64_t)v7;
  v9 = -[PXPersonsSectionedDataSource initWithPhotoLibrary:personsSections:faceTiles:peopleHomeSortingType:]([PXPersonsSectionedDataSource alloc], "initWithPhotoLibrary:personsSections:faceTiles:peopleHomeSortingType:", v3, v4, v6, -[PXPersonsSectionedDataSourceManager peopleHomeSortingType](self, "peopleHomeSortingType"));

  return v9;
}

- (int64_t)_personTypeForSection:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  if (a3 == 1)
    return 0;
  PXAssertGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unexpected section (%ld) in people data source.", (uint8_t *)&v6, 0xCu);
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  int64x2_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  PXPhotoLibraryLocalDefaults *localDefaults;
  void *v35;
  PXPersonsSectionedDataSource *v36;
  void *v37;
  PXPersonsSectionedDataSource *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int64x2_t v44;
  void *v45;
  int64x2_t v46;
  uint64_t v47;
  PXPersonsSectionedDataSourceManager *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[2];
  int64x2_t v61;
  uint8_t v62[128];
  uint8_t buf[4];
  unint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48 = self;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v50, "numberOfSections");
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = v5;
  if (v5 < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v46 = v9;
    v9.i64[0] = 134217984;
    v44 = v9;
    do
    {
      v60[0] = objc_msgSend(v50, "identifier", *(_OWORD *)&v44);
      v60[1] = v8;
      v61 = v46;
      objc_msgSend(v50, "objectsInIndexPath:", v60);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PXPersonsSectionedDataSourceManager _personTypeForSection:](v48, "_personTypeForSection:", v8);
      if (v11 >= 2)
      {
        PXAssertGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v44.i32[0];
          v64 = v11;
          _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Unexpected person type (%ld) during library change.", buf, 0xCu);
        }

      }
      objc_msgSend(v10, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      peopleHomeFetchResultForType(v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "changeDetailsForFetchResult:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "changedObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v10, v14, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
      {
        v51 = (void *)v17;
        v52 = v16;
        v53 = v14;
        v54 = v10;
        v55 = v8;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v19 = v10;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v57 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(v24, "objectID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v4, "keyFaceChangedForPersonOID:", v25))
              {
                +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "invalidateCacheForPerson:", v24);

                objc_msgSend(v24, "localIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v27);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
          }
          while (v21);
        }

        v18 = v51;
        objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v51);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v55;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v55);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v28, v29);

        objc_msgSend(v51, "fetchResultAfterChanges");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObject:", v30);

        v7 = 1;
        v14 = v53;
        v10 = v54;
        v16 = v52;
      }
      else
      {
        objc_msgSend(v49, "addObject:", v10);
      }

      ++v8;
    }
    while (v8 != v47);
  }
  objc_msgSend(v50, "faceTiles");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v32 = (void *)objc_msgSend(v31, "mutableCopy");
    objc_msgSend(v32, "removeObjectsForKeys:", v6);
    v33 = objc_msgSend(v32, "copy");

    v31 = (void *)v33;
  }
  if ((v7 & 1) != 0)
  {
    localDefaults = v48->_localDefaults;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXPersonsSectionedDataSourceManager peopleHomeSortingType](v48, "peopleHomeSortingType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoLibraryLocalDefaults setNumber:forKey:](localDefaults, "setNumber:forKey:", v35, CFSTR("PXPeopleHomeSortingType"));

    v36 = [PXPersonsSectionedDataSource alloc];
    -[PXPersonsSectionedDataSourceManager photoLibrary](v48, "photoLibrary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PXPersonsSectionedDataSource initWithPhotoLibrary:personsSections:faceTiles:peopleHomeSortingType:](v36, "initWithPhotoLibrary:personsSections:faceTiles:peopleHomeSortingType:", v37, v49, v31, -[PXPersonsSectionedDataSourceManager peopleHomeSortingType](v48, "peopleHomeSortingType"));

    v39 = objc_alloc((Class)off_1E50B4A18);
    v40 = objc_msgSend(v50, "identifier");
    v41 = -[PXPersonsSectionedDataSource identifier](v38, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v39, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v40, v41, v42, v45, 0);

    -[PXSectionedDataSourceManager setDataSource:changeDetails:](v48, "setDataSource:changeDetails:", v38, v43);
  }

}

- (void)reloadData
{
  PXPhotoLibraryLocalDefaults *localDefaults;
  void *v4;
  void *v5;
  PXPersonsSectionedDataSource *v6;
  void *v7;
  void *v8;
  PXPersonsSectionedDataSource *v9;
  id v10;

  localDefaults = self->_localDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXPersonsSectionedDataSourceManager peopleHomeSortingType](self, "peopleHomeSortingType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryLocalDefaults setNumber:forKey:](localDefaults, "setNumber:forKey:", v4, CFSTR("PXPeopleHomeSortingType"));

  -[PXPersonsSectionedDataSourceManager photoLibrary](self, "photoLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  peopleHomeFetchResults(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PXPersonsSectionedDataSource alloc];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceTiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPersonsSectionedDataSource initWithPhotoLibrary:personsSections:faceTiles:peopleHomeSortingType:](v6, "initWithPhotoLibrary:personsSections:faceTiles:peopleHomeSortingType:", v10, v5, v8, -[PXPersonsSectionedDataSourceManager peopleHomeSortingType](self, "peopleHomeSortingType"));

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v9, 0);
}

- (unint64_t)peopleHomeSortingType
{
  return self->_peopleHomeSortingType;
}

- (void)setPeopleHomeSortingType:(unint64_t)a3
{
  self->_peopleHomeSortingType = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPhotoLibraryLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __62__PXPersonsSectionedDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchedObjects");
}

@end
