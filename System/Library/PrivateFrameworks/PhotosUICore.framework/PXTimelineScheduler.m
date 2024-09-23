@implementation PXTimelineScheduler

- (PXTimelineScheduler)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTimelineScheduler.m"), 43, CFSTR("%s is not available as initializer"), "-[PXTimelineScheduler init]");

  abort();
}

- (PXTimelineScheduler)initWithTimelineDataSource:(id)a3
{
  id v4;
  PXTimelineScheduler *v5;
  PXTimelineScheduler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXTimelineScheduler;
  v5 = -[PXTimelineScheduler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PXTimelineScheduler setTimelineDataSource:](v5, "setTimelineDataSource:", v4);

  return v6;
}

- (id)scheduledTimelineEntriesWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineScheduler _scheduledTimelineEntriesWithOptions:atDate:](self, "_scheduledTimelineEntriesWithOptions:atDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_initTimelineEntriesAtDate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v20[16];

  v6 = a4;
  v7 = a3;
  -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "memories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineScheduler _timelineEntriesFromAssetCollections:](self, "_timelineEntriesFromAssetCollections:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineScheduler setMemoryTimelineEntries:](self, "setMemoryTimelineEntries:", v10);

  objc_msgSend(v8, "featuredPhotos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineScheduler _timelineEntriesFromAssetCollections:](self, "_timelineEntriesFromAssetCollections:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTimelineScheduler setFeaturedPhotoTimelineEntries:](self, "setFeaturedPhotoTimelineEntries:", v12);

  -[PXTimelineScheduler _findBestContentAndRemoveFromSourceAtDate:options:](self, "_findBestContentAndRemoveFromSourceAtDate:options:", v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXTimelineScheduler setBestContent:](self, "setBestContent:", v13);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXTimelineScheduler featuredPhotoTimelineEntries](self, "featuredPhotoTimelineEntries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  -[PXTimelineScheduler memoryTimelineEntries](self, "memoryTimelineEntries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v16);

  -[PXTimelineScheduler setTimelineCandidates:](self, "setTimelineCandidates:", v14);
  if (objc_msgSend(v14, "count"))
  {
    -[PXTimelineScheduler bestContent](self, "bestContent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
      PXAssertGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Missing entries for best content", v20, 2u);
      }

    }
  }

}

- (id)_scheduledTimelineEntriesWithOptions:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  long double v34;
  NSObject *v35;
  double v36;
  int64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  os_signpost_id_t v44;
  int64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint8_t buf[4];
  double v51;
  __int16 v52;
  int64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLTimelineGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ScheduleTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[PXTimelineScheduler _initTimelineEntriesAtDate:options:](self, "_initTimelineEntriesAtDate:options:", v7, v6);
  -[PXTimelineScheduler timelineCandidates](self, "timelineCandidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject memories](v13, "memories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "creationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v49 = v13;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      -[NSObject featuredPhotos](v13, "featuredPhotos");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "creationDate");
      v18 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startOfDayForDate:", v18);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startOfDayForDate:", v7);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v27;
    objc_msgSend(v26, "components:fromDate:toDate:options:", 16, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "day");

    PLMemoriesGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v51 = *(double *)&v29;
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEBUG, "Timeline - day difference: %ld", buf, 0xCu);
    }

    -[PXTimelineScheduler _timelineEntryByBestContentIntervalAtDate:numberOfDays:options:](self, "_timelineEntryByBestContentIntervalAtDate:numberOfDays:options:", v7, 2, v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestContentEntryDuration");
    v33 = v32 * (double)(unint64_t)objc_msgSend(v31, "count") * -0.5 + 86400.0;
    objc_msgSend(v6, "timelineEntryDuration");
    if (fmod(v33, v34) != 0.0)
    {
      PXAssertGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "timelineEntryDuration");
        *(_DWORD *)buf = 134218240;
        v51 = v33;
        v52 = 2048;
        v53 = v46;
        _os_log_error_impl(&dword_1A6789000, v35, OS_LOG_TYPE_ERROR, "Candidates duration %.f must be divisible by timeline entry duration %.f", buf, 0x16u);
      }

    }
    objc_msgSend(v6, "timelineEntryDuration");
    v37 = -[PXTimelineScheduler _startOfDayIndexWithOffsetDay:entriesCount:perDayLimit:options:](self, "_startOfDayIndexWithOffsetDay:entriesCount:perDayLimit:options:", v29, v12, (uint64_t)(v33 / v36), v6);
    PLMemoriesGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", objc_msgSend(v6, "timelineForSize"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v51 = *(double *)&v39;
      v52 = 2048;
      v53 = v37;
      v54 = 2048;
      v55 = v12;
      _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_DEBUG, "Scheduler start of day index for [%@]: %zd, candidates count: %tu", buf, 0x20u);

    }
    -[PXTimelineScheduler _timelineAtDate:startOfDayCandidatesIndex:timelineEntryByBestContentInterval:options:](self, "_timelineAtDate:startOfDayCandidatesIndex:timelineEntryByBestContentInterval:options:", v7, v37, v31, v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTimelineScheduler _coalesceRepeatedTimelineEntries:](self, "_coalesceRepeatedTimelineEntries:", v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setStartTime:", v7);

    PLTimelineGetLog();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v43 = os_signpost_id_make_with_pointer(v42, self);
    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v44 = v43;
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v42, OS_SIGNPOST_INTERVAL_END, v44, "ScheduleTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v23 = v49;
  }
  else
  {
    PLMemoriesGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "No timeline candidates", buf, 2u);
    }

    PLTimelineGetLog();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_make_with_pointer(v18, self);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v21 = v20;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v21, "ScheduleTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }
    v22 = (void *)MEMORY[0x1E0C9AA60];
    v23 = v18;
  }

  return v22;
}

