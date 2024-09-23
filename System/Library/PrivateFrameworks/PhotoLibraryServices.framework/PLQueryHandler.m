@implementation PLQueryHandler

+ (id)constructQueryFromData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D732A0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:", v4);

  return v5;
}

+ (id)dataFromQuery:(id)a3
{
  return (id)objc_msgSend(a3, "data");
}

+ (id)infoFromQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasConjunction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "conjunction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v5, *MEMORY[0x1E0D74F80]);

  }
  if (objc_msgSend(v3, "singleQueriesCount"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "singleQueriesCount"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "singleQueries", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          +[PLQueryHandler _infoFromSingleQuery:](PLQueryHandler, "_infoFromSingleQuery:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setValue:forKey:", v6, *MEMORY[0x1E0D74FA0]);
  }
  else
  {
    if (objc_msgSend(v3, "hasFirst"))
    {
      objc_msgSend(v3, "first");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLQueryHandler infoFromQuery:](PLQueryHandler, "infoFromQuery:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v14, *MEMORY[0x1E0D74F88]);

    }
    if (objc_msgSend(v3, "hasSecond"))
    {
      objc_msgSend(v3, "second");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLQueryHandler infoFromQuery:](PLQueryHandler, "infoFromQuery:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v16, *MEMORY[0x1E0D74FA8]);

    }
  }

  return v4;
}

+ (id)queryFromInfo:(id)a3
{
  id v3;
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D732A0]);
  v5 = (_QWORD *)MEMORY[0x1E0D74F80];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D74F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "objectForKey:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConjunction:", objc_msgSend(v7, "integerValue"));

  }
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D74FA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v38 = v3;
    v39 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v37 = v9;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v42;
      v14 = (_QWORD *)MEMORY[0x1E0D74FB0];
      v15 = (_QWORD *)MEMORY[0x1E0D74F78];
      v16 = (_QWORD *)MEMORY[0x1E0D74FB8];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v17);
          v19 = objc_alloc_init(MEMORY[0x1E0D732E8]);
          objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D74F98]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setKey:", objc_msgSend(v20, "integerValue"));

          objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D74F90]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFirstValue:", v21);

          objc_msgSend(v18, "objectForKey:", *v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v18, "objectForKey:", *v14);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setSecondValue:", v23);

          }
          objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D74FC0], v37);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setValueType:", objc_msgSend(v24, "integerValue"));

          objc_msgSend(v18, "objectForKey:", *v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setComparator:", objc_msgSend(v25, "integerValue"));

          objc_msgSend(v18, "objectForKey:", *v16);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v18, "objectForKey:", *v16);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setUnit:", objc_msgSend(v27, "integerValue"));

          }
          objc_msgSend(v10, "addObject:", v19);

          ++v17;
        }
        while (v12 != v17);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v12);
    }

    v4 = v39;
    objc_msgSend(v39, "setSingleQueries:", v10);

    v9 = v37;
    v3 = v38;
  }
  v28 = (_QWORD *)MEMORY[0x1E0D74F88];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D74F88], v37);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v3, "objectForKey:", *v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLQueryHandler queryFromInfo:](PLQueryHandler, "queryFromInfo:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFirst:", v31);

  }
  v32 = (_QWORD *)MEMORY[0x1E0D74FA8];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D74FA8]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v3, "objectForKey:", *v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLQueryHandler queryFromInfo:](PLQueryHandler, "queryFromInfo:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSecond:", v35);

  }
  return v4;
}

