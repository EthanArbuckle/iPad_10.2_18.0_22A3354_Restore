@implementation PLSMetadataUtilities

+ (BOOL)_writeDetails:(id)a3 forEntityNamed:(id)a4 toFilepath:(id)a5 withDefaultFilename:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  char v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v11, "length"))
  {
    v19 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("json"));
  if (objc_msgSend(v14, "isEqual:", &stru_1E36789C0))
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v11, &v25);

    if (!v17)
    {
      objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("plist"));
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (v25)
    {
      objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v20 = (void *)v18;

      v11 = v20;
    }
  }
  if ((v15 & 1) != 0)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 1, &v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v13, 100, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  v19 = objc_msgSend(v21, "writeToFile:options:error:", v11, 1073741825, 0);

LABEL_13:
  return v19;
}

+ (id)_allAlbumsInPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  objc_msgSend(a3, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("kind"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  v13 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v6, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  v11 = v10;
  if (!v9)
    NSLog(CFSTR("Failed to get albums: %@"), v10);

  return v9;
}

+ (id)dictionaryFromManagedObject:(id)a3 excludeAttributes:(id)a4 includingRelationships:(id)a5 excludeRelationshipAttributes:(id)a6 andSubRelationships:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  id obj;
  void *v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    v64 = v15;
    objc_msgSend(v12, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "relationshipsByName");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attributesByName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = v19;
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    v57 = v13;
    if (v13)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v22 = v13;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v81 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(v21, "removeObject:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
        }
        while (v24);
      }

    }
    objc_msgSend(v12, "dictionaryWithValuesForKeys:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (id)objc_msgSend(v27, "mutableCopy");

    if (v14)
    {
      objc_msgSend(v12, "entity");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "relationshipsByName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __143__PLSMetadataUtilities_dictionaryFromManagedObject_excludeAttributes_includingRelationships_excludeRelationshipAttributes_andSubRelationships___block_invoke;
      v78[3] = &unk_1E36732A0;
      v54 = v12;
      v29 = v12;
      v79 = v29;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v78);

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      objc_msgSend(v56, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
      if (!v30)
        goto LABEL_39;
      v31 = v30;
      v32 = *(_QWORD *)v75;
      v61 = *(_QWORD *)v75;
      v62 = v21;
      v63 = v14;
      v58 = v29;
      v59 = v16;
      while (1)
      {
        v33 = 0;
        v65 = v31;
        do
        {
          if (*(_QWORD *)v75 != v32)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v33);
          if (objc_msgSend(v14, "containsObject:", v34))
          {
            if (v16)
            {
              objc_msgSend(v16, "objectForKey:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v35 = 0;
            }
            v36 = v16;
            if (v64)
            {
              objc_msgSend(v64, "objectForKey:", v34);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v37 = 0;
            }
            objc_msgSend(v29, "entity");
            v38 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v38, "relationshipsByName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKey:", v34);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v69 = v40;
            LOBYTE(v38) = objc_msgSend(v40, "isToMany");
            v68 = v34;
            objc_msgSend(v29, "valueForKey:", v34);
            v41 = objc_claimAutoreleasedReturnValue();
            v42 = (void *)v41;
            if ((v38 & 1) != 0)
            {
              v43 = (void *)v41;
              v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v67 = v43;
              v45 = v43;
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
              if (v46)
              {
                v47 = v46;
                v48 = *(_QWORD *)v71;
                do
                {
                  for (j = 0; j != v47; ++j)
                  {
                    if (*(_QWORD *)v71 != v48)
                      objc_enumerationMutation(v45);
                    objc_msgSend(a1, "dictionaryFromManagedObject:excludeAttributes:includingRelationships:excludeRelationshipAttributes:andSubRelationships:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j), v37, v35, 0, 0);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "addObject:", v50);

                  }
                  v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
                }
                while (v47);
              }

              v21 = v62;
              v14 = v63;
              v29 = v58;
              v16 = v59;
              v51 = v69;
LABEL_35:
              objc_msgSend(v60, "setObject:forKey:", v44, v68);

              v42 = v67;
            }
            else
            {
              v51 = v40;
              v16 = v36;
              v21 = v62;
              v14 = v63;
              if (v41)
              {
                v67 = (void *)v41;
                objc_msgSend(a1, "dictionaryFromManagedObject:excludeAttributes:includingRelationships:excludeRelationshipAttributes:andSubRelationships:", v41, v37, v35, 0, 0);
                v44 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              }
            }

            v32 = v61;
            v31 = v65;
          }
          ++v33;
        }
        while (v33 != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
        if (!v31)
        {
LABEL_39:

          v12 = v54;
          break;
        }
      }
    }

    v13 = v57;
    v15 = v64;
  }
  else
  {
    v60 = 0;
  }

  return v60;
}