- (id)_findBestContentAndRemoveFromSourceAtDate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "memories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[PXTimelineScheduler _sortedTimelineEntriesForMemoriesAtDate:](self, "_sortedTimelineEntriesForMemoriesAtDate:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bestContentStartTimeHours");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = objc_msgSend(v11, "count");
    if (v13 >= v14)
      v15 = v14;
    else
      v15 = v13;
    objc_msgSend(v11, "subarrayWithRange:", 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    v18 = objc_msgSend(v7, "timelineIndex");
    v19 = v18 % objc_msgSend(v17, "count");
    PLMemoriesGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", objc_msgSend(v7, "timelineForSize"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v21;
      v42 = 2048;
      v43 = v19;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "[%@] best content rotation: %tu", buf, 0x16u);

    }
    while (v19)
    {
      --v19;
      objc_msgSend(v17, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v22);

      objc_msgSend(v17, "removeObjectAtIndex:", 0);
    }
    -[PXTimelineScheduler memoryTimelineEntries](self, "memoryTimelineEntries");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    -[PXTimelineScheduler featuredPhotoTimelineEntries](self, "featuredPhotoTimelineEntries");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count") + v24;

    if (v26 < 0xB)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[PXTimelineScheduler memoryTimelineEntries](self, "memoryTimelineEntries", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v36 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            if (objc_msgSend(v17, "containsObject:", v33))
              objc_msgSend(v33, "setProactiveCriterion:", 0);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v30);
      }
    }
    else
    {
      -[PXTimelineScheduler memoryTimelineEntries](self, "memoryTimelineEntries");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "mutableCopy");

      objc_msgSend(v28, "removeObjectsInArray:", v17);
      -[PXTimelineScheduler setMemoryTimelineEntries:](self, "setMemoryTimelineEntries:", v28);
    }

  }
  else
  {
    -[PXTimelineScheduler _findBestFeaturedPhotoAndRemoveFromSource](self, "_findBestFeaturedPhotoAndRemoveFromSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_findBestFeaturedPhotoAndRemoveFromSource
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PXTimelineScheduler featuredPhotoTimelineEntries](self, "featuredPhotoTimelineEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXTimelineScheduler memoryTimelineEntries](self, "memoryTimelineEntries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[PXTimelineScheduler featuredPhotoTimelineEntries](self, "featuredPhotoTimelineEntries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") + v6;

    if (v8 >= 0xB)
    {
      -[PXTimelineScheduler featuredPhotoTimelineEntries](self, "featuredPhotoTimelineEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "removeObjectAtIndex:", 0);
      -[PXTimelineScheduler setFeaturedPhotoTimelineEntries:](self, "setFeaturedPhotoTimelineEntries:", v10);

    }
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)_sortedTimelineEntriesForMemoriesAtDate:(id)a3
{
  id v4;
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
  PXTimelineEntry *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__PXTimelineScheduler__sortedTimelineEntriesForMemoriesAtDate___block_invoke;
  v29[3] = &unk_1E512ED18;
  v21 = v4;
  v30 = v21;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "keyAssetByMemoryLocalIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = -[PXTimelineEntry initWithMemory:andMemoryKeyAsset:]([PXTimelineEntry alloc], "initWithMemory:andMemoryKeyAsset:", v12, v16);
        if (v17)
          objc_msgSend(v24, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v24, "count") == 1)
  {
    objc_msgSend(v24, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v24, "addObject:", v19);

  }
  return v24;
}

- (id)_timelineEntriesFromAssetCollections:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
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
  void *v19;
  void *v20;
  uint64_t v21;
  PXTimelineEntry *v22;
  PXTimelineEntry *v23;
  void *v24;
  PXTimelineEntry *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    v7 = 0x1E0CD1000uLL;
    do
    {
      v8 = 0;
      v31 = v5;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v6;
          v11 = v7;
          -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "keyAssetByFeaturedPhotoLocalIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "suggestedCropByFeaturedPhotoLocalIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "sourceType");
          v22 = [PXTimelineEntry alloc];
          v23 = v22;
          if (v21 == 1)
          {
            objc_msgSend(v20, "sourceIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[PXTimelineEntry initWithAlbumFeaturedPhoto:localAlbumIdentifier:andFeaturedPhotoKeyAsset:suggestedCrop:](v23, "initWithAlbumFeaturedPhoto:localAlbumIdentifier:andFeaturedPhotoKeyAsset:suggestedCrop:", v9, v24, v15, v19);

          }
          else
          {
            v25 = -[PXTimelineEntry initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:suggestedCrop:](v22, "initWithFeaturedPhoto:andFeaturedPhotoKeyAsset:suggestedCrop:", v9, v15, v19);
          }

          v7 = v11;
          v6 = v10;
          v5 = v31;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_15;
          -[PXTimelineScheduler timelineDataSource](self, "timelineDataSource");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "keyAssetByMemoryLocalIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = -[PXTimelineEntry initWithMemory:andMemoryKeyAsset:]([PXTimelineEntry alloc], "initWithMemory:andMemoryKeyAsset:", v9, v15);
        }

        if (v25)
        {
          objc_msgSend(v30, "addObject:", v25);

        }
LABEL_15:
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v5);
  }

  return v30;
}

