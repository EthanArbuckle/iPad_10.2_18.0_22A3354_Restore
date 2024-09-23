@implementation PXPeoplePersonDataSource

- (PXPeoplePersonDataSource)initWithName:(id)a3 personFetchType:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PXPeoplePersonDataSource *v12;
  uint64_t v13;
  NSMutableDictionary *keyFaceByPersonLocalIdentifier;
  NSDictionary *assetsByFaces;
  void *v16;
  objc_super v18;

  v6 = (objc_class *)MEMORY[0x1E0CD1620];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v9, v10, 0, 0, 0);

  v18.receiver = self;
  v18.super_class = (Class)PXPeoplePersonDataSource;
  v12 = -[PXPeopleDataSource initWithName:objects:](&v18, sel_initWithName_objects_, v7, v11);

  if (v12)
  {
    v12->_personFetchType = a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    keyFaceByPersonLocalIdentifier = v12->_keyFaceByPersonLocalIdentifier;
    v12->_keyFaceByPersonLocalIdentifier = (NSMutableDictionary *)v13;

    assetsByFaces = v12->_assetsByFaces;
    v12->_assetsByFaces = (NSDictionary *)MEMORY[0x1E0C9AA70];

    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_showUUIDIfNoName = objc_msgSend(v16, "showUUIDIfNoName");

  }
  return v12;
}

- (PXPeoplePersonDataSource)initWithName:(id)a3 personFetchType:(unint64_t)a4 fetchLimit:(unint64_t)a5
{
  PXPeoplePersonDataSource *v7;
  PXPeoplePersonDataSource *v8;
  objc_super v10;
  _QWORD v11[4];
  PXPeoplePersonDataSource *v12;
  unint64_t v13;
  unint64_t v14;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PXPeoplePersonDataSource_initWithName_personFetchType_fetchLimit___block_invoke;
  v11[3] = &unk_1E5145278;
  v13 = a5;
  v12 = self;
  v14 = a4;
  v10.receiver = v12;
  v10.super_class = (Class)PXPeoplePersonDataSource;
  v7 = -[PXPeopleDataSource initWithName:objectsReloadBlock:](&v10, sel_initWithName_objectsReloadBlock_, a3, v11);
  v8 = v7;
  if (v7)
    v7->_personFetchType = a4;

  return v8;
}

- (void)startListeningForChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:", self);

}

- (void)stopListeningForChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

}

- (void)loadObjectsAndUpdateMembersWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXPeoplePersonDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5146480;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = _Block_copy(aBlock);
  v7.receiver = self;
  v7.super_class = (Class)PXPeoplePersonDataSource;
  -[PXPeopleDataSource loadObjectsAndUpdateMembersWithCompletion:](&v7, sel_loadObjectsAndUpdateMembersWithCompletion_, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_cacheFacesAndAssets
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *keyFaceByPersonLocalIdentifier;
  void *v9;
  NSDictionary *v10;
  NSDictionary *assetsByFaces;
  id v12;

  -[PXPeopleDataSource persons](self, "persons");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v12, "count");
  if (v3)
  {
    if (v3 >= 0x1C)
      v4 = 28;
    else
      v4 = v3;
    objc_msgSend(v12, "subarrayWithRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchKeyFaceByPersonLocalIdentifierForPersons:options:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    keyFaceByPersonLocalIdentifier = self->_keyFaceByPersonLocalIdentifier;
    self->_keyFaceByPersonLocalIdentifier = v7;

    -[NSMutableDictionary allValues](self->_keyFaceByPersonLocalIdentifier, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsGroupedByFaceUUIDForFaces:", v9);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    assetsByFaces = self->_assetsByFaces;
    self->_assetsByFaces = v10;

  }
}

- (id)titleAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[PXPeopleDataSource personAtIndex:](self, "personAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_showUUIDIfNoName && !objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", 8);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

- (id)_itemsArrayFromObjects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  PXPersonItem *v11;
  PXPersonItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PXPersonItem alloc];
        v12 = -[PXPersonItem initWithPerson:](v11, "initWithPerson:", v10, (_QWORD)v14);

        objc_msgSend(v4, "addObject:", v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_fetchResultForFetchType:(unint64_t)a3 fetchOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v6);

  if (a3)
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (a3 != 1)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x1E0CD16C0];
    v8 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CD16C0];
    v8 = 1;
  }
  objc_msgSend(v7, "fetchPersonsWithType:options:", v8, v5);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)v9;
