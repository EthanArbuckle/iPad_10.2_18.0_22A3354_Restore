@implementation RTInferredMapItemDeduperState

- (RTInferredMapItemDeduperState)init
{
  RTInferredMapItemDeduperState *v2;
  RTInferredMapItemDeduperState *v3;
  uint64_t v4;
  NSMutableArray *uniqueInferredMapItems;
  uint64_t v6;
  NSMutableDictionary *intermediateUUIDToInferredMapItemsMap;
  NSDictionary *intermediateUUIDToInferredMapItemMap;
  NSDictionary *dedupedUUIDToMapItemMap;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RTInferredMapItemDeduperState;
  v2 = -[RTInferredMapItemDeduperState init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_canIngest = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    uniqueInferredMapItems = v3->_uniqueInferredMapItems;
    v3->_uniqueInferredMapItems = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    intermediateUUIDToInferredMapItemsMap = v3->_intermediateUUIDToInferredMapItemsMap;
    v3->_intermediateUUIDToInferredMapItemsMap = (NSMutableDictionary *)v6;

    intermediateUUIDToInferredMapItemMap = v3->_intermediateUUIDToInferredMapItemMap;
    v3->_intermediateUUIDToInferredMapItemMap = 0;

    dedupedUUIDToMapItemMap = v3->_dedupedUUIDToMapItemMap;
    v3->_dedupedUUIDToMapItemMap = 0;

  }
  return v3;
}

- (void)resetState
{
  uint64_t v2;
  NSMutableArray *uniqueInferredMapItems;
  uint64_t v4;
  NSMutableDictionary *intermediateUUIDToInferredMapItemsMap;
  NSDictionary *intermediateUUIDToInferredMapItemMap;
  NSDictionary *dedupedUUIDToMapItemMap;
  RTInferredMapItemDeduperState *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_canIngest = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  uniqueInferredMapItems = obj->_uniqueInferredMapItems;
  obj->_uniqueInferredMapItems = (NSMutableArray *)v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  intermediateUUIDToInferredMapItemsMap = obj->_intermediateUUIDToInferredMapItemsMap;
  obj->_intermediateUUIDToInferredMapItemsMap = (NSMutableDictionary *)v4;

  intermediateUUIDToInferredMapItemMap = obj->_intermediateUUIDToInferredMapItemMap;
  obj->_intermediateUUIDToInferredMapItemMap = 0;

  dedupedUUIDToMapItemMap = obj->_dedupedUUIDToMapItemMap;
  obj->_dedupedUUIDToMapItemMap = 0;

  objc_sync_exit(obj);
}