+ (id)_normalizeObjectForJSON:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v8);
    objc_msgSend(v7, "stringFromDate:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v4, "allKeys");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_normalizeObjectForJSON:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v16, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }
LABEL_23:

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v4;
    v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "_normalizeObjectForJSON:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString addObject:](v6, "addObject:", v21);

        }
        v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v4, "isEqual:", v23),
          v23,
          v24))
    {
      v5 = (__CFString *)v4;
      goto LABEL_3;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6 = CFSTR("non-normalized value");
      goto LABEL_24;
    }
  }
  objc_msgSend(v4, "description");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v6 = v5;
LABEL_24:

  return v6;
}

+ (id)_detailsForAsset:(id)a3 includingLocal:(BOOL)a4 includingFingerprints:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  id v67;
  void *v68;
  id v69;
  const __CFString *v70;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  _BYTE v89[128];
  uint64_t v90;

  v76 = a5;
  v5 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relationshipsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke;
  v87[3] = &unk_1E36732A0;
  v10 = v6;
  v88 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v87);

  objc_msgSend(v10, "cloudAssetGUID");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v12 = objc_claimAutoreleasedReturnValue();
  v78 = (void *)v11;
  v79 = (void *)v12;
  if (v11)
    v13 = v11;
  else
    v13 = v12;
  objc_msgSend(v7, "setValue:forKey:", v13, CFSTR("AssetCloudOrLocalID"));
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "dateCreated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v16, CFSTR("AssetDateCreated"));

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "modificationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v19, CFSTR("AssetModificationDate"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "duration");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v21, CFSTR("AssetDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "favorite"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v22, CFSTR("AssetIsFavorite"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v10, "kind"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v23, CFSTR("AssetKind"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v10, "kindSubtype"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v24, CFSTR("AssetKindSubtype"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)objc_msgSend(v10, "height"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v25, CFSTR("AssetHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)objc_msgSend(v10, "width"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v26, CFSTR("AssetWidth"));

  objc_msgSend(v10, "directory");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filename");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByAppendingPathComponent:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "managedObjectContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pathManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "photoDirectoryWithType:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)v29;
  objc_msgSend(v32, "stringByAppendingPathComponent:", v29);
  v33 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)v33;
  v35 = objc_msgSend(v34, "fileExistsAtPath:", v33);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v36, CFSTR("AssetExistsOnDisk"));

  v75 = v5;
  if (v5)
  {
    objc_msgSend(v10, "filename");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v37, CFSTR("AssetFilename"));

    objc_msgSend(v10, "directory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v38, CFSTR("AssetDirectory"));

  }
  objc_msgSend(v10, "location");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    objc_msgSend(v39, "coordinate");
    v42 = v41;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v43, CFSTR("AssetLocationLatitude"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v44, CFSTR("AssetLocationLongitude"));

  }
  v72 = v40;
  objc_msgSend(v10, "albums");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v45, "count"));
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v47 = v45;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v84 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "localizedTitle");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v52);

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    }
    while (v49);
  }

  objc_msgSend(v7, "setValue:forKey:", v46, CFSTR("AssetAlbums"));
  objc_msgSend(v10, "additionalAttributes");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "entity");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "relationshipsByName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke_2;
  v81[3] = &unk_1E36732A0;
  v56 = v53;
  v82 = v56;
  objc_msgSend(v55, "enumerateKeysAndObjectsUsingBlock:", v81);

  objc_msgSend(v10, "master");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57)
  {
    objc_msgSend(v57, "scopedIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v59, CFSTR("AssetCloudMasterGUID"));

  }
  else
  {
    objc_msgSend(v7, "setValue:forKey:", CFSTR("None"), CFSTR("AssetCloudMasterGUID"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "originalHeight"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v60, CFSTR("AssetOriginalHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "originalWidth"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v61, CFSTR("AssetOriginalWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v10, "originalOrientation"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v62, CFSTR("AssetOriginalOrientation"));

  if (v75)
  {
    objc_msgSend(v7, "setValue:forKey:", v79, CFSTR("AssetID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v10, "cloudLocalState"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v63, CFSTR("AssetCloudLocalState"));

  }
  if (v76)
  {
    objc_msgSend(v10, "mainFileURL");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      objc_msgSend(MEMORY[0x1E0D11398], "defaultFingerprintSchemeForUnknownRecord");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0;
      objc_msgSend(v65, "fingerPrintForFileAtURL:error:", v64, &v80);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v77 = v58;
      v67 = v56;
      v68 = v54;
      v69 = v80;

      v54 = v68;
      v56 = v67;
      v58 = v77;
    }
    else
    {
      v66 = 0;
    }
    if (v66)
      v70 = v66;
    else
      v70 = CFSTR("None");
    objc_msgSend(v7, "setValue:forKey:", v70, CFSTR("masterFileFingerPrint"));

  }
  return v7;
}

+ (void)writeJSONData:(id)a3 toFile:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB3608];
  v6 = a3;
  objc_msgSend(v5, "fileHandleForUpdatingAtPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "seekToEndOfFile");
  objc_msgSend(v7, "writeData:", v6);

  objc_msgSend(v7, "closeFile");
}

+ (void)_writeJSONForObjectDetails:(id)a3 toFile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = a4;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 1, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendData:", v15);

        if (v13 != v7)
        {
          objc_msgSend(CFSTR(",\n"), "dataUsingEncoding:", 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendData:", v16);

        }
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(a1, "writeJSONData:toFile:", v6, v18);
}

+ (BOOL)initializeJSONFileAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v3 = a3;
  objc_msgSend(CFSTR("{\n"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "writeToFile:options:error:", v3, 1073741825, &v10);

  v6 = v10;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("There was an error trying to create the JSON file: %@"), v8);

  }
  return v5;
}

+ (void)serializeJSONFromObjectDetails:(id)a3 ToPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_normalizeObjectForJSON:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_writeJSONForObjectDetails:toFile:", v8, v6);

}

