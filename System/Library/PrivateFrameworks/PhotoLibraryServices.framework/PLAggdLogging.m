@implementation PLAggdLogging

+ (void)performMomentsStatisticsLogging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE buf[22];
  __int16 v53;
  id v54;
  _QWORD v55[4];
  _QWORD v56[4];
  _BYTE v57[128];
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLMoment entityName](PLMoment, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setResultType:", 2);
  objc_msgSend(v7, "setFetchBatchSize:", 100);
  objc_msgSend(v7, "setPropertiesToFetch:", &unk_1E3763E18);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cachedCount"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v9);

  v51 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v51);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v51;
  if (v11 || !v10)
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLMoment entityName](PLMoment, "entityName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v25;
      v53 = 2112;
      v54 = v11;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "%@ failed to fetch counts for %@ %@", buf, 0x20u);

    }
  }
  else
  {
    v44 = v7;
    v45 = v4;
    v46 = objc_msgSend(v10, "count");
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v43 = v10;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = 0;
      v17 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v48 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("cachedCount"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "unsignedIntegerValue");

          v15 += v22;
          if (v22 == 1)
            ++v16;
          objc_autoreleasePoolPop(v20);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }

    v26 = v46;
    v27 = v15 / v46;
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("cachedCount"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      v11 = 0;
      if (objc_msgSend(v28, "count") == 1)
      {
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "integerValue");
        v10 = v43;
      }
      else
      {
        v31 = v27;
        objc_msgSend(v28, "sortedArrayUsingSelector:", sel_compare_);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v28, "count");
        v33 = (unint64_t)objc_msgSend(v29, "count") >> 1;
        if ((v32 & 1) != 0)
        {
          objc_msgSend(v29, "objectAtIndex:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v34, "integerValue");
        }
        else
        {
          objc_msgSend(v29, "objectAtIndex:", v33 - 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v34;
          objc_msgSend(v29, "objectAtIndex:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[8] = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "valueForKeyPath:", CFSTR("@avg.self"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v37, "integerValue");

          v26 = v46;
        }
        v10 = v43;

        v27 = v31;
      }

    }
    else
    {
      v30 = 0;
      v10 = v43;
      v11 = 0;
    }

    v38 = *MEMORY[0x1E0D73B08];
    v55[0] = *MEMORY[0x1E0D73B20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
    v23 = objc_claimAutoreleasedReturnValue();
    v56[0] = v23;
    v55[1] = *MEMORY[0x1E0D73B28];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v39;
    v55[2] = *MEMORY[0x1E0D73B10];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v40;
    v55[3] = *MEMORY[0x1E0D73B18];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x19AEC0B7C](v38, v42);

    v7 = v44;
    v4 = v45;
  }

}

+ (void)performSlideshowProjectStatisticsLogging:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  const __CFString *v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLProjectAlbum entityName](PLProjectAlbum, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("projectDocumentType"), CFSTR("com.apple.photos.projects.slideshow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v56[0] = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v10);

  v55 = CFSTR("assets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v11);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v49 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &v49);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v49;
  v14 = v13;
  if (v12)
  {
    v39 = v13;
    v40 = a1;
    v41 = v8;
    v42 = v5;
    v15 = objc_msgSend(v12, "count");
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    v38 = v15;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v23, "creationDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v26 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v24, "timeIntervalSinceNow");
            objc_msgSend(v26, "numberWithDouble:", -v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v16, "addObject:", v28);

          }
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "assets");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v31);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v20);
    }

    v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D73CA0]);

    v34 = MEMORY[0x1E0C809B0];
    v35 = *MEMORY[0x1E0D73CB0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke;
    v44[3] = &__block_descriptor_40_e28___NSString_16__0__NSNumber_8l;
    v44[4] = v40;
    objc_msgSend(v40, "_addDistributionStatisticsOfValues:withPrefix:toDictionary:formatter:", v16, v35, v32, v44);
    v36 = *MEMORY[0x1E0D73C98];
    v43[0] = v34;
    v43[1] = 3221225472;
    v43[2] = __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke_2;
    v43[3] = &__block_descriptor_40_e28___NSString_16__0__NSNumber_8l;
    v43[4] = v40;
    objc_msgSend(v40, "_addDistributionStatisticsOfValues:withPrefix:toDictionary:formatter:", v17, v36, v32, v43);
    MEMORY[0x19AEC0B7C](*MEMORY[0x1E0D73CA8], v32);

    v8 = v41;
    v5 = v42;
    v14 = v39;
  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v37;
      v52 = 2112;
      v53 = v14;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "%@ failed to slideshow projects: %@", buf, 0x16u);

    }
  }

}

+ (void)_addDistributionStatisticsOfValues:(id)a3 withPrefix:(id)a4 toDictionary:(id)a5 formatter:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *);
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
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t i;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("Min"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v16);

    objc_msgSend(v13, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("Max"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);

    objc_msgSend(v13, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v13, "count") >> 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("Median"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v22);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = v13;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      v27 = 0.0;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "doubleValue", (_QWORD)v33);
          v27 = v27 + v29;
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v25);
    }
    else
    {
      v27 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27 / (double)(unint64_t)objc_msgSend(v23, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("Mean"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, v32);

  }
}

+ (id)_analyticsDescriptionForMediaAge:(double)a3
{
  double v3;
  double v4;
  __CFString *v5;
  double v7;
  id v8;
  uint64_t v9;

  v3 = a3 / 60.0 / 60.0 / 24.0;
  v4 = v3 / 30.0;
  if (v3 / 30.0 < 1.0)
  {
    v5 = CFSTR("lastMonth");
    return v5;
  }
  if (v4 < 3.0)
    return CFSTR("last3Months");
  if (v4 >= 6.0)
  {
    v7 = v3 / 365.0;
    if (v3 / 365.0 >= 1.0)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      v9 = (uint64_t)v7;
      if (v7 >= 10.0)
        v9 = 10 * (v9 / 10);
      v5 = (__CFString *)objc_msgSend(v8, "initWithFormat:", CFSTR("%liYears"), v9);
    }
    else
    {
      v5 = CFSTR("lastYear");
    }
    return v5;
  }
  return CFSTR("last6Months");
}

+ (id)_analyticsDescriptionForAssetCount:(int64_t)a3
{
  if (a3 < 1)
    return CFSTR("0");
  if ((unint64_t)a3 < 6)
    return CFSTR("1-5");
  if ((unint64_t)a3 < 0xB)
    return CFSTR("6-10");
  if ((unint64_t)a3 < 0x15)
    return CFSTR("11-20");
  if ((unint64_t)a3 < 0x1F)
    return CFSTR("21-30");
  if ((unint64_t)a3 < 0x29)
    return CFSTR("31-40");
  if ((unint64_t)a3 < 0x33)
    return CFSTR("41-50");
  if ((unint64_t)a3 < 0x65)
    return CFSTR("51-100");
  if ((unint64_t)a3 < 0xC9)
    return CFSTR("101-200");
  if ((unint64_t)a3 >= 0x1F5)
    return CFSTR("501+");
  return CFSTR("201-500");
}

+ (void)_addPrefix:(id)a3 toKeysInDictionary:(id)a4 inPrefixedDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PLAggdLogging__addPrefix_toKeysInDictionary_inPrefixedDictionary___block_invoke;
  v11[3] = &unk_1E3677AF0;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v11);

}

+ (void)_addLibrarySummaryDataToCollectionIfPresent:(id)a3 fromCPLEventData:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v8);

  }
}

+ (void)configureEnumeratorForLibrarySizeLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 dataForCK:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAggdLogging.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator"));

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__PLAggdLogging_configureEnumeratorForLibrarySizeLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke;
  v16[3] = &unk_1E3670350;
  v17 = v12;
  v18 = v11;
  v13 = v11;
  v14 = v12;
  +[PLPhotoLibrary configureEnumeratorForLibrarySizeInfo:completion:](PLPhotoLibrary, "configureEnumeratorForLibrarySizeInfo:completion:", v10, v16);

}

+ (void)configureEnumeratorForHyperionLocalResourcesLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 dataForCK:(id)a6
{
  id v11;
  id v12;
  id v13;
  PLAnalyticsResourceCounters *v14;
  uint64_t v15;
  PLAnalyticsResourceCounters *v16;
  id v17;
  id v18;
  id v19;
  PLAnalyticsResourceCounters *v20;
  void *v21;
  _QWORD v22[4];
  PLAnalyticsResourceCounters *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  _QWORD v29[4];
  PLAnalyticsResourceCounters *v30;
  _QWORD v31[4];
  PLAnalyticsResourceCounters *v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAggdLogging.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator"));

  }
  v14 = objc_alloc_init(PLAnalyticsResourceCounters);
  v15 = MEMORY[0x1E0C809B0];
  if (a4 || MEMORY[0x19AEC0720]())
  {
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke;
    v31[3] = &unk_1E3670378;
    v16 = v14;
    v32 = v16;
    v33 = &unk_1E3763E30;
    v34 = &unk_1E3763E48;
    v35 = &unk_1E3763E78;
    v36 = &unk_1E3763E60;
    objc_msgSend(v11, "addAssetVisitor:", v31);
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_2;
    v29[3] = &unk_1E36703A0;
    v30 = v16;
    objc_msgSend(v11, "addResourceVisitor:", v29);

  }
  objc_msgSend(v11, "sourceContext");
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_3;
  v22[3] = &unk_1E36703C8;
  v23 = v14;
  v24 = v13;
  v28 = a4;
  v25 = v12;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = a1;
  v17 = v26;
  v18 = v12;
  v19 = v13;
  v20 = v14;
  objc_msgSend(v11, "addEndOfListVisitor:", v22);

}

+ (void)configureEnumeratorForLibrarySummaryForLibraryEnumerator:(id)a3 withSyndicationLibraryEnumerator:(id)a4 cloudPhotoLibraryEnabled:(BOOL)a5 dataForCA:(id)a6 libraryServicesManager:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;

  v9 = a5;
  v12 = a4;
  v11 = a6;
  +[PLAggdLogging _configureEnumeratorForLibrarySummaryLogging:cloudPhotoLibraryEnabled:dataForCA:libraryServicesManager:](PLAggdLogging, "_configureEnumeratorForLibrarySummaryLogging:cloudPhotoLibraryEnabled:dataForCA:libraryServicesManager:", a3, v9, v11, a7);
  if (v12)
    +[PLAggdLogging _configureEnumeratorForSyndicationLibrarySummaryLogging:dataForCA:](PLAggdLogging, "_configureEnumeratorForSyndicationLibrarySummaryLogging:dataForCA:", v12, v11);

}

