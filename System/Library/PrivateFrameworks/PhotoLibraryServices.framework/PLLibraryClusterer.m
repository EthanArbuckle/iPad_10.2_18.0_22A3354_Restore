@implementation PLLibraryClusterer

+ (void)initialize
{
  void *v2;
  void *v3;
  objc_super v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PLLibraryClusterer;
  objc_msgSendSuper2(&v4, sel_initialize);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("PLLibraryClustererEnableHighlightSplitBasedOnTimeAndLocation");
  v5[1] = CFSTR("PLLibraryClustererEnableHighlightSplitBasedOnLocationType");
  v6[0] = MEMORY[0x1E0C9AAB0];
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("PLLibraryClustererEnableHighlightSplitBasedOnOriginators");
  v6[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v3);

}

+ (BOOL)highlightSplitBasedOnTimeAndLocationEnabled
{
  if (highlightSplitBasedOnTimeAndLocationEnabled_onceToken != -1)
    dispatch_once(&highlightSplitBasedOnTimeAndLocationEnabled_onceToken, &__block_literal_global_96621);
  return highlightSplitBasedOnTimeAndLocationEnabled_highlightSplitBasedOnTimeAndLocationEnabled;
}

+ (BOOL)highlightSplitBasedOnLocationTypeEnabled
{
  if (highlightSplitBasedOnLocationTypeEnabled_onceToken != -1)
    dispatch_once(&highlightSplitBasedOnLocationTypeEnabled_onceToken, &__block_literal_global_7);
  return highlightSplitBasedOnLocationTypeEnabled_highlightSplitBasedOnLocationTypeEnabled;
}

+ (BOOL)highlightSplitBasedOnOriginatorsEnabled
{
  if (highlightSplitBasedOnOriginatorsEnabled_onceToken != -1)
    dispatch_once(&highlightSplitBasedOnOriginatorsEnabled_onceToken, &__block_literal_global_8_96615);
  return highlightSplitBasedOnOriginatorsEnabled_highlightSplitBasedOnOriginatorsEnabled;
}

+ (BOOL)_momentEligibleForSplit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  int v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "localStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;
  v8 = objc_msgSend(v3, "pl_numberOfAssets");
  v9 = objc_msgSend(v3, "processedLocation");

  v10 = v9 == 4 || v7 >= 1800.0 && v8 > 6;
  return v10;
}

void __61__PLLibraryClusterer_highlightSplitBasedOnOriginatorsEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  highlightSplitBasedOnOriginatorsEnabled_highlightSplitBasedOnOriginatorsEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLLibraryClustererEnableHighlightSplitBasedOnOriginators"));

}

void __62__PLLibraryClusterer_highlightSplitBasedOnLocationTypeEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  highlightSplitBasedOnLocationTypeEnabled_highlightSplitBasedOnLocationTypeEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLLibraryClustererEnableHighlightSplitBasedOnLocationType"));

}

void __65__PLLibraryClusterer_highlightSplitBasedOnTimeAndLocationEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  highlightSplitBasedOnTimeAndLocationEnabled_highlightSplitBasedOnTimeAndLocationEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLLibraryClustererEnableHighlightSplitBasedOnTimeAndLocation"));

}

- (PLLibraryClusterer)initWithLocalCreationDateCreator:(id)a3 frequentLocationManager:(id)a4
{
  id v7;
  id v8;
  PLLibraryClusterer *v9;
  PLLibraryClusterer *v10;
  NSCalendar *v11;
  void *v12;
  NSCalendar *calendar;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLLibraryClusterer;
  v9 = -[PLLibraryClusterer init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localCreationDateCreator, a3);
    objc_storeStrong((id *)&v10->_frequentLocationManager, a4);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v11 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v11, "setTimeZone:", v12);

    calendar = v10->_calendar;
    v10->_calendar = v11;

  }
  return v10;
}

