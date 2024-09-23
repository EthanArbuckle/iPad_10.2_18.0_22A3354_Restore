@implementation PLMoment

+ (void)enumerateAssetUUIDsForSearchIndexingWithMomentUUID:(id)a3 managedObjectContext:(id)a4 libraryIdentifier:(int64_t)a5 assetUUIDHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  int64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v9, "length");
  if (v11 && v10 && v12)
  {
    +[PLMoment fetchRequest](PLMoment, "fetchRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResultType:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("uuid"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v14);

    v58 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v13, &v58);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v58;
    objc_msgSend(v15, "firstObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
    {
      v43 = a5;
      v44 = (void *)v17;
      v45 = v16;
      v46 = v15;
      v47 = v13;
      v48 = v11;
      v49 = v10;
      objc_msgSend(v10, "deletedObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v20 = v19;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v55 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v25, "entity");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLManagedAsset entityName](PLManagedAsset, "entityName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "isEqualToString:", v28);

            if (v29)
            {
              v30 = v25;
              objc_msgSend(v30, "uuid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                objc_msgSend(v50, "addObject:", v31);

            }
          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        }
        while (v22);
      }

      v18 = v44;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K == %@"), CFSTR("moment"), v44);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0C97B48];
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fetchRequestWithEntityName:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "setResultType:", 2);
      v60[0] = CFSTR("objectID");
      v60[1] = CFSTR("uuid");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPropertiesToFetch:", v37);

      v38 = (void *)MEMORY[0x1E0CB3528];
      v59[0] = v32;
      v59[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "andPredicateWithSubpredicates:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPredicate:", v40);

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __135__PLMoment_SearchIndexing__enumerateAssetUUIDsForSearchIndexingWithMomentUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke;
      v51[3] = &unk_1E366E728;
      v52 = v50;
      v11 = v48;
      v53 = v48;
      v41 = v50;
      v10 = v49;
      v42 = (id)objc_msgSend(v49, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v36, 0, v51);

      v15 = v46;
      v13 = v47;
      v16 = v45;
    }
    else
    {
      PLSearchBackendPhotosDatabaseFetchGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v63 = v9;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Cannot find moment with uuid: %{public}@", buf, 0xCu);
      }
    }

  }
}

void __135__PLMoment_SearchIndexing__enumerateAssetUUIDsForSearchIndexingWithMomentUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("uuid"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (unint64_t)countForAssetsOfKind:(signed __int16)a3
{
  int v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[PLMoment managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLManagedObject entityInManagedObjectContext:](PLManagedAsset, "entityInManagedObjectContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setEntity:", v7);
    v8 = (void *)MEMORY[0x1E0CB3880];
    -[PLMoment objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("kind = %d AND moment = %@"), v3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v10);

    v15 = 0;
    v11 = objc_msgSend(v5, "countForFetchRequest:error:", v6, &v15);
    v12 = v15;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PLBackendGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        v17 = v3;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "_countForAssetsOfKind:%d fetch request failed: %@", buf, 0x12u);
      }

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLMoment;
  -[PLMoment awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMoment setUuid:](self, "setUuid:", v3);

  -[PLMoment registerForChanges](self, "registerForChanges");
}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLMoment;
  -[PLMoment awakeFromFetch](&v3, sel_awakeFromFetch);
  -[PLMoment registerForChanges](self, "registerForChanges");
}

- (void)willTurnIntoFault
{
  objc_super v3;

  -[PLMoment unregisterForChanges](self, "unregisterForChanges");
  v3.receiver = self;
  v3.super_class = (Class)PLMoment;
  -[PLMoment willTurnIntoFault](&v3, sel_willTurnIntoFault);
}

- (void)dealloc
{
  CLLocation *cachedApproximateLocation;
  objc_super v4;

  -[PLMoment unregisterForChanges](self, "unregisterForChanges");
  cachedApproximateLocation = self->_cachedApproximateLocation;
  self->_cachedApproximateLocation = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLMoment;
  -[PLMoment dealloc](&v4, sel_dealloc);
}

