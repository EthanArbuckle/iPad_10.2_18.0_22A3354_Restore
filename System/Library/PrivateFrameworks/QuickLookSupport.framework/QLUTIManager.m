@implementation QLUTIManager

+ (id)valueInTypeKeyedDictionary:(id)a3 forType:(id)a4
{
  return (id)objc_msgSend(a1, "_recursiveValueInDictionary:forType:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:", a3, a4, 0, 0, 0);
}

+ (id)findAndStoreValueInTypeKeyedDictionary:(id)a3 forType:(id)a4 withDescription:(id)a5 withQueue:(id)a6 validationBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void *v19;
  id v20;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  if (v11 && v12)
  {
    v17 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke;
    v24[3] = &unk_24C71B020;
    v29 = &v30;
    v25 = v11;
    v26 = v12;
    v27 = v13;
    v28 = v15;
    v18 = (void (**)(_QWORD))MEMORY[0x212BA28B4](v24);
    v19 = v18;
    if (v14)
    {
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_3;
      v22[3] = &unk_24C71B048;
      v23 = v18;
      dispatch_sync(v14, v22);

    }
    else
    {
      v18[2](v18);
    }

    v16 = (void *)v31[5];
  }
  v20 = v16;
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_2;
  v7[3] = &unk_24C71AFF8;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  +[QLUTIManager _recursiveValueInDictionary:forType:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:](QLUTIManager, "_recursiveValueInDictionary:forType:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:", v2, v3, 0, v7, *(_QWORD *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = _qlsLogHandle;
  if (v7)
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v8 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v14 = 138412802;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_20D4C7000, v8, OS_LOG_TYPE_INFO, "Getting %@ for '%@' from UTI '%@' #UTI", (uint8_t *)&v14, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);
  }
  else
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v8 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      v14 = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_20D4C7000, v8, OS_LOG_TYPE_INFO, "Caching NSNULL as %@ for '%@' #UTI", (uint8_t *)&v14, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v6);

  }
  objc_opt_class();
  v12 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v12 = 0;
  }

  return v12;
}

uint64_t __105__QLUTIManager_findAndStoreValueInTypeKeyedDictionary_forType_withDescription_withQueue_validationBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_searchParentTypesFor:(id)a3 fromDictionary:(id)a4 alreadySeenUTIs:(id)a5 matchedValueToTypeBlock:(id)a6 validationBlock:(id)a7
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

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "hasPrefix:", CFSTR("dyn.")))
  {
    v20 = (void *)UTTypeCopyParentIdentifiers();
    if (v20)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  v18 = (void *)_UTTypeCopyPedigreeSet();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v19, "removeObject:", v17);
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "_selectParentUTIForUTI:fromParentUTIs:dictionary:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:", v12, v20, v13, v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v21;
}

+ (id)_recursiveValueInDictionary:(id)a3 forType:(id)a4 alreadySeenUTIs:(id)a5 matchedValueToTypeBlock:(id)a6 validationBlock:(id)a7
{
  __CFString *v12;
  id v13;
  id v14;
  void (**v15)(id, void *, __CFString *);
  unsigned int (**v16)(id, uint64_t, __CFString *);
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  const __CFString *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  __CFString *v43;
  __int16 v44;
  __CFString *v45;
  __int16 v46;
  __CFString *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *, __CFString *))a6;
  v16 = (unsigned int (**)(id, uint64_t, __CFString *))a7;
  objc_msgSend(v13, "lowercaseString");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    v14 = (id)objc_opt_new();
  if (!objc_msgSend(v14, "containsObject:", v17))
  {
    objc_msgSend(v14, "addObject:", v17);
    -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      if (v16)
      {
        if (v16[2](v16, v18, v17))
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        v22 = 1;
        v19 = v21;
        if (!v15)
          goto LABEL_19;
LABEL_17:
        if (v22)
        {
          v15[2](v15, v19, v17);
          v24 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v24;
        }
        goto LABEL_19;
      }
    }
    else
    {
      v23 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v23 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v43 = v12;
        v44 = 2112;
        v45 = v17;
        _os_log_impl(&dword_20D4C7000, v23, OS_LOG_TYPE_INFO, "No exact match found in type dictionary %p for '%@' #UTI", buf, 0x16u);
      }
      objc_msgSend(a1, "_searchParentTypesFor:fromDictionary:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:", v13, v12, v14, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = 1;
    if (!v15)
      goto LABEL_19;
    goto LABEL_17;
  }
  QLSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

  if (v27)
  {
    v28 = (void *)UTTypeCopyParentIdentifiers();
    if (v28)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = v28;
      obj = v28;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v39 != v31)
              objc_enumerationMutation(obj);
            v33 = *(const __CFString **)(*((_QWORD *)&v38 + 1) + 8 * i);
            if (UTTypeConformsTo(v33, v17))
            {
              QLSLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v43 = v17;
                v44 = 2112;
                v45 = (__CFString *)v33;
                v46 = 2112;
                v47 = v17;
                _os_log_impl(&dword_20D4C7000, v34, OS_LOG_TYPE_DEBUG, "Infinite UTI tree loop (%@ conforms to %@ which conforms to %@) #UTI", buf, 0x20u);
              }

              goto LABEL_34;
            }
          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          if (v30)
            continue;
          break;
        }
      }