- (id)_timelineEntryByBestContentIntervalAtDate:(id)a3 numberOfDays:(int64_t)a4 options:(id)a5
{
  id v7;
  id v8;
  double v9;
  long double v10;
  long double v11;
  long double v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  PXTimelineScheduler *v38;
  void *v39;
  id v40;
  int64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  __int128 v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  unint64_t v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  long double v66;
  __int16 v67;
  long double v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "bestContentEntryDuration");
  v10 = v9;
  objc_msgSend(v8, "timelineEntryDuration");
  v12 = v11;
  if (fmod(v10, v11) != 0.0)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v66 = v12;
      v67 = 2048;
      v68 = v10;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "timeline entry duration, %.f, must be divisible by best content duration, %.f", buf, 0x16u);
    }

  }
  objc_msgSend(v8, "bestContentStartTimeHours");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v51 = v8;
    v52 = v7;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v50 = v14;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v61 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if (objc_msgSend(v20, "integerValue") < 0 || objc_msgSend(v20, "integerValue") >= 24)
          {
            PXAssertGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v66 = *(double *)&v20;
              _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "invalid best content start time hour, must be in 24hr format: %@", buf, 0xCu);
            }

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v17);
    }

    -[PXTimelineScheduler bestContent](self, "bestContent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    v24 = objc_msgSend(v15, "count");
    if (v23 >= v24)
      v25 = v24;
    else
      v25 = v23;
    v26 = a4;
    v27 = v25 * a4;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v25 * a4);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v49 = objc_claimAutoreleasedReturnValue();
    -[NSObject startOfDayForDate:](v49, "startOfDayForDate:", v52);
    v53 = v27;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v30 = 0;
      *(_QWORD *)&v29 = 138412290;
      v48 = v29;
      do
      {
        v59 = v30;
        v31 = v30 / v26;
        objc_msgSend(v15, "objectAtIndexedSubscript:", v30 / v26, v48);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (double)objc_msgSend(v32, "integerValue") * 3600.0;
        if (fmod(v33, v12) != 0.0)
        {
          PXAssertGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v48;
            v66 = *(double *)&v32;
            _os_log_error_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "best content entry start hour, %@, must align with timeline entry start", buf, 0xCu);
          }

          v26 = a4;
        }
        v58 = v32;
        objc_msgSend(v54, "dateByAddingTimeInterval:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v35, (double)v10);
        -[PXTimelineScheduler bestContent](self, "bestContent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v31);
        v38 = self;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)v36;
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v39, v36);

        v40 = v35;
        v56 = v40;
        v41 = a4 - 1;
        if ((unint64_t)v26 >= 2)
        {
          do
          {
            objc_msgSend(v40, "dateByAddingTimeInterval:", 86400.0);
            v42 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v42, (double)v10);
            -[PXTimelineScheduler bestContent](v38, "bestContent");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectAtIndexedSubscript:", v31);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v45, v43);

            v40 = (id)v42;
            --v41;
          }
          while (v41);
        }

        v26 = a4;
        v30 = v59 + a4;
        self = v38;
      }
      while (v59 + a4 < v53);
    }

    v8 = v51;
    v7 = v52;
    v46 = v49;
    v14 = v50;
  }
  else
  {
    if (!objc_msgSend(v14, "count"))
    {
      v28 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_36;
    }
    PXAssertGetLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v46, OS_LOG_TYPE_ERROR, "bestContentStartTimeHours array is empty", buf, 2u);
    }
    v28 = (void *)MEMORY[0x1E0C9AA70];
  }