+ (void)_configureEnumeratorForSyndicationLibrarySummaryLogging:(id)a3 dataForCA:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PLAnalyticsLibraryCounters *v10;
  PLAnalyticsSyndicationLibraryCounters *v11;
  void *v12;
  uint64_t v13;
  PLAnalyticsLibraryCounters *v14;
  PLAnalyticsSyndicationLibraryCounters *v15;
  id v16;
  PLAnalyticsSyndicationLibraryCounters *v17;
  PLAnalyticsLibraryCounters *v18;
  id v19;
  PLAnalyticsSyndicationLibraryCounters *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  PLAnalyticsSyndicationLibraryCounters *v24;
  id v25;
  PLAnalyticsLibraryCounters *v26;
  _QWORD v27[4];
  PLAnalyticsSyndicationLibraryCounters *v28;
  _QWORD v29[4];
  PLAnalyticsLibraryCounters *v30;
  id v31;
  PLAnalyticsSyndicationLibraryCounters *v32;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAggdLogging.m"), 720, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAggdLogging.m"), 721, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataForCA"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = objc_alloc_init(PLAnalyticsLibraryCounters);
  v11 = objc_alloc_init(PLAnalyticsSyndicationLibraryCounters);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -7776000.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke;
  v29[3] = &unk_1E36703F8;
  v14 = v10;
  v30 = v14;
  v31 = v12;
  v15 = v11;
  v32 = v15;
  v16 = v12;
  objc_msgSend(v7, "addAssetVisitor:", v29);
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_2;
  v27[3] = &unk_1E3670420;
  v17 = v15;
  v28 = v17;
  objc_msgSend(v7, "addConversationVisitor:", v27);
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_3;
  v23[3] = &unk_1E3677530;
  v24 = v17;
  v25 = v9;
  v26 = v14;
  v18 = v14;
  v19 = v9;
  v20 = v17;
  objc_msgSend(v7, "addEndOfListVisitor:", v23);

}

+ (void)_configureEnumeratorForLibrarySummaryLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4 dataForCA:(id)a5 libraryServicesManager:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PLAnalyticsLibraryCounters *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PLAnalyticsLibraryCounters *v19;
  id v20;
  PLAnalyticsLibraryCounters *v21;
  PLAnalyticsLibraryCounters *v22;
  PLAnalyticsLibraryCounters *v23;
  PLAnalyticsLibraryCounters *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  PLAnalyticsLibraryCounters *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v36;
  _QWORD v37[4];
  id v38;
  PLAnalyticsLibraryCounters *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;
  _QWORD v46[4];
  PLAnalyticsLibraryCounters *v47;
  _QWORD v48[4];
  PLAnalyticsLibraryCounters *v49;
  _QWORD v50[4];
  PLAnalyticsLibraryCounters *v51;
  _QWORD v52[4];
  PLAnalyticsLibraryCounters *v53;
  _QWORD v54[4];
  PLAnalyticsLibraryCounters *v55;
  id v56;
  id v57;

  v10 = a3;
  v11 = a5;
  v36 = a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAggdLogging.m"), 811, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAggdLogging.m"), 812, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataForCA"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v10, "sourceContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(PLAnalyticsLibraryCounters);
  v33 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -7776000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke;
  v54[3] = &unk_1E36703F8;
  v19 = v15;
  v55 = v19;
  v56 = v16;
  v57 = v17;
  v34 = v17;
  v20 = v16;
  objc_msgSend(v10, "addAssetVisitor:", v54);
  v52[0] = v18;
  v52[1] = 3221225472;
  v52[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_2;
  v52[3] = &unk_1E3670448;
  v21 = v19;
  v53 = v21;
  objc_msgSend(v10, "addFaceVisitor:", v52);
  v50[0] = v18;
  v50[1] = 3221225472;
  v50[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_3;
  v50[3] = &unk_1E3670470;
  v22 = v21;
  v51 = v22;
  objc_msgSend(v10, "addResourceVisitor:", v50);
  v48[0] = v18;
  v48[1] = 3221225472;
  v48[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_4;
  v48[3] = &unk_1E3670498;
  v23 = v22;
  v49 = v23;
  objc_msgSend(v10, "addAlbumVisitor:", v48);
  v46[0] = v18;
  v46[1] = 3221225472;
  v46[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_5;
  v46[3] = &unk_1E36704C0;
  v24 = v23;
  v47 = v24;
  objc_msgSend(v10, "addPersonVisitor:", v46);
  v37[0] = v18;
  v37[1] = 3221225472;
  v37[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_6;
  v37[3] = &unk_1E36704E8;
  v45 = a4;
  v38 = v12;
  v39 = v24;
  v40 = v14;
  v41 = v36;
  v42 = v11;
  v43 = v13;
  v44 = v33;
  v25 = v13;
  v26 = v11;
  v27 = v36;
  v28 = v14;
  v29 = v24;
  v30 = v12;
  objc_msgSend(v10, "addEndOfListVisitor:", v37);

}

+ (void)performCMMSummaryLogging:(id)a3 cloudPhotoLibraryEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  unint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  _BOOL8 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  _BOOL8 v52;
  unint64_t v53;
  uint64_t v54;
  id obj;
  id obja;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  _QWORD v68[8];
  _QWORD v69[8];
  _BYTE v70[128];
  uint64_t v71;

  v4 = a4;
  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLMomentShare entityName](PLMomentShare, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResultType:", 2);
  objc_msgSend(v9, "setPropertiesToFetch:", &unk_1E3763EA8);
  v61 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &v61);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v61;
  if (v11 || !v10)
  {
    PLBackendGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLMomentShare entityName](PLMomentShare, "entityName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v63 = v35;
      v64 = 2112;
      v65 = v36;
      v66 = 2112;
      v67 = v11;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "%@ failed to fetch counts for %@ %@", buf, 0x20u);

    }
  }
  else
  {
    v48 = v10;
    v49 = v9;
    v50 = v6;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v53 = 0;
      v54 = 0;
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)v58;
      v52 = !v4;
      v51 = v4;
      obj = v12;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          v20 = v16;
          if (*(_QWORD *)v58 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("assetCount"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedIntegerValue");

          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("status"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedIntegerValue");

          if (v26 == 1)
          {
            ++v17;
            v15 += v24;
            v16 = v20;
          }
          else
          {
            v16 = v20;
            if ((v26 & 0xFFFE) == 2)
            {
              v16 = v20 + v52;
              v54 += v51;
              v53 += v24;
            }
          }
          objc_autoreleasePoolPop(v22);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v14);

      v27 = v17 != 0;
      v28 = v54 != 0;
      v29 = v16 != 0;
      v30 = v15 / v17;
      v31 = v15 == 0;
      v32 = v54;
      if (v31)
        v30 = 0;
      obja = (id)v30;
      if (v53)
        v33 = v53 / (v54 + v16);
      else
        v33 = 0;
    }
    else
    {

      obja = 0;
      v16 = 0;
      v32 = 0;
      v17 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v33 = 0;
    }
    v37 = v29;
    v38 = v28;
    v39 = *MEMORY[0x1E0D735E8];
    v68[0] = *MEMORY[0x1E0D73610];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
    v34 = objc_claimAutoreleasedReturnValue();
    v69[0] = v34;
    v68[1] = *MEMORY[0x1E0D73600];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v40;
    v68[2] = *MEMORY[0x1E0D73608];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v41;
    v68[3] = *MEMORY[0x1E0D73628];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v42;
    v68[4] = *MEMORY[0x1E0D73618];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v43;
    v68[5] = *MEMORY[0x1E0D73620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v69[5] = v44;
    v68[6] = *MEMORY[0x1E0D735F8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", obja);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v69[6] = v45;
    v68[7] = *MEMORY[0x1E0D735F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v69[7] = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x19AEC0B7C](v39, v47);

    v9 = v49;
    v6 = v50;
    v11 = 0;
    v10 = v48;
  }

}

+ (void)performLibraryStatisticsLoggingForLibrary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke;
  v26[3] = &unk_1E3670510;
  v28 = a1;
  v9 = v6;
  v27 = v9;
  v10 = MEMORY[0x19AEC174C](v26);
  v11 = (void *)v10;
  if (v7)
  {
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_2;
    v20[3] = &unk_1E3675C58;
    v12 = (id *)&v22;
    v22 = v10;
    v13 = &v21;
    v14 = v9;
    v21 = v14;
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_3;
    v18[3] = &unk_1E3676CD8;
    v19 = v7;
    v15 = v11;
    objc_msgSend(v14, "performBlock:completionHandler:", v20, v18);

  }
  else
  {
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_255;
    v23[3] = &unk_1E3675C58;
    v12 = (id *)&v25;
    v25 = v10;
    v13 = &v24;
    v16 = v9;
    v24 = v16;
    v17 = v11;
    objc_msgSend(v16, "performBlock:", v23);
  }

}

+ (void)_addPersistentHistoryStatsToLibrarySummaryEvent:(id)a3 withLibraryPathManager:(id)a4
{
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
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_fetchPersistentHistoryStatsWithLibraryPathManager:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v16[0] = *MEMORY[0x1E0D739C8];
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "persistentHistoryPageCountPercent");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v16[1] = *MEMORY[0x1E0D739C0];
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "persistentHistoryPageCountPercentOfPayload");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v16[2] = *MEMORY[0x1E0D739D0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "transactionCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v13;
    v16[3] = *MEMORY[0x1E0D739B8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "daysSinceEarliestTransaction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addEntriesFromDictionary:", v15);
  }

}

+ (id)_fetchPersistentHistoryStatsWithLibraryPathManager:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photosDatabasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Gathering persistent history statistics from databasePath: %@", (uint8_t *)&v13, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D732C0];
  objc_msgSend(v3, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "openDatabaseAtPath:capabilities:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[PLPersistentHistoryStats statsFromDatabase:](PLPersistentHistoryStats, "statsFromDatabase:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to retrieve history stats from database at path: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    objc_msgSend(v8, "close");
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to open database at path: %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

+ (void)_addFileSystemStatsToLibrarySummaryEvent:(id)a3 withLibraryPathManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D731F8];
  objc_msgSend(a4, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "capabilitiesWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12[0] = *MEMORY[0x1E0D738F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isInternalVolume"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v12[1] = *MEMORY[0x1E0D738F8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isNetworkVolume"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addEntriesFromDictionary:", v11);
  }

}

+ (void)_addOrphanedSceneClassificationsCountToLibrarySummaryEvent:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__PLAggdLogging__addOrphanedSceneClassificationsCountToLibrarySummaryEvent_withContext___block_invoke;
  v9[3] = &unk_1E3677C18;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

void __88__PLAggdLogging__addOrphanedSceneClassificationsCountToLibrarySummaryEvent_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  PLGlobalValues *v3;

  v3 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", *(_QWORD *)(a1 + 32));
  -[PLGlobalValues orphanedSceneClassificationsCount](v3, "orphanedSceneClassificationsCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D739A0]);

}