LABEL_34:

      v28 = v36;
    }

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("QLUTIErrorDomain"), 0, 0, v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v22 = v35 == 0;
  if (v15)
    goto LABEL_17;
LABEL_19:

  return v19;
}

+ (id)_preferredParentUTIof:(id)a3 fromParents:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BDF8258];
  if (objc_msgSend(v4, "conformsToType:", *MEMORY[0x24BDF8258]))
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_selectParentUTIForUTI:(id)a3 fromParentUTIs:(id)a4 dictionary:(id)a5 alreadySeenUTIs:(id)a6 matchedValueToTypeBlock:(id)a7 validationBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t (**v19)(id, uint64_t, void *);
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  id v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (uint64_t (**)(id, uint64_t, void *))a8;
  v33 = v14;
  objc_msgSend(a1, "_preferredParentUTIof:fromParents:", v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20
    || (objc_msgSend(a1, "_recursiveValueInDictionary:forType:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:", v16, v20, v17, v18, v19), (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v15;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v35;
      v30 = v20;
      v31 = v15;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(a1, "_recursiveValueInDictionary:forType:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:", v16, v26, v17, v18, v19, v30, v31);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v21 = (void *)v27;
            if (!v19 || (v19[2](v19, v27, v33) & 1) != 0)
              goto LABEL_17;
            objc_msgSend(a1, "_searchParentTypesFor:fromDictionary:alreadySeenUTIs:matchedValueToTypeBlock:validationBlock:", v26, v16, v17, v18, v19);
            v28 = objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              v21 = (void *)v28;
LABEL_17:
              v20 = v30;
              v15 = v31;
              goto LABEL_18;
            }
          }
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v21 = 0;
        v20 = v30;
        v15 = v31;
        if (v23)
          continue;
        break;
      }
    }
    else
    {
      v21 = 0;
    }
LABEL_18:

  }
  return v21;
}

+ (id)claimedLivePhotoTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)*MEMORY[0x24BDF8450], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)claimedContactTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)*MEMORY[0x24BDF8638], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)claimedCalendarTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)*MEMORY[0x24BDF8328], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)claimedTextTypes
{
  if (claimedTextTypes_onceToken != -1)
    dispatch_once(&claimedTextTypes_onceToken, &__block_literal_global_0);
  return (id)claimedTextTypes__claimedTextTypes;
}

void __32__QLUTIManager_claimedTextTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)*MEMORY[0x24BDF8510], "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8558], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8560], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF83B0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8670], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8440], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)claimedTextTypes__claimedTextTypes;
  claimedTextTypes__claimedTextTypes = v6;

}

+ (id)claimedPDFTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)*MEMORY[0x24BDF84E0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, CFSTR("com.apple.localized-pdf-bundle"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)claimedImageTypes
{
  if (claimedImageTypes_onceToken != -1)
    dispatch_once(&claimedImageTypes_onceToken, &__block_literal_global_13);
  return (id)claimedImageTypes__claimedImageTypes;
}

void __33__QLUTIManager_claimedImageTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[13];

  v9[12] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)*MEMORY[0x24BDF85D0], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDC17C8];
  v9[1] = v2;
  v9[2] = v3;
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v4;
  objc_msgSend((id)*MEMORY[0x24BDF83D8], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  v9[5] = CFSTR("public.heif");
  v9[6] = CFSTR("public.heics");
  v9[7] = CFSTR("public.heic");
  v9[8] = CFSTR("public.avci");
  v9[9] = CFSTR("com.apple.icns");
  v9[10] = CFSTR("com.apple.pict");
  v9[11] = CFSTR("com.apple.atx");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)claimedImageTypes__claimedImageTypes;
  claimedImageTypes__claimedImageTypes = v7;

}

+ (id)claimedAVTypes
{
  if (claimedAVTypes_onceToken != -1)
    dispatch_once(&claimedAVTypes_onceToken, &__block_literal_global_29);
  return (id)claimedAVTypes__claimedAVTypes;
}

void __30__QLUTIManager_claimedAVTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDB26C8], "audiovisualTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_33);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)claimedAVTypes__claimedAVTypes;
  claimedAVTypes__claimedAVTypes = v3;

}