LABEL_10:

  return v10;
}

- (int64_t)_personTypeForFetchType:(unint64_t)a3
{
  return a3 == 0;
}

- (id)_applyChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "fetchResultAfterChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDataSource _setObjectsWithoutUpdate:](self, "_setObjectsWithoutUpdate:", v5);

  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[PXPeopleDataSource members](self, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[PXPeoplePersonDataSource _membersForModelObjects:](self, "_membersForModelObjects:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeObjectsInArray:", v10);
    v9 = (void *)v10;
  }
  objc_msgSend(v4, "insertedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[PXPeoplePersonDataSource _itemsArrayFromObjects:](self, "_itemsArrayFromObjects:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObjectsFromArray:", v12);
    v11 = (void *)v12;
  }
  objc_msgSend(v4, "changedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[PXPeoplePersonDataSource _membersForModelObjects:](self, "_membersForModelObjects:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = 0;
      do
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateWithModel:", v17);

        ++v15;
      }
      while (v15 < objc_msgSend(v14, "count"));
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[PXPeopleDataSource filterPredicate](self, "filterPredicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v8, "filterUsingPredicate:", v18);
  -[PXPeopleDataSource sortComparator](self, "sortComparator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v8, "sortUsingComparator:", v19);
  -[PXPeopleDataSource setMembers:](self, "setMembers:", v8);

  return v14;
}

- (id)_membersForModelObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDataSource members](self, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDataSource persons](self, "persons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(v7, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        if (v14 < v8)
        {
          objc_msgSend(v6, "objectAtIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v5;
}

- (void)_asyncLoadImageForItem:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double width;
  id v10;
  void (**v11)(id, uint64_t, _QWORD, double, double, double, double);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PXPeopleFaceCropFetchOptions *v18;
  PXPeopleFaceCropFetchOptions *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;

  width = a4.width;
  v10 = a3;
  v11 = (void (**)(id, uint64_t, _QWORD, double, double, double, double))a6;
  objc_msgSend(v10, "faceImage");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 && v12)
    v11[2](v11, v12, 0, *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
  objc_msgSend(v10, "setResultHandler:", v11);
  v14 = objc_msgSend(v10, "faceImageRequestID");
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isRequestActiveWithRequestID:", v14) & 1) == 0)
  {
    objc_msgSend(v10, "modelObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeoplePersonDataSource _faceForPerson:](self, "_faceForPerson:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [PXPeopleFaceCropFetchOptions alloc];
    if (v17)
    {
      v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v18, "initWithPerson:face:targetSize:displayScale:", v16, v17, width, width, a5);
      -[PXPeoplePersonDataSource _assetForFace:](self, "_assetForFace:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleFaceCropFetchOptions setAsset:](v19, "setAsset:", v20);

    }
    else
    {
      v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v18, "initWithPerson:targetSize:displayScale:", v16, width, width, a5);
    }
    -[PXPeopleFaceCropFetchOptions setCornerStyle:](v19, "setCornerStyle:", 2);
    -[PXPeopleFaceCropFetchOptions setCropFactor:](v19, "setCropFactor:", 0);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3042000000;
    v22[3] = __Block_byref_object_copy__279623;
    v22[4] = __Block_byref_object_dispose__279624;
    objc_initWeak(&v23, v10);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__PXPeoplePersonDataSource__asyncLoadImageForItem_targetSize_displayScale_resultHandler___block_invoke;
    v21[3] = &unk_1E51445D8;
    v21[4] = v22;
    objc_msgSend(v10, "setFaceImageRequestID:", objc_msgSend(v15, "requestFaceCropForOptions:resultHandler:", v19, v21));
    _Block_object_dispose(v22, 8);
    objc_destroyWeak(&v23);

  }
}

- (void)cancelImageLoadingForItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "faceImageRequestID");
  if ((_DWORD)v3)
  {
    v4 = v3;
    +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelRequestForRequestID:", v4);

    objc_msgSend(v6, "setFaceImageRequestID:", 0);
  }

}

