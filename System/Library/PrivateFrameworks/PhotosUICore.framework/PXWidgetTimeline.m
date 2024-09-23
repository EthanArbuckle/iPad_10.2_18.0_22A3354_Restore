@implementation PXWidgetTimeline

+ (id)timelineFromLibrary:(id)a3 forWidgetSize:(CGSize)a4 timelineSize:(unint64_t)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = -[PXTimelineDataSourceOptions initForWidgetWithSize:]([PXTimelineDataSourceOptions alloc], "initForWidgetWithSize:", width, height);
  objc_msgSend(a1, "timelineFromLibrary:timelineSize:withOptions:", v9, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)timelineFromLibrary:(id)a3 timelineSize:(unint64_t)a4 withOptions:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  PXTimelineScheduler *v19;
  PXTimelineSchedulerOptions *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  os_signpost_id_t v39;
  PXTimelineDataSource *v41;
  void *v42;
  id ptr;
  void *v44;
  void *v45;
  id v46;
  dispatch_group_t group;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  dispatch_group_t v56;
  SEL v57;
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  PLTimelineGetLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, a1);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "GenerateTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v18 = objc_alloc_init(MEMORY[0x1E0D10160]);
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __65__PXWidgetTimeline_timelineFromLibrary_timelineSize_withOptions___block_invoke;
  v53[3] = &unk_1E5117668;
  v46 = v14;
  v54 = v46;
  v48 = v15;
  v55 = v48;
  v57 = a2;
  v58 = a1;
  group = v17;
  v56 = group;
  v42 = v18;
  objc_msgSend(v18, "allConfiguredWidgetsWithCompletion:", v53);
  v41 = -[PXTimelineDataSource initWithPhotoLibrary:options:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:options:", v9, v10);
  v19 = -[PXTimelineScheduler initWithTimelineDataSource:]([PXTimelineScheduler alloc], "initWithTimelineDataSource:", v41);
  v20 = objc_alloc_init(PXTimelineSchedulerOptions);
  if (PFOSVariantHasInternalUI())
  {
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "timelineSchedulerMode");

    +[PXMemoriesRelatedSettings schedulerOptionsFromTimelineSchedulerMode:](PXMemoriesRelatedSettings, "schedulerOptionsFromTimelineSchedulerMode:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    PLMemoriesGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v61 = v22;
      _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "Timeline scheduler mode: %lu", buf, 0xCu);
    }

    v20 = (PXTimelineSchedulerOptions *)v23;
  }
  ptr = a1;
  v25 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(group, v25))
  {
    PLMemoriesGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = (uint64_t)v46;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "WidgetTimeline %@ - failed to get all CHS configurations due to timeout!", buf, 0xCu);
    }

  }
  v44 = v10;
  v45 = v9;
  -[PXTimelineSchedulerOptions updateOptionsForTimelineSize:withTimelineSizes:](v20, "updateOptionsForTimelineSize:withTimelineSizes:", a4, v48);
  PLMemoriesGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = -[PXTimelineSchedulerOptions timelineIndex](v20, "timelineIndex");
    v29 = -[PXTimelineSchedulerOptions numberOfTimelines](v20, "numberOfTimelines");
    *(_DWORD *)buf = 138412802;
    v61 = (uint64_t)v46;
    v62 = 2048;
    v63 = v28;
    v64 = 2048;
    v65 = v29;
    _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEFAULT, "WidgetTimeline %@ - index: %zd, timelines: %zd", buf, 0x20u);
  }

  -[PXTimelineScheduler scheduledTimelineEntriesWithOptions:](v19, "scheduledTimelineEntriesWithOptions:", v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v50 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        PLMemoriesGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v35;
          _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEBUG, "Timeline Entry: %@", buf, 0xCu);
        }

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v32);
  }
  +[PXProactiveSuggester updateProactiveSuggestionsFromTimelineEntries:forTimelineSize:](PXProactiveSuggester, "updateProactiveSuggestionsFromTimelineEntries:forTimelineSize:", v30, a4);
  PLTimelineGetLog();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v38 = os_signpost_id_make_with_pointer(v37, ptr);
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v39 = v38;
    if (os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v37, OS_SIGNPOST_INTERVAL_END, v39, "GenerateTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v30;
}

