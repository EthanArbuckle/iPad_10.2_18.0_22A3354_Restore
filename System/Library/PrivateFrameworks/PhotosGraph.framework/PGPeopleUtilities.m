@implementation PGPeopleUtilities

+ (id)_validPersonLocalIdentifiersFromSocialGroups:(id)a3 withPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v7, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchPersonsWithLocalIdentifiers:options:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          if (objc_msgSend(v23, "type", (_QWORD)v26) != -1)
          {
            objc_msgSend(v23, "localIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)validateKeyedSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_validPersonLocalIdentifiersFromSocialGroups:withPhotoLibrary:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__PGPeopleUtilities_validateKeyedSocialGroups_withPhotoLibrary_graph___block_invoke;
    v20[3] = &unk_1E8428070;
    v21 = v13;
    v25 = a1;
    v22 = v10;
    v23 = v9;
    v15 = v14;
    v24 = v15;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v20);
    v16 = v11;
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v16, "removeObjectsForKeys:", v15);

    }
    v17 = v16;

    v18 = v17;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA70];
    v17 = v11;
  }

  return v18;
}

+ (id)validateSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5
{
  return (id)objc_msgSend(a1, "validateSocialGroups:withPhotoLibrary:graph:usePersonMoments:", a3, a4, a5, 0);
}

+ (id)validateSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5 usePersonMoments:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "_validPersonLocalIdentifiersFromSocialGroups:withPhotoLibrary:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __82__PGPeopleUtilities_validateSocialGroups_withPhotoLibrary_graph_usePersonMoments___block_invoke;
    v17[3] = &unk_1E8428098;
    v18 = v13;
    v21 = a1;
    v19 = v12;
    v20 = v11;
    v22 = a6;
    objc_msgSend(v10, "indexesOfObjectsPassingTest:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectsAtIndexes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

+ (BOOL)_hasMomentsForPersonLocalIdentifiers:(id)a3 inGraph:(id)a4 photoLibrary:(id)a5 usePersonMoments:(BOOL)a6
{
  _BOOL4 v6;
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
  void *v19;
  BOOL v20;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    if (v6)
    {
      objc_msgSend(v11, "momentNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "asSocialGroupMemberNodeCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "socialGroupNodeForMemberNodes:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "momentNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShouldPrefetchCount:", 1);
    objc_msgSend(v16, "setFetchLimit:", 1);
    v17 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v13, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchAssetCollectionsWithLocalIdentifiers:options:", v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "count") != 0;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __82__PGPeopleUtilities_validateSocialGroups_withPhotoLibrary_graph_usePersonMoments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10))
        {

          v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8 = objc_msgSend(*(id *)(a1 + 56), "_hasMomentsForPersonLocalIdentifiers:inGraph:photoLibrary:usePersonMoments:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
LABEL_11:

  return v8;
}

void __70__PGPeopleUtilities_validateKeyedSocialGroups_withPhotoLibrary_graph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1CAA4EB2C]();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), (_QWORD)v13))
        {

          goto LABEL_12;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v10)
        continue;
      break;
    }
  }

  if ((objc_msgSend(*(id *)(a1 + 64), "_hasMomentsForPersonLocalIdentifiers:inGraph:photoLibrary:usePersonMoments:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0) & 1) == 0)LABEL_12:objc_msgSend(*(id *)(a1 + 56), "addObject:", v5, (_QWORD)v13);
  objc_autoreleasePoolPop(v7);

}

@end
