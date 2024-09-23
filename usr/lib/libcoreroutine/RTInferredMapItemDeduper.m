@implementation RTInferredMapItemDeduper

- (RTInferredMapItemDeduper)init
{
  return -[RTInferredMapItemDeduper initWithDeduperFunction:](self, "initWithDeduperFunction:", &__block_literal_global_1);
}

uint64_t __32__RTInferredMapItemDeduper_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToMapItem:", v6);
  return v7;
}

- (RTInferredMapItemDeduper)initWithDeduperFunction:(id)a3
{
  id v4;
  RTInferredMapItemDeduper *v5;
  uint64_t v6;
  id deduperFunction;
  RTInferredMapItemDeduper *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTInferredMapItemDeduper;
    v5 = -[RTInferredMapItemDeduper init](&v11, sel_init);
    if (v5)
    {
      v6 = MEMORY[0x1D8232094](v4);
      deduperFunction = v5->_deduperFunction;
      v5->_deduperFunction = (id)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deduperFunction", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)inferredMapItem:(id)a3 dedupesToInferredMapItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem1", buf, 2u);
    }

    if (a5)
    {
      v13 = CFSTR("inferredMapItem1");
LABEL_12:
      _RTErrorInvalidParameterCreate((uint64_t)v13);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem2", v16, 2u);
    }

    if (a5)
    {
      v13 = CFSTR("inferredMapItem2");
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v11 = (*((uint64_t (**)(void))self->_deduperFunction + 2))();
LABEL_14:

  return v11;
}

- (id)ingestInferredMapItem:(id)a3 state:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[8];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(v9, "uniqueInferredMapItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __62__RTInferredMapItemDeduper_ingestInferredMapItem_state_error___block_invoke;
      v31[3] = &unk_1E92A54D0;
      v31[4] = self;
      v12 = v8;
      v32 = v12;
      v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v31);

      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v12, "mapItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "uniqueInferredMapItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mapItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", v12, v15);
      if (v22)
      {
        v30 = 0;
        objc_msgSend(v10, "ingestInferredMapItemWithIntermediateUUID:error:", v22, &v30);
        v23 = v30;
        v24 = v23;
        if (!v23)
        {
          v19 = v22;
          goto LABEL_25;
        }
        if (a5)
        {
          v24 = objc_retainAutorelease(v23);
          v19 = 0;
          *a5 = v24;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intermediateInferredMapitem was nil for inferredMapItem, %@"), v12);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0D18598];
        v34 = *MEMORY[0x1E0CB2D50];
        v35[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 0, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (a5)
          *a5 = objc_retainAutorelease(v28);

      }
      v19 = 0;
      goto LABEL_25;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      v17 = CFSTR("state");
      goto LABEL_13;
    }
LABEL_14:
    v19 = 0;
    goto LABEL_26;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
  }

  if (!a5)
    goto LABEL_14;
  v17 = CFSTR("inferredMapItem");
LABEL_13:
  _RTErrorInvalidParameterCreate((uint64_t)v17);
  v19 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v19;
}

uint64_t __62__RTInferredMapItemDeduper_ingestInferredMapItem_state_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "inferredMapItem:dedupesToInferredMapItem:error:", *(_QWORD *)(a1 + 40), a2, 0);
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

- (id)ingestInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v22 = CFSTR("inferredMapItems");
LABEL_24:
      _RTErrorInvalidParameterCreate((uint64_t)v22);
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_25:
    v20 = 0;
    goto LABEL_26;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      v22 = CFSTR("state");
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v26 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v27 = 0;
        -[RTInferredMapItemDeduper ingestInferredMapItem:state:error:](self, "ingestInferredMapItem:state:error:", v17, v10, &v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v27;
        if (v19)
        {
          v23 = v19;
          if (v26)
            *v26 = objc_retainAutorelease(v19);

          v20 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v14)
        continue;
      break;
    }
  }

  v20 = v11;