LABEL_36:
  return v28;
}

- (int64_t)_startOfDayIndexWithOffsetDay:(int64_t)a3 entriesCount:(int64_t)a4 perDayLimit:(int64_t)a5 options:(id)a6
{
  id v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;

  v9 = a6;
  v10 = objc_msgSend(v9, "numberOfTimelines");
  v11 = 0;
  if (a4 && a5 && v10)
  {
    if (a3)
    {
      if (a3 >= 0)
        v12 = a3;
      else
        v12 = -a3;
      v13 = a5 % a4;
      do
      {
        v13 = (v13 + a5) % a4;
        --v12;
      }
      while (v12);
      if (a3 >= 0)
        a3 = v13 - a5 % a4;
      else
        a3 = a5 % a4 - v13;
    }
    v11 = ((uint64_t)(objc_msgSend(v9, "timelineIndex") * a4 / v10 + a3) % a4 + a4) % a4;
  }

  return v11;
}

- (id)_timelineAtDate:(id)a3 startOfDayCandidatesIndex:(int64_t)a4 timelineEntryByBestContentInterval:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  PXTimelineScheduler *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v39 = self;
  -[PXTimelineScheduler timelineCandidates](self, "timelineCandidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v12, "count");

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "startOfDayForDate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v41 = v10;
  objc_msgSend(v10, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v16;
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v11;
  objc_msgSend(v11, "timelineEntryDuration");
  v19 = v18;
  v45 = v9;
  objc_msgSend(v9, "dateByAddingTimeInterval:", 86400.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = v20;
  if (objc_msgSend(v20, "compare:", v14) == 1)
  {
    v44 = 0;
    v21 = 0x1E0CB3000uLL;
    v22 = v40;
    do
    {
      objc_msgSend(v13, "dateByAddingTimeInterval:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_msgSend(objc_alloc(*(Class *)(v21 + 1416)), "initWithStartDate:endDate:", v13, v23);
      objc_msgSend(v24, "intersectionWithDateInterval:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "duration");
      if (v26 <= 0.0)
      {
        if (objc_msgSend(v45, "compare:", v23) == -1)
        {
          -[PXTimelineScheduler timelineCandidates](v39, "timelineCandidates");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndex:", a4);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v35, "copy");

          v22 = v40;
        }
        else
        {
          v29 = 0;
        }
        a4 = (a4 + 1) % v22;
        if (!v29)
          goto LABEL_17;
      }
      else
      {
        objc_msgSend(v17, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "laterDate:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v45, "compare:", v28) == -1)
        {
          objc_msgSend(v41, "objectForKeyedSubscript:", v17);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v30, "copy");

        }
        else
        {
          v29 = 0;
        }
        v31 = objc_msgSend(v42, "count");
        if (v44 + 1 < (unint64_t)(v31 - 1))
          v32 = v44 + 1;
        else
          v32 = v31 - 1;
        v44 = v32;
        objc_msgSend(v42, "objectAtIndexedSubscript:", v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v33;
        v23 = (void *)v28;
        v21 = 0x1E0CB3000;
        if (!v29)
          goto LABEL_17;
      }
      objc_msgSend(v29, "setStartTime:", v13);
      objc_msgSend(v29, "setEndTime:", v23);
      objc_msgSend(v43, "addObject:", v29);
LABEL_17:
      v14 = v23;

      v13 = v14;
    }
    while (objc_msgSend(v46, "compare:", v14) == 1);
  }

  return v43;
}

- (id)_coalesceRepeatedTimelineEntries:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        objc_msgSend(v4, "localIdentifier", (_QWORD)v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (!v14)
        {
          objc_msgSend(v5, "addObject:", v4);
          v17 = v4;
          v4 = v11;
          goto LABEL_10;
        }
        objc_msgSend(v11, "endTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setEndTime:", v15);

        objc_msgSend(v4, "proactiveCriterion");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v11, "proactiveCriterion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v11, "proactiveCriterion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setProactiveCriterion:", v17);
          goto LABEL_10;
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v8 = v19;
    }
    while (v19);
  }

  objc_msgSend(v5, "lastObject");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v20)
    objc_msgSend(v5, "addObject:", v4);

  return v5;
}

- (PXTimelineDataSource)timelineDataSource
{
  return self->_timelineDataSource;
}

- (void)setTimelineDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_timelineDataSource, a3);
}