- (int)_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMoment.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (self->_waitingForSharedAssetContainerRecalc)
    -[PLMoment recalculateSharedAssetContainerCachedValues](self, "recalculateSharedAssetContainerCachedValues");
  -[PLMoment willAccessValueForKey:](self, "willAccessValueForKey:", v5);
  -[PLMoment primitiveValueForKey:](self, "primitiveValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  -[PLMoment didAccessValueForKey:](self, "didAccessValueForKey:", v5);
  return v7;
}

- (int)assetsCount
{
  return -[PLMoment _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:](self, "_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:", CFSTR("cachedCount"));
}

- (int)assetsCountShared
{
  return -[PLMoment _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:](self, "_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:", CFSTR("cachedCountShared"));
}

- (signed)sharingComposition
{
  return -[PLMoment _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:](self, "_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:", CFSTR("sharingComposition"));
}

- (int)assetsCountPrivate
{
  int v3;

  v3 = -[PLMoment assetsCount](self, "assetsCount");
  return v3 - -[PLMoment assetsCountShared](self, "assetsCountShared");
}

- (void)reportSharedAssetContainerIncrementalChange:(id)a3 forAllAssetsCountKey:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "highlightContainerChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMoment.m"), 268, CFSTR("unexpected change type."));

  }
  if (!self->_waitingForSharedAssetContainerRecalc)
  {
    if (-[PLMoment isInserted](self, "isInserted"))
    {
      PLMomentsGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[PLMoment objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Marking moment: %@ as waiting for recalc...", (uint8_t *)&v25, 0xCu);

      }
      self->_waitingForSharedAssetContainerRecalc = 1;
      goto LABEL_30;
    }
    if ((-[PLMoment isDeleted](self, "isDeleted") & 1) != 0)
      goto LABEL_30;
    PLMomentsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMoment objectID](self, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Processing incremental change: %@ for moment: %@...", (uint8_t *)&v25, 0x16u);

    }
    v14 = objc_msgSend(v6, "collectionChangeType");
    if ((unint64_t)(v14 - 1) < 2)
    {
      if (objc_msgSend(v6, "collectionChangeType") == 1)
        v15 = 1;
      else
        v15 = -1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLMoment cachedCount](self, "cachedCount") + v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v16, CFSTR("cachedCount"), 0);

      if (objc_msgSend(v6, "sharingChange") != 1)
        goto LABEL_23;
      goto LABEL_22;
    }
    if (!v14)
    {
      v17 = objc_msgSend(v6, "sharingChange");
      if (v17 == 1)
      {
        v15 = 1;
        goto LABEL_22;
      }
      if (v17 == 2)
      {
        v15 = -1;
LABEL_22:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLMoment cachedCountShared](self, "cachedCountShared") + v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v18, CFSTR("cachedCountShared"), 0);

      }
    }
LABEL_23:
    v19 = -[PLMoment assetsCount](self, "assetsCount");
    v20 = -[PLMoment assetsCountShared](self, "assetsCountShared");
    if (v19 == v20)
      v21 = 1;
    else
      v21 = 2;
    if (v20)
      v22 = v21;
    else
      v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v23, CFSTR("sharingComposition"), 0);

  }
LABEL_30:

}

- (void)recalculateSharedAssetContainerCachedValues
{
  int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  id v7;

  self->_waitingForSharedAssetContainerRecalc = 0;
  objc_msgSend((id)objc_opt_class(), "_recalculateAssetCountsForMoment:", self);
  v3 = -[PLMoment assetsCount](self, "assetsCount");
  v4 = -[PLMoment assetsCountShared](self, "assetsCountShared");
  if (v3 == v4)
    v5 = 1;
  else
    v5 = 2;
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v7, CFSTR("sharingComposition"), 0);

}

- (CLLocation)approximateLocation
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;
  CLLocation *v7;
  CLLocation *cachedApproximateLocation;

  if (!self->_didCacheApproximateLocation)
  {
    -[PLMoment approximateLongitude](self, "approximateLongitude");
    v4 = v3;
    -[PLMoment approximateLatitude](self, "approximateLatitude");
    v6 = CLLocationCoordinate2DMake(v5, v4);
    if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
    {
      v7 = (CLLocation *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v6.latitude, v6.longitude);
      cachedApproximateLocation = self->_cachedApproximateLocation;
      self->_cachedApproximateLocation = v7;
    }
    else
    {
      cachedApproximateLocation = self->_cachedApproximateLocation;
      self->_cachedApproximateLocation = 0;
    }

    self->_didCacheApproximateLocation = 1;
  }
  return self->_cachedApproximateLocation;
}

