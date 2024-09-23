@implementation PXProactiveSuggester

+ (id)proactiveCriterionForMemory:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "category");
  v5 = objc_msgSend(v3, "subcategory");
  v6 = (void *)MEMORY[0x1E0CD1658];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isMemory:proactiveWorthyAtDate:", v3, v7);

  if ((_DWORD)v6)
  {
    if (v5 == 210)
    {
      v8 = CFSTR("PhotosMemoryBirthday");
    }
    else
    {
      if (v4 <= 201)
      {
        if (v4 == 23)
        {
          v8 = CFSTR("PhotosMemoryDayInHistoryAggregation");
          goto LABEL_5;
        }
        if (v4 == 24)
        {
          v8 = CFSTR("PhotosMemoryRecentHighlights");
          goto LABEL_5;
        }
      }
      else
      {
        switch(v4)
        {
          case 213:
            v8 = CFSTR("PhotosMemoryHolidayInHistory");
            goto LABEL_5;
          case 212:
            v8 = CFSTR("PhotosMemoryCelebratedHolidayInHistory");
            goto LABEL_5;
          case 202:
            v8 = CFSTR("PhotosMemoryDayInHistory");
            goto LABEL_5;
        }
      }
      if ((objc_msgSend(v3, "isMustSee") & 1) != 0)
      {
        v8 = CFSTR("PhotosMemoryFeaturedMustSee");
      }
      else if ((objc_msgSend(v3, "isStellar") & 1) != 0)
      {
        v8 = CFSTR("PhotosMemoryFeaturedStellar");
      }
      else if (objc_msgSend(v3, "isGreat"))
      {
        v8 = CFSTR("PhotosMemoryFeaturedGreat");
      }
      else
      {
        v8 = CFSTR("PhotosMemoryFeatured");
      }
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_5:

  return (id)v8;
}

+ (id)proactiveCriterionForFeaturedPhoto:(id)a3
{
  id v3;
  int v4;
  int v5;
  const __CFString *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = objc_msgSend(v3, "subtype");

  v6 = CFSTR("PhotosContentFallback");
  if (v4 == 5)
    v6 = CFSTR("PhotosFeaturedPhotoOutstander");
  if (v4 == 3)
    v6 = CFSTR("PhotosFeaturedPhotoRecentInterest");
  if (v5 == 401)
    return CFSTR("PhotosFeaturedPhotoOnThisDay");
  else
    return (id)v6;
}

+ (void)updateProactiveSuggestionsFromTimelineEntries:(id)a3 forTimelineSize:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLTimelineGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, a1);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Proactive - UpdateProactiveSuggestionsForTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(a1, "_clientIDForTimelineSize:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_12;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v11 = (void *)getATXProactiveCardSuggestionClientClass_softClass;
  v29 = getATXProactiveCardSuggestionClientClass_softClass;
  if (!getATXProactiveCardSuggestionClientClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getATXProactiveCardSuggestionClientClass_block_invoke;
    v31 = &unk_1E51482E0;
    v32 = &v26;
    __getATXProactiveCardSuggestionClientClass_block_invoke((uint64_t)buf);
    v11 = (void *)v27[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v26, 8);
  v13 = objc_msgSend([v12 alloc], "initWithSourceId:", v10);
  if (v13)
  {
    objc_msgSend(a1, "_proactiveSuggestionsFromTimelineEntries:withClient:forTimelineSize:", v6, v13, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    PLMemoriesGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[NSObject count](v14, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "ProactiveSuggester: %lu suggestions for %@", buf, 0x16u);
    }

    if (-[NSObject count](v14, "count"))
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke_33;
      v24[3] = &unk_1E5148B78;
      v17 = v24;
      v24[4] = v10;
      -[NSObject updateSuggestions:completionHandler:](v13, "updateSuggestions:completionHandler:", v14, v24);
    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke;
      v25[3] = &unk_1E5148B78;
      v17 = v25;
      v25[4] = v10;
      -[NSObject clearSuggestionsWithCompletionHandler:](v13, "clearSuggestionsWithCompletionHandler:", v25);
    }

    PLTimelineGetLog();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_make_with_pointer(v21, a1);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v21, OS_SIGNPOST_INTERVAL_END, v23, "Proactive - UpdateProactiveSuggestionsForTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }

  }
  else
  {
LABEL_12:
    PLMemoriesGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a4;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "ProactiveSuggester: client is nil for %tu", buf, 0xCu);
    }

    PLTimelineGetLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_make_with_pointer(v14, a1);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v20, "Proactive - UpdateProactiveSuggestionsForTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }
    v13 = v14;
  }

}

+ (id)_proactiveSuggestionsFromTimelineEntries:(id)a3 withClient:(id)a4 forTimelineSize:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = CFSTR("com.apple.mobileslideshow.PhotosReliveWidget");
    v12 = CFSTR("com.apple.mobileslideshow.PhotosReliveWidget");
    v34 = objc_msgSend(a1, "_applicableLayoutForTimelineSize:", a5);
    v32 = v8;
    v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        v16 = 0;
        v36 = v14;
        do
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v16);
          objc_msgSend(v17, "proactiveCriterion");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length"))
          {
            objc_msgSend(v17, "assetLocalIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "startTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "endTime");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "length"))
              v22 = v20 == 0;
            else
              v22 = 1;
            if (v22 || v21 == 0)
            {
              PLMemoriesGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v17;
                _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "ProactiveSuggester - invalid timeline entry: %@", buf, 0xCu);
              }
            }
            else
            {
              v24 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v21, "timeIntervalSinceReferenceDate");
              objc_msgSend(v24, "stringWithFormat:", CFSTR("%@_%.f"), v19, v25);
              v26 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "createSuggestionWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:", CFSTR("com.apple.mobileslideshow"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), v18, v34, v26, v20, v21, 0, 0);
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = (void *)v27;
              if (v27)
              {
                objc_msgSend(v33, "addObject:", v27);
              }
              else
              {
                PLMemoriesGetLog();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v43 = v17;
                  _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_ERROR, "ProactiveSuggester - failed to create suggestion for entry: %@", buf, 0xCu);
                }

              }
              v14 = v36;
            }

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v14);
    }

    v30 = CFSTR("com.apple.mobileslideshow.PhotosReliveWidget");
    v8 = v32;
  }
  else
  {
    PLMemoriesGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEBUG, "ProactiveSuggester: no timeline entries", buf, 2u);
    }
    v33 = (id)MEMORY[0x1E0C9AA60];
  }

  return v33;
}

+ (id)_clientIDForTimelineSize:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1E511CC28[a3];
}

+ (unint64_t)_applicableLayoutForTimelineSize:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return qword_1A7C094F0[a3];
}

void __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLMemoriesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v8;
      v9 = "ProactiveSuggester: cleared suggestions for %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEBUG;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    v9 = "ProactiveSuggester - clearSuggestions for %@ error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLMemoriesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v8;
      v9 = "ProactiveSuggester: updated suggestions for %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEBUG;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    v9 = "ProactiveSuggester - updateSuggestions for %@ error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

@end