LABEL_19:

LABEL_26:
  return v20;
}

- (id)dedupeInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v16 = CFSTR("inferredMapItems");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_15:
    v14 = 0;
    goto LABEL_31;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      v16 = CFSTR("state");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v35 = 0;
  -[RTInferredMapItemDeduper ingestInferredMapItems:state:error:](self, "ingestInferredMapItems:state:error:", v8, v9, &v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v11;
    v19 = v11;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v30 = 0;
          objc_msgSend(v10, "inferredMapItemFromInferredMapItemWithIntermediateUUID:error:", v24, &v30);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v30;
          if (v26)
          {
            v27 = v26;
            if (a5)
              *a5 = objc_retainAutorelease(v26);

            v14 = 0;
            goto LABEL_29;
          }
          objc_msgSend(v18, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v21)
          continue;
        break;
      }
    }

    v14 = v18;
LABEL_29:
    v13 = 0;
    v11 = v29;

  }
LABEL_31:

  return v14;
}

- (id)dedupeInferredMapItems:(id)a3 error:(id *)a4
{
  id v6;
  RTInferredMapItemDeduperState *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("inferredMapItems"));
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v12, 2u);
    }

    goto LABEL_11;
  }
  v7 = objc_alloc_init(RTInferredMapItemDeduperState);
  -[RTInferredMapItemDeduper dedupeInferredMapItems:state:error:](self, "dedupeInferredMapItems:state:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (id)dedupeDoubleArrayOfInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  const __CFString *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[8];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: doubleArrayOfInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v35 = CFSTR("doubleArrayOfInferredMapItems");
LABEL_38:
      _RTErrorInvalidParameterCreate((uint64_t)v35);
      v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
LABEL_39:
    v33 = 0;
    goto LABEL_45;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      v35 = CFSTR("state");
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v44 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v45 = v8;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v57 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        v55 = 0;
        -[RTInferredMapItemDeduper ingestInferredMapItems:state:error:](self, "ingestInferredMapItems:state:error:", v17, v10, &v55);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v55;
        if (v19)
        {
          v36 = v19;
          if (a5)
            *a5 = objc_retainAutorelease(v19);

LABEL_43:
          v33 = 0;
          goto LABEL_44;
        }
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v14)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = v11;
  v41 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v41)
  {
    v21 = *(_QWORD *)v52;
    v43 = v20;
    v40 = *(_QWORD *)v52;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(v20);
        v42 = v22;
        v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v22);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v25 = v23;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v48;
          while (2)
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v48 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
              v46 = 0;
              objc_msgSend(v10, "inferredMapItemFromInferredMapItemWithIntermediateUUID:error:", v30, &v46);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v46;
              if (v32)
              {
                v38 = v32;
                if (v44)
                  *v44 = objc_retainAutorelease(v32);

                goto LABEL_43;
              }
              objc_msgSend(v24, "addObject:", v31);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
            if (v27)
              continue;
            break;
          }
        }

        objc_msgSend(v12, "addObject:", v24);
        v22 = v42 + 1;
        v20 = v43;
        v21 = v40;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v41);
  }

  v33 = v12;
LABEL_44:
  v8 = v45;

LABEL_45:
  return v33;
}

- (id)dedupeDoubleArrayOfInferredMapItems:(id)a3 error:(id *)a4
{
  id v6;
  RTInferredMapItemDeduperState *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: doubleArrayOfInferredMapItems", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("doubleArrayOfInferredMapItems"));
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v12, 2u);
    }

    goto LABEL_11;
  }
  v7 = objc_alloc_init(RTInferredMapItemDeduperState);
  -[RTInferredMapItemDeduper dedupeDoubleArrayOfInferredMapItems:state:error:](self, "dedupeDoubleArrayOfInferredMapItems:state:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (id)deduperFunction
{
  return self->_deduperFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deduperFunction, 0);
}

@end