+ (id)allAssetsDetailsWriteToPath:(id)a3 includingLocal:(BOOL)a4 includingFingerprints:(BOOL)a5 forAlbumTitled:(id)a6 library:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t *v34;
  id v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[3];
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  BOOL v49;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("json")) == 0;

  }
  else
  {
    v16 = 0;
  }
  v49 = v16;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__5912;
  v42 = __Block_byref_object_dispose__5913;
  v43 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 500);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke;
  v27 = &unk_1E36618E8;
  v35 = a1;
  v18 = v14;
  v28 = v18;
  v19 = v13;
  v29 = v19;
  v20 = v17;
  v36 = a4;
  v37 = a5;
  v30 = v20;
  v32 = &v46;
  v33 = v44;
  v21 = v12;
  v31 = v21;
  v34 = &v38;
  objc_msgSend(v18, "performBlockAndWait:", &v24);
  if (*((_BYTE *)v47 + 24))
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend((id)v39[5], "sortedArrayUsingComparator:", &__block_literal_global_5966);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length")
      && (objc_msgSend(a1, "_writeDetails:forEntityNamed:toFilepath:withDefaultFilename:", v22, CFSTR("assets"), v21, CFSTR("allAssetsMetadataDump.plist")) & 1) == 0)
    {
      NSLog(CFSTR("There was an error trying to write to %@"), v21, v24, v25, v26, v27, v28, v29, v30);
    }
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  return v22;
}

