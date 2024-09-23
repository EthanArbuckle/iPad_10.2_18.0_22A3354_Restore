@implementation PLGraphLabel

- (NSString)plsClassName
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "labelNameFromCode:", -[PLGraphLabel code](self, "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PL%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)_needsLabelUpdateCheckFromGlobalValues:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphLabel.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("globalValues"));

  }
  PLPhotoLibraryServicesBinaryImageUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphLabel.m"), 52, CFSTR("can't read PLS image UUID"));

  }
  objc_msgSend(v5, "lastUpdatedGraphLabelsAgainstPLSImageUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PLObjectIsEqual() ^ 1;

  return v9;
}

+ (id)_insertLabelWithCode:(unsigned int)a3 inManagedObjectContext:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v10;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphLabel.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(a1, "insertInManagedObjectContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCode:", v4);

  return v8;
}

+ (id)entityName
{
  return CFSTR("GraphLabel");
}

+ (void)ensureLabelsAreUpdatedInContext:(id)a3
{
  id v5;
  PLGlobalValues *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PLGlobalValues *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphLabel.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v6 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v5);
  if (objc_msgSend(a1, "_needsLabelUpdateCheckFromGlobalValues:", v6))
  {
    v30 = v6;
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Checking existing GraphLabel set...", buf, 2u);
    }

    +[PLGraphLabel fetchRequest](PLGraphLabel, "fetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setResultType:", 2);
    v39[0] = CFSTR("code");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertiesToFetch:", v9);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v35 = 0;
    objc_msgSend(v5, "executeFetchRequest:error:", v8, &v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v35;
    objc_msgSend(v11, "_pl_map:", &__block_literal_global_91682);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v28 = v12;
      v29 = v8;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", PLBuiltInGraphLabelCodes);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minusSet:", v14);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v16 = v15;
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v32 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            PLBackendGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_msgSend(v21, "integerValue");
              *(_DWORD *)buf = 134217984;
              v37 = v23;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Adding missing GraphLabel with code %ld", buf, 0xCu);
            }

            v24 = (id)objc_msgSend(a1, "_insertLabelWithCode:inManagedObjectContext:", objc_msgSend(v21, "integerValue"), v5);
          }
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v18);
      }

      PLPhotoLibraryServicesBinaryImageUUID();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v30;
      -[PLGlobalValues setLastUpdatedGraphLabelsAgainstPLSImageUUID:](v30, "setLastUpdatedGraphLabelsAgainstPLSImageUUID:", v26);

      v12 = v28;
      v8 = v29;
    }
    else
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (uint64_t)v12;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_FAULT, "Unable to update existing GraphLabel set due to fetch error: %@", buf, 0xCu);
      }
    }

  }
}

+ (id)labelNameFromCode:(unsigned int)a3
{
  uint64_t v3;
  id result;
  void *v7;

  v3 = *(_QWORD *)&a3;
  if ((int)a3 <= 1099)
  {
    result = CFSTR("SocialGroup");
    switch(a3)
    {
      case 0x3E8u:
        return result;
      case 0x3E9u:
        result = CFSTR("SocialGroupKeyAsset");
        break;
      case 0x3EBu:
        result = CFSTR("SocialGroupKeyAssetUserPicked");
        break;
      case 0x3ECu:
        result = CFSTR("SocialGroupExclusiveAsset");
        break;
      default:
        goto LABEL_18;
    }
  }
  else if ((int)a3 > 1199)
  {
    switch(a3)
    {
      case 0x4B0u:
        return CFSTR("SmallDetectedFace");
      case 0x4B1u:
        return CFSTR("LargeDetectedFace");
      case 0x514u:
        return CFSTR("GeneratedAssetDescription");
      default:
LABEL_18:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphLabel.m"), 141, CFSTR("Unexpected label code: %u"), v3);

        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x44Cu:
        result = CFSTR("SearchEntity");
        break;
      case 0x44Du:
        result = CFSTR("SearchEntityPersonRelation");
        break;
      case 0x44Eu:
        result = CFSTR("SearchEntityPersonRelationMe");
        break;
      case 0x44Fu:
        result = CFSTR("SearchEntityPersonRelationSelf");
        break;
      default:
        goto LABEL_18;
    }
  }
  return result;
}

+ (id)fetchLabelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphLabel.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  +[PLGraphLabel fetchRequest](PLGraphLabel, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIncludesPendingChanges:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("code"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v16 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v10)
  {
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Error fetching labels: %@", buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

uint64_t __48__PLGraphLabel_ensureLabelsAreUpdatedInContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("code"));
}

@end