- (void)processMomentsWithAssets:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PLLibraryClusterer *v23;
  void *v24;
  PLExistingMomentData *v25;
  void *v26;
  PLExistingMomentData *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  PLClusterTimeInfo *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "logRoutineInformation");

    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetComparisonSortDescriptors");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    v34 = v10;
    v35 = v4;
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PLClusterTimeInfo initWithCalendar:]([PLClusterTimeInfo alloc], "initWithCalendar:", self->_calendar);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      v36 = *(_QWORD *)v42;
      v37 = v13;
      while (2)
      {
        v17 = 0;
        v38 = v15;
        do
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x19AEC1554]();
          if ((objc_msgSend(v18, "isDeleted") & 1) == 0)
          {
            objc_msgSend(v18, "pl_date");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localDateAndCreateIfNeededWithLocalDateCreator:", self->_localCreationDateCreator);
            v21 = objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              PLMomentsGetLog();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v18, "uuid");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v46 = v33;
                _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_FAULT, "Asset dateCreated unexpectedly nil. %{public}@", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v19);

              v31 = v34;
              v4 = v35;
              v30 = v40;
              goto LABEL_24;
            }
            v22 = (void *)v21;
            if (!-[PLClusterTimeInfo utcDateBelongsInCluster:](v39, "utcDateBelongsInCluster:", v20))
            {
              -[PLLibraryClusterer _createMomentsForDailyAssets:currentMomentExistingMomentData:](self, "_createMomentsForDailyAssets:currentMomentExistingMomentData:", v12, v40);
              objc_msgSend(v12, "removeAllObjects");
              objc_msgSend(v40, "removeAllObjects");
              -[PLClusterTimeInfo reset](v39, "reset");
            }
            v23 = self;
            v24 = v12;
            objc_msgSend(v12, "addObject:", v18);
            -[PLClusterTimeInfo updateWithUTCDate:localDate:](v39, "updateWithUTCDate:localDate:", v20, v22);
            v25 = [PLExistingMomentData alloc];
            objc_msgSend(v18, "moment");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[PLExistingMomentData initWithMoment:](v25, "initWithMoment:", v26);

            if (v27)
            {
              objc_msgSend(v40, "member:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (!v28)
              {
                objc_msgSend(v40, "addObject:", v27);
                v28 = v27;
              }
              objc_msgSend(v28, "registerAsset:", v18);

            }
            v12 = v24;
            self = v23;
            v16 = v36;
            v13 = v37;
            v15 = v38;
          }
          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        if (v15)
          continue;
        break;
      }
    }

    v30 = v40;
    -[PLLibraryClusterer _createMomentsForDailyAssets:currentMomentExistingMomentData:](self, "_createMomentsForDailyAssets:currentMomentExistingMomentData:", v12, v40);
    v31 = v34;
    v4 = v35;
LABEL_24:

  }
}

