@implementation TIStatisticLogProactive

void __TIStatisticLogProactive_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  id v23;
  unsigned int v24;
  __CFString *v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  __int128 block;
  void (*v51)(uint64_t);
  void *v52;
  id v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1DF0A2708]();
  objc_msgSend(*(id *)(a1 + 32), "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D43428]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D432C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(__CFString **)(a1 + 40);
  if (!v6)
    v6 = CFSTR("NA");
  v7 = v6;
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D433B8])
    || v5
    && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v5, "isEqual:", v8),
        v8,
        (v9 & 1) == 0))
  {
    v10 = *(unsigned __int8 *)(a1 + 64);
    v11 = *(id *)(a1 + 32);
    v44 = v5;
    v43 = v7;
    if (TIStatisticCheckRecentTriggersForTrigger_onceToken != -1)
      dispatch_once(&TIStatisticCheckRecentTriggersForTrigger_onceToken, &__block_literal_global_463);
    v12 = (id)TIStatisticCheckRecentTriggersForTrigger_recentByMetricType;
    objc_sync_enter(v12);
    v13 = (void *)TIStatisticCheckRecentTriggersForTrigger_recentByMetricType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 2);
      v16 = (void *)TIStatisticCheckRecentTriggersForTrigger_recentByMetricType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    }
    objc_sync_exit(v12);

    v18 = v15;
    objc_sync_enter(v18);
    v19 = objc_msgSend(v18, "containsObject:", v11);
    objc_msgSend(v18, "addObject:", v11);
    v20 = dispatch_time(0, 300000000000);
    _TIQueueLow();
    v21 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&block = MEMORY[0x1E0C809B0];
    *((_QWORD *)&block + 1) = 3221225472;
    v51 = __TIStatisticCheckRecentTriggersForTrigger_block_invoke_2;
    v52 = &unk_1EA107030;
    v53 = v18;
    v54 = v11;
    v22 = v18;
    v23 = v11;
    dispatch_after(v20, v21, &block);

    objc_sync_exit(v22);
    if (v19 && (*(_BYTE *)(a1 + 64) & 0xFE) != 6)
    {
      TIProactiveQuickTypeOSLogFacility();
      v26 = objc_claimAutoreleasedReturnValue();
      v7 = v43;
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
LABEL_37:

        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s"), "TIStatisticLogProactive_block_invoke", "Filtering out likely overlogging of offered proactive candidate.");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(block) = 138412290;
      *(_QWORD *)((char *)&block + 4) = v28;
      _os_log_debug_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&block, 0xCu);
    }
    else
    {
      v24 = objc_msgSend(*(id *)(a1 + 32), "triggerSourceType");
      v7 = v43;
      if (v24 > 2)
        v25 = 0;
      else
        v25 = off_1EA0FBC68[v24];
      TIStatisticsCategoriesForProactiveTrigger(*(void **)(a1 + 32));
      v26 = objc_claimAutoreleasedReturnValue();
      if (*(unsigned __int8 *)(a1 + 64) - 1 > 6)
        v27 = CFSTR("triggered");
      else
        v27 = off_1EA0FBC30[(*(_BYTE *)(a1 + 64) - 1)];
      TIStatisticLogProactiveInfo(*(void **)(a1 + 48), v25, v26, v27);
      +[_TIStatisticsProactiveTracker sharedInstance](_TIStatisticsProactiveTracker, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      switch(*(_BYTE *)(a1 + 64))
      {
        case 0:
          objc_msgSend(v28, "trackTriggeredWithSource:categories:locale:fieldType:", objc_msgSend(*(id *)(a1 + 32), "triggerSourceType"), v26, *(_QWORD *)(a1 + 48), v43);
          break;
        case 1:
        case 2:
        case 3:
          objc_msgSend(v28, "trackFailureWithSource:reason:categories:locale:fieldType:", objc_msgSend(*(id *)(a1 + 32), "triggerSourceType"), *(unsigned __int8 *)(a1 + 64), v26, *(_QWORD *)(a1 + 48), v43);
          break;
        case 4:
          v42 = v2;
          v29 = objc_msgSend(*(id *)(a1 + 32), "triggerSourceType");
          v30 = *(_QWORD *)(a1 + 48);
          v41 = v28;
          v31 = v28;
          v32 = 1;
          goto LABEL_26;
        case 5:
          v42 = v2;
          v29 = objc_msgSend(*(id *)(a1 + 32), "triggerSourceType");
          v30 = *(_QWORD *)(a1 + 48);
          v41 = v28;
          v31 = v28;
          v32 = 2;
LABEL_26:
          objc_msgSend(v31, "trackSuggestedWithSource:count:categories:locale:fieldType:", v29, v32, v26, v30, v43);
          v33 = 3;
          goto LABEL_28;
        case 6:
          v42 = v2;
          v41 = v28;
          objc_msgSend(v28, "trackSelectedWithSource:position:categories:locale:fieldType:", objc_msgSend(*(id *)(a1 + 32), "triggerSourceType"), 0, v26, *(_QWORD *)(a1 + 48), v43);
          v33 = 1;
          goto LABEL_28;
        case 7:
          v42 = v2;
          v33 = 1;
          v41 = v28;
          objc_msgSend(v28, "trackSelectedWithSource:position:categories:locale:fieldType:", objc_msgSend(*(id *)(a1 + 32), "triggerSourceType"), 1, v26, *(_QWORD *)(a1 + 48), v43);
LABEL_28:
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v34 = *(id *)(a1 + 56);
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v46 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "provideFeedbackForString:type:style:", v39, v33, 1);

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            }
            while (v36);
          }

          v2 = v42;
          v7 = v43;
          v5 = v44;
          v28 = v41;
          break;
        default:
          break;
      }
    }

    goto LABEL_37;
  }
LABEL_38:

  objc_autoreleasePoolPop(v2);
}

@end