void __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(a2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Library statistics logging: starting...", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "performMomentsStatisticsLogging:", v3);
  objc_msgSend(*(id *)(a1 + 40), "performSlideshowProjectStatisticsLogging:", v3);
  objc_msgSend(*(id *)(a1 + 40), "performCMMSummaryLogging:cloudPhotoLibraryEnabled:", v3, objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled"));

}

uint64_t __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __77__PLAggdLogging_performLibraryStatisticsLoggingForLibrary_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  int v20;
  void *v21;
  char v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  int v27;
  unint64_t *v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  double v38;
  unint64_t *v40;
  unint64_t v41;
  void *v43;
  _BOOL4 IsGreaterThanOrEqual;
  void *v45;
  _BOOL4 v46;
  unint64_t *v47;
  unint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  unint64_t *v55;
  unint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t *v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  unint64_t *v69;
  unint64_t v70;
  void *v71;
  int v72;
  unint64_t *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  unint64_t *v80;
  unint64_t v81;
  void *v82;
  uint64_t v83;
  unint64_t *v84;
  unint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  unint64_t *v90;
  unint64_t v91;
  unint64_t *v92;
  unint64_t v93;
  unint64_t *v94;
  unint64_t v95;
  int v96;
  uint64_t v97;
  unint64_t *v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t *v101;
  unint64_t v102;
  unint64_t *v103;
  unint64_t v104;
  void *v105;
  unint64_t *v106;
  unint64_t v107;
  __int16 v108;
  unint64_t *v109;
  unint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  unint64_t *v117;
  unint64_t v118;
  int v119;
  unint64_t *v120;
  unint64_t v121;
  unint64_t *v122;
  unint64_t v123;
  unint64_t *v124;
  unint64_t v125;
  unint64_t *v126;
  unint64_t v127;
  unint64_t *v128;
  unint64_t v129;
  id v130;

  v3 = a2;
  v4 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  v130 = v3;
  if (objc_msgSend(v3, "isInTrash"))
  {
    v6 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 24);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
  }
  if (objc_msgSend(v130, "isPhoto"))
  {
    v8 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 32);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
    if (objc_msgSend(v130, "isPhotoIris"))
    {
      v10 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 40);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
    }
    v12 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v130, "uniformTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "typeWithIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v130, "isJPEG") & 1) != 0)
    {
      v15 = 72;
    }
    else if ((objc_msgSend(v130, "isRAW") & 1) != 0)
    {
      v15 = 80;
    }
    else if ((objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC510]) & 1) != 0)
    {
      v15 = 88;
    }
    else
    {
      v27 = objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC508]);
      v15 = 64;
      if (v27)
        v15 = 88;
    }
    v28 = (unint64_t *)(*(_QWORD *)(a1 + 32) + v15);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 + 1, v28));
    if (objc_msgSend(v130, "hasAdjustments"))
    {
      v30 = objc_msgSend(v130, "depthType");
      v31 = 152;
      if (v30 == 1)
        v31 = 144;
      v32 = (unint64_t *)(*(_QWORD *)(a1 + 32) + v31);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 + 1, v32));
    }

    v21 = v130;
  }
  else
  {
    v16 = objc_msgSend(v130, "isVideo");
    v17 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      v18 = (unint64_t *)(v17 + 48);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 + 1, v18));
      v20 = objc_msgSend(v130, "hasAdjustments");
      v21 = v130;
      if (v20)
      {
        v22 = objc_msgSend(v130, "isDefaultAdjustedSlomo");
        v21 = v130;
        if ((v22 & 1) == 0)
        {
          v23 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 152);
          do
            v24 = __ldaxr(v23);
          while (__stlxr(v24 + 1, v23));
        }
      }
    }
    else
    {
      v25 = (unint64_t *)(v17 + 56);
      v21 = v130;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 + 1, v25));
    }
  }
  if (objc_msgSend(v21, "isFavorite"))
  {
    v34 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 120);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 + 1, v34));
  }
  if (objc_msgSend(v130, "kindSubtype") == 10)
  {
    v36 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 136);
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 + 1, v36));
  }
  objc_msgSend(v130, "curationScore");
  if (v38 != 0.0 && v38 < 0.5)
  {
    v40 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 128);
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 + 1, v40));
  }
  if (!atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 96)))
  {
    objc_msgSend(v130, "addedDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    IsGreaterThanOrEqual = PLDateIsGreaterThanOrEqual(v43, *(void **)(a1 + 40));

    if (IsGreaterThanOrEqual)
      atomic_store(1uLL, (unint64_t *)(*(_QWORD *)(a1 + 32) + 96));
  }
  objc_msgSend(v130, "addedDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = PLDateIsGreaterThanOrEqual(v45, *(void **)(a1 + 48));

  if (v46)
  {
    v47 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 160);
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 + 1, v47));
  }
  objc_msgSend(v130, "additionalAttributes");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "importedBy");

  v51 = v130;
  if (v50)
  {
    objc_msgSend(v130, "additionalAttributes");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "importedBy") == 2)
    {

      v51 = v130;
    }
    else
    {
      objc_msgSend(v130, "additionalAttributes");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "importedBy");

      v51 = v130;
      if (v54 != 1)
      {
LABEL_64:
        v57 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 112);
        do
          v58 = __ldaxr(v57);
        while (__stlxr(v58 + 1, v57));
        goto LABEL_66;
      }
    }
    v55 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 104);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 + 1, v55));
    goto LABEL_64;
  }
LABEL_66:
  if (objc_msgSend(v51, "cameraProcessingAdjustmentState")
    && (objc_msgSend(v130, "cameraProcessingAdjustmentState") & 8) != 0)
  {
    v59 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 168);
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 + 1, v59));
  }
  objc_msgSend(v130, "additionalAttributes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "syndicationIdentifier");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary");
    objc_msgSend(v130, "savedAssetType");
    v64 = PLValidatedSavedAssetTypeApplies();

    v65 = v130;
    if (v64)
    {
      objc_msgSend(v130, "additionalAttributes");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "importedByBundleIdentifier");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

      if (v68)
      {
        v69 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 416);
        do
          v70 = __ldaxr(v69);
        while (__stlxr(v70 + 1, v69));
        objc_msgSend(v130, "additionalAttributes");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "syndicationHistory");

        v65 = v130;
        if (v72 == 2)
        {
          v73 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 432);
          do
            v74 = __ldaxr(v73);
          while (__stlxr(v74 + 1, v73));
        }
        goto LABEL_85;
      }
      objc_msgSend(v130, "additionalAttributes");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "importedByBundleIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v76, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
      {

        v65 = v130;
        goto LABEL_83;
      }
      objc_msgSend(v130, "additionalAttributes");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "importedByBundleIdentifier");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "isEqualToString:", CFSTR("com.apple.Photos"));

      v65 = v130;
      if (v79)
      {
LABEL_83:
        v80 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 424);
        do
          v81 = __ldaxr(v80);
        while (__stlxr(v81 + 1, v80));
      }
    }
  }
  else
  {

    v65 = v130;
  }
LABEL_85:
  objc_msgSend(v65, "detectedFaces");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "count");

  if (v83)
  {
    v84 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 176);
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 + 1, v84));
  }
  objc_msgSend(v130, "mediaAnalysisAttributes");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "characterRecognitionAttributes");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v87)
    goto LABEL_95;
  objc_msgSend(v87, "characterRecognitionData");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {

    goto LABEL_92;
  }
  objc_msgSend(v87, "machineReadableCodeData");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v89)
  {
LABEL_95:
    if (!v83)
      goto LABEL_98;
    goto LABEL_96;
  }
LABEL_92:
  v90 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 184);
  do
    v91 = __ldaxr(v90);
  while (__stlxr(v91 + 1, v90));
LABEL_96:
  v92 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 192);
  do
    v93 = __ldaxr(v92);
  while (__stlxr(v93 + 1, v92));
LABEL_98:
  if (objc_msgSend(v130, "duplicateAssetVisibilityState") == 100)
  {
    v94 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 240);
    do
      v95 = __ldaxr(v94);
    while (__stlxr(v95 + 1, v94));
  }
  v96 = objc_msgSend(v130, "hasLibraryScope");
  v97 = *(_QWORD *)(a1 + 32);
  if (!v96)
  {
    v109 = (unint64_t *)(v97 + 232);
    v105 = v130;
    do
LABEL_118:
      v110 = __ldaxr(v109);
    while (__stlxr(v110 + 1, v109));
    goto LABEL_119;
  }
  v98 = (unint64_t *)(v97 + 248);
  do
    v99 = __ldaxr(v98);
  while (__stlxr(v99 + 1, v98));
  v100 = objc_msgSend(v130, "libraryScopeShareState");
  if ((v100 & 0x200000) != 0)
  {
    v101 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 256);
    do
      v102 = __ldaxr(v101);
    while (__stlxr(v102 + 1, v101));
  }
  if ((v100 & 0x10) != 0 || (v100 & 0x1E) == 2)
  {
    v103 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 280);
    do
      v104 = __ldaxr(v103);
    while (__stlxr(v104 + 1, v103));
  }
  v105 = v130;
  if ((v100 & 0x1C) == 4 || (v100 & 0x18) == 8)
  {
    v106 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 264);
    do
      v107 = __ldaxr(v106);
    while (__stlxr(v107 + 1, v106));
    v108 = objc_msgSend(v130, "importedBy");
    v105 = v130;
    if ((unsigned __int16)(v108 - 1) <= 1u)
    {
      v109 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 272);
      goto LABEL_118;
    }
  }
LABEL_119:
  objc_msgSend(v105, "extendedAttributes");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "longitude");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    objc_msgSend(v130, "extendedAttributes");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "latitude");
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    v116 = v130;
    if (v115)
    {
      v117 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 288);
      do
        v118 = __ldaxr(v117);
      while (__stlxr(v118 + 1, v117));
    }
  }
  else
  {

    v116 = v130;
  }
  v119 = objc_msgSend(v116, "savedAssetType");
  if (v119 == objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForFinderSyncedAsset"))
  {
    v120 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 296);
    do
      v121 = __ldaxr(v120);
    while (__stlxr(v121 + 1, v120));
  }
  if (objc_msgSend(v130, "spatialType"))
  {
    v122 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 304);
    do
      v123 = __ldaxr(v122);
    while (__stlxr(v123 + 1, v122));
  }
  if (objc_msgSend(v130, "spatialType") == 2)
  {
    v124 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 312);
    do
      v125 = __ldaxr(v124);
    while (__stlxr(v125 + 1, v124));
  }
  if (objc_msgSend(v130, "currentSleetCast"))
  {
    v126 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 320);
    do
      v127 = __ldaxr(v126);
    while (__stlxr(v127 + 1, v126));
  }
  if ((int)objc_msgSend(v130, "currentSleetCast") >= 2)
  {
    v128 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 328);
    do
      v129 = __ldaxr(v128);
    while (__stlxr(v129 + 1, v128));
  }

}

uint64_t __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t result;
  unint64_t *v6;
  unint64_t v7;

  v3 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 208);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + 1, v3));
  result = objc_msgSend(a2, "isTorsoOnly");
  if ((_DWORD)result)
  {
    v6 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 200);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
  }
  return result;
}