+ (id)timelineFromLibrary:(id)a3 albumIdentifier:(id)a4 widgetIdentifier:(id)a5 widgetSize:(CGSize)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  PXTimelineDataSource *v13;
  PXTimelineScheduler *v14;
  PXTimelineSchedulerOptions *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v22;
  uint64_t v23;
  uint64_t v24;

  height = a6.height;
  width = a6.width;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (!v11)
    v11 = v10;
  v12 = a3;
  v13 = -[PXTimelineDataSource initWithAlbumLocalIdentifier:widgetIdentifier:widgetSize:photoLibrary:]([PXTimelineDataSource alloc], "initWithAlbumLocalIdentifier:widgetIdentifier:widgetSize:photoLibrary:", v10, v11, v12, width, height);

  v14 = -[PXTimelineScheduler initWithTimelineDataSource:]([PXTimelineScheduler alloc], "initWithTimelineDataSource:", v13);
  v15 = objc_alloc_init(PXTimelineSchedulerOptions);
  if (PFOSVariantHasInternalUI())
  {
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "timelineSchedulerMode");

    +[PXMemoriesRelatedSettings schedulerOptionsFromTimelineSchedulerMode:](PXMemoriesRelatedSettings, "schedulerOptionsFromTimelineSchedulerMode:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    PLMemoriesGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134217984;
      v23 = v17;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "Timeline scheduler mode: %lu", (uint8_t *)&v22, 0xCu);
    }

    v15 = (PXTimelineSchedulerOptions *)v18;
  }
  -[PXTimelineScheduler scheduledTimelineEntriesWithOptions:](v14, "scheduledTimelineEntriesWithOptions:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)timelineFromLibrary:(id)a3
{
  id v3;
  PXTimelineScheduler *v4;
  PXTimelineSchedulerOptions *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  PXTimelineDataSource *v19;
  PXTimelineDataSourceOptions *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = -[PXTimelineDataSourceOptions initWithMemoriesOnly]([PXTimelineDataSourceOptions alloc], "initWithMemoriesOnly");
  v21 = v3;
  v19 = -[PXTimelineDataSource initWithPhotoLibrary:options:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:options:", v3, v20);
  v4 = -[PXTimelineScheduler initWithTimelineDataSource:]([PXTimelineScheduler alloc], "initWithTimelineDataSource:", v19);
  v5 = objc_alloc_init(PXTimelineSchedulerOptions);
  if (PFOSVariantHasInternalUI())
  {
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "timelineSchedulerMode");

    +[PXMemoriesRelatedSettings schedulerOptionsFromTimelineSchedulerMode:](PXMemoriesRelatedSettings, "schedulerOptionsFromTimelineSchedulerMode:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    PLMemoriesGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = v7;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Timeline scheduler mode: %lu", buf, 0xCu);
    }

    v5 = (PXTimelineSchedulerOptions *)v8;
  }
  -[PXTimelineScheduler scheduledTimelineEntriesWithOptions:](v4, "scheduledTimelineEntriesWithOptions:", v5, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        PLMemoriesGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v15;
          _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "Timeline Entry: %@", buf, 0xCu);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  return v10;
}

+ (BOOL)requestForYouWidgetTimelineReloadWithError:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  uint8_t v9[16];

  PLTimelineGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, a1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RequestYouWidgetTimelineReload", " enableTelemetry=YES ", v9, 2u);
    }
  }

  return objc_msgSend(a1, "_requesWidgetTimelineReloadForWidgetKind:withError:", CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), a3);
}

+ (BOOL)requestAlbumWidgetTimelineReloadWithError:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  uint8_t v9[16];

  PLTimelineGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, a1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RequestAlbumWidgetTimelineReload", " enableTelemetry=YES ", v9, 2u);
    }
  }

  return objc_msgSend(a1, "_requesWidgetTimelineReloadForWidgetKind:withError:", CFSTR("com.apple.mobileslideshow.PhotosReliveWidget.collections"), a3);
}

+ (void)requestReloadForAllWidgetTimelines
{
  objc_msgSend(a1, "requestForYouWidgetTimelineReloadWithError:", 0);
  objc_msgSend(a1, "requestAlbumWidgetTimelineReloadWithError:", 0);
}

+ (BOOL)_requesWidgetTimelineReloadForWidgetKind:(id)a3 withError:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLMemoriesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Calling reloadTimeline on CHSTimelineController for widget kind %@", (uint8_t *)&v12, 0xCu);
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10110]), "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), v5);
  objc_msgSend(v7, "reloadTimelineWithReason:", CFSTR("RequestedByPhotosUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLMemoriesGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "CHSTimelineController reloadTimeline error: %@ for widget kind %@", (uint8_t *)&v12, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "CHSTimelineController reloadTimeline completed for widget kind %@", (uint8_t *)&v12, 0xCu);
    }

  }
  return v8 == 0;
}

void __65__PXWidgetTimeline_timelineFromLibrary_timelineSize_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLMemoriesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v40 = v8;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "WidgetTimeline %@ - failed to get all CHS configuration: %@", buf, 0x16u);
    }

  }
  v24 = v6;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(obj);
        v28 = v9;
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v9), "widgetConfigurationsForApplicationContainerBundleIdentifier:", CFSTR("com.apple.mobileslideshow"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v30;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v30 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
              objc_msgSend(v15, "widget");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              PLMemoriesGetLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v15, "uniqueIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v40 = (uint64_t)v18;
                v41 = 2112;
                v42 = v16;
                _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEBUG, "Widget reference uniqueIdentifier: %@, widget: %@", buf, 0x16u);

              }
              switch(objc_msgSend(v16, "family"))
              {
                case 1:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1E53EAE90;
                  goto LABEL_22;
                case 2:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1E53EAEA8;
                  goto LABEL_22;
                case 3:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1E53EAEC0;
                  goto LABEL_22;
                case 4:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1E53EAED8;
LABEL_22:
                  objc_msgSend(v19, "addObject:", v20);
                  break;
                default:
                  PXAssertGetLog();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    v22 = objc_msgSend(v16, "family");
                    *(_DWORD *)buf = 134217984;
                    v40 = v22;
                    _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "Unsupported widget family configuration: %zd", buf, 0xCu);
                  }

                  break;
              }

              ++v14;
            }
            while (v12 != v14);
            v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            v12 = v23;
          }
          while (v23);
        }

        v9 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end