- (id)locationBasedMomentClustersForMomentsSortedByDate:(id)a3
{
  id v4;
  PLMomentCluster *v5;
  void *v6;
  PLMomentCluster *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  PLMomentCluster *v15;
  PLMomentCluster *v16;
  void *v17;
  void *v18;
  PLMomentCluster *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  PLMomentCluster *v43;
  void *v45;
  void *v46;
  id v47;
  PLMomentCluster *obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  PLMomentCluster *v68;
  _BYTE v69[128];
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      v5 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v4);
      v70[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (PLMomentCluster *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (PLMomentCluster *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v62 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(v13, "approximateLocation");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              v15 = v5;
            else
              v15 = v7;
            -[PLMomentCluster addObject:](v15, "addObject:", v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        }
        while (v10);
      }

      if ((unint64_t)-[PLMomentCluster count](v5, "count") > 1)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLLibraryClusterer _momentsSplitOnLocationTypeWithMoments:](self, "_momentsSplitOnLocationTypeWithMoments:", v5);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObjectsFromArray:");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v19 = v17;
        v20 = -[PLMomentCluster countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        obj = v19;
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v58 != v22)
                objc_enumerationMutation(obj);
              v24 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
              v25 = (void *)MEMORY[0x19AEC1554]();
              -[PLLibraryClusterer _momentsSplitBetweenOriginatorsWithMoments:](self, "_momentsSplitBetweenOriginatorsWithMoments:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObjectsFromArray:", v26);

              objc_autoreleasePoolPop(v25);
            }
            v19 = obj;
            v21 = -[PLMomentCluster countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          }
          while (v21);
        }
        v47 = v4;

        -[PLLibraryClusterer _mergeMomentsIntoClustersBasedOnTimeWithMoments:clusters:](self, "_mergeMomentsIntoClustersBasedOnTimeWithMoments:clusters:", v7, v18);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v28 = v18;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v54;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v54 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k);
              v34 = (void *)MEMORY[0x19AEC1554]();
              -[PLLibraryClusterer _momentsSplitWithinDayWithMoments:](self, "_momentsSplitWithinDayWithMoments:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObjectsFromArray:", v35);

              objc_autoreleasePoolPop(v34);
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
          }
          while (v30);
        }
        v45 = v28;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v36 = v27;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v50;
          do
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v50 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v40);
              v42 = (void *)MEMORY[0x19AEC1554](v37);
              v43 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v41, v45);
              if (v43)
                objc_msgSend(v6, "addObject:", v43);

              objc_autoreleasePoolPop(v42);
              ++v40;
            }
            while (v38 != v40);
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
            v38 = v37;
          }
          while (v37);
        }

        v4 = v47;
        v16 = obj;
      }
      else
      {
        v16 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v8);
        v68 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)momentClustersForMomentsSortedByDate:(id)a3 allowLocationSplits:(BOOL)a4 allowExternalSplits:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  char v20;
  void *v21;
  PLMomentCluster *v22;
  PLMomentCluster *v23;
  id v25;
  PLLibraryClusterer *v26;
  id obj;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v5 = a5;
  v28 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v25 = v7;
    v26 = self;
    -[PLLibraryClusterer _momentsGroupedByDayWithMomentsSortedByDate:](self, "_momentsGroupedByDayWithMomentsSortedByDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v8;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x19AEC1554]();
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v14 = v10;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v33 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
                if (!v5
                  || (v20 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "pl_originatorState"),
                      v21 = v12,
                      (v20 & 8) == 0))
                {
                  v21 = v13;
                }
                objc_msgSend(v21, "addObject:", v19);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v16);
          }

          if (objc_msgSend(v12, "count"))
          {
            v22 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v12);
            objc_msgSend(v31, "addObject:", v22);

          }
          if (objc_msgSend(v13, "count"))
          {
            if (v28)
            {
              -[PLLibraryClusterer locationBasedMomentClustersForMomentsSortedByDate:](v26, "locationBasedMomentClustersForMomentsSortedByDate:", v13);
              v23 = (PLMomentCluster *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObjectsFromArray:", v23);
            }
            else
            {
              v23 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v13);
              objc_msgSend(v31, "addObject:", v23);
            }

          }
          objc_autoreleasePoolPop(v11);
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v30);
    }

    v7 = v25;
  }
  else
  {
    v31 = (id)MEMORY[0x1E0C9AA60];
  }

  return v31;
}