uint64_t __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_3(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;

  v1 = (unint64_t *)(*(_QWORD *)(result + 32) + 16);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  return result;
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 == 1510)
  {
    v5 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 224);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
    v7 = objc_msgSend(v10, "approximateCount");
    v8 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 216);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + v7, v8));
  }

}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  id v32;

  v3 = a2;
  v4 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 336);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  v32 = v3;
  if ((int)objc_msgSend(v3, "detectionType") >= 2)
  {
    v6 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 344);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
  }
  v8 = objc_msgSend(v32, "verifiedType");
  if (v8 == -2)
  {
    v11 = 400;
LABEL_13:
    v10 = v32;
    goto LABEL_14;
  }
  if (v8 == 2)
  {
    v11 = 352;
    goto LABEL_13;
  }
  v9 = v8 == 1;
  v10 = v32;
  if (!v9)
    goto LABEL_16;
  v11 = 360;
LABEL_14:
  v12 = (unint64_t *)(*(_QWORD *)(a1 + 32) + v11);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 + 1, v12));
LABEL_16:
  v14 = objc_msgSend(v10, "type");
  if (v14 == -1)
  {
    v16 = 376;
    v15 = v32;
  }
  else
  {
    v9 = v14 == 1;
    v15 = v32;
    if (!v9)
      goto LABEL_23;
    v16 = 368;
  }
  v17 = (unint64_t *)(*(_QWORD *)(a1 + 32) + v16);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 + 1, v17));
LABEL_23:
  objc_msgSend(v15, "fullName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {

  }
  else
  {
    objc_msgSend(v32, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (!v21)
      goto LABEL_28;
  }
  v22 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 384);
  do
    v23 = __ldaxr(v22);
  while (__stlxr(v23 + 1, v22));