- (BOOL)ingestInferredMapItemWithIntermediateUUID:(id)a3 error:(id *)a4
{
  id v6;
  RTInferredMapItemDeduperState *v7;
  BOOL canIngest;
  NSMutableDictionary *intermediateUUIDToInferredMapItemsMap;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *uniqueInferredMapItems;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  uint8_t v25[8];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    canIngest = v7->_canIngest;
    if (v7->_canIngest)
    {
      intermediateUUIDToInferredMapItemsMap = v7->_intermediateUUIDToInferredMapItemsMap;
      objc_msgSend(v6, "secondObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](intermediateUUIDToInferredMapItemsMap, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v7->_intermediateUUIDToInferredMapItemsMap;
        objc_msgSend(v6, "secondObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);
      }
      else
      {
        uniqueInferredMapItems = v7->_uniqueInferredMapItems;
        objc_msgSend(v6, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](uniqueInferredMapItems, "addObject:", v21);

        v22 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v6, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayWithObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v7->_intermediateUUIDToInferredMapItemsMap;
        objc_msgSend(v6, "secondObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v14, v15);
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("cannot ingest more inferredMapItems since the state is finalized");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = objc_retainAutorelease(v19);

    }
    objc_sync_exit(v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemWithIntermediateUUID", v25, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("inferredMapItemWithIntermediateUUID"));
      canIngest = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      canIngest = 0;
    }
  }

  return canIngest;
}

- (id)combinedInferredMapItemFromInferredMapItems:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  const __CFString *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[16];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = v6;
      obj = v6;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (!v7)
      {
        v9 = 0;
        v19 = 0;
        goto LABEL_39;
      }
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v46;
      while (1)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
          if (!v9)
          {
            v16 = v12;
LABEL_22:
            objc_msgSend(v12, "mapItem", v43);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "extendedAttributes");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v34, "wifiFingerprintLabelType");

            v9 = v12;
            goto LABEL_23;
          }
          objc_msgSend(v9, "mapItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "extendedAttributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "wifiFingerprintLabelType"))
            v15 = v9;
          else
            v15 = v12;
          objc_msgSend(v15, "mapItem", v43);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "extendedAttributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "wifiFingerprintLabelType");

          objc_msgSend(v9, "mapItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "validMUID") & 1) != 0)
          {
            objc_msgSend(v12, "mapItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "validMUID");

            if (!v22)
              goto LABEL_23;
          }
          else
          {

          }
          objc_msgSend(v9, "mapItem");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "validMUID"))
          {

LABEL_20:
            objc_msgSend(v12, "confidence");
            v27 = v26;
            objc_msgSend(v9, "confidence");
            if (v27 <= v28)
              goto LABEL_23;
            goto LABEL_21;
          }
          objc_msgSend(v12, "mapItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "validMUID");

          if (!v25)
            goto LABEL_20;
LABEL_21:
          v29 = v12;

          objc_msgSend(v29, "mapItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "extendedAttributes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "wifiFingerprintLabelType");

          if (v32)
            goto LABEL_22;
          v9 = v29;
LABEL_23:
          ++v11;
        }
        while (v8 != v11);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        v8 = v35;
        if (!v35)
        {
LABEL_39:

          objc_msgSend(v9, "mapItem");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "extendedAttributes");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setValue:forKey:", v41, CFSTR("wifiFingerprintLabelType"));

          v6 = v43;
          goto LABEL_40;
        }
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems.count > 0", buf, 2u);
    }

    if (a4)
    {
      v37 = CFSTR("inferredMapItems.count > 0");
      goto LABEL_36;
    }
LABEL_37:
    v9 = 0;
    goto LABEL_40;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
  }

  if (!a4)
    goto LABEL_37;
  v37 = CFSTR("inferredMapItems");
LABEL_36:
  _RTErrorInvalidParameterCreate((uint64_t)v37);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v9;
}