- (void)_createMomentsForDailyAssets:(id)a3 currentMomentExistingMomentData:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  PLCompactMomentClustering *v9;
  void *v10;
  void *v11;
  PLCompactMomentClustering *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (objc_msgSend(v16, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dataManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [PLCompactMomentClustering alloc];
    -[PLLibraryClusterer frequentLocationManager](self, "frequentLocationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentFrequentLocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLCompactMomentClustering initWithDataManager:frequentLocations:](v9, "initWithDataManager:frequentLocations:", v8, v11);

    -[PLCompactMomentClustering createAssetClustersForAssetsInDay:](v12, "createAssetClustersForAssetsInDay:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = (id)objc_msgSend(v14, "libraryClusterer:createMomentClustersForAssetClusters:existingMomentDataForAssets:", self, v13, v6);

  }
}

- (void)_mergeMomentsIntoClustersBasedOnTimeWithMoments:(id)a3 clusters:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *context;
  id obj;
  void *v47;
  uint8_t buf[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v37 = v5;
    v8 = v5;
    v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v41)
    {
      v39 = v7;
      v40 = *(_QWORD *)v54;
      v44 = v6;
      v38 = v8;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v54 != v40)
            objc_enumerationMutation(v8);
          v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v10, "startDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "endDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v6, "count"))
            goto LABEL_24;
          v42 = v11;
          v43 = i;
          v13 = 0;
          v14 = 0x7FFFFFFFFFFFFFFFLL;
          v15 = INFINITY;
          do
          {
            context = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            obj = v16;
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v50;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v50 != v19)
                    objc_enumerationMutation(obj);
                  v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                  v22 = (void *)MEMORY[0x19AEC1554]();
                  objc_msgSend(v21, "startDate");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "endDate");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v47;
                  objc_msgSend(v23, "timeIntervalSinceDate:", v12);
                  v27 = v26;
                  if (v26 < 0.0)
                  {
                    objc_msgSend(v25, "timeIntervalSinceDate:", v24);
                    if (v28 < 0.0)
                      v27 = 0.0;
                    else
                      v27 = v28;
                  }

                  if (v27 < v15)
                  {
                    v15 = v27;
                    v14 = v13;
                  }

                  objc_autoreleasePoolPop(v22);
                }
                v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v18);
            }

            objc_autoreleasePoolPop(context);
            ++v13;
            v6 = v44;
          }
          while (v13 < objc_msgSend(v44, "count"));
          v8 = v38;
          v7 = v39;
          v11 = v42;
          i = v43;
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_24:
            PLBackendGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Best index not found in moment cluster generation", buf, 2u);
            }

            v14 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v30);

          objc_autoreleasePoolPop(v11);
        }
        v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v41);
    }

    if (objc_msgSend(v8, "count"))
    {
      v31 = 0;
      do
      {
        v32 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "unsignedIntegerValue");

        objc_msgSend(v6, "objectAtIndexedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v33);

        objc_autoreleasePoolPop(v32);
        ++v31;
      }
      while (v31 < objc_msgSend(v8, "count"));
    }

    v5 = v37;
  }
  else
  {
    objc_msgSend(v6, "addObject:", v5);
  }

}

- (BOOL)_shouldSplitMomentsWithTimeDistance:(double)a3 locationDistance:(double)a4
{
  return a3 >= 10800.0 && a3 * -80.0 / 9.0 + 192000.0 <= a4;
}

