@implementation RTAddressSubPremiseTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  _BYTE buf[32];
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTAddressSubPremiseTransformer transformedValue:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 45;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Object is not of array type (in %s:%d)", buf, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v3;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[RTAddressSubPremiseTransformer transformedValue:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 53;
              _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Object is not of RTAddressSubPremise type (in %s:%d)", buf, 0x12u);
            }

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v11 = 0;
            goto LABEL_29;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        if (v7)
          continue;
        break;
      }
    }

    *(_QWORD *)buf = 3735928559;
    *(_OWORD *)&buf[16] = 0u;
    v36 = 0u;
    *(_QWORD *)&buf[8] = objc_msgSend(v5, "count");
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "appendBytes:length:", buf, 48);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v17, "subPremise");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "dataUsingEncoding:", 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = 0;
          v21 = objc_msgSend(v17, "subPremiseType");
          v24 = 0;
          v25 = v21;
          v24 = objc_msgSend(v20, "length") + 16;
          objc_msgSend(v11, "appendBytes:length:", &v24, 8);
          objc_msgSend(v11, "appendBytes:length:", &v25, 8);
          objc_msgSend(v11, "appendData:", v20);

          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v14);
    }

LABEL_29:
    v3 = v23;
  }
  else
  {
LABEL_27:
    v11 = 0;
  }

  return v11;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _BYTE buf[24];
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTAddressSubPremiseTransformer reverseTransformedValue:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 90;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", buf, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;
    *(_QWORD *)buf = 3735928559;
    *(_OWORD *)&buf[8] = 0u;
    v19 = 0u;
    v20 = 0;
    objc_msgSend(v5, "getBytes:length:", buf, 48);
    v6 = 0;
    if (*(_QWORD *)buf == 3735928559)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v6 = (void *)objc_msgSend(v7, "initWithCapacity:", *(_QWORD *)&buf[8]);
      if (*(_QWORD *)&buf[8])
      {
        v8 = 0;
        v9 = 48;
        do
        {
          v10 = (void *)MEMORY[0x1D8231EA8]();
          v17 = 0;
          objc_msgSend(v5, "getBytes:range:", &v17, v9, 8);
          v16 = 0;
          objc_msgSend(v5, "getBytes:range:", &v16, v9 + 8, 8);
          objc_msgSend(v5, "subdataWithRange:", v9 + 16, v17 - 16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
          v13 = objc_alloc(MEMORY[0x1E0D18338]);
          v14 = (void *)objc_msgSend(v13, "initWithSubPremise:subPremiseType:", v12, v16);
          if (v14)
            objc_msgSend(v6, "addObject:", v14);
          v9 += v17;

          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (*(_QWORD *)&buf[8] > v8);
      }
    }

  }
  else
  {
LABEL_14:
    v6 = 0;
  }

  return v6;
}

@end
