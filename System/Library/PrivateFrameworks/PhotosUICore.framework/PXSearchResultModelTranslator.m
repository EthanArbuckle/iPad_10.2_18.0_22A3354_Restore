@implementation PXSearchResultModelTranslator

- (PXSearchResultModelTranslator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultModelTranslator.m"), 28, CFSTR("%s is not available as initializer"), "-[PXSearchResultModelTranslator init]");

  abort();
}

+ (id)assetAggregationSearchResultForPLAssetSearchResult:(id)a3
{
  id v3;
  PXSearchResultAssetAggregation *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  PXSearchResultAssetAggregation *v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = +[PXSearchResultModelTranslator _assetAggregationTypeForPLAssetSearchResult:](PXSearchResultModelTranslator, "_assetAggregationTypeForPLAssetSearchResult:", v3);
  if (v4)
  {
    objc_msgSend(v3, "assetUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v3, "contentStrings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (__CFString *)v7;
      else
        v9 = &stru_1E5149688;
      v10 = v9;

      if (v4 == (PXSearchResultAssetAggregation *)11)
      {
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SearchResultsSubtitle_InSharedLibrary"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "owningContentString");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (__CFString *)v13;
        else
          v15 = &stru_1E5149688;
        v11 = v15;

      }
      v16 = [PXSearchResultAssetAggregation alloc];
      objc_msgSend(v3, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[PXSearchResultAssetAggregation initWithTitle:subtitle:assetUUIDs:subtype:identifier:](v16, "initWithTitle:subtitle:assetUUIDs:subtype:identifier:", v10, v11, v5, v4, v17);

    }
    else
    {
      if (!objc_msgSend(v5, "count"))
      {
        PXAssertGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v19 = 138412290;
          v20 = v3;
          _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "PXSearchResultModelTranslator attempting to convert PLAssetSearchResult to PXSearchResultAssetAggregation with empty UUID array: %@", (uint8_t *)&v19, 0xCu);
        }

      }
      v4 = 0;
    }

  }
  return v4;
}

+ (unint64_t)_assetAggregationTypeForPLAssetSearchResult:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;

  objc_msgSend(a3, "categoryMask");
  PLSearchIndexCategoriesForCategoryMask();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstIndex");
  v5 = 9;
  if (v4 > 1699)
  {
    if (v4 > 1999)
    {
      if (v4 <= 2499)
      {
        if (v4 <= 2299)
        {
          v6 = 6;
          v7 = 14;
          if (v4 != 2200)
            v7 = 9;
          if (v4 != 2100)
            v6 = v7;
          if (v4 == 2000)
            v5 = 5;
          else
            v5 = v6;
          goto LABEL_44;
        }
        if ((unint64_t)(v4 - 2400) < 2)
        {
          v5 = 12;
          goto LABEL_44;
        }
        if (v4 != 2300)
          goto LABEL_44;
        goto LABEL_43;
      }
      if (v4 > 2699)
      {
        if (v4 != 2700 && v4 != 2800)
          goto LABEL_44;
        goto LABEL_43;
      }
      if ((unint64_t)(v4 - 2500) < 2)
        goto LABEL_43;
      v9 = v4 - 2600;
    }
    else
    {
      if ((unint64_t)(v4 - 1900) < 0x14)
      {
        v5 = 8;
        goto LABEL_44;
      }
      if ((unint64_t)(v4 - 1800) < 4)
        goto LABEL_43;
      v9 = v4 - 1700;
    }
LABEL_42:
    if (v9 >= 2)
      goto LABEL_44;
    goto LABEL_43;
  }
  if (v4 > 1299)
  {
    if (v4 > 1499)
    {
      if ((unint64_t)(v4 - 1500) <= 0x29 && ((1 << (v4 + 36)) & 0x300C0300C03) != 0)
      {
        v5 = 10;
        goto LABEL_44;
      }
      if ((unint64_t)(v4 - 1600) > 0xB || ((1 << (v4 - 64)) & 0xC03) == 0)
        goto LABEL_44;
LABEL_43:
      v5 = 0;
      goto LABEL_44;
    }
    v8 = v4 - 20;
    if ((unint64_t)(v4 - 1300) <= 0x1F)
    {
      if (((1 << v8) & 0xC0000403) != 0)
        goto LABEL_43;
      if (((1 << v8) & 0x300000) != 0)
      {
        v5 = 11;
        goto LABEL_44;
      }
    }
    v9 = v4 - 1400;
    goto LABEL_42;
  }
  if (v4 > 1199)
  {
    switch(v4)
    {
      case 1200:
        v5 = 7;
        break;
      case 1201:
        v5 = 13;
        break;
      case 1202:
        v5 = 2;
        break;
      case 1203:
      case 1204:
        v5 = 3;
        break;
      case 1205:
        v5 = 4;
        break;
      default:
        goto LABEL_44;
    }
    goto LABEL_44;
  }
  if ((unint64_t)(v4 - 1100) < 6)
  {
    v5 = 1;
    goto LABEL_44;
  }
  if ((unint64_t)(v4 - 1003) < 4 || !v4)
    goto LABEL_43;
LABEL_44:

  return v5;
}

+ (id)collectionSearchResultForPLCollectionSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PXSearchResultCollection *v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v3, "title");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = &stru_1E5149688;
      if (v6)
        v8 = (__CFString *)v6;
      v9 = v8;

      objc_msgSend(v3, "subtitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[PXSearchResultModelTranslator _collectionTypeForPLCollectionSearchResult:](PXSearchResultModelTranslator, "_collectionTypeForPLCollectionSearchResult:", v3);
      objc_msgSend(v3, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSearchResultModelTranslator _dateFromPSIDate:](PXSearchResultModelTranslator, "_dateFromPSIDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSearchResultModelTranslator _dateFromPSIDate:](PXSearchResultModelTranslator, "_dateFromPSIDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v3, "assetCount");
      objc_msgSend(v3, "keyAssetUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = -[PXSearchResultCollection initWithTitle:subtitle:assetCount:collectionUUID:thumbnailAssetUUID:startDate:endDate:subtype:]([PXSearchResultCollection alloc], "initWithTitle:subtitle:assetCount:collectionUUID:thumbnailAssetUUID:startDate:endDate:subtype:", v9, v10, v16, v5, v17, v13, v15, v11);
      }
      else
      {
        PXAssertGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v3;
          _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "PXSearchResultModelTranslator found nil keyAsset in PLCollectionSearchResult object: %@", buf, 0xCu);
        }

        v18 = 0;
      }

LABEL_19:
      goto LABEL_20;
    }
  }
  else
  {
    PXAssertGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "PXSearchResultModelTranslator attempting to convert PLCollectionSearchResult to PXSearchResultCollection with nil UUID: %@", buf, 0xCu);
    }

  }
  if (!objc_msgSend(v5, "length"))
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "PXSearchResultModelTranslator attempting to convert PLCollectionSearchResult to PXSearchResultCollection with empty UUID: %@", buf, 0xCu);
    }
    v18 = 0;
    goto LABEL_19;
  }
  v18 = 0;
LABEL_20:

  return v18;
}

+ (unint64_t)_collectionTypeForPLCollectionSearchResult:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "collectionType");
  if ((unint64_t)(v3 - 2) > 2)
    return 0;
  else
    return qword_1A7C0C080[v3 - 2];
}

+ (id)_dateFromPSIDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99D48];
    v4 = a3;
    objc_msgSend(v3, "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

    objc_msgSend(v6, "setHour:", 12);
    objc_msgSend(v6, "setEra:", objc_msgSend(v4, "era"));
    objc_msgSend(v6, "setYear:", objc_msgSend(v4, "year"));
    objc_msgSend(v6, "setMonth:", objc_msgSend(v4, "month"));
    v8 = objc_msgSend(v4, "day");

    objc_msgSend(v6, "setDay:", v8);
    objc_msgSend(v5, "dateFromComponents:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)personSearchResultForPLAssetSearchResult:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  PXSearchResultPersonOrPet *v17;
  NSObject *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "contentStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E5149688;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v3, "lookupIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v3, "assetCount");
  v12 = objc_msgSend(v3, "categoryMask");
  v13 = objc_msgSend(v3, "categoryMask");
  if (v13 == 0x10000000000000 || v12 == 128)
    v15 = 3;
  else
    v15 = 4;
  if (v10 && (v16 = v13, objc_msgSend(v10, "length")))
  {
    v17 = -[PXSearchResultPersonOrPet initWithTitle:assetCount:personUUID:identifier:type:subtype:]([PXSearchResultPersonOrPet alloc], "initWithTitle:assetCount:personUUID:identifier:type:subtype:", v8, v11, v10, v10, v15, v16 == 0x10000000000000);
  }
  else
  {
    if (!objc_msgSend(v10, "length"))
    {
      PXAssertGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = v3;
        _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "PXSearchResultModelTranslator attempted to convert PLAssetSearchResult to PXSearchResultPersonOrPet for person result with invalid UUID: %@", (uint8_t *)&v20, 0xCu);
      }

    }
    v17 = 0;
  }

  return v17;
}

+ (id)assetSearchResultsForPLTopAssetsSearchResult:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PXSearchResultAsset *v12;
  PXSearchResultAsset *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "assetUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v12 = [PXSearchResultAsset alloc];
          v13 = -[PXSearchResultAsset initWithAssetUUID:](v12, "initWithAssetUUID:", v11, (_QWORD)v16);
          -[NSObject addObject:](v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v14 = -[NSObject copy](v5, "copy");
  }
  else
  {
    if (objc_msgSend(v4, "count"))
    {
      v14 = 0;
      goto LABEL_13;
    }
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "PXSearchResultModelTranslator attempting to convert PLTopAssetsSearchResult to PXSearchResultAsset with empty UUID array: %@", buf, 0xCu);
    }
    v14 = 0;
  }

LABEL_13:
  return v14;
}

+ (id)searchResultsForCollectionResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        +[PXSearchResultModelTranslator collectionSearchResultForPLCollectionSearchResult:](PXSearchResultModelTranslator, "collectionSearchResultForPLCollectionSearchResult:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)searchResultsForAssetResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isSinglePersonOrPetResult", (_QWORD)v14))
          +[PXSearchResultModelTranslator personSearchResultForPLAssetSearchResult:](PXSearchResultModelTranslator, "personSearchResultForPLAssetSearchResult:", v10);
        else
          +[PXSearchResultModelTranslator assetAggregationSearchResultForPLAssetSearchResult:](PXSearchResultModelTranslator, "assetAggregationSearchResultForPLAssetSearchResult:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)searchResultsForTopAssetsResult:(id)a3
{
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  +[PXSearchResultModelTranslator assetSearchResultsForPLTopAssetsSearchResult:](PXSearchResultModelTranslator, "assetSearchResultsForPLTopAssetsSearchResult:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