BOOL __30__QLUTIManager_claimedAVTypes__block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  _BOOL8 v4;
  __CFString *v5;

  v2 = a2;
  objc_msgSend((id)*MEMORY[0x24BDF82D0], "identifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (UTTypeConformsTo(v2, v3))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = UTTypeConformsTo(v2, v5) != 0;

  }
  return v4;
}

+ (id)claimedOfficeTypes
{
  if (claimedOfficeTypes_onceToken != -1)
    dispatch_once(&claimedOfficeTypes_onceToken, &__block_literal_global_34);
  return (id)claimedOfficeTypes__claimedOfficeTypes;
}

void __34__QLUTIManager_claimedOfficeTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.microsoft.powerpoint.ppt"), CFSTR("com.microsoft.powerpoint.pot"), CFSTR("com.microsoft.powerpoint.pps"), CFSTR("org.openxmlformats.presentationml.presentation"), CFSTR("org.openxmlformats.presentationml.presentation.macroenabled"), CFSTR("org.openxmlformats.presentationml.template"), CFSTR("org.openxmlformats.presentationml.template.macroenabled"), CFSTR("org.openxmlformats.presentationml.slideshow"), CFSTR("org.openxmlformats.presentationml.slideshow.macroenabled"), CFSTR("com.microsoft.excel.xls"), CFSTR("com.microsoft.excel.xlt"), CFSTR("com.microsoft.excel.xla"), CFSTR("org.openxmlformats.spreadsheetml.sheet"), CFSTR("org.openxmlformats.spreadsheetml.sheet.macroenabled"), CFSTR("org.openxmlformats.spreadsheetml.template"), CFSTR("org.openxmlformats.spreadsheetml.template.macroenabled"), CFSTR("com.microsoft.word.doc"),
    CFSTR("com.microsoft.word.dot"),
    CFSTR("org.openxmlformats.wordprocessingml.document"),
    CFSTR("org.openxmlformats.wordprocessingml.document.macroenabled"),
    CFSTR("org.openxmlformats.wordprocessingml.template"),
    CFSTR("org.openxmlformats.wordprocessingml.template.macroenabled"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)claimedOfficeTypes__claimedOfficeTypes;
  claimedOfficeTypes__claimedOfficeTypes = v0;

}

+ (id)claimediWorkTypes
{
  if (claimediWorkTypes_onceToken != -1)
    dispatch_once(&claimediWorkTypes_onceToken, &__block_literal_global_79);
  return (id)claimediWorkTypes__claimediWorkTypes;
}

void __33__QLUTIManager_claimediWorkTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.iwork.keynote.key"), CFSTR("com.apple.iwork.numbers.numbers"), CFSTR("com.apple.iwork.pages.pages"), CFSTR("com.apple.iwork.keynote.sffkey"), CFSTR("com.apple.iwork.numbers.sffnumbers"), CFSTR("com.apple.iwork.pages.sffpages"), CFSTR("com.apple.iwork.numbers.template"), CFSTR("com.apple.iwork.numbers.sfftemplate"), CFSTR("com.apple.iwork.pages.template"), CFSTR("com.apple.iwork.pages.sfftemplate"), CFSTR("com.apple.iwork.keynote.kth"), CFSTR("com.apple.iwork.keynote.sffkth"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)claimediWorkTypes__claimediWorkTypes;
  claimediWorkTypes__claimediWorkTypes = v0;

}

+ (id)claimedCSVTypes
{
  if (claimedCSVTypes_onceToken != -1)
    dispatch_once(&claimedCSVTypes_onceToken, &__block_literal_global_104);
  return (id)claimedCSVTypes__claimedCSVTypes;
}

void __31__QLUTIManager_claimedCSVTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("public.comma-separated-values-text"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)claimedCSVTypes__claimedCSVTypes;
  claimedCSVTypes__claimedCSVTypes = v0;

}

+ (id)claimedWebViewTypes
{
  if (claimedWebViewTypes_onceToken != -1)
    dispatch_once(&claimedWebViewTypes_onceToken, &__block_literal_global_107);
  return (id)claimedWebViewTypes__claimedWebViewTypes;
}

void __35__QLUTIManager_claimedWebViewTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("public.svg-image"), CFSTR("public.html"), CFSTR("com.apple.web-internet-location"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)claimedWebViewTypes__claimedWebViewTypes;
  claimedWebViewTypes__claimedWebViewTypes = v0;

}

+ (id)internallyClaimedTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__QLUTIManager_internallyClaimedTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (internallyClaimedTypes_onceToken != -1)
    dispatch_once(&internallyClaimedTypes_onceToken, block);
  return (id)internallyClaimedTypes__internallyClaimedTypes;
}