+ (id)_detailsForAlbum:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
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
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "localizedTitle");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudGUID");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("None");
  objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("AlbumLocalizedTitle"));
  if (v7)
    v10 = v7;
  else
    v10 = CFSTR("None");
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("AlbumTitle"));
  if (v8)
    v11 = v8;
  else
    v11 = CFSTR("None");
  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("AlbumCloudGUID"));
  objc_msgSend(v4, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("AlbumUUID"));

  objc_msgSend(v4, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("AlbumKind"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isCameraAlbum"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("AlbumIsCameraAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isCloudSharedAlbum"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v15, CFSTR("AlbumIsCloudSharedAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isDeleted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v16, CFSTR("AlbumIsDeleted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isUpdated"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("AlbumIsUpdated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isEmpty"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v18, CFSTR("AlbumIsEmpty"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isLibrary"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v19, CFSTR("AlbumIsLibrary"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isMultipleContributorCloudSharedAlbum"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v20, CFSTR("AlbumIsMultipleContributorCloudSharedAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isOwnedCloudSharedAlbum"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v21, CFSTR("AlbumIsOwnedCloudSharedAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isOwnPhotoStreamAlbum"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v22, CFSTR("AlbumIsOwnPhotoStreamAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isPanoramasAlbum"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v23, CFSTR("AlbumIsPanoramasAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isPendingPhotoStreamAlbum"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v24, CFSTR("AlbumIsPendingPhotoStreamAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isPhotoStreamAlbum"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v25, CFSTR("AlbumIsPhotoStreamAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isSmartAlbum"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v26, CFSTR("AlbumIsSmartAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isStandInAlbum"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v27, CFSTR("AlbumIsStandInAlbum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isFolder"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v28, CFSTR("AlbumIsFolder"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  v30 = objc_msgSend(v4, "assetsCount");

  objc_msgSend(v29, "numberWithUnsignedInteger:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v31, CFSTR("AlbumAssetsCount"));

  return v5;
}

+ (id)allAlbumsDetailsWriteToPath:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5912;
  v23 = __Block_byref_object_dispose__5913;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke;
  v15 = &unk_1E3675800;
  v18 = a1;
  v8 = v7;
  v16 = v8;
  v17 = &v19;
  objc_msgSend(v8, "performBlockAndWait:", &v12);
  if (v6)
  {
    if ((objc_msgSend(a1, "_writeDetails:forEntityNamed:toFilepath:withDefaultFilename:", v20[5], CFSTR("albums"), v6, CFSTR("allAlbumsMetadataDump.plist")) & 1) == 0)NSLog(CFSTR("There was an error trying to write to %@"), v6, v12, v13, v14, v15);
    v9 = (void *)v20[5];
    v20[5] = 0;

  }
  v10 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 48), "_allAlbumsInPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4[1] = 3221225472;
    v4[2] = __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke_2;
    v4[3] = &unk_1E3661930;
    v5 = *(_OWORD *)(a1 + 40);
    v3 = v2;
    v4[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
    v2 = v3;
  }

}

void __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 40), "_detailsForAlbum:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

  objc_autoreleasePoolPop(v3);
}

void __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  __int16 v33;
  _QWORD v34[3];
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 88), "_allAlbumsInPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v37 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v6, "localizedTitle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "kindValue");
        if ((objc_msgSend(v6, "isEmpty") & 1) == 0
          && ((v9 = *(_QWORD *)(a1 + 40)) == 0 && v8 == 1600 || v9 && objc_msgSend(v7, "isEqual:")))
        {
          objc_msgSend(*(id *)(a1 + 48), "valueForKey:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            v12 = objc_msgSend(v10, "intValue") + 1;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%d)"), v7, v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v14 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setValue:forKey:", v15, v13);
            v7 = (void *)v13;
          }
          else
          {
            v16 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setValue:forKey:", v15, v7);
          }

          objc_msgSend(v6, "assets");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "array");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v34[0] = 0;
            v34[1] = v34;
            v34[2] = 0x2020000000;
            v35 = 0;
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke_2;
            v25[3] = &unk_1E36618C0;
            v32 = *(_QWORD *)(a1 + 88);
            v33 = *(_WORD *)(a1 + 96);
            v29 = *(_OWORD *)(a1 + 64);
            v19 = *(id *)(a1 + 56);
            v20 = *(_QWORD *)(a1 + 80);
            v26 = v19;
            v30 = v20;
            v31 = v34;
            v21 = v18;
            v27 = v21;
            v28 = v7;
            objc_msgSend(v21, "enumerateObjectsUsingBlock:", v25);
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
            {
              if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
                objc_msgSend(*(id *)(a1 + 88), "_writeJSONForObjectDetails:toFile:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 56));
              objc_msgSend(CFSTR("  ]\n}\n"), "dataUsingEncoding:", 4);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 88), "writeJSONData:toFile:", v22, *(_QWORD *)(a1 + 56));
              v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
              v24 = *(void **)(v23 + 40);
              *(_QWORD *)(v23 + 40) = 0;

            }
            _Block_object_dispose(v34, 8);
          }

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v3);
  }

}

uint64_t __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "valueForKey:", CFSTR("cloudOrObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("cloudOrObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v3 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 88), "_detailsForAsset:includingLocal:includingFingerprints:", v16, *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(CFSTR("{\n\"assets\" : [\n"), "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "writeToFile:options:error:", *(_QWORD *)(a1 + 32), 1073741825, 0);
    v7 = 56;
    if (v6)
      v7 = 64;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + v7) + 8) + 24) = v6;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v4);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v9 = *(_DWORD *)(v8 + 24);
  if (v9)
    v10 = v9 % 500 == 0;
  else
    v10 = 0;
  if (v10)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 88), "_writeJSONForObjectDetails:toFile:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 32));
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 500);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > (unint64_t)v9)
    {
      v14 = *(void **)(a1 + 88);
      objc_msgSend(CFSTR(",\n"), "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "writeJSONData:toFile:", v15, *(_QWORD *)(a1 + 32));

    }
    NSLog(CFSTR("Processing next batch of assets from album %@ (%d / %lu)"), *(_QWORD *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "count"));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v9 = *(_DWORD *)(v8 + 24);
  }
  *(_DWORD *)(v8 + 24) = v9 + 1;

  objc_autoreleasePoolPop(v3);
}

void __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isToMany"))
  {
    if (objc_msgSend(v8, "isOrdered"))
      v6 = (id)objc_msgSend(v5, "firstObject");
    else
      v7 = (id)objc_msgSend(v5, "anyObject");
  }

}

void __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isToMany"))
  {
    if (objc_msgSend(v8, "isOrdered"))
      v6 = (id)objc_msgSend(v5, "firstObject");
    else
      v7 = (id)objc_msgSend(v5, "anyObject");
  }

}

void __143__PLSMetadataUtilities_dictionaryFromManagedObject_excludeAttributes_includingRelationships_excludeRelationshipAttributes_andSubRelationships___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isToMany"))
  {
    if (objc_msgSend(v8, "isOrdered"))
      v6 = (id)objc_msgSend(v5, "firstObject");
    else
      v7 = (id)objc_msgSend(v5, "anyObject");
  }

}

@end