LABEL_28:
  objc_msgSend(v32, "personUri");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v25)
  {
    v26 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 392);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 + 1, v26));
  }
  objc_msgSend(v32, "userFeedbacks");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    v30 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 408);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 + 1, v30));
  }

}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_6(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  unint64_t v71;
  void *v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  void *v76;
  unint64_t v77;
  void *v78;
  unint64_t v79;
  void *v80;
  unint64_t v81;
  void *v82;
  unint64_t v83;
  void *v84;
  unint64_t v85;
  void *v86;
  unint64_t v87;
  void *v88;
  unint64_t v89;
  void *v90;
  unint64_t v91;
  void *v92;
  unint64_t v93;
  void *v94;
  unint64_t v95;
  void *v96;
  unint64_t v97;
  void *v98;
  unint64_t v99;
  void *v100;
  unint64_t v101;
  void *v102;
  unint64_t v103;
  void *v104;
  unint64_t v105;
  void *v106;
  unint64_t v107;
  void *v108;
  unint64_t v109;
  void *v110;
  unint64_t v111;
  void *v112;
  unint64_t v113;
  void *v114;
  unint64_t v115;
  void *v116;
  unint64_t v117;
  void *v118;
  unint64_t v119;
  void *v120;
  unint64_t v121;
  void *v122;
  unint64_t v123;
  void *v124;
  unint64_t v125;
  void *v126;
  unint64_t v127;
  void *v128;
  unint64_t v129;
  void *v130;
  unint64_t v131;
  void *v132;
  unint64_t v133;
  void *v134;
  unint64_t v135;
  void *v136;
  unint64_t v137;
  void *v138;
  unint64_t v139;
  void *v140;
  unint64_t v141;
  void *v142;
  unint64_t v143;
  void *v144;
  unint64_t v145;
  void *v146;
  unint64_t v147;
  void *v148;
  unint64_t v149;
  void *v150;
  unint64_t v151;
  void *v152;
  unint64_t v153;
  void *v154;
  unint64_t v155;
  void *v156;
  void *v157;
  unint64_t v158;
  void *v159;
  void *v160;
  unint64_t v161;
  void *v162;
  void *v163;
  unint64_t v164;
  void *v165;
  void *v166;
  unint64_t v167;
  void *v168;
  void *v169;
  unint64_t v170;
  void *v171;
  void *v172;
  unint64_t v173;
  void *v174;
  void *v175;
  unint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  uint64_t v202;
  void *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  uint64_t v217;
  void *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  uint64_t v223;
  void *v224;
  void *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  uint64_t v229;
  void *v230;
  void *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  void *v242;
  uint64_t v243;
  void *v244;
  uint64_t v245;
  void *v246;
  unint64_t v247;
  void *v248;
  unint64_t v249;
  void *v250;
  unint64_t v251;
  void *v252;
  uint64_t v253;
  void *v254;
  uint64_t v255;
  void *v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  void *v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  void *v264;
  uint64_t v265;
  void *v266;
  uint64_t v267;
  void *v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  void *v272;
  uint64_t v273;
  void *v274;
  void *v275;
  uint64_t v276;
  void *v277;
  void *v278;
  uint64_t v279;
  void *v280;
  uint64_t v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  uint64_t v287;
  void *v288;
  uint64_t v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
  void *v304;
  uint64_t v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  uint64_t v311;
  void *v312;
  uint64_t v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  uint64_t v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  _QWORD v326[4];
  id v327;
  id v328;
  uint64_t *v329;
  uint64_t *v330;
  uint64_t v331;
  uint64_t *v332;
  uint64_t v333;
  char v334;
  uint64_t v335;
  double *v336;
  uint64_t v337;
  uint64_t v338;
  _QWORD v339[56];
  _QWORD v340[56];
  uint64_t v341;
  void *v342;
  _QWORD v343[10];
  _QWORD v344[10];
  _QWORD v345[20];
  _QWORD v346[20];
  _QWORD v347[4];
  _QWORD v348[6];

  v348[4] = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  if (*(_BYTE *)(a1 + 88))
  {
    objc_opt_class();
    v2 = *(id *)(a1 + 32);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    objc_msgSend(v4, "pl_libraryBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCPLSettings settingsWithLibraryBundle:](PLCPLSettings, "settingsWithLibraryBundle:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isKeepOriginalsEnabled"))
    {
      v7 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 32));
      v8 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 48));
      v249 = v8;
      v251 = v7;
      v9 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 24));
      v247 = v9;
      v10 = 2;
    }
    else
    {
      v247 = 0;
      v249 = 0;
      v251 = 0;
      v10 = 1;
    }
    v253 = v10;

  }
  else
  {
    v11 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 32));
    v251 = v11;
    v253 = 0;
    v12 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 48));
    v13 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 24));
    v247 = v13;
    v249 = v12;
  }
  if (PLIsAssetsd()
    && objc_msgSend(MEMORY[0x1E0D73280], "isSystemPhotoLibraryURL:", *(_QWORD *)(a1 + 48)))
  {
    v14 = objc_msgSend(*(id *)(a1 + 56), "resourceCacheMetrics");
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 56), "setResourceCacheMetrics:", 0, 0);
    v17 = *(void **)(a1 + 64);
    v347[0] = *MEMORY[0x1E0D73898];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v348[0] = v18;
    v347[1] = *MEMORY[0x1E0D738A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", HIDWORD(v14));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v348[1] = v19;
    v347[2] = *MEMORY[0x1E0D738A8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v348[2] = v20;
    v347[3] = *MEMORY[0x1E0D738B0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", HIDWORD(v16));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v348[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v348, v347, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v22);

  }
  if (PLIsCloudPhotoLibraryEnabledForCurrentUser())
  {
    CPLMetricsFromPathManager(*(void **)(a1 + 72));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0D115A8];
    v319 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D115A8]);
    v25 = *MEMORY[0x1E0D11528];
    v311 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11528]);
    v26 = *MEMORY[0x1E0D115B0];
    v303 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D115B0]);
    v27 = *MEMORY[0x1E0D11520];
    v295 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11520]);
    v28 = *MEMORY[0x1E0D11550];
    v287 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11550]);
    v29 = *MEMORY[0x1E0D11538];
    v279 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11538]);
    v30 = *MEMORY[0x1E0D11560];
    v271 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11560]);
    v267 = *MEMORY[0x1E0D11558];
    v263 = objc_msgSend(v23, "countForKey:");
    v259 = *MEMORY[0x1E0D11530];
    v255 = objc_msgSend(v23, "countForKey:");
    v243 = *MEMORY[0x1E0D11568];
    v239 = objc_msgSend(v23, "countForKey:");
    v235 = *MEMORY[0x1E0D11580];
    v232 = objc_msgSend(v23, "countForKey:");
    v229 = *MEMORY[0x1E0D115A0];
    v226 = objc_msgSend(v23, "countForKey:");
    v223 = *MEMORY[0x1E0D11548];
    v220 = objc_msgSend(v23, "countForKey:");
    v217 = *MEMORY[0x1E0D11570];
    v214 = objc_msgSend(v23, "countForKey:");
    v211 = *MEMORY[0x1E0D11598];
    v208 = objc_msgSend(v23, "countForKey:");
    v205 = *MEMORY[0x1E0D11588];
    v202 = objc_msgSend(v23, "countForKey:");
    v199 = *MEMORY[0x1E0D115B8];
    v197 = objc_msgSend(v23, "countForKey:");
    v195 = *MEMORY[0x1E0D11540];
    v193 = objc_msgSend(v23, "countForKey:");
    v191 = *MEMORY[0x1E0D11578];
    v189 = objc_msgSend(v23, "countForKey:");
    v187 = *MEMORY[0x1E0D11590];
    v185 = objc_msgSend(v23, "countForKey:");
    v183 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v24);
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    v345[0] = v323;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v319);
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    v346[0] = v320;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v25);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    v345[1] = v316;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v311);
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    v346[1] = v312;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v26);
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    v345[2] = v308;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v303);
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    v346[2] = v304;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v27);
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    v345[3] = v300;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v295);
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    v346[3] = v296;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v28);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    v345[4] = v292;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v287);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    v346[4] = v288;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v29);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    v345[5] = v284;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v279);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v346[5] = v280;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v30);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    v345[6] = v275;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v271);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    v346[6] = v272;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v267);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v345[7] = v268;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v263);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    v346[7] = v264;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v259);
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v345[8] = v260;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v255);
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    v346[8] = v256;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v243);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v345[9] = v244;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v239);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v346[9] = v240;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v345[10] = v236;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v232);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    v346[10] = v233;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v229);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v345[11] = v230;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v226);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v346[11] = v227;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v345[12] = v224;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v220);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    v346[12] = v221;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v217);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v345[13] = v218;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v346[13] = v215;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v345[14] = v212;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v346[14] = v209;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v345[15] = v206;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v346[15] = v203;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v199);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v345[16] = v200;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v197);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v346[16] = v31;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v195);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v345[17] = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v193);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v346[17] = v33;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v191);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v345[18] = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v189);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v346[18] = v35;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLSyncSession"), v187);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v345[19] = v36;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v185);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v346[19] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v346, v345, 20);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addEntriesFromDictionary:", v38);

    v39 = *MEMORY[0x1E0D11500];
    v40 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11500]);
    v41 = *MEMORY[0x1E0D11510];
    v313 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11510]);
    v42 = *MEMORY[0x1E0D11508];
    v305 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11508]);
    v43 = *MEMORY[0x1E0D11518];
    v297 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D11518]);
    v44 = *MEMORY[0x1E0D114F8];
    v289 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D114F8]);
    v45 = *MEMORY[0x1E0D114D8];
    v281 = objc_msgSend(v23, "countForKey:", *MEMORY[0x1E0D114D8]);
    v276 = *MEMORY[0x1E0D114E8];
    v273 = objc_msgSend(v23, "countForKey:");
    v269 = *MEMORY[0x1E0D114E0];
    v265 = objc_msgSend(v23, "countForKey:");
    v261 = *MEMORY[0x1E0D114F0];
    v257 = objc_msgSend(v23, "countForKey:");
    v245 = *MEMORY[0x1E0D114D0];
    v241 = objc_msgSend(v23, "countForKey:");
    v237 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v39);
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    v343[0] = v324;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40);
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    v344[0] = v321;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v41);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    v343[1] = v317;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v313);
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    v344[1] = v314;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v42);
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    v343[2] = v309;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v305);
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    v344[2] = v306;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v43);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    v343[3] = v301;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v297);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    v344[3] = v298;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v44);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    v343[4] = v293;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v289);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v344[4] = v290;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v45);
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v343[5] = v285;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v281);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    v344[5] = v282;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v276);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    v343[6] = v277;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v273);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v344[6] = v46;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v269);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v343[7] = v47;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v265);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v344[7] = v48;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v261);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v343[8] = v49;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v257);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v344[8] = v50;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("iCPLComputeSync"), v245);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v343[9] = v51;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v241);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v344[9] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v344, v343, 10);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "addEntriesFromDictionary:", v53);

    objc_msgSend(v23, "resetMetrics");
  }
  if (atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 104)))
  {
    v55 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 112));
    v56 = 0x1E0CB3000uLL;
    if (v55)
    {
      v57 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 104));
      v58 = (double)v57 * 100.0;
      v59 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 112));
      v60 = vcvtad_u64_f64(v58 / (double)v59);
    }
    else
    {
      v60 = 100;
    }
  }
  else
  {
    v60 = 0;
    v56 = 0x1E0CB3000;
  }
  v335 = 0;
  v336 = (double *)&v335;
  v337 = 0x2020000000;
  v338 = 0;
  v331 = 0;
  v332 = &v331;
  v333 = 0x2020000000;
  v334 = 0;
  if (atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 272)))
  {
    v62 = *(void **)(a1 + 32);
    v326[0] = MEMORY[0x1E0C809B0];
    v326[1] = 3221225472;
    v326[2] = __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_7;
    v326[3] = &unk_1E3676348;
    v327 = v62;
    v329 = &v331;
    v330 = &v335;
    v328 = *(id *)(a1 + 40);
    objc_msgSend(v327, "performBlockAndWait:", v326);
    if (*((_BYTE *)v332 + 24))
    {
      v63 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 272));
      v64 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 264));
      if (v64 <= 4 * v63)
      {
        v65 = *(void **)(a1 + 64);
        v341 = *MEMORY[0x1E0D73A80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v336[3]);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v342 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v342, &v341, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addEntriesFromDictionary:", v67);

      }
    }

  }
  v179 = *(void **)(a1 + 64);
  v339[0] = *MEMORY[0x1E0D73868];
  v68 = *(void **)(v56 + 2024);
  v69 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v68, "numberWithUnsignedLongLong:", v69);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v340[0] = v325;
  v339[1] = *MEMORY[0x1E0D739F0];
  v70 = *(void **)(v56 + 2024);
  v71 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(v70, "numberWithUnsignedLongLong:", v71);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v340[1] = v322;
  v339[2] = *MEMORY[0x1E0D73940];
  v72 = *(void **)(v56 + 2024);
  v73 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(v72, "numberWithUnsignedLongLong:", v73);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v340[2] = v318;
  v339[3] = *MEMORY[0x1E0D73AE0];
  v74 = *(void **)(v56 + 2024);
  v75 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(v74, "numberWithUnsignedLongLong:", v75);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v340[3] = v315;
  v339[4] = *MEMORY[0x1E0D73AC8];
  v76 = *(void **)(v56 + 2024);
  v77 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v76, "numberWithUnsignedLongLong:", v77);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v340[4] = v310;
  v339[5] = *MEMORY[0x1E0D73930];
  v78 = *(void **)(v56 + 2024);
  v79 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 72));
  objc_msgSend(v78, "numberWithUnsignedLongLong:", v79);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v340[5] = v307;
  v339[6] = *MEMORY[0x1E0D73A00];
  v80 = *(void **)(v56 + 2024);
  v81 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 80));
  objc_msgSend(v80, "numberWithUnsignedLongLong:", v81);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v340[6] = v302;
  v339[7] = *MEMORY[0x1E0D73910];
  v82 = *(void **)(v56 + 2024);
  v83 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 88));
  objc_msgSend(v82, "numberWithUnsignedLongLong:", v83);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v340[7] = v299;
  v339[8] = *MEMORY[0x1E0D739A8];
  v84 = *(void **)(v56 + 2024);
  v85 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(v84, "numberWithUnsignedLongLong:", v85);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v340[8] = v294;
  v339[9] = *MEMORY[0x1E0D739B0];
  v86 = *(void **)(v56 + 2024);
  v87 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 56));
  objc_msgSend(v86, "numberWithUnsignedLongLong:", v87);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v340[9] = v291;
  v339[10] = *MEMORY[0x1E0D739F8];
  v88 = *(void **)(v56 + 2024);
  v89 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 144));
  objc_msgSend(v88, "numberWithUnsignedLongLong:", v89);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v340[10] = v286;
  v339[11] = *MEMORY[0x1E0D73860];
  v90 = *(void **)(v56 + 2024);
  v91 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 152));
  objc_msgSend(v90, "numberWithUnsignedLongLong:", v91);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v340[11] = v283;
  v339[12] = *MEMORY[0x1E0D73928];
  v92 = *(void **)(v56 + 2024);
  v93 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 96));
  objc_msgSend(v92, "numberWithUnsignedLongLong:", v93);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v340[12] = v278;
  v339[13] = *MEMORY[0x1E0D738E0];
  v94 = *(void **)(v56 + 2024);
  v95 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 120));
  objc_msgSend(v94, "numberWithUnsignedLongLong:", v95);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v340[13] = v274;
  v339[14] = *MEMORY[0x1E0D73938];
  v96 = *(void **)(v56 + 2024);
  v97 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 128));
  objc_msgSend(v96, "numberWithUnsignedLongLong:", v97);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v340[14] = v270;
  v339[15] = *MEMORY[0x1E0D73A70];
  v98 = *(void **)(v56 + 2024);
  v99 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 136));
  objc_msgSend(v98, "numberWithUnsignedLongLong:", v99);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v340[15] = v266;
  v339[16] = *MEMORY[0x1E0D73850];
  v100 = *(void **)(v56 + 2024);
  v101 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 160));
  objc_msgSend(v100, "numberWithUnsignedLongLong:", v101);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v340[16] = v262;
  v339[17] = *MEMORY[0x1E0D73920];
  objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v60);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v340[17] = v258;
  v339[18] = *MEMORY[0x1E0D73AE8];
  objc_msgSend(*(id *)(v56 + 2024), "numberWithInteger:", v253);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v340[18] = v254;
  v339[19] = *MEMORY[0x1E0D73AF0];
  objc_msgSend(*(id *)(v56 + 2024), "numberWithInteger:", v251);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v340[19] = v252;
  v339[20] = *MEMORY[0x1E0D73B00];
  objc_msgSend(*(id *)(v56 + 2024), "numberWithInteger:", v249);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v340[20] = v250;
  v339[21] = *MEMORY[0x1E0D73AF8];
  objc_msgSend(*(id *)(v56 + 2024), "numberWithInteger:", v247);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v340[21] = v248;
  v339[22] = *MEMORY[0x1E0D73A58];
  v102 = *(void **)(v56 + 2024);
  v103 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 168));
  objc_msgSend(v102, "numberWithUnsignedLongLong:", v103);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v340[22] = v246;
  v339[23] = *MEMORY[0x1E0D73AB8];
  v104 = *(void **)(v56 + 2024);
  v105 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v104, "numberWithUnsignedLongLong:", v105);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v340[23] = v242;
  v339[24] = *MEMORY[0x1E0D73A68];
  v106 = *(void **)(v56 + 2024);
  v107 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 424));
  objc_msgSend(v106, "numberWithUnsignedLongLong:", v107);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v340[24] = v238;
  v339[25] = *MEMORY[0x1E0D73A60];
  v108 = *(void **)(v56 + 2024);
  v109 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 416));
  objc_msgSend(v108, "numberWithUnsignedLongLong:", v109);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v340[25] = v234;
  v339[26] = *MEMORY[0x1E0D73988];
  v110 = *(void **)(v56 + 2024);
  v111 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 432));
  objc_msgSend(v110, "numberWithUnsignedLongLong:", v111);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v340[26] = v231;
  v339[27] = *MEMORY[0x1E0D73870];
  v112 = *(void **)(v56 + 2024);
  v113 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 176));
  objc_msgSend(v112, "numberWithUnsignedLongLong:", v113);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v340[27] = v228;
  v339[28] = *MEMORY[0x1E0D73878];
  v114 = *(void **)(v56 + 2024);
  v115 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 184));
  objc_msgSend(v114, "numberWithUnsignedLongLong:", v115);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v340[28] = v225;
  v339[29] = *MEMORY[0x1E0D73880];
  v116 = *(void **)(v56 + 2024);
  v117 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 192));
  objc_msgSend(v116, "numberWithUnsignedLongLong:", v117);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v340[29] = v222;
  v339[30] = *MEMORY[0x1E0D73888];
  v118 = *(void **)(v56 + 2024);
  v119 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 200));
  objc_msgSend(v118, "numberWithUnsignedLongLong:", v119);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v340[30] = v219;
  v339[31] = *MEMORY[0x1E0D738D8];
  v120 = *(void **)(v56 + 2024);
  v121 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 208));
  objc_msgSend(v120, "numberWithUnsignedLongLong:", v121);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v340[31] = v216;
  v339[32] = *MEMORY[0x1E0D738C0];
  v122 = *(void **)(v56 + 2024);
  v123 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 216));
  objc_msgSend(v122, "numberWithUnsignedLongLong:", v123);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v340[32] = v213;
  v339[33] = *MEMORY[0x1E0D738C8];
  v124 = *(void **)(v56 + 2024);
  v125 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 224));
  objc_msgSend(v124, "numberWithUnsignedLongLong:", v125);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v340[33] = v210;
  v339[34] = *MEMORY[0x1E0D738D0];
  v126 = *(void **)(v56 + 2024);
  v127 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 240));
  objc_msgSend(v126, "numberWithUnsignedLongLong:", v127);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v340[34] = v207;
  v339[35] = *MEMORY[0x1E0D73A78];
  v128 = *(void **)(v56 + 2024);
  v129 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 248));
  objc_msgSend(v128, "numberWithUnsignedLongLong:", v129);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v340[35] = v204;
  v339[36] = *MEMORY[0x1E0D739E8];
  v130 = *(void **)(v56 + 2024);
  v131 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 232));
  objc_msgSend(v130, "numberWithUnsignedLongLong:", v131);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v340[36] = v201;
  v339[37] = *MEMORY[0x1E0D73968];
  v132 = *(void **)(v56 + 2024);
  v133 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 256));
  objc_msgSend(v132, "numberWithUnsignedLongLong:", v133);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v340[37] = v198;
  v339[38] = *MEMORY[0x1E0D73848];
  v134 = *(void **)(v56 + 2024);
  v135 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 264));
  objc_msgSend(v134, "numberWithUnsignedLongLong:", v135);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v340[38] = v196;
  v339[39] = *MEMORY[0x1E0D73858];
  v136 = *(void **)(v56 + 2024);
  v137 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 280));
  objc_msgSend(v136, "numberWithUnsignedLongLong:", v137);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v340[39] = v194;
  v339[40] = *MEMORY[0x1E0D73960];
  v138 = *(void **)(v56 + 2024);
  v139 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 288));
  objc_msgSend(v138, "numberWithUnsignedLongLong:", v139);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v340[40] = v192;
  v339[41] = *MEMORY[0x1E0D73900];
  v140 = *(void **)(v56 + 2024);
  v141 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 296));
  objc_msgSend(v140, "numberWithUnsignedLongLong:", v141);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v340[41] = v190;
  v339[42] = *MEMORY[0x1E0D73A90];
  v142 = *(void **)(v56 + 2024);
  v143 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 304));
  objc_msgSend(v142, "numberWithUnsignedLongLong:", v143);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v340[42] = v188;
  v339[43] = *MEMORY[0x1E0D73A88];
  v144 = *(void **)(v56 + 2024);
  v145 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 312));
  objc_msgSend(v144, "numberWithUnsignedLongLong:", v145);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v340[43] = v186;
  v339[44] = *MEMORY[0x1E0D73A98];
  v146 = *(void **)(v56 + 2024);
  v147 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 320));
  objc_msgSend(v146, "numberWithUnsignedLongLong:", v147);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v340[44] = v184;
  v339[45] = *MEMORY[0x1E0D73AA0];
  v148 = *(void **)(v56 + 2024);
  v149 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 328));
  objc_msgSend(v148, "numberWithUnsignedLongLong:", v149);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v340[45] = v182;
  v339[46] = *MEMORY[0x1E0D739D8];
  v150 = *(void **)(v56 + 2024);
  v151 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 336));
  objc_msgSend(v150, "numberWithUnsignedLongLong:", v151);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v340[46] = v181;
  v339[47] = *MEMORY[0x1E0D739E0];
  v152 = *(void **)(v56 + 2024);
  v153 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 344));
  objc_msgSend(v152, "numberWithUnsignedLongLong:", v153);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v340[47] = v180;
  v339[48] = *MEMORY[0x1E0D73908];
  v154 = *(void **)(v56 + 2024);
  v155 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 352));
  objc_msgSend(v154, "numberWithUnsignedLongLong:", v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v340[48] = v156;
  v339[49] = *MEMORY[0x1E0D73AD8];
  v157 = *(void **)(v56 + 2024);
  v158 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 360));
  objc_msgSend(v157, "numberWithUnsignedLongLong:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v340[49] = v159;
  v339[50] = *MEMORY[0x1E0D738E8];
  v160 = *(void **)(v56 + 2024);
  v161 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 368));
  objc_msgSend(v160, "numberWithUnsignedLongLong:", v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v340[50] = v162;
  v339[51] = *MEMORY[0x1E0D73918];
  v163 = *(void **)(v56 + 2024);
  v164 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 376));
  objc_msgSend(v163, "numberWithUnsignedLongLong:", v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v340[51] = v165;
  v339[52] = *MEMORY[0x1E0D73980];
  v166 = *(void **)(v56 + 2024);
  v167 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 384));
  objc_msgSend(v166, "numberWithUnsignedLongLong:", v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v340[52] = v168;
  v339[53] = *MEMORY[0x1E0D738B8];
  v169 = *(void **)(v56 + 2024);
  v170 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 392));
  objc_msgSend(v169, "numberWithUnsignedLongLong:", v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v340[53] = v171;
  v339[54] = *MEMORY[0x1E0D73AB0];
  v172 = *(void **)(v56 + 2024);
  v173 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 400));
  objc_msgSend(v172, "numberWithUnsignedLongLong:", v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v340[54] = v174;
  v339[55] = *MEMORY[0x1E0D73AD0];
  v175 = *(void **)(v56 + 2024);
  v176 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 40) + 408));
  objc_msgSend(v175, "numberWithUnsignedLongLong:", v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v340[55] = v177;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v340, v339, 56);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "addEntriesFromDictionary:", v178);

  objc_msgSend(*(id *)(a1 + 80), "_addPersistentHistoryStatsToLibrarySummaryEvent:withLibraryPathManager:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 80), "_addFileSystemStatsToLibrarySummaryEvent:withLibraryPathManager:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 80), "_addOrphanedSceneClassificationsCountToLibrarySummaryEvent:withContext:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  _Block_object_dispose(&v331, 8);
  _Block_object_dispose(&v335, 8);
}