- (BOOL)finalizeState:(id *)a3
{
  RTInferredMapItemDeduperState *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *p_super;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  id *v25;
  NSMutableDictionary *obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  const __CFString *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_canIngest)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](v4->_intermediateUUIDToInferredMapItemsMap, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](v4->_intermediateUUIDToInferredMapItemsMap, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = v4->_intermediateUUIDToInferredMapItemsMap;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v29;
      obj = v7;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        -[NSMutableDictionary objectForKeyedSubscript:](v4->_intermediateUUIDToInferredMapItemsMap, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        -[RTInferredMapItemDeduperState combinedInferredMapItemFromInferredMapItems:error:](v4, "combinedInferredMapItemFromInferredMapItems:error:", v12, &v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v27;

        if (v14)
          break;
        if (!v13)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v32 = *MEMORY[0x1E0CB2D50];
          v33 = CFSTR("combinedInferredMapItem was nil");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            *v25 = objc_retainAutorelease(v23);

          v13 = 0;
LABEL_18:

          v20 = 0;
          p_super = &obj->super;
          goto LABEL_19;
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);
        objc_msgSend(v13, "mapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v17);

        if (v8 == ++v10)
        {
          v7 = obj;
          v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      if (v25)
        *v25 = objc_retainAutorelease(v14);
      goto LABEL_18;
    }
LABEL_11:

    v4->_canIngest = 0;
    objc_storeStrong((id *)&v4->_intermediateUUIDToInferredMapItemMap, v5);
    v18 = v6;
    p_super = v4->_dedupedUUIDToMapItemMap;
    v4->_dedupedUUIDToMapItemMap = v18;
    v20 = 1;
LABEL_19:

  }
  else
  {
    v20 = 1;
  }
  objc_sync_exit(v4);

  return v20;
}

- (id)mapItemForIntermediateUUID:(id)a3 error:(id *)a4
{
  id v6;
  RTInferredMapItemDeduperState *v7;
  NSDictionary *intermediateUUIDToInferredMapItemMap;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[8];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    intermediateUUIDToInferredMapItemMap = v7->_intermediateUUIDToInferredMapItemMap;
    if (!intermediateUUIDToInferredMapItemMap)
    {
      v20 = 0;
      v9 = -[RTInferredMapItemDeduperState finalizeState:](v7, "finalizeState:", &v20);
      v10 = v20;
      v11 = v10;
      if (!v9)
      {
        if (a4)
        {
          v11 = objc_retainAutorelease(v10);
          v13 = 0;
          *a4 = v11;
          goto LABEL_18;
        }
        goto LABEL_14;
      }

      intermediateUUIDToInferredMapItemMap = v7->_intermediateUUIDToInferredMapItemMap;
    }
    -[NSDictionary objectForKeyedSubscript:](intermediateUUIDToInferredMapItemMap, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (v12)
    {
      objc_msgSend(v12, "mapItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

      objc_sync_exit(v7);
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intermediateUUID, %@, not in table"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v18);

    v11 = 0;
LABEL_14:
    v13 = 0;
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: intermediateUUID", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("intermediateUUID"));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_19:

  return v13;
}

- (id)inferredMapItemFromInferredMapItemWithIntermediateUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "secondObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    -[RTInferredMapItemDeduperState mapItemForIntermediateUUID:error:](self, "mapItemForIntermediateUUID:error:", v8, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;

    if (v10)
    {
      v11 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0D183A8]);
      objc_msgSend(v7, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "confidence");
      v16 = v15;
      objc_msgSend(v7, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithMapItem:confidence:source:", v9, objc_msgSend(v17, "source"), v16);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemWithIntermediateUUID", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("inferredMapItemWithIntermediateUUID"));
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)mapItemForDedupedUUID:(id)a3 error:(id *)a4
{
  id v6;
  RTInferredMapItemDeduperState *v7;
  NSDictionary *dedupedUUIDToMapItemMap;
  BOOL v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  uint8_t buf[8];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if (a4)
    {
      v7 = self;
      objc_sync_enter(v7);
      dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
      if (!dedupedUUIDToMapItemMap)
      {
        v22 = 0;
        v9 = -[RTInferredMapItemDeduperState finalizeState:](v7, "finalizeState:", &v22);
        v10 = v22;
        if (!v9)
        {
          v12 = objc_retainAutorelease(v10);
          v13 = 0;
          *a4 = v12;
LABEL_18:

          objc_sync_exit(v7);
          goto LABEL_19;
        }

        dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
      }
      -[NSDictionary objectForKeyedSubscript:](dedupedUUIDToMapItemMap, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = v11;
        v13 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dedupedUUID, %@, not in table"), v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB2D50];
        v25[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_retainAutorelease(v19);
        *a4 = v20;

        v12 = 0;
        v13 = 0;
      }
      goto LABEL_18;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dedupedUUID", buf, 2u);
  }

  if (!a4)
  {
LABEL_15:
    v13 = 0;
    goto LABEL_19;
  }
  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dedupedUUID"));
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v13;
}

- (id)allDedupedUUIDsWithError:(id *)a3
{
  RTInferredMapItemDeduperState *v4;
  NSDictionary *dedupedUUIDToMapItemMap;
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v4 = self;
  objc_sync_enter(v4);
  dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
  if (dedupedUUIDToMapItemMap)
    goto LABEL_4;
  v12 = 0;
  v6 = -[RTInferredMapItemDeduperState finalizeState:](v4, "finalizeState:", &v12);
  v7 = v12;
  v8 = v7;
  if (v6)
  {

    dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
LABEL_4:
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[NSDictionary allKeys](dedupedUUIDToMapItemMap, "allKeys");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3)
  {
    v8 = objc_retainAutorelease(v7);
    v10 = 0;
    *a3 = v8;
  }
  else
  {
    v10 = 0;
  }
LABEL_5:

  objc_sync_exit(v4);
  return v10;
}

- (BOOL)enumerateDedupedUUIDToMapItemMapUsingBlock:(id)a3 error:(id *)a4
{
  void (**v6)(id, _QWORD, void *, uint8_t *);
  RTInferredMapItemDeduperState *v7;
  NSDictionary *dedupedUUIDToMapItemMap;
  BOOL v9;
  id v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[8];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *, uint8_t *))a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("block"));
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_23:
    v17 = 0;
    goto LABEL_24;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_23;
  }
  v7 = self;
  objc_sync_enter(v7);
  dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
  if (dedupedUUIDToMapItemMap)
  {
LABEL_6:
    buf[0] = 0;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = dedupedUUIDToMapItemMap;
    v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
LABEL_8:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
        -[NSDictionary objectForKeyedSubscript:](v7->_dedupedUUIDToMapItemMap, "objectForKeyedSubscript:", v15, (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v15, v16, buf);

        if (buf[0])
          break;
        if (v12 == ++v14)
        {
          v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          if (v12)
            goto LABEL_8;
          break;
        }
      }
    }

    v17 = 1;
    goto LABEL_15;
  }
  v26 = 0;
  v9 = -[RTInferredMapItemDeduperState finalizeState:](v7, "finalizeState:", &v26);
  v10 = v26;
  if (v9)
  {

    dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
    goto LABEL_6;
  }
  v21 = objc_retainAutorelease(v10);
  *a4 = v21;

  v17 = 0;