- (void)setApproximateLocation:(id)a3
{
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_cachedApproximateLocation, a3);
  self->_didCacheApproximateLocation = 1;
  if (v8)
  {
    objc_msgSend(v8, "coordinate");
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9E500];
    v7 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  -[PLMoment setApproximateLatitude:](self, "setApproximateLatitude:", v5);
  -[PLMoment setApproximateLongitude:](self, "setApproximateLongitude:", v7);

}

- (void)registerForChanges
{
  void *v3;

  if (!-[PLMoment isRegisteredForChanges](self, "isRegisteredForChanges"))
  {
    if (-[PLManagedObject isRegisteredWithUserInterfaceContext](self, "isRegisteredWithUserInterfaceContext"))
    {
      -[PLMoment setDidRegisteredWithUserInterfaceContext:](self, "setDidRegisteredWithUserInterfaceContext:", 1);
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMoment addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v3, CFSTR("assets"), 8, &PLChangeNotificationCenterKVOContext);

    }
    -[PLMoment setIsRegisteredForChanges:](self, "setIsRegisteredForChanges:", 1);
  }
}

- (void)unregisterForChanges
{
  void *v3;

  if (-[PLMoment isRegisteredForChanges](self, "isRegisteredForChanges"))
  {
    if (-[PLMoment didRegisteredWithUserInterfaceContext](self, "didRegisteredWithUserInterfaceContext"))
    {
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMoment removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v3, CFSTR("assets"), &PLChangeNotificationCenterKVOContext);

      -[PLMoment setDidRegisteredWithUserInterfaceContext:](self, "setDidRegisteredWithUserInterfaceContext:", 0);
    }
    -[PLMoment setIsRegisteredForChanges:](self, "setIsRegisteredForChanges:", 0);
  }
}

- (id)bestAsset
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PLMoment assets](self, "assets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      objc_msgSend(v9, "curationScore");
      v11 = v10;
      if (!v5 || v10 > v7)
      {
        v12 = v9;

        v7 = v11;
        v5 = v12;
        if (v11 == 1.0)
          break;
      }
      if (v4 == ++v8)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v12 = v5;
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)enumerateAssetSearchEntitiesWithBlock:(id)a3
{
  +[PLSearchEntity enumerateAssetSearchEntitiesForMoment:withBlock:](PLSearchEntity, "enumerateAssetSearchEntitiesForMoment:withBlock:", self, a3);
}

- (BOOL)supportsDiagnosticInformation
{
  return 1;
}

- (id)diagnosticInformation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[PLMoment description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v20 = v5;
  objc_msgSend(v5, "appendString:", CFSTR("\n\nAsset Information:\n"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PLMoment assets](self, "assets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v19 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "filename");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateCreated");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v9, "width");
        v15 = objc_msgSend(v9, "height");
        objc_msgSend(v9, "modificationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("\nAsset: uuid: %@, filename: %@, dateCreated: %@, location: %@, width: %lld, height: %lld, modificationDate: %@, reverseLocationDataIsValid: %d"), v10, v11, v12, v13, v14, v15, v16, objc_msgSend(v9, "reverseLocationDataIsValid"));

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  return v20;
}

- (void)prepareForDeletion
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLMoment;
  -[PLManagedObject prepareForDeletion](&v3, sel_prepareForDeletion);
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]())
    +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:](PLGraphEdge, "registerDeletedObjectForDanglingReferenceCleanup:", self);
}

- (void)delete
{
  id v3;

  -[PLMoment managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (void)removeAssetData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMoment willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("assets"), 2, v6);

  -[PLMoment primitiveAssets](self, "primitiveAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PLMoment didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("assets"), 2, v9);
}

- (void)insertAssetData:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLMoment willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("assets"), 1, v5);
  -[PLMoment primitiveAssets](self, "primitiveAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v5);

  -[PLMoment didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("assets"), 2, v5);
}