- (id)generateFetchResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1570];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  v12 = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v8);

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v9);

  -[PXPeoplePersonDataSource _fetchResultForFetchType:fetchOptions:](self, "_fetchResultForFetchType:fetchOptions:", -[PXPeoplePersonDataSource personFetchType](self, "personFetchType"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)photoLibraryDidChange:(id)a3
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
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[PXPeopleDataSource objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D20];
  -[PXPeopleDataSource members](self, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXPeoplePersonDataSource _applyChanges:](self, "_applyChanges:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDataSource members](self, "members");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDataSource delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v8, v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasAnyChanges"))
      {
        objc_initWeak(&location, self);
        v14 = v12;
        objc_copyWeak(&v16, &location);
        v15 = v13;
        px_dispatch_on_main_queue();

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }

    }
  }

}

- (void)updateKeyFace:(id)a3 forPerson:(id)a4
{
  void *v6;
  NSMutableDictionary *keyFaceByPersonLocalIdentifier;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    keyFaceByPersonLocalIdentifier = self->_keyFaceByPersonLocalIdentifier;
    if (v8)
      -[NSMutableDictionary setObject:forKey:](keyFaceByPersonLocalIdentifier, "setObject:forKey:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](keyFaceByPersonLocalIdentifier, "removeObjectForKey:", v6);
  }

}

- (id)faceTileAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  PXPeopleFaceTile *v7;

  -[PXPeopleDataSource personAtIndex:](self, "personAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePersonDataSource _faceForPerson:](self, "_faceForPerson:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePersonDataSource _assetForFace:](self, "_assetForFace:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPeopleFaceTile initWithFace:asset:person:]([PXPeopleFaceTile alloc], "initWithFace:asset:person:", v5, v6, v4);

  return v7;
}

- (id)_faceForPerson:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyFaceByPersonLocalIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_assetForFace:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_assetsByFaces, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)personFetchType
{
  return self->_personFetchType;
}

- (void)setPersonFetchType:(unint64_t)a3
{
  self->_personFetchType = a3;
}

- (PXPeopleDataSourceSection)dataSourceSection
{
  return self->_dataSourceSection;
}

- (void)setDataSourceSection:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceSection, 0);
  objc_storeStrong((id *)&self->_assetsByFaces, 0);
  objc_storeStrong((id *)&self->_keyFaceByPersonLocalIdentifier, 0);
}

void __50__PXPeoplePersonDataSource_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "peopleDataSource:didApplyIncrementalChanges:", WeakRetained, *(_QWORD *)(a1 + 40));

}

void __89__PXPeoplePersonDataSource__asyncLoadImageForItem_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    objc_msgSend(v7, "setFaceImage:", v19);
    objc_msgSend(v7, "resultHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "CGRectValue");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *, double, double, double, double))v8)[2](v8, v19, v18, v11, v13, v15, v17);

    }
  }

}

uint64_t __70__PXPeoplePersonDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cacheFacesAndAssets");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __68__PXPeoplePersonDataSource_initWithName_personFetchType_fetchLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CD1570];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchOptionsWithPhotoLibrary:orObject:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludedDetectionTypes:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_fetchResultForFetchType:fetchOptions:", *(_QWORD *)(a1 + 48), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