void __120__PLAggdLogging__configureEnumeratorForLibrarySummaryLogging_cloudPhotoLibraryEnabled_dataForCA_libraryServicesManager___block_invoke_7(_QWORD *a1)
{
  void *v2;
  double v3;
  unint64_t v4;
  id v5;

  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v5 = v2;
    v3 = (double)(int)objc_msgSend(v2, "countOfAssetsAddedByCameraSmartSharing");
    v2 = v5;
    v4 = atomic_load((unint64_t *)(a1[5] + 272));
    *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = v3 / (double)v4;
  }

}

void __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  void *v12;
  _BOOL4 IsGreaterThanOrEqual;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  int v36;
  id v37;

  v3 = a2;
  v4 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  v37 = v3;
  if (!objc_msgSend(v3, "isPhoto"))
  {
    if (!objc_msgSend(v37, "isVideo"))
      goto LABEL_12;
    v8 = 48;
    goto LABEL_10;
  }
  v6 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 32);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  if ((objc_msgSend(v37, "isPhotoIris") & 1) != 0)
  {
    v8 = 40;
LABEL_10:
    v9 = (unint64_t *)(*(_QWORD *)(a1 + 32) + v8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
  }
LABEL_12:
  if (!atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 96)))
  {
    objc_msgSend(v37, "addedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IsGreaterThanOrEqual = PLDateIsGreaterThanOrEqual(v12, *(void **)(a1 + 40));

    if (IsGreaterThanOrEqual)
      atomic_store(1uLL, (unint64_t *)(*(_QWORD *)(a1 + 32) + 96));
  }
  v14 = objc_msgSend(v37, "savedAssetType");
  v15 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForPromoteToGuestAsset");
  v16 = 32;
  if (v14 == v15)
    v16 = 24;
  v17 = (unint64_t *)(*(_QWORD *)(a1 + 48) + v16);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 + 1, v17));
  if ((objc_msgSend(v37, "syndicationState") & 2) != 0)
  {
    v19 = (unint64_t *)(*(_QWORD *)(a1 + 48) + 48);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 + 1, v19));
  }
  objc_msgSend(v37, "conversation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 8;
  if (!v21)
    v22 = 16;
  v23 = (unint64_t *)(*(_QWORD *)(a1 + 48) + v22);
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 + 1, v23));
  objc_msgSend(v37, "additionalAttributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "importedByBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v27 = 56;
LABEL_30:
    v28 = v37;
    goto LABEL_31;
  }
  if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0)
  {
    v27 = 64;
    goto LABEL_30;
  }
  v28 = v37;
  if (v26)
  {
    PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsObject:", v26);

    v28 = v37;
    if (v36)
    {
      v27 = 72;
LABEL_31:
      v29 = (unint64_t *)(*(_QWORD *)(a1 + 48) + v27);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 + 1, v29));
    }
  }
  if (objc_msgSend(v28, "spatialType"))
  {
    v31 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 304);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 + 1, v31));
  }
  if (objc_msgSend(v37, "spatialType") == 2)
  {
    v33 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 312);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 + 1, v33));
  }

}

uint64_t __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_2(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;

  v1 = (unint64_t *)(*(_QWORD *)(result + 32) + 40);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  return result;
}