- (void)willSave
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLMoment;
  -[PLManagedObject willSave](&v11, sel_willSave);
  -[PLMoment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLMoment isDeleted](self, "isDeleted")
    && ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]()))
  {
    +[PLGraphEdge cleanupDanglingReferencesInManagedObjectContext:](PLGraphEdge, "cleanupDanglingReferencesInManagedObjectContext:", v3);
  }
  -[PLMoment changedValues](self, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PLPlatformMomentsSupported();
  if (v5)
  {
    if ((-[PLMoment isDeleted](self, "isDeleted") & 1) == 0)
    {
      if (+[PLMomentGenerationDataManager isManagedObjectContextMomentarilyBlessed:](PLMomentGenerationDataManager, "isManagedObjectContextMomentarilyBlessed:", v3))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modificationDate"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLMoment setModificationDate:](self, "setModificationDate:", v7);

        }
      }
    }
  }
  if (self->_waitingForSharedAssetContainerRecalc && (-[PLMoment isDeleted](self, "isDeleted") & 1) == 0)
    -[PLMoment recalculateSharedAssetContainerCachedValues](self, "recalculateSharedAssetContainerCachedValues");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processedLocation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {

LABEL_17:
        objc_msgSend(v3, "delayedSaveActions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordMomentForHighlightUpdate:", self);

        goto LABEL_20;
      }
      if (+[PLAggregationProcessor isEnabled](PLAggregationProcessor, "isEnabled"))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregationScore"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_17;
      }
    }
  }
LABEL_20:

}

- (void)didTurnIntoFault
{
  CLLocation *cachedApproximateLocation;
  objc_super v4;

  cachedApproximateLocation = self->_cachedApproximateLocation;
  self->_cachedApproximateLocation = 0;

  self->_didCacheApproximateLocation = 0;
  v4.receiver = self;
  v4.super_class = (Class)PLMoment;
  -[PLMoment didTurnIntoFault](&v4, sel_didTurnIntoFault);
}

- (void)replaceObjectInAssets:(id)a3 withObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PLMoment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assets"));
  -[PLMoment primitiveAssets](self, "primitiveAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  -[PLMoment primitiveAssets](self, "primitiveAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  -[PLMoment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assets"));
}

- (void)removeAssetsObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PLMoment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assets"));
  -[PLMoment primitiveAssets](self, "primitiveAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[PLMoment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assets"));
  -[PLMoment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sharingComposition"));
  -[PLMoment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", &unk_1E3760B90, CFSTR("sharingComposition"));
  -[PLMoment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sharingComposition"));
}

- (NSArray)batchedAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchBatchSize:", 100);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("moment"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v21[0] = CFSTR("additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v7);

  -[PLMoment managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v5, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (!v9)
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = (uint64_t)v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to fetch batchedAssets: %@", buf, 0xCu);
    }

  }
  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(v9, "count");
    -[PLManagedObject shortObjectIDURI](self, "shortObjectIDURI");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Batch fetched %lu assets from moment %@", buf, 0x16u);

  }
  return (NSArray *)v9;
}

