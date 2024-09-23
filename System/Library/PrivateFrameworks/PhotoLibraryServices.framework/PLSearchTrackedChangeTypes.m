@implementation PLSearchTrackedChangeTypes

+ (id)entityNamesIndexedBySearch
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  +[PLMemory entityName](PLMemory, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isEntityIndexedBySearch:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "entityNamesIndexedBySearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (PLSearchTrackedAttributes)searchTrackedAttributes
{
  PLSearchTrackedAttributes *searchTrackedAttributes;
  PLSearchTrackedAttributes *v4;
  PLSearchTrackedAttributes *v5;

  searchTrackedAttributes = self->_searchTrackedAttributes;
  if (!searchTrackedAttributes)
  {
    v4 = objc_alloc_init(PLSearchTrackedAttributes);
    v5 = self->_searchTrackedAttributes;
    self->_searchTrackedAttributes = v4;

    searchTrackedAttributes = self->_searchTrackedAttributes;
  }
  return searchTrackedAttributes;
}

- (BOOL)shouldUpdateSearchIndexForChange:(id)a3 entityName:(id)a4 photoLibrary:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchTrackedChangeTypes.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("change"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    -[PLSearchTrackedChangeTypes trackedEntityNameForChange:photoLibrary:](self, "trackedEntityNameForChange:photoLibrary:", v9, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = v10;
LABEL_6:
  v14 = v12;
  if (!objc_msgSend(v12, "length"))
    goto LABEL_18;
  v15 = objc_msgSend(v9, "changeType");
  if ((v15 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v25 = 1;
    goto LABEL_24;
  }
  if (v15 == 1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v9, "updatedProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v27 = v11;
      v28 = v10;
      v19 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[PLSearchTrackedChangeTypes _changesTrackedBySearchForEntity:](self, "_changesTrackedBySearchForEntity:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "containsObject:", v23);

          if ((v24 & 1) != 0)
          {
            v25 = 1;
            goto LABEL_21;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v18)
          continue;
        break;
      }
      v25 = 0;
LABEL_21:
      v11 = v27;
      v10 = v28;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
LABEL_18:
    v25 = 0;
  }
LABEL_24:

  return v25;
}

- (id)_changesTrackedBySearchForEntity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v23 = (void *)v8;

    goto LABEL_18;
  }
  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqualToString:", v9);

  if (v10)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaAnalysisAssetAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "isEqualToString:", v11);

  if (v12)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedAlbumAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "isEqualToString:", v13);

  if (v14)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchingAlbumAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[PLMemory entityName](PLMemory, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "isEqualToString:", v15);

  if (v16)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "memoryAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "isEqualToString:", v17);

  if (v18)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highlightAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[PLPerson entityName](PLPerson, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "isEqualToString:", v19);

  if (v20)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "isEqualToString:", v21);

  if (v22)
  {
    -[PLSearchTrackedChangeTypes searchTrackedAttributes](self, "searchTrackedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detectedFaceAttributesTrackedForSearch");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  PLSearchBackendLibraryChangeTrackingGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = 138412290;
    v27 = v4;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Changes for entity: %@ are not tracked by Photos Search", (uint8_t *)&v26, 0xCu);
  }

  v23 = (void *)MEMORY[0x1E0C9AA60];
LABEL_18:

  return v23;
}

- (id)trackedEntityNameForChange:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __objc2_class **v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  void *v41;
  void *v43;
  void *v44;

  v5 = a4;
  objc_msgSend(a3, "changedObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97B20];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityForName:inManagedObjectContext:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C97B20];
  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityForName:inManagedObjectContext:", v12, v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C97B20];
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entityForName:inManagedObjectContext:", v14, v7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C97B20];
  +[PLMemory entityName](PLMemory, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "entityForName:inManagedObjectContext:", v16, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C97B20];
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entityForName:inManagedObjectContext:", v19, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C97B20];
  +[PLPerson entityName](PLPerson, "entityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entityForName:inManagedObjectContext:", v22, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0C97B20];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "entityForName:inManagedObjectContext:", v25, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "entity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v27, "isEqual:", v10);

  v28 = off_1E3659EE0;
  if ((v13 & 1) == 0)
  {
    objc_msgSend(v6, "entity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqual:", v44);

    if ((v30 & 1) != 0)
    {
      v28 = off_1E3659F60;
    }
    else
    {
      objc_msgSend(v6, "entity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqual:", v43);

      if ((v32 & 1) != 0)
      {
        v28 = off_1E3659ED0;
      }
      else
      {
        objc_msgSend(v6, "entity");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqual:", v17);

        if ((v34 & 1) != 0)
        {
          v28 = off_1E3659F98;
        }
        else
        {
          objc_msgSend(v6, "entity");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqual:", v20);

          if ((v36 & 1) != 0)
          {
            v28 = off_1E365A778;
          }
          else
          {
            objc_msgSend(v6, "entity");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isEqual:", v23);

            if ((v38 & 1) != 0)
            {
              v28 = off_1E365A640;
            }
            else
            {
              objc_msgSend(v6, "entity");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "isEqual:", v26);

              if (!v40)
              {
                v41 = 0;
                goto LABEL_15;
              }
              v28 = off_1E3659908;
            }
          }
        }
      }
    }
  }
  -[__objc2_class entityName](*v28, "entityName", v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v41;
}

- (id)uuidForPersistentHistoryDeletionChange:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  int v29;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  _QWORD v34[6];

  v34[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "changeType") != 2)
  {
    v25 = 0;
    goto LABEL_15;
  }
  -[PLSearchTrackedChangeTypes trackedEntityNameForChange:photoLibrary:](self, "trackedEntityNameForChange:photoLibrary:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v9;
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v10;
  +[PLMemory entityName](PLMemory, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v11;
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v12;
  +[PLPerson entityName](PLPerson, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v8, "isEqualToString:", v15);

  if ((_DWORD)v10)
    goto LABEL_6;
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v8, "isEqualToString:", v16);

  if (v17)
    goto LABEL_6;
  +[PLMemory entityName](PLMemory, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v8, "isEqualToString:", v18);

  if (v19
    || (+[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v8, "isEqualToString:", v20),
        v20,
        v21))
  {
LABEL_6:
    objc_msgSend(v6, "tombstone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = CFSTR("uuid");
LABEL_7:
    objc_msgSend(v22, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  +[PLPerson entityName](PLPerson, "entityName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v8, "isEqualToString:", v28);

  if (v29)
  {
    objc_msgSend(v6, "tombstone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = CFSTR("personUUID");
    goto LABEL_7;
  }
  v25 = 0;
LABEL_8:
  if (objc_msgSend(v14, "containsObject:", v8) && !v25)
  {
    PLSearchBackendLibraryChangeTrackingGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v30 = 138412546;
      v31 = v6;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Unable to locate UUID from deletion change: %@ for entity: %@", (uint8_t *)&v30, 0x16u);
    }

  }
LABEL_15:

  return v25;
}

- (void)setSearchTrackedAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_searchTrackedAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTrackedAttributes, 0);
}

@end