+ (id)_infoFromSingleQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, *MEMORY[0x1E0D74F98]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "valueType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, *MEMORY[0x1E0D74FC0]);

  objc_msgSend(v3, "firstValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v7, *MEMORY[0x1E0D74F90]);

  if (objc_msgSend(v3, "hasSecondValue"))
  {
    objc_msgSend(v3, "secondValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v8, *MEMORY[0x1E0D74FB0]);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "comparator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v9, *MEMORY[0x1E0D74F78]);

  if (objc_msgSend(v3, "hasUnit"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "unit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v10, *MEMORY[0x1E0D74FB8]);

  }
  return v4;
}

+ (id)_getTargetDateWithUnit:(int)a3 dateValue:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = integerFromData();
  switch(a3)
  {
    case 1:
      v6 = v5;
      v7 = 0;
      goto LABEL_5;
    case 2:
      v6 = 0;
      v7 = v5;
LABEL_5:
      v9 = 0;
      goto LABEL_7;
    case 3:
      v6 = 0;
      v7 = 0;
      v9 = v5;
LABEL_7:
      v10 = 0;
      goto LABEL_9;
    case 4:
      v6 = 0;
      v7 = 0;
      v9 = 0;
      v10 = v5;
LABEL_9:
      v5 = 0;
      goto LABEL_11;
    case 5:
      v6 = 0;
      v7 = 0;
      v9 = 0;
      v10 = 0;
LABEL_11:
      +[PLQueryHandler _getTargetDateForTheLastDays:weeks:months:years:seconds:targetDate:](PLQueryHandler, "_getTargetDateForTheLastDays:weeks:months:years:seconds:targetDate:", v6, v7, v9, v10, v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

+ (id)_getTargetDateForTheLastDays:(int64_t)a3 weeks:(int64_t)a4 months:(int64_t)a5 years:(int64_t)a6 seconds:(int64_t)a7 targetDate:(id)a8
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v13 = a8;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v15, "setDay:", -a3);
  objc_msgSend(v15, "setWeekOfYear:", -a4);
  objc_msgSend(v15, "setMonth:", -a5);
  objc_msgSend(v15, "setYear:", -a6);
  objc_msgSend(v15, "setSecond:", -a7);
  objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v15, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startOfDayForDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_convertQueryKeyTypeToString:(int)a3
{
  id result;
  const __CFString *v4;

  result = &stru_1E36789C0;
  if (a3 <= 299)
  {
    if (a3 > 99)
    {
      if (a3 == 100)
        return CFSTR("special");
      v4 = CFSTR("addedDate");
      if (a3 != 201)
        v4 = &stru_1E36789C0;
      if (a3 == 200)
        return CFSTR("dateCreated");
      else
        return (id)v4;
    }
    else
    {
      switch(a3)
      {
        case 1:
          result = CFSTR("favorite");
          break;
        case 2:
          result = CFSTR("hidden");
          break;
        case 3:
          result = CFSTR("adjustmentsState");
          break;
        case 4:
        case 6:
        case 9:
          return CFSTR("special");
        default:
          return result;
      }
    }
  }
  else
  {
    if (a3 <= 400)
    {
      switch(a3)
      {
        case 300:
          result = CFSTR("extendedAttributes.aperture");
          break;
        case 301:
          result = CFSTR("extendedAttributes.cameraModel");
          break;
        case 302:
          result = CFSTR("extendedAttributes.flashFired");
          break;
        case 303:
          result = CFSTR("extendedAttributes.focalLength");
          break;
        case 304:
          result = CFSTR("extendedAttributes.iso");
          break;
        case 305:
          result = CFSTR("extendedAttributes.lensModel");
          break;
        case 306:
          result = CFSTR("extendedAttributes.shutterSpeed");
          break;
        case 307:
        case 308:
          return result;
        case 309:
          result = CFSTR("extendedAttributes.bitrate");
          break;
        case 310:
          result = CFSTR("extendedAttributes.cameraMake");
          break;
        case 311:
          result = CFSTR("extendedAttributes.codec");
          break;
        case 312:
          result = CFSTR("extendedAttributes.duration");
          break;
        case 313:
          result = CFSTR("extendedAttributes.exposureBias");
          break;
        case 314:
          result = CFSTR("extendedAttributes.fps");
          break;
        case 315:
          result = CFSTR("extendedAttributes.meteringMode");
          break;
        case 316:
          result = CFSTR("extendedAttributes.sampleRate");
          break;
        case 317:
          result = CFSTR("extendedAttributes.trackFormat");
          break;
        case 318:
          result = CFSTR("extendedAttributes.whiteBalance");
          break;
        case 319:
          result = CFSTR("locationData");
          break;
        default:
          if (a3 == 400)
            result = CFSTR("additionalAttributes.originalFilename");
          break;
      }
      return result;
    }
    if (a3 > 549)
    {
      if (((a3 - 550) > 0x32 || ((1 << (a3 - 38)) & 0x400000000000BLL) == 0)
        && a3 != 1000)
      {
        return result;
      }
      return CFSTR("special");
    }
    switch(a3)
    {
      case 401:
        return CFSTR("additionalAttributes.title");
      case 403:
        return CFSTR("additionalAttributes.assetDescription.longDescription");
      case 500:
        return CFSTR("special");
    }
  }
  return result;
}

+ (id)_convertQueryValueForAssetType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 9)
    return 0;
  +[PLManagedAsset allHDRValues](PLManagedAsset, "allHDRValues", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_getConvertedQueryKey:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "key");
  if ((_DWORD)v4 == 5)
  {
    objc_msgSend(v3, "firstValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = integerFromData();

    if (v6 == 9)
      v7 = CFSTR("hdrType");
    else
      v7 = &stru_1E36789C0;
  }
  else
  {
    +[PLQueryHandler _convertQueryKeyTypeToString:](PLQueryHandler, "_convertQueryKeyTypeToString:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)_isTextFieldQuery:(int)a3
{
  return (a3 - 301) <= 0xA && ((1 << (a3 - 45)) & 0x611) != 0 || (a3 - 400) < 4;
}

+ (BOOL)_isTextComparator:(int)a3
{
  return (a3 - 20) < 6;
}

+ (int)_convertComparatorToNumericComparator:(int)a3
{
  int result;

  result = a3;
  if ((a3 - 20) <= 5)
    return dword_199B9B6B8[a3 - 20];
  return result;
}

+ (id)_getConvertedKeys:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = a3;
  if (+[PLQueryHandler _isTextComparator:](PLQueryHandler, "_isTextComparator:", objc_msgSend(v3, "comparator")))
  {
    v4 = &stru_1E36789C0;
    v5 = &stru_1E36789C0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  +[PLQueryHandler _getConvertedQueryKey:](PLQueryHandler, "_getConvertedQueryKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "key");
  v8 = objc_msgSend(v3, "valueType");
  v9 = objc_msgSend(v3, "comparator");
  if (v7 > 199)
  {
    if ((v7 - 200) < 2)
    {
      if (objc_msgSend(v3, "valueType") == 1)
      {
        v16 = objc_msgSend(v3, "unit");
        objc_msgSend(v3, "firstValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLQueryHandler _getTargetDateWithUnit:dateValue:](PLQueryHandler, "_getTargetDateWithUnit:dateValue:", v16, v17);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v3, "firstValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        dateFromData();
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_51;
    }
    if (v7 != 500)
      goto LABEL_8;
LABEL_15:

    v18 = objc_msgSend(v3, "hasFirstValue");
    if ((_DWORD)v9 == 22)
      v19 = 1;
    else
      v19 = 2;
    if ((_DWORD)v9 == 22)
      v20 = 5;
    else
      v20 = 4;
    v12 = (__CFString *)&unk_1E375E7D8;
    if ((v18 & 1) != 0)
      v9 = v19;
    else
      v9 = v20;
    goto LABEL_51;
  }
  switch(v7)
  {
    case 3:

      if ((_DWORD)v9 == 1)
        v9 = 2;
      else
        v9 = 1;
      v12 = (__CFString *)&unk_1E375E7F0;
      goto LABEL_51;
    case 5:
      objc_msgSend(v3, "firstValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = integerFromData();

      objc_msgSend(v3, "firstValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLQueryHandler _convertQueryValueForAssetType:](PLQueryHandler, "_convertQueryValueForAssetType:", integerFromData());
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v24 = +[PLQueryHandler _convertComparatorToNumericComparator:](PLQueryHandler, "_convertComparatorToNumericComparator:", objc_msgSend(v3, "comparator"));
      if (v22 == 9)
      {
        if (objc_msgSend(v3, "comparator") == 1)
          v9 = 31;
        else
          v9 = 32;
      }
      else
      {
        v9 = v24;
      }
      goto LABEL_51;
    case 100:
      goto LABEL_15;
  }
LABEL_8:
  switch(v8)
  {
    case 1:
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "firstValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInteger:", integerFromData());
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "hasSecondValue"))
      {
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "secondValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithInteger:", integerFromData());
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      break;
    case 2:
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "firstValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      doubleFromData();
      objc_msgSend(v26, "numberWithDouble:");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "hasSecondValue"))
      {
        v28 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "secondValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        doubleFromData();
        objc_msgSend(v28, "numberWithDouble:");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_36:
        v29 = (__CFString *)v15;

        v4 = v29;
      }
      break;
    case 3:
      if (objc_msgSend(v3, "hasFirstValue"))
      {
        objc_msgSend(v3, "firstValue");
        v30 = objc_claimAutoreleasedReturnValue();
        stringFromData();
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v5 = (__CFString *)v30;
      }
      else
      {
        v12 = &stru_1E36789C0;
      }

      if (objc_msgSend(v3, "hasSecondValue"))
      {
        objc_msgSend(v3, "secondValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        stringFromData();
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
      break;
    case 4:
      objc_msgSend(v3, "firstValue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      dateFromData();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "hasSecondValue"))
      {
        objc_msgSend(v3, "secondValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        dateFromData();
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
      break;
    case 5:
      if (objc_msgSend(v3, "hasFirstValue"))
      {
        objc_msgSend(v3, "firstValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        circularRegionFromData();
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = v5;
      }
      if (objc_msgSend(v3, "hasSecondValue"))
      {
        objc_msgSend(v3, "secondValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        circularRegionFromData();
        v33 = objc_claimAutoreleasedReturnValue();
LABEL_50:
        v35 = (__CFString *)v33;

        v4 = v35;
      }
      break;
    default:
      v12 = v5;
      break;
  }
LABEL_51:
  if (v6)
  {
    v36 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", v6, CFSTR("key"), v12, CFSTR("firstValue"), v4, CFSTR("secondValue"), v37, CFSTR("comparator"), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

+ (unint64_t)_comparatorToOperatorType:(int)a3
{
  unint64_t result;

  result = 4;
  switch(a3)
  {
    case 2:
      return 5;
    case 3:
      return 2;
    case 4:
      return 0;
    case 5:
      return 3;
    case 6:
      return 1;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
      return result;
    case 20:
    case 21:
      return 99;
    case 22:
    case 23:
      return 7;
    case 24:
      return 8;
    case 25:
      return 9;
    case 31:
    case 32:
      return 10;
    default:
      if (a3 == 40)
        return 3;
      if (a3 == 41)
        return 0;
      return result;
  }
}

+ (id)_expressionForStringValue:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
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
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entitiesByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ExtendedAttributes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AdditionalAssetAttributes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AssetDescription"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
  {
    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v13, "propertiesByName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_25;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("extendedAttributes"));

      if (v24)
      {
        objc_msgSend(v14, "propertiesByName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v25;
        objc_msgSend(v25, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
          goto LABEL_23;
      }
      else
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("additionalAttributes"));

        if (!v44)
          goto LABEL_25;
        objc_msgSend(v15, "propertiesByName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v45;
        objc_msgSend(v45, "objectForKey:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v47)
          goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    if (objc_msgSend(v7, "count") != 3)
    {
LABEL_26:
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    objc_msgSend(v13, "propertiesByName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
      goto LABEL_24;
    v30 = (void *)v29;
    v49 = v14;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v51 = v28;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("additionalAttributes"));

    if (!v32)
    {
      v14 = v49;
      goto LABEL_25;
    }
    objc_msgSend(v15, "propertiesByName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v33;
    objc_msgSend(v33, "objectForKey:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("assetDescription"));

      if (v37)
      {
        objc_msgSend(v16, "propertiesByName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKey:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v5);
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = v38;
          v20 = (void *)v41;

          v14 = v49;
          goto LABEL_27;
        }

      }
    }
    v14 = v49;
LABEL_23:
    v28 = v50;
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v13, "propertiesByName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

LABEL_27:
  return v20;
}

+ (BOOL)_needToNegateQueryForComparator:(int)a3
{
  return (a3 < 0x21) & (0x100A00000uLL >> a3);
}

+ (id)_predicateForEmptyQuery:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "key") == 100)
  {
    if (objc_msgSend(v6, "comparator") == 51)
      v8 = 2;
    else
      v8 = 4;
    v9 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("albums"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$album.kind == %d AND $album.trashedState == %d"), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expressionForSubquery:usingIteratorVariable:predicate:", v10, CFSTR("album"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%@.@count"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E375E7F0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v13, v14, 0, v8, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v6, "key") == 500)
    {
      if (objc_msgSend(v6, "comparator") == 51)
        v16 = 2;
      else
        v16 = 4;
      objc_msgSend(v6, "firstValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      stringFromData();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("additionalAttributes.keywords"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$keyword.title LIKE[cd] %@"), v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "expressionForSubquery:usingIteratorVariable:predicate:", v20, CFSTR("keyword"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%@.@count"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E375E7F0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v23, v24, 0, v16, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[PLQueryHandler _getConvertedQueryKey:](PLQueryHandler, "_getConvertedQueryKey:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        v25 = objc_msgSend(v6, "comparator");
        if (v25 == 51)
          v26 = 5;
        else
          v26 = 4;
        +[PLQueryHandler _expressionForStringValue:inLibrary:](PLQueryHandler, "_expressionForStringValue:inLibrary:", v18, v7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB35D0];
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "expressionForConstantValue:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v27, v30, 0, v26, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1, "_isTextFieldQuery:", objc_msgSend(v6, "key")))
        {
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &stru_1E36789C0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v27, v32, 0, v26, 0);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v33;
          v35 = (void *)MEMORY[0x1E0CB3528];
          if (v25 == 51)
          {
            v40[0] = v31;
            v40[1] = v33;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "andPredicateWithSubpredicates:", v36);
            v37 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39[0] = v31;
            v39[1] = v33;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "orPredicateWithSubpredicates:", v36);
            v37 = objc_claimAutoreleasedReturnValue();
          }
          v15 = (id)v37;

        }
        else
        {
          v15 = v31;
        }

      }
      else
      {
        v15 = 0;
      }
    }

  }
  return v15;
}

+ (id)_predicateFromSearchIndexForText:(id)a3 comparator:(int)a4 inLibrary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  PSIDatabase *v10;
  dispatch_block_t v11;
  uint64_t v12;
  PSIDatabase *v13;
  id v14;
  void (**v15)(_QWORD);
  void (**v16)(_QWORD);
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  _QWORD block[4];
  PSIDatabase *v33;
  id v34;
  id v35;
  uint64_t *v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__33846;
  v42 = __Block_byref_object_dispose__33847;
  v43 = 0;
  objc_msgSend(v8, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PSIDatabase initWithPathManager:options:]([PSIDatabase alloc], "initWithPathManager:options:", v9, 1);
  v11 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_33917);
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2;
  block[3] = &unk_1E3668AA0;
  v13 = v10;
  v33 = v13;
  v37 = a4;
  v14 = v7;
  v34 = v14;
  v36 = &v38;
  v15 = v11;
  v35 = v15;
  v16 = (void (**)(_QWORD))dispatch_block_create((dispatch_block_flags_t)0, block);
  if ((PLIsReallyAssetsd() & 1) != 0)
  {
    objc_msgSend(v8, "libraryServicesManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "state") > 5;

    if (v18)
    {
      objc_msgSend(v8, "libraryServicesManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "searchIndexManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v28[0] = v12;
        v28[1] = 3221225472;
        v28[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2_138;
        v28[3] = &unk_1E3676CD8;
        v29 = v16;
        objc_msgSend(v20, "ensureSearchIndexExistsWithCompletionHandler:", v28);
        dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
        v21 = v29;
      }
      else
      {
        PLSearchBackendQueryGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v8;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Unable to querySearchIndex. nil searchIndexManager for library: %@", buf, 0xCu);
        }
      }

    }
  }
  else
  {
    if (v13)
    {
      v16[2](v16);
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unable to execute query, failure to confirm search index existence.", buf, 2u);
      }

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v23 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_UTILITY, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v25 = dispatch_queue_create("com.apple.photos.search.query_handler", v24);
      v30[0] = v12;
      v30[1] = 3221225472;
      v30[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_137;
      v30[3] = &unk_1E3677AA0;
      v31 = v8;
      dispatch_async(v25, v30);
      v15[2](v15);

    }
    dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  v26 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  return v26;
}

+ (id)_predicateForTextQuery:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  if (PLPlatformSearchSupported() && objc_msgSend(v5, "hasFirstValue"))
  {
    objc_msgSend(v5, "firstValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    stringFromData();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = +[PLQueryHandler _needToNegateQueryForComparator:](PLQueryHandler, "_needToNegateQueryForComparator:", objc_msgSend(v5, "comparator"));
    +[PLQueryHandler _predicateFromSearchIndexForText:comparator:inLibrary:](PLQueryHandler, "_predicateFromSearchIndexForText:comparator:inLibrary:", v8, objc_msgSend(v5, "comparator"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_predicateForRangeQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0D732A8];
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithConjunction:", 1);
  if (objc_msgSend(v7, "valueType") == 4)
  {
    objc_msgSend(v7, "firstValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dateFromData();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "secondValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    dateFromData();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v7, "key");
    +[PLQueryHandler _getTargetDateForTheLastDays:weeks:months:years:seconds:targetDate:](PLQueryHandler, "_getTargetDateForTheLastDays:weeks:months:years:seconds:targetDate:", -1, 0, 0, 0, 0, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addIsAfterDateQueryKey:withDate:", v16, v13);
    objc_msgSend(v11, "addIsBeforeDateQueryKey:withDate:", v16, v17);

  }
  else
  {
    v18 = objc_msgSend(v7, "valueType");
    objc_msgSend(v7, "firstValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == 2)
    {
      doubleFromData();
      v21 = v20;

      objc_msgSend(v7, "secondValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      doubleFromData();
      v24 = v23;

      LODWORD(v22) = objc_msgSend(v7, "key");
      v25 = objc_msgSend(v7, "key");
      if ((_DWORD)v22 == 300)
      {
        objc_msgSend(v11, "addDoubleQueryKey:withValue:comparator:", v25, 6, v21);
        v26 = objc_msgSend(v7, "key");
        v27 = v11;
        v28 = v24;
        v29 = 5;
      }
      else
      {
        objc_msgSend(v11, "addDoubleQueryKey:withValue:comparator:", v25, 5, v21);
        v26 = objc_msgSend(v7, "key");
        v27 = v11;
        v28 = v24;
        v29 = 6;
      }
      objc_msgSend(v27, "addDoubleQueryKey:withValue:comparator:", v26, v29, v28);
    }
    else
    {
      v30 = integerFromData();

      objc_msgSend(v7, "secondValue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = integerFromData();

      objc_msgSend(v11, "addIntegerQueryKey:withValue:comparator:", objc_msgSend(v7, "key"), v30, 5);
      objc_msgSend(v11, "addIntegerQueryKey:withValue:comparator:", objc_msgSend(v7, "key"), v32, 6);
    }
  }
  objc_msgSend(v11, "query");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLQueryHandler predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "predicateForQuery:inLibrary:changeDetectionCriteria:", v33, v10, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (BOOL)_needEqualityForDoubleQuery:(int)a3
{
  return (a3 < 0x1F) & (0x40000066u >> a3);
}

+ (id)_equalityPredicateForDoubleQuery:(id)a3 withValue:(double)a4 comparator:(int)a5 inLibrary:(id)a6
{
  void *v8;
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
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a6;
  v10 = a3;
  +[PLQueryHandler _expressionForStringValue:inLibrary:](PLQueryHandler, "_expressionForStringValue:inLibrary:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "expressionForConstantValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObjects:", v11, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:arguments:", CFSTR("from:subtract:"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB35D0];
  v40[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "expressionForFunction:arguments:", CFSTR("abs:"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.22044605e-16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "expressionForConstantValue:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v19, v22, 0, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLQueryHandler _expressionForStringValue:inLibrary:](PLQueryHandler, "_expressionForStringValue:inLibrary:", v10, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "expressionForConstantValue:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v24, v27, 0, 5, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3528];
    v39[0] = v23;
    v39[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "andPredicateWithSubpredicates:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v19, v22, 0, 3, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLQueryHandler _expressionForStringValue:inLibrary:](PLQueryHandler, "_expressionForStringValue:inLibrary:", v10, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "expressionForConstantValue:", v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v24, v27, 0, 4, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0CB3528];
    v38[0] = v23;
    v38[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "orPredicateWithSubpredicates:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v31;

  return v35;
}

+ (id)_predicateForDoubleQuery:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  doubleFromData();
  v9 = v8;

  +[PLQueryHandler _getConvertedQueryKey:](PLQueryHandler, "_getConvertedQueryKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    if (+[PLQueryHandler _needEqualityForDoubleQuery:](PLQueryHandler, "_needEqualityForDoubleQuery:", objc_msgSend(v5, "comparator")))
    {
      if (objc_msgSend(v5, "comparator") == 2)
        v11 = 2;
      else
        v11 = 1;
      +[PLQueryHandler _equalityPredicateForDoubleQuery:withValue:comparator:inLibrary:](PLQueryHandler, "_equalityPredicateForDoubleQuery:withValue:comparator:inLibrary:", v10, v11, v6, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "hasSecondValue"))
      {
        v13 = (void *)MEMORY[0x1E0CB3528];
        v30[0] = v12;
        +[PLQueryHandler _equalityPredicateForDoubleQuery:withValue:comparator:inLibrary:](PLQueryHandler, "_equalityPredicateForDoubleQuery:withValue:comparator:inLibrary:", v10, 1, v6, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "orPredicateWithSubpredicates:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v16;
      }
    }
    else
    {
      v12 = 0;
    }
    +[PLQueryHandler _expressionForStringValue:inLibrary:](PLQueryHandler, "_expressionForStringValue:inLibrary:", v10, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "expressionForConstantValue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v5, "comparator");
    if (objc_msgSend(v5, "key") == 300)
    {
      if ((v22 - 3) >= 3)
      {
        if ((_DWORD)v22 == 6)
          v22 = 5;
        else
          v22 = v22;
      }
      else
      {
        v22 = dword_199B9B6E8[(v22 - 3)];
      }
    }
    v23 = +[PLQueryHandler _comparatorToOperatorType:](PLQueryHandler, "_comparatorToOperatorType:", v22);
    if (v12)
    {
      if ((v22 - 1) > 1)
      {
        v25 = (void *)MEMORY[0x1E0CB3528];
        objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v18, v21, 0, v23, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v26;
        v29[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "orPredicateWithSubpredicates:", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      v24 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v18, v21, 0, v23, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v24;
LABEL_22:

    goto LABEL_23;
  }
  v17 = 0;
LABEL_23:

  return v17;
}

+ (id)_personNameQueryKeyPaths
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("fullName");
  v3[1] = CFSTR("displayName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_personMatchesPredicateForCriteria:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_personNameQueryKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K MATCHES[cd] %@"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), v4, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_predicateForPersonQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "firstValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  stringFromData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(^|.*\\s+)%@(\\s+.*|$)"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".*%@.*"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "comparator");

  switch(v16)
  {
    case 20:
      v17 = a1;
      v18 = v15;
      goto LABEL_8;
    case 21:
      v19 = a1;
      v20 = v15;
      goto LABEL_10;
    case 22:
      v17 = a1;
      v18 = v14;
LABEL_8:
      objc_msgSend(v17, "_personMatchesPredicateForCriteria:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 23:
      v19 = a1;
      v20 = v14;
LABEL_10:
      objc_msgSend(v19, "_personMatchesPredicateForCriteria:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 1;
      if (!v21)
        goto LABEL_20;
      goto LABEL_16;
    case 24:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(^|\\s+)%@.*"), v13);
      goto LABEL_14;
    case 25:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".*%@(\\s+|$)"), v13);
LABEL_14:
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLQueryHandler _personMatchesPredicateForCriteria:](PLQueryHandler, "_personMatchesPredicateForCriteria:", v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      v22 = 0;
      if (!v21)
        goto LABEL_20;
LABEL_16:
      +[PLPerson entityName](PLPerson, "entityName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAttributeKeyPath:forEntityName:", CFSTR("fullName"), v24);

      +[PLPerson entityName](PLPerson, "entityName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAttributeKeyPath:forEntityName:", CFSTR("displayName"), v25);

      +[PLPerson entityName](PLPerson, "entityName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addRelationshipKeyPath:forEntityName:", CFSTR("detectedFaces"), v26);

      objc_msgSend(a1, "_assetsPredicateForPersonPredicate:assetObjectIDs:additionalAssetPredicate:invert:inLibrary:", v21, 0, 0, v22, v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    default:
      if (v16 == 50)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count == 0"), CFSTR("detectedFaces"));
        goto LABEL_18;
      }
      if (v16 == 51)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count > 0"), CFSTR("detectedFaces"));
LABEL_18:
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        goto LABEL_21;
      }
      v21 = 0;
LABEL_20:
      v27 = 0;
LABEL_21:

      return v27;
  }
}

+ (id)_predicateForPersonUUIDQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "firstValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  stringFromData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "comparator") & 0xFFFFFFFE) != 0x16)
  {
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUUID == %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "comparator");
  if (!v13)
  {
LABEL_5:
    v18 = 0;
    goto LABEL_6;
  }
  v15 = v14 == 23;
  +[PLPerson entityName](PLPerson, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAttributeKeyPath:forEntityName:", CFSTR("personUUID"), v16);

  +[PLPerson entityName](PLPerson, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addRelationshipKeyPath:forEntityName:", CFSTR("detectedFaces"), v17);

  objc_msgSend(a1, "_assetsPredicateForPersonPredicate:assetObjectIDs:additionalAssetPredicate:invert:inLibrary:", v13, 0, 0, v15, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v18;
}

+ (id)_predicateForPersonUUIDinMomentForSharedLibraryQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "firstValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  stringFromData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0x1E0CB3000uLL;
  if ((objc_msgSend(v8, "comparator") & 0xFFFFFFFE) == 0x16)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUUID == %@"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "comparator");
    v16 = v15 == 23;
    if (v14)
    {
      v17 = v15 == 23;
      +[PLPerson entityName](PLPerson, "entityName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAttributeKeyPath:forEntityName:", CFSTR("personUUID"), v18);

      +[PLPerson entityName](PLPerson, "entityName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addRelationshipKeyPath:forEntityName:", CFSTR("detectedFaces"), v19);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("additionalAttributes.syndicationIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLLibraryScope compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:](PLLibraryScope, "compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v22 = (id)objc_msgSend(a1, "_assetsPredicateForPersonPredicate:assetObjectIDs:additionalAssetPredicate:invert:inLibrary:", v14, &v42, v21, v17, v9);
      v23 = v42;

      v13 = 0x1E0CB3000;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v23 = 0;
LABEL_6:
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__33846;
  v40 = __Block_byref_object_dispose__33847;
  v41 = 0;
  objc_msgSend(v9, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __105__PLQueryHandler__predicateForPersonUUIDinMomentForSharedLibraryQuery_inLibrary_changeDetectionCriteria___block_invoke;
  v32[3] = &unk_1E3676EA0;
  v25 = v23;
  v33 = v25;
  v26 = v9;
  v34 = v26;
  v35 = &v36;
  objc_msgSend(v24, "performBlockAndWait:", v32);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setByAddingObjectsFromArray:", v37[5]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if (v16)
      v29 = CFSTR("NONE self IN %@");
    else
      v29 = CFSTR("ANY self IN %@");
    objc_msgSend(*(id *)(v13 + 2176), "predicateWithFormat:", v29, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }

  _Block_object_dispose(&v36, 8);
  return v30;
}

+ (id)_assetsPredicateForPersonPredicate:(id)a3 assetObjectIDs:(id *)a4 additionalAssetPredicate:(id)a5 invert:(BOOL)a6 inLibrary:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *);
  void *v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v8 = a6;
  v11 = a3;
  v12 = a5;
  v13 = a7;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__33846;
  v37[4] = __Block_byref_object_dispose__33847;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__33846;
  v35[4] = __Block_byref_object_dispose__33847;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__33846;
  v33 = __Block_byref_object_dispose__33847;
  v34 = 0;
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __110__PLQueryHandler__assetsPredicateForPersonPredicate_assetObjectIDs_additionalAssetPredicate_invert_inLibrary___block_invoke;
  v23 = &unk_1E3668AC8;
  v15 = v11;
  v24 = v15;
  v26 = v37;
  v27 = v35;
  v16 = v12;
  v25 = v16;
  v28 = &v29;
  objc_msgSend(v14, "performBlockAndWait:", &v20);

  if (!v30[5])
  {
    v18 = 0;
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v8)
    v17 = CFSTR("NONE self IN %@");
  else
    v17 = CFSTR("ANY self IN %@");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v17, v30[5], v20, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease((id)v30[5]);
LABEL_7:

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v37, 8);
  return v18;
}

+ (id)_predicateForIsReferencedQuery:(id)a3 inLibrary:(id)a4
{
  int v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "comparator");
  v5 = (void *)MEMORY[0x1E0D73310];
  v6 = objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset");
  if (v4 == 2)
    objc_msgSend(v5, "predicateForExcludeMask:useIndex:", v6, 1);
  else
    objc_msgSend(v5, "predicateForIncludeMask:useIndex:", v6, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_predicateForLoopingQuery:(id)a3 inLibrary:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("noindex:(kind) == %d AND noindex:(playbackStyle) == %d"), 1, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "comparator");

  if (v7 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

+ (id)_predicateFromAlbumKind:(int)a3 negate:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;

  v4 = a4;
  +[PLFetchingAlbum predicateForAlbumKind:](PLFetchingAlbum, "predicateForAlbumKind:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

+ (id)_predicateForProResQuery:(id)a3 inLibrary:(id)a4
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;

  v4 = a3;
  +[PLManagedAsset predicateForProResAssets](PLManagedAsset, "predicateForProResAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "comparator");

  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)_predicateForTaggedWithGPSQuery:(id)a3 inLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a1, "_getConvertedKeys:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("comparator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    v11 = +[PLQueryHandler _comparatorToOperatorType:](PLQueryHandler, "_comparatorToOperatorType:", v10);
    +[PLQueryHandler _expressionForStringValue:inLibrary:](PLQueryHandler, "_expressionForStringValue:inLibrary:", v8, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "expressionForConstantValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v12, v15, 0, v11, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notPredicateWithSubpredicate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_predicateForNotAbleToUploadQuery
{
  return +[PLManagedAsset predicateForUploadableAssetsWithCloudLocalState:](PLManagedAsset, "predicateForUploadableAssetsWithCloudLocalState:", 4);
}

+ (id)_predicateForAbleToUploadQuery
{
  return +[PLManagedAsset predicateForUploadableAssetsWithoutCloudLocalState:](PLManagedAsset, "predicateForUploadableAssetsWithoutCloudLocalState:", 4);
}

+ (BOOL)hasMatchingFetchingAlbumForSingleQuery:(id)a3 outKind:(int *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a3, "firstValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = integerFromData();

  v7 = v6 - 2;
  if ((unint64_t)(v6 - 2) > 0xF || ((0xF77Fu >> v7) & 1) == 0)
    return 0;
  *a4 = dword_199B9B6F4[v7];
  return 1;
}

+ (id)_predicateForSingleQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  char v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  uint8_t buf[4];
  void *v54;
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v52 = 0;
  if (objc_msgSend(v8, "comparator") != 50 && objc_msgSend(v8, "comparator") != 51)
  {
    if (objc_msgSend(v8, "comparator") == 30)
    {
      +[PLQueryHandler _predicateForRangeQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForRangeQuery:inLibrary:changeDetectionCriteria:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 402)
    {
      +[PLQueryHandler _predicateForTextQuery:inLibrary:](PLQueryHandler, "_predicateForTextQuery:inLibrary:", v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 550)
    {
      +[PLQueryHandler _predicateForPersonQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForPersonQuery:inLibrary:changeDetectionCriteria:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 551)
    {
      +[PLQueryHandler _predicateForPersonUUIDQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForPersonUUIDQuery:inLibrary:changeDetectionCriteria:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 553)
    {
      +[PLQueryHandler _predicateForPersonUUIDinMomentForSharedLibraryQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForPersonUUIDinMomentForSharedLibraryQuery:inLibrary:changeDetectionCriteria:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 6)
    {
      +[PLQueryHandler _predicateForIsReferencedQuery:inLibrary:](PLQueryHandler, "_predicateForIsReferencedQuery:inLibrary:", v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "valueType") == 2)
    {
      +[PLQueryHandler _predicateForDoubleQuery:inLibrary:](PLQueryHandler, "_predicateForDoubleQuery:inLibrary:", v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 5)
    {
      objc_msgSend(v8, "firstValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = integerFromData();

      if (v15 == 13)
      {
        +[PLQueryHandler _predicateForLoopingQuery:inLibrary:](PLQueryHandler, "_predicateForLoopingQuery:inLibrary:", v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
    if (objc_msgSend(v8, "key") == 5
      && +[PLQueryHandler hasMatchingFetchingAlbumForSingleQuery:outKind:](PLQueryHandler, "hasMatchingFetchingAlbumForSingleQuery:outKind:", v8, &v52))
    {
      +[PLQueryHandler _predicateFromAlbumKind:negate:](PLQueryHandler, "_predicateFromAlbumKind:negate:", v52, objc_msgSend(v8, "comparator") == 2);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 319)
    {
      +[PLQueryHandler _predicateForTaggedWithGPSQuery:inLibrary:](PLQueryHandler, "_predicateForTaggedWithGPSQuery:inLibrary:", v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 600)
    {
      v12 = 0;
      goto LABEL_5;
    }
    if (objc_msgSend(v8, "key") == 1000)
    {
      if (objc_msgSend(v8, "comparator") == 2)
        +[PLQueryHandler _predicateForAbleToUploadQuery](PLQueryHandler, "_predicateForAbleToUploadQuery");
      else
        +[PLQueryHandler _predicateForNotAbleToUploadQuery](PLQueryHandler, "_predicateForNotAbleToUploadQuery");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "key") == 9)
    {
      +[PLQueryHandler _predicateForProResQuery:inLibrary:](PLQueryHandler, "_predicateForProResQuery:inLibrary:", v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    objc_msgSend(a1, "_getConvertedKeys:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      v12 = 0;
LABEL_58:

      goto LABEL_5;
    }
    objc_msgSend(v16, "objectForKey:", CFSTR("key"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v51, "length"))
    {
      v12 = 0;
LABEL_57:

      goto LABEL_58;
    }
    objc_msgSend(v17, "objectForKey:", CFSTR("firstValue"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("comparator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    if ((objc_msgSend(v8, "key") == 200 || objc_msgSend(v8, "key") == 201)
      && (objc_msgSend(v8, "comparator") == 1 || objc_msgSend(v8, "comparator") == 2))
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startOfDayForDate:", v50);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLQueryHandler _getTargetDateForTheLastDays:weeks:months:years:seconds:targetDate:](PLQueryHandler, "_getTargetDateForTheLastDays:weeks:months:years:seconds:targetDate:", -1, 0, 0, 0, 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "comparator");
      v24 = objc_alloc(MEMORY[0x1E0D732A8]);
      if (v23 == 1)
      {
        v25 = (void *)objc_msgSend(v24, "initWithConjunction:", 1);
        objc_msgSend(v25, "addIsAfterDateQueryKey:withDate:", objc_msgSend(v8, "key"), v21);
        objc_msgSend(v25, "addIsBeforeDateQueryKey:withDate:", objc_msgSend(v8, "key"), v22);
      }
      else
      {
        v25 = (void *)objc_msgSend(v24, "initWithConjunction:", 0);
        objc_msgSend(v25, "addIsBeforeDateQueryKey:withDate:", objc_msgSend(v8, "key"), v21);
        objc_msgSend(v25, "addIsAfterDateQueryKey:withDate:", objc_msgSend(v8, "key"), v22);
      }
      objc_msgSend(v25, "query");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      +[PLQueryHandler predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "predicateForQuery:inLibrary:changeDetectionCriteria:", v33, v9, v10);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }
    v26 = +[PLQueryHandler _comparatorToOperatorType:](PLQueryHandler, "_comparatorToOperatorType:", v19);
    if (+[PLQueryHandler _isTextComparator:](PLQueryHandler, "_isTextComparator:", v19))
      v27 = 3;
    else
      v27 = 0;
    if (objc_msgSend(v8, "key") == 4)
    {
      v28 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("modernResources"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("($resource.resourceType == %d OR $resource.resourceType == %d) AND $resource.utiConformanceHint == %d"), 0, 4, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("resource");
LABEL_52:
      objc_msgSend(v28, "expressionForSubquery:usingIteratorVariable:predicate:", v29, v31, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%@.@count"), v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_69:
      v27 = 0;
      v43 = 1;
LABEL_70:
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v50);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v20, v21, 0, v26, v27);
      v44 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v44;
      if ((v43 & 1) != 0
        || !v44
        || !+[PLQueryHandler _needToNegateQueryForComparator:](PLQueryHandler, "_needToNegateQueryForComparator:", v19))
      {
        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v33, "setComparator:", 50);
      +[PLQueryHandler _predicateForSingleQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForSingleQuery:inLibrary:changeDetectionCriteria:", v33, v9, v10);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v45 = (void *)MEMORY[0x1E0CB3528];
        v55[0] = v22;
        v55[1] = v49;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
        v47 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "orPredicateWithSubpredicates:", v47);
        v34 = (id)objc_claimAutoreleasedReturnValue();

        v12 = (void *)v47;
      }
      else
      {
        PLUserSmartAlbumGetLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "logDescription");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = v48;
          _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEFAULT, "Only negate the predicate, not checking null value for query: %@", buf, 0xCu);

        }
        v34 = v22;
      }

LABEL_55:
      v12 = v34;
LABEL_56:

      goto LABEL_57;
    }
    if (objc_msgSend(v8, "key") == 100)
    {
      if ((objc_msgSend(v8, "hasFirstValue") & 1) == 0)
      {
        v28 = (void *)MEMORY[0x1E0CB35D0];
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("albums"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$album.kind == %d AND $album.trashedState == %d"), 2, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = CFSTR("album");
        goto LABEL_52;
      }
      objc_msgSend(v8, "firstValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      stringFromData();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("albums"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$album.cloudGUID == %@ OR $album.uuid == %@"), v36, v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("album");
    }
    else
    {
      if (objc_msgSend(v8, "key") != 500)
      {
        +[PLQueryHandler _expressionForStringValue:inLibrary:](PLQueryHandler, "_expressionForStringValue:inLibrary:", v51, v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        goto LABEL_70;
      }
      if ((objc_msgSend(v8, "hasFirstValue") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("additionalAttributes.keywords.@count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_69;
      }
      objc_msgSend(v8, "firstValue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      stringFromData();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("additionalAttributes.keywords"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$keyword.title LIKE[cd] %@"), v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("keyword");
    }
    objc_msgSend(v37, "expressionForSubquery:usingIteratorVariable:predicate:", v38, v40, v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%@.@count"), v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_69;
  }
  +[PLQueryHandler _predicateForEmptyQuery:inLibrary:](PLQueryHandler, "_predicateForEmptyQuery:inLibrary:", v8, v9);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v12 = (void *)v11;
LABEL_5:

  return v12;
}

+ (id)predicateForQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  +[PLQueryHandler _predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForQuery:inLibrary:changeDetectionCriteria:", a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForSmartAlbumExclusions"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3528];
    v12[0] = v6;
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)_predicateForQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v18 = 0;
    goto LABEL_48;
  }
  if (!objc_msgSend(v7, "singleQueriesCount"))
  {
    v19 = objc_msgSend(v7, "conjunction");
    objc_msgSend(v7, "first");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLQueryHandler _predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForQuery:inLibrary:changeDetectionCriteria:", v20, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == 2)
    {
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v10);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_47;
    }
    objc_msgSend(v7, "second");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLQueryHandler _predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForQuery:inLibrary:changeDetectionCriteria:", v22, v8, v9);
    v23 = objc_claimAutoreleasedReturnValue();

    if (!v10 || !v23)
    {
      if (v23)
        v18 = 0;
      else
        v18 = v10;
      goto LABEL_46;
    }
    v24 = objc_msgSend(v7, "conjunction");
    v25 = (void *)MEMORY[0x1E0CB3528];
    if (v24)
    {
      v40[0] = v10;
      v40[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41[0] = v10;
      v41[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "orPredicateWithSubpredicates:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (id)v27;
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "singleQueriesCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = v7;
  objc_msgSend(v7, "singleQueries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v11);
        +[PLQueryHandler _predicateForSingleQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "_predicateForSingleQuery:inLibrary:changeDetectionCriteria:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), v8, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v10, "addObject:", v17);
        else
          v14 = 1;

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  if (!objc_msgSend(v10, "count"))
  {
    v18 = 0;
    v7 = v35;
    goto LABEL_30;
  }
  v7 = v35;
  if (!objc_msgSend(v35, "conjunction"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (objc_msgSend(v35, "conjunction") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_29:
    v18 = (id)v21;
    goto LABEL_30;
  }
  if (objc_msgSend(v35, "conjunction") == 2)
  {
    v28 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(v10, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "notPredicateWithSubpredicate:", v29);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      PLUserSmartAlbumGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v35, "logDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = v31;
        v44 = 2112;
        v45 = v18;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "Only processing the first single query for NOT conjection, query: %@, predicate: %@", buf, 0x16u);

      }
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_30:
  if ((v14 & 1) != 0)
  {
    PLUserSmartAlbumGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_46:

      goto LABEL_47;
    }
    objc_msgSend(v7, "logDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v43 = v26;
    v44 = 2112;
    v45 = v18;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Dropping some unsupported predicate, query: %@, predicate: %@", buf, 0x16u);
LABEL_45:

    goto LABEL_46;
  }
LABEL_47:

LABEL_48:
  PLUserSmartAlbumGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "logDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v43 = v33;
    v44 = 2112;
    v45 = v18;
    _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "Query: %@, predicate: %@", buf, 0x16u);

  }
  return v18;
}

+ (BOOL)_containsKey:(int)a3 inQuery:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "singleQueriesCount"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v6, "singleQueries", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v8)
      {
LABEL_11:
        v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v9 = v8;
      v10 = *(_QWORD *)v16;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "key") == (_DWORD)v4)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
      objc_msgSend(v6, "first");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[PLQueryHandler _containsKey:inQuery:](PLQueryHandler, "_containsKey:inQuery:", v4, v7))
      {
        objc_msgSend(v6, "second");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[PLQueryHandler _containsKey:inQuery:](PLQueryHandler, "_containsKey:inQuery:", v4, v13);

        goto LABEL_16;
      }
    }
    v12 = 1;
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

+ (id)_singleQueryInQuery:(id)a3 passingTest:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  if (v6)
  {
    if (objc_msgSend(v6, "singleQueriesCount"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v6, "singleQueries", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          if ((v7[2](v7, v13) & 1) != 0)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v10)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v14 = v13;

        if (v14)
          goto LABEL_16;
      }
      else
      {
LABEL_11:

      }
    }
    objc_msgSend(v6, "first");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_singleQueryInQuery:passingTest:", v15, v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v6, "second");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_singleQueryInQuery:passingTest:", v16, v7);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }
LABEL_16:

  return v14;
}

+ (BOOL)includesHiddenAssetsKeyInQuery:(id)a3
{
  return +[PLQueryHandler _containsKey:inQuery:](PLQueryHandler, "_containsKey:inQuery:", 2, a3);
}

+ (BOOL)includesHiddenAssetsInQuery:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_singleQueryInQuery:passingTest:", a3, &__block_literal_global_212);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)fixUserQueryDataInQuery:(id)a3
{
  return +[PLQueryHandler _findAndReplaceLatitudeLongitudeKeyInQuery:](PLQueryHandler, "_findAndReplaceLatitudeLongitudeKeyInQuery:", a3);
}

+ (BOOL)_findAndReplaceLatitudeLongitudeKeyInQuery:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "hasFirst"))
  {
    if (!objc_msgSend(v3, "hasSecond"))
    {
      v7 = 0;
      goto LABEL_8;
    }
LABEL_6:
    objc_msgSend(v3, "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PLQueryHandler _findAndReplaceLatitudeLongitudeKeyInQuery:](PLQueryHandler, "_findAndReplaceLatitudeLongitudeKeyInQuery:", v8);

    goto LABEL_8;
  }
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PLQueryHandler _findAndReplaceLatitudeLongitudeKeyInQuery:](PLQueryHandler, "_findAndReplaceLatitudeLongitudeKeyInQuery:", v4);

  v6 = objc_msgSend(v3, "hasSecond");
  v7 = v6 | v5;
  if (v6 && !v5)
    goto LABEL_6;
LABEL_8:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "singleQueries", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "key") == 307 || objc_msgSend(v14, "key") == 308)
        {
          objc_msgSend(v14, "setKey:", 319);
          if (objc_msgSend(v14, "comparator") == 51)
          {
            v15 = 1;
            goto LABEL_19;
          }
          if (objc_msgSend(v14, "comparator") == 50)
          {
            v15 = 2;
LABEL_19:
            objc_msgSend(v14, "setComparator:", v15);
          }
          v7 = 1;
          continue;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v7 & 1;
}

uint64_t __46__PLQueryHandler_includesHiddenAssetsInQuery___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "key") == 2
    && objc_msgSend(v2, "hasComparator")
    && objc_msgSend(v2, "comparator") == 1)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __110__PLQueryHandler__assetsPredicateForPersonPredicate_assetObjectIDs_additionalAssetPredicate_invert_inLibrary___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLPerson entityName](PLPerson, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntityName:", v3);

  objc_msgSend(v4, "setPredicate:", a1[4]);
  objc_msgSend(v4, "setResultType:", 1);
  v37 = 0;
  objc_msgSend(v4, "execute:", &v37);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v37;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v6;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error executing person query: %@", buf, 0xCu);
    }

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("personForFace"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[PLDetectedFace entityName](PLDetectedFace, "entityName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithEntityName:", v13);

    objc_msgSend(v14, "setPredicate:", v11);
    objc_msgSend(v14, "setResultType:", 1);
    v36 = 0;
    objc_msgSend(v14, "execute:", &v36);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v36;
    v17 = *(_QWORD *)(a1[7] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v15;

    if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v16;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error executing detectedFaces query: %@", buf, 0xCu);
      }

    }
  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("detectedFaces"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = a1[5];
    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0CB3528];
      v38[0] = v21;
      v38[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v26;
    }
    v27 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithEntityName:", v28);

    objc_msgSend(v29, "setPredicate:", v22);
    objc_msgSend(v29, "setResultType:", 1);
    v35 = 0;
    objc_msgSend(v29, "execute:", &v35);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v35;
    v32 = *(_QWORD *)(a1[8] + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v30;

    if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    {
      PLBackendGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v31;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Error executing assetObjectIDs query: %@", buf, 0xCu);
      }

    }
  }
}

void __105__PLQueryHandler__predicateForPersonUUIDinMomentForSharedLibraryQuery_inLibrary_changeDetectionCriteria___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  +[PLMoment batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:andAssetPredicate:inManagedObjectContext:error:](PLMoment, "batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:andAssetPredicate:inManagedObjectContext:error:", v2, 0, v3, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;

  if (v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithEntityName:", v7);

    v9 = (void *)MEMORY[0x1E0CB3528];
    +[PLPhotosHighlight predicateForAllTripHighlights](PLPhotosHighlight, "predicateForAllTripHighlights");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K in %@"), CFSTR("dayGroupAssets"), *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v8, "setPredicate:", v13);

    -[NSObject setResultType:](v8, "setResultType:", 1);
    v30 = 0;
    -[NSObject execute:](v8, "execute:", &v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v30;
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v14;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Fetched trip highlights with people: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v15;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Error fetching trip highlights for day group assets: %@", buf, 0xCu);
      }
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }

    v18 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K in %@ OR %K in %@"), CFSTR("moment"), v19, CFSTR("dayGroupHighlightBeingAssets"), v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithEntityName:", v22);

    objc_msgSend(v23, "setPredicate:", v20);
    objc_msgSend(v23, "setResultType:", 1);
    v29 = 0;
    objc_msgSend(v23, "execute:", &v29);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v29;
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v24;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      PLBackendGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v25;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Error executing allAssetsObjectIDs query: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error executing batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs: %@", buf, 0xCu);
    }
  }

}

void __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2(uint64_t a1)
{
  PLSearchProcessor *v2;
  unsigned int v3;
  uint64_t v4;
  PSIQueryToken *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PLSearchProcessor initWithDatabase:]([PLSearchProcessor alloc], "initWithDatabase:", *(_QWORD *)(a1 + 32));
  v3 = *(_DWORD *)(a1 + 64) - 22;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = qword_199B9B6D0[v3];
  v5 = -[PSIQueryToken initWithText:userCategory:matchType:]([PSIQueryToken alloc], "initWithText:userCategory:matchType:", *(_QWORD *)(a1 + 40), 0, v4);
  v6 = *(void **)(a1 + 32);
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "newQueryWithSearchText:queryTokens:useWildcardSearchText:libraryScope:", 0, v7, 1, 0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_3;
  v11[3] = &unk_1E3668A78;
  v10 = *(_OWORD *)(a1 + 48);
  v9 = (id)v10;
  v12 = v10;
  -[PLSearchProcessor performQuery:withResultsHandler:](v2, "performQuery:withResultsHandler:", v8, v11);

}

void __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_137(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assetsdClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryInternalClient");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "waitForSearchIndexExistenceWithError:", 0);

}

uint64_t __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(a5, "assetUUIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