- (unint64_t)fetchedAssetsCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("moment"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  -[PLMoment managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "countForFetchRequest:error:", v5, &v12);
  v9 = v12;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch assets count: %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (NSDate)localStartDate
{
  void *v3;
  void *v4;

  -[PLMoment startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLMoment timeZoneOffset](self, "timeZoneOffset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)localEndDate
{
  void *v3;
  void *v4;

  -[PLMoment endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLMoment timeZoneOffset](self, "timeZoneOffset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (id)edgesIn
{
  return +[PLGraphEdge edgesInToObject:](PLGraphEdge, "edgesInToObject:", self);
}

- (id)edgesOut
{
  return +[PLGraphEdge edgesOutFromObject:](PLGraphEdge, "edgesOutFromObject:", self);
}

- (void)implementsPLGraphEdgeReferenceObjectRecipient
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();

}

- (CLLocationCoordinate2D)pl_coordinate
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  CLLocationCoordinate2D *p_cachedCoordinate;
  CLLocationCoordinate2D v7;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  if (!self->_didCacheCoordinate)
  {
    -[PLMoment approximateLongitude](self, "approximateLongitude");
    v4 = v3;
    -[PLMoment approximateLatitude](self, "approximateLatitude");
    p_cachedCoordinate = &self->_cachedCoordinate;
    if (v5 == 0.0 && v4 == 0.0)
    {
      *p_cachedCoordinate = *(CLLocationCoordinate2D *)MEMORY[0x1E0C9E500];
    }
    else
    {
      v7 = CLLocationCoordinate2DMake(v5, v4);
      p_cachedCoordinate->latitude = v7.latitude;
      self->_cachedCoordinate.longitude = v7.longitude;
    }
    self->_didCacheCoordinate = 1;
  }
  latitude = self->_cachedCoordinate.latitude;
  longitude = self->_cachedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (unint64_t)pl_numberOfAssets
{
  return (int)-[PLMoment cachedCount](self, "cachedCount");
}

- (BOOL)isRegisteredForChanges
{
  return self->isRegisteredForChanges;
}

- (void)setIsRegisteredForChanges:(BOOL)a3
{
  self->isRegisteredForChanges = a3;
}

- (BOOL)didRegisteredWithUserInterfaceContext
{
  return self->didRegisteredWithUserInterfaceContext;
}

- (void)setDidRegisteredWithUserInterfaceContext:(BOOL)a3
{
  self->didRegisteredWithUserInterfaceContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedApproximateLocation, 0);
}

+ (id)allAssetsIncludedInMomentsInLibrary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v7;

  objc_msgSend(a3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(a1, "allAssetsIncludedInMomentsInManagedObjectContext:IDsOnly:error:", v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entityName
{
  return CFSTR("Moment");
}

+ (id)fetchPredicateForExcludingOriginatorState:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %i) == 0"), CFSTR("originatorState"), a3);
}

+ (void)_recalculateAssetCountsForMoment:(id)a3
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  _QWORD v62[2];
  void *v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasFaultForRelationshipNamed:", CFSTR("assets")))
  {
    v5 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v64[0] = CFSTR("libraryScope");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPropertiesToGroupBy:", v8);

    objc_msgSend(v7, "setIncludesPendingChanges:", 1);
    v9 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expressionForFunction:arguments:", CFSTR("count:"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v13, "setName:", CFSTR("count"));
    objc_msgSend(v13, "setExpression:", v12);
    objc_msgSend(v13, "setExpressionResultType:", 200);
    v62[0] = CFSTR("libraryScope");
    v62[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPropertiesToFetch:", v14);

    objc_msgSend(v7, "setResultType:", 2);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("moment"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v15);

    objc_msgSend(v4, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    objc_msgSend(v16, "executeFetchRequest:error:", v7, &v53);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v53;

    if (v17)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v19 = v17;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      if (v20)
      {
        v21 = v20;
        v44 = v4;
        v40 = v18;
        v41 = v17;
        v42 = v13;
        v43 = v7;
        v22 = 0;
        v23 = 0;
        v24 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v50 != v24)
              objc_enumerationMutation(v19);
            v26 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("count"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "intValue");

            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("libraryScope"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
              v30 = v28;
            else
              v30 = 0;
            v22 += v30;
            if (!v29)
              v23 = v28;
          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        }
        while (v21);
        v7 = v43;
        v4 = v44;
        v13 = v42;
        v18 = v40;
        v17 = v41;
LABEL_20:

        if (v17)
          goto LABEL_33;
        goto LABEL_21;
      }
    }
    else
    {
      PLPhotoKitGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v56 = v7;
        v57 = 2112;
        v58 = a1;
        v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error executing count of collections fetch %@ for %@: %@", buf, 0x20u);
      }
    }
    v22 = 0;
    v23 = 0;
    goto LABEL_20;
  }
  v22 = 0;
LABEL_21:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v4, "assets");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v31);
        v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        if ((objc_msgSend(v37, "isDeleted") & 1) == 0)
        {
          ++v34;
          v22 += objc_msgSend(v37, "hasLibraryScope");
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v33);
  }
  else
  {
    v34 = 0;
  }

  v23 = v34 - v22;
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23 + v22);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_safeSetValue:forKey:valueDidChangeHandler:", v38, CFSTR("cachedCount"), 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_safeSetValue:forKey:valueDidChangeHandler:", v39, CFSTR("cachedCountShared"), 0);

}