void __83__PLAggdLogging__configureEnumeratorForSyndicationLibrarySummaryLogging_dataForCA___block_invoke_3(_QWORD *a1)
{
  void *v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[15];
  _QWORD v56[17];

  v56[15] = *MEMORY[0x1E0C80C00];
  if (atomic_load((unint64_t *)(a1[4] + 40)))
  {
    v3 = (void *)a1[5];
    v4 = atomic_load((unint64_t *)(a1[4] + 8));
    v5 = (double)v4;
    v6 = atomic_load((unint64_t *)(a1[4] + 40));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 / (double)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0D73CC8]);

  }
  v55[0] = *MEMORY[0x1E0D73CB8];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v50 = (void *)a1[5];
  v9 = atomic_load((unint64_t *)(a1[6] + 8));
  objc_msgSend(v8, "numberWithUnsignedLongLong:", v9);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v54;
  v55[1] = *MEMORY[0x1E0D73D10];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = atomic_load((unint64_t *)(a1[6] + 32));
  objc_msgSend(v10, "numberWithUnsignedLongLong:", v11);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v53;
  v55[2] = *MEMORY[0x1E0D73CF0];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = atomic_load((unint64_t *)(a1[6] + 40));
  objc_msgSend(v12, "numberWithUnsignedLongLong:", v13);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v52;
  v55[3] = *MEMORY[0x1E0D73D30];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = atomic_load((unint64_t *)(a1[6] + 48));
  objc_msgSend(v14, "numberWithUnsignedLongLong:", v15);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v51;
  v55[4] = *MEMORY[0x1E0D73CE8];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = atomic_load((unint64_t *)(a1[6] + 96));
  objc_msgSend(v16, "numberWithUnsignedLongLong:", v17);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v49;
  v55[5] = *MEMORY[0x1E0D73D28];
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = atomic_load((unint64_t *)(a1[6] + 304));
  objc_msgSend(v18, "numberWithUnsignedLongLong:", v19);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v48;
  v55[6] = *MEMORY[0x1E0D73D20];
  v20 = (void *)MEMORY[0x1E0CB37E8];
  v21 = atomic_load((unint64_t *)(a1[6] + 312));
  objc_msgSend(v20, "numberWithUnsignedLongLong:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v22;
  v55[7] = *MEMORY[0x1E0D73CE0];
  v23 = (void *)MEMORY[0x1E0CB37E8];
  v24 = atomic_load((unint64_t *)(a1[4] + 24));
  objc_msgSend(v23, "numberWithUnsignedLongLong:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v25;
  v55[8] = *MEMORY[0x1E0D73D00];
  v26 = (void *)MEMORY[0x1E0CB37E8];
  v27 = atomic_load((unint64_t *)(a1[4] + 32));
  objc_msgSend(v26, "numberWithUnsignedLongLong:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v28;
  v55[9] = *MEMORY[0x1E0D73D18];
  v29 = (void *)MEMORY[0x1E0CB37E8];
  v30 = atomic_load((unint64_t *)(a1[4] + 48));
  objc_msgSend(v29, "numberWithUnsignedLongLong:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v31;
  v55[10] = *MEMORY[0x1E0D73CD0];
  v32 = (void *)MEMORY[0x1E0CB37E8];
  v33 = atomic_load((unint64_t *)(a1[4] + 40));
  objc_msgSend(v32, "numberWithUnsignedLongLong:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v34;
  v55[11] = *MEMORY[0x1E0D73CC0];
  v35 = (void *)MEMORY[0x1E0CB37E8];
  v36 = atomic_load((unint64_t *)(a1[4] + 16));
  objc_msgSend(v35, "numberWithUnsignedLongLong:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v37;
  v55[12] = *MEMORY[0x1E0D73CF8];
  v38 = (void *)MEMORY[0x1E0CB37E8];
  v39 = atomic_load((unint64_t *)(a1[4] + 56));
  objc_msgSend(v38, "numberWithUnsignedLongLong:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[12] = v40;
  v55[13] = *MEMORY[0x1E0D73D08];
  v41 = (void *)MEMORY[0x1E0CB37E8];
  v42 = atomic_load((unint64_t *)(a1[4] + 64));
  objc_msgSend(v41, "numberWithUnsignedLongLong:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v56[13] = v43;
  v55[14] = *MEMORY[0x1E0D73CD8];
  v44 = (void *)MEMORY[0x1E0CB37E8];
  v45 = atomic_load((unint64_t *)(a1[4] + 72));
  objc_msgSend(v44, "numberWithUnsignedLongLong:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[14] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 15);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addEntriesFromDictionary:", v47);

}

void __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  int v47;
  id v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  int v57;
  void *v58;
  char v59;
  int v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t *v63;
  unint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  unint64_t *v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t *v70;
  unint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  _QWORD *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "kind");
  v5 = objc_msgSend(v3, "kind");
  v6 = objc_msgSend(v3, "isDefaultAdjustedSlomo");
  if (objc_msgSend(v3, "hasAdjustments"))
    v7 = 2;
  else
    v7 = 0;
  if (!objc_msgSend(v3, "supportsCloudUpload"))
    goto LABEL_105;
  v8 = objc_msgSend(v3, "hasLibraryScope");
  v9 = a1[4];
  if (v8)
  {
    v10 = (unint64_t *)(v9 + 176);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 + 1, v10));
    v12 = objc_msgSend(v3, "libraryScopeShareState");
    if ((v12 & 0x200000) != 0)
    {
      v13 = (unint64_t *)(a1[4] + 184);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
    if ((v12 & 0x10) != 0 || (v12 & 0x1E) == 2)
    {
      v15 = (unint64_t *)(a1[4] + 192);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 + 1, v15));
    }
    if ((v12 & 0x1C) != 4 && (v12 & 0x18) != 8)
      goto LABEL_20;
    v17 = (unint64_t *)(a1[4] + 200);
  }
  else
  {
    v17 = (unint64_t *)(v9 + 168);
  }
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 + 1, v17));
LABEL_20:
  v19 = (unint64_t *)(a1[4] + 24);
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 + 1, v19));
  if (v4)
    v21 = v5 == 1;
  else
    v21 = 1;
  v22 = v21;
  v74 = v22;
  if (v21)
  {
    v23 = 40;
    if (!v4)
      v23 = 32;
    v24 = (unint64_t *)(a1[4] + v23);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 + 1, v24));
  }
  v75 = v4;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v3, "modernResources");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
  v76 = a1;
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v86;
LABEL_36:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v86 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v30);
      if (objc_msgSend(v31, "isLocallyAvailable"))
      {
        if (objc_msgSend(v3, "hasAdjustments"))
        {
          if (v6)
          {
            if (!objc_msgSend(v31, "version"))
            {
              v32 = (void *)a1[5];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "cplType"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v32) = objc_msgSend(v32, "containsObject:", v33);

              a1 = v76;
              if ((v32 & 1) != 0)
              {
LABEL_52:
                v40 = 1;
                goto LABEL_53;
              }
            }
          }
          if (objc_msgSend(v31, "version") != 2)
            goto LABEL_49;
          v34 = (void *)a1[6];
          goto LABEL_48;
        }
        if (!objc_msgSend(v31, "version"))
        {
          v34 = (void *)a1[5];
LABEL_48:
          v35 = (void *)MEMORY[0x1E0CB37E8];
          v36 = objc_msgSend(v31, "cplType");
          v37 = v35;
          a1 = v76;
          objc_msgSend(v37, "numberWithUnsignedInteger:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v34, "containsObject:", v38);

          if ((v39 & 1) != 0)
            goto LABEL_52;
        }
      }
LABEL_49:
      if (v28 == ++v30)
      {
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
        if (v28)
          goto LABEL_36;
        break;
      }
    }
  }
  v40 = 0;
LABEL_53:

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v3, "modernResources");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v82;
    while (2)
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v82 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        if (objc_msgSend(v46, "isLocallyAvailable")
          && objc_msgSend(v46, "cplType") == 4
          && objc_msgSend(v46, "version") == v7)
        {
          v47 = 1;
          goto LABEL_65;
        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      if (v43)
        continue;
      break;
    }
  }
  v47 = 0;
LABEL_65:

  if ((v6 & 1) != 0)
  {
    v48 = &unk_1E3763E90;
  }
  else
  {
    v49 = objc_msgSend(v3, "hasAdjustments");
    v50 = 8;
    if (v49)
      v50 = 7;
    v48 = (id)a1[v50];
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v3, "modernResources");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
  if (v52)
  {
    v53 = v52;
    v72 = v47;
    v73 = v40;
    v54 = *(_QWORD *)v78;
    while (2)
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v78 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
        if (objc_msgSend(v56, "isLocallyAvailable"))
        {
          v57 = objc_msgSend(v56, "version") == v7 ? 1 : v6;
          if (v57 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v56, "cplType"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v48, "containsObject:", v58);

            if ((v59 & 1) != 0)
            {
              v60 = 1;
              goto LABEL_85;
            }
          }
        }
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      if (v53)
        continue;
      break;
    }
    v60 = 0;
LABEL_85:
    a1 = v76;
    v47 = v72;
    v40 = v73;
  }
  else
  {
    v60 = 0;
  }

  if (objc_msgSend(v3, "hasAllThumbs"))
  {
    v61 = (unint64_t *)(a1[4] + 56);
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 + 1, v61));
  }
  if (v40)
  {
    v63 = (unint64_t *)(a1[4] + 48);
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 + 1, v63));
  }
  if (v47)
  {
    v65 = (unint64_t *)(a1[4] + 64);
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 + 1, v65));
  }
  if (v60)
  {
    v67 = (unint64_t *)(a1[4] + 72);
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 + 1, v67));
    if (v74)
    {
      v69 = 88;
      if (!v75)
        v69 = 80;
      v70 = (unint64_t *)(a1[4] + v69);
      do
        v71 = __ldaxr(v70);
      while (__stlxr(v71 + 1, v70));
    }
  }

LABEL_105:
}

void __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_2(uint64_t a1, void *a2)
{
  float v3;
  float v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  double v32;
  double v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  id v40;

  v40 = a2;
  objc_msgSend(MEMORY[0x1E0D11440], "derivativeGenerationThreshold");
  v4 = v3;
  v5 = objc_msgSend(MEMORY[0x1E0D11440], "maxPixelSizeForResourceType:", 4);
  v6 = objc_msgSend(v40, "unorientedWidth");
  v7 = objc_msgSend(v40, "unorientedHeight");
  if (objc_msgSend(v40, "cplType") == 1 && v7 * v6 <= (unint64_t)(float)(v4 * (float)v5))
  {
    v8 = objc_msgSend(v40, "isLocallyAvailable");
    v9 = 16;
    if (v8)
      v9 = 8;
    v10 = (unint64_t *)(*(_QWORD *)(a1 + 32) + v9);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 + 1, v10));
  }
  if (objc_msgSend(v40, "cplType"))
  {
    objc_msgSend(v40, "cloudPrunedAt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v12);
      v15 = v14;

      if (v15 >= 0.0)
      {
        if (v15 <= 86400.0)
        {
          v16 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 96);
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 + 1, v16));
          v18 = objc_msgSend(v40, "dataLength");
          v19 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 120);
          do
            v20 = __ldaxr(v19);
          while (__stlxr(v20 + v18, v19));
        }
        if (v15 <= 604800.0)
        {
          v21 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 104);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 + 1, v21));
          v23 = objc_msgSend(v40, "dataLength");
          v24 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 128);
          do
            v25 = __ldaxr(v24);
          while (__stlxr(v25 + v23, v24));
        }
        if (v15 <= 2592000.0)
        {
          v26 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 112);
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 + 1, v26));
          v28 = objc_msgSend(v40, "dataLength");
          v29 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 136);
          do
            v30 = __ldaxr(v29);
          while (__stlxr(v30 + v28, v29));
        }
      }
      objc_msgSend(v40, "cloudLastPrefetchDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v31);
      v33 = v32;

      if (v33 >= 0.0)
      {
        if (v33 <= 86400.0)
        {
          v34 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 144);
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 + 1, v34));
        }
        if (v33 <= 604800.0)
        {
          v36 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 152);
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 + 1, v36));
        }
        if (v33 <= 2592000.0)
        {
          v38 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 160);
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 + 1, v38));
        }
      }
    }
  }
  else
  {
    v12 = 0;
  }

}

