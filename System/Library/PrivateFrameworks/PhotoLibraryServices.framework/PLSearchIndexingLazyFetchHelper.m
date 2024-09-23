@implementation PLSearchIndexingLazyFetchHelper

- (PLSearchIndexingLazyFetchHelper)initWithObject:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5
{
  id v9;
  id v10;
  PLSearchIndexingLazyFetchHelper *v11;
  PLSearchIndexingLazyFetchHelper *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *relationsByPersonUUID;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchIndexingLazyFetchHelper;
  v11 = -[PLSearchIndexingLazyFetchHelper init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_object, a3);
    v12->_libraryIdentifier = a4;
    objc_storeStrong((id *)&v12->_moc, a5);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationsByPersonUUID = v12->_relationsByPersonUUID;
    v12->_relationsByPersonUUID = v13;

  }
  return v12;
}

- (id)allDetectedFaces
{
  NSArray *allDetectedFaces;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  allDetectedFaces = self->_allDetectedFaces;
  if (!allDetectedFaces)
  {
    -[PLManagedObject objectID](self->_object, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDetectedFace fetchDetectedFacesForAssetObjectID:managedObjectContext:](PLDetectedFace, "fetchDetectedFacesForAssetObjectID:managedObjectContext:", v4, self->_moc);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isSuccess"))
    {
      objc_msgSend(v5, "result");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_allDetectedFaces;
      self->_allDetectedFaces = v6;

    }
    else
    {
      PLSearchBackendModelTranslationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PLManagedObject objectID](self->_object, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error fetching detected faces for asset: %{public}@, error: %@", (uint8_t *)&v12, 0x16u);

      }
    }

    allDetectedFaces = self->_allDetectedFaces;
  }
  return allDetectedFaces;
}

- (id)allSceneClassifications
{
  NSArray *allSceneClasifications;
  PLManagedObject *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  allSceneClasifications = self->_allSceneClasifications;
  if (!allSceneClasifications)
  {
    v4 = self->_object;
    -[PLManagedObject additionalAttributes](v4, "additionalAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSceneClassification fetchSceneClassificationsForAdditionalAttributes:managedObjectContext:](PLSceneClassification, "fetchSceneClassificationsForAdditionalAttributes:managedObjectContext:", v5, self->_moc);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isSuccess"))
    {
      objc_msgSend(v6, "result");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_allSceneClasifications;
      self->_allSceneClasifications = v7;

    }
    else
    {
      PLSearchBackendModelTranslationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[PLManagedObject objectID](self->_object, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching scenes for asset: %{public}@, error: %@", (uint8_t *)&v13, 0x16u);

      }
    }

    allSceneClasifications = self->_allSceneClasifications;
  }
  return allSceneClasifications;
}

- (id)memoriesEligibleForSearchIndexing
{
  NSArray *memoriesBeingCuratedAssets;
  PLManagedObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memoriesBeingCuratedAssets = self->_memoriesBeingCuratedAssets;
  if (!memoriesBeingCuratedAssets)
  {
    v4 = self->_object;
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PLManagedObject memoriesBeingCuratedAssets](v4, "memoriesBeingCuratedAssets", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEligibleForSearchIndexing"))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v12 = (NSArray *)objc_msgSend(v5, "copy");
    v13 = self->_memoriesBeingCuratedAssets;
    self->_memoriesBeingCuratedAssets = v12;

    memoriesBeingCuratedAssets = self->_memoriesBeingCuratedAssets;
  }
  return memoriesBeingCuratedAssets;
}

- (id)albumsEligibleForSearchIndexing
{
  NSArray *albumsEligibleForSearchIndexing;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  albumsEligibleForSearchIndexing = self->_albumsEligibleForSearchIndexing;
  if (!albumsEligibleForSearchIndexing)
  {
    -[PLManagedObject objectID](self->_object, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum fetchAlbumsForAssetObjectID:libraryIdentifier:managedObjectContext:](PLGenericAlbum, "fetchAlbumsForAssetObjectID:libraryIdentifier:managedObjectContext:", v4, self->_libraryIdentifier, self->_moc);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isSuccess"))
    {
      objc_msgSend(v5, "result");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_albumsEligibleForSearchIndexing;
      self->_albumsEligibleForSearchIndexing = v6;

    }
    else
    {
      PLSearchBackendModelTranslationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PLManagedObject objectID](self->_object, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error fetching albums for asset: %{public}@, error: %@", (uint8_t *)&v12, 0x16u);

      }
    }

    albumsEligibleForSearchIndexing = self->_albumsEligibleForSearchIndexing;
  }
  return albumsEligibleForSearchIndexing;
}

- (void)enumerateMomentSearchEntitiesWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSArray *momentSearchEntities;
  objc_class *v7;
  PLManagedObject *v8;
  id v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  NSArray *v17;
  id v18;

  v4 = a3;
  v5 = v4;
  momentSearchEntities = self->_momentSearchEntities;
  if (momentSearchEntities)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke_2;
    v14[3] = &unk_1E366F6B8;
    v15 = v4;
    -[NSArray enumerateObjectsUsingBlock:](momentSearchEntities, "enumerateObjectsUsingBlock:", v14);

  }
  else
  {
    v7 = (objc_class *)MEMORY[0x1E0C99DE8];
    v8 = self->_object;
    v9 = objc_alloc_init(v7);
    -[PLManagedObject moment](v8, "moment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke;
    v16[3] = &unk_1E366F690;
    v18 = v5;
    v11 = (NSArray *)v9;
    v17 = v11;
    objc_msgSend(v10, "enumerateAssetSearchEntitiesWithBlock:", v16);

    v12 = self->_momentSearchEntities;
    self->_momentSearchEntities = v11;
    v13 = v11;

  }
}

- (void)enumerateSearchEntityRelationsForPerson:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *relationsByPersonUUID;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  relationsByPersonUUID = self->_relationsByPersonUUID;
  objc_msgSend(v6, "personUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](relationsByPersonUUID, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke_2;
    v16[3] = &unk_1E366F708;
    v17 = v7;
    v11 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke;
    v18[3] = &unk_1E366F6E0;
    v19 = v12;
    v20 = v7;
    v13 = v7;
    v11 = v12;
    objc_msgSend(v6, "enumerateAssetSearchEntityPersonRelationsWithBlock:", v18);
    v14 = self->_relationsByPersonUUID;
    objc_msgSend(v6, "personUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, v15);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationsByPersonUUID, 0);
  objc_storeStrong((id *)&self->_momentSearchEntities, 0);
  objc_storeStrong((id *)&self->_albumsEligibleForSearchIndexing, 0);
  objc_storeStrong((id *)&self->_memoriesBeingCuratedAssets, 0);
  objc_storeStrong((id *)&self->_allSceneClasifications, 0);
  objc_storeStrong((id *)&self->_allDetectedFaces, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

void __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

uint64_t __81__PLSearchIndexingLazyFetchHelper_enumerateSearchEntityRelationsForPerson_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

uint64_t __74__PLSearchIndexingLazyFetchHelper_enumerateMomentSearchEntitiesWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