+ (id)momentIDsWithPersonIDs:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil AND %K IN %@"), CFSTR("sourceAsset"), CFSTR("targetPerson"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v8);

    v18[0] = CFSTR("sourceAsset.moment");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPropertiesToFetch:", v9);

    objc_msgSend(v7, "setReturnsDistinctResults:", 1);
    objc_msgSend(v7, "setResultType:", 2);
    v15 = 0;
    objc_msgSend(v6, "executeFetchRequest:error:", v7, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v10)
    {
      objc_msgSend(v10, "_pl_map:", &__block_literal_global_89253);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch momentIDsWithPersonIDs: %@", buf, 0xCu);
      }
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (NSArray)sortByTimeSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __45__PLMoment_momentIDsWithPersonIDs_inContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("sourceAsset.moment"));
}

- (BOOL)isCloudSharedAlbum
{
  return 0;
}

- (id)groupURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLMoment uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@/?%@=%@"), CFSTR("assets-library"), CFSTR("group"), CFSTR("id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGImage)posterImage
{
  return 0;
}

+ (id)insertNewMomentInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allMomentsInManagedObjectContext:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "allMomentsInManagedObjectContext:predicate:idsOnly:error:", a3, 0, 0, a4);
}

+ (id)allMomentIDsInManagedObjectContext:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "allMomentsInManagedObjectContext:predicate:idsOnly:error:", a3, 0, 1, a4);
}

+ (id)allInvalidMomentsInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[PLMoment predicateForInvalidMoments](PLMoment, "predicateForInvalidMoments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allMomentsInManagedObjectContext:predicate:idsOnly:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allMomentsInManagedObjectContext:(id)a3 predicate:(id)a4 idsOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v7 = a5;
  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)MEMORY[0x1E0C97B48];
  v12 = a4;
  objc_msgSend(a1, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPredicate:", v12);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("representativeDate"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v16);

  objc_msgSend(v14, "setFetchBatchSize:", 100);
  if (v7)
  {
    objc_msgSend(v14, "setResultType:", 1);
    objc_msgSend(v14, "setIncludesPropertyValues:", 0);
  }
  objc_msgSend(v10, "executeFetchRequest:error:", v14, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)allMomentsRequiringAnalysisInManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets.additionalAttributes.reverseLocationDataIsValid == NO"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v7, "executeFetchRequest:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)momentsRequiringLocationProcessingWhenCoreRoutineIsAvailableInManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d OR %K == %d OR %K == %d"), CFSTR("processedLocation"), 0, CFSTR("processedLocation"), 8, CFSTR("processedLocation"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v7, "executeFetchRequest:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailableInManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d OR %K == %d"), CFSTR("processedLocation"), 0, CFSTR("processedLocation"), 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v7, "executeFetchRequest:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)momentsRequiringLocationProcessingWhenFrequentLocationsChangedInManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d OR %K == %d OR %K == %d OR %K == %d OR %K == %d OR %K == %d"), CFSTR("processedLocation"), 0, CFSTR("processedLocation"), 8, CFSTR("processedLocation"), 9, CFSTR("processedLocation"), 5, CFSTR("processedLocation"), 1, CFSTR("processedLocation"), 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v7, "executeFetchRequest:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForAssetsIncludedInMoments
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsIncludedInMoments"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K == NO AND %K == %d"), CFSTR("visibilityState"), 0, CFSTR("hidden"), CFSTR("trashedState"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForInvalidMoments
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlight = nil"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assets.@count = 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForInvalidAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlightBeingAssets = nil"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("moment = nil"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v6;
  objc_msgSend(a1, "predicateForAssetsIncludedInMoments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)batchFetchMomentUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(id, _QWORD, id);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a5;
  if (v11)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMoment.m"), 810, CFSTR("Completion handler is mandatory"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMoment.m"), 811, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

LABEL_3:
  objc_msgSend(v10, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v16);
  objc_msgSend(v15, "setResultType:", 2);
  v49[0] = CFSTR("uuid");
  v49[1] = CFSTR("moment.uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPropertiesToFetch:", v17);

  v43 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v15, &v43);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v43;
  if (v19)
  {
    v11[2](v11, 0, v19);
  }
  else
  {
    v34 = v16;
    v35 = v15;
    v36 = v12;
    v37 = v11;
    v38 = v9;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("moment.uuid"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("uuid"));
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          if (v27)
            v30 = v28 == 0;
          else
            v30 = 1;
          if (v30)
          {
            PLPhotoKitGetLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v29;
              v46 = 2114;
              v47 = v27;
              _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Could not fetch moment for asset UUID: %{public}@, moment UUID: %{public}@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v20, "setObject:forKey:", v27, v28);
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v23);
    }

    v11 = v37;
    ((void (**)(id, void *, id))v37)[2](v37, v20, 0);

    v9 = v38;
    v15 = v35;
    v12 = v36;
    v16 = v34;
    v19 = 0;
  }

}