void __114__PLAggdLogging_configureEnumeratorForHyperionLocalResourcesLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v15;
  double v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v33;
  double v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  double v41;
  double v42;
  unint64_t v43;
  double v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v51;
  double v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v59;
  double v60;
  unint64_t v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  unint64_t v86;
  void *v87;
  void *v88;
  unint64_t v89;
  void *v90;
  void *v91;
  unint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  unint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  unint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  unint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  unint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  unint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  unint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  unint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  unint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  unint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  unint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  unint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  unint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  __CFString *v163;
  __CFString *v164;
  id v165;
  void *v166;
  id v167;
  void *v168;
  void *v169;
  int v170;
  __CFString *v171;
  __CFString *v172;
  void *v173;
  id v174;

  v2 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = 0.0;
  v5 = 0.0;
  if (v2 + v3)
  {
    v6 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 8));
    v7 = (double)v6 * 100.0;
    v8 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 8));
    v9 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 16));
    v5 = round(v7 / (double)(v9 + v8));
  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("com.apple.assetsd.cpl.mediumOriginalPercent"));

  v12 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0D73970]);

  if (atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24)))
  {
    v15 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 48));
    v16 = (double)v15 * 100.0;
    v17 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
    v4 = round(v16 / (double)v17);
  }
  v18 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("com.apple.assetsd.cpl.originalPercent"));

  v20 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, *MEMORY[0x1E0D73998]);

  v22 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
  v23 = 0.0;
  v24 = 0.0;
  if (v22)
  {
    v25 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 56));
    v26 = (double)v25 * 100.0;
    v27 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
    v24 = round(v26 / (double)v27);
  }
  v28 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("com.apple.assetsd.cpl.thumbPercent"));

  v30 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v31, *MEMORY[0x1E0D73AA8]);

  if (atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24)))
  {
    v33 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 64));
    v34 = (double)v33 * 100.0;
    v35 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
    v23 = round(v34 / (double)v35);
  }
  v36 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)v23);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("com.apple.assetsd.cpl.mediumPercent"));

  v38 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", v39, *MEMORY[0x1E0D73978]);

  v40 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
  v41 = 0.0;
  v42 = 0.0;
  if (v40)
  {
    v43 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 72));
    v44 = (double)v43 * 100.0;
    v45 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
    v42 = round(v44 / (double)v45);
  }
  v46 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKey:", v47, CFSTR("com.apple.assetsd.cpl.localMediumOrOriginalPercent"));

  v48 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKey:", v49, *MEMORY[0x1E0D73948]);

  if (atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24)))
  {
    v51 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 80));
    v52 = (double)v51 * 100.0;
    v53 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 32));
    v41 = round(v52 / (double)v53);
  }
  v54 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)v41);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKey:", v55, CFSTR("com.apple.assetsd.cpl.localMediumOrOriginalPercent.photo"));

  v56 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKey:", v57, *MEMORY[0x1E0D73950]);

  if (atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24)))
  {
    v59 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 88));
    v60 = (double)v59 * 100.0;
    v61 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 40));
    v62 = round(v60 / (double)v61);
  }
  else
  {
    v62 = 0.0;
  }
  v63 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v64, CFSTR("com.apple.assetsd.cpl.localMediumOrOriginalPercent.video"));

  v65 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKey:", v66, *MEMORY[0x1E0D73958]);

  v67 = (void *)MEMORY[0x1E0CB37E8];
  v68 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(v67, "numberWithUnsignedLongLong:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0D73A10]);

  v70 = (void *)MEMORY[0x1E0CB37E8];
  v71 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(v70, "numberWithUnsignedLongLong:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D73A30]);

  v73 = (void *)MEMORY[0x1E0CB37E8];
  v74 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(v73, "numberWithUnsignedLongLong:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v75, *MEMORY[0x1E0D73A20]);

  v76 = (void *)MEMORY[0x1E0CB37E8];
  v77 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 120));
  objc_msgSend(v76, "numberWithUnsignedLongLong:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v78, *MEMORY[0x1E0D73A18]);

  v79 = (void *)MEMORY[0x1E0CB37E8];
  v80 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(v79, "numberWithUnsignedLongLong:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v81, *MEMORY[0x1E0D73A38]);

  v82 = (void *)MEMORY[0x1E0CB37E8];
  v83 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 136));
  objc_msgSend(v82, "numberWithUnsignedLongLong:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v84, *MEMORY[0x1E0D73A28]);

  v85 = (void *)MEMORY[0x1E0CB37E8];
  v86 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(v85, "numberWithUnsignedLongLong:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v87, *MEMORY[0x1E0D73A40]);

  v88 = (void *)MEMORY[0x1E0CB37E8];
  v89 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(v88, "numberWithUnsignedLongLong:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v90, *MEMORY[0x1E0D73A50]);

  v91 = (void *)MEMORY[0x1E0CB37E8];
  v92 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 160));
  objc_msgSend(v91, "numberWithUnsignedLongLong:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v93, *MEMORY[0x1E0D73A48]);

  v94 = (void *)MEMORY[0x1E0CB3940];
  v95 = *(void **)(a1 + 40);
  v96 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(v94, "stringWithFormat:", CFSTR("%lld"), v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setObject:forKey:", v97, CFSTR("com.apple.assetsd.cpl.resourcesPurgedInTheLastDay.count"));

  v98 = (void *)MEMORY[0x1E0CB3940];
  v99 = *(void **)(a1 + 40);
  v100 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(v98, "stringWithFormat:", CFSTR("%lld"), v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setObject:forKey:", v101, CFSTR("com.apple.assetsd.cpl.resourcesPurgedInTheLastWeek.count"));

  v102 = (void *)MEMORY[0x1E0CB3940];
  v103 = *(void **)(a1 + 40);
  v104 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(v102, "stringWithFormat:", CFSTR("%lld"), v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setObject:forKey:", v105, CFSTR("com.apple.assetsd.cpl.resourcesPurgedInTheLastMonth.count"));

  v106 = (void *)MEMORY[0x1E0CB3940];
  v107 = *(void **)(a1 + 40);
  v108 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 120));
  objc_msgSend(v106, "stringWithFormat:", CFSTR("%lld"), v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setObject:forKey:", v109, CFSTR("com.apple.assetsd.cpl.resourcesPurgedInTheLastDay.size"));

  v110 = (void *)MEMORY[0x1E0CB3940];
  v111 = *(void **)(a1 + 40);
  v112 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(v110, "stringWithFormat:", CFSTR("%lld"), v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setObject:forKey:", v113, CFSTR("com.apple.assetsd.cpl.resourcesPurgedInTheLastWeek.size"));

  v114 = (void *)MEMORY[0x1E0CB3940];
  v115 = *(void **)(a1 + 40);
  v116 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 136));
  objc_msgSend(v114, "stringWithFormat:", CFSTR("%lld"), v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setObject:forKey:", v117, CFSTR("com.apple.assetsd.cpl.resourcesPurgedInTheLastMonth.size"));

  v118 = (void *)MEMORY[0x1E0CB3940];
  v119 = *(void **)(a1 + 40);
  v120 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(v118, "stringWithFormat:", CFSTR("%lld"), v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setObject:forKey:", v121, CFSTR("com.apple.assetsd.cpl.resourcesPurgedWithinDayOfPrefetch.count"));

  v122 = (void *)MEMORY[0x1E0CB3940];
  v123 = *(void **)(a1 + 40);
  v124 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(v122, "stringWithFormat:", CFSTR("%lld"), v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setObject:forKey:", v125, CFSTR("com.apple.assetsd.cpl.resourcesPurgedWithinWeekOfPrefetch.count"));

  v126 = (void *)MEMORY[0x1E0CB3940];
  v127 = *(void **)(a1 + 40);
  v128 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 160));
  objc_msgSend(v126, "stringWithFormat:", CFSTR("%lld"), v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setObject:forKey:", v129, CFSTR("com.apple.assetsd.cpl.resourcesPurgedWithinMonthOfPrefetch.count"));

  v130 = (void *)MEMORY[0x1E0CB3940];
  v131 = *(void **)(a1 + 40);
  v132 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 176));
  objc_msgSend(v130, "stringWithFormat:", CFSTR("%lld"), v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setObject:forKey:", v133, CFSTR("com.apple.mobileslideshow.sharedlibrary.assetcount"));

  v134 = (void *)MEMORY[0x1E0CB3940];
  v135 = *(void **)(a1 + 40);
  v136 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 168));
  objc_msgSend(v134, "stringWithFormat:", CFSTR("%lld"), v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setObject:forKey:", v137, CFSTR("com.apple.mobileslideshow.personallibrary.assetcount"));

  v138 = (void *)MEMORY[0x1E0CB3940];
  v139 = *(void **)(a1 + 40);
  v140 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 184));
  objc_msgSend(v138, "stringWithFormat:", CFSTR("%lld"), v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setObject:forKey:", v141, CFSTR("com.apple.mobileslideshow.sharedlibrary.assetaddedmanuallycount"));

  v142 = (void *)MEMORY[0x1E0CB3940];
  v143 = *(void **)(a1 + 40);
  v144 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 192));
  objc_msgSend(v142, "stringWithFormat:", CFSTR("%lld"), v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "setObject:forKey:", v145, CFSTR("com.apple.mobileslideshow.sharedlibrary.assetaddedincameracount"));

  v146 = (void *)MEMORY[0x1E0CB3940];
  v147 = *(void **)(a1 + 40);
  v148 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 200));
  objc_msgSend(v146, "stringWithFormat:", CFSTR("%lld"), v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKey:", v149, CFSTR("com.apple.mobileslideshow.sharedlibrary.assetaddedinsuggestionscount"));

  v174 = (id)MGCopyAnswer();
  objc_msgSend(v174, "objectForKey:", *MEMORY[0x1E0DE2CB8]);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend(v150, "longLongValue");

  v152 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v151);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setValue:forKey:", v153, CFSTR("totalStorage"));

  v154 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v151);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "setObject:forKey:", v155, *MEMORY[0x1E0D73AC0]);

  objc_msgSend(v174, "objectForKey:", *MEMORY[0x1E0DE2CA0]);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v156, "longLongValue");

  v158 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v157);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setValue:forKey:", v159, CFSTR("availableStorage"));

  v160 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v157);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setObject:forKey:", v161, *MEMORY[0x1E0D73890]);

  v162 = MEMORY[0x19AEC0720]();
  v163 = &stru_1E36789C0;
  if (v162)
    v163 = CFSTR("unitTest-");
  v164 = v163;
  if (*(_BYTE *)(a1 + 72) && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_opt_class();
    v165 = *(id *)(a1 + 56);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v166 = v165;
    else
      v166 = 0;
    v167 = v166;

    objc_msgSend(v167, "pl_libraryBundle");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCPLSettings settingsWithLibraryBundle:](PLCPLSettings, "settingsWithLibraryBundle:", v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    v170 = objc_msgSend(v169, "isKeepOriginalsEnabled");
    v171 = CFSTR("icplOpt-");
    if (v170)
      v171 = CFSTR("icplOrg-");
    v172 = v171;

    v164 = v172;
  }
  v173 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  objc_msgSend(*(id *)(a1 + 64), "_addPrefix:toKeysInDictionary:inPrefixedDictionary:", v164, *(_QWORD *)(a1 + 40), v173);
  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v173);

}

void __103__PLAggdLogging_configureEnumeratorForLibrarySizeLogging_cloudPhotoLibraryEnabled_dataForCA_dataForCK___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  +[PLPhotoLibrary savedPhotosOriginalsSizeWithSizeDataRef:](PLPhotoLibrary, "savedPhotosOriginalsSizeWithSizeDataRef:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("originalLibrarySize"));

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, *MEMORY[0x1E0D73990]);
  +[PLPhotoLibrary savedPhotosReferenceMediaSizeWithSizeDataRef:](PLPhotoLibrary, "savedPhotosReferenceMediaSizeWithSizeDataRef:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("referenceMediaSize"));

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, *MEMORY[0x1E0D73A08]);
}

void __68__PLAggdLogging__addPrefix_toKeysInDictionary_inPrefixedDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v6, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v8);

}

uint64_t __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v2, "_analyticsDescriptionForMediaAge:");
}

uint64_t __58__PLAggdLogging_performSlideshowProjectStatisticsLogging___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_analyticsDescriptionForAssetCount:", objc_msgSend(a2, "integerValue"));
}

@end