- (id)_momentsSplitWithinDayWithMoments:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void (**v59)(_QWORD, _QWORD);
  void *v60;
  id obj;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  PLLibraryClusterer *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint64_t *v75;
  _QWORD v76[7];
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  double v102;
  __int16 v103;
  double v104;
  _BYTE v105[128];
  void *v106;
  id v107;
  _QWORD v108[4];

  v108[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v66 = self;
  v56 = v4;
  if ((objc_msgSend((id)objc_opt_class(), "highlightSplitBasedOnTimeAndLocationEnabled") & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v4, "count") > 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localStartDate"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "sortUsingDescriptors:", v9);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0;
      v88 = &v87;
      v89 = 0x3032000000;
      v90 = __Block_byref_object_copy__96706;
      v91 = __Block_byref_object_dispose__96707;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v92 = (id)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      v84 = &v83;
      v85 = 0x2020000000;
      v86 = 0;
      v77 = 0;
      v78 = &v77;
      v79 = 0x3032000000;
      v80 = __Block_byref_object_copy__96706;
      v81 = __Block_byref_object_dispose__96707;
      v82 = 0;
      v11 = MEMORY[0x1E0C809B0];
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke;
      v76[3] = &unk_1E36765C0;
      v76[4] = &v87;
      v76[5] = &v77;
      v76[6] = &v83;
      v12 = (void *)MEMORY[0x19AEC174C](v76);
      v72[0] = v11;
      v72[1] = 3221225472;
      v72[2] = __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke_2;
      v72[3] = &unk_1E36765E8;
      v55 = v10;
      v73 = v55;
      v75 = &v87;
      v62 = v12;
      v74 = v62;
      v59 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v72);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v56;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v105, 16);
      if (v13)
      {
        v63 = *(_QWORD *)v69;
        do
        {
          v14 = 0;
          v64 = v13;
          do
          {
            if (*(_QWORD *)v69 != v63)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v14);
            v16 = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v15, "localStartDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "localEndDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend((id)objc_opt_class(), "_momentEligibleForSplit:", v15);
            v20 = (void *)v78[5];
            if (v20)
              v21 = v19;
            else
              v21 = 0;
            if (v21 == 1 && *((_BYTE *)v84 + 24))
            {
              objc_msgSend(v20, "localStartDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v78[5], "localEndDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v22;
              v24 = v23;
              v25 = v17;
              v26 = v18;
              v65 = v24;
              objc_msgSend(v25, "timeIntervalSinceDate:", v24);
              v28 = v27;
              if (v27 < 0.0)
              {
                objc_msgSend(v67, "timeIntervalSinceDate:", v26);
                v28 = v29;
                if (v29 < 0.0)
                  v28 = 0.0;
              }

              if (v28 >= 10800.0)
              {
                if (v28 >= 21600.0)
                {
                  v45 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v67, "description");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "description");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "stringWithFormat:", CFSTR("[%@ - %@]"), v46, v47);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();

                  v48 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v25, "description");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "description");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "stringWithFormat:", CFSTR("[%@ - %@]"), v49, v50);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  PLMomentsGetLog();
                  v51 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v15, "uuid");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v78[5], "uuid");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v94 = v52;
                    v95 = 2112;
                    v96 = v31;
                    v97 = 2112;
                    v98 = v53;
                    v99 = 2112;
                    v100 = v60;
                    _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Separated moment %@ %@ from moment %@ %@, 6 or more hours apart", buf, 0x2Au);

                  }
                  ((void (**)(_QWORD, void *))v59)[2](v59, v15);
                }
                else
                {
                  objc_msgSend((id)v78[5], "approximateLocation");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "approximateLocation");
                  v30 = objc_claimAutoreleasedReturnValue();
                  v31 = (void *)v30;
                  if (v60
                    && v30
                    && (objc_msgSend(v60, "coordinate"),
                        objc_msgSend(v31, "coordinate"),
                        CLLocationCoordinate2DGetDistanceFrom(),
                        v33 = v32,
                        -[PLLibraryClusterer _shouldSplitMomentsWithTimeDistance:locationDistance:](v66, "_shouldSplitMomentsWithTimeDistance:locationDistance:", v28, v32)))
                  {
                    v34 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v67, "description");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "description");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "stringWithFormat:", CFSTR("[%@ - %@]"), v57, v35);
                    v36 = objc_claimAutoreleasedReturnValue();

                    v37 = (void *)v36;
                    v38 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v25, "description");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "description");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "stringWithFormat:", CFSTR("[%@ - %@]"), v39, v40);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();

                    v41 = v37;
                    PLMomentsGetLog();
                    v42 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v15, "uuid");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend((id)v78[5], "uuid");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413570;
                      v94 = v43;
                      v95 = 2112;
                      v96 = v58;
                      v97 = 2112;
                      v98 = v44;
                      v99 = 2112;
                      v100 = v41;
                      v101 = 2048;
                      v102 = v28 / 3600.0;
                      v103 = 2048;
                      v104 = v33 / 1000.0;
                      _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Separated moment %@ %@ from moment %@ %@, %.1f hours and %.0f km apart", buf, 0x3Eu);

                    }
                    ((void (**)(_QWORD, void *))v59)[2](v59, v15);

                  }
                  else
                  {
                    (*((void (**)(id, void *, uint64_t))v62 + 2))(v62, v15, 1);
                  }
                }

              }
              else
              {
                (*((void (**)(id, void *, uint64_t))v62 + 2))(v62, v15, 1);
              }

            }
            else
            {
              (*((void (**)(id, void *))v62 + 2))(v62, v15);
            }

            objc_autoreleasePoolPop(v16);
            ++v14;
          }
          while (v64 != v14);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v105, 16);
        }
        while (v13);
      }

      objc_msgSend(v55, "addObject:", v88[5]);
      v5 = v55;

      _Block_object_dispose(&v77, 8);
      _Block_object_dispose(&v83, 8);
      _Block_object_dispose(&v87, 8);

    }
    else
    {
      v107 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    PLMomentsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Moments split within day is disabled", buf, 2u);
    }

    v7 = (void *)objc_msgSend(v56, "mutableCopy");
    v108[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_momentsSplitOnLocationTypeWithMoments:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void (*v19)(void);
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  _QWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  id v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "highlightSplitBasedOnLocationTypeEnabled") & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v4, "count") > 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLFrequentLocationManager currentFrequentLocations](self->_frequentLocationManager, "currentFrequentLocations");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __61__PLLibraryClusterer__momentsSplitOnLocationTypeWithMoments___block_invoke;
      v46[3] = &unk_1E3676610;
      v10 = v9;
      v47 = v10;
      v41 = (_QWORD *)MEMORY[0x19AEC174C](v46);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v35 = v4;
      v11 = v4;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v43;
        v36 = v8;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v43 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v15);
            v17 = (void *)MEMORY[0x19AEC1554]();
            if ((objc_msgSend((id)objc_opt_class(), "_momentEligibleForSplit:", v16) & 1) != 0)
            {
              -[PLLibraryClusterer _eligibleClusterForMoment:inMomentsByLocationType:](self, "_eligibleClusterForMoment:inMomentsByLocationType:", v16, v10);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                switch(objc_msgSend(v16, "processedLocation"))
                {
                  case 0u:
                  case 8u:
                  case 9u:
                  case 0xAu:
                    v19 = (void (*)(void))v41[2];
                    goto LABEL_18;
                  case 1u:
                  case 5u:
                    +[PLMomentGenerationUtils frequentLocationNearMoment:withFrequentLocations:](PLMomentGenerationUtils, "frequentLocationNearMoment:withFrequentLocations:", v16, v39);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v21;
                    if (v21)
                    {
                      objc_msgSend(v21, "centroid");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "pl_location");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v23)
                      {
                        objc_msgSend(v40, "centroid");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v24, "pl_location");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v37, "objectForKeyedSubscript:", v25);
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v18)
                        {
                          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                          v18 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v37, "setObject:forKeyedSubscript:", v18, v25);
                        }

                      }
                      else
                      {
                        PLMomentsGetLog();
                        v26 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                        {
                          objc_msgSend(v40, "centroid");
                          v27 = objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v49 = v40;
                          v50 = 2112;
                          v51 = v27;
                          v28 = (void *)v27;
                          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "[MomentsGeneration] matchedFrequentLocation (%@) centroid (%@) pl_location found to be nil.", buf, 0x16u);

                        }
                        ((void (*)(_QWORD *, uint64_t))v41[2])(v41, 5);
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      v8 = v36;
                    }
                    else
                    {
                      ((void (*)(_QWORD *, uint64_t))v41[2])(v41, 5);
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    if (!v18)
                      goto LABEL_35;
                    break;
                  case 2u:
                  case 7u:
                    v20 = v8;
                    goto LABEL_25;
                  case 3u:
                  case 4u:
                  case 6u:
                    v19 = (void (*)(void))v41[2];
LABEL_18:
                    v19();
                    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
                    v18 = v20;
                    if (v20)
                      break;
                    goto LABEL_35;
                  default:
LABEL_35:
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryClusterer.m"), 593, CFSTR("Each moments need a target array"));

                    v18 = 0;
                    break;
                }
              }
              objc_msgSend(v18, "addObject:", v16);

            }
            else
            {
              objc_msgSend(v8, "addObject:", v16);
            }
            objc_autoreleasePoolPop(v17);
            ++v15;
          }
          while (v13 != v15);
          v30 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          v13 = v30;
        }
        while (v30);
      }

      v31 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v10, "allValues");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v32, "mutableCopy");

      objc_msgSend(v37, "allValues");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v33);

      if (objc_msgSend(v8, "count"))
        -[PLLibraryClusterer _mergeMomentsIntoClustersBasedOnTimeWithMoments:clusters:](self, "_mergeMomentsIntoClustersBasedOnTimeWithMoments:clusters:", v8, v5);
      objc_autoreleasePoolPop(v31);

      v4 = v35;
    }
    else
    {
      v53 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    PLMomentsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Moments split on location type is disabled", buf, 2u);
    }

    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    v54[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_eligibleClusterForMoment:(id)a3 inMomentsByLocationType:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__96706;
  v17 = __Block_byref_object_dispose__96707;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PLLibraryClusterer__eligibleClusterForMoment_inMomentsByLocationType___block_invoke;
  v10[3] = &unk_1E3676638;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_momentsSplitBetweenOriginatorsWithMoments:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id obj;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[8];
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  id v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "highlightSplitBasedOnOriginatorsEnabled") & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v3, "count") > 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v9 = v3;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v65 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "originatorState");
            if ((v15 & 0x1C) != 0 && (v15 & 3) == 0)
              v17 = v8;
            else
              v17 = v7;
            objc_msgSend(v17, "addObject:", v14);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        }
        while (v11);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") && objc_msgSend(v7, "count"))
      {
        v43 = v4;
        v44 = v9;
        v46 = v3;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v45 = v8;
        obj = v8;
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v52)
        {
          v50 = *(_QWORD *)v61;
          v51 = v7;
          v49 = v18;
          do
          {
            for (j = 0; j != v52; ++j)
            {
              if (*(_QWORD *)v61 != v50)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
              *(_QWORD *)buf = 0;
              v59 = 0;
              objc_msgSend(v20, "pl_coordinate");
              *(_QWORD *)buf = v21;
              v59 = v22;
              v54 = 0u;
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v23 = v7;
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
              if (v24)
              {
                v25 = v24;
                v53 = j;
                v26 = *(_QWORD *)v55;
                v27 = 1.79769313e308;
                while (2)
                {
                  for (k = 0; k != v25; ++k)
                  {
                    if (*(_QWORD *)v55 != v26)
                      objc_enumerationMutation(v23);
                    v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
                    objc_msgSend(v20, "startDate");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "endDate");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "startDate");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "endDate");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v30;
                    objc_msgSend(v32, "timeIntervalSinceDate:", v31);
                    v36 = v35;
                    if (v35 < 0.0)
                    {
                      objc_msgSend(v34, "timeIntervalSinceDate:", v33);
                      if (v37 >= 0.0)
                        v36 = v37;
                      else
                        v36 = 0.0;
                    }

                    objc_msgSend(v29, "pl_coordinate");
                    CLLocationCoordinate2DGetDistanceFrom();
                    if (v36 <= 300.0)
                    {
                      if (v38 > 10000.0)
                      {

                        v18 = v49;
                        v39 = v49;
                        j = v53;
                        goto LABEL_45;
                      }
                    }
                    else
                    {
                      v27 = fmin(fmax(v38, 1.0) / fmax(v36, 1.0), v27);
                    }
                  }
                  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
                  if (v25)
                    continue;
                  break;
                }

                v18 = v49;
                v39 = v49;
                j = v53;
                if (v27 <= 60.0)
                  v39 = v47;
              }
              else
              {

                v39 = v18;
              }