- (NSArray)memoryTimelineEntries
{
  return self->_memoryTimelineEntries;
}

- (void)setMemoryTimelineEntries:(id)a3
{
  objc_storeStrong((id *)&self->_memoryTimelineEntries, a3);
}

- (NSArray)featuredPhotoTimelineEntries
{
  return self->_featuredPhotoTimelineEntries;
}

- (void)setFeaturedPhotoTimelineEntries:(id)a3
{
  objc_storeStrong((id *)&self->_featuredPhotoTimelineEntries, a3);
}

- (NSArray)bestContent
{
  return self->_bestContent;
}

- (void)setBestContent:(id)a3
{
  objc_storeStrong((id *)&self->_bestContent, a3);
}

- (NSArray)timelineCandidates
{
  return self->_timelineCandidates;
}

- (void)setTimelineCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_timelineCandidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineCandidates, 0);
  objc_storeStrong((id *)&self->_bestContent, 0);
  objc_storeStrong((id *)&self->_featuredPhotoTimelineEntries, 0);
  objc_storeStrong((id *)&self->_memoryTimelineEntries, 0);
  objc_storeStrong((id *)&self->_timelineDataSource, 0);
}

uint64_t __63__PXTimelineScheduler__sortedTimelineEntriesForMemoriesAtDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "relevanceScoreAtDate:", *(_QWORD *)(a1 + 32));
  v8 = v7;
  objc_msgSend(v6, "relevanceScoreAtDate:", *(_QWORD *)(a1 + 32));
  if (v8 == v9)
  {
    objc_msgSend(v6, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

  }
  else if (v8 < v9)
  {
    v12 = 1;
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

@end