LABEL_15:
  objc_sync_exit(v7);

LABEL_24:
  return v17;
}

- (id)allUniqueMapItemsWithError:(id *)a3
{
  RTInferredMapItemDeduperState *v4;
  NSDictionary *dedupedUUIDToMapItemMap;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v4 = self;
  objc_sync_enter(v4);
  dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
  if (dedupedUUIDToMapItemMap)
    goto LABEL_4;
  v11 = 0;
  v6 = -[RTInferredMapItemDeduperState finalizeState:](v4, "finalizeState:", &v11);
  v7 = v11;
  v8 = v7;
  if (v6)
  {

    dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
LABEL_4:
    -[NSDictionary allValues](dedupedUUIDToMapItemMap, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  v9 = 0;
LABEL_5:
  objc_sync_exit(v4);

  return v9;
}

- (BOOL)canIngest
{
  return self->_canIngest;
}

- (void)setCanIngest:(BOOL)a3
{
  self->_canIngest = a3;
}

- (NSMutableArray)uniqueInferredMapItems
{
  return self->_uniqueInferredMapItems;
}

- (void)setUniqueInferredMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueInferredMapItems, a3);
}

- (NSMutableDictionary)intermediateUUIDToInferredMapItemsMap
{
  return self->_intermediateUUIDToInferredMapItemsMap;
}

- (void)setIntermediateUUIDToInferredMapItemsMap:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateUUIDToInferredMapItemsMap, a3);
}

- (NSDictionary)intermediateUUIDToInferredMapItemMap
{
  return self->_intermediateUUIDToInferredMapItemMap;
}

- (void)setIntermediateUUIDToInferredMapItemMap:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateUUIDToInferredMapItemMap, a3);
}

- (NSDictionary)dedupedUUIDToMapItemMap
{
  return self->_dedupedUUIDToMapItemMap;
}

- (void)setDedupedUUIDToMapItemMap:(id)a3
{
  objc_storeStrong((id *)&self->_dedupedUUIDToMapItemMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedupedUUIDToMapItemMap, 0);
  objc_storeStrong((id *)&self->_intermediateUUIDToInferredMapItemMap, 0);
  objc_storeStrong((id *)&self->_intermediateUUIDToInferredMapItemsMap, 0);
  objc_storeStrong((id *)&self->_uniqueInferredMapItems, 0);
}

@end