LABEL_45:
              objc_msgSend(v39, "addObject:", v20);
              v7 = v51;
            }
            v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          }
          while (v52);
        }

        v4 = v43;
        if (objc_msgSend(v18, "count"))
        {
          v40 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v40, "addObjectsFromArray:", v47);
          objc_msgSend(v43, "addObject:", v40);
          objc_msgSend(v43, "addObject:", v18);

        }
        v8 = v45;
        v3 = v46;
        v9 = v44;
      }
      if (!objc_msgSend(v4, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v41);

      }
    }
    else
    {
      v71 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    PLMomentsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Moments split between originators is disabled", buf, 2u);
    }

    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    v72[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_startDateComponentsForMomentCluster:(id)a3
{
  NSCalendar *calendar;
  void *v4;
  void *v5;

  calendar = self->_calendar;
  objc_msgSend(a3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](calendar, "components:fromDate:", 12, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_momentsGroupedByDayWithMomentsSortedByDate:(id)a3
{
  id v4;
  void *v5;
  PLClusterTimeInfo *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v38;
  id v39;
  uint64_t v40;
  PLClusterTimeInfo *v41;
  void *v42;
  uint64_t v43;
  id obj;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLClusterTimeInfo initWithCalendar:]([PLClusterTimeInfo alloc], "initWithCalendar:", self->_calendar);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v52;
    *(_QWORD *)&v8 = 138543362;
    v38 = v8;
    v41 = v6;
    v42 = v5;
    v40 = *(_QWORD *)v52;
    do
    {
      v11 = 0;
      v43 = v9;
      do
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v12, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_26;
        v46 = v13;
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v45 = v12;
        objc_msgSend(v12, "assets");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        if (v17)
        {
          v18 = v17;
          v19 = 0;
          v20 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v48 != v20)
                objc_enumerationMutation(v16);
              v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              objc_msgSend(v22, "dateCreated", v38);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v15, "compare:", v23);

              if (v24 == 1)
              {
                objc_msgSend(v22, "dateCreated");
                v25 = objc_claimAutoreleasedReturnValue();

                v26 = v22;
                v15 = (void *)v25;
                v19 = v26;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
          }
          while (v18);
        }
        else
        {
          v19 = 0;
        }

        objc_msgSend(v19, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pl_date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PLMomentsGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v12 = v45;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v45, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v45, "isDeleted");
          *(_DWORD *)buf = 138544130;
          v56 = v29;
          v57 = 1026;
          v58 = v30;
          v59 = 2112;
          v60 = v14;
          v61 = 2114;
          v62 = v27;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_FAULT, "[MomentsGeneration] Moment start date unexpectedly nil. uuid %{public}@, isDeleted %{public}d. Taking asset date %@ %{public}@", buf, 0x26u);

        }
        if (v14)
        {
          v31 = v14;
        }
        else
        {
          PLMomentsGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v38;
            v56 = v27;
            _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Fallback asset start date nil %{public}@.", buf, 0xCu);
          }

        }
        v6 = v41;
        v5 = v42;
        v10 = v40;
        v9 = v43;
        v13 = v46;
        if (v14)
        {
LABEL_26:
          if (!-[PLClusterTimeInfo utcDateBelongsInCluster:](v6, "utcDateBelongsInCluster:", v14, v38))
          {
            if (objc_msgSend(v5, "count"))
            {
              v33 = (void *)objc_msgSend(v5, "copy");
              objc_msgSend(v39, "addObject:", v33);

              objc_msgSend(v5, "removeAllObjects");
            }
            -[PLClusterTimeInfo reset](v6, "reset");
          }
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v12, "localStartDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLClusterTimeInfo updateWithUTCDate:localDate:](v6, "updateWithUTCDate:localDate:", v14, v34);

        }
        else
        {
          objc_msgSend(v42, "addObject:", v45);
        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v11 != v9);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      v9 = v35;
    }
    while (v35);
  }

  if (objc_msgSend(v5, "count"))
  {
    v36 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v39, "addObject:", v36);

  }
  return v39;
}