void __38__QLUTIManager_internallyClaimedTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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

  v2 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(a1 + 32), "claimedTextTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "claimedLivePhotoTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "claimedContactTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend(*(id *)(a1 + 32), "claimedCalendarTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  objc_msgSend(*(id *)(a1 + 32), "claimedPDFTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v12);

  objc_msgSend(*(id *)(a1 + 32), "claimedImageTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v14);

  objc_msgSend(*(id *)(a1 + 32), "claimedAVTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v16);

  objc_msgSend(*(id *)(a1 + 32), "claimedOfficeTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v18);

  objc_msgSend(*(id *)(a1 + 32), "claimediWorkTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v20);

  objc_msgSend(*(id *)(a1 + 32), "claimedCSVTypes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v22);

  objc_msgSend(*(id *)(a1 + 32), "claimedWebViewTypes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v24);

  v25 = (void *)internallyClaimedTypes__internallyClaimedTypes;
  internallyClaimedTypes__internallyClaimedTypes = (uint64_t)v4;

}

+ (id)textGeneratorSupportedTypes
{
  if (textGeneratorSupportedTypes_onceToken != -1)
    dispatch_once(&textGeneratorSupportedTypes_onceToken, &__block_literal_global_114);
  return (id)textGeneratorSupportedTypes__textTypes;
}

void __43__QLUTIManager_textGeneratorSupportedTypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BDF8510];
  v2 = *MEMORY[0x24BDF8558];
  v3 = *MEMORY[0x24BDF8560];
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.oasis-open.opendocument.text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v6, *MEMORY[0x24BDF8530], *MEMORY[0x24BDF8670], *MEMORY[0x24BDF8440], 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)textGeneratorSupportedTypes__textTypes;
  textGeneratorSupportedTypes__textTypes = v4;

}

+ (id)typesForWhichExternalGeneratorsArePreferred
{
  if (typesForWhichExternalGeneratorsArePreferred_onceToken != -1)
    dispatch_once(&typesForWhichExternalGeneratorsArePreferred_onceToken, &__block_literal_global_117);
  return (id)typesForWhichExternalGeneratorsArePreferred__externallyPreferredTypes;
}

void __59__QLUTIManager_typesForWhichExternalGeneratorsArePreferred__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)*MEMORY[0x24BDF8440], "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8670], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8530], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v5, v1, v2, CFSTR("com.adobe.illustrator.ai-image"), CFSTR("org.xiph.flac"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)typesForWhichExternalGeneratorsArePreferred__externallyPreferredTypes;
  typesForWhichExternalGeneratorsArePreferred__externallyPreferredTypes = v3;

}

+ (BOOL)externalGeneratorPreferredForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(a1, "typesForWhichExternalGeneratorsArePreferred");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  return v8;
}

+ (id)screentimeiWorkBundleForUTI:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (v3
    && (+[QLUTIManager claimediWorkTypes](QLUTIManager, "claimediWorkTypes"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", v3),
        v4,
        v5))
  {
    objc_msgSend(v3, "rangeOfString:options:", CFSTR("pages"), 1);
    if (v6)
    {
      v7 = CFSTR("com.apple.Pages");
    }
    else
    {
      objc_msgSend(v3, "rangeOfString:options:", CFSTR("numbers"), 1);
      if (v9)
      {
        v7 = CFSTR("com.apple.Numbers");
      }
      else
      {
        objc_msgSend(v3, "rangeOfString:options:", CFSTR("keynote"), 1);
        if (v10)
          v7 = CFSTR("com.apple.Keynote");
        else
          v7 = 0;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return (id)v7;
}

+ (id)iWorkTypes
{
  if (iWorkTypes_once != -1)
    dispatch_once(&iWorkTypes_once, &__block_literal_global_134);
  return (id)iWorkTypes_iWorkTypes;
}

void __26__QLUTIManager_iWorkTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[13];

  v14[12] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.keynote.key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.numbers.numbers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.pages.pages"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v0;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.keynote.sffkey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v1;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.numbers.sffnumbers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v2;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.pages.sffpages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v3;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.numbers.template"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v4;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.numbers.sfftemplate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v5;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.pages.template"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v6;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.pages.sfftemplate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v7;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.keynote.kth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v8;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iwork.keynote.sffkth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[11] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)iWorkTypes_iWorkTypes;
  iWorkTypes_iWorkTypes = v10;

}

+ (BOOL)contentTypeIsIWorkType:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "iWorkTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "contentType:conformsToContentTypeInArray:", v3, v5);

  return (char)v4;
}

+ (BOOL)contentTypeIsInternallyClaimed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "internallyClaimedTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (BOOL)contentType:(id)a3 conformsToContentTypeInArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__QLUTIManager_contentType_conformsToContentTypeInArray___block_invoke;
  v10[3] = &unk_24C71B1D0;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __57__QLUTIManager_contentType_conformsToContentTypeInArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "conformsToType:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