+ (id)batchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMoment.m"), 844, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C97B48];
  +[PLMoment entityName](PLMoment, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("highlight.uuid"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);
  objc_msgSend(v14, "setResultType:", 2);
  v49[0] = CFSTR("uuid");
  v49[1] = CFSTR("highlight.uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPropertiesToFetch:", v16);

  if (!a5)
  {
    v43 = 0;
    a5 = (id *)&v43;
  }
  objc_msgSend(v11, "executeFetchRequest:error:", v14, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = v17;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v20)
    {
      v21 = v20;
      v34 = v15;
      v35 = v14;
      v36 = v11;
      v37 = v10;
      v38 = v9;
      v22 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("highlight.uuid"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("uuid"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v25)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (v28)
          {
            PLPhotoKitGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v45 = v27;
              v46 = 2112;
              v47 = v25;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Error fetching highlight UUID for moment UUID: %@, highlight UUID: %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", v25);
            v30 = objc_claimAutoreleasedReturnValue();
            v29 = v30;
            if (!v30)
            {
              v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v29, v25);
            }
            -[NSObject addObject:](v29, "addObject:", v27);
          }

        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v21);
      v10 = v37;
      v9 = v38;
      v14 = v35;
      v11 = v36;
      v15 = v34;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v31 = *a5;
      *(_DWORD *)buf = 138412290;
      v45 = v31;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error fetching momentUUID by highlightUUID: %@", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:andAssetPredicate:inManagedObjectContext:error:", a3, 0, a4, a5);
}

+ (id)batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:(id)a3 andAssetPredicate:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  const __CFString *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMoment.m"), 888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v14 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchRequestWithEntityName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v11);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v12)
  {
    v19 = (void *)MEMORY[0x1E0CB3528];
    v35[0] = v17;
    v35[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setPredicate:", v21);
  }
  else
  {
    objc_msgSend(v16, "setPredicate:", v17);
  }
  v34 = CFSTR("moment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRelationshipKeyPathsForPrefetching:", v22);

  objc_msgSend(v16, "setIncludesPropertyValues:", 0);
  v33 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v16, &v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v33;
  v25 = v24;
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __137__PLMoment_PLMoment_Private__batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs_andAssetPredicate_inManagedObjectContext_error___block_invoke;
    v31[3] = &unk_1E36740E0;
    v27 = v26;
    v32 = v27;
    v28 = (id)objc_msgSend(v13, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v16, 0, v31);

  }
  else
  {
    v27 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v24);
  }

  return v27;
}

+ (id)allAssetsIncludedInMomentsInManagedObjectContext:(id)a3 IDsOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "predicateForAssetsIncludedInMoments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allAssetsInManagedObjectContext:predicate:IDsOnly:error:", v8, v9, v6, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)allInvalidAssetsInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "predicateForInvalidAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allAssetsInManagedObjectContext:predicate:IDsOnly:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allAssetsInManagedObjectContext:(id)a3 predicate:(id)a4 IDsOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v7 = a5;
  v20[3] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0C97B48];
  v10 = a4;
  v11 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setPredicate:", v10);
  objc_msgSend(v13, "setFetchBatchSize:", 100);
  if (v7)
  {
    objc_msgSend(v13, "setResultType:", 1);
    objc_msgSend(v13, "setIncludesPropertyValues:", 0);
  }
  objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", &unk_1E3764058);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("additionalAttributes.originalFilename"), 1, sel_localizedCaseInsensitiveCompare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = v15;
  v20[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSortDescriptors:", v17);

  objc_msgSend(v11, "executeFetchRequest:error:", v13, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __137__PLMoment_PLMoment_Private__batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs_andAssetPredicate_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "moment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);
  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Error fetching moment for asset objectID: %@, moment objectID: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

@end
