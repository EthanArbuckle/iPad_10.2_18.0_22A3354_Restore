@implementation WBSWebExtensionUtilities

+ (BOOL)isProfileServerIDForDefaultProfile:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D8A2D8]);
}

+ (double)nextTabID
{
  double result;

  result = *(double *)&+[WBSWebExtensionUtilities nextTabID]::currentTabIDForWebExtension;
  do
    result = result + 1.0;
  while (result == -1.0 || result == 0.0 || result == -100.0);
  +[WBSWebExtensionUtilities nextTabID]::currentTabIDForWebExtension = *(_QWORD *)&result;
  return result;
}

+ (double)nextWindowID
{
  double result;

  result = *(double *)&+[WBSWebExtensionUtilities nextWindowID]::currentWindowIDForWebExtension;
  do
    result = result + 1.0;
  while (result == -1.0 || result == -2.0 || result == 0.0 || result == -100.0);
  +[WBSWebExtensionUtilities nextWindowID]::currentWindowIDForWebExtension = *(_QWORD *)&result;
  return result;
}

+ (BOOL)validateContentsOfDictionary:(id)a3 requiredKeys:(id)a4 optionalKeys:(id)a5 keyToExpectedValueType:(id)a6 outExceptionString:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v30 = a3;
  v11 = a4;
  v12 = a5;
  v28 = a6;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__30;
  v41 = __Block_byref_object_dispose__30;
  v42 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __125__WBSWebExtensionUtilities_validateContentsOfDictionary_requiredKeys_optionalKeys_keyToExpectedValueType_outExceptionString___block_invoke;
  v31[3] = &unk_1E5448F90;
  v15 = v13;
  v32 = v15;
  v16 = v14;
  v33 = v16;
  v17 = v28;
  v34 = v17;
  v36 = &v37;
  v18 = v29;
  v35 = v18;
  objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v31);
  v19 = objc_msgSend(v18, "count");
  v20 = v38;
  if (v19 && !v38[5])
  {
    objc_msgSend(v18, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing required keys: %@."), v22, v28);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v38[5];
    v38[5] = v23;

    v20 = v38;
  }
  v25 = (void *)v20[5];
  if (v25)
  {
    *a7 = objc_retainAutorelease(v25);
    v26 = v38[5] == 0;
  }
  else
  {
    v26 = 1;
  }

  _Block_object_dispose(&v37, 8);
  return v26;
}

void __125__WBSWebExtensionUtilities_validateContentsOfDictionary_requiredKeys_optionalKeys_keyToExpectedValueType_outExceptionString___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v39 = v11;
    if (v11)
    {
      v12 = (objc_class *)objc_msgSend(v11, "firstObject");
      v13 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      if (v15)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v41;
          v38 = v8;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v16);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                *a4 = 1;
                v21 = (void *)MEMORY[0x1E0CB3940];
                v8 = v38;
                classToClassString(v12, 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = (objc_class *)objc_opt_class();
                classToClassString(v23, 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "stringWithFormat:", CFSTR("Expected %@ in the array for '%@', found %@ instead."), v22, v7, v24, v15);
                v25 = objc_claimAutoreleasedReturnValue();
                v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                v27 = *(void **)(v26 + 40);
                *(_QWORD *)(v26 + 40) = v25;

                goto LABEL_28;
              }
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            v8 = v38;
            if (v17)
              continue;
            break;
          }
        }

        goto LABEL_21;
      }
      *a4 = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected an array for '%@'."), v7);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_21:
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
          objc_msgSend(*(id *)(a1 + 56), "removeObject:", v7);
        goto LABEL_28;
      }
      *a4 = 1;
      v31 = (void *)MEMORY[0x1E0CB3940];
      classToClassString((objc_class *)v9, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      classToClassString(v33, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("Expected %@ for '%@', found %@ instead."), v32, v7, v34);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v35;

    }
LABEL_28:

    goto LABEL_29;
  }
  v20 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v46 = v7;
    _os_log_impl(&dword_1A840B000, v20, OS_LOG_TYPE_INFO, "Found unrecognized key (%{private}@), not specified in required or optional keys.", buf, 0xCu);
  }
LABEL_29:

}

+ (BOOL)isTabIDValid:(double)a3
{
  return a3 > -1.0;
}

+ (BOOL)isWindowIDValid:(double)a3
{
  return a3 >= -2.0 && a3 != -1.0;
}

+ (id)serializeObjectToJSON:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v5)
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSWebExtensionUtilities serializeObjectToJSON:].cold.1((uint64_t)v3, v7, buf, v6);
      }

      v8 = 0;
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (double)storageSizeForKeyOrValue:(id)a3
{
  return (double)(unint64_t)objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
}

+ (double)storageSizeForKeysAndValues:(id)a3
{
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__WBSWebExtensionUtilities_storageSizeForKeysAndValues___block_invoke;
  v5[3] = &unk_1E5448FB8;
  v5[4] = &v6;
  v5[5] = a1;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __56__WBSWebExtensionUtilities_storageSizeForKeysAndValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "storageSizeForKeyOrValue:", v9);
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "storageSizeForKeyOrValue:", v5);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7
                                                              + v8
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

+ (id)tabIDToTabPositionDictionaryForTabs:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  WBSWebExtensionTabPosition *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v14;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = -[WBSWebExtensionTabPosition initWithTab:]([WBSWebExtensionTabPosition alloc], "initWithTab:", v8);
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "idForWebExtensions");
        objc_msgSend(v10, "numberWithDouble:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

+ (void)serializeObjectToJSON:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Error serializing %{private}@: %{public}@", buf, 0x16u);

}

@end