- (PLLibraryClustererDelegate)delegate
{
  return (PLLibraryClustererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (PLLocalCreationDateCreator)localCreationDateCreator
{
  return self->_localCreationDateCreator;
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_storeStrong((id *)&self->_localCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __72__PLLibraryClusterer__eligibleClusterForMoment_inMomentsByLocationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "startDate", obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v11;
        objc_msgSend(v13, "timeIntervalSinceDate:", v12);
        v17 = v16;
        if (v16 < 0.0)
        {
          objc_msgSend(v15, "timeIntervalSinceDate:", v14);
          if (v18 < 0.0)
            v17 = 0.0;
          else
            v17 = v18;
        }

        if (v17 >= 1800.0)
        {
          objc_msgSend(*(id *)(a1 + 32), "pl_coordinate");
          objc_msgSend(v10, "pl_coordinate");
          CLLocationCoordinate2DGetDistanceFrom();
          if (v19 >= 500.0)
            continue;
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
        *a4 = 1;
        goto LABEL_16;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

}

id __61__PLLibraryClusterer__momentsSplitOnLocationTypeWithMoments___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  }

  return v4;
}

void __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke(_QWORD *a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "addObject:", v5);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= a3;
}

void __56__PLLibraryClusterer__momentsSplitWithinDayWithMoments___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v8 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  (*(void (**)(void))(a1[5] + 16))();
}

@end
