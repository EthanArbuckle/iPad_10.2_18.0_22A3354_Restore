@implementation SSRankingManager

+ (id)bundleIDSetsForQUIntent:(id)a3
{
  id v3;
  __CFString *v4;
  const __CFString *v5;
  __CFString *v6;
  void *v7;

  v3 = a3;
  if (bundleIDSetsForQUIntent__onceToken != -1)
    dispatch_once(&bundleIDSetsForQUIntent__onceToken, &__block_literal_global_1);
  v4 = (__CFString *)v3;
  v5 = CFSTR("INTENT_FLIGHT");
  if ((-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("INTENT_FLIGHT")) & 1) != 0
    || (v5 = CFSTR("INTENT_HOTEL"),
        v6 = v4,
        -[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("INTENT_HOTEL"))))
  {

    v6 = (__CFString *)v5;
  }
  if (-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("INTENT_RESTAURANT")))
  {

    v6 = CFSTR("INTENT_RESTAURANT");
  }
  objc_msgSend((id)bundleIDSetsForQUIntent___quIntentBundleSets, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__SSRankingManager_bundleIDSetsForQUIntent___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v19;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  _QWORD v44[2];
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  _QWORD v50[12];
  _QWORD v51[14];

  v51[12] = *MEMORY[0x1E0C80C00];
  v50[0] = CFSTR("INTENT_PHOTO_SEARCH");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v49 = CFSTR("com.apple.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v36;
  v50[1] = CFSTR("INTENT_PHOTO_SEARCH_OCR");
  v1 = (void *)MEMORY[0x1E0C99E60];
  v48 = CFSTR("com.apple.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v34;
  v50[2] = CFSTR("INTENT_NOTES_SEARCH");
  v2 = (void *)MEMORY[0x1E0C99E60];
  v47 = CFSTR("com.apple.mobilenotes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v32;
  v50[3] = CFSTR("INTENT_FILE_SEARCH");
  v3 = (void *)MEMORY[0x1E0C99E60];
  v46 = CFSTR("com.apple.DocumentsApp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v30;
  v50[4] = CFSTR("INTENT_MAIL_SEARCH");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v45 = CFSTR("com.apple.mobilemail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v28;
  v50[5] = CFSTR("INTENT_MESSAGE_SEARCH");
  v5 = (void *)MEMORY[0x1E0C99E60];
  v44[0] = CFSTR("com.apple.MobileSMS");
  v44[1] = CFSTR("com.apple.mobilemail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v26;
  v50[6] = CFSTR("INTENT_CALENDAR_SEARCH");
  v6 = (void *)MEMORY[0x1E0C99E60];
  v43 = CFSTR("com.apple.mobilecal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v24;
  v50[7] = CFSTR("INTENT_REMINDER_SEARCH");
  v7 = (void *)MEMORY[0x1E0C99E60];
  v42 = CFSTR("com.apple.reminders");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v22;
  v50[8] = CFSTR("INTENT_SAFARI_SEARCH");
  v8 = (void *)MEMORY[0x1E0C99E60];
  v41 = CFSTR("com.apple.mobilesafari");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v9;
  v50[9] = CFSTR("INTENT_FLIGHT");
  v10 = (void *)MEMORY[0x1E0C99E60];
  v40[0] = CFSTR("com.apple.spotlight.events");
  v40[1] = CFSTR("com.apple.mobilemail");
  v40[2] = CFSTR("com.apple.mobilecal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v12;
  v50[10] = CFSTR("INTENT_HOTEL");
  v13 = (void *)MEMORY[0x1E0C99E60];
  v39[0] = CFSTR("com.apple.spotlight.events");
  v39[1] = CFSTR("com.apple.mobilemail");
  v39[2] = CFSTR("com.apple.mobilecal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v15;
  v50[11] = CFSTR("INTENT_RESTAURANT");
  v16 = (void *)MEMORY[0x1E0C99E60];
  v38[0] = CFSTR("com.apple.spotlight.events");
  v38[1] = CFSTR("com.apple.mobilemail");
  v38[2] = CFSTR("com.apple.mobilecal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 12);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)bundleIDSetsForQUIntent___quIntentBundleSets;
  bundleIDSetsForQUIntent___quIntentBundleSets = v19;

}

+ (void)logSections:(id)a3 prefix:(id)a4 query:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "resultsCount"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bundleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);
          }
          else
          {
            objc_msgSend(v16, "identifier");
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            if (v19)
              v21 = (const __CFString *)v19;
            else
              v21 = CFSTR("nil");
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v21);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v13);
    }

    SSGeneralLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = _os_feature_enabled_impl();
      v24 = v9;
      if ((v23 & 1) == 0)
      {
        SSRedactString(v9, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v8;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1B86C5000, v22, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] %@ query=%@ sections=%@", buf, 0x20u);
      if ((v23 & 1) == 0)

    }
    v7 = v26;
  }

}

+ (void)logItems:(id)a3 prefix:(id)a4 query:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v27 = v8;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "sectionBundleIdentifier");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
            v18 = (__CFString *)v16;
          else
            v18 = CFSTR("nil");
          v19 = v18;

          objc_msgSend(v10, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E6E97710, v19);
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v10, "objectForKeyedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, v19);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v13);
    }

    SSGeneralLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v8 = v27;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      SSRedactString(v9, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v27;
      v34 = 2112;
      v35 = v25;
      v36 = 2112;
      v37 = v26;
      _os_log_impl(&dword_1B86C5000, v24, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] %@ query=%@ items=%@", buf, 0x20u);

    }
  }

}

+ (void)fetchDuetValues
{
  uint64_t v2;
  void *v3;
  id v4;

  +[PRSMLManager getSPMLSharedInstance](PRSMLManager, "getSPMLSharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getRankedCategoriesAsDictionaryForDays:", 14);
  v2 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&sDuetValuesLock);
  v3 = (void *)initRankedCategoriesFromDuet;
  initRankedCategoriesFromDuet = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&sDuetValuesLock);
}

+ (id)getCoreDuetValues
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&sDuetValuesLock);
  v2 = (id)initRankedCategoriesFromDuet;
  os_unfair_lock_unlock((os_unfair_lock_t)&sDuetValuesLock);
  return v2;
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (double)roundedValueForScore:(double)a3
{
  char __str[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%.3g", a3);
  return atof(__str);
}

- (id)removeBlockListedSectionsForMapping:(id)a3 withRankingConfiguration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "lock");
  objc_msgSend(v6, "cepBlocklistSet");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v7)
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v8, "containsObject:", v15))
            objc_msgSend(v9, "removeObjectForKey:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = objc_msgSend(v9, "copy");
    v5 = (id)v16;
  }
  objc_msgSend(v6, "unlock");

  return v5;
}

- (id)relativeRankWithAbsRank:(id)a3 numberValues:(unint64_t)a4
{
  void *v5;
  double v6;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "doubleValue");
  return (id)objc_msgSend(v5, "numberWithDouble:", (v6 + -1.0) / (double)a4);
}

- (void)applyTopHitRankingPolicyToSection:(id)a3 topResultSection:(id)a4 maxTopHitCount:(int64_t)a5 isShortcut:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "resultsCount") > (unint64_t)a5)
    objc_msgSend(v9, "removeResultsInRange:", a5, objc_msgSend(v9, "resultsCount") - a5);
  if (objc_msgSend(v10, "resultsCount"))
  {
    objc_msgSend(v10, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "rankingItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "eligibleForDemotion") || a6 || objc_msgSend(v12, "topHit"))
    {

    }
    else
    {
      objc_msgSend(v12, "rankingItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "topHitReason");

      if (!v15)
      {
        objc_msgSend(v9, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copy");

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v19)
        {
          v20 = v19;
          v21 = 0;
          v22 = *(_QWORD *)v27;
          do
          {
            v23 = 0;
            v24 = v21;
            do
            {
              if (*(_QWORD *)v27 != v22)
                objc_enumerationMutation(v18);
              v25 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23);
              objc_msgSend(v10, "addResults:atIndex:", v25, v24 + v23, (_QWORD)v26);
              objc_msgSend(v9, "removeResults:", v25);
              ++v23;
            }
            while (v20 != v23);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            v21 = v24 + v23;
          }
          while (v20);
        }

        if (!objc_msgSend(v9, "resultsCount"))
          objc_msgSend(v10, "setPinToTop:", 1);

      }
    }

  }
}

- (BOOL)sectionContainsOnlyStaleApps:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a3, "resultSet");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v3)
  {
    v4 = v3;
    v25 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v6, "sectionBundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.application")))
          goto LABEL_19;
        objc_msgSend(v6, "rankingItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "didMatchRankingDescriptor:", CFSTR("kMDItemLastUsedDateThisMonth")))
        {

LABEL_19:
LABEL_20:
          v22 = 0;
          goto LABEL_21;
        }
        objc_msgSend(v6, "rankingItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "L2FeatureVector");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isAppInDock");

        if ((v11 & 1) != 0)
          goto LABEL_20;
        objc_msgSend(v6, "rankingItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "didMatchRankingDescriptor:", CFSTR("kMDItemContentCreationDateToday"));

        if (v13)
        {
          objc_msgSend(v6, "rankingItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v14, "attributes"), 0x136uLL);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "rankingItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v16, "attributes"), 0x20uLL);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "timeIntervalSinceReferenceDate");
          v19 = v18;
          objc_msgSend(v17, "timeIntervalSinceReferenceDate");
          v21 = v19 <= v20 ? v20 - v19 : v19 - v20;

          if (v21 < 600.0)
            goto LABEL_20;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v22 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v22 = 1;
  }
LABEL_21:

  return v22;
}

- (BOOL)sectionDoesNotContainMoreRecentlyUsedApps:(id)a3 lastUsedDate:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a3, "resultSet");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v6)
  {
    v7 = v6;
    v37 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v37)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v9, "rankingItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "didMatchRankingDescriptor:", CFSTR("kMDItemLastUsedDateThisMonth")))
        {
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v10, "attributes"), 9uLL);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v13 = v12;
          objc_msgSend(v5, "timeIntervalSinceReferenceDate");
          v15 = v14;

          if (v13 > v15)
            goto LABEL_21;
        }
        objc_msgSend(v10, "contentType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("public.contact"));

        if (v17)
        {
          objc_msgSend(v10, "lastAccessDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceReferenceDate");
          v20 = v19;
          objc_msgSend(v5, "timeIntervalSinceReferenceDate");
          v22 = v21;

          if (v20 > v22)
            goto LABEL_21;
        }
        objc_msgSend(v9, "rankingItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "didMatchRankingDescriptor:", CFSTR("kMDItemContentCreationDateToday"));

        if (v24)
        {
          objc_msgSend(v9, "rankingItem");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v25, "attributes"), 0x136uLL);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "rankingItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v27, "attributes"), 0x20uLL);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "timeIntervalSinceReferenceDate");
          v30 = v29;
          objc_msgSend(v28, "timeIntervalSinceReferenceDate");
          if (v30 <= v31)
            v32 = v31 - v30;
          else
            v32 = v30 - v31;
          if (v32 < 600.0)
          {
            objc_msgSend(v5, "timeIntervalSinceReferenceDate");
            if (v30 > v33)
            {

LABEL_21:
              v34 = 0;
              goto LABEL_22;
            }
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v7)
        continue;
      break;
    }
  }
  v34 = 1;
LABEL_22:

  return v34;
}

- (BOOL)sectionsContainsOnlyOneAppSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _BOOL8 v9;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "rankingItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "bundleIDType");

    v9 = (v8 >> 8) & 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)sectionsContainsShortcutResult:(id)a3 shortcutResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      v25 = v5;
      v26 = v8;
      v24 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v13, "domain") != 2)
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            objc_msgSend(v13, "resultSet");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v28;
              while (2)
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v28 != v17)
                    objc_enumerationMutation(v14);
                  objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "identifier");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "identifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v19, "isEqualToString:", v20);

                  if ((v21 & 1) != 0)
                  {

                    v22 = 1;
                    v5 = v25;
                    v8 = v26;
                    goto LABEL_23;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                if (v16)
                  continue;
                break;
              }
            }

            v8 = v26;
            v11 = v24;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        v22 = 0;
        v5 = v25;
      }
      while (v10);
    }
    else
    {
      v22 = 0;
    }
LABEL_23:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (void)moveSafariTopHitsToTopOfSection:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v11, "resultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v11, "resultSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "isSafariTopHit"))
        objc_msgSend(v3, "addIndex:", v6);

      ++v6;
      objc_msgSend(v11, "resultSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v10 > v6);
  }
  objc_msgSend(v11, "moveResultsAtIndexes:toIndex:", v3, 0);
  objc_msgSend(v11, "sortRange:options:usingComparator:", 0, objc_msgSend(v3, "count"), 0, &__block_literal_global_257);

}

uint64_t __52__SSRankingManager_moveSafariTopHitsToTopOfSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.safari.bookmark"));

  objc_msgSend(v5, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.safari.bookmark"));

  if (!v7 || v9)
  {
    if ((v7 | v9 ^ 1) == 1)
    {
      objc_msgSend(v4, "contentURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "length");
      v14 = objc_msgSend(v12, "length");
      if (v13 >= v14)
        v15 = 0;
      else
        v15 = -1;
      if (v13 > v14)
        v10 = 1;
      else
        v10 = v15;

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (void)logPommesScoringForRankingItem:(id)a3 queryId:(unint64_t)a4 query:(id)a5 bundleID:(id)a6 name:(id)a7 topicality:(float)a8 freshness:(float)a9 engagement:(float)a10 likelihood:(float)a11 launchPortion:(float)a12 launchCount:(float)a13 launchPortionOutOfSpotlight:(float)a14 launchCountOutOfSpotlight:(float)a15 engagedInSpotlight:(BOOL)a16 exactMatchedLaunchString:(BOOL)a17 lastUsedDate:(id)a18 recentEngagementDateInSpotlight:(id)a19 recentEngagementDateInApp:(id)a20 recentEngagementDateOutSpotlight:(id)a21 nominateLocalTopHit:(BOOL)a22
{
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  int v41;
  NSObject *v42;
  float v43;
  float v44;
  float v45;
  double v46;
  float v47;
  double v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  float v55;
  uint64_t Count;
  int v57;
  int v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  int v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v70;
  id v71;
  id v72;
  id v73;
  uint8_t buf[4];
  _BOOL4 v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  double v87;
  __int16 v88;
  double v89;
  __int16 v90;
  double v91;
  __int16 v92;
  double v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  double v101;
  __int16 v102;
  double v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  id v115;
  __int16 v116;
  id v117;
  __int16 v118;
  id v119;
  __int16 v120;
  id v121;
  __int16 v122;
  id v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  int v129;
  __int16 v130;
  int v131;
  __int16 v132;
  int v133;
  __int16 v134;
  int v135;
  __int16 v136;
  int v137;
  __int16 v138;
  int v139;
  __int16 v140;
  double v141;
  __int16 v142;
  int v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = a5;
  v35 = a6;
  v36 = a7;
  v37 = a18;
  v38 = a19;
  v39 = a20;
  v40 = a21;
  v41 = _os_feature_enabled_impl();
  SSGeneralLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v65 = v36;
    v66 = v34;
    v73 = v35;
    v71 = v39;
    v72 = v38;
    v70 = v40;
    if (v41)
    {
      v64 = objc_msgSend(v33, "isLocalTopHitCandidate");
      v67 = v36;
      v68 = v34;
    }
    else
    {
      SSRedactString(v34, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v33, "isLocalTopHitCandidate");
      SSRedactString(v36, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v63 = a8;
    objc_msgSend(v33, "pommesL1Score");
    v62 = v43;
    objc_msgSend(v33, "embeddingSimilarity");
    v60 = v44;
    objc_msgSend(v33, "keywordMatchScore");
    v46 = v45;
    v61 = a11;
    objc_msgSend(v33, "score");
    v48 = v47;
    v58 = objc_msgSend(v33, "wasEngagedInSpotlight");
    v57 = objc_msgSend(v33, "exactMatchedLaunchString");
    v59 = objc_msgSend(v33, "attributes");
    Count = SSCompactRankingAttrsGetCount(objc_msgSend(v33, "attributes"));
    v49 = objc_msgSend(v33, "isMailCategoryHighImpact");
    v50 = objc_msgSend(v33, "isMailCategoryPromotions");
    v51 = objc_msgSend(v33, "isMailCategoryTransactions");
    v52 = objc_msgSend(v33, "isMailCategoryUpdates");
    v53 = objc_msgSend(v33, "matchedQUIntent");
    v54 = objc_msgSend(v33, "quIntentAvailable");
    objc_msgSend(v33, "quIntentScore");
    *(_DWORD *)buf = 67117826;
    v75 = a22;
    v76 = 2048;
    v77 = a4;
    v78 = 2112;
    v79 = v68;
    v80 = 1024;
    v81 = v64;
    v82 = 2112;
    v83 = v73;
    v84 = 2112;
    v85 = v67;
    v86 = 2048;
    v87 = v63;
    v88 = 2048;
    v89 = v62;
    v90 = 2048;
    v91 = v60;
    v92 = 2048;
    v93 = v46;
    v94 = 2048;
    v95 = a9;
    v96 = 2048;
    v97 = a12;
    v98 = 2048;
    v99 = a13;
    v100 = 2048;
    v101 = a14;
    v102 = 2048;
    v103 = a15;
    v104 = 2048;
    v105 = a10;
    v106 = 2048;
    v107 = v61;
    v108 = 2048;
    v109 = v48;
    v110 = 1024;
    v111 = v58;
    v112 = 1024;
    v113 = v57;
    v114 = 2112;
    v115 = v37;
    v116 = 2112;
    v117 = v72;
    v118 = 2112;
    v119 = v71;
    v120 = 2112;
    v121 = v70;
    v122 = 2048;
    v123 = v33;
    v124 = 2048;
    v125 = v59;
    v126 = 2048;
    v127 = Count;
    v128 = 1024;
    v129 = v49;
    v130 = 1024;
    v131 = v50;
    v132 = 1024;
    v133 = v51;
    v134 = 1024;
    v135 = v52;
    v136 = 1024;
    v137 = v53;
    v138 = 1024;
    v139 = v54;
    v140 = 2048;
    v141 = v55;
    v142 = 1024;
    v143 = objc_msgSend(v33, "spellCorrectedApp");
    _os_log_impl(&dword_1B86C5000, v42, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> [TH=%d] qid: %llu, query: %@, isLocalCand: %d, bundleID: %@, name: %@, topicality: %f (pommesL1Score = %f, embeddingSimilarity = %f, keywordMatchScore = %f), freshness: %f, launchPortion: %f, launchCount: %f, launchPortionOutSpotlight: %f, launchCountOutSpotlight: %f, engagement: %f, likelihood: %f, L2 model: %f, engagedInSpotlight: %d, exactMatchedLaunchString: %d, lastUsedDate: %@, recentEngInSpotlight: %@, recentEngInApp: %@, recentEngOutSpotlight: %@, ri: %p/%p/%lu, isMailCategory: (HighImpact = %d, Promotions = %d, Transactions = %d, Updates = %d), matchedQUIntent: %d, quIntentAvailable: %d, quIntentScore: %f, spellCorrectedApp: %d", buf, 0x134u);
    if ((v41 & 1) == 0)
    {

    }
    v36 = v65;
    v34 = v66;
    v35 = v73;
    v39 = v71;
    v38 = v72;
    v40 = v70;
  }

}

- (float)freshnessAdjustmentForAppResult:(id)a3 section:(id)a4 freshnessBeforeAdjustment:(float)a5 topicality:(float)a6 engagement:(float)a7 appsWithLaunchCount:(BOOL)a8
{
  id v13;
  double v14;
  float v16;
  void *v17;
  void *v18;
  BOOL v19;

  v13 = a4;
  v14 = a6;
  if (a6 >= 1.0 && a5 <= 0.9)
    v16 = 0.9;
  else
    v16 = a5;
  objc_msgSend(a3, "rankingItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v17, "attributes"), 0x76uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "BOOLValue"))
  {
    v19 = (unint64_t)objc_msgSend(v13, "resultsCount") > 1 && a8;
    if (v16 >= 0.98)
      v19 = 0;
    if (a7 >= 0.5)
      v19 = 0;
    if (v14 < 1.0 && v19)
      v16 = 0.2;
  }

  return v16;
}

- (float)appFreshnessAdjustmentForLaunchCounts:(float)a3 topicality:(float)a4 engagement:(float)a5 launchCount:(float)a6 launchCountTotal:(float)a7 nAppResultsWithLaunchCount:(unint64_t)a8 launchPortion:(float *)a9
{
  float v9;
  float v11;
  float v12;
  BOOL v13;

  if (a6 <= 0.0 || a4 <= 0.0 && a5 <= 0.0)
    return a3;
  if (a8 >= 2 && (float)a8 < a7)
  {
    v11 = a6 / a7;
    if ((float)(a6 / a7) > 0.0)
    {
      v9 = 1.0;
      v12 = (float)(v11 + 1.0) * a3;
      if (v12 <= 1.0)
        v9 = v12;
      *a9 = v11;
      return v9;
    }
    return a3;
  }
  if (a8 != 1 || a4 <= 0.8 && a5 <= 0.8 || a7 <= 0.0)
    return a3;
  v9 = 1.0;
  if (a6 > 1000.0)
    return v9;
  if (a6 <= 100.0)
  {
    if (a6 <= 50.0)
    {
      if (a6 <= 25.0)
      {
        if (a6 <= 10.0)
          return a3;
        v13 = a3 <= 0.7;
        v9 = 0.7;
      }
      else
      {
        v13 = a3 <= 0.8;
        v9 = 0.8;
      }
    }
    else
    {
      v13 = a3 <= 0.85;
      v9 = 0.85;
    }
  }
  else
  {
    v13 = a3 <= 0.95;
    v9 = 0.95;
  }
  if (!v13)
    return a3;
  return v9;
}

- (float)appFreshnessAdjustmentForOutOfSpotlightCounts:(float)a3 topicality:(float)a4 engagement:(float)a5 launchCount:(float)a6 launchCountTotal:(float)a7 nAppResultsWithLaunchCount:(unint64_t)a8 launchPortion:(float *)a9
{
  float v9;
  float v11;
  float v12;
  BOOL v13;

  if (a6 <= 0.0 || a4 <= 0.0 && a5 <= 0.0)
    return a3;
  if (a8 >= 2 && (float)a8 < a7)
  {
    v11 = a6 / a7;
    if ((float)(a6 / a7) > 0.0)
    {
      v9 = 1.0;
      v12 = (float)(v11 + 1.0) * a3;
      if (v12 <= 1.0)
        v9 = v12;
      *a9 = v11;
      return v9;
    }
    return a3;
  }
  if (a8 != 1 || a4 <= 0.8 && a5 <= 0.8 || a7 <= 0.0)
    return a3;
  v9 = 1.0;
  if (a6 > 18.0)
    return v9;
  if (a6 <= 15.0)
  {
    if (a6 <= 12.0)
    {
      if (a6 <= 9.0)
      {
        if (a6 <= 6.0)
          return a3;
        v13 = a3 <= 0.7;
        v9 = 0.7;
      }
      else
      {
        v13 = a3 <= 0.8;
        v9 = 0.8;
      }
    }
    else
    {
      v13 = a3 <= 0.85;
      v9 = 0.85;
    }
  }
  else
  {
    v13 = a3 <= 0.95;
    v9 = 0.95;
  }
  if (!v13)
    return a3;
  return v9;
}

- (float)likelihoodAdjustmentForMailAndNotesResult:(float)result freshness:(float)a4 topicality:(float)a5 engagement:(float)a6 numQueryTokens:(unint64_t)a7 queryLength:(unint64_t)a8
{
  BOOL v8;
  double v9;

  v8 = a4 <= 0.2 || a5 <= 0.5;
  if (!v8 && (a7 > 2 || a8 >= 0x10))
  {
    v9 = result + 0.15;
    if (v9 > 1.0)
      return 1.0;
    return v9;
  }
  return result;
}

- (float)topicalityAdjustmentForContactsResult:(id)a3 topicalityBeforeAdjustment:(float)result freshness:(float)a5
{
  double v5;
  double v6;
  BOOL v7;
  float v8;
  double v9;

  v5 = a5;
  if (v5 <= 0.94)
  {
    if (v5 <= 0.91)
      return result;
    v9 = result;
    if (result > 0.5)
    {
      v7 = v9 < 0.8;
      v8 = 0.8;
LABEL_7:
      if (v7)
        return v8;
      return result;
    }
    if (v9 > 0.1)
      return 0.7;
  }
  else
  {
    v6 = result;
    if (result > 0.5)
    {
      v7 = v6 < 0.9;
      v8 = 0.9;
      goto LABEL_7;
    }
    if (v6 > 0.1)
      return 0.8;
  }
  return result;
}

+ (float)topicalityAdjustmentForHighlyEngagedFileResult:(id)a3 topicalityBeforeAdjustment:(float)a4 engagement:(float)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a5 >= 0.75)
  {
    objc_msgSend(v7, "rankingItem");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v8, "rankingItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "exactMatchedLaunchString"))
      {

      }
      else
      {
        objc_msgSend(v8, "rankingItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recentSimilarIntentEngagementDates");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
          goto LABEL_9;
      }
      SSGeneralLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134217984;
        v18 = 0x3FF0000000000000;
        _os_log_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][Topicality adjustment][Files] Changing to %.04f due to high engagement", (uint8_t *)&v17, 0xCu);
      }

      a4 = 1.0;
    }
  }
LABEL_9:

  return a4;
}

+ (float)topicalityAdjustmentForMessageFreshness:(float)a3 topicalityBeforeAdjustment:(float)a4
{
  double v5;
  float v6;
  float v7;
  NSObject *v8;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a3 >= 0.65)
    return a4;
  v6 = a3 * a4;
  if ((float)(a3 * a4) < 0.05)
    v6 = 0.05;
  if (a3 <= 2.2204e-16)
    v7 = 0.049;
  else
    v7 = v6;
  SSGeneralLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218496;
    v11 = a4;
    v12 = 2048;
    v13 = v7;
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_1B86C5000, v8, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][Topicality adjustment][Messages] Changing %.04f -> %.04f due to freshness %.04f", (uint8_t *)&v10, 0x20u);
  }

  return v7;
}

- (void)_tagQUIntent:(id)a3 qu:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  double v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "intentBundleIds");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "intentScore");
      v11 = v10;

      if (v11 >= 0.9)
      {
        objc_msgSend(v7, "intentBundleIds");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsObject:", v13);

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v5, "results", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v20, "rankingItem");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v20, "rankingItem");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setMatchedQUIntent:", v14);

                v23 = -1.0;
                if ((_DWORD)v14)
                {
                  objc_msgSend(v7, "intentScore");
                  v23 = v24;
                }
                objc_msgSend(v20, "rankingItem");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v26 = v23;
                objc_msgSend(v25, "setQuIntentScore:", v26);

                objc_msgSend(v20, "rankingItem");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setQuIntentAvailable:", 1);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v17);
        }

      }
    }
  }

}

- (void)calculateLikelihoodAndPriorForSection:(id)a3 currentTime:(double)a4 shortcutResult:(id)a5 queryId:(unint64_t)a6 ranker:(id)a7 nominateLocalTopHit:(BOOL)a8 qu:(id)a9
{
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  float v22;
  uint64_t i;
  void *v24;
  void *v25;
  float v26;
  void *v27;
  double v28;
  _BOOL4 v29;
  void *v30;
  double v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  PRSRankingItem *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  float v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  SSRankingManager *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  double v68;
  float v69;
  void *v70;
  double v71;
  float v72;
  void *v73;
  double v74;
  float v75;
  float v76;
  void *v77;
  float v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  float v88;
  double v89;
  double v90;
  float v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  float v96;
  void *v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  void *v104;
  unint64_t v105;
  _BOOL8 v106;
  _BOOL8 v107;
  _BOOL8 v108;
  _BOOL8 v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  int v119;
  int v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  uint64_t v126;
  float v127;
  void *v128;
  __int16 v129;
  double v130;
  double v131;
  void *v132;
  float v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  double v137;
  double v138;
  double v139;
  float v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  double v161;
  double v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  double v168;
  void *v169;
  void *v170;
  double v171;
  void *v172;
  void *v173;
  double v174;
  void *v175;
  void *v176;
  double v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  SSRankingManager *v190;
  int v191;
  float v192;
  int v193;
  void *v194;
  void *v195;
  char v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  double v213;
  unsigned int v214;
  double v215;
  float v216;
  double v217;
  float v218;
  double v219;
  float v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *v225;
  SSRankingManager *v226;
  void *v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  SSRankingManager *v236;
  uint64_t v237;
  uint64_t v238;
  id v239;
  id v240;
  float v241;
  void *v242;
  id v243;
  int v244;
  id obj;
  uint64_t v246;
  uint64_t v248;
  void *v249;
  void *v250;
  uint64_t v252;
  void *v253;
  void *v254;
  unsigned int v255;
  void *v256;
  uint64_t v257;
  void *v258;
  NSString *query;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  NSString *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  float v270;
  void *v271;
  uint64_t v272;
  void *v273;
  _BOOL4 v274;
  uint64_t v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  __int16 v281;
  float v282;
  uint64_t v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  float v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  _BYTE v293[128];
  _BYTE v294[128];
  uint64_t v295;

  v274 = a8;
  v295 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v239 = a5;
  v243 = a7;
  v14 = a9;
  v15 = v13;
  v240 = v14;
  if (!objc_msgSend(v13, "resultsCount"))
    goto LABEL_121;
  objc_msgSend(v13, "bundleIdentifier");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
    +[SSRankingManager prepareSafariUserTypedURLForTopHitNomination:query:](SSRankingManager, "prepareSafariUserTypedURLForTopHitNomination:query:", v13, self->_query);
  v16 = objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.application"));
  -[SSRankingManager _tagQUIntent:qu:](self, "_tagQUIntent:qu:", v13, v240);
  v242 = v13;
  v244 = v16;
  if (v16)
  {
    v292 = 0u;
    v290 = 0u;
    v291 = 0u;
    v289 = 0u;
    objc_msgSend(v13, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v289, v294, 16);
    if (!v18)
    {
      v246 = 0;
      v275 = 0;
      v21 = 0.0;
      v22 = 0.0;
      goto LABEL_43;
    }
    v19 = v18;
    v246 = 0;
    v275 = 0;
    v20 = *(_QWORD *)v290;
    v21 = 0.0;
    v22 = 0.0;
    while (1)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v290 != v20)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * i);
        v288 = 0.0;
        objc_msgSend(v24, "rankingItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        SSCompactRankingAttrsGetFloat(objc_msgSend(v25, "attributes"), 0x113uLL, &v288);

        v26 = v288;
        if (v288 <= 0.0)
        {
          objc_msgSend(v24, "rankingItem");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v13, "wasEngagedInSpotlight"))
          {
            v29 = 0;
LABEL_18:

            goto LABEL_19;
          }
        }
        objc_msgSend(v24, "rankingItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "topicalityScore");
        if (v28 <= 0.0)
        {
          objc_msgSend(v24, "rankingItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "engagementScore");
          v29 = v31 > 0.0;

        }
        else
        {
          v29 = 1;
        }

        if (v26 <= 0.0)
          goto LABEL_18;
LABEL_19:
        if (v29)
          v32 = v288;
        else
          v32 = -0.0;
        if (SSEnableSpotlightPersonalizedRanking2024())
        {
          objc_msgSend(v24, "rankingItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v33, "attributes"), 0x74uLL);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v34, "count"))
          {
            objc_msgSend(v24, "rankingItem");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "topicalityScore");
            if (v36 > 0.0)
            {

              goto LABEL_27;
            }
            objc_msgSend(v24, "rankingItem");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "engagementScore");
            v39 = v38;

            if (v39 > 0.0)
            {
LABEL_27:
              v21 = v21 + (float)(unint64_t)objc_msgSend(v34, "count");
              ++v246;
            }
          }

        }
        v275 += v29;
        v22 = v22 + v32;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v289, v294, 16);
      if (!v19)
      {
LABEL_43:
        v241 = v21;
        v64 = self;

        v15 = v242;
        goto LABEL_44;
      }
    }
  }
  if ((objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.conversion")) & 1) == 0
    && (objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) == 0
    && (objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.worldclock")) & 1) == 0
    && !objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions")))
  {
    v64 = self;
    v246 = 0;
    v275 = 0;
    v241 = 0.0;
    v22 = 0.0;
LABEL_44:
    v249 = (void *)objc_opt_new();
    v284 = 0u;
    v285 = 0u;
    v286 = 0u;
    v287 = 0u;
    objc_msgSend(v15, "results");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v252 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v284, v293, 16);
    if (!v252)
      goto LABEL_113;
    v248 = *(_QWORD *)v285;
LABEL_46:
    v65 = 0;
    while (1)
    {
      if (*(_QWORD *)v285 != v248)
        objc_enumerationMutation(obj);
      v272 = v65;
      v66 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResult:", *(_QWORD *)(*((_QWORD *)&v284 + 1) + 8 * v65));
      objc_msgSend(v249, "addObject:", v66);
      objc_msgSend(v66, "rankingItem");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "topicalityScore");
      v69 = v68;

      objc_msgSend(v66, "rankingItem");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "engagementScore");
      v72 = v71;

      v288 = 0.0;
      v283 = 0;
      if (v69 > 0.0)
        break;
      v270 = 0.0;
      if (v72 <= 0.0)
        v88 = 0.05;
      else
        v88 = v72 * 0.4;
      v76 = 0.0;
LABEL_85:
      objc_msgSend(v66, "rankingItem");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setFreshnessScore:", v76);

      v282 = v88;
      v281 = 3227;
      objc_msgSend(v66, "rankingItem");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "L2FeatureVector");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "setScores:forFeatures:count:", &v282, &v281, 1);

      objc_msgSend(v66, "rankingItem");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "setTopicalityScore:", v69);

      objc_msgSend(v66, "rankingItem");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "setLikelihood:", v88);

      objc_msgSend(v66, "rankingItem");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setFinalTopicality:", v69);

      if (v274)
        +[SSTopHitNominationManager nominateTopHitCandidate:](SSTopHitNominationManager, "nominateTopHitCandidate:", v66);
      objc_msgSend(v66, "rankingItem");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v147, "attributes"), 9uLL);
      v268 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "rankingItem");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v148, "attributes"), 0x6CuLL);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "rankingItem");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v150, "attributes"), 0x72uLL);
      v151 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "rankingItem");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v152, "attributes"), 7uLL);
      v153 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "rankingItem");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v154, "attributes"), 0xCuLL);
      v155 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "rankingItem");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v156, "attributes"), 4uLL);
      v157 = objc_claimAutoreleasedReturnValue();

      v277 = (void *)v157;
      v279 = (void *)v155;
      if (SSEnableSpotlightPersonalizedRankingFeedbackLogging())
      {
        objc_msgSend(v66, "rankingItem");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v158, "attributes"), 9uLL);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = v159;
        if (v159)
        {
          objc_msgSend(v159, "timeIntervalSinceReferenceDate");
          v162 = trunc(fmax(a4 - v161, 0.0)) / 86400.0;
          if (v162 <= 540.0)
          {
            if (v162 <= 365.0)
            {
              if (v162 <= 90.0)
              {
                if (v162 <= 30.0)
                {
                  if (v162 <= 7.0)
                  {
                    if (v162 <= 3.0)
                    {
                      if (v162 <= 1.0)
                        v163 = 1;
                      else
                        v163 = 2;
                    }
                    else
                    {
                      v163 = 3;
                    }
                  }
                  else
                  {
                    v163 = 4;
                  }
                }
                else
                {
                  v163 = 5;
                }
              }
              else
              {
                v163 = 6;
              }
            }
            else
            {
              v163 = 7;
            }
          }
          else
          {
            v163 = 8;
          }
        }
        else
        {
          v163 = 0;
        }
        v164 = (void *)objc_opt_new();
        objc_msgSend(v164, "setResultQueryRecency:", v163);
        v165 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v158, "l2Score");
        objc_msgSend(v165, "numberWithFloat:");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setPommesL2Score:", v166);

        v167 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v158, "topicalityScore");
        objc_msgSend(v167, "numberWithDouble:", round(v168 * 100000000.0) / 100000000.0);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setTopicalityScore:", v169);

        v170 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v158, "freshnessScore");
        objc_msgSend(v170, "numberWithDouble:", round(v171 * 100000000.0) / 100000000.0);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setFreshness:", v172);

        v173 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v158, "engagementScore");
        objc_msgSend(v173, "numberWithDouble:", round(v174 * 100000000.0) / 100000000.0);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setEngagementScore:", v175);

        v176 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v158, "likelihood");
        objc_msgSend(v176, "numberWithDouble:", round(v177 * 100000000.0) / 100000000.0);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setPredictedLikelihoodOfEngagement:", v178);

        objc_msgSend(v164, "setWasNominatedAsTopHit:", objc_msgSend(v158, "isLocalTopHitCandidate"));
        objc_msgSend(v164, "setIsExactMatchOfLaunchString:", objc_msgSend(v158, "exactMatchedLaunchString"));
        objc_msgSend(v164, "setWasEngagedInSpotlight:", objc_msgSend(v158, "wasEngagedInSpotlight"));
        objc_msgSend(v158, "retrievalType");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setIsSemanticMatch:", ((unint64_t)objc_msgSend(v179, "integerValue") >> 1) & 1);

        objc_msgSend(v158, "retrievalType");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setIsSyntacticMatch:", objc_msgSend(v180, "integerValue") != 2);

        v181 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v158, "embeddingSimilarity");
        objc_msgSend(v181, "numberWithFloat:");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setSemanticScore:", v182);

        v183 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v158, "pommesL1Score");
        objc_msgSend(v183, "numberWithFloat:");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setSyntacticScore:", v184);

        objc_msgSend(v66, "setCoreSpotlightRankingSignals:", v164);
        v155 = (uint64_t)v279;
      }
      objc_msgSend(v66, "rankingItem");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v185, "attributes"), 0x74uLL);
      v186 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "rankingItem");
      v187 = objc_claimAutoreleasedReturnValue();
      query = v64->_query;
      v261 = (void *)v187;
      if (v155)
        v188 = v155;
      else
        v188 = v157;
      v189 = v66;
      v190 = v64;
      if (v153)
        v188 = v153;
      v257 = v188;
      v191 = HIDWORD(v283);
      v192 = v288;
      v193 = v283;
      objc_msgSend(v189, "rankingItem");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      v255 = objc_msgSend(v194, "wasEngagedInSpotlight");
      objc_msgSend(v189, "rankingItem");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v196 = objc_msgSend(v195, "exactMatchedLaunchString");
      v265 = v149;
      objc_msgSend(v149, "valueForKeyPath:", CFSTR("@max.self"));
      v263 = (void *)v153;
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = v151;
      objc_msgSend(v151, "valueForKeyPath:", CFSTR("@max.self"));
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "valueForKeyPath:", CFSTR("@max.self"));
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v238) = v274;
      LOBYTE(v237) = v196;
      *(float *)&v201 = v69;
      *(float *)&v202 = v76;
      *(float *)&v203 = v72;
      *(float *)&v204 = v88;
      LODWORD(v205) = v191;
      *(float *)&v206 = v192;
      LODWORD(v207) = v193;
      *(float *)&v208 = v270;
      v64 = v190;
      -[SSRankingManager logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:](v190, "logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:", v261, a6, query, v254, v257, v255, v201, v202, v203, v204, v205, v206, v207, v208, v237,
        v268,
        v197,
        v199,
        v200,
        v238);

      v65 = v272 + 1;
      if (v252 == v272 + 1)
      {
        v252 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v284, v293, 16);
        if (!v252)
        {
LABEL_113:

          v15 = v242;
          objc_msgSend(v242, "setResults:", v249);

          v209 = v254;
          goto LABEL_120;
        }
        goto LABEL_46;
      }
    }
    objc_msgSend(v66, "rankingItem");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v74 = v69;
    objc_msgSend(v73, "staleDemotionWithCurrentTime:topicality:", a4, v74);
    v76 = v75;

    if (v244)
    {
      objc_msgSend(v66, "rankingItem");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetFloat(objc_msgSend(v77, "attributes"), 0x113uLL, &v288);

      v78 = 0.0;
      if (!SSEnableSpotlightPersonalizedRanking2024())
      {
LABEL_72:
        *(float *)&v82 = v288;
        *(float *)&v79 = v76;
        *(float *)&v80 = v69;
        *(float *)&v81 = v72;
        *(float *)&v83 = v22;
        -[SSRankingManager appFreshnessAdjustmentForLaunchCounts:topicality:engagement:launchCount:launchCountTotal:nAppResultsWithLaunchCount:launchPortion:](v64, "appFreshnessAdjustmentForLaunchCounts:topicality:engagement:launchCount:launchCountTotal:nAppResultsWithLaunchCount:launchPortion:", v275, (char *)&v283 + 4, v79, v80, v81, v82, v83);
        v120 = v119;
        if (SSEnableSpotlightPersonalizedRanking2024())
        {
          LODWORD(v121) = v120;
          *(float *)&v122 = v69;
          *(float *)&v123 = v72;
          *(float *)&v124 = v78;
          v126 = v246;
          *(float *)&v125 = v241;
          -[SSRankingManager appFreshnessAdjustmentForOutOfSpotlightCounts:topicality:engagement:launchCount:launchCountTotal:nAppResultsWithLaunchCount:launchPortion:](v64, "appFreshnessAdjustmentForOutOfSpotlightCounts:topicality:engagement:launchCount:launchCountTotal:nAppResultsWithLaunchCount:launchPortion:", v246, &v283, v121, v122, v123, v124, v125);
          v120 = LODWORD(v121);
        }
        else
        {
          v126 = v246;
        }
        LODWORD(v121) = v120;
        *(float *)&v122 = v69;
        *(float *)&v123 = v72;
        -[SSRankingManager freshnessAdjustmentForAppResult:section:freshnessBeforeAdjustment:topicality:engagement:appsWithLaunchCount:](v64, "freshnessAdjustmentForAppResult:section:freshnessBeforeAdjustment:topicality:engagement:appsWithLaunchCount:", v66, v242, (v275 | v126) != 0, v121, v122, v123);
        v76 = v127;
        goto LABEL_76;
      }
      objc_msgSend(v66, "rankingItem");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v84, "attributes"), 0x74uLL);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v85, "count"))
      {
        objc_msgSend(v66, "rankingItem");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "topicalityScore");
        if (v87 > 0.0)
        {

LABEL_70:
          v78 = (float)(unint64_t)objc_msgSend(v85, "count");
          v241 = v241 + v78;
          ++v246;
          goto LABEL_71;
        }
        objc_msgSend(v66, "rankingItem");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "engagementScore");
        v118 = v117;

        if (v118 > 0.0)
          goto LABEL_70;
      }
LABEL_71:

      goto LABEL_72;
    }
    if (objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
    {
      *(float *)&v89 = v69;
      *(float *)&v90 = v76;
      -[SSRankingManager topicalityAdjustmentForContactsResult:topicalityBeforeAdjustment:freshness:](v64, "topicalityAdjustmentForContactsResult:topicalityBeforeAdjustment:freshness:", v66, v89, v90);
      v69 = v91;
      objc_msgSend(v66, "rankingItem");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v93 = v69;
      objc_msgSend(v92, "setKeywordMatchScore:", v93);

      v78 = 0.0;
LABEL_76:
      objc_msgSend(v66, "rankingItem");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v128, "bundleIDType");

      if ((v129 & 0x800) != 0)
      {
        v132 = v254;
        if (v72 > 0.0)
        {
          *(float *)&v130 = v69;
          *(float *)&v131 = v72;
          +[SSRankingManager topicalityAdjustmentForHighlyEngagedFileResult:topicalityBeforeAdjustment:engagement:](SSRankingManager, "topicalityAdjustmentForHighlyEngagedFileResult:topicalityBeforeAdjustment:engagement:", v66, v130, v131);
          v69 = v133;
        }
      }
      else
      {
        v132 = v254;
      }
      v88 = v76 * 0.8 * v69 + v72 * 0.2;
      if ((objc_msgSend(v132, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
        || objc_msgSend(v132, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
      {
        v134 = objc_msgSend(v243, "queryTermCount");
        v135 = objc_msgSend(v243, "queryTermLength");
        *(float *)&v136 = v76 * 0.8 * v69 + v72 * 0.2;
        *(float *)&v137 = v76;
        *(float *)&v138 = v69;
        *(float *)&v139 = v72;
        -[SSRankingManager likelihoodAdjustmentForMailAndNotesResult:freshness:topicality:engagement:numQueryTokens:queryLength:](v64, "likelihoodAdjustmentForMailAndNotesResult:freshness:topicality:engagement:numQueryTokens:queryLength:", v134, v135, v136, v137, v138, v139);
        v88 = v140;
      }
      v270 = v78;
      if (v88 < 0.05)
        v88 = 0.05;
      goto LABEL_85;
    }
    if (objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.MobileSMS")) && v69 > 0.0)
    {
      *(float *)&v94 = v76;
      *(float *)&v95 = v69;
      +[SSRankingManager topicalityAdjustmentForMessageFreshness:topicalityBeforeAdjustment:](SSRankingManager, "topicalityAdjustmentForMessageFreshness:topicalityBeforeAdjustment:", v94, v95);
      v69 = v96;
      objc_msgSend(v66, "rankingItem");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v98 = v69;
      objc_msgSend(v97, "setKeywordMatchScore:", v98);

      objc_msgSend(v66, "rankingItem");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "freshnessScore");
      v101 = v100;

      v78 = 0.0;
      if (v101 > 2.22044605e-16)
        goto LABEL_76;
      objc_msgSend(v66, "rankingItem");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v103) = 1028174906;
      objc_msgSend(v102, "setKeywordMatchScore:", v103);
    }
    else
    {
      v78 = 0.0;
      if (!objc_msgSend(v254, "isEqualToString:", CFSTR("com.apple.mobilemail")))
        goto LABEL_76;
      objc_msgSend(v66, "rankingItem");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v104, "attributes"), 0x104uLL);
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      if (v102)
      {
        v105 = objc_msgSend(v102, "unsignedIntegerValue");
        v106 = (v105 & 0xFFFFFFFFFFFFFFDFLL) == 0;
        v107 = (v105 & 0xFFFFFFFFFFFFFFDFLL) == 4;
        v108 = (v105 & 0xFFFFFFFFFFFFFFDFLL) == 16;
        v109 = (v105 & 0xFFFFFFFFFFFFFFDFLL) == 2;
        v110 = (v105 >> 5) & 1;
        objc_msgSend(v66, "rankingItem");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "setIsMailCategoryDefault:", v106);

        objc_msgSend(v66, "rankingItem");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setIsMailCategoryTransactions:", v107);

        objc_msgSend(v66, "rankingItem");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setIsMailCategoryUpdates:", v108);

        objc_msgSend(v66, "rankingItem");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setIsMailCategoryPromotions:", v109);

        objc_msgSend(v66, "rankingItem");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setIsMailCategoryHighImpact:", v110);

      }
    }

    goto LABEL_76;
  }
  objc_msgSend(v13, "resultSet");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rankingItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    v43 = -[PRSRankingItem initWithAttrs:]([PRSRankingItem alloc], "initWithAttrs:", SSCompactRankingAttrsAlloc(0));
    objc_msgSend(v13, "resultSet");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setRankingItem:", v43);

    objc_msgSend(v13, "resultSet");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "rankingItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSectionBundleIdentifier:", v254);

  }
  objc_msgSend(v13, "resultSet");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rankingItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v51, "quIntentAvailable"))
    goto LABEL_115;
  objc_msgSend(v240, "intentLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_MAIL_SEARCH")))
  {

LABEL_115:
    goto LABEL_116;
  }
  objc_msgSend(v242, "resultSet");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "resultBundleId");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions.calendar"));

  if (v56)
  {
    +[SSTopHitNominationManager getTopHitThreshold:](SSTopHitNominationManager, "getTopHitThreshold:", CFSTR("LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"));
    v58 = v57 + -0.01;
    objc_msgSend(v242, "resultSet");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "rankingItem");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    v63 = v58;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(v242, "resultSet");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "rankingItem");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  v63 = 1.0;
LABEL_117:
  objc_msgSend(v61, "setLikelihood:", v63);

  if (v274)
  {
    objc_msgSend(v242, "resultSet");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "objectAtIndexedSubscript:", 0);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSTopHitNominationManager nominateTopHitCandidate:](SSTopHitNominationManager, "nominateTopHitCandidate:", v211);

  }
  v15 = v242;
  objc_msgSend(v242, "resultSet");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "objectAtIndexedSubscript:", 0);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "rankingItem");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v264 = self->_query;
  objc_msgSend(v242, "resultSet");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "objectAtIndexedSubscript:", 0);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "rankingItem");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "topicalityScore");
  *(float *)&v214 = v213;
  objc_msgSend(v242, "resultSet");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "objectAtIndexedSubscript:", 0);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "rankingItem");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "freshnessScore");
  v216 = v215;
  objc_msgSend(v242, "resultSet");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "objectAtIndexedSubscript:", 0);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "rankingItem");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "engagementScore");
  v218 = v217;
  objc_msgSend(v242, "resultSet");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "objectAtIndexedSubscript:", 0);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "rankingItem");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "likelihood");
  v220 = v219;
  objc_msgSend(v242, "resultSet");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "objectAtIndexedSubscript:", 0);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "rankingItem");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = objc_msgSend(v223, "wasEngagedInSpotlight");
  objc_msgSend(v242, "resultSet");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "objectAtIndexedSubscript:", 0);
  v226 = self;
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "rankingItem");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v238) = v274;
  LOBYTE(v237) = objc_msgSend(v228, "exactMatchedLaunchString");
  LODWORD(v229) = 0;
  LODWORD(v230) = 0;
  LODWORD(v231) = 0;
  LODWORD(v232) = 0;
  *(float *)&v233 = v216;
  *(float *)&v234 = v218;
  *(float *)&v235 = v220;
  v236 = v226;
  v209 = v254;
  -[SSRankingManager logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:](v236, "logPommesScoringForRankingItem:queryId:query:bundleID:name:topicality:freshness:engagement:likelihood:launchPortion:launchCount:launchPortionOutOfSpotlight:launchCountOutOfSpotlight:engagedInSpotlight:exactMatchedLaunchString:lastUsedDate:recentEngagementDateInSpotlight:recentEngagementDateInApp:recentEngagementDateOutSpotlight:nominateLocalTopHit:", v212, a6, v264, v254, CFSTR("CCCD"), v224, COERCE_DOUBLE((unint64_t)v214), v233, v234, v235, v229, v230, v231, v232, v237,
    0,
    0,
    0,
    0,
    v238);

LABEL_120:
LABEL_121:

}

- (void)withinSectionTopHitNomination:(id)a3 withItemRanker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "domain") == 1)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
      || (SSSectionIsSyndicatedPhotos(v8) & 1) != 0)
    {
      goto LABEL_9;
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__SSRankingManager_withinSectionTopHitNomination_withItemRanker___block_invoke;
    v9[3] = &unk_1E6E43148;
    v9[4] = self;
    v10 = v8;
    v11 = v7;
    objc_msgSend(v6, "sortWithOptions:usingComparator:", 16, v9);

  }
  else if (objc_msgSend(v6, "domain") == 2)
  {
    objc_msgSend(v6, "sortWithOptions:usingComparator:", 16, &__block_literal_global_267);
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.application")))
    +[SSTopHitNominationManager topHitCandidacyThresholdingForAppSection:](SSTopHitNominationManager, "topHitCandidacyThresholdingForAppSection:", v6);
LABEL_9:

}

uint64_t __65__SSRankingManager_withinSectionTopHitNomination_withItemRanker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "rankingItem");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "rankingItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v5, "rankingItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "bundleIDType");

        if ((v12 & 0x80) != 0)
        {
          objc_msgSend(v5, "rankingItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "rankingItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "compareSafariTopHitCandidate:", v14);
        }
        else if ((v12 & 0x100) != 0)
        {
          objc_msgSend(v5, "rankingItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "rankingItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "compareAppsTopHitCandidate:", v14);
        }
        else if ((v12 & 4) != 0)
        {
          objc_msgSend(v5, "rankingItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "rankingItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "compareContactsTopHitCandidate:", v14);
        }
        else
        {
          if ((v12 & 0x1800000) == 0)
          {
            if ((v12 & 0x10) != 0)
            {
              objc_msgSend(v5, "rankingItem");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "rankingItem");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "allowedTopHitSections");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "containsObject:", *(_QWORD *)(a1 + 40));

              objc_msgSend(v5, "rankingItem");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "rankingItem");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend(*(id *)(a1 + 48), "currentTime");
                v15 = objc_msgSend(v13, "compare:currentTime:", v14);
                goto LABEL_28;
              }
            }
            v15 = objc_msgSend(v13, "compareLocalTopHitCandidate:", v14);
            goto LABEL_28;
          }
          objc_msgSend(v5, "rankingItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "rankingItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "comparePeopleItemTopHitCandidate:", v14);
        }
LABEL_28:
        v21 = v15;

        v17 = -v21;
        goto LABEL_29;
      }
    }
  }
  else if (!v5)
  {
    if (!v6)
    {
      v17 = 0;
      goto LABEL_29;
    }
    goto LABEL_18;
  }
  objc_msgSend(v5, "rankingItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = -1;
  else
    v17 = 0;
  if (v7 && !v16)
  {
LABEL_18:
    objc_msgSend(v7, "rankingItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18 != 0;

  }
LABEL_29:

  return v17;
}

uint64_t __65__SSRankingManager_withinSectionTopHitNomination_withItemRanker___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "rankingItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "rankingItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "rankingItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rankingItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -objc_msgSend(v8, "compareParsecTopHitCandidate:", v9);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)nominateLocalTopHitsFromSections:(id)a3 withItemRanker:(id)a4 sectionHeader:(id)a5 maxInitiallyVisibleResults:(unint64_t)a6 shortcutResult:(id)a7 isBullseyeNonCommittedSearch:(BOOL)a8 isBullseyeCommittedSearch:(BOOL)a9 parsecEnabled:(BOOL)a10 maxNumAppsInTopHitSection:(unint64_t)a11 queryId:(unint64_t)a12 queryKind:(unint64_t)a13 clientBundleID:(id)a14 qu:(id)a15
{
  id v19;
  id v20;
  void *v21;
  unint64_t v22;
  double Current;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  char IsSyndicatedPhotos;
  void *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  id v72;
  id v73;
  int v74;
  NSObject *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  int v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t n;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t ii;
  void *v98;
  char v99;
  void *v100;
  void *v101;
  void *v102;
  char v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  char v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  unint64_t v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  void *v127;
  id obj;
  id obja;
  _OWORD v131[4];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t buf[16];
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v122 = a4;
  v20 = a5;
  v124 = a7;
  v119 = a14;
  v123 = a15;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setBundleIdentifier:", CFSTR("com.apple.spotlight.tophits"));
  v118 = v20;
  objc_msgSend(v21, "setTitle:", v20);
  v120 = v21;
  objc_msgSend(v21, "setMaxInitiallyVisibleResults:", a6);
  if (a11 <= 1)
    v22 = 1;
  else
    v22 = a11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count", v22));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  obj = v19;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v154;
    v126 = *(_QWORD *)v154;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v154 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
        if (objc_msgSend(v29, "resultsCount"))
        {
          objc_msgSend(v29, "bundleIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.Preferences"));

          if (v31)
          {
            -[SSRankingManager calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:](self, "calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:", v29, v124, a12, v122, 1, v123, Current);
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v29, "resultsCount"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v151 = 0u;
            v152 = 0u;
            v149 = 0u;
            v150 = 0u;
            objc_msgSend(v29, "resultSet");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v150;
              do
              {
                for (j = 0; j != v35; ++j)
                {
                  if (*(_QWORD *)v150 != v36)
                    objc_enumerationMutation(v33);
                  v38 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * j);
                  objc_msgSend(v38, "identifier");
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (v39)
                  {
                    v40 = (void *)v39;
                    objc_msgSend(v38, "rankingItem");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v41)
                    {
                      objc_msgSend(v38, "rankingItem");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "identifier");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "setObject:forKeyedSubscript:", v42, v43);

                    }
                  }
                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
              }
              while (v35);
            }

            v26 = v32;
            v27 = v126;
          }
        }
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
    }
    while (v25);
  }
  else
  {
    v26 = 0;
  }

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v125 = obj;
  v44 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
  if (!v44)
  {
    v127 = 0;
    v46 = v122;
    goto LABEL_55;
  }
  v45 = v44;
  v127 = 0;
  obja = *(id *)v146;
  v46 = v122;
  do
  {
    for (k = 0; k != v45; ++k)
    {
      if (*(id *)v146 != obja)
        objc_enumerationMutation(v125);
      v48 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * k);
      if (objc_msgSend(v48, "resultsCount"))
      {
        objc_msgSend(v48, "bundleIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
          goto LABEL_33;
        objc_msgSend(v48, "bundleIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v50);

        if ((IsSyndicatedPhotos & 1) == 0)
        {
          -[SSRankingManager calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:](self, "calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:", v48, v124, a12, v46, 1, v123, Current);
          objc_msgSend(v48, "bundleIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.shortcuts"));

          if (v53)
          {
            v143 = 0u;
            v144 = 0u;
            v141 = 0u;
            v142 = 0u;
            objc_msgSend(v48, "resultSet");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
            if (v54)
            {
              v55 = v54;
              v56 = *(_QWORD *)v142;
              do
              {
                for (m = 0; m != v55; ++m)
                {
                  if (*(_QWORD *)v142 != v56)
                    objc_enumerationMutation(v49);
                  v58 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * m);
                  objc_msgSend(v58, "rankingItem");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v59)
                  {
                    objc_msgSend(v58, "rankingItem");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "resetScoreForShortcutsSetting:", v26);

                  }
                }
                v55 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
              }
              while (v55);
              v46 = v122;
            }
LABEL_33:

          }
        }
        -[SSRankingManager withinSectionTopHitNomination:withItemRanker:](self, "withinSectionTopHitNomination:withItemRanker:", v48, v46);
        if (objc_msgSend(v48, "resultsCount"))
        {
          objc_msgSend(v48, "resultSet");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "rankingItem");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "isLocalTopHitCandidate");

          if (v64)
          {
            objc_msgSend(v48, "resultSet");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = SSSetTopHitWithReasonType(1, v66, 28, 0, 1);
            objc_msgSend(v48, "resultSet");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setTopHit:", v67);

            objc_msgSend(v121, "addObject:", v48);
          }
        }
        objc_msgSend(v48, "bundleIdentifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"));

        if (v71)
        {
          v72 = v48;

          v127 = v72;
        }
        continue;
      }
    }
    v45 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
  }
  while (v45);
LABEL_55:

  objc_msgSend(v121, "sortWithOptions:usingComparator:", 16, &__block_literal_global_272);
  if (!v119)
    goto LABEL_68;
  v73 = v119;
  if (_os_feature_enabled_impl())
  {

    goto LABEL_61;
  }
  if ((objc_msgSend(v73, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
    || (objc_msgSend(v73, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
    || (v77 = objc_msgSend(v73, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), a13 == 12)
    || (v77 & 1) != 0)
  {
    v74 = _os_feature_enabled_impl();

    if (!v74)
      goto LABEL_68;
LABEL_61:
    SSGeneralLog();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B86C5000, v75, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] by-pass TH nomination", buf, 2u);
    }
LABEL_63:
    v76 = v120;
LABEL_64:

  }
  else
  {

LABEL_68:
    if (objc_msgSend(v121, "count"))
    {
      objc_msgSend(v121, "objectAtIndexedSubscript:", 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "bundleIdentifier");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "isEqualToString:", CFSTR("com.apple.application"));

      if (v80)
        v81 = v117;
      else
        v81 = 1;
      v82 = objc_msgSend(v78, "resultsCount");
      if (v81 >= v82)
        v83 = v82;
      else
        v83 = v81;
      if (v83)
      {
        for (n = 0; n != v83; ++n)
        {
          objc_msgSend(v78, "resultSet");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "objectAtIndexedSubscript:", n);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "rankingItem");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "isLocalTopHitCandidate");

          if (v88)
          {
            objc_msgSend(v121, "objectAtIndexedSubscript:", 0);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "resultSet");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "objectAtIndexedSubscript:", n);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "addResults:", v91);

            objc_msgSend(v78, "bundleIdentifier");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "setRelatedSectionBundleIdentifier:", v92);

          }
        }
      }

      v46 = v122;
    }
    if (v127)
    {
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      objc_msgSend(v120, "resultSet");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v136, v159, 16);
      if (v94)
      {
        v95 = v94;
        v96 = *(_QWORD *)v137;
        while (2)
        {
          for (ii = 0; ii != v95; ++ii)
          {
            if (*(_QWORD *)v137 != v96)
              objc_enumerationMutation(v93);
            objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * ii), "sectionBundleIdentifier");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = objc_msgSend(v98, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"));

            if ((v99 & 1) != 0)
            {

              v46 = v122;
              goto LABEL_93;
            }
          }
          v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v136, v159, 16);
          v46 = v122;
          if (v95)
            continue;
          break;
        }
      }

      objc_msgSend(v127, "resultSet");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "resultBundleId");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions.tracking_number"));

      if ((v103 & 1) == 0)
        objc_msgSend(v127, "clearResults");
    }
LABEL_93:
    v76 = v120;
    if (_os_feature_enabled_impl())
    {
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v104 = v125;
      v105 = -[NSObject countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v132, v158, 16);
      if (v105)
      {
        v106 = v105;
        v107 = *(_QWORD *)v133;
LABEL_96:
        v108 = 0;
        while (1)
        {
          if (*(_QWORD *)v133 != v107)
            objc_enumerationMutation(v104);
          v109 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v108);
          objc_msgSend(v109, "bundleIdentifier");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v110, "isEqualToString:", CFSTR("com.apple.spotlight.events"));

          if ((v111 & 1) != 0)
            break;
          if (v106 == ++v108)
          {
            v106 = -[NSObject countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v132, v158, 16);
            if (v106)
              goto LABEL_96;
            v75 = v104;
            v46 = v122;
            goto LABEL_63;
          }
        }
        v75 = v109;

        v46 = v122;
        v76 = v120;
        if (!v75)
          goto LABEL_107;
        objc_msgSend(v120, "clearResults");
        memset(v131, 0, sizeof(v131));
        -[NSObject resultSet](v75, "resultSet");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", v131, v157, 16))
        {
          v113 = **((_QWORD **)&v131[0] + 1);
          objc_msgSend(**((id **)&v131[0] + 1), "rankingItem");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "setLikelihood:", 1.0);

          +[SSTopHitNominationManager setTopHitCandidate:](SSTopHitNominationManager, "setTopHitCandidate:", v113);
          objc_msgSend(v120, "addResults:", v113);
        }

      }
      else
      {
        v75 = v104;
      }
      goto LABEL_64;
    }
  }
LABEL_107:
  v115 = v76;

  return v115;
}

uint64_t __255__SSRankingManager_nominateLocalTopHitsFromSections_withItemRanker_sectionHeader_maxInitiallyVisibleResults_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection_queryId_queryKind_clientBundleID_qu___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions")) & 1) != 0)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("com.apple.calculation");
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.calculation")))
    {

LABEL_11:
      objc_msgSend(v4, "resultSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resultBundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions.phone_number"));

      v19 = v18 == 0;
      v20 = -1;
      goto LABEL_14;
    }
    objc_msgSend(v5, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.conversion"));

    if (v14)
      goto LABEL_11;
  }
  else
  {

    v8 = CFSTR("com.apple.calculation");
  }
  objc_msgSend(v4, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.calculation"));
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.conversion")) & 1) == 0)
    {

      goto LABEL_18;
    }
  }
  objc_msgSend(v5, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"));

  if ((v10 & 1) == 0)
  {

    if ((v12 & 1) != 0)
      goto LABEL_13;
LABEL_18:
    objc_msgSend(v4, "resultSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rankingItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "resultSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rankingItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    if (!v28 || !v31)
      goto LABEL_24;
    v32 = objc_msgSend(v28, "compareShortcutTopHitCandidate:", v31);
    if (v32)
    {
      v25 = -v32;
    }
    else
    {
      if (!objc_msgSend(v28, "compareWithCCCDTopHitCandidate:", v31))
      {
        objc_msgSend(v28, "likelihood");
        v35 = v34;
        objc_msgSend(v31, "likelihood");
        if (v35 > v36)
        {
          v25 = -1;
          goto LABEL_24;
        }
        objc_msgSend(v28, "likelihood");
        v38 = v37;
        objc_msgSend(v31, "likelihood");
        if (v38 < v39)
        {
          v25 = 1;
          goto LABEL_24;
        }
      }
      v25 = 0;
    }
LABEL_24:

    goto LABEL_25;
  }

  if (!v12)
    goto LABEL_18;
LABEL_13:
  objc_msgSend(v5, "resultSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resultBundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions.phone_number"));

  v19 = v24 == 0;
  v20 = 1;
LABEL_14:
  if (v19)
    v25 = -v20;
  else
    v25 = v20;
LABEL_25:

  return v25;
}

+ (void)prepareServerSectionRankingItemsForTopHitNomination:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double Current;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  PRSRankingItem *v15;
  void *v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SSGeneralLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v5;
    _os_log_impl(&dword_1B86C5000, v4, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] prepareServerSectionRankingItemsForTopHitNomination bundle_id = %@", buf, 0xCu);

  }
  objc_msgSend(v3, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v3, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v14)
          {
            v15 = [PRSRankingItem alloc];
            objc_msgSend(v3, "bundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[PRSRankingItem initForParsecResultWithBundleID:](v15, "initForParsecResultWithBundleID:", v16);

            objc_msgSend(v17, "setEngagementScore:", 0.0);
            objc_msgSend(v17, "setTopicalityScore:", -1.0);
            if (objc_msgSend(v14, "topHit") == 1)
            {
              v19 = objc_msgSend(v17, "bundleIDType");
              v18 = 0.85;
              if ((v19 & 0x80060000000001) != 0)
                goto LABEL_17;
              v20 = objc_msgSend(v17, "bundleIDType", 0.85);
              v18 = 0.6;
              if ((v20 & 0x500000000000) != 0)
                goto LABEL_17;
              v21 = objc_msgSend(v17, "bundleIDType", 0.6);
              v18 = 0.3;
              if ((v21 & 0x200000000000) != 0
                || (v22 = objc_msgSend(v17, "bundleIDType", 0.3), v18 = 0.53, (v22 & 0x80000000000) != 0)
                || (v23 = objc_msgSend(v17, "bundleIDType", 0.53), v18 = 0.6, (v23 & 0x1000000000000) != 0)
                || (v24 = objc_msgSend(v17, "bundleIDType", 0.6), v18 = 0.8, (v24 & 0x10000000000) != 0))
              {
LABEL_17:
                objc_msgSend(v17, "setTopicalityScore:", v18);
              }
            }
            if ((objc_msgSend(v17, "bundleIDType", v18) & 0x10000000000) != 0)
            {
              objc_msgSend(v14, "mapsPersonalizationResult");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25;
              if (v25)
              {
                if (objc_msgSend(v25, "resultType"))
                {
                  objc_msgSend(v26, "startEventDate");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v27)
                  {
                    objc_msgSend(v26, "startEventDate");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
                    v30 = v29 - Current;

                    if (v30 > -3600.0 && v30 < 21600.0)
                      objc_msgSend(v17, "setEngagementScore:", 0.5);
                  }
                }
              }

            }
            objc_msgSend(v17, "topicalityScore");
            *(float *)&v31 = v31;
            objc_msgSend(v17, "setKeywordMatchScore:", v31);
            objc_msgSend(v14, "setRankingItem:", v17);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

  }
}

+ (void)prepareSafariUserTypedURLForTopHitNomination:(id)a3 query:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int8x8_t *v24;
  PRSRankingItem *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  SSGeneralLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B86C5000, v7, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] prepareSafariUserTypedURLForTopHitNomination", buf, 2u);
  }

  objc_msgSend(v5, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v5, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

    if (v10)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v5, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (!v11)
        goto LABEL_25;
      v12 = v11;
      v30 = v5;
      v13 = *(_QWORD *)v33;
      v31 = v6;
      while (1)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v15)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "resultBundleId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.safari.userTypedURL")))
            {
              objc_msgSend(v15, "rankingItem");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
                continue;
              if ((objc_msgSend(v6, "containsString:", CFSTR("://")) & 1) != 0)
              {
                v18 = v6;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), v6);
                v18 = (id)objc_claimAutoreleasedReturnValue();
              }
              v16 = v18;
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              if (v19)
              {
                objc_msgSend(v19, "scheme");
                v21 = objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  v22 = (void *)v21;
                  objc_msgSend(v20, "host");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v23)
                  {
                    objc_msgSend(v15, "setContentURL:", v16);
                    v24 = (int8x8_t *)SSCompactRankingAttrsAlloc(3);
                    SSCompactRankingAttrsUpdateValue(v24, 0xCuLL, v31);
                    SSCompactRankingAttrsUpdateValue(v24, 0xDuLL, v31);
                    SSCompactRankingAttrsUpdateValue(v24, 0x1FuLL, v31);
                    v25 = -[PRSRankingItem initWithAttrs:]([PRSRankingItem alloc], "initWithAttrs:", v24);
                    objc_msgSend(v15, "setRankingItem:", v25);

                    objc_msgSend(v15, "rankingItem");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setBundleIDType:", objc_msgSend(v26, "bundleIDType") | 0x80);

                    objc_msgSend(v15, "rankingItem");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setTopicalityScore:", 1.0);

                    objc_msgSend(v15, "rankingItem");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v29) = 1.0;
                    objc_msgSend(v28, "setKeywordMatchScore:", v29);

                  }
                }
              }

              v6 = v31;
            }

          }
        }
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (!v12)
        {
          v5 = v30;
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
LABEL_25:

  }
}

+ (id)nominateServerTopHitForSection:(id)a3 queryString:(id)a4 language:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CFAbsoluteTime Current;
  int v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  dispatch_group_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  dispatch_time_t v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  id obja;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  uint64_t *v76;
  CFAbsoluteTime v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[3];
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v47 = a4;
  v48 = a5;
  if (nominateServerTopHitForSection_queryString_language__onceToken != -1)
    dispatch_once(&nominateServerTopHitForSection_queryString_language__onceToken, &__block_literal_global_279);
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy_;
  v90 = __Block_byref_object_dispose_;
  v91 = 0;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v54, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v91 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "count") == 0;

  if ((_DWORD)v7)
  {
    v43 = (id)v87[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v10 = (id)v87[5];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v83;
      v13 = 3;
LABEL_6:
      v14 = 0;
      obj = (id)(v13 - v11);
      while (1)
      {
        if (*(_QWORD *)v83 != v12)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v14);
        if (!v15)
          break;
        if (v13 == v14)
          goto LABEL_17;
        objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v14), "rankingItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "bundleIDType");

        if ((v17 & 0x20000000000) != 0)
        {
          objc_msgSend(v15, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("-"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "count") != 3)
          {
            v43 = (id)v87[5];

            goto LABEL_37;
          }
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("st:%@"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v22);

        }
        else
        {
          objc_msgSend(v15, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v18);
        }

        if (v11 == ++v14)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
          v13 = (uint64_t)obj;
          if (v11)
            goto LABEL_6;
          goto LABEL_17;
        }
      }
      v43 = (id)v87[5];
LABEL_37:

      goto LABEL_38;
    }
LABEL_17:

    if (objc_msgSend(v49, "count"))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AB8]), "initWithQuery:language:fuzzyThreshold:options:", v47, v48, 0, 0);
      objc_msgSend(v23, "setMatchOncePerTerm:", 0);
      Current = CFAbsoluteTimeGetCurrent();
      v25 = _os_feature_enabled_impl();
      v80[0] = 0;
      v80[1] = v80;
      v80[2] = 0x2020000000;
      v81 = 0;
      v81 = objc_msgSend(v49, "count");
      v78[0] = 0;
      v78[1] = v78;
      v78[2] = 0x3032000000;
      v78[3] = __Block_byref_object_copy_;
      v78[4] = __Block_byref_object_dispose_;
      v79 = 0;
      v26 = MEMORY[0x1E0C809B0];
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __72__SSRankingManager_nominateServerTopHitForSection_queryString_language___block_invoke_288;
      v73[3] = &unk_1E6E431F0;
      v27 = v49;
      v74 = v27;
      v76 = &v86;
      v45 = v23;
      v75 = v45;
      v77 = Current;
      v28 = (void *)MEMORY[0x1BCCB38DC](v73);
      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy_;
      v71 = __Block_byref_object_dispose_;
      v72 = 0;
      v61[0] = v26;
      v61[1] = 3221225472;
      v61[2] = __72__SSRankingManager_nominateServerTopHitForSection_queryString_language___block_invoke_2;
      v61[3] = &unk_1E6E43218;
      v64 = v80;
      v65 = v78;
      v29 = v27;
      v62 = v29;
      v30 = v28;
      v63 = v30;
      v66 = &v67;
      v51 = (void *)MEMORY[0x1BCCB38DC](v61);
      v59[0] = v26;
      v59[1] = 3221225472;
      v59[2] = __72__SSRankingManager_nominateServerTopHitForSection_queryString_language___block_invoke_3;
      v59[3] = &unk_1E6E43240;
      v46 = v30;
      v60 = v46;
      v50 = (void *)MEMORY[0x1BCCB38DC](v59);
      if (v25)
      {
        v31 = dispatch_group_create();
        v32 = (void *)v68[5];
        v68[5] = (uint64_t)v31;

      }
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      obja = (id)nominateServerTopHitForSection_queryString_language__protectionClasses;
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v92, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v56 != v34)
              objc_enumerationMutation(obja);
            v36 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
            if (v25)
            {
              dispatch_group_enter((dispatch_group_t)v68[5]);
              objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = nominateServerTopHitForSection_queryString_language__sServerEngagementAttributes;
              objc_msgSend(v54, "bundleIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v38, v36, v39, v29, v51);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DA9B70], "sharedInstance");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = nominateServerTopHitForSection_queryString_language__sServerEngagementAttributes;
              objc_msgSend(v54, "bundleIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "fetchAttributesForProtectionClass:attributes:bundleID:identifiers:completion:", v36, v40, v39, v29, v50);
            }

          }
          v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v92, 16);
        }
        while (v33);
      }

      if (v25)
      {
        v41 = v68[5];
        v42 = dispatch_time(0, 300000000);
        dispatch_group_wait(v41, v42);
      }
      v43 = (id)v87[5];

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(v78, 8);

      _Block_object_dispose(v80, 8);
    }
    else
    {
      v43 = (id)v87[5];
    }
LABEL_38:

  }
  _Block_object_dispose(&v86, 8);

  return v43;
}

void __72__SSRankingManager_nominateServerTopHitForSection_queryString_language___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6790];
  v8[0] = *MEMORY[0x1E0CA67A0];
  v8[1] = v0;
  v1 = *MEMORY[0x1E0CA6798];
  v8[2] = *MEMORY[0x1E0CA67A8];
  v8[3] = v1;
  v2 = *MEMORY[0x1E0CA6450];
  v8[4] = *MEMORY[0x1E0CA6460];
  v8[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)nominateServerTopHitForSection_queryString_language__sServerEngagementAttributes;
  nominateServerTopHitForSection_queryString_language__sServerEngagementAttributes = v3;

  v7[0] = *MEMORY[0x1E0CB2AC0];
  v7[1] = CFSTR("Priority");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)nominateServerTopHitForSection_queryString_language__protectionClasses;
  nominateServerTopHitForSection_queryString_language__protectionClasses = v5;

}

void __72__SSRankingManager_nominateServerTopHitForSection_queryString_language___block_invoke_288(uint64_t a1, void *a2)
{
  uint64_t v3;
  __objc2_class_ro **p_info;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  float v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  id v49;

  v49 = a2;
  if (objc_msgSend(v49, "count") && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    p_info = &OBJC_METACLASS___PRSL2FeatureVectorProcessingContext.info;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "count");
      if (v7 == -[__objc2_class_ro count](p_info[413], "count"))
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_28;
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_27;
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_26;
        objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          break;
      }
LABEL_29:

      if (++v3 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_30;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v13;
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) != 0)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "rankingItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)v18;
          objc_msgSend(v19, "setLastUsedDate:", v18);

          v13 = v46;
LABEL_14:

          goto LABEL_17;
        }
        v20 = 0;
      }
      else
      {
        v20 = 0;
        v48 = &stru_1E6E549F0;
      }
LABEL_17:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rankingItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v20;
      LODWORD(v23) = -1.0;
      objc_msgSend(v22, "inSpotlightEngagementScoreWithEvaluator:currentTime:queriesInSpotlight:datesInSpotlight:queriesInSpotlightNonUnique:datesInSpotlightNonUnique:launchString:lastUsedDate:topicalityScore:", *(_QWORD *)(a1 + 40), v8, v9, v10, v13, v48, *(double *)(a1 + 56), v23, v20);
      v25 = v24;

      if (v25 <= 0.0)
        goto LABEL_25;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "rankingItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setWasEngaged:", 1);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "rankingItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWasEngagedInSpotlight:", 1);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "rankingItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "engagementScore");
      v33 = v32;

      if (v33 < v25)
        v33 = v25;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "rankingItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setEngagementScore:", v33);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "rankingItem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "bundleIDType") & 0x10000000000) != 0 && v25 >= 0.5)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
        v45 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "rankingItem");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "topicalityScore");
        v41 = v40;

        if (v41 > 0.0)
          goto LABEL_25;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "rankingItem");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setTopicalityScore:", 0.5);

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "rankingItem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = 0.5;
        objc_msgSend(v37, "setKeywordMatchScore:", v44);
      }

LABEL_25:
      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___PRSL2FeatureVectorProcessingContext + 32);
LABEL_26:

LABEL_27:
LABEL_28:

      goto LABEL_29;
    }
    v20 = 0;
    v48 = &stru_1E6E549F0;
    goto LABEL_14;
  }
LABEL_30:

}

void __72__SSRankingManager_nominateServerTopHitForSection_queryString_language___block_invoke_2(_QWORD *a1, void *a2)
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a2;
  if (objc_msgSend(v16, "count"))
  {
    v3 = objc_msgSend(v16, "count") == *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v4 = v16;
    if (!v3)
      goto LABEL_11;
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = objc_msgSend(v16, "count");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
            v13 = (void *)a1[4];
            v14 = v11;
            objc_msgSend(v13, "objectAtIndexedSubscript:", i);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v14, v15);

          }
        }

      }
    }
  }
  (*(void (**)(void))(a1[5] + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[8] + 8) + 40));
  v4 = v16;
LABEL_11:

}

uint64_t __72__SSRankingManager_nominateServerTopHitForSection_queryString_language___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)makeTopHitSectionUsingSections:(id)a3 withItemRanker:(id)a4 sectionHeader:(id)a5 shortcutResult:(id)a6 isBullseyeNonCommittedSearch:(BOOL)a7 isBullseyeCommittedSearch:(BOOL)a8 parsecEnabled:(BOOL)a9 maxNumAppsInTopHitSection:(unint64_t)a10
{
  char v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  unint64_t v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  unint64_t n;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  char v61;
  void *v62;
  NSSet *allowedTopHitSections;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  char v70;
  int v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  NSObject *v80;
  id v81;
  void *v82;
  BOOL v83;
  int v84;
  int v85;
  void *v86;
  void *v87;
  float v88;
  BOOL v89;
  void *v90;
  _BOOL4 v91;
  char v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  _BOOL4 v110;
  int v111;
  int v112;
  void *v113;
  int v114;
  void *v115;
  int v116;
  void *v117;
  float v118;
  _BOOL4 v119;
  void *v120;
  float v121;
  float v122;
  void *v123;
  float v124;
  float v125;
  _BOOL4 v126;
  _BOOL4 v127;
  void *v128;
  float v129;
  _BOOL4 v130;
  void *v131;
  float v132;
  float v133;
  _BOOL4 v134;
  void *v135;
  float v136;
  float v137;
  int v138;
  int v139;
  int v140;
  unint64_t v141;
  unint64_t v142;
  char v143;
  unint64_t v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  double v154;
  int v155;
  int v156;
  void *v157;
  void *v158;
  void *v159;
  char v160;
  void *v161;
  float v162;
  float v163;
  NSObject *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  int v169;
  int v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  void *v178;
  float v179;
  _BOOL4 v180;
  void *v181;
  float v182;
  BOOL v183;
  int v184;
  int v185;
  void *v186;
  void *v187;
  int v188;
  int v189;
  void *v190;
  _BOOL4 v191;
  void *v192;
  void *v193;
  _BOOL4 v194;
  void *v195;
  uint64_t v196;
  int v197;
  void *v198;
  void *v199;
  id v200;
  void *v201;
  unint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  int v209;
  int v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  int v215;
  int v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  unint64_t ii;
  void *v223;
  void *v224;
  int v226;
  const __CFString *v227;
  void *v228;
  void *v229;
  int v230;
  char v231;
  void *v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  id v236;
  void *v237;
  void (**v238)(_QWORD, _QWORD, _QWORD);
  int v239;
  id v240;
  void *v241;
  void *v242;
  int v243;
  int v244;
  int v245;
  int v246;
  void *v247;
  unint64_t v248;
  _BOOL4 v249;
  int v250;
  _BOOL4 v251;
  char v252;
  id v253;
  int v254;
  int v255;
  void *v256;
  char v257;
  unsigned __int8 v258;
  uint64_t v259;
  uint64_t v260;
  int v261;
  int v262;
  int v263;
  _BOOL4 v264;
  unsigned int v265;
  _BOOL4 v266;
  int v267;
  _BOOL4 v268;
  int v269;
  void *v270;
  int v271;
  int v272;
  uint64_t v273;
  int v274;
  void *v275;
  id v276;
  unint64_t v277;
  uint64_t v278;
  void *v279;
  _BOOL4 v281;
  id v282;
  int v283;
  _BOOL4 v284;
  int v285;
  void *v286;
  id v287;
  int v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  uint64_t v293;
  id v294;
  char *v295;
  int v296;
  uint64_t m;
  void *v298;
  void *v299;
  id v300;
  char v301;
  void *v302;
  id v303;
  id obj;
  __int128 obja;
  uint64_t obj_8;
  _QWORD v307[4];
  id v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  _QWORD v329[6];
  uint64_t v330;
  id *v331;
  uint64_t v332;
  uint64_t (*v333)(uint64_t, uint64_t);
  void (*v334)(uint64_t);
  id v335;
  uint64_t v336;
  uint64_t *v337;
  uint64_t v338;
  uint64_t (*v339)(uint64_t, uint64_t);
  void (*v340)(uint64_t);
  id v341;
  uint8_t buf[4];
  void *v343;
  __int16 v344;
  void *v345;
  __int16 v346;
  double v347;
  _BYTE v348[128];
  _BYTE v349[128];
  _BYTE v350[128];
  _BYTE v351[128];
  _BYTE v352[128];
  uint64_t v353;

  v266 = a8;
  v251 = a7;
  v353 = *MEMORY[0x1E0C80C00];
  v240 = a3;
  v276 = a4;
  v236 = a5;
  v303 = a6;
  +[SSRankingManager getLegacyTophitSection]();
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v241, "containsObject:", CFSTR("none"));
  v244 = objc_msgSend(v241, "containsObject:", CFSTR("nocontact"));
  v230 = objc_msgSend(v241, "containsObject:", CFSTR("noshortcut"));
  v255 = objc_msgSend(v241, "containsObject:", CFSTR("noappnonexactmatch"));
  v254 = objc_msgSend(v241, "containsObject:", CFSTR("nophotos"));
  if (v266 && (v13 & 1) != 0)
  {
    v14 = 0;
    goto LABEL_386;
  }
  v336 = 0;
  v337 = &v336;
  v338 = 0x3032000000;
  v339 = __Block_byref_object_copy_;
  v340 = __Block_byref_object_dispose_;
  v341 = 0;
  v341 = (id)objc_opt_new();
  v330 = 0;
  v331 = (id *)&v330;
  v332 = 0x3032000000;
  v333 = __Block_byref_object_copy_;
  v334 = __Block_byref_object_dispose_;
  v335 = 0;
  objc_msgSend((id)v337[5], "setBundleIdentifier:", CFSTR("com.apple.spotlight.tophits"));
  objc_msgSend((id)v337[5], "setTitle:", v236);
  objc_msgSend((id)v337[5], "setMaxInitiallyVisibleResults:", 1);
  v329[0] = MEMORY[0x1E0C809B0];
  v329[1] = 3221225472;
  v329[2] = __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke;
  v329[3] = &unk_1E6E43268;
  v329[4] = &v330;
  v329[5] = &v336;
  v238 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCB38DC](v329);
  objc_msgSend(v303, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_29;
  v16 = objc_msgSend(v303, "type") == 3;

  if (!v16)
    goto LABEL_29;
  v327 = 0u;
  v328 = 0u;
  v325 = 0u;
  v326 = 0u;
  obj = v240;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v352, 16);
  if (!v17)
  {

LABEL_28:
    v303 = 0;
    goto LABEL_29;
  }
  v301 = 0;
  obj_8 = *(_QWORD *)v326;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v326 != obj_8)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v325 + 1) + 8 * i);
      if (objc_msgSend(v19, "domain") == 1)
      {
        v323 = 0u;
        v324 = 0u;
        v321 = 0u;
        v322 = 0u;
        objc_msgSend(v19, "resultSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v321, v351, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v322;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v322 != v22)
                objc_enumerationMutation(v20);
              v24 = *(void **)(*((_QWORD *)&v321 + 1) + 8 * j);
              objc_msgSend(v24, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v303, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v25, "isEqualToString:", v26);

              if (v27)
              {
                v28 = v24;

                v301 = 1;
                v303 = v28;
                goto LABEL_22;
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v321, v351, 16);
            if (v21)
              continue;
            break;
          }
        }
LABEL_22:

      }
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v352, 16);
  }
  while (v17);

  if ((v301 & 1) == 0)
    goto LABEL_28;
LABEL_29:
  v319 = 0u;
  v320 = 0u;
  v317 = 0u;
  v318 = 0u;
  v294 = v240;
  v29 = objc_msgSend(v294, "countByEnumeratingWithState:objects:count:", &v317, v350, 16);
  v249 = v29 != 0;
  v30 = 0;
  if (v29)
  {
    v31 = *(_QWORD *)v318;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v318 != v31)
          objc_enumerationMutation(v294);
        v33 = *(void **)(*((_QWORD *)&v317 + 1) + 8 * k);
        objc_msgSend(v33, "bundleIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));

        if ((v35 & 1) != 0)
        {
          v36 = v33;

          v30 = v36;
        }
      }
      v29 = objc_msgSend(v294, "countByEnumeratingWithState:objects:count:", &v317, v350, 16);
    }
    while (v29);

    if (!v30)
    {
      v249 = 0;
      v39 = -3.4028e38;
      goto LABEL_48;
    }
    objc_msgSend(v30, "results");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = -3.4028e38;
    while (v38 < objc_msgSend(v37, "count"))
    {
      objc_msgSend(v37, "objectAtIndex:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "rankingItem");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "L2FeatureVector");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "scoreForFeature:", 165);
      v44 = v43;

      if (v44 == 0.0)
      {
        objc_msgSend(v41, "L2FeatureVector");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "originalL2Score");
        v47 = v46;

        if (v47 > v39)
          v39 = v47;
      }

      ++v38;
    }
  }
  else
  {
    v39 = -3.4028e38;
    v37 = v294;
  }

LABEL_48:
  v229 = v30;
  if (v303)
  {
    v300 = 0;
    obja = 0uLL;
    v302 = 0;
    goto LABEL_70;
  }
  v315 = 0u;
  v316 = 0u;
  v313 = 0u;
  v314 = 0u;
  v287 = v294;
  v48 = objc_msgSend(v287, "countByEnumeratingWithState:objects:count:", &v313, v349, 16);
  if (!v48)
  {
    v300 = 0;
    obja = 0uLL;
    v302 = 0;
    v49 = 0;
    v303 = 0;
    goto LABEL_69;
  }
  v291 = v48;
  v300 = 0;
  obja = 0uLL;
  v302 = 0;
  v49 = 0;
  v303 = 0;
  v289 = *(_QWORD *)v314;
  do
  {
    for (m = 0; m != v291; ++m)
    {
      if (*(_QWORD *)v314 != v289)
        objc_enumerationMutation(v287);
      v50 = *(void **)(*((_QWORD *)&v313 + 1) + 8 * m);
      objc_msgSend(v50, "results");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      for (n = 0; n < objc_msgSend(v51, "count"); ++n)
      {
        objc_msgSend(v51, "objectAtIndex:", n);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "rankingItem");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v54, "hasShortCut"))
          goto LABEL_64;
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v54, "attributes"), 0x52uLL);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (*((_QWORD *)&obja + 1) && v55)
        {
          if (objc_msgSend(*((id *)&obja + 1), "compare:", v55) != -1)
            goto LABEL_61;
        }
        else if (obja != 0)
        {
LABEL_61:
          v49 = v55;
          goto LABEL_64;
        }
        v56 = v50;

        v57 = v53;
        objc_msgSend(v57, "rankingItem");
        v58 = objc_claimAutoreleasedReturnValue();

        v49 = v55;
        *(_QWORD *)&obja = v57;

        v300 = v56;
        v302 = (void *)v58;
        *((_QWORD *)&obja + 1) = v49;
        v303 = (id)obja;
LABEL_64:

      }
    }
    v291 = objc_msgSend(v287, "countByEnumeratingWithState:objects:count:", &v313, v349, 16);
  }
  while (v291);
LABEL_69:

LABEL_70:
  v248 = objc_msgSend(v276, "queryTermLength");
  v311 = 0u;
  v312 = 0u;
  v309 = 0u;
  v310 = 0u;
  v253 = v294;
  v59 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v309, v348, 16);
  if (v59)
  {
    v258 = 0;
    v234 = 0;
    v235 = 0;
    v252 = 0;
    v239 = 0;
    v243 = 0;
    v275 = 0;
    v60 = 0;
    v231 = 0;
    v61 = 0;
    v259 = v59;
    v260 = *(_QWORD *)v310;
    v227 = CFSTR("com.apple.searchd.syndicatedPhotos");
    v278 = *MEMORY[0x1E0CA5F10];
    while (1)
    {
      v273 = 0;
      do
      {
        if (*(_QWORD *)v310 != v260)
          objc_enumerationMutation(v253);
        if ((v61 & 1) != 0)
          goto LABEL_328;
        v62 = *(void **)(*((_QWORD *)&v309 + 1) + 8 * v273);
        objc_msgSend(v62, "results");
        v292 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "bundleIdentifier");
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        allowedTopHitSections = self->_allowedTopHitSections;
        v282 = v62;
        objc_msgSend(v62, "bundleIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v281 = -[NSSet containsObject:](allowedTopHitSections, "containsObject:", v64);

        if (v281)
        {
          objc_msgSend(v282, "resultSet");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v307[0] = MEMORY[0x1E0C809B0];
          v307[1] = 3221225472;
          v307[2] = __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke_2;
          v307[3] = &unk_1E6E43290;
          v308 = v276;
          objc_msgSend(v65, "sortedArrayWithOptions:usingComparator:", 16, v307);
          v66 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v282, "bundleIdentifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

          if (v68)
            +[SSRankingManager moveSafariTopHitsToTopOfSection:](SSRankingManager, "moveSafariTopHitsToTopOfSection:", v282);

          v292 = (void *)v66;
        }
        if ((SSSectionIsSyndicatedPhotos(v279) & 1) == 0)
        {
          objc_msgSend(v282, "bundleIdentifier");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v288 = objc_msgSend(v69, "isEqualToString:", CFSTR("com.apple.application"));

          if (v288)
          {
            objc_msgSend(v292, "count");
            v70 = 0;
            v272 = 0;
            v71 = 0;
          }
          else
          {
            objc_msgSend(v282, "bundleIdentifier");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("com.apple.app-clips"));

            if ((v73 & 1) != 0)
            {
              v272 = 0;
              v71 = 0;
              v70 = 1;
            }
            else
            {
              objc_msgSend(v282, "bundleIdentifier");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = objc_msgSend(v74, "isEqualToString:", CFSTR("com.apple.Preferences"));

              if ((v75 & 1) != 0)
              {
                v70 = 0;
                v71 = 0;
                v272 = 1;
              }
              else
              {
                objc_msgSend(v282, "bundleIdentifier");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v76, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
                {
                  v71 = 1;
                }
                else
                {
                  objc_msgSend(v282, "bundleIdentifier");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  v71 = objc_msgSend(v77, "isEqualToString:", v227);

                }
                v70 = 0;
                v272 = 0;
              }
            }
          }
          v295 = 0;
          v257 = v288 | v70;
          v250 = v71 ^ 1;
          v269 = v71;
          v245 = v71 & v254 ^ 1;
          v246 = v71 & v254 & v255 ^ 1;
          while (2)
          {
            if ((unint64_t)v295 >= objc_msgSend(v292, "count", v227))
              goto LABEL_81;
            objc_msgSend(v292, "objectAtIndex:");
            v78 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "rankingItem");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v283 = objc_msgSend(v79, "topHitReason");
            objc_msgSend(v78, "userActivityType");
            v298 = (void *)objc_claimAutoreleasedReturnValue();
            if (v298)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if ((objc_msgSend(v298, "isEqualToString:", v278) & 1) == 0)
                {
                  v290 = (uint64_t)v60;
LABEL_288:

                  ++v295;
                  v60 = (void *)v290;
                  continue;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v80 = MEMORY[0x1E0C81028];
                  v81 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
                  {
                    objc_msgSend(v78, "resultBundleId");
                    v150 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v343 = v298;
                    v344 = 2112;
                    v345 = v150;
                    _os_log_fault_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "result.userActivityType(%@) isKindOfClass NSArray class, result.resultBundleId(%@)", buf, 0x16u);

                    v80 = MEMORY[0x1E0C81028];
                  }

                }
              }
            }
            break;
          }
          if (v288)
          {
            if ((objc_msgSend(v79, "didMatchRankingDescriptor:", CFSTR("kMDItemAlternateNameExactMatch")) & 1) != 0)
            {
              v284 = 1;
            }
            else
            {
              objc_msgSend(v79, "displayNameInitials");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v284 = v82 != 0;

            }
          }
          else
          {
            v284 = 0;
          }
          if (v303)
            v83 = v78 == v303;
          else
            v83 = 0;
          v84 = v83;
          v285 = v84;
          if (v83)
          {
            objc_msgSend(v303, "setTopHit:", SSSetTopHitWithReasonString(2, v303, CFSTR("shortcutResult match"), 1));
            SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v79, "attributes"), 0x137uLL);
            v290 = objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v303, "forceNoTopHit"))
            {
              objc_msgSend(v303, "setForceNoTopHit:", 0);
              objc_msgSend(v303, "setTopHit:", SSSetTopHitWithReasonString(1, v303, CFSTR("hasShortCut Safar edge case"), 1));
            }
          }
          else
          {
            v290 = (uint64_t)v60;
          }
          if (objc_msgSend(v78, "type") == 26)
            v85 = v288;
          else
            v85 = 0;
          if (v85 == 1)
          {
            objc_msgSend(v78, "rankingItem");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "L2FeatureVector");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "originalL2Score");
            v89 = v88 == 0.0;

            if (v89)
              goto LABEL_288;
          }
          objc_msgSend(v282, "bundleIdentifier");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v90, "isEqualToString:", CFSTR("com.apple.dictionary")))
          {
            v91 = objc_msgSend(v78, "topHit") == 2;

            if ((v91 & (v281 | v285) & 1) == 0)
              goto LABEL_288;
          }
          else
          {

            if ((v281 | v285) != 1)
              goto LABEL_288;
          }
          if (objc_msgSend(v78, "topHit"))
            v92 = 1;
          else
            v92 = v284;
          if ((v92 & 1) == 0 && (objc_msgSend(v79, "shouldHideUnderShowMore") & 1) != 0
            || (v285 | objc_msgSend(v78, "forceNoTopHit") ^ 1) != 1)
          {
            goto LABEL_288;
          }
          -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "lock");

          PRSLogCategoryDefault();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            -[SSRankingManager query](self, "query");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "cepBlocklistSet");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "applicationBundleIdentifier");
            v154 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138412802;
            v343 = v151;
            v344 = 2112;
            v345 = v153;
            v346 = 2112;
            v347 = v154;
            _os_log_debug_impl(&dword_1B86C5000, v94, OS_LOG_TYPE_DEBUG, "query %@: blocklist %@, result app bundleid %@", buf, 0x20u);

          }
          objc_msgSend(v78, "applicationBundleIdentifier");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          if (v95)
          {
            -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "cepBlocklistSet");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            if (v97)
            {
              -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "cepBlocklistSet");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "applicationBundleIdentifier");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "lowercaseString");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = objc_msgSend(v99, "containsObject:", v101);

              if ((v102 & 1) != 0)
                goto LABEL_288;
            }
            else
            {

            }
          }
          -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "unlock");

          objc_msgSend(v79, "lastAccessDate");
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v285 & (*((_QWORD *)&obja + 1) != 0)) == 1 && v104)
          {
            objc_msgSend(*((id *)&obja + 1), "laterDate:", v104);
            v275 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v275 = v104;
          }
          v277 = objc_msgSend(v79, "bundleIDType");
          v265 = objc_msgSend(v79, "bundleIDType");
          if ((objc_msgSend(v79, "bundleIDType") & 0x40000) != 0)
          {
            objc_msgSend(v78, "contentType");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v267 = objc_msgSend(v105, "isEqualToString:", CFSTR("com.apple.quicktime-movie"));

          }
          else
          {
            v267 = 0;
          }
          objc_msgSend(v276, "currentTime");
          v107 = v106;
          objc_msgSend(v275, "timeIntervalSinceReferenceDate");
          if ((v277 & 4) != 0)
          {
            if ((v108 <= 0.0 || v108 < v107 + -47304000.0)
              && (objc_msgSend(v276, "wasItemCreatedWithinAWeek:", v79) & 1) == 0)
            {
              goto LABEL_288;
            }
            if (objc_msgSend(v276, "queryTermCount") == 1)
            {
              objc_msgSend(v79, "firstMatchedAltName");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = v109 == 0;

              if (v110
                && (*(_BYTE *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v79) & 0x82) != 0
                && (*(_QWORD *)-[PRSRankingItem attrCountsPrefix]((uint64_t)v79) & 0xFFFFFFFFFFFFFF7DLL) == 0)
              {
                goto LABEL_288;
              }
            }
          }
          v111 = objc_msgSend(v79, "didMatchRankingDescriptor:", CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch"));
          if ((v111 & 1) != 0)
          {
            v112 = 0;
          }
          else
          {
            objc_msgSend(v282, "bundleIdentifier");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v113, "isEqualToString:", CFSTR("com.apple.mobilesafari"))
              && (int)objc_msgSend(v78, "topHit") >= 1)
            {
              v112 = objc_msgSend(v78, "forceNoTopHit") ^ 1;
            }
            else
            {
              v112 = 0;
            }

          }
          if ((objc_msgSend(v79, "didMatchRankingDescriptor:", CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch")) & 1) != 0)
          {
            v114 = 1;
          }
          else
          {
            objc_msgSend(v79, "L2FeatureVector");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(v115, "displayNameFuzzySpecialInsertion");

          }
          v274 = objc_msgSend(v79, "didMatchRankingDescriptor:", CFSTR("kMDItemDisplayNameOrSubjectOrTitleExactMatch"));
          v271 = objc_msgSend(v79, "didMatchRankingDescriptor:", CFSTR("kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch"));
          v116 = objc_msgSend(v79, "didMatchRankingDescriptor:", CFSTR("kMDItemAlternateNameExactMatch"));
          if (v288)
          {
            objc_msgSend(v79, "L2FeatureVector");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "scoreForFeature:", 2327);
            v119 = v118 != 0.0;

            objc_msgSend(v79, "L2FeatureVector");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "scoreForFeature:", 1614);
            v122 = v121;

            objc_msgSend(v79, "L2FeatureVector");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "scoreForFeature:", 189);
            v125 = v124;

            v126 = v125 != 2147500000.0 || v248 > 4;
            v127 = v122 == 0.0 && v126;
            if (v249 && v127)
            {
              objc_msgSend(v79, "L2FeatureVector");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "originalL2Score");
              v130 = v129 < v39;

              v127 = !v130;
            }
            objc_msgSend(v79, "L2FeatureVector");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "scoreForFeature:", 1621);
            v133 = v132;

            v134 = v133 == 0.0 && v126;
            v268 = v134;
            objc_msgSend(v79, "L2FeatureVector");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "scoreForFeature:", 34);
            v137 = v136;

            v264 = v137 == 1.0;
          }
          else
          {
            v119 = 0;
            v127 = 0;
            v268 = 0;
            v264 = 0;
          }
          v138 = objc_msgSend(v276, "isAltNamePrefixMatchOnlyTopHitExcludedQuery");
          v263 = v112 | v111;
          if (((v112 | v111 | v114 | v274 | v271) & 1) != 0)
            v139 = 1;
          else
            v139 = (v116 | v119 | (v127 || v284)) & (v138 & v251 ^ 1);
          if (v272)
          {
            if (objc_msgSend(v79, "topHitReason") == 15)
            {
              v139 = 1;
            }
            else if (v295)
            {
              v139 = 0;
            }
          }
          if (v283 == 16)
            v140 = v269;
          else
            v140 = 0;
          if (((objc_msgSend(v279, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) != 0
             || (objc_msgSend(v279, "isEqualToString:", CFSTR("com.apple.conversion")) & 1) != 0
             || (objc_msgSend(v279, "isEqualToString:", CFSTR("com.apple.worldclock")) & 1) != 0
             || objc_msgSend(v279, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions")))
            && objc_msgSend(v78, "topHit") == 2)
          {
            objc_msgSend((id)v337[5], "results");
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            v191 = v190 == 0;

            if (v191)
            {
              v192 = (void *)objc_opt_new();
              objc_msgSend((id)v337[5], "setResults:", v192);

            }
            if (objc_msgSend((id)v337[5], "resultsCount"))
              objc_msgSend((id)v337[5], "removeResultsInRange:", 0, objc_msgSend((id)v337[5], "resultsCount"));
            objc_msgSend((id)v337[5], "setRelatedSectionBundleIdentifier:", v279);
            objc_msgSend((id)v337[5], "addResults:atIndex:", v78, 0);
            v231 = 1;
            v61 = 1;
            goto LABEL_324;
          }
          v141 = objc_msgSend((id)v337[5], "resultsCount");
          v142 = objc_msgSend((id)v337[5], "maxInitiallyVisibleResults");
          v143 = v272 ^ 1;
          if (v141 < v142)
            v143 = 1;
          if ((v143 & 1) == 0 && objc_msgSend(v79, "topHitReason") == 15)
          {
            objc_msgSend((id)v337[5], "results");
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = v193 == 0;

            if (v194)
            {
              v195 = (void *)objc_opt_new();
              objc_msgSend((id)v337[5], "setResults:", v195);

            }
            if (objc_msgSend((id)v337[5], "resultsCount"))
              objc_msgSend((id)v337[5], "removeResultsInRange:", 0, objc_msgSend((id)v337[5], "resultsCount"));
            objc_msgSend((id)v337[5], "setRelatedSectionBundleIdentifier:", v279);
            objc_msgSend((id)v337[5], "addResults:atIndex:", v78, 0);
            v61 = 0;
LABEL_324:

            v60 = (void *)v290;
            goto LABEL_82;
          }
          v262 = objc_msgSend(v79, "displayNameInitialsPrefixMatchOnly");
          v261 = objc_msgSend(v79, "displayNameInitialsFirstWordAndMoreMatchOnly");
          v144 = objc_msgSend((id)v337[5], "resultsCount");
          v145 = v140 | v139;
          if (v144 >= objc_msgSend((id)v337[5], "maxInitiallyVisibleResults"))
            goto LABEL_243;
          if ((v277 & 4) == 0
            || (objc_msgSend(v78, "contactIdentifier"),
                v256 = (void *)objc_claimAutoreleasedReturnValue(),
                (objc_msgSend(v256, "isEqualToString:", sMeContactIdentifier) ^ 1 | v274) == 1))
          {
            if ((v145 & 1) != 0
              || (objc_msgSend(v282, "bundleIdentifier"),
                  v247 = (void *)objc_claimAutoreleasedReturnValue(),
                  (objc_msgSend(v247, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) != 0))
            {
              v146 = 0;
              v147 = 0;
              goto LABEL_204;
            }
            objc_msgSend(v282, "bundleIdentifier");
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v242, "isEqualToString:", CFSTR("com.apple.conversion")) & 1) != 0)
            {
              v147 = 0;
              v146 = 1;
              goto LABEL_204;
            }
            objc_msgSend(v282, "bundleIdentifier");
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v237, "isEqualToString:", CFSTR("com.apple.worldclock")) & 1) != 0)
            {
              v146 = 1;
              v147 = 1;
LABEL_204:
              v148 = 0;
              if ((v266 & (v277 >> 2) & v244 & 1) != 0)
              {
                v149 = 0;
                goto LABEL_237;
              }
LABEL_219:
              if (((v266 & v288 ^ 1 | v274 | v268) & 1) != 0)
              {
                v155 = 0;
                goto LABEL_226;
              }
              v156 = !v264 | v262 | v261;
              if ((v156 & 1) != 0
                || (objc_msgSend(v79, "displayNameInitials"), (v233 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                v155 = v156 ^ 1;
                if ((v255 & 1) != 0)
                {
LABEL_235:
                  v149 = 0;
                  if (v155)
                    goto LABEL_236;
LABEL_231:
                  if (v148)
                    goto LABEL_232;
LABEL_237:
                  if (v147)
                    goto LABEL_238;
LABEL_233:
                  if (!v146)
                    goto LABEL_240;
LABEL_239:

                  goto LABEL_240;
                }
              }
              else
              {
                v233 = 0;
                v155 = 1;
              }
LABEL_226:
              if ((!v266 | v288 | v230 ^ 1 | v285 ^ 1) != 1)
                goto LABEL_235;
              if (v283 == 16)
                v149 = v266 & (v265 >> 18) & v254 ^ 1;
              else
                v149 = 1;
              if ((v155 & 1) == 0)
                goto LABEL_231;
LABEL_236:

              if ((v148 & 1) == 0)
                goto LABEL_237;
LABEL_232:

              if ((v147 & 1) == 0)
                goto LABEL_233;
LABEL_238:

              if ((v146 & 1) != 0)
                goto LABEL_239;
LABEL_240:
              if ((v145 & 1) != 0)
              {
                if ((v277 & 4) != 0)
                  goto LABEL_242;
LABEL_256:
                if (v149)
                  goto LABEL_257;
              }
              else
              {

                if (((v277 >> 2) & 1) == 0)
                  goto LABEL_256;
LABEL_242:

                if ((v149 & 1) != 0)
                {
LABEL_257:
                  objc_storeStrong(v331 + 5, v282);
                  objc_msgSend(v282, "bundleIdentifier");
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v337[5], "setRelatedSectionBundleIdentifier:", v171);

                  objc_msgSend((id)v337[5], "addResults:", v78);
                  if ((v277 & 4) == 0)
                  {
                    v252 |= v263;
                    v239 |= v263 & v288;
                    LODWORD(v235) = v114 & v288 | v235;
                    v243 |= v274 & v288;
                    HIDWORD(v234) |= v284 & v288;
                    LODWORD(v234) = v271 & v288 | v234;
                  }
                  goto LABEL_288;
                }
              }
LABEL_243:
              objc_msgSend((id)v337[5], "resultSet");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "firstObject");
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "sectionBundleIdentifier");
              v159 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) != 0
                || (objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.conversion")) & 1) != 0
                || (objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.worldclock")) & 1) != 0)
              {
                v160 = 1;
              }
              else
              {
                v160 = objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"));
              }
              objc_msgSend(v79, "L2FeatureVector");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "originalL2Score");
              v163 = v162;

              PRSLogCategoryDefault();
              v164 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG))
              {
                -[SSRankingManager query](self, "query");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "applicationBundleIdentifier");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v175 = v174;
                if (!v174)
                {
                  objc_msgSend(v78, "sectionBundleIdentifier");
                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                  v175 = v228;
                }
                *(_DWORD *)buf = 138412802;
                v343 = v173;
                v344 = 2112;
                v345 = v175;
                v346 = 2048;
                v347 = v163;
                _os_log_debug_impl(&dword_1B86C5000, v164, OS_LOG_TYPE_DEBUG, "query %@: Top Hit score for result %@ %f", buf, 0x20u);
                if (!v174)

              }
              objc_msgSend((id)v337[5], "results");
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              v166 = objc_msgSend(v165, "count");

              if (v166)
              {
                objc_msgSend((id)v337[5], "resultsAtIndex:", 0);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v167, "rankingItem");
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v160 & 1) == 0)
                {
                  if ((v257 & 1) != 0)
                  {
                    v168 = v270;
                    goto LABEL_252;
                  }
                  if (((v250 | v267) & 1) == 0)
                  {
                    objc_msgSend(v78, "sectionBundleIdentifier");
                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                    v270 = v172;
                    v168 = v159;
                    if (v159 != v172)
                    {

                      goto LABEL_281;
                    }
LABEL_252:
                    v169 = v145 & v266 & v288 ^ 1 | v274;
                    if (((v169 | v268) & 1) != 0)
                    {
                      v170 = v169 ^ 1 | v145;
                    }
                    else if (((!v264 | v262 | v261) & 1) != 0)
                    {
                      v170 = v246;
                    }
                    else
                    {
                      objc_msgSend(v79, "displayNameInitials");
                      v176 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v176)
                        v177 = v255 ^ 1;
                      else
                        v177 = 1;

                      v170 = v177 | v245;
                    }
                    if ((v257 & 1) != 0)
                    {
                      if (v170)
                      {
LABEL_276:
                        if (!v167 || (objc_msgSend(v286, "bundleIDType") & 0x100) != 0)
                        {
                          v180 = 1;
                        }
                        else
                        {
                          objc_msgSend(v286, "L2FeatureVector");
                          v178 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v178, "originalL2Score");
                          v180 = v163 >= v179;

                        }
                        v184 = !v180;
                        if (!(v243 & 1 | ((v274 & 1) == 0)) && (v184 & 1) == 0)
                        {
                          ((void (**)(_QWORD, id, id))v238)[2](v238, v78, v282);
                          v243 = 1;
                          goto LABEL_311;
                        }
                        v185 = v243 | v239 | v184;
                        if (((v263 ^ 1 | v185) & 1) == 0)
                        {
                          ((void (**)(_QWORD, id, id))v238)[2](v238, v78, v282);
                          v243 = 0;
                          v239 = 1;
                          goto LABEL_311;
                        }
                        if (((v263 ^ 1 | v235 | v185) & 1) == 0)
                        {
                          ((void (**)(_QWORD, id, id))v238)[2](v238, v78, v282);
                          v239 = 0;
                          v243 = 0;
                          LODWORD(v235) = 1;
                          goto LABEL_311;
                        }
                        if (((!v284 | HIDWORD(v234) | v235 | v239 | v243 | v184) & 1) == 0)
                        {
                          ((void (**)(_QWORD, id, id))v238)[2](v238, v78, v282);
                          v239 = 0;
                          v243 = 0;
                          HIDWORD(v234) = 1;
                          LODWORD(v235) = 0;
                          goto LABEL_311;
                        }
                        if (((v271 ^ 1 | v234 | v239 | v235 | HIDWORD(v234) | v243 | v184) & 1) == 0)
                        {
                          ((void (**)(_QWORD, id, id))v238)[2](v238, v78, v282);
                          v239 = 0;
                          LODWORD(v235) = 0;
                          v243 = 0;
                          v234 = 1;
                          goto LABEL_311;
                        }
                        objc_msgSend(v78, "sectionBundleIdentifier");
                        v186 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v159 == v186)
                        {

                        }
                        else
                        {
                          if (!objc_msgSend(v159, "isEqualToString:", CFSTR("com.apple.application")))
                          {

                            goto LABEL_308;
                          }
                          objc_msgSend(v78, "sectionBundleIdentifier");
                          v187 = (void *)objc_claimAutoreleasedReturnValue();
                          v188 = objc_msgSend(v187, "isEqualToString:", CFSTR("com.apple.app-clips"));

                          if (!v188)
                          {
LABEL_308:
                            if (v251 && (unint64_t)objc_msgSend(v292, "count") >= 2)
                              ((void (**)(_QWORD, id, id))v238)[2](v238, v78, v282);
LABEL_311:
                            v189 = HIDWORD(v235);
                            v258 |= v288;
                            if (!v288)
                              v189 = v269 | HIDWORD(v235);
                            HIDWORD(v235) = v189;
LABEL_286:

LABEL_287:
                            v270 = v168;
                            goto LABEL_288;
                          }
                        }
                        objc_msgSend((id)v337[5], "addResults:", v78);
                        goto LABEL_311;
                      }
                    }
                    else
                    {

                      if ((v170 & 1) != 0)
                        goto LABEL_276;
                    }
                    v270 = v168;
                  }
                }
LABEL_281:
                objc_msgSend(v286, "L2FeatureVector");
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v181, "originalL2Score");
                v183 = v163 <= v182;

                if (!(v183 | v258 & 1 | ((v277 & 4) == 0) | v252 & 1))
                {
                  if (v274)
                    ((void (**)(_QWORD, id, id))v238)[2](v238, v78, v282);
                  v258 = 0;
                }
                v168 = v270;
                goto LABEL_286;
              }
              v168 = v270;
              goto LABEL_287;
            }
            objc_msgSend(v282, "bundleIdentifier");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v232, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions")) & 1) != 0)
            {
              if ((v266 & (v277 >> 2) & v244) != 1)
              {
                v148 = 1;
                v147 = 1;
                v146 = 1;
                goto LABEL_219;
              }

            }
            else
            {

              if (((v277 >> 2) & 1) == 0)
                goto LABEL_243;
            }
          }

          goto LABEL_243;
        }
LABEL_81:
        v61 = 0;
LABEL_82:

        ++v273;
      }
      while (v273 != v259);
      v196 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v309, v348, 16);
      v259 = v196;
      if (!v196)
        goto LABEL_328;
    }
  }
  v258 = 0;
  BYTE4(v235) = 0;
  v275 = 0;
  v60 = 0;
  v231 = 0;
LABEL_328:

  if (((v258 | BYTE4(v235)) & 1) != 0)
    v197 = 8;
  else
    v197 = 1;
  if (a10)
    v197 = a10;
  v296 = v197;
  objc_msgSend((id)v337[5], "results", v227);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v293 = objc_msgSend(v198, "count");
  if ((_QWORD)obja)
  {
    v199 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v276, "currentTime");
    objc_msgSend(v199, "dateWithTimeIntervalSinceReferenceDate:");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_alloc(MEMORY[0x1E0C99D48]);
    v201 = (void *)objc_msgSend(v200, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v202 = 0;
    v203 = -1;
    v204 = -1;
    while (v202 < objc_msgSend(v198, "count"))
    {
      objc_msgSend(v198, "objectAtIndex:", v202);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = v205;
      if (v205 == (void *)obja)
      {
        v204 = v202;
      }
      else if (v203 < 0)
      {
        objc_msgSend(v205, "rankingItem");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v207, "attributes"), 0x20uLL);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v208
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || ((v209 = objc_msgSend(v201, "isDate:inSameDayAsDate:", v208, v299), *((_QWORD *)&obja + 1))
            ? (v210 = v209)
            : (v210 = 0),
              v210 != 1
           || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
           || objc_msgSend(*((id *)&obja + 1), "compare:", v208) != -1))
        {
          v203 = v202;
        }

      }
      ++v202;
    }

  }
  else
  {
    v203 = -1;
    v204 = -1;
  }
  objc_msgSend((id)v337[5], "resultSet");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "firstObject");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "sectionBundleIdentifier");
  v213 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_QWORD)obja)
  {
    if (v293)
    {
      if ((v203 & 0x8000000000000000) == 0
        && v203 < v296
        && (objc_msgSend(v213, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) == 0
        && (objc_msgSend(v213, "isEqualToString:", CFSTR("com.apple.conversion")) & 1) == 0
        && (objc_msgSend(v213, "isEqualToString:", CFSTR("com.apple.worldclock")) & 1) == 0
        && (objc_msgSend(v213, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions")) & 1) == 0
        && ((objc_msgSend(v213, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0
         || objc_msgSend(v213, "isEqualToString:", CFSTR("com.apple.app-clips"))))
      {
        objc_msgSend((id)obja, "sectionBundleIdentifier");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v214, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0)
        {
          v215 = 0;
          v216 = 1;
        }
        else
        {
          v226 = objc_msgSend(v214, "isEqualToString:", CFSTR("com.apple.application"));
          if (v203)
            v216 = v226;
          else
            v216 = 1;
          v215 = (v203 == 0) & ~v226;
        }

        goto LABEL_365;
      }
    }
    else
    {
      v203 = 0;
      v215 = 0;
      v216 = 1;
LABEL_365:
      if (!v216 || v204 < 0 || v204 > v203)
      {
        if (v216 && (v266 & v230 & 1) == 0)
        {
          -[NSMutableString insertString:atIndex:](self->_logValues, "insertString:atIndex:", CFSTR("Top Hit is a shortcut result\n"), 0);
          if ((v204 & 0x8000000000000000) == 0)
          {
            objc_msgSend((id)v337[5], "resultSet");
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "removeObject:", (_QWORD)obja);

          }
          objc_msgSend((id)v337[5], "addResults:atIndex:", (_QWORD)obja, v203);
          objc_msgSend(v302, "setTopHitReason:", 17);
          if (v296 >= 1 && objc_msgSend((id)v337[5], "resultsCount") > (unint64_t)v296)
            objc_msgSend((id)v337[5], "removeResultsAtIndex:", objc_msgSend((id)v337[5], "resultsCount") - 1);
          if (v215)
            objc_msgSend((id)v337[5], "removeResultsInRange:", 1, objc_msgSend((id)v337[5], "resultsCount") - 1);
          if (v300 && !v203)
          {
            objc_storeStrong(v331 + 5, v300);
            objc_msgSend(v300, "bundleIdentifier");
            v218 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v337[5], "setRelatedSectionBundleIdentifier:", v218);

          }
          objc_msgSend((id)obja, "sectionBundleIdentifier");
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "setShortcutSectionBundleID:", v219);

          v231 = 1;
        }
      }
      else
      {
        objc_msgSend(v302, "setTopHitReason:", 17);
        v231 |= v204 == 0;
      }
    }
  }
  -[SSRankingManager applyTopHitRankingPolicyToSection:topResultSection:maxTopHitCount:isShortcut:](self, "applyTopHitRankingPolicyToSection:topResultSection:maxTopHitCount:isShortcut:", v337[5], v331[5], v296, v231 & 1);
  objc_msgSend((id)v337[5], "results");
  v221 = (void *)objc_claimAutoreleasedReturnValue();

  for (ii = 0; ii < objc_msgSend(v221, "count"); ++ii)
  {
    objc_msgSend(v221, "objectAtIndex:", ii);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "rankingItem");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "setBundleIDType:", objc_msgSend(v224, "bundleIDType") | 0x8000);

  }
  v14 = (id)v337[5];

  _Block_object_dispose(&v330, 8);
  _Block_object_dispose(&v336, 8);

LABEL_386:
  return v14;
}

+ (id)getLegacyTophitSection
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v0 = (id)sLegacyTophitSection;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

void __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRelatedSectionBundleIdentifier:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "sectionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
    {
      objc_msgSend(v8, "sectionBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
      {

      }
      else
      {
        objc_msgSend(v8, "sectionBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.searchd.syndicatedPhotos"));

        if ((v13 & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectAtIndex:", 0);
          goto LABEL_8;
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resultSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllObjects");
LABEL_8:

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addResults:atIndex:", v15, 0);

}

uint64_t __190__SSRankingManager_makeTopHitSectionUsingSections_withItemRanker_sectionHeader_shortcutResult_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_parsecEnabled_maxNumAppsInTopHitSection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "rankingItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v5, "rankingItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(v5, "rankingItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankingItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentTime");
    v12 = -objc_msgSend(v10, "compare:currentTime:", v11);

  }
  else
  {
    objc_msgSend(v5, "rankingItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v12 = -1;
    }
    else
    {
      objc_msgSend(v6, "rankingItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v14 != 0;
    }
  }

  return v12;
}

- (id)removeBlockListedSectionsForMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cepBlocklistSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v7)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v14))
            objc_msgSend(v8, "removeObjectForKey:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v15 = objc_msgSend(v8, "copy");
    v4 = (id)v15;
  }
  -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

  return v4;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if ((id)objc_opt_class() == a1)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    objc_msgSend(v7, "objectForKey:", CFSTR("meContactIdentifier"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sMeContactIdentifier;
    sMeContactIdentifier = v2;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.parsec.web_suggest"), CFSTR("com.apple.parsec.web_index"), CFSTR("com.apple.parsec.bing"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sSetOfSuggestedWebsitesBundleIDs;
    sSetOfSuggestedWebsitesBundleIDs = v4;

    v6 = (void *)sDefaultProbability;
    sDefaultProbability = (uint64_t)&unk_1E6E9A430;

    isInternalDevice = os_variant_has_internal_diagnostics();
  }
}

- (SSRankingManager)initWithQuery:(id)a3
{
  id v5;
  SSRankingManager *v6;
  SSRankingManager *v7;
  uint64_t v8;
  PRSRankingConfiguration *rankingConfiguration;
  uint64_t v10;
  NSMutableString *logValues;
  uint64_t v12;
  NSSet *allowedTopHitSections;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSRankingManager;
  v6 = -[SSRankingManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    v8 = objc_opt_new();
    rankingConfiguration = v7->_rankingConfiguration;
    v7->_rankingConfiguration = (PRSRankingConfiguration *)v8;

    if (isInternalDevice)
    {
      v10 = objc_opt_new();
      logValues = v7->_logValues;
      v7->_logValues = (NSMutableString *)v10;
    }
    else
    {
      logValues = v7->_logValues;
      v7->_logValues = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.application"), CFSTR("com.apple.MobileAddressBook"), CFSTR("com.apple.conversion"), CFSTR("com.apple.calculation"), CFSTR("com.apple.worldclock"), CFSTR("com.apple.datadetector.quick_actions"), CFSTR("com.apple.dictionary"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.app-clips"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
    allowedTopHitSections = v7->_allowedTopHitSections;
    v7->_allowedTopHitSections = (NSSet *)v12;

    v7->_bullseyeRankingEnabled = 0;
  }

  return v7;
}

- (int64_t)compareDate:(id)a3 withDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 && a4)
  {
    v5 = a4;
    objc_msgSend(a3, "timeIntervalSinceNow");
    v7 = v6;
    objc_msgSend(v5, "timeIntervalSinceNow");
    v9 = v8;

    if ((v7 <= 0.0 || v9 <= 0.0) && (v7 > 0.0 || v9 > 0.0))
      goto LABEL_14;
    v7 = fabs(v7);
    v9 = fabs(v9);
    if (v7 < v9)
      return -1;
    if (v7 <= v9)
    {
LABEL_14:
      if (v9 >= 0.0 || v7 <= 0.0)
        return 1;
      else
        return -1;
    }
    else
    {
      return 1;
    }
  }
  else if (a3)
  {
    return -1;
  }
  else
  {
    return a4 != 0;
  }
}

+ (id)jsonStringFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  uint64_t v28;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v16 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ResultBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.spotlight.websuggestionlist.usertypedstring"));

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), CFSTR("com.apple.spotlight.websuggestionlist.usertypedstring"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    if (objc_msgSend(v8, "hasPrefix:", v9))
    {
      objc_msgSend(v8, "substringFromIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = (void *)MEMORY[0x1E0CB3940];
      if (v11)
      {
        SSRedactString(v11, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v9, v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v9, &stru_1E6E549F0);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_19;
    }
    v18 = v8;
    goto LABEL_18;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ResultBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.spotlight.related_search")))
  {

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ResultBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.spotlight.related_search_as_typed.web"));

    v16 = v4;
    if (!v20)
      goto LABEL_21;
  }
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(CFSTR("rs:"), "length");
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("rs:")))
  {
    objc_msgSend(v8, "substringFromIndex:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v22;
    v23 = (void *)MEMORY[0x1E0CB3940];
    if (v22)
    {
      SSRedactString(v22, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@%@"), CFSTR("rs:"), v24);
      v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("rs:"), &stru_1E6E549F0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v15 = v18;
    goto LABEL_19;
  }
  v15 = v8;
LABEL_20:

  objc_msgSend(v7, "setObject:forKey:", v15, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 3, &v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    v26 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v25, 4);
  else
    v26 = &stru_1E6E549F0;

  return v26;
}

+ (void)rankLocalBundlesUsingL3Score:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v21 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v21, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
    if (objc_msgSend(v21, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rankingItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "keywordMatchScore");
        v15 = v14;

        if (v15 >= 0.0)
        {
          objc_msgSend(v9, "addObject:", v12);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        ++v11;
      }
      while (v11 < objc_msgSend(v21, "count"));
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__SSRankingManager_rankLocalBundlesUsingL3Score_sectionMapping_l3RankingScores___block_invoke;
    v22[3] = &unk_1E6E43378;
    v23 = v8;
    v24 = v7;
    objc_msgSend(v9, "sortWithOptions:usingComparator:", 16, v22);
    if (objc_msgSend(v9, "count"))
    {
      v17 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");
        objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "replaceObjectAtIndex:withObject:", v19, v20);

        ++v17;
      }
      while (v17 < objc_msgSend(v9, "count"));
    }

  }
}

uint64_t __80__SSRankingManager_rankLocalBundlesUsingL3Score_sectionMapping_l3RankingScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  float v10;
  void *v11;
  double v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  float v28;
  float v29;

  v5 = a2;
  v6 = a3;
  v7 = compareBestLocalResultsWithRules(v5, v6, 0);
  if (!v7)
  {
    objc_msgSend(v5, "rankingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "likelihood");
    v10 = v9;

    v29 = v10;
    objc_msgSend(v6, "rankingItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "likelihood");
    v13 = v12;

    v28 = v13;
    objc_msgSend(v5, "rankingItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keywordMatchScore");
    v16 = v15;

    objc_msgSend(v6, "rankingItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keywordMatchScore");
    v19 = v18;

    v21 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "rankingItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sectionBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankingItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sectionBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    LOWORD(v27) = 1;
    +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v21, v20, v23, v25, &v29, &v28, v27);

    if (v29 <= v28)
    {
      if (v28 <= v29)
      {
        if (v16 > v19)
        {
          v7 = 1;
          goto LABEL_8;
        }
        if (v19 <= v16)
        {
          v7 = 0;
          goto LABEL_8;
        }
      }
      v7 = -1;
    }
  }
LABEL_8:

  return -v7;
}

+ (id)rankLocalBundlesUsingOriginalL2ScoreAndRules:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (isInternalDevice)
    v10 = (void *)objc_opt_new();
  else
    v10 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__SSRankingManager_rankLocalBundlesUsingOriginalL2ScoreAndRules_sectionMapping_l3RankingScores___block_invoke;
  v17[3] = &unk_1E6E43148;
  v11 = v10;
  v18 = v11;
  v19 = v9;
  v20 = v8;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v7, "sortWithOptions:usingComparator:", 1, v17);
  v14 = v20;
  v15 = v11;

  return v15;
}

uint64_t __96__SSRankingManager_rankLocalBundlesUsingOriginalL2ScoreAndRules_sectionMapping_l3RankingScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  float v25;
  float v26;

  v5 = a2;
  v6 = a3;
  v7 = compareBestLocalResultsWithRules(v5, v6, *(void **)(a1 + 32));
  if (!v7)
  {
    objc_msgSend(v5, "rankingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "L2FeatureVector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "originalL2Score");
    v11 = v10;

    v26 = v11;
    objc_msgSend(v6, "rankingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "originalL2Score");
    v15 = v14;

    v25 = v15;
    v17 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "rankingItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sectionBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankingItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sectionBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v24) = 256;
    +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v17, v16, v19, v21, &v26, &v25, v24);

    if (v26 <= v25)
    {
      if (v25 <= v26)
        v7 = 0;
      else
        v7 = -1;
    }
    else
    {
      v7 = 1;
    }
  }
  v22 = -v7;

  return v22;
}

+ (id)rankLocalBundlesUsingModelL3ScoreAndRules:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
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
  float v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  void *v55;
  uint64_t v56;
  void *v57;
  float v58;
  void *v59;
  void *v60;
  void *v61;
  float v62;
  void *v63;
  void *v64;
  void *v65;
  float v66;
  void *v67;
  void *v68;
  float v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id v74;
  id v76;
  id v77;
  id obj;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  uint8_t buf[4];
  void *v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (isInternalDevice)
    v10 = (void *)objc_opt_new();
  else
    v10 = 0;
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __93__SSRankingManager_rankLocalBundlesUsingModelL3ScoreAndRules_sectionMapping_l3RankingScores___block_invoke;
  v87[3] = &unk_1E6E43148;
  v76 = v10;
  v88 = v76;
  v80 = v9;
  v89 = v80;
  v77 = v8;
  v90 = v77;
  objc_msgSend(v7, "sortWithOptions:usingComparator:", 1, v87);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v7;
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
  if (v81)
  {
    v79 = *(_QWORD *)v84;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v84 != v79)
          objc_enumerationMutation(obj);
        v82 = v11;
        v12 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v11);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v12, "sectionBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "sectionBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("bundle_id"));

        }
        objc_msgSend(v12, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v12, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("identifier"));

        }
        objc_msgSend(v12, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v12, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "text");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          SSRedactString(v21, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v22, CFSTR("title"));

        }
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "rankingItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%i"), objc_msgSend(v24, "shouldHideUnderShowMore"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v25, CFSTR("should_hide_under_show_more"));

        objc_msgSend(v12, "rankingItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "L2FeatureVector");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v12, "rankingItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "L2FeatureVector");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "originalL2Score");
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%f"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v32, CFSTR("original_l2_score"));

        }
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "rankingItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "likelihood");
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%f"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v36, CFSTR("likelihood"));

        v37 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "rankingItem");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "keywordMatchScore");
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%f"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v40, CFSTR("topicality_score"));

        v41 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "rankingItem");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "engagementScore");
        objc_msgSend(v41, "stringWithFormat:", CFSTR("%f"), v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v44, CFSTR("engagement_score"));

        v45 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "rankingItem");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "freshnessScore");
        objc_msgSend(v45, "stringWithFormat:", CFSTR("%f"), v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v48, CFSTR("freshness_score"));

        objc_msgSend(v12, "rankingItem");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "sectionBundleIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
        {
          objc_msgSend(v12, "sectionBundleIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v80, "objectForKey:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          v53 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v51, "iFunScore");
          objc_msgSend(v53, "stringWithFormat:", CFSTR("%f"), v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v55, CFSTR("iFunScore"));

          v56 = 0;
          do
          {
            v57 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v52, "getL3Score:isLegacy:", v56, 0);
            objc_msgSend(v57, "stringWithFormat:", CFSTR("%f"), v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("l3Score[%i]"), v56);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v59, v60);

            v61 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v52, "getL3Score:isLegacy:", v56, 1);
            objc_msgSend(v61, "stringWithFormat:", CFSTR("%f"), v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("l3ScoreLegacy[%i]"), v56);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v63, v64);

            v56 = (v56 + 1);
          }
          while ((_DWORD)v56 != 3);
          v65 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v52, "serverRelevanceScore");
          objc_msgSend(v65, "stringWithFormat:", CFSTR("%f"), v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v67, CFSTR("serverRelevanceScore"));

          v68 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v52, "modelScore");
          objc_msgSend(v68, "stringWithFormat:", CFSTR("%f"), v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v70, CFSTR("modelScore"));

        }
        SSGeneralLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v13);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v92 = v72;
          _os_log_impl(&dword_1B86C5000, v71, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: local_bundles_model_results = %@", buf, 0xCu);

        }
        v11 = v82 + 1;
      }
      while (v82 + 1 != v81);
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
    }
    while (v81);
  }

  v73 = v90;
  v74 = v76;

  return v74;
}

uint64_t __93__SSRankingManager_rankLocalBundlesUsingModelL3ScoreAndRules_sectionMapping_l3RankingScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  float v30;
  float v31;

  v5 = a2;
  v6 = a3;
  v7 = compareBestLocalResultsWithRules(v5, v6, *(void **)(a1 + 32));
  if (!v7)
  {
    objc_msgSend(v5, "rankingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "L2FeatureVector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "originalL2Score");
    v11 = v10;

    v31 = v11;
    objc_msgSend(v6, "rankingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "originalL2Score");
    v15 = v14;

    v30 = v15;
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "rankingItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sectionBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankingItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sectionBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v29) = 256;
    +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v16, v17, v19, v21, &v31, &v30, v29);

    v22 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "rankingItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sectionBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankingItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sectionBundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SectionL3Scores getComparableModelL3Score:bundleId1:bundleId2:score1:score2:](SectionL3Scores, "getComparableModelL3Score:bundleId1:bundleId2:score1:score2:", v22, v24, v26, &v31, &v30);

    if (v31 <= v30)
    {
      if (v30 <= v31)
        v7 = 0;
      else
        v7 = -1;
    }
    else
    {
      v7 = 1;
    }
  }
  v27 = -v7;

  return v27;
}

+ (id)rankLocalBundles:(id)a3 sectionMapping:(id)a4 l3RankingScores:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
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
  void *v31;
  void *v32;
  void *v33;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  void *v59;
  id v60;
  id v61;
  id v62;
  id obj;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[SSRankingManager rankLocalBundlesUsingOriginalL2ScoreAndRules:sectionMapping:l3RankingScores:](SSRankingManager, "rankLocalBundlesUsingOriginalL2ScoreAndRules:sectionMapping:l3RankingScores:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (SSEnableSpotlightTopHitPersonalizedRanking())
    +[SSRankingManager rankLocalBundlesUsingL3Score:sectionMapping:l3RankingScores:](SSRankingManager, "rankLocalBundlesUsingL3Score:sectionMapping:l3RankingScores:", v7, v8, v9);
  if (isInternalDevice)
  {
    v59 = v10;
    v60 = v9;
    v61 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v62 = v7;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v66 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          v16 = (void *)objc_opt_new();
          objc_msgSend(v15, "sectionBundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v15, "sectionBundleIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("bundle_id"));

          }
          objc_msgSend(v15, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v15, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("identifier"));

          }
          objc_msgSend(v15, "title");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "text");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v15, "title");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "text");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            SSRedactString(v24, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v25, CFSTR("title"));

          }
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "rankingItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%i"), objc_msgSend(v27, "shouldHideUnderShowMore"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v28, CFSTR("should_hide_under_show_more"));

          objc_msgSend(v15, "rankingItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "L2FeatureVector");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v31 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v15, "rankingItem");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "L2FeatureVector");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "originalL2Score");
            objc_msgSend(v31, "stringWithFormat:", CFSTR("%f"), v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v35, CFSTR("original_l2_score"));

          }
          v36 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "rankingItem");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "likelihood");
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%f"), v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v39, CFSTR("likelihood"));

          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "rankingItem");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "keywordMatchScore");
          objc_msgSend(v40, "stringWithFormat:", CFSTR("%f"), v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v43, CFSTR("topicality_score"));

          v44 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "rankingItem");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "engagementScore");
          objc_msgSend(v44, "stringWithFormat:", CFSTR("%f"), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v47, CFSTR("engagement_score"));

          v48 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "rankingItem");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "freshnessScore");
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%f"), v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v51, CFSTR("freshness_score"));

          objc_msgSend(v64, "addObject:", v16);
          SSGeneralLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v16);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v70 = v53;
            _os_log_impl(&dword_1B86C5000, v52, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: local_bundles_rule_results = %@", buf, 0xCu);

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v12);
    }

    SSGeneralLog();
    v54 = objc_claimAutoreleasedReturnValue();
    v10 = v59;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v59);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v70 = v55;
      _os_log_impl(&dword_1B86C5000, v54, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: local_bundles_rules = %@", buf, 0xCu);

    }
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v56, "setObject:forKey:", v64, CFSTR("l3_local_bundles_results"));
    objc_msgSend(v56, "setObject:forKey:", v59, CFSTR("l3_local_bundles_rules"));
    +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v56);
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v8 = v61;
    v7 = v62;
    v9 = v60;
  }
  else
  {
    v57 = &stru_1E6E549F0;
  }

  return v57;
}

+ (void)logL3Results:(id)a3 l3Info:(id)a4
{
  id v5;
  uint64_t i;
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
  void *v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  float v53;
  void *v54;
  uint64_t v55;
  void *v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  float v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  void *v67;
  float v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id obj;
  int v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  int v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v77 = a4;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v5;
  v80 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v80)
  {
    v76 = 0;
    v78 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v80; ++i)
      {
        if (*(_QWORD *)v82 != v78)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        if (objc_msgSend(v7, "resultsCount"))
        {
          v79 = v7;
          objc_msgSend(v7, "resultsAtIndex:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_opt_new();
          objc_msgSend(v8, "sectionBundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v8, "sectionBundleIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("bundle_id"));

          }
          objc_msgSend(v8, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v8, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("identifier"));

          }
          objc_msgSend(v8, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v8, "title");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "text");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            SSRedactString(v17, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("title"));

          }
          v19 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "rankingItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%i"), objc_msgSend(v20, "shouldHideUnderShowMore"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("should_hide_under_show_more"));

          objc_msgSend(v8, "rankingItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "L2FeatureVector");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "rankingItem");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "L2FeatureVector");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "originalL2Score");
            objc_msgSend(v24, "stringWithFormat:", CFSTR("%f"), v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v28, CFSTR("original_l2_score"));

          }
          v29 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "l2score");
          objc_msgSend(v29, "stringWithFormat:", CFSTR("%f"), v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v31, CFSTR("result_l2_score"));

          v32 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "rankingItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "likelihood");
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%f"), v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v35, CFSTR("likelihood"));

          v36 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "rankingItem");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "keywordMatchScore");
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%f"), v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v39, CFSTR("topicality_score"));

          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "rankingItem");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "engagementScore");
          objc_msgSend(v40, "stringWithFormat:", CFSTR("%f"), v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v43, CFSTR("engagement_score"));

          v44 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "rankingItem");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "freshnessScore");
          objc_msgSend(v44, "stringWithFormat:", CFSTR("%f"), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v47, CFSTR("freshness_score"));

          objc_msgSend(v8, "rankingItem");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "sectionBundleIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v49)
          {
            objc_msgSend(v8, "sectionBundleIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v77, "objectForKey:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50)
          {
            v52 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v50, "iFunScore");
            objc_msgSend(v52, "stringWithFormat:", CFSTR("%f"), v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v54, CFSTR("iFunScore"));

            v55 = 0;
            do
            {
              v56 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v51, "getL3Score:isLegacy:", v55, 0);
              objc_msgSend(v56, "stringWithFormat:", CFSTR("%f"), v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("l3Score[%i]"), v55);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKey:", v58, v59);

              v60 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v51, "getL3Score:isLegacy:", v55, 1);
              objc_msgSend(v60, "stringWithFormat:", CFSTR("%f"), v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("l3ScoreLegacy[%i]"), v55);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKey:", v62, v63);

              v55 = (v55 + 1);
            }
            while ((_DWORD)v55 != 3);
            v64 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v51, "serverRelevanceScore");
            objc_msgSend(v64, "stringWithFormat:", CFSTR("%f"), v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v66, CFSTR("serverRelevanceScore"));

            v67 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v51, "modelScore");
            objc_msgSend(v67, "stringWithFormat:", CFSTR("%f"), v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v69, CFSTR("modelScore"));

            v70 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v79, "resultSet");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v71, "count"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v72, CFSTR("resultCount"));

          }
          SSGeneralLog();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v9);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v86 = ++v76;
            v87 = 2112;
            v88 = v74;
            _os_log_impl(&dword_1B86C5000, v73, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3: all_bundles_results %i = %@", buf, 0x12u);

          }
        }
      }
      v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    }
    while (v80);
  }

}

+ (id)getTopHitItems:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int16 v18;
  void *v19;
  void *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = v3;
  objc_msgSend(v3, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v8, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v8, "results");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                objc_msgSend(v16, "rankingItem");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "bundleIDType");

                if (v18 < 0)
                {
                  objc_msgSend(v16, "rankingItem");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "addObject:", v19);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v13);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)rankSectionsUsingBundleIDToSectionMapping:(id)a3 withRanker:(id)a4 preferredBundleIds:(id)a5 isScopedSearch:(BOOL)a6 queryId:(unint64_t)a7 isCJK:(BOOL)a8 isBullseyeNonCommittedSearch:(BOOL)a9 isBullseyeCommittedSearch:(BOOL)a10 isPeopleSearch:(BOOL)a11 queryContext:(id)a12
{
  uint64_t v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  char v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  unint64_t v56;
  unint64_t v57;
  size_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  BOOL v71;
  void *v72;
  void *v73;
  BOOL v74;
  void *v75;
  void *v76;
  BOOL v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  uint64_t v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t k;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  void *v99;
  void *v100;
  unint64_t v101;
  unint64_t v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t n;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  _BOOL4 v113;
  id v114;
  id v115;
  int v116;
  unint64_t ii;
  void *v118;
  void *v119;
  unint64_t jj;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t kk;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  unint64_t mm;
  void *v130;
  void *v131;
  unint64_t nn;
  void *v133;
  id v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  float v141;
  _BOOL4 v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t i1;
  void *v148;
  void *v149;
  BOOL v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  SectionL3Scores *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  double v160;
  void *v161;
  double v162;
  void *v163;
  double v164;
  void *v165;
  double v166;
  void *v167;
  double v168;
  void *v169;
  _BOOL4 v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  float v186;
  uint64_t i2;
  void *v188;
  void *v189;
  BOOL v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  float v195;
  float v196;
  void *v197;
  void *v198;
  float v199;
  float v200;
  void *v201;
  void *v202;
  float v203;
  float v204;
  void *v205;
  void *v206;
  float v207;
  float v208;
  void *v209;
  void *v210;
  float v211;
  float v212;
  float v213;
  void *v214;
  void *v215;
  float v216;
  float v217;
  float v218;
  void *v219;
  void *v220;
  float v221;
  float v222;
  float v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  float v227;
  float v228;
  float v229;
  uint64_t i3;
  void *v231;
  void *v232;
  BOOL v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  float v238;
  float v239;
  void *v240;
  void *v241;
  float v242;
  float v243;
  void *v244;
  void *v245;
  float v246;
  float v247;
  void *v248;
  void *v249;
  float v250;
  float v251;
  void *v252;
  void *v253;
  float v254;
  float v255;
  void *v256;
  void *v257;
  float v258;
  float v259;
  void *v260;
  void *v261;
  float v262;
  float v263;
  float v264;
  double v265;
  void *v266;
  double v267;
  void *v268;
  double v269;
  void *v270;
  double v271;
  void *v272;
  double v273;
  void *v274;
  double v275;
  void *v276;
  double v277;
  void *v278;
  double v279;
  void *v280;
  double v281;
  void *v282;
  double v283;
  void *v284;
  double v285;
  void *v286;
  double v287;
  void *v288;
  double v289;
  void *v290;
  double v291;
  void *v292;
  void *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t i4;
  void *v297;
  void *v298;
  BOOL v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  id v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t i5;
  void *v310;
  void *v311;
  BOOL v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t i6;
  void *v323;
  void *v324;
  BOOL v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  NSObject *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t i7;
  void *v335;
  void *v336;
  BOOL v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  id v343;
  id v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t i8;
  void *v348;
  NSObject *v349;
  void *v350;
  unint64_t v351;
  unint64_t v352;
  unint64_t v353;
  unint64_t v354;
  void *v355;
  float v356;
  float v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  double v364;
  void *v365;
  void *v366;
  float v367;
  float v368;
  _BOOL4 v369;
  void *v370;
  void *v371;
  int v372;
  void *v373;
  char v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  int IsSyndicatedPhotos;
  void *v380;
  void *v381;
  float v382;
  _BOOL4 v383;
  int v384;
  void *v385;
  int v386;
  void *v387;
  int v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  float v393;
  _BOOL4 v394;
  void *v395;
  void *v396;
  int v397;
  void *v398;
  void *v399;
  char v400;
  void *v401;
  char v402;
  char v403;
  void *v404;
  int v405;
  int v406;
  int v407;
  void *v408;
  char v409;
  void *v410;
  __CFString *v411;
  void *v412;
  void *v413;
  BOOL v414;
  __CFString *v415;
  void *v416;
  void *v417;
  __CFString *v418;
  float v419;
  float v420;
  void *v421;
  float v422;
  float v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  BOOL v428;
  void *v429;
  void *v430;
  BOOL v431;
  void *v432;
  void *v433;
  BOOL v434;
  void *v435;
  char v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  unint64_t i10;
  void *v442;
  void *v443;
  unint64_t i9;
  void *v445;
  char v446;
  void *v447;
  void *v448;
  void *v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t i11;
  void *v453;
  void *v454;
  void *v455;
  char v456;
  uint64_t v457;
  BOOL v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  int v466;
  void *v467;
  void *v468;
  float v469;
  void *v470;
  void *v471;
  int v472;
  int *v473;
  void *v474;
  float v475;
  float v476;
  void *v477;
  float v478;
  float v479;
  unint64_t v480;
  void *v481;
  float v482;
  float v483;
  uint64_t v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  float v496;
  float v497;
  void *v498;
  void *v499;
  void *v500;
  float v501;
  float v502;
  void *v503;
  void *v504;
  void *v505;
  float v506;
  float v507;
  void *v508;
  int v509;
  void *v510;
  int v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  float v516;
  float v517;
  void *v518;
  id v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  void *v524;
  float v525;
  float v526;
  void *v527;
  float v528;
  float v529;
  void *v530;
  float v531;
  float v532;
  void *v533;
  float v534;
  float v535;
  BOOL v536;
  BOOL v537;
  BOOL v538;
  id v539;
  void *v540;
  void *v541;
  void *v542;
  float v543;
  float v544;
  void *v545;
  float v546;
  float v547;
  void *v548;
  float v549;
  float v550;
  void *v551;
  float v552;
  float v553;
  id v554;
  BOOL v555;
  BOOL v556;
  uint64_t v557;
  uint64_t v558;
  void *v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t i13;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  float v568;
  float v569;
  id v570;
  float v572;
  float v573;
  float v574;
  float v575;
  uint64_t v576;
  uint64_t v577;
  void *v578;
  void *v579;
  float v580;
  void *v581;
  id v582;
  void *v583;
  char v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t i12;
  void *v588;
  void *v589;
  double v590;
  double v591;
  double v592;
  BOOL v593;
  uint64_t v594;
  uint64_t v595;
  void *v596;
  void *v597;
  void *v598;
  void *v599;
  void *v600;
  void *v601;
  unint64_t v602;
  id v603;
  int v604;
  id v605;
  id v606;
  id v607;
  id v608;
  id v609;
  id v610;
  id v611;
  id v612;
  id v613;
  id v614;
  void *context;
  id v616;
  id v617;
  id v618;
  id v619;
  void *v620;
  id v621;
  void *v622;
  void *v623;
  id v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  id v629;
  unint64_t v630;
  uint64_t v631;
  id v632;
  void *v633;
  id v634;
  void *v635;
  void *v636;
  void *v637;
  unint64_t v638;
  id v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  id v644;
  int v645;
  void *v646;
  id v647;
  id v648;
  id obj;
  id obja;
  int objb;
  id objc;
  void *v653;
  id v654;
  id v655;
  id v656;
  id v657;
  id v658;
  uint64_t v659;
  uint64_t v660;
  float v661;
  int v662;
  uint64_t v663;
  float v664;
  int v665;
  BOOL v666;
  float v667;
  char v668;
  float v669;
  void *v670;
  id v671;
  id v672;
  float v673;
  char *v674;
  id v675;
  id v676;
  float v677;
  void *v678;
  id v679;
  float v680;
  id v681;
  int v682;
  id v683;
  id v684;
  float v685;
  void *v686;
  unint64_t v687;
  uint64_t v688;
  void *v689;
  id v690;
  float v691;
  id v692;
  id v693;
  void *v694;
  void *v695;
  void *v696;
  void *v697;
  void *v698;
  void *v699;
  id v700;
  void *v701;
  uint64_t v702;
  uint64_t v703;
  char v704;
  uint64_t v705;
  int v706;
  void *v707;
  uint64_t v708;
  uint64_t v709;
  id v710;
  float v711;
  id v712;
  id v713;
  id v714;
  id v715;
  id v716;
  void *v717;
  id v718;
  unsigned int v719;
  unint64_t v720;
  void *v721;
  id v722;
  void *v723;
  id v724;
  void *v725;
  unint64_t v726;
  void *v727;
  void *v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  float v757;
  float v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  _QWORD v795[4];
  id v796;
  id v797;
  id v798;
  id v799;
  id v800;
  uint64_t v801;
  id v802;
  id v803;
  id v804;
  id v805;
  id v806;
  id v807;
  uint64_t *v808;
  uint64_t *v809;
  char v810;
  __int128 v811;
  __int128 v812;
  __int128 v813;
  __int128 v814;
  uint64_t v815;
  uint64_t *v816;
  uint64_t v817;
  char v818;
  __int128 v819;
  __int128 v820;
  __int128 v821;
  __int128 v822;
  __int128 v823;
  __int128 v824;
  __int128 v825;
  __int128 v826;
  __int128 v827;
  __int128 v828;
  __int128 v829;
  __int128 v830;
  _QWORD block[5];
  id v832;
  id v833;
  id v834;
  id v835;
  id v836;
  id v837;
  id v838;
  id v839;
  id v840;
  id v841;
  id v842;
  id v843;
  id v844;
  id v845;
  id v846;
  id v847;
  id v848;
  id v849;
  id v850;
  uint64_t *v851;
  uint64_t *v852;
  uint64_t *v853;
  uint64_t *v854;
  uint64_t *v855;
  uint64_t *v856;
  uint64_t *v857;
  uint64_t *v858;
  uint64_t v859;
  unint64_t v860;
  uint64_t v861;
  id v862;
  id v863;
  uint64_t v864;
  float v865;
  float v866;
  float v867;
  float v868;
  float v869;
  float v870;
  char v871;
  BOOL v872;
  _QWORD v873[4];
  id v874;
  BOOL v875;
  uint64_t v876;
  uint64_t *v877;
  uint64_t v878;
  char v879;
  uint64_t v880;
  float *v881;
  uint64_t v882;
  int v883;
  uint64_t v884;
  uint64_t *v885;
  uint64_t v886;
  char v887;
  uint64_t v888;
  float *v889;
  uint64_t v890;
  int v891;
  uint64_t v892;
  uint64_t *v893;
  uint64_t v894;
  char v895;
  uint64_t v896;
  uint64_t *v897;
  uint64_t v898;
  char v899;
  uint64_t v900;
  uint64_t *v901;
  uint64_t v902;
  char v903;
  _QWORD v904[5];
  id v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  uint64_t v910;
  uint64_t *v911;
  uint64_t v912;
  uint64_t (*v913)(uint64_t, uint64_t);
  void (*v914)(uint64_t);
  __CFString *v915;
  _BYTE v916[128];
  _BYTE v917[128];
  _BYTE v918[128];
  _BYTE v919[128];
  _BYTE v920[128];
  _BYTE v921[128];
  _BYTE v922[128];
  uint8_t v923[4];
  uint64_t v924;
  _BYTE v925[128];
  _BYTE v926[128];
  _BYTE v927[128];
  _BYTE v928[128];
  _BYTE v929[128];
  _BYTE v930[128];
  _BYTE v931[128];
  _BYTE v932[128];
  _BYTE v933[128];
  _BYTE v934[128];
  _BYTE v935[128];
  _BYTE v936[128];
  _BYTE v937[128];
  uint64_t v938;
  uint64_t *v939;
  uint64_t v940;
  char v941;
  _QWORD v942[18];

  v12 = MEMORY[0x1E0C80A78](self, a2, a3, a4, a5, a6, a7, a8);
  v706 = v13;
  v704 = v14;
  v16 = v15;
  v18 = v17;
  v659 = v12;
  v942[16] = *MEMORY[0x1E0C80C00];
  v20 = v19;
  v21 = v18;
  v676 = v16;
  v621 = a12;
  if (rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceToken != -1)
    dispatch_once(&rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceToken, &__block_literal_global_401);
  if (rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceTokenL3 != -1)
    dispatch_once(&rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__onceTokenL3, &__block_literal_global_402);
  v719 = PRSRankingSDEnabledFlagState();
  v722 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (SPSpamDemotionDisabled_onceToken != -1)
    dispatch_once(&SPSpamDemotionDisabled_onceToken, &__block_literal_global_330);
  v22 = SPSpamDemotionDisabled__spamDemotionDisabled;
  v910 = 0;
  v911 = &v910;
  v912 = 0x3032000000;
  v913 = __Block_byref_object_copy_;
  v914 = __Block_byref_object_dispose_;
  v915 = &stru_1E6E549F0;
  v23 = SSEnableSpotlightTopHitPersonalizedRanking();
  SSGeneralLog();
  v24 = objc_claimAutoreleasedReturnValue();
  v668 = v22;
  v672 = v21;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v938) = 67109120;
    HIDWORD(v938) = v23;
    _os_log_impl(&dword_1B86C5000, v24, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] PersonalizedRankingEnabled=%i", (uint8_t *)&v938, 8u);
  }
  v666 = v23;

  context = (void *)MEMORY[0x1BCCB3708]();
  objc_msgSend((id)v659, "rankingConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_opt_new();
  objc_msgSend(v25, "parsecCategoryOrder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v723 = (void *)objc_msgSend(v27, "mutableCopy");

  v727 = (void *)objc_opt_new();
  objc_msgSend((id)v659, "removeBlockListedSectionsForMapping:withRankingConfiguration:", v20, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v909 = 0u;
  v908 = 0u;
  v907 = 0u;
  v906 = 0u;
  v29 = (void *)objc_msgSend(v723, "copy");
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v906, v942, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v907;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v907 != v31)
          objc_enumerationMutation(v29);
        v33 = *(_QWORD *)(*((_QWORD *)&v906 + 1) + 8 * i);
        objc_msgSend(v28, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          objc_msgSend(v34, "results");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObjectsFromArray:", v36);

          objc_msgSend(v25, "engagementProbabilityForCategory:", v33);
          if (v37 != -1.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v727, "addObject:", v38);

          }
        }
        else
        {
          objc_msgSend(v723, "removeObject:", v33);
        }

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v906, v942, 16);
    }
    while (v30);
  }

  v39 = (void *)objc_opt_new();
  v40 = v727;
  v904[0] = MEMORY[0x1E0C809B0];
  v904[1] = 3221225472;
  v904[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_405;
  v904[3] = &unk_1E6E433E0;
  v904[4] = v659;
  v684 = v39;
  v905 = v684;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v904);
  objc_msgSend(v684, "sortUsingComparator:", &__block_literal_global_409);
  objc_msgSend(v727, "sortUsingComparator:", &__block_literal_global_410);
  v41 = (void *)objc_msgSend(v727, "mutableCopy");
  v694 = (void *)objc_msgSend(v727, "mutableCopy");
  objc_msgSend(v25, "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_appstore"));
  v43 = v42;
  objc_msgSend(v25, "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_app_store"));
  v45 = v44;
  objc_msgSend(v25, "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_web"));
  v47 = v46;
  objc_msgSend(v25, "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_maps"));
  v49 = v48;
  v50 = -1.0;
  if (v43 == -1.0)
  {
    v625 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
    v625 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v625);
  }
  if (v45 == -1.0)
  {
    v622 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
    v622 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v694, "addObject:", v622);
  }
  v51 = -1.0;
  if (v49 == -1.0)
  {
    v627 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
    v627 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v627);
    objc_msgSend(v694, "addObject:", v627);
  }
  if (v47 == -1.0)
  {
    v626 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
    v626 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v626);
    objc_msgSend(v694, "addObject:", v626);
  }
  objc_msgSend(v41, "sortUsingComparator:", &__block_literal_global_411);
  objc_msgSend(v694, "sortUsingComparator:", &__block_literal_global_412);
  v663 = objc_msgSend(v684, "count");
  v660 = objc_msgSend(v727, "count");
  v679 = (id)objc_msgSend(v41, "count");
  objc_msgSend(v694, "count");
  v537 = v49 == -1.0;
  v52 = -1.0;
  if (!v537)
  {
    v52 = (float)(unint64_t)(objc_msgSend(v41, "indexOfObject:", v627) + 1);
    v50 = (v52 + -1.0) / (double)(unint64_t)v679;
  }
  v537 = v43 == -1.0;
  v53 = -1.0;
  if (!v537)
  {
    v51 = (float)(unint64_t)(objc_msgSend(v41, "indexOfObject:", v625) + 1);
    v53 = (v51 + -1.0) / (double)(unint64_t)v679;
  }
  v54 = -1.0;
  v55 = -1.0;
  if (v47 != -1.0)
  {
    v54 = (float)(unint64_t)(objc_msgSend(v41, "indexOfObject:", v626) + 1);
    v55 = (v54 + -1.0) / (double)(unint64_t)v679;
  }
  if (objc_msgSend(v727, "count"))
  {
    objc_msgSend(v727, "objectAtIndexedSubscript:", 0);
    v657 = (id)objc_claimAutoreleasedReturnValue();

    v40 = v727;
  }
  else
  {
    v657 = &unk_1E6E97740;
  }
  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v655 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v655 = &unk_1E6E97740;
  }
  obj = (id)objc_msgSend(v26, "count");
  objc_msgSend(v28, "allKeys");
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v653, "count");
  v57 = v56;
  v645 = (v719 >> 1) & 1;
  if (v56 % 7)
    v58 = v56 / 7 + 1;
  else
    v58 = v56 / 7;
  v59 = 6;
  while (v58
        % rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__core_count)
  {
    if (v56 % v59)
      v58 = v56 / v59 + 1;
    else
      v58 = v56 / v59;
    v536 = v59-- > 4;
    if (!v536)
    {
      v60 = 4;
      goto LABEL_55;
    }
  }
  v60 = v59 + 1;
LABEL_55:
  v699 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v56);
  v710 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v57);
  v717 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v57);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v57);
  v720 = v57;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v57);
  if (SSEnableSpotlightFullPageRanking())
    v620 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v57);
  else
    v620 = 0;
  if (v57)
  {
    v63 = *MEMORY[0x1E0C9B0D0];
    v64 = v720;
    do
    {
      objc_msgSend(v61, "addObject:", v63);
      objc_msgSend(v62, "addObject:", v63);
      objc_msgSend(v717, "addObject:", v63);
      objc_msgSend(v710, "addObject:", v63);
      objc_msgSend(v699, "addObject:", v63);
      --v64;
    }
    while (v64);
  }
  v938 = 0;
  v939 = &v938;
  v940 = 0x2020000000;
  v941 = 0;
  v900 = 0;
  v901 = &v900;
  v902 = 0x2020000000;
  v903 = 0;
  v896 = 0;
  v897 = &v896;
  v898 = 0x2020000000;
  v899 = 0;
  v892 = 0;
  v893 = &v892;
  v894 = 0x2020000000;
  v895 = 0;
  v888 = 0;
  v889 = (float *)&v888;
  v890 = 0x2020000000;
  v891 = -1082130432;
  v884 = 0;
  v885 = &v884;
  v886 = 0x2020000000;
  v887 = 0;
  v880 = 0;
  v881 = (float *)&v880;
  v882 = 0x2020000000;
  v883 = 1325400064;
  v876 = 0;
  v877 = &v876;
  v878 = 0x2020000000;
  v879 = 0;
  +[SSRankingManager getTopHitItems:](SSRankingManager, "getTopHitItems:", v28);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v873[0] = MEMORY[0x1E0C809B0];
  v873[1] = 3221225472;
  v873[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_414;
  v873[3] = &unk_1E6E434A8;
  v875 = a10;
  v605 = v676;
  v874 = v605;
  v66 = (void *)MEMORY[0x1BCCB38DC](v873);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_417;
  block[3] = &unk_1E6E434F0;
  block[4] = v659;
  v859 = v60;
  v860 = v720;
  v613 = v653;
  v832 = v613;
  v617 = v28;
  v833 = v617;
  v619 = v25;
  v834 = v619;
  v618 = v672;
  v835 = v618;
  v647 = v61;
  v836 = v647;
  v851 = &v900;
  v852 = &v876;
  v614 = v66;
  v850 = v614;
  v616 = v65;
  v837 = v616;
  v871 = v668;
  v872 = v666;
  v648 = v62;
  v838 = v648;
  v853 = &v938;
  v854 = &v896;
  v855 = &v892;
  v607 = v727;
  v839 = v607;
  v609 = v41;
  v840 = v609;
  v610 = v694;
  v841 = v610;
  v690 = v723;
  v842 = v690;
  v861 = v660;
  v611 = v657;
  v843 = v611;
  v612 = v655;
  v844 = v612;
  v606 = v26;
  v845 = v606;
  v862 = obj;
  v863 = v679;
  v865 = v52;
  v866 = v50;
  v867 = v51;
  v868 = v53;
  v869 = v54;
  v870 = v55;
  v608 = v684;
  v846 = v608;
  v864 = v663;
  v658 = v710;
  v847 = v658;
  v656 = v717;
  v848 = v656;
  v654 = v699;
  v849 = v654;
  v856 = &v888;
  v857 = &v884;
  v858 = &v880;
  dispatch_apply(v58, 0, block);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v641 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", obj);
  v640 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", obj);
  v637 = (void *)objc_opt_new();
  v636 = (void *)objc_opt_new();
  if (v720)
  {
    v68 = 0;
    v69 = (void *)*MEMORY[0x1E0C9B0D0];
    do
    {
      objc_msgSend(v658, "objectAtIndexedSubscript:", v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70 == v69;

      if (!v71)
      {
        objc_msgSend(v658, "objectAtIndexedSubscript:", v68);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v641, "addObjectsFromArray:", v72);

      }
      objc_msgSend(v656, "objectAtIndexedSubscript:", v68);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73 == v69;

      if (!v74)
      {
        objc_msgSend(v656, "objectAtIndexedSubscript:", v68);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v640, "addObjectsFromArray:", v75);

      }
      objc_msgSend(v654, "objectAtIndexedSubscript:", v68);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76 == v69;

      if (!v77)
      {
        objc_msgSend(v654, "objectAtIndexedSubscript:", v68);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v830 = 0u;
        v829 = 0u;
        v828 = 0u;
        v827 = 0u;
        objc_msgSend(v78, "keyEnumerator");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v827, v937, 16);
        if (v80)
        {
          v81 = *(_QWORD *)v828;
          do
          {
            for (j = 0; j != v80; ++j)
            {
              if (*(_QWORD *)v828 != v81)
                objc_enumerationMutation(v79);
              v83 = *(_QWORD *)(*((_QWORD *)&v827 + 1) + 8 * j);
              objc_msgSend(v78, "objectForKey:", v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setObject:forKey:", v84, v83);

            }
            v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v827, v937, 16);
          }
          while (v80);
        }

      }
      objc_msgSend(v647, "objectAtIndexedSubscript:", v68);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v85 == v69;

      if (v86)
        objc_msgSend(v637, "addIndex:", v68);
      objc_msgSend(v648, "objectAtIndexedSubscript:", v68);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v87 == v69;

      if (v88)
        objc_msgSend(v636, "addIndex:", v68);
      ++v68;
    }
    while (v68 != v720);
  }
  objc_msgSend(v654, "removeAllObjects");
  objc_msgSend(v658, "removeAllObjects");
  objc_msgSend(v656, "removeAllObjects");
  objc_msgSend(v647, "removeObjectsAtIndexes:", v637);
  objc_msgSend(v648, "removeObjectsAtIndexes:", v636);
  v604 = *(unsigned __int8 *)(v659 + 8);
  if (*(_BYTE *)(v659 + 8))
    goto LABEL_583;
  v728 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v67, "count"));
  v826 = 0u;
  v825 = 0u;
  v824 = 0u;
  v823 = 0u;
  objc_msgSend(v67, "keyEnumerator");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v823, v936, 16);
  if (v90)
  {
    v91 = *(_QWORD *)v824;
    do
    {
      for (k = 0; k != v90; ++k)
      {
        if (*(_QWORD *)v824 != v91)
          objc_enumerationMutation(v89);
        objc_msgSend(v67, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v823 + 1) + 8 * k));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "maxScore");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v728, "addObject:", v94);

      }
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v823, v936, 16);
    }
    while (v90);
  }

  objc_msgSend(v728, "sortWithOptions:usingComparator:", 1, &__block_literal_global_432);
  v822 = 0u;
  v821 = 0u;
  v820 = 0u;
  v819 = 0u;
  objc_msgSend(v67, "keyEnumerator");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v819, v935, 16);
  if (v96)
  {
    v97 = *(_QWORD *)v820;
    do
    {
      for (m = 0; m != v96; ++m)
      {
        if (*(_QWORD *)v820 != v97)
          objc_enumerationMutation(v95);
        objc_msgSend(v67, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v819 + 1) + 8 * m));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "maxScore");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v728, "indexOfObject:", v100);

        v102 = objc_msgSend(v728, "count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101 + 1);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setMaxScoreAbsRank:", v103);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v101 / (double)v102);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setMaxScoreRelRank:", v104);

      }
      v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v819, v935, 16);
    }
    while (v96);
  }

  v815 = 0;
  v816 = &v815;
  v817 = 0x2020000000;
  v818 = 0;
  v811 = 0u;
  v812 = 0u;
  v813 = 0u;
  v814 = 0u;
  v105 = v648;
  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v811, v934, 16);
  if (v106)
  {
    v107 = *(_QWORD *)v812;
    do
    {
      for (n = 0; n != v106; ++n)
      {
        if (*(_QWORD *)v812 != v107)
          objc_enumerationMutation(v105);
        v109 = *(void **)(*((_QWORD *)&v811 + 1) + 8 * n);
        objc_msgSend(v109, "rankingItem");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        if (v110)
        {
          objc_msgSend(v109, "rankingItem");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "likelihood");
          v113 = v112 > 0.1;

          if (v113)
            *((_BYTE *)v816 + 24) = 1;
        }
      }
      v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v811, v934, 16);
    }
    while (v106);
  }

  v795[0] = MEMORY[0x1E0C809B0];
  v795[1] = 3221225472;
  v795[2] = __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_3_433;
  v795[3] = &unk_1E6E43578;
  v796 = v641;
  v797 = v67;
  v632 = v618;
  v798 = v632;
  v810 = v645;
  v700 = v640;
  v799 = v700;
  v114 = v690;
  v800 = v114;
  v801 = v659;
  v802 = v647;
  v629 = v105;
  v803 = v629;
  v718 = v620;
  v804 = v718;
  v724 = v617;
  v805 = v724;
  v644 = v619;
  v806 = v644;
  v808 = &v815;
  v115 = v621;
  v807 = v115;
  v809 = &v910;
  dispatch_apply(3uLL, 0, v795);
  v628 = (void *)objc_opt_new();
  v721 = (void *)objc_opt_new();
  if (SPExperimentalScoringEnabled_onceToken != -1)
    dispatch_once(&SPExperimentalScoringEnabled_onceToken, &__block_literal_global_338);
  v116 = SPExperimentalScoringEnabled__experimentalScoringEnabled;
  if (SPExperimentalScoringEnabled__experimentalScoringEnabled)
    v643 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v114, "count"));
  else
    v643 = 0;
  for (ii = 0; ii < objc_msgSend(v700, "count"); ++ii)
  {
    objc_msgSend(v700, "objectAtIndexedSubscript:", ii);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "sectionBundleIdentifier");
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (v119)
    {
      if (objc_msgSend(v721, "containsObject:", v119))
      {
        objc_msgSend(v628, "addIndex:", ii);
      }
      else
      {
        objc_msgSend(v721, "addObject:", v119);
        if (v116)
          objc_msgSend(v643, "addObject:", v119);
      }
    }

  }
  objc_msgSend(v700, "removeObjectsAtIndexes:", v628);
  v635 = (void *)objc_opt_new();
  v642 = (void *)objc_opt_new();
  for (jj = 0; jj < objc_msgSend(v114, "count"); ++jj)
  {
    objc_msgSend(v114, "objectAtIndex:", jj);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (v121)
    {
      if (objc_msgSend(v642, "containsObject:", v121))
        objc_msgSend(v635, "addIndex:", jj);
      else
        objc_msgSend(v642, "addObject:", v121);
      if (objc_msgSend(v121, "isEqualToString:", CFSTR("com.apple.parsec.related_search")))
        objc_msgSend(v635, "addIndex:", jj);
      else
        objc_msgSend(v642, "addObject:", v121);
    }

  }
  objc_msgSend(v114, "removeObjectsAtIndexes:", v635);
  v794 = 0u;
  v793 = 0u;
  v792 = 0u;
  v791 = 0u;
  v122 = (void *)objc_msgSend(v114, "copy");
  v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v791, v933, 16);
  if (v123)
  {
    v124 = *(_QWORD *)v792;
    do
    {
      for (kk = 0; kk != v123; ++kk)
      {
        if (*(_QWORD *)v792 != v124)
          objc_enumerationMutation(v122);
        v126 = *(_QWORD *)(*((_QWORD *)&v791 + 1) + 8 * kk);
        v127 = objc_msgSend(v721, "count");
        if (v127 != objc_msgSend(v114, "count") && (objc_msgSend(v721, "containsObject:", v126) & 1) == 0)
          objc_msgSend(v114, "removeObject:", v126);
      }
      v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v791, v933, 16);
    }
    while (v123);
  }

  v128 = (void *)objc_opt_new();
  for (mm = 0; mm < objc_msgSend(v700, "count"); ++mm)
  {
    objc_msgSend(v700, "objectAtIndexedSubscript:", mm);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "sectionBundleIdentifier");
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    if (v131 && (objc_msgSend(v114, "containsObject:", v131) & 1) == 0)
      objc_msgSend(v128, "addIndex:", mm);

  }
  objc_msgSend(v700, "removeObjectsAtIndexes:", v128);
  if (v116)
  {
    v623 = (void *)objc_opt_new();

    for (nn = 0; nn < objc_msgSend(v643, "count"); ++nn)
    {
      objc_msgSend(v643, "objectAtIndexedSubscript:", nn);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (v133 && (objc_msgSend(v114, "containsObject:", v133) & 1) == 0)
        objc_msgSend(v623, "addIndex:", nn);

    }
    objc_msgSend(v643, "removeObjectsAtIndexes:", v623);
    if (!*((_BYTE *)v939 + 24) || v889[6] > 10000.0 && (!*((_BYTE *)v885 + 24) || v881[6] == 0.0))
    {
      v134 = v643;

      v135 = v134;
      goto LABEL_159;
    }
  }
  else
  {
    v623 = v128;
  }
  v135 = v114;
LABEL_159:
  v633 = v135;
  v638 = objc_msgSend(v135, "count");
  v136 = objc_msgSend(v629, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v136 + v638);
  v646 = (void *)objc_claimAutoreleasedReturnValue();
  v630 = v136;
  v602 = v136 + v638;
  if (objc_msgSend(v629, "count"))
  {
    objc_msgSend(v629, "objectAtIndexedSubscript:", 0);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "rankingItem");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v138, "bundleIDType") & 0x8000) != 0)
    {

    }
    else
    {
      objc_msgSend(v137, "rankingItem");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "L2FeatureVector");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "originalL2Score");
      v142 = v141 != 0.0;

      if (!v142)
      {
        v624 = 0;
LABEL_166:

        goto LABEL_167;
      }
    }
    v624 = v137;
    goto LABEL_166;
  }
  v624 = 0;
LABEL_167:
  if (SSEnableSpotlightFullPageRanking())
  {
    v790 = 0u;
    v789 = 0u;
    v788 = 0u;
    v787 = 0u;
    v143 = v700;
    v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v787, v932, 16);
    if (v144)
    {
      v145 = 0;
      v146 = *(_QWORD *)v788;
      do
      {
        for (i1 = 0; i1 != v144; ++i1)
        {
          if (*(_QWORD *)v788 != v146)
            objc_enumerationMutation(v143);
          v148 = *(void **)(*((_QWORD *)&v787 + 1) + 8 * i1);
          objc_msgSend(v148, "sectionBundleIdentifier");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = v149 == 0;

          if (!v150)
          {
            objc_msgSend(v148, "sectionBundleIdentifier");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v718, "objectForKey:", v151);
            v152 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v152)
            {
              objc_msgSend(v148, "sectionBundleIdentifier");
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v724, "objectForKey:", v153);
              v154 = (void *)objc_claimAutoreleasedReturnValue();

              if (v154)
              {
                v155 = objc_alloc_init(SectionL3Scores);
                -[SectionL3Scores computeScore:rankingConfig:hasGoodLocalResult:pos:queryContext:](v155, "computeScore:rankingConfig:hasGoodLocalResult:pos:queryContext:", v154, v644, *((unsigned __int8 *)v816 + 24), v145 + i1 + 1, v115);
                objc_msgSend(v148, "sectionBundleIdentifier");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v718, "setObject:forKeyedSubscript:", v155, v156);

              }
            }
          }
        }
        v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v787, v932, 16);
        v145 = (v145 + i1);
      }
      while (v144);
    }

    if (objc_msgSend((id)rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__l3modelManager, "loaded"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 67);
      v695 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v659, "query");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v157, CFSTR("query"));
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v157, CFSTR("prefix"));

      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "localeIdentifier");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v159, CFSTR("locale"));

      *(float *)&v160 = (float)v602;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v161, CFSTR("section_count"));

      *(float *)&v162 = (float)v630;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v163, CFSTR("local_section_count"));

      *(float *)&v164 = (float)v638;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v165, CFSTR("server_section_count"));

      LODWORD(v166) = 0;
      if (v624)
        *(float *)&v166 = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v167, CFSTR("local_section_is_tophit"));

      v169 = (void *)MEMORY[0x1E0CB37E8];
      if (v624)
        v170 = 0;
      else
        v170 = objc_msgSend(v616, "count") != 0;
      *(float *)&v168 = (float)v170;
      objc_msgSend(v169, "numberWithFloat:", v168);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v171, CFSTR("server_section_is_tophit"));

      objc_msgSend(v644, "iFunScores");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "localScore");
      v173 = (void *)objc_claimAutoreleasedReturnValue();

      if (v173)
      {
        v174 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v644, "iFunScores");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "localScore");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "floatValue");
        objc_msgSend(v174, "numberWithFloat:");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v695, "setObject:forKeyedSubscript:", v177, CFSTR("local_ifun_score"));

      }
      objc_msgSend(v644, "iFunScores");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "serverScore");
      v179 = (void *)objc_claimAutoreleasedReturnValue();

      if (v179)
      {
        v180 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v644, "iFunScores");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "serverScore");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "floatValue");
        objc_msgSend(v180, "numberWithFloat:");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v695, "setObject:forKeyedSubscript:", v183, CFSTR("server_ifun_score"));

      }
      v786 = 0u;
      v785 = 0u;
      v784 = 0u;
      v783 = 0u;
      obja = v629;
      v184 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v783, v931, 16);
      if (v184)
      {
        v185 = *(_QWORD *)v784;
        v677 = 0.0;
        v680 = 0.0;
        v685 = 0.0;
        v186 = 0.0;
        v711 = 0.0;
        v691 = -1000.0;
        v673 = -1000.0;
        do
        {
          for (i2 = 0; i2 != v184; ++i2)
          {
            if (*(_QWORD *)v784 != v185)
              objc_enumerationMutation(obja);
            v188 = *(void **)(*((_QWORD *)&v783 + 1) + 8 * i2);
            objc_msgSend(v188, "sectionBundleIdentifier");
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            v190 = v189 == 0;

            if (!v190)
            {
              objc_msgSend(v188, "sectionBundleIdentifier");
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v718, "objectForKey:", v191);
              v192 = (void *)objc_claimAutoreleasedReturnValue();

              if (v192)
              {
                objc_msgSend(v192, "features");
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v193, "objectForKeyedSubscript:", CFSTR("section_tophit_should_be_count"));
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v194, "floatValue");
                v196 = v195;

                objc_msgSend(v192, "features");
                v197 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("section_tophit_must_be_count"));
                v198 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v198, "floatValue");
                v200 = v199;

                objc_msgSend(v192, "features");
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v201, "objectForKeyedSubscript:", CFSTR("score_over_th_threshold_count"));
                v202 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v202, "floatValue");
                v204 = v203;

                objc_msgSend(v192, "features");
                v205 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "objectForKeyedSubscript:", CFSTR("max_likelihood"));
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v206, "floatValue");
                v208 = v207;

                if (v186 < v208)
                  v186 = v208;
                objc_msgSend(v192, "features");
                v209 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v209, "objectForKeyedSubscript:", CFSTR("max_topicality"));
                v210 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v210, "floatValue");
                v212 = v211;

                v213 = v711;
                if (v711 < v212)
                  v213 = v212;
                v711 = v213;
                objc_msgSend(v192, "features");
                v214 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v214, "objectForKeyedSubscript:", CFSTR("max_original_l2_score"));
                v215 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v215, "floatValue");
                v217 = v216;

                v218 = v691;
                if (v691 < v217)
                  v218 = v217;
                v691 = v218;
                objc_msgSend(v192, "features");
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v219, "objectForKeyedSubscript:", CFSTR("max_l2_score"));
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v220, "floatValue");
                v222 = v221;

                v677 = v677 + v196;
                v680 = v680 + v200;
                v685 = v685 + v204;
                v223 = v673;
                if (v673 < v222)
                  v223 = v222;
                v673 = v223;
              }

            }
          }
          v184 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v783, v931, 16);
        }
        while (v184);
      }
      else
      {
        v677 = 0.0;
        v680 = 0.0;
        v685 = 0.0;
        v186 = 0.0;
        v711 = 0.0;
        v691 = -1000.0;
        v673 = -1000.0;
      }

      v782 = 0u;
      v781 = 0u;
      v780 = 0u;
      v779 = 0u;
      v224 = v143;
      v225 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v779, v930, 16);
      if (v225)
      {
        v226 = *(_QWORD *)v780;
        v227 = -1000.0;
        v664 = 0.0;
        v667 = 0.0;
        v669 = 0.0;
        v228 = 0.0;
        v229 = 0.0;
        v661 = -1000.0;
        do
        {
          for (i3 = 0; i3 != v225; ++i3)
          {
            if (*(_QWORD *)v780 != v226)
              objc_enumerationMutation(v224);
            v231 = *(void **)(*((_QWORD *)&v779 + 1) + 8 * i3);
            objc_msgSend(v231, "sectionBundleIdentifier");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            v233 = v232 == 0;

            if (!v233)
            {
              objc_msgSend(v231, "sectionBundleIdentifier");
              v234 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v718, "objectForKey:", v234);
              v235 = (void *)objc_claimAutoreleasedReturnValue();

              if (v235)
              {
                objc_msgSend(v235, "features");
                v236 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v236, "objectForKeyedSubscript:", CFSTR("section_tophit_should_be_count"));
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v237, "floatValue");
                v239 = v238;

                objc_msgSend(v235, "features");
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v240, "objectForKeyedSubscript:", CFSTR("section_tophit_must_be_count"));
                v241 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v241, "floatValue");
                v243 = v242;

                objc_msgSend(v235, "features");
                v244 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("score_over_th_threshold_count"));
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v245, "floatValue");
                v247 = v246;

                objc_msgSend(v235, "features");
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v248, "objectForKeyedSubscript:", CFSTR("max_likelihood"));
                v249 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v249, "floatValue");
                v251 = v250;

                if (v228 < v251)
                  v228 = v251;
                objc_msgSend(v235, "features");
                v252 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v252, "objectForKeyedSubscript:", CFSTR("max_topicality"));
                v253 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v253, "floatValue");
                v255 = v254;

                if (v229 < v255)
                  v229 = v255;
                objc_msgSend(v235, "features");
                v256 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("max_original_l2_score"));
                v257 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v257, "floatValue");
                v259 = v258;

                if (v227 < v259)
                  v227 = v259;
                objc_msgSend(v235, "features");
                v260 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v260, "objectForKeyedSubscript:", CFSTR("max_l2_score"));
                v261 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v261, "floatValue");
                v263 = v262;

                v664 = v664 + v239;
                v667 = v667 + v243;
                v669 = v669 + v247;
                v264 = v661;
                if (v661 < v263)
                  v264 = v263;
                v661 = v264;
              }

            }
          }
          v225 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v779, v930, 16);
        }
        while (v225);
      }
      else
      {
        v664 = 0.0;
        v227 = -1000.0;
        v667 = 0.0;
        v669 = 0.0;
        v228 = 0.0;
        v229 = 0.0;
        v661 = -1000.0;
      }

      *(float *)&v265 = v677;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v266, CFSTR("local_tophit_should_be_count"));

      *(float *)&v267 = v664;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v267);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v268, CFSTR("server_tophit_should_be_count"));

      *(float *)&v269 = v680;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v270, CFSTR("local_tophit_must_be_count"));

      *(float *)&v271 = v667;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v271);
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v272, CFSTR("server_tophit_must_be_count"));

      *(float *)&v273 = v685;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v273);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v274, CFSTR("local_score_over_th_threshold_count"));

      *(float *)&v275 = v669;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v275);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v276, CFSTR("server_score_over_th_threshold_count"));

      *(float *)&v277 = v186;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v277);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v278, CFSTR("local_max_likelihood"));

      *(float *)&v279 = v228;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v279);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v280, CFSTR("server_max_likelihood"));

      *(float *)&v281 = v711;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v281);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v282, CFSTR("local_max_topicality"));

      *(float *)&v283 = v229;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v283);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v284, CFSTR("server_max_topicality"));

      *(float *)&v285 = v691;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v285);
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v286, CFSTR("local_max_original_l2_score"));

      *(float *)&v287 = v227;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v287);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v288, CFSTR("server_max_original_l2_score"));

      *(float *)&v289 = v673;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v289);
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v290, CFSTR("local_max_l2_score"));

      *(float *)&v291 = v661;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v291);
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v695, "setObject:forKeyedSubscript:", v292, CFSTR("server_max_l2_score"));

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v602);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v602);
      v712 = (id)objc_claimAutoreleasedReturnValue();
      v778 = 0u;
      v777 = 0u;
      v776 = 0u;
      v775 = 0u;
      v692 = obja;
      v294 = objc_msgSend(v692, "countByEnumeratingWithState:objects:count:", &v775, v929, 16);
      if (v294)
      {
        v295 = *(_QWORD *)v776;
        do
        {
          for (i4 = 0; i4 != v294; ++i4)
          {
            if (*(_QWORD *)v776 != v295)
              objc_enumerationMutation(v692);
            v297 = *(void **)(*((_QWORD *)&v775 + 1) + 8 * i4);
            objc_msgSend(v297, "sectionBundleIdentifier");
            v298 = (void *)objc_claimAutoreleasedReturnValue();
            v299 = v298 == 0;

            if (!v299)
            {
              objc_msgSend(v297, "sectionBundleIdentifier");
              v300 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v718, "objectForKey:", v300);
              v301 = (void *)objc_claimAutoreleasedReturnValue();

              if (v301)
              {
                objc_msgSend(v301, "features");
                v302 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v302, "addEntriesFromDictionary:", v695);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v293, "count"));
                v303 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v297, "sectionBundleIdentifier");
                v304 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v712, "setObject:forKeyedSubscript:", v303, v304);

                objc_msgSend(v301, "features");
                v305 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v293, "addObject:", v305);

              }
            }
          }
          v294 = objc_msgSend(v692, "countByEnumeratingWithState:objects:count:", &v775, v929, 16);
        }
        while (v294);
      }

      v774 = 0u;
      v773 = 0u;
      v772 = 0u;
      v771 = 0u;
      v306 = v224;
      v307 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v771, v928, 16);
      if (v307)
      {
        v308 = *(_QWORD *)v772;
        do
        {
          for (i5 = 0; i5 != v307; ++i5)
          {
            if (*(_QWORD *)v772 != v308)
              objc_enumerationMutation(v306);
            v310 = *(void **)(*((_QWORD *)&v771 + 1) + 8 * i5);
            objc_msgSend(v310, "sectionBundleIdentifier");
            v311 = (void *)objc_claimAutoreleasedReturnValue();
            v312 = v311 == 0;

            if (!v312)
            {
              objc_msgSend(v310, "sectionBundleIdentifier");
              v313 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v718, "objectForKey:", v313);
              v314 = (void *)objc_claimAutoreleasedReturnValue();

              if (v314)
              {
                objc_msgSend(v314, "features");
                v315 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v315, "addEntriesFromDictionary:", v695);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v293, "count"));
                v316 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v310, "sectionBundleIdentifier");
                v317 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v712, "setObject:forKeyedSubscript:", v316, v317);

                objc_msgSend(v314, "features");
                v318 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v293, "addObject:", v318);

              }
            }
          }
          v307 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v771, v928, 16);
        }
        while (v307);
      }

      objc_msgSend((id)rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__l3modelManager, "predict:", v293);
      v686 = (void *)objc_claimAutoreleasedReturnValue();
      if (v686 && (v319 = objc_msgSend(v686, "count"), v319 == objc_msgSend(v293, "count")))
      {
        v770 = 0u;
        v769 = 0u;
        v768 = 0u;
        v767 = 0u;
        v681 = v692;
        v320 = objc_msgSend(v681, "countByEnumeratingWithState:objects:count:", &v767, v927, 16);
        if (v320)
        {
          v321 = *(_QWORD *)v768;
          do
          {
            for (i6 = 0; i6 != v320; ++i6)
            {
              if (*(_QWORD *)v768 != v321)
                objc_enumerationMutation(v681);
              v323 = *(void **)(*((_QWORD *)&v767 + 1) + 8 * i6);
              objc_msgSend(v323, "sectionBundleIdentifier");
              v324 = (void *)objc_claimAutoreleasedReturnValue();
              v325 = v324 == 0;

              if (!v325)
              {
                objc_msgSend(v323, "sectionBundleIdentifier");
                v326 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v718, "objectForKey:", v326);
                v327 = (void *)objc_claimAutoreleasedReturnValue();

                if (v327)
                {
                  objc_msgSend(v323, "sectionBundleIdentifier");
                  v328 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v712, "objectForKeyedSubscript:", v328);
                  v329 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v686, "objectAtIndexedSubscript:", (int)objc_msgSend(v329, "intValue"));
                  v330 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v330, "floatValue");
                  objc_msgSend(v327, "setModelScore:");

                }
              }
            }
            v320 = objc_msgSend(v681, "countByEnumeratingWithState:objects:count:", &v767, v927, 16);
          }
          while (v320);
        }

        v766 = 0u;
        v765 = 0u;
        v764 = 0u;
        v763 = 0u;
        v331 = v306;
        v332 = -[NSObject countByEnumeratingWithState:objects:count:](v331, "countByEnumeratingWithState:objects:count:", &v763, v926, 16);
        if (v332)
        {
          v333 = *(_QWORD *)v764;
          do
          {
            for (i7 = 0; i7 != v332; ++i7)
            {
              if (*(_QWORD *)v764 != v333)
                objc_enumerationMutation(v331);
              v335 = *(void **)(*((_QWORD *)&v763 + 1) + 8 * i7);
              objc_msgSend(v335, "sectionBundleIdentifier");
              v336 = (void *)objc_claimAutoreleasedReturnValue();
              v337 = v336 == 0;

              if (!v337)
              {
                objc_msgSend(v335, "sectionBundleIdentifier");
                v338 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v718, "objectForKey:", v338);
                v339 = (void *)objc_claimAutoreleasedReturnValue();

                if (v339)
                {
                  objc_msgSend(v335, "sectionBundleIdentifier");
                  v340 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v712, "objectForKeyedSubscript:", v340);
                  v341 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v686, "objectAtIndexedSubscript:", (int)objc_msgSend(v341, "intValue"));
                  v342 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v342, "floatValue");
                  objc_msgSend(v339, "setModelScore:");

                }
              }
            }
            v332 = -[NSObject countByEnumeratingWithState:objects:count:](v331, "countByEnumeratingWithState:objects:count:", &v763, v926, 16);
          }
          while (v332);
        }
      }
      else
      {
        SSGeneralLog();
        v331 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v331, OS_LOG_TYPE_ERROR))
          -[SSRankingManager rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:].cold.2(v331);
      }

      v343 = +[SSRankingManager rankLocalBundlesUsingModelL3ScoreAndRules:sectionMapping:l3RankingScores:](SSRankingManager, "rankLocalBundlesUsingModelL3ScoreAndRules:sectionMapping:l3RankingScores:", v692, v724, v718);
    }
  }
  v713 = (id)objc_opt_new();
  v762 = 0u;
  v761 = 0u;
  v760 = 0u;
  v759 = 0u;
  v344 = v629;
  v345 = objc_msgSend(v344, "countByEnumeratingWithState:objects:count:", &v759, v925, 16);
  if (v345)
  {
    v346 = *(_QWORD *)v760;
    do
    {
      for (i8 = 0; i8 != v345; ++i8)
      {
        if (*(_QWORD *)v760 != v346)
          objc_enumerationMutation(v344);
        v348 = *(void **)(*((_QWORD *)&v759 + 1) + 8 * i8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v348, "sectionBundleIdentifier");
          v349 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v713, "addObject:", v349);
        }
        else
        {
          SSGeneralLog();
          v349 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
          {
            v350 = (void *)objc_opt_class();
            -[SSRankingManager rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:].cold.1(v350, v923, &v924, v349);
          }
        }

      }
      v345 = objc_msgSend(v344, "countByEnumeratingWithState:objects:count:", &v759, v925, 16);
    }
    while (v345);
  }

  if (v630)
  {
    LOBYTE(v682) = 0;
    v351 = 0;
    v352 = 0;
    v674 = 0;
    v687 = 0;
    while (1)
    {
      v353 = objc_msgSend(v700, "count");
      v354 = v638;
      if (v638 >= v353)
        v354 = v353;
      if ((unint64_t)v674 >= v354)
        goto LABEL_422;
      objc_msgSend(v344, "objectAtIndexedSubscript:", v687);
      v696 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v700, "objectAtIndexedSubscript:", v674);
      v693 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v696, "rankingItem");
      v355 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v355, "L2FeatureVector");
      v678 = (void *)objc_claimAutoreleasedReturnValue();

      v758 = 0.0;
      objc_msgSend(v678, "originalL2Score");
      v758 = v356;
      v757 = 0.0;
      objc_msgSend(v693, "l2score");
      v757 = v357;
      objc_msgSend(v696, "rankingItem");
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v358, "sectionBundleIdentifier");
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v693, "sectionBundleIdentifier");
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v595) = 257;
      +[SectionL3Scores getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:](SectionL3Scores, "getComparableL3Score:sectionMapping:bundleId1:bundleId2:score1:score2:usePommesScore:useLegacyScore:", v718, v724, v359, v360, &v758, &v757, v595);

      objc_msgSend(v696, "rankingItem");
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v361, "sectionBundleIdentifier");
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v693, "sectionBundleIdentifier");
      v363 = (void *)objc_claimAutoreleasedReturnValue();
      +[SectionL3Scores getComparableModelL3Score:bundleId1:bundleId2:score1:score2:](SectionL3Scores, "getComparableModelL3Score:bundleId1:bundleId2:score1:score2:", v718, v362, v363, &v758, &v757);

      if (*((_BYTE *)v901 + 24) && *((_BYTE *)v897 + 24))
      {
        objc_msgSend(v696, "rankingItem");
        v365 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v365, "L2FeatureVector");
        v366 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v366, "scoreForFeature:", 31);
        v368 = v367;

        v369 = v368 == 1.0;
        objc_msgSend(v693, "rankingItem");
        v370 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v370, "sectionBundleIdentifier");
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        v372 = objc_msgSend(v371, "isEqualToString:", CFSTR("com.apple.parsec.weather"));

      }
      else
      {
        v369 = 0;
        v372 = 0;
      }
      if ((v682 & 1) != 0)
      {
        v682 = 1;
      }
      else
      {
        if (!*((_BYTE *)v877 + 24) || !*((_BYTE *)v893 + 24))
          goto LABEL_312;
        objc_msgSend(v696, "rankingItem");
        v373 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v373, "photosMatch") & 1) != 0)
        {
          v374 = 1;
        }
        else
        {
          objc_msgSend(v696, "rankingItem");
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          v374 = objc_msgSend(v375, "photosExactMatch");

        }
        objc_msgSend(v693, "rankingItem");
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "sectionBundleIdentifier");
        v377 = (void *)objc_claimAutoreleasedReturnValue();
        v682 = objc_msgSend(v377, "isEqualToString:", CFSTR("com.apple.parsec.web_images"));

        if ((v374 & 1) == 0)
        {
          objc_msgSend(v696, "sectionBundleIdentifier");
          v378 = (void *)objc_claimAutoreleasedReturnValue();
          IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v378);

          if (!IsSyndicatedPhotos)
            goto LABEL_312;
          objc_msgSend(v696, "rankingItem");
          v380 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v380, "L2FeatureVector");
          v381 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v381, "scoreForFeature:", 1928);
          v383 = v382 == 1.0;

          if (!v383)
LABEL_312:
            v682 = 0;
        }
      }
      *(float *)&v364 = v757;
      if (v757 > v758)
        v384 = 1;
      else
        v384 = v372 & v369;
      objc_msgSend(v696, "rankingItem", v364);
      v385 = (void *)objc_claimAutoreleasedReturnValue();
      v386 = v384 & (v682 ^ 1);
      if ((objc_msgSend(v385, "bundleIDType") & 4) != 0)
      {
        objc_msgSend(v696, "rankingItem");
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        v388 = objc_msgSend(v387, "isPerfectMatch");

        v386 &= ~v388;
      }
      else
      {

      }
      objc_msgSend(v696, "rankingItem");
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v389, "L2FeatureVector");
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      if (v390)
      {
        objc_msgSend(v696, "rankingItem");
        v391 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v391, "L2FeatureVector");
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v392, "scoreForFeature:", 3234);
        v394 = v393 == 0.0;

        v386 &= v394;
      }
      else
      {

      }
      objc_msgSend(v696, "rankingItem");
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v395, "shouldHideUnderShowMore") & 1) != 0)
      {
        objc_msgSend(v693, "rankingItem");
        v396 = (void *)objc_claimAutoreleasedReturnValue();
        v397 = objc_msgSend(v396, "shouldHideUnderShowMore");

        if (!v397)
        {
          v386 = 1;
          goto LABEL_329;
        }
      }
      else
      {

      }
      objc_msgSend(v696, "rankingItem");
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v398, "shouldHideUnderShowMore"))
      {

      }
      else
      {
        objc_msgSend(v693, "rankingItem");
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        v400 = objc_msgSend(v399, "shouldHideUnderShowMore");

        if ((v400 & 1) != 0)
          goto LABEL_366;
      }
LABEL_329:
      if (v386 && v624)
      {
        objc_msgSend(v624, "rankingItem");
        v401 = (void *)objc_claimAutoreleasedReturnValue();
        v402 = objc_msgSend(v401, "bundleIDType");

        if ((v402 & 4) != 0)
        {
          objc_msgSend(v696, "rankingItem");
          v670 = (void *)objc_claimAutoreleasedReturnValue();
          v403 = objc_msgSend(v670, "bundleIDType");
          if ((v403 & 8) != 0
            || (objc_msgSend(v696, "rankingItem"),
                v629 = (id)objc_claimAutoreleasedReturnValue(),
                (objc_msgSend(v629, "bundleIDType") & 0x20) != 0))
          {
            objb = 0;
            v662 = 0;
            v665 = 0;
            v405 = 0;
            v406 = 0;
            v407 = 0;
          }
          else
          {
            objc_msgSend(v696, "rankingItem");
            v601 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v601, "bundleIDType") & 0x100000) != 0)
            {
              v662 = 0;
              v665 = 0;
              v405 = 0;
              v406 = 0;
              v407 = 0;
              objb = 1;
            }
            else
            {
              objc_msgSend(v696, "rankingItem");
              v600 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v600, "bundleIDType") & 2) != 0)
              {
                v665 = 0;
                v405 = 0;
                v406 = 0;
                v407 = 0;
                objb = 1;
                v662 = 1;
              }
              else
              {
                objc_msgSend(v696, "rankingItem");
                v599 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v599, "bundleIDType") & 0x40) != 0)
                {
                  v405 = 0;
                  v406 = 0;
                  v407 = 0;
                  objb = 1;
                  v662 = 1;
                  v665 = 1;
                }
                else
                {
                  objc_msgSend(v696, "rankingItem");
                  v598 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v598, "bundleIDType") & 0x40000) != 0)
                  {
                    v406 = 0;
                    v407 = 0;
                    objb = 1;
                    v662 = 1;
                    v665 = 1;
                    v405 = 1;
                  }
                  else
                  {
                    objc_msgSend(v696, "rankingItem");
                    v597 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v597, "bundleIDType") & 0x2000000) != 0)
                    {
                      v407 = 0;
                      objb = 1;
                      v662 = 1;
                      v665 = 1;
                      v405 = 1;
                      v406 = 1;
                    }
                    else
                    {
                      objc_msgSend(v696, "rankingItem");
                      v596 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v596, "bundleIDType") & 0x4000000) == 0)
                      {

                        v386 = 1;
                        v404 = v629;
                        goto LABEL_399;
                      }
                      objb = 1;
                      v662 = 1;
                      v665 = 1;
                      v405 = 1;
                      v406 = 1;
                      v407 = 1;
                    }
                  }
                }
              }
            }
          }
          objc_msgSend(v696, "rankingItem");
          v408 = (void *)objc_claimAutoreleasedReturnValue();
          v409 = objc_msgSend(v408, "shouldHideUnderShowMore");

          if (v407)
          {

            if ((v406 & 1) == 0)
              goto LABEL_344;
LABEL_351:

            if ((v405 & 1) == 0)
              goto LABEL_352;
LABEL_345:

            if ((v665 & 1) == 0)
              goto LABEL_346;
LABEL_353:

            if ((v662 & 1) == 0)
              goto LABEL_354;
LABEL_347:

            if ((objb & 1) == 0)
              goto LABEL_348;
LABEL_355:

            if ((v403 & 8) != 0)
              goto LABEL_356;
LABEL_349:

          }
          else
          {
            if (v406)
              goto LABEL_351;
LABEL_344:
            if (v405)
              goto LABEL_345;
LABEL_352:
            if (v665)
              goto LABEL_353;
LABEL_346:
            if (v662)
              goto LABEL_347;
LABEL_354:
            if (objb)
              goto LABEL_355;
LABEL_348:
            if ((v403 & 8) == 0)
              goto LABEL_349;
LABEL_356:

          }
          if ((v409 & 1) == 0)
          {
            objc_msgSend(v693, "sectionBundleIdentifier");
            v410 = (void *)objc_claimAutoreleasedReturnValue();

            if (v410)
            {
              objc_msgSend(v696, "sectionBundleIdentifier");
              v411 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v696, "rankingItem");
              v412 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v412, "bundleIDType") & 0x2000000) != 0)
              {

              }
              else
              {
                objc_msgSend(v696, "rankingItem");
                v413 = (void *)objc_claimAutoreleasedReturnValue();
                v414 = (objc_msgSend(v413, "bundleIDType") & 0x40000) == 0;

                if (v414)
                {
                  v415 = v411;
LABEL_373:
                  v670 = v415;
                  objc_msgSend(v644, "engagementProbabilityForCategory:");
                  v420 = v419;
                  objc_msgSend(v693, "sectionBundleIdentifier");
                  v421 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v644, "engagementProbabilityForCategory:", v421);
                  v423 = v422;

                  v386 = 0;
                  if (v423 <= 0.00001 || v420 >= v423)
                    goto LABEL_400;
                  objc_msgSend(v624, "rankingItem", v423);
                  v424 = (void *)objc_claimAutoreleasedReturnValue();
                  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v424, "attributes"), 7uLL);
                  v404 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_398;
                  objc_msgSend(v696, "rankingItem");
                  v425 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v425, "bundleIDType") & 8) == 0)
                  {
                    objc_msgSend(v696, "rankingItem");
                    v426 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v426, "bundleIDType") & 0x100000) == 0)
                    {
                      objc_msgSend(v696, "rankingItem");
                      v427 = (void *)objc_claimAutoreleasedReturnValue();
                      v428 = (objc_msgSend(v427, "bundleIDType") & 0x4000000) == 0;

                      if (v428)
                      {
                        objc_msgSend(v696, "rankingItem");
                        v429 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v429, "bundleIDType") & 0x40000) != 0)
                        {

                        }
                        else
                        {
                          objc_msgSend(v696, "rankingItem");
                          v430 = (void *)objc_claimAutoreleasedReturnValue();
                          v431 = (objc_msgSend(v430, "bundleIDType") & 0x2000000) == 0;

                          if (v431)
                          {
                            objc_msgSend(v696, "rankingItem");
                            v432 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((objc_msgSend(v432, "bundleIDType") & 0x20) != 0)
                            {

                            }
                            else
                            {
                              objc_msgSend(v696, "rankingItem");
                              v433 = (void *)objc_claimAutoreleasedReturnValue();
                              v434 = (objc_msgSend(v433, "bundleIDType") & 0x40) == 0;

                              if (v434)
                              {
                                objc_msgSend(v696, "rankingItem");
                                v435 = (void *)objc_claimAutoreleasedReturnValue();
                                v436 = objc_msgSend(v435, "bundleIDType");

                                if ((v436 & 2) == 0)
                                  goto LABEL_398;
                                objc_msgSend(v696, "rankingItem");
                                v437 = (void *)objc_claimAutoreleasedReturnValue();
                                SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v437, "attributes"), 7uLL);
                                v438 = (void *)objc_claimAutoreleasedReturnValue();

                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
LABEL_417:
                                  v446 = objc_msgSend(v438, "containsString:", v404);

                                  if ((v446 & 1) != 0)
                                  {
LABEL_411:
                                    v386 = 0;
LABEL_399:

LABEL_400:
                                    goto LABEL_363;
                                  }
LABEL_398:
                                  v386 = 1;
                                  goto LABEL_399;
                                }
LABEL_419:

                                goto LABEL_398;
                              }
                            }
                            objc_msgSend(v696, "rankingItem");
                            v445 = (void *)objc_claimAutoreleasedReturnValue();
                            SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v445, "attributes"), 0xCuLL);
                            v438 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                              goto LABEL_417;
                            goto LABEL_419;
                          }
                        }
                        objc_msgSend(v696, "rankingItem");
                        v443 = (void *)objc_claimAutoreleasedReturnValue();
                        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v443, "attributes"), 0x80uLL);
                        v440 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          for (i9 = 0; i9 < objc_msgSend(v440, "count"); ++i9)
                          {
                            objc_msgSend(v440, "objectAtIndex:", i9);
                            v442 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0
                              && (objc_msgSend(v404, "isEqualToString:", v442) & 1) != 0)
                            {
                              goto LABEL_410;
                            }

                          }
                        }
LABEL_397:

                        goto LABEL_398;
                      }
LABEL_391:
                      objc_msgSend(v696, "rankingItem");
                      v439 = (void *)objc_claimAutoreleasedReturnValue();
                      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v439, "attributes"), 5uLL);
                      v440 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        for (i10 = 0; i10 < objc_msgSend(v440, "count"); ++i10)
                        {
                          objc_msgSend(v440, "objectAtIndex:", i10);
                          v442 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            && (objc_msgSend(v404, "isEqualToString:", v442) & 1) != 0)
                          {
LABEL_410:

                            goto LABEL_411;
                          }

                        }
                      }
                      goto LABEL_397;
                    }

                  }
                  goto LABEL_391;
                }
              }
              v418 = CFSTR("com.apple.mobileslideshow");

              v415 = v418;
              goto LABEL_373;
            }
          }
        }
        v386 = 1;
      }
LABEL_363:
      if (!v386 || v352 >= v638)
      {
LABEL_366:
        if (v351 < objc_msgSend(v713, "count"))
        {
          objc_msgSend(v713, "objectAtIndexedSubscript:", v351);
          v417 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v646, "addObject:", v417);

          ++v351;
        }
        ++v687;
        goto LABEL_369;
      }
      objc_msgSend(v633, "objectAtIndexedSubscript:", v352);
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v646, "addObject:", v416);

      ++v352;
      ++v674;
LABEL_369:

      if (v687 >= v630)
        goto LABEL_422;
    }
  }
  v352 = 0;
  v351 = 0;
LABEL_422:
  if (v352 < v638)
  {
    do
    {
      objc_msgSend(v633, "objectAtIndexedSubscript:", v352);
      v447 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v646, "addObject:", v447);

      ++v352;
    }
    while (v638 != v352);
  }
  while (v351 < objc_msgSend(v713, "count"))
  {
    objc_msgSend(v713, "objectAtIndexedSubscript:", v351);
    v448 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v646, "addObject:", v448);

    ++v351;
  }
  v756 = 0u;
  v754 = 0u;
  v755 = 0u;
  v753 = 0u;
  objc_msgSend(v646, "objectEnumerator");
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  v450 = objc_msgSend(v449, "countByEnumeratingWithState:objects:count:", &v753, v922, 16);
  if (v450)
  {
    v451 = *(_QWORD *)v754;
    do
    {
      for (i11 = 0; i11 != v450; ++i11)
      {
        if (*(_QWORD *)v754 != v451)
          objc_enumerationMutation(v449);
        objc_msgSend(v724, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v753 + 1) + 8 * i11));
        v453 = (void *)objc_claimAutoreleasedReturnValue();
        if (v453)
          objc_msgSend(v722, "addObject:", v453);
        if (objc_msgSend(v453, "domain") != 2 && (v704 & 1) == 0)
        {
          objc_msgSend(v453, "bundleIdentifier");
          v454 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v454, "isEqualToString:", CFSTR("com.apple.application")) & v706) == 1)
          {

          }
          else
          {
            objc_msgSend(v453, "bundleIdentifier");
            v455 = (void *)objc_claimAutoreleasedReturnValue();
            v456 = SSSectionIsSyndicatedPhotos(v455);

            if ((v456 & 1) == 0)
              objc_msgSend((id)v659, "refineSectionShowingVisibleResultsWithBetterTextMatches:", v453);
          }
        }

      }
      v450 = objc_msgSend(v449, "countByEnumeratingWithState:objects:count:", &v753, v922, 16);
    }
    while (v450);
  }

  v751 = 0u;
  v752 = 0u;
  v749 = 0u;
  v750 = 0u;
  v690 = v633;
  v457 = objc_msgSend(v690, "countByEnumeratingWithState:objects:count:", &v749, v921, 16);
  if (v457)
  {
    v458 = 1;
    v459 = *(_QWORD *)v750;
    do
    {
      v460 = 0;
      do
      {
        if (*(_QWORD *)v750 != v459)
          objc_enumerationMutation(v690);
        objc_msgSend(v724, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v749 + 1) + 8 * v460));
        v461 = (void *)objc_claimAutoreleasedReturnValue();
        v462 = v461;
        if (v461)
        {
          objc_msgSend(v461, "results");
          v463 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v463, "firstObject");
          v464 = (void *)objc_claimAutoreleasedReturnValue();

          if (v458)
          {
            if (objc_msgSend(v464, "placement") == 3 && objc_msgSend(v464, "topHit") == 2)
            {
              objc_msgSend(v722, "firstObject");
              v707 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v707, "results");
              v465 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v465, "firstObject");
              v701 = (void *)objc_claimAutoreleasedReturnValue();

              v466 = objc_msgSend(v707, "domain");
              v458 = v466 == 2;
              if (v466 == 2)
              {
                objc_msgSend(v701, "sectionBundleIdentifier");
                v467 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v464, "sectionBundleIdentifier");
                v468 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v467, "isEqualToString:", v468);

                goto LABEL_470;
              }
              if (SPRankingTopHitMustBeOverrideMinScore_onceToken != -1)
                dispatch_once(&SPRankingTopHitMustBeOverrideMinScore_onceToken, &__block_literal_global_341);
              v469 = *(float *)&SPRankingTopHitMustBeOverrideMinScore__topHitMustBeOverrideMinScore;
              objc_msgSend(v701, "rankingItem");
              v470 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v470, "bundleIDType") & 0x100) != 0)
              {
                objc_msgSend(v470, "L2FeatureVector");
                v474 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v474, "scoreForFeature:", 1);
                v476 = v475;

                objc_msgSend(v470, "L2FeatureVector");
                v477 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v477, "scoreForFeature:", 41);
                v479 = v478;

                v480 = objc_msgSend(v632, "queryTermLength");
                if (v480 > +[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen")&& v476 == 1.0&& v479 == 0.0)
                {
                  if (SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken != -1)
                    dispatch_once(&SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore_onceToken, &__block_literal_global_347);
                  v473 = &SPRankingTopHitMustBeOverrideMinSpellCorrectedAppScore__topHitMustBeOverrideMinSpellCorrectedAppScore;
LABEL_468:
                  v469 = *(float *)v473;
                }
              }
              else
              {
                objc_msgSend(v464, "sectionBundleIdentifier");
                v471 = (void *)objc_claimAutoreleasedReturnValue();
                v472 = objc_msgSend(v471, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

                if (v472)
                {
                  if (SPRankingTopHitMustBeOverrideMinFileScore_onceToken != -1)
                    dispatch_once(&SPRankingTopHitMustBeOverrideMinFileScore_onceToken, &__block_literal_global_344);
                  v473 = &SPRankingTopHitMustBeOverrideMinFileScore__topHitMustBeOverrideMinFileScore;
                  goto LABEL_468;
                }
              }
              objc_msgSend(v470, "L2FeatureVector");
              v481 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v481, "originalL2Score");
              v483 = v482;

              objc_msgSend(v722, "removeObject:", v462);
              objc_msgSend(v722, "insertObject:atIndex:", v462, v483 > v469);
LABEL_470:

            }
            else
            {
              v458 = 1;
            }
          }
          else
          {
            v458 = 0;
          }
          if (objc_msgSend(v464, "placement") == 2)
          {
            objc_msgSend(v722, "removeObject:", v462);
            objc_msgSend(v722, "addObject:", v462);
          }

        }
        ++v460;
      }
      while (v457 != v460);
      v457 = objc_msgSend(v690, "countByEnumeratingWithState:objects:count:", &v749, v921, 16);
    }
    while (v457);
  }

  v747 = 0u;
  v748 = 0u;
  v745 = 0u;
  v746 = 0u;
  v675 = v713;
  v484 = objc_msgSend(v675, "countByEnumeratingWithState:objects:count:", &v745, v920, 16);
  if (!v484)
  {

    v671 = 0;
    v634 = 0;
    v639 = 0;
    v603 = 0;
    v485 = 0;
    goto LABEL_571;
  }
  v671 = 0;
  v634 = 0;
  v639 = 0;
  v603 = 0;
  v485 = 0;
  v631 = 0;
  v683 = *(id *)v746;
  objc = (id)*MEMORY[0x1E0CA5FC0];
  do
  {
    v708 = 0;
    v688 = v484;
    v702 = v631;
    v631 += v484;
    do
    {
      if (*(id *)v746 != v683)
        objc_enumerationMutation(v675);
      v486 = *(void **)(*((_QWORD *)&v745 + 1) + 8 * v708);
      objc_msgSend(v724, "objectForKey:", v486);
      v487 = (void *)objc_claimAutoreleasedReturnValue();
      v488 = v487;
      if (v487)
      {
        objc_msgSend(v487, "results");
        v489 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v489, "firstObject");
        v714 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v714, "rankingItem");
        v697 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v714, "placement") == 1
          || v697 && objc_msgSend(v697, "topHitReason") == 16)
        {
          objc_msgSend(v722, "removeObject:", v488);
          objc_msgSend(v722, "insertObject:atIndex:", v488, 0);
        }
        else if (objc_msgSend(v714, "placement") == 2)
        {
          objc_msgSend(v714, "setPlacement:", 0);
          objc_msgSend(v722, "removeObject:", v488);
          objc_msgSend(v722, "addObject:", v488);
        }
        if (a11)
        {
          if (objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.people.findMy")))
          {
            v490 = v671;
            v671 = v488;
            goto LABEL_520;
          }
          if (objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.people.screenTimeRequest")))
          {
LABEL_507:
            objc_msgSend(v714, "valueForAttribute:withType:", objc, objc_opt_class());
            v508 = (void *)objc_claimAutoreleasedReturnValue();
            v509 = objc_msgSend(v508, "unsignedIntValue");

            if (v509 == 1)
            {
              v490 = v639;
              v639 = v488;
              goto LABEL_520;
            }
LABEL_521:
            if ((v704 & 1) == 0 && objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.shortcuts")))
            {
              objc_msgSend(v488, "resultSet");
              v518 = (void *)objc_claimAutoreleasedReturnValue();
              v743 = 0u;
              v744 = 0u;
              v741 = 0u;
              v742 = 0u;
              v519 = v518;
              v520 = objc_msgSend(v519, "countByEnumeratingWithState:objects:count:", &v741, v919, 16);
              if (v520)
              {
                v521 = *(_QWORD *)v742;
                do
                {
                  v522 = 0;
                  do
                  {
                    if (*(_QWORD *)v742 != v521)
                      objc_enumerationMutation(v519);
                    objc_msgSend(*(id *)(*((_QWORD *)&v741 + 1) + 8 * v522), "rankingItem");
                    v523 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v523, "L2FeatureVector");
                    v524 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v524, "scoreForFeature:", 130);
                    v526 = v525;

                    objc_msgSend(v523, "L2FeatureVector");
                    v527 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v527, "scoreForFeature:", 77);
                    v529 = v528;

                    objc_msgSend(v523, "L2FeatureVector");
                    v530 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v530, "scoreForFeature:", 165);
                    v532 = v531;

                    objc_msgSend(v523, "L2FeatureVector");
                    v533 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v533, "scoreForFeature:", 165);
                    v535 = v534;

                    if ((v532 != 0.0 || v529 <= 0.75)
                      && (v526 > 0.33 ? (v536 = v529 <= 1.0) : (v536 = 1),
                          !v536 ? (v537 = v535 == 1.0) : (v537 = 0),
                          !v537 ? (v538 = v526 < 0.5) : (v538 = 0),
                          v538))
                    {
                      objc_msgSend(v523, "L2FeatureVector", v526);
                      v542 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v542, "scoreForFeature:", 154);
                      v544 = v543;

                      objc_msgSend(v523, "L2FeatureVector");
                      v545 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v545, "scoreForFeature:", 89);
                      v547 = v546;

                      objc_msgSend(v523, "L2FeatureVector");
                      v548 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v548, "scoreForFeature:", 189);
                      v550 = v549;

                      objc_msgSend(v523, "L2FeatureVector");
                      v551 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v551, "scoreForFeature:", 189);
                      v553 = v552;

                      if (v550 == 0.0 && v547 > 0.75
                        || (v544 > 0.33 ? (v555 = v547 <= 1.0) : (v555 = 1),
                            !v555 ? (v556 = v553 == 1.0) : (v556 = 0),
                            v556 || v544 >= 0.5))
                      {
                        v554 = v488;

                        objc_msgSend(v523, "setShouldHideUnderShowMore:", 0);
                        objc_msgSend(v523, "setShouldHideUnderShowMoreIfNotTophit:", 0);
                        v485 = v554;
                      }
                    }
                    else
                    {
                      v539 = v488;

                      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v523, "attributes"), 0xA5uLL);
                      v540 = (void *)objc_claimAutoreleasedReturnValue();
                      v541 = v540;
                      if (!v540 || objc_msgSend(v540, "integerValue") != 1)
                        objc_msgSend(v523, "setTopHitReason:", 19);

                      v485 = v539;
                    }

                    ++v522;
                  }
                  while (v520 != v522);
                  v557 = objc_msgSend(v519, "countByEnumeratingWithState:objects:count:", &v741, v919, 16);
                  v520 = v557;
                }
                while (v557);
              }

            }
            goto LABEL_561;
          }
          if (!objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.people.askToBuyRequest")))
            goto LABEL_521;
LABEL_510:
          objc_msgSend(v714, "valueForAttribute:withType:", objc, objc_opt_class());
          v510 = (void *)objc_claimAutoreleasedReturnValue();
          v511 = objc_msgSend(v510, "unsignedIntValue");

          if (v511 != 1)
            goto LABEL_521;
          v490 = v634;
          v634 = v488;
LABEL_520:

          goto LABEL_521;
        }
        if (objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.people.findMy"))
          && objc_msgSend(v488, "resultsCount") == 1)
        {
          objc_msgSend(v488, "resultSet");
          v490 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v490, "firstObject");
          v491 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v491, "rankingItem");
          v492 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v492, "L2FeatureVector");
          v493 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v493)
            goto LABEL_496;
          objc_msgSend(v491, "rankingItem");
          v494 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v494, "L2FeatureVector");
          v495 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v495, "scoreForFeature:", 137);
          v497 = v496;

          if (v497 != 2147500000.0)
          {
            v492 = v671;
            v671 = v488;
LABEL_496:

          }
LABEL_519:

          goto LABEL_520;
        }
        if (objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.people.askToBuyRequest")))
        {
          objc_msgSend(v714, "rankingItem");
          v490 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v490, "L2FeatureVector");
          v498 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v498)
            goto LABEL_520;
          objc_msgSend(v714, "rankingItem");
          v499 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v499, "L2FeatureVector");
          v500 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v500, "scoreForFeature:", 137);
          v502 = v501;

          if (v502 == 2147500000.0)
            goto LABEL_521;
          goto LABEL_510;
        }
        if (objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.people.screenTimeRequest")))
        {
          objc_msgSend(v714, "rankingItem");
          v490 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v490, "L2FeatureVector");
          v503 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v503)
            goto LABEL_520;
          objc_msgSend(v714, "rankingItem");
          v504 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v504, "L2FeatureVector");
          v505 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v505, "scoreForFeature:", 137);
          v507 = v506;

          if (v507 != 2147500000.0)
            goto LABEL_507;
          goto LABEL_521;
        }
        if (!objc_msgSend(v486, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"))
          || objc_msgSend(v488, "resultsCount") != 1
          || v702)
        {
          goto LABEL_521;
        }
        objc_msgSend(v488, "resultSet");
        v490 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v490, "firstObject");
        v491 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v491, "rankingItem");
        v512 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v512, "L2FeatureVector");
        v513 = (void *)objc_claimAutoreleasedReturnValue();
        if (v513)
        {
          objc_msgSend(v491, "rankingItem");
          v514 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v514, "L2FeatureVector");
          v515 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v515, "scoreForFeature:", 131);
          v517 = v516;

          if (v517 == 2147500000.0)
            goto LABEL_519;
          v512 = v603;
          v603 = v488;
        }

        goto LABEL_519;
      }
LABEL_561:

      ++v702;
      ++v708;
    }
    while (v708 != v688);
    v484 = objc_msgSend(v675, "countByEnumeratingWithState:objects:count:", &v745, v920, 16);
  }
  while (v484);

  if (a11)
  {
    if (v634)
    {
      objc_msgSend(v722, "removeObject:", v634);
      objc_msgSend(v722, "insertObject:atIndex:", v634, 0);
    }
    if (v639)
    {
      objc_msgSend(v722, "removeObject:", v639);
      objc_msgSend(v722, "insertObject:atIndex:", v639, 0);
    }
    if (v671)
    {
      objc_msgSend(v722, "removeObject:");
      v558 = 0;
      goto LABEL_596;
    }
LABEL_597:
    v671 = 0;
  }
  else if (v603)
  {
    if (v634)
    {
      objc_msgSend(v722, "removeObject:", v634);
      objc_msgSend(v722, "insertObject:atIndex:", v634, 1);
    }
    if (v639)
    {
      objc_msgSend(v722, "removeObject:", v639);
      objc_msgSend(v722, "insertObject:atIndex:", v639, 1);
    }
    if (!v671)
      goto LABEL_597;
    objc_msgSend(v722, "removeObject:");
    v558 = 1;
LABEL_596:
    objc_msgSend(v722, "insertObject:atIndex:", v671, v558);
  }
  else
  {
    v603 = 0;
  }
  if ((v704 & 1) == 0 && v485)
  {
    objc_msgSend(v644, "maxEngagementProbability");
    v573 = v572;
    objc_msgSend(v644, "engagementProbabilityForCategory:", CFSTR("com.apple.other:search_preferences"));
    v575 = v574;
    v739 = 0u;
    v740 = 0u;
    v737 = 0u;
    v738 = 0u;
    v716 = v722;
    v576 = objc_msgSend(v716, "countByEnumeratingWithState:objects:count:", &v737, v918, 16);
    if (v576)
    {
      v726 = 0;
      v705 = *(_QWORD *)v738;
      while (2)
      {
        v577 = 0;
        v703 = v576;
        do
        {
          if (*(_QWORD *)v738 != v705)
            objc_enumerationMutation(v716);
          v709 = v577;
          v578 = *(void **)(*((_QWORD *)&v737 + 1) + 8 * v577);
          objc_msgSend(v578, "bundleIdentifier");
          v579 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v579, "isEqualToString:", CFSTR("com.apple.shortcuts")) & 1) != 0)
            goto LABEL_639;
          objc_msgSend(v644, "engagementProbabilityForCategory:", v579);
          if (v573 != -1.0
            && (v580 == v573
             || v573 == v575 && objc_msgSend(v579, "isEqualToString:", CFSTR("com.apple.Preferences"))))
          {
LABEL_632:
            v594 = v726 + 1;
          }
          else
          {
            if (v726
              || (objc_msgSend(v579, "isEqualToString:", CFSTR("com.apple.application")) & 1) == 0
              && (objc_msgSend(v579, "isEqualToString:", CFSTR("com.apple.app-clips")) & 1) == 0
              && (objc_msgSend(v579, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) == 0
              && (objc_msgSend(v579, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) == 0)
            {
              if ((objc_msgSend(v579, "hasPrefix:", CFSTR("com.apple.parsec.")) & 1) == 0)
              {
                objc_msgSend(v578, "resultSet");
                v698 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v698, "firstObject");
                v581 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v581, "rankingItem");
                v582 = (id)objc_claimAutoreleasedReturnValue();
                v689 = v581;
                if ((objc_msgSend(v582, "shouldHideUnderShowMore") & 1) != 0)
                  goto LABEL_637;
                objc_msgSend(v581, "rankingItem");
                v583 = (void *)objc_claimAutoreleasedReturnValue();
                v584 = objc_msgSend(v583, "shouldHideUnderShowMoreIfNotTophit");

                if ((v584 & 1) == 0)
                {
                  v735 = 0u;
                  v736 = 0u;
                  v733 = 0u;
                  v734 = 0u;
                  v582 = v698;
                  v585 = objc_msgSend(v582, "countByEnumeratingWithState:objects:count:", &v733, v917, 16);
                  if (v585)
                  {
                    v586 = *(_QWORD *)v734;
                    while (2)
                    {
                      for (i12 = 0; i12 != v585; ++i12)
                      {
                        if (*(_QWORD *)v734 != v586)
                          objc_enumerationMutation(v582);
                        objc_msgSend(*(id *)(*((_QWORD *)&v733 + 1) + 8 * i12), "rankingItem");
                        v588 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v588, "shouldHideUnderShowMore") & 1) != 0
                          || (objc_msgSend(v588, "shouldHideUnderShowMoreIfNotTophit") & 1) != 0)
                        {

                          goto LABEL_637;
                        }
                        objc_msgSend(v588, "interestingDate");
                        v589 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v632, "currentTime");
                        v591 = v590;
                        objc_msgSend(v589, "timeIntervalSinceReferenceDate");
                        v593 = v592 - v591 > -2592000.0;

                        if (v593)
                        {

                          goto LABEL_632;
                        }
                      }
                      v585 = objc_msgSend(v582, "countByEnumeratingWithState:objects:count:", &v733, v917, 16);
                      if (v585)
                        continue;
                      break;
                    }
                  }
LABEL_637:

                }
              }
LABEL_639:

              goto LABEL_641;
            }
            v594 = 1;
          }
          v726 = v594;

          v577 = v709 + 1;
        }
        while (v709 + 1 != v703);
        v576 = objc_msgSend(v716, "countByEnumeratingWithState:objects:count:", &v737, v918, 16);
        if (v576)
          continue;
        break;
      }
    }
    else
    {
      v726 = 0;
    }
LABEL_641:

    if (v726 < objc_msgSend(v716, "count"))
    {
      objc_msgSend(v716, "removeObject:", v485);
      objc_msgSend(v716, "insertObject:atIndex:", v485, v726);
    }
  }
LABEL_571:
  if (objc_msgSend(v632, "isNLSearch"))
  {
    v725 = (void *)objc_msgSend(v722, "mutableCopy");
    v559 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v722, "count"));
    v731 = 0u;
    v732 = 0u;
    v729 = 0u;
    v730 = 0u;
    v715 = v722;
    v560 = objc_msgSend(v715, "countByEnumeratingWithState:objects:count:", &v729, v916, 16);
    if (v560)
    {
      v561 = *(_QWORD *)v730;
      do
      {
        for (i13 = 0; i13 != v560; ++i13)
        {
          if (*(_QWORD *)v730 != v561)
            objc_enumerationMutation(v715);
          v563 = *(void **)(*((_QWORD *)&v729 + 1) + 8 * i13);
          objc_msgSend(v563, "results");
          v564 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v564, "firstObject");
          v565 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v565, "rankingItem");
          v566 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v566, "L2FeatureVector");
          v567 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v567, "scoreForFeature:", 2390);
          v569 = v568;

          if (v569 == 1.0)
          {
            objc_msgSend(v559, "addObject:", v563);
            objc_msgSend(v725, "removeObject:", v563);
          }

        }
        v560 = objc_msgSend(v715, "countByEnumeratingWithState:objects:count:", &v729, v916, 16);
      }
      while (v560);
    }

    objc_msgSend(v559, "addObjectsFromArray:", v725);
    v722 = (id)objc_msgSend(v559, "copy");

  }
  +[SSRankingManager logL3Results:l3Info:](SSRankingManager, "logL3Results:l3Info:", v722, v718);

  _Block_object_dispose(&v815, 8);
LABEL_583:

  _Block_object_dispose(&v876, 8);
  _Block_object_dispose(&v880, 8);
  _Block_object_dispose(&v884, 8);
  _Block_object_dispose(&v888, 8);
  _Block_object_dispose(&v892, 8);
  _Block_object_dispose(&v896, 8);
  _Block_object_dispose(&v900, 8);
  _Block_object_dispose(&v938, 8);

  objc_autoreleasePoolPop(context);
  if (v604)
  {
    v570 = 0;
  }
  else
  {
    if (isInternalDevice)
      objc_msgSend(*(id *)(v659 + 24), "appendFormat:", CFSTR("\n----------------L3 Ranking Info----------------\n%@\n----------------L3 Ranking Info End----------------\n\n\n"), v911[5]);
    v570 = v722;
  }
  _Block_object_dispose(&v910, 8);

  return v570;
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke()
{
  uint64_t result;

  result = get_thread_count();
  rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__core_count = result;
  return result;
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__l3modelManager;
  rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__l3modelManager = v0;

  return objc_msgSend((id)rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext__l3modelManager, "loadModel");
}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_405(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "rankingScore");
  objc_msgSend(v3, "roundedValueForScore:");
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_2_407(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_414(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  float v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __int16 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "rankingItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "L2FeatureVector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "rankingItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)buf = (float)objc_msgSend(v15, "isAssociatedWithTophitContactsFromItems:", v12);

    v42 = 3234;
    objc_msgSend(v10, "rankingItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "L2FeatureVector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScores:forFeatures:count:", buf, &v42, 1);

  }
  if ((objc_msgSend(v9, "bundleIDType") & 0x104) != 0)
  {
    objc_msgSend(v9, "keywordMatchScore");
    if (v18 > 0.05)
    {
      objc_msgSend(v9, "likelihood");
      if (v19 > 0.0500000007)
        objc_msgSend(v9, "setShouldHideUnderShowMore:", 0);
    }
  }
  objc_msgSend(v9, "L2FeatureVector");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v9, "L2FeatureVector");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scoreForFeature:", 3234);
    v24 = v23;

    if (v24 != 0.0)
      objc_msgSend(v9, "setShouldHideUnderShowMore:", 0);
  }
  if ((objc_msgSend(v9, "bundleIDType") & 8) != 0)
  {
    objc_msgSend(v9, "freshnessScore");
    if (v25 < 2.22044605e-16)
      objc_msgSend(v9, "setShouldHideUnderShowMore:", 1);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    v26 = *(void **)(a1 + 32);
    if (v26)
    {
      objc_msgSend(v9, "sectionBundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "containsObject:", v27);

      if ((v28 & 1) != 0)
      {
        v29 = 0;
LABEL_20:
        objc_msgSend(v9, "setShouldHideUnderShowMore:", v29);
        goto LABEL_21;
      }
    }
    if ((objc_msgSend(v9, "bundleIDType") & 0x8000) == 0
      && objc_msgSend(v9, "shouldHideUnderShowMoreIfNotTophit"))
    {
      v29 = 1;
      goto LABEL_20;
    }
  }
LABEL_21:
  if (SSEnableSpotlightFullPageRanking())
  {
    objc_msgSend(v9, "keywordMatchScore");
    if (v30 > 0.05
      || SSSectionIsSyndicatedPhotos(v11) && (objc_msgSend(v9, "topicalityScore"), v31 > 0.0500000007))
    {
      objc_msgSend(v9, "setShouldHideUnderShowMore:", 0);
    }
    else if ((SSResultTypeIsServer(objc_msgSend(v10, "type")) & 1) == 0)
    {
      objc_msgSend(v9, "topicalityScore");
      if (v32 < 2.22044605e-16)
      {
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v9, "attributes"), 7uLL);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v9, "attributes"), 0xCuLL);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v9, "attributes"), 4uLL);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        SSGeneralLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          if (v34)
            v37 = v34;
          else
            v37 = v35;
          if (v33)
            v38 = v33;
          else
            v38 = v37;
          SSRedactString(v38, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sectionBundleIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "topicalityScore");
          *(float *)buf = 5.7781e-34;
          v44 = v39;
          v45 = 2112;
          v46 = v40;
          v47 = 2048;
          v48 = v41;
          _os_log_impl(&dword_1B86C5000, v36, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][shouldHideUnderShowMore] result: %@ / bundle: %@ / topicality: %.06f", buf, 0x20u);

        }
        objc_msgSend(v9, "setShouldHideUnderShowMore:", 1);

      }
    }
  }
  if (objc_msgSend(v9, "shouldHideUnderShowMore") && (int)objc_msgSend(v10, "topHit") >= 1)
    objc_msgSend(v10, "setTopHit:", SSSetTopHitWithReasonString(0, v10, CFSTR("Demote due to shouldHideUnderShowMore"), 1));

}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_417(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  float v7;
  double v8;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  char v26;
  int v27;
  __int16 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t i;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  void *v79;
  unint64_t v80;
  id v81;
  void *v82;
  float v83;
  double v84;
  double v85;
  double v86;
  float v87;
  uint64_t v88;
  void *v89;
  id v90;
  PRSRankingItem *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  int v99;
  int v100;
  unsigned int v101;
  uint64_t v102;
  float v103;
  unsigned int v104;
  float v105;
  uint64_t v106;
  _BYTE *v107;
  uint64_t v108;
  void *v109;
  double v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  float v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  float v121;
  float v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  int v131;
  float v132;
  uint64_t v133;
  float v134;
  float v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  float v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  char v154;
  void *v155;
  char v156;
  int v157;
  void *v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t j;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  float v174;
  float v175;
  uint64_t v176;
  void *v177;
  unsigned int v178;
  unint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  float v185;
  float v186;
  void *v187;
  void *v188;
  void *v189;
  id v190;
  unsigned int v191;
  unint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  float v198;
  float v199;
  void *v200;
  void *v201;
  void *v202;
  __int16 v203;
  uint64_t v204;
  unint64_t v205;
  int v206;
  int v207;
  int v208;
  void *v209;
  void *v210;
  float v211;
  float v212;
  double v213;
  void *v214;
  float v215;
  float v216;
  void *v217;
  void *v218;
  float v219;
  float v220;
  int v221;
  double v222;
  int v223;
  _BOOL4 v224;
  int v225;
  float v226;
  float v227;
  float v228;
  uint64_t v229;
  void *v230;
  void *v231;
  float v232;
  float v233;
  double v234;
  void *context;
  unint64_t v236;
  void *v237;
  uint64_t v238;
  void *v239;
  void *v240;
  __int128 v241;
  uint64_t v242;
  double v243;
  uint64_t v244;
  float v245;
  uint64_t v246;
  int v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  uint64_t v254;
  id obj;
  id obja;
  unint64_t v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  int v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  _BYTE v275[18];
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  _BYTE v289[30];
  _OWORD v290[32];
  _BYTE v291[128];
  _BYTE v292[128];
  _BYTE v293[128];
  uint64_t v294;

  v294 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCB3708]();
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v4 = *(_QWORD *)(a1 + 256);
    v5 = v4 * a2;
    v6 = v4 * a2 + v4;
    if (v6 >= *(_QWORD *)(a1 + 264))
      v6 = *(_QWORD *)(a1 + 264);
    v236 = v6;
    if (v5 < v6)
    {
      v234 = 0.1;
      v7 = -1.0;
      v8 = -1.0;
      __asm { FMOV            V0.2S, #-1.0 }
      v242 = _D0;
      __asm { FMOV            V0.4S, #-1.0 }
      v241 = _Q0;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5, *(_QWORD *)&v234);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v238 = v5;
        v252 = v15;
        if (objc_msgSend(v16, "domain") == 2)
        {
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24)
            || !objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware")))
          {
            v247 = 0;
          }
          else
          {
            v247 = 1;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24) = 1;
          }
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24)
            && objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.parsec.weather")))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24) = 1;
          }
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24)
            && objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.parsec.web_images")))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24) = 1;
          }
          objc_msgSend(v16, "results");
          v29 = v15;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v16;
          v32 = objc_msgSend(v30, "count");

          v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v32);
          v240 = v31;
          objc_msgSend(v31, "results");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v249 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v32);
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", v29);
          v36 = *(float *)&v35;
          if (*(float *)&v35 != v7)
          {
            v37 = *(void **)(a1 + 96);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v259 = objc_msgSend(v37, "indexOfObject:", v38) + 1;

            v39 = *(void **)(a1 + 104);
            *(float *)&v40 = v36;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v243 = objc_msgSend(v39, "indexOfObject:", v41) + 1;

            v42 = *(void **)(a1 + 112);
            *(float *)&v43 = v36;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v244 = objc_msgSend(v42, "indexOfObject:", v44) + 1;

          }
          v261 = (void *)objc_opt_new();
          v45 = (void *)objc_opt_new();
          v46 = objc_msgSend(*(id *)(a1 + 120), "indexOfObject:", v252) + 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ((double)(unint64_t)v46 + v8) / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 120), "count"));
          v47 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setNumResults:", v48);

          v257 = v46;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setOriginalOrderAbsRank:", v49);

          v248 = (void *)v47;
          objc_msgSend(v45, "setOriginalOrderRelRank:", v47);
          *(float *)&v50 = v36;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setCep:", v51);

          v52 = 0x1E0CB3000uLL;
          if (v36 == -1.0)
          {
            objc_msgSend(v45, "setMaxCEPAbsRank:", &unk_1E6E9A1B0);
            objc_msgSend(v45, "setMaxCEPRelRank:", &unk_1E6E9A1B0);
            objc_msgSend(v45, "setCepMaxRatio:", &unk_1E6E9A1B0);
            objc_msgSend(v45, "setCepAllMaxRatio:", &unk_1E6E9A1B0);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v259);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setMaxCEPAbsRank:", v53);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ((double)(unint64_t)v259 + v8) / (double)*(unint64_t *)(a1 + 272));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setMaxCEPRelRank:", v54);

            v55 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 128), "doubleValue");
            objc_msgSend(v55, "numberWithDouble:", v36 / v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setCepMaxRatio:", v57);

            v58 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 136), "doubleValue");
            objc_msgSend(v58, "numberWithDouble:", v36 / v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setCepAllMaxRatio:", v60);

          }
          v251 = (void *)v33;
          v61 = v253;
          v237 = v45;
          objc_msgSend(v253, "setObject:forKey:", v45, v252);
          v269 = 0u;
          v270 = 0u;
          v267 = 0u;
          v268 = 0u;
          v62 = v34;
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v267, v292, 16);
          if (v63)
          {
            v64 = v63;
            v260 = *(_QWORD *)v268;
            v65 = -1.0;
            do
            {
              for (i = 0; i != v64; ++i)
              {
                if (*(_QWORD *)v268 != v260)
                  objc_enumerationMutation(v62);
                v67 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * i);
                objc_msgSend(v67, "rankingScore");
                objc_msgSend(*(id *)(a1 + 32), "roundedValueForScore:");
                v69 = v68;
                objc_msgSend(*(id *)(v52 + 2024), "numberWithDouble:");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v261, "addObject:", v70);

                if (v69 > v65)
                  v65 = v69;
                objc_msgSend(v67, "sectionBundleIdentifier");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                if (v71)
                {
                  objc_msgSend(v61, "objectForKey:", v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v72)
                  {
                    v73 = (void *)MEMORY[0x1E0CB37E8];
                    v74 = objc_msgSend(v67, "blockId");
                    objc_msgSend(v72, "blockIdValue");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = objc_msgSend(v75, "unsignedLongLongValue");

                    if (v74 <= v76)
                      v77 = v76;
                    else
                      v77 = v74;
                    v61 = v253;
                    objc_msgSend(v73, "numberWithUnsignedLongLong:", v77);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "setBlockIdValue:", v78);

                    v52 = 0x1E0CB3000;
                  }

                }
              }
              v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v267, v292, 16);
            }
            while (v64);
          }
          else
          {
            v65 = -1.0;
          }

          objc_msgSend(v261, "sortUsingComparator:", &__block_literal_global_428);
          objc_msgSend(*(id *)(v52 + 2024), "numberWithDouble:", v65);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "setMaxScore:", v79);

          v80 = objc_msgSend(v261, "count");
          v263 = 0u;
          v264 = 0u;
          v265 = 0u;
          v266 = 0u;
          v81 = v62;
          v7 = -1.0;
          v17 = v251;
          v82 = v252;
          v254 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v263, v291, 16);
          if (v254)
          {
            v246 = *(_QWORD *)v264;
            v83 = (float)(unint64_t)v259;
            v245 = (float)*(unint64_t *)&v243;
            *(float *)&v244 = (float)(unint64_t)v244;
            v84 = (double)(unint64_t)v259 + -1.0;
            v85 = -1.0;
            v243 = (double)*(unint64_t *)&v243 + -1.0;
            v86 = (double)v80;
            v87 = (float)v257;
            obja = v81;
            do
            {
              v88 = 0;
              do
              {
                if (*(_QWORD *)v264 != v246)
                  objc_enumerationMutation(obja);
                v89 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * v88);
                objc_msgSend(v89, "rankingItem");
                v90 = (id)objc_claimAutoreleasedReturnValue();
                if (!v90)
                {
                  v91 = [PRSRankingItem alloc];
                  objc_msgSend(v89, "sectionBundleIdentifier");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v90 = -[PRSRankingItem initForParsecResultWithBundleID:](v91, "initForParsecResultWithBundleID:", v92);

                  objc_msgSend(v89, "setRankingItem:", v90);
                }
                objc_msgSend(v90, "L2FeatureVector");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "sectionBundleIdentifier");
                v94 = objc_claimAutoreleasedReturnValue();
                if (v94)
                {
                  objc_msgSend(v253, "objectForKey:", v94);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v96 = v95;
                  if (v95)
                  {
                    objc_msgSend(v95, "blockIdValue");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v97)
                    {
                      objc_msgSend(v89, "setFeedbackBlockId:", objc_msgSend(v89, "blockId"));
                    }
                    else
                    {
                      objc_msgSend(v89, "setFeedbackBlockId:");
                      objc_msgSend(v96, "setBlockIdValue:", &unk_1E6E9A1B0);
                    }
                  }
                  else
                  {
                    objc_msgSend(v89, "setFeedbackBlockId:");
                  }

                }
                *(_OWORD *)((char *)&v290[29] + 4) = 0u;
                memset((char *)&v290[30] + 4, 0, 28);
                *(_OWORD *)((char *)&v290[27] + 4) = 0u;
                *(_OWORD *)((char *)&v290[28] + 4) = 0u;
                *(_OWORD *)((char *)&v290[25] + 4) = 0u;
                *(_OWORD *)((char *)&v290[26] + 4) = 0u;
                *(_OWORD *)((char *)&v290[23] + 4) = 0u;
                *(_OWORD *)((char *)&v290[24] + 4) = 0u;
                *(_OWORD *)((char *)&v290[21] + 4) = 0u;
                *(_OWORD *)((char *)&v290[22] + 4) = 0u;
                *(_OWORD *)((char *)&v290[19] + 4) = 0u;
                *(_OWORD *)((char *)&v290[20] + 4) = 0u;
                *(_OWORD *)((char *)&v290[17] + 4) = 0u;
                *(_OWORD *)((char *)&v290[18] + 4) = 0u;
                *(_OWORD *)((char *)&v290[15] + 4) = 0u;
                *(_OWORD *)((char *)&v290[16] + 4) = 0u;
                *(_OWORD *)((char *)&v290[13] + 4) = 0u;
                *(_OWORD *)((char *)&v290[14] + 4) = 0u;
                *(_OWORD *)((char *)&v290[11] + 4) = 0u;
                *(_OWORD *)((char *)&v290[12] + 4) = 0u;
                *(_OWORD *)((char *)&v290[9] + 4) = 0u;
                *(_OWORD *)((char *)&v290[10] + 4) = 0u;
                *(_OWORD *)((char *)&v290[7] + 4) = 0u;
                *(_OWORD *)((char *)&v290[8] + 4) = 0u;
                *(_OWORD *)((char *)&v290[5] + 4) = 0u;
                *(_OWORD *)((char *)&v290[6] + 4) = 0u;
                *(_OWORD *)((char *)&v290[3] + 4) = 0u;
                *(_OWORD *)((char *)&v290[4] + 4) = 0u;
                memset((char *)v290 + 4, 0, 48);
                v288 = 0u;
                memset(v289, 0, sizeof(v289));
                v286 = 0u;
                v287 = 0u;
                v284 = 0u;
                v285 = 0u;
                v282 = 0u;
                v283 = 0u;
                v280 = 0u;
                v281 = 0u;
                v278 = 0u;
                v279 = 0u;
                v276 = 0u;
                v277 = 0u;
                *(_OWORD *)&v275[2] = 0u;
                *(_WORD *)v275 = 366;
                *(float *)v290 = v36;
                objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_maps"));
                *(_WORD *)&v275[2] = 402;
                DWORD1(v290[0]) = v98;
                objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_app_store"));
                *(_WORD *)&v275[4] = 403;
                DWORD2(v290[0]) = v99;
                objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_appstore"));
                *(_WORD *)&v275[6] = 404;
                HIDWORD(v290[0]) = v100;
                objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", CFSTR("com.apple.other.search_web"));
                *(_DWORD *)&v275[8] = 24379797;
                *(_QWORD *)&v290[1] = v101 | 0x3F80000000000000;
                v102 = objc_msgSend(*(id *)(a1 + 144), "indexOfObject:", v89);
                *(_WORD *)&v275[12] = 373;
                v103 = ((double)(unint64_t)(v102 + 1) + v85) / (double)*(unint64_t *)(a1 + 280);
                *(_DWORD *)&v275[14] = 24576374;
                *((float *)&v290[1] + 2) = (float)(unint64_t)(v102 + 1);
                *((float *)&v290[1] + 3) = v103;
                v259 = (uint64_t)v93;
                v258 = (void *)v94;
                if (v36 == v7)
                {
                  LODWORD(v276) = 24707448;
                  WORD2(v276) = 379;
                  v106 = 12;
                  v290[2] = v241;
                }
                else
                {
                  *(float *)&v104 = v84 / (double)*(unint64_t *)(a1 + 272);
                  *(_QWORD *)&v290[2] = __PAIR64__(v104, LODWORD(v83));
                  *((_QWORD *)&v290[2] + 1) = __PAIR64__(v244, LODWORD(v245));
                  v105 = v243 / (double)*(unint64_t *)(a1 + 288);
                  *(_QWORD *)&v276 = 0x17B0179017A0178;
                  *(float *)&v290[3] = v105;
                  v106 = 13;
                }
                v107 = &v275[2 * v106];
                *(_QWORD *)v107 = 0x17F017E017D017CLL;
                *(_OWORD *)((char *)v290 + 4 * v106) = *(_OWORD *)(a1 + 304);
                *(_WORD *)&v275[2 * v106 + 8] = 384;
                *((_WORD *)v107 + 5) = 385;
                v108 = v106 + 6;
                *(_QWORD *)((char *)&v290[1] + 4 * v106) = *(_QWORD *)(a1 + 320);
                v109 = *(void **)(a1 + 32);
                objc_msgSend(v89, "rankingScore");
                objc_msgSend(v109, "roundedValueForScore:");
                v111 = v110;
                *(_WORD *)&v275[2 * v108] = 386;
                *(float *)&v110 = v110;
                v112 = a1;
                v113 = v106 + 7;
                *((_DWORD *)v290 + v108) = LODWORD(v110);
                v114 = *(void **)(v112 + 152);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v111);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                v116 = objc_msgSend(v114, "indexOfObject:", v115) + 1;

                *(_WORD *)&v275[2 * v113] = 387;
                *((float *)v290 + v113) = (float)(unint64_t)v116;
                v117 = ((double)(unint64_t)v116 + -1.0) / (double)*(unint64_t *)(v112 + 296);
                *(_WORD *)&v275[2 * v106 + 16] = 388;
                v118 = v106 + 9;
                *((float *)&v290[2] + v106) = v117;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v111);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                v120 = objc_msgSend(v261, "indexOfObject:", v119) + 1;

                *(_WORD *)&v275[2 * v118] = 389;
                *((float *)v290 + v118) = (float)(unint64_t)v120;
                v85 = -1.0;
                *(_WORD *)&v275[2 * v106 + 20] = 390;
                v121 = ((double)(unint64_t)v120 + -1.0) / v86;
                *((float *)&v290[2] + v106 + 2) = v121;
                v122 = (float)*(unint64_t *)(v112 + 280);
                *(_WORD *)&v275[2 * v106 + 22] = 396;
                v123 = v106 + 12;
                *((float *)&v290[2] + v106 + 3) = v122;
                v124 = objc_msgSend(obja, "count");
                *(_WORD *)&v275[2 * v123] = 399;
                *((float *)v290 + v123) = (float)v124;
                *(_WORD *)&v275[2 * v106 + 26] = 1776;
                v125 = v106 + 14;
                *((float *)&v290[3] + v106 + 1) = v87;
                objc_msgSend(v248, "floatValue");
                *(_WORD *)&v275[2 * v125] = 1777;
                v126 = v106 + 15;
                *((_DWORD *)v290 + v125) = v127;
                objc_msgSend(*(id *)(v112 + 128), "floatValue");
                *(_WORD *)&v275[2 * v126] = 1778;
                v128 = v106 | 0x10;
                *((_DWORD *)v290 + v126) = v129;
                objc_msgSend(*(id *)(v112 + 136), "floatValue");
                *(_WORD *)&v275[2 * v128] = 1780;
                v130 = v106 + 17;
                *((_DWORD *)v290 + v128) = v131;
                v7 = -1.0;
                if (v36 == -1.0)
                {
                  *(_WORD *)&v275[2 * v130] = 1779;
                  *(_WORD *)&v275[(2 * v106) | 0x24] = 1781;
                  *(_QWORD *)((char *)v290 + 4 * v130) = v242;
                  *(_WORD *)&v275[2 * v106 + 38] = 1980;
                  v135 = -1.0;
                  *((_DWORD *)&v290[4] + v106 + 3) = -1082130432;
                }
                else
                {
                  objc_msgSend(*(id *)(v112 + 128), "floatValue");
                  *(_WORD *)&v275[2 * v130] = 1779;
                  v133 = v106 | 0x12;
                  *((float *)v290 + v130) = v36 / v132;
                  objc_msgSend(*(id *)(v112 + 136), "floatValue");
                  *(_WORD *)&v275[2 * v133] = 1781;
                  *((float *)v290 + v133) = v36 / v134;
                  *(_WORD *)&v275[2 * v106 + 38] = 1980;
                  *((float *)&v290[4] + v106 + 3) = v83;
                  v135 = v84 / (double)*(unint64_t *)(v112 + 272);
                }
                a1 = v112;
                v82 = v252;
                *(_WORD *)&v275[2 * v106 + 40] = 1981;
                *((float *)&v290[5] + v106) = v135;
                v136 = v106 + 21;
                if (v247)
                {
                  objc_msgSend(*(id *)(v112 + 56), "numAppsDeduped");
                  *(_WORD *)&v275[2 * v136] = 2317;
                  v137 = v106 + 22;
                  *((_DWORD *)v290 + v136) = v138;
                  objc_msgSend(*(id *)(v112 + 56), "engagementProbabilityForCategory:", CFSTR("com.apple.application"));
                  if (v139 == -1.0)
                  {
                    v136 = v106 + 22;
                  }
                  else
                  {
                    *(_WORD *)&v275[2 * v137] = 2318;
                    v136 = v106 + 23;
                    *((float *)v290 + v137) = v139;
                    if (v36 != -1.0 && v139 != 0.0)
                    {
                      *(_WORD *)&v275[2 * v136] = 2319;
                      *((float *)v290 + v136) = v36 / v139;
                      v136 = v106 + 24;
                    }
                  }
                }
                objc_msgSend(v93, "setScores:forFeatures:count:", v290, v275, v136);
                objc_msgSend(v93, "setBundleID:", v252);
                objc_msgSend(v249, "addObject:", v93);
                v17 = v251;
                objc_msgSend(v251, "addObject:", v89);

                ++v88;
              }
              while (v254 != v88);
              v81 = obja;
              v140 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v263, v291, 16);
              v254 = v140;
            }
            while (v140);
          }
          v141 = v82;
          v18 = v81;

          v5 = v238;
          if (objc_msgSend(v249, "count"))
          {
            objc_msgSend(*(id *)(a1 + 160), "setObject:atIndexedSubscript:", v249, v238);
            objc_msgSend(*(id *)(a1 + 168), "setObject:atIndexedSubscript:", v17, v238);
          }
          v8 = -1.0;
          v16 = v240;
          if (objc_msgSend(v253, "count"))
            objc_msgSend(*(id *)(a1 + 176), "setObject:atIndexedSubscript:", v253, v238);
          v15 = v141;
          objc_msgSend(*(id *)(a1 + 64), "prepareParsecResults:inBundle:", v18, v141);
          if (objc_msgSend(v141, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware")))
          {
            v142 = *(_QWORD *)(*(_QWORD *)(a1 + 208) + 8);
            if (!*(_BYTE *)(v142 + 24))
              *(_BYTE *)(v142 + 24) = 1;
            if (!objc_msgSend(v18, "count"))
              goto LABEL_95;
            objc_msgSend(v18, "firstObject");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "rankingItem");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v145 = v144;
            if (!v144)
            {
LABEL_94:

              v16 = v240;
LABEL_95:

LABEL_194:
              goto LABEL_195;
            }
            objc_msgSend(v144, "L2FeatureVector");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v146)
            {
LABEL_93:
              v15 = v141;
              goto LABEL_94;
            }
            v147 = v146;
            objc_msgSend(v146, "scoreForFeature:", 2304);
            v149 = *(_QWORD *)(a1 + 232);
          }
          else
          {
            if (!objc_msgSend(v141, "isEqualToString:", CFSTR("com.apple.parsec.tv.tvShow")))
              goto LABEL_95;
            v150 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8);
            if (!*(_BYTE *)(v150 + 24))
              *(_BYTE *)(v150 + 24) = 1;
            if (!objc_msgSend(v18, "count"))
              goto LABEL_95;
            objc_msgSend(v18, "firstObject");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "rankingItem");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            v145 = v151;
            if (!v151)
              goto LABEL_94;
            objc_msgSend(v151, "L2FeatureVector");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v152)
              goto LABEL_93;
            v147 = v152;
            objc_msgSend(v152, "scoreForFeature:", 2312);
            v149 = *(_QWORD *)(a1 + 248);
          }
          *(_DWORD *)(*(_QWORD *)(v149 + 8) + 24) = v148;

          goto LABEL_93;
        }
        objc_msgSend(v16, "resultSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
          break;
LABEL_195:

        if (++v5 == v236)
          goto LABEL_199;
      }
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = v16;
      objc_msgSend(v16, "results");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sectionBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lowercaseString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v249 = v22;
      objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", v22);
      v250 = v17;
      if (v23 != v7)
      {
        v24 = v23;
        objc_msgSend(CFSTR("com.apple.Preferences"), "lowercaseString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v22, "isEqualToString:", v25);

        obj = v18;
        if ((v26 & 1) != 0)
        {
          v27 = 1;
          v28 = 368;
        }
        else
        {
          objc_msgSend(CFSTR("com.apple.app-clips"), "lowercaseString");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = objc_msgSend(v22, "isEqualToString:", v153);

          if ((v154 & 1) != 0)
          {
            v27 = 1;
            v28 = 369;
          }
          else
          {
            objc_msgSend(CFSTR("com.apple.tips"), "lowercaseString");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = objc_msgSend(v22, "isEqualToString:", v155);

            if ((v156 & 1) != 0)
            {
              v27 = 1;
              v28 = 371;
            }
            else
            {
              v157 = objc_msgSend(v22, "hasPrefix:", CFSTR("com.apple."));
              if (v157)
                v28 = 3235;
              else
                v28 = 370;
              v27 = v157 ^ 1;
            }
          }
        }
        v158 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
        v271 = 0u;
        v272 = 0u;
        v273 = 0u;
        v274 = 0u;
        v159 = v17;
        v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v271, v293, 16);
        if (v160)
        {
          v161 = v160;
          v162 = *(_QWORD *)v272;
          do
          {
            for (j = 0; j != v161; ++j)
            {
              if (*(_QWORD *)v272 != v162)
                objc_enumerationMutation(v159);
              objc_msgSend(*(id *)(*((_QWORD *)&v271 + 1) + 8 * j), "rankingItem");
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v164, "L2FeatureVector");
              v165 = (void *)objc_claimAutoreleasedReturnValue();

              if (v165)
              {
                *(_DWORD *)v275 = 367;
                *(_QWORD *)&v290[0] = LODWORD(v24);
                if (v27)
                {
                  *(_WORD *)&v275[2] = v28;
                  *((float *)v290 + 1) = v24;
                  objc_msgSend(v165, "setScores:forFeatures:count:", v290, v275, 2);
                  objc_msgSend(v158, "addObject:", v165);
                }
                else
                {
                  objc_msgSend(v165, "setScores:forFeatures:count:", v290, v275, 1);
                }
              }

            }
            v161 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v271, v293, 16);
          }
          while (v161);
        }

        if (v27)
        {
          v166 = (void *)objc_msgSend(*(id *)(a1 + 64), "computeScoresForVectors:", v158);
          if (v166)
            free(v166);
        }

        v5 = v238;
        v17 = v250;
        v18 = obj;
      }
      objc_msgSend(v18, "rankingItem");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      if (v167)
      {
        objc_msgSend(v18, "rankingItem");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        v262 = objc_msgSend(v168, "shouldHideUnderShowMore") ^ 1;

      }
      else
      {
        v262 = 0;
      }

      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setObject:atIndexedSubscript:", v169, v5);

      objc_msgSend(v18, "rankingItem");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "L2FeatureVector");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      if (v171)
      {
        objc_msgSend(v18, "rankingItem");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "L2FeatureVector");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "originalL2Score");
        v175 = v174;

        v5 = v238;
      }
      else
      {
        v175 = -3.4028e38;
      }

      v176 = objc_msgSend(v17, "count");
      objc_msgSend(v18, "rankingItem");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v177, "bundleIDType");

      if (!v176)
      {
        objc_msgSend(*(id *)(a1 + 88), "setObject:atIndexedSubscript:", v18, v5);
LABEL_192:
        v16 = v239;
        goto LABEL_193;
      }
      v179 = v176;
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "rankingItem");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = v181;
      v183 = v252;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24)
        && (objc_msgSend(v181, "bundleIDType") & 0x400) != 0)
      {
        objc_msgSend(v182, "L2FeatureVector");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "scoreForFeature:", 31);
        v186 = v185;

        v183 = v252;
        _ZF = v186 == 1.0;
        v7 = -1.0;
        if (_ZF)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24) = 1;
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 24)
        && SSSectionIsSyndicatedPhotos(v183))
      {
        v187 = v18;
        objc_msgSend(v180, "rankingItem");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v188, "photosMatch") & 1) != 0)
          goto LABEL_136;
        objc_msgSend(v180, "rankingItem");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v189, "photosExactMatch"))
        {

          v183 = v252;
LABEL_136:

LABEL_137:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 24) = 1;
        }
        else
        {
          objc_msgSend(v180, "rankingItem");
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v230, "L2FeatureVector");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v231, "scoreForFeature:", 1928);
          v233 = v232;

          v17 = v250;
          _ZF = v233 == 1.0;
          v7 = -1.0;
          v183 = v252;
          v18 = v187;
          if (_ZF)
            goto LABEL_137;
        }
      }
      v190 = v18;
      (*(void (**)(void))(*(_QWORD *)(a1 + 184) + 16))();

      if (v179 >= 2)
      {
        v191 = (v178 >> 15) & 1;
        v192 = 1;
        while (1)
        {
          objc_msgSend(v17, "objectAtIndex:", v192);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v193, "rankingItem");
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "L2FeatureVector");
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          if (v195)
          {
            objc_msgSend(v193, "rankingItem");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v196, "L2FeatureVector");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v197, "originalL2Score");
            v199 = v198;

            v17 = v250;
          }
          else
          {
            v199 = -3.4028e38;
          }

          objc_msgSend(v193, "rankingItem");
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          v191 += (objc_msgSend(v200, "bundleIDType") >> 15) & 1;
          if (v199 > v175)
            break;
          objc_msgSend(v190, "rankingItem");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v201, "bundleIDType") & 0x8000) == 0)
            goto LABEL_153;
          objc_msgSend(v193, "rankingItem");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v203 = objc_msgSend(v202, "bundleIDType");

          v17 = v250;
          if ((v203 & 0x8000) == 0)
            break;
LABEL_154:
          v7 = -1.0;
          v183 = v252;
          (*(void (**)(void))(*(_QWORD *)(a1 + 184) + 16))();

          if (v179 == ++v192)
            goto LABEL_155;
        }
        v204 = objc_msgSend(v239, "maxInitiallyVisibleResults");
        if (v262)
        {
          v205 = v204 ? v204 : v179;
          if ((objc_msgSend(v200, "shouldHideUnderShowMore") & 1) != 0 || v192 >= v205 + v191)
            goto LABEL_154;
        }
        v201 = v190;
        v190 = v193;
        v175 = v199;
LABEL_153:

        goto LABEL_154;
      }
LABEL_155:
      v18 = v190;
      objc_msgSend(*(id *)(a1 + 88), "setObject:atIndexedSubscript:", v190, v238);
      if (*(_BYTE *)(a1 + 328))
      {
        v206 = 0;
        v16 = v239;
      }
      else
      {
        v16 = v239;
        if ((objc_msgSend(v183, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
        {
          v208 = objc_msgSend(v183, "isEqualToString:", CFSTR("com.apple.Preferences"));
          v206 = 1;
          goto LABEL_164;
        }
        v206 = objc_msgSend(v183, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));
      }
      v207 = objc_msgSend(v183, "isEqualToString:", CFSTR("com.apple.Preferences"));
      v208 = v207;
      if ((v206 & 1) == 0 && !v207)
      {
        v5 = v238;
LABEL_193:
        v15 = v252;
        goto LABEL_194;
      }
LABEL_164:
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "rankingItem");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", v252);
      v212 = v211;
      if (v206)
      {
        v213 = v211;
        objc_msgSend(v210, "L2FeatureVector");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v214, "scoreForFeature:", 1961);
        v216 = v215;

        objc_msgSend(v210, "L2FeatureVector");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v217, "scoreForFeature:", 1955);

        objc_msgSend(v210, "L2FeatureVector");
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v218, "scoreForFeature:", 2084);
        v220 = v219;

        v221 = objc_msgSend(v252, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));
        v222 = 0.01;
        if (v221)
          v222 = 0.05;
        v223 = v222 > v213 && v212 != -1.0;
        if (v220 == -1.0)
        {
          v5 = v238;
        }
        else
        {
          v5 = v238;
          if (v216 != -1.0)
          {
            v224 = v220 <= v234;
            if (v216 <= 5.0)
              v224 = 1;
            v223 &= v224;
          }
        }
        if ((objc_msgSend(v210, "hasPolicyMultipleTermsPhraseMatch") & 1) != 0
          || (objc_msgSend(v210, "hasPolicyMultipleTermsNearMatch") & 1) != 0
          || (objc_msgSend(v210, "hasPolicySingleTermPhraseMatch") & 1) != 0
          || ((v223 ^ 1) & 1) != 0)
        {
          goto LABEL_191;
        }
        objc_msgSend(v209, "setPlacement:", 2);
        v229 = SSSetTopHitWithReasonString(0, v209, CFSTR("Demote due to SFResultPlacementBottom"), 1);
      }
      else
      {
        if (*(_BYTE *)(a1 + 329))
          v225 = 0;
        else
          v225 = v208;
        v5 = v238;
        if (v225 != 1)
          goto LABEL_191;
        if (v211 == -1.0)
          goto LABEL_191;
        objc_msgSend(*(id *)(a1 + 56), "maxEngagementProbability");
        v227 = v226;
        objc_msgSend(*(id *)(a1 + 56), "engagementProbabilityForCategory:", CFSTR("com.apple.other:search_preferences"));
        if (v227 == -1.0 || v212 != v227 && v228 != v227)
          goto LABEL_191;
        objc_msgSend(v210, "setTopHitReason:", 15);
        objc_msgSend(v209, "setPlacement:", 1);
        v229 = SSSetTopHitWithReasonType(1, v209, 15, 1, 0);
      }
      objc_msgSend(v209, "setTopHit:", v229);
LABEL_191:

      v7 = -1.0;
      goto LABEL_192;
    }
  }
LABEL_199:
  objc_autoreleasePoolPop(context);
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_427(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_2_431(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

void __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_3_433(uint64_t a1, uint64_t a2)
{
  unint64_t j;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  float v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SectionL3Scores *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t m;
  void *v40;
  int v41;
  int v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unint64_t n;
  void *v51;
  char *v52;
  unint64_t k;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    if (SSEnableSpotlightFullPageRanking())
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v15 = *(id *)(a1 + 88);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v58 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v19, "rankingItem", (_QWORD)v57);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sectionBundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == 0;

            if (!v22)
            {
              v23 = *(void **)(a1 + 96);
              objc_msgSend(v19, "rankingItem");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "sectionBundleIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKey:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v26)
              {
                v27 = *(void **)(a1 + 104);
                objc_msgSend(v19, "rankingItem");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "sectionBundleIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectForKey:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (v30)
                {
                  v31 = objc_alloc_init(SectionL3Scores);
                  if (-[SectionL3Scores computeScore:rankingConfig:hasGoodLocalResult:pos:queryContext:](v31, "computeScore:rankingConfig:hasGoodLocalResult:pos:queryContext:", v30, *(_QWORD *)(a1 + 112), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24), 0, *(_QWORD *)(a1 + 120)))
                  {
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = 1;
                  }
                  v32 = *(void **)(a1 + 96);
                  objc_msgSend(v19, "rankingItem");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "sectionBundleIdentifier");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v34);

                }
              }
            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v16);
      }

    }
    +[SSRankingManager rankLocalBundles:sectionMapping:l3RankingScores:](SSRankingManager, "rankLocalBundles:sectionMapping:l3RankingScores:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 96), (_QWORD)v57);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 80), "sortWithOptions:usingComparator:", 1, &__block_literal_global_437);
  }
  else if (!a2 && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    for (j = 0; ; ++j)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "count");
      v5 = *(void **)(a1 + 32);
      if (j >= v4)
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", j);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v6, "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = 0;
      v64 = 0;
      v62 = 0;
      objc_msgSend(v9, "maxScoreAbsRank");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      LODWORD(v63) = v11;

      LOWORD(v62) = 1650;
      objc_msgSend(v9, "maxScoreRelRank");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      HIDWORD(v63) = v13;

      WORD1(v62) = 1651;
      if (objc_msgSend(*(id *)(a1 + 48), "hasParsecPolicyPhraseMatch"))
        v14 = 1.0;
      else
        v14 = 0.0;
      *(float *)&v64 = v14;
      WORD2(v62) = 2089;
      objc_msgSend(v6, "setScores:forFeatures:count:", &v63, &v62, 3);

    }
    if (objc_msgSend(v5, "count"))
    {
      if (*(_BYTE *)(a1 + 144))
      {
        v52 = PRSModelManagerAssociatedObjectKeyForType(0);
        for (k = 0; k < objc_msgSend(*(id *)(a1 + 32), "count"); ++k)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", k);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", k);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "rankingItem");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          objc_setAssociatedObject(v54, v52, v56, (void *)1);
        }
      }
      v38 = (void *)objc_msgSend(*(id *)(a1 + 48), "computeScoresForVectors:withBundleFeatures:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      if (v38)
      {
        for (m = 0; m < objc_msgSend(*(id *)(a1 + 32), "count"); ++m)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", m);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "originalL2Score");
          v42 = v41;
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", m);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v44) = v42;
          objc_msgSend(v43, "setL2score:", v44);

          v45 = *(void **)(a1 + 64);
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", m);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "sectionBundleIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v45, "indexOfObject:", v47);
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", m);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setScore:", v48, 0);

        }
        if (SPBlockGroupingEnabled_onceToken != -1)
          dispatch_once(&SPBlockGroupingEnabled_onceToken, &__block_literal_global_335);
        if (SPBlockGroupingEnabled__blockGroupingEnabled)
          objc_msgSend(*(id *)(a1 + 72), "updateServerScoresUsingBlockOrder:bundleFeatures:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
        free(v38);
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "sortWithOptions:usingComparator:", 17, &__block_literal_global_435);
    for (n = 0; n < objc_msgSend(*(id *)(a1 + 32), "count"); ++n)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", n);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setScore:", 0, 0);

    }
  }
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_4_434(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(a2, "score");
  v6 = (double)*(unsigned __int128 *)&v5;
  v7 = objc_msgSend(v4, "score");
  v9 = v8;

  v10 = v7;
  v11 = v9;
  v12 = -1;
  if (v6 >= (double)*(unsigned __int128 *)&v10)
    v12 = 0;
  if (v6 <= (double)*(unsigned __int128 *)&v10)
    return v12;
  else
    return 1;
}

uint64_t __204__SSRankingManager_rankSectionsUsingBundleIDToSectionMapping_withRanker_preferredBundleIds_isScopedSearch_queryId_isCJK_isBullseyeNonCommittedSearch_isBullseyeCommittedSearch_isPeopleSearch_queryContext___block_invoke_5_436(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;

  v4 = a3;
  objc_msgSend(a2, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "L2FeatureVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalL2Score");
  v8 = v7;

  objc_msgSend(v4, "rankingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "L2FeatureVector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "originalL2Score");
  v12 = v11;

  if (v8 <= v12)
    return v12 > v8;
  else
    return -1;
}

+ (void)determineTopHitsForSafariSection:(id)a3 forQuery:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  __int16 *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v25[0] = 0;
  v25[1] = 0;
  v24[0] = 0;
  v24[1] = 0;
  v23 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v5, "resultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SSRankingManager_determineTopHitsForSafariSection_forQuery___block_invoke;
  v13[3] = &unk_1E6E435A0;
  v8 = v6;
  v14 = v8;
  v15 = &v19;
  v16 = v24;
  v17 = &v23;
  v18 = v25;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  if (v20[3])
  {
    v9 = 0;
    do
    {
      v10 = (id)v25[v9];
      objc_msgSend(v10, "setTopHit:", SSSetTopHitWithReasonString(1, v10, CFSTR("determineTopHitsForSafariSection"), 1));
      objc_msgSend(v10, "setForceNoTopHit:", 0);
      objc_msgSend(v10, "setIsSafariTopHit:", 1);
      objc_msgSend(v10, "rankingItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIsSafariTopHit:", 1);

      objc_msgSend(v10, "rankingItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTopHitReason:", 12);

      ++v9;
    }
    while (v9 < v20[3]);
  }

  _Block_object_dispose(&v19, 8);
}

void __62__SSRankingManager_determineTopHitsForSafariSection_forQuery___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  unint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "setTopHit:", 0);
  objc_msgSend(v26, "setForceNoTopHit:", 1);
  objc_msgSend(v26, "setIsSafariTopHit:", 0);
  objc_msgSend(v26, "rankingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsSafariTopHit:", 0);

  v4 = objc_msgSend(v26, "isSafariTopHitForQuery:", a1[4]);
  v5 = v26;
  if (v4)
  {
    objc_msgSend(v26, "rankingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v6, "attributes"), 9uLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v26, "contentURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      objc_msgSend(v26, "contentType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.safari.bookmark"));

      v12 = a1[5];
      if (*(_QWORD *)(*(_QWORD *)(v12 + 8) + 24))
      {
        v13 = 0;
        v14 = 0;
        v15 = v26;
        do
        {
          v16 = a1[6];
          v17 = a1[7];
          v18 = *(_QWORD *)(v16 + 8 * v13);
          v19 = *(_BYTE *)(v17 + v13) != 0;
          v20 = v9 >= v18 && *(_BYTE *)(v17 + v13) != 0;
          if (!v20 && (v11 & 1) != 0 || (v9 < v18 ? (v23 = *(_BYTE *)(v17 + v13) == 0) : (v23 = 0), v23))
          {
            *(_QWORD *)(v16 + 8 * v13) = v9;
            *(_BYTE *)(v17 + v13) = v11 & 1;
            v21 = a1[8];
            v22 = *(void **)(v21 + 8 * v13);
            *(_QWORD *)(v21 + 8 * v13) = v15;
            v12 = a1[5];
            v14 = 1;
            v15 = v22;
            v9 = v18;
            v11 = v19;
          }
          ++v13;
          v24 = *(_QWORD *)(*(_QWORD *)(v12 + 8) + 24);
        }
        while (v13 < v24);
        if ((v14 & 1) != 0)
          goto LABEL_21;
      }
      else
      {
        v24 = 0;
        v15 = v26;
      }
      if (v24 <= 1)
      {
        v25 = a1[7];
        *(_QWORD *)(a1[6] + 8 * v24) = v9;
        *(_BYTE *)(v25 + *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)) = v11 & 1;
        *(_QWORD *)(a1[8] + 8 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = v15;
      }
    }
LABEL_21:

    v5 = v26;
  }

}

- (void)refineSectionShowingVisibleResultsWithBetterTextMatches:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "resultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 3)
    v6 = 3;
  else
    v6 = v5;
  objc_msgSend(v3, "resultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_10;
  v9 = 0;
  v10 = 0;
  do
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rankingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10 + 1;
    if (!objc_msgSend(v12, "shouldHideUnderShowMore"))
      v9 = v10 + 1;

    ++v10;
  }
  while (v6 != v13);
  if (!v9)
  {
LABEL_10:
    objc_msgSend(v3, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      objc_msgSend(v3, "setIsInitiallyHidden:", 1);
      SSGeneralLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "results");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v17;
        v24 = 2048;
        v25 = objc_msgSend(v18, "count");
        _os_log_impl(&dword_1B86C5000, v16, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Marking section %@ (%lu result(s)) for isInitiallyHidden - all shouldHideUnderShowMore", (uint8_t *)&v22, 0x16u);

      }
      goto LABEL_20;
    }
    v9 = 0;
  }
  objc_msgSend(v3, "results");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    if (v9 <= 1)
      v21 = 1;
    else
      v21 = v9;
    objc_msgSend(v3, "setMaxInitiallyVisibleResults:", v21);
  }
LABEL_20:

}

- (id)applyTopSectionPolicy:(id)a3 withTopHitSection:(id)a4 isPeopleSearch:(BOOL)a5 queryKind:(unint64_t)a6 correction:(id)a7 queryLength:(unint64_t)a8 ranker:(id)a9
{
  id v12;
  id v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  char v48;
  char v49;
  BOOL v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  BOOL v70;
  void *v71;
  void *v72;
  void *v73;
  float v74;
  float v75;
  void *v76;
  float v77;
  float v78;
  char v79;
  id v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  void *v94;
  void *v95;
  int v96;
  id v97;
  void *v99;
  id v100;
  _BOOL4 v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  unsigned int v107;
  unint64_t v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  id obj;
  void (**v113)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  uint64_t *v136;
  _BOOL4 v137;
  char v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t (*v142)(uint64_t, uint64_t);
  void (*v143)(uint64_t);
  id v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v101 = a5;
  v150 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v100 = a7;
  v103 = a9;
  v108 = a6;
  v14 = (a6 == 4 || a6 == 1) && (unint64_t)objc_msgSend(v12, "count") > 1;
  v15 = v13;
  objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

  v107 = v18;
  if ((unint64_t)objc_msgSend(v12, "count") < 3)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v14 + v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.application"));

  }
  v139 = 0;
  v140 = &v139;
  v141 = 0x3032000000;
  v142 = __Block_byref_object_copy_;
  v143 = __Block_byref_object_dispose_;
  v144 = 0;
  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __115__SSRankingManager_applyTopSectionPolicy_withTopHitSection_isPeopleSearch_queryKind_correction_queryLength_ranker___block_invoke;
  v134[3] = &unk_1E6E435C8;
  v136 = &v139;
  v137 = v14;
  v138 = v21;
  v22 = v12;
  v135 = v22;
  v113 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1BCCB38DC](v134);
  +[SSRankingManager getLegacyTophitSection]();
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v102, "containsObject:", CFSTR("none"));
  v24 = v108 - 9;
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v15, "results");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v15, "results");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count") == 0;

      if (!v27)
      {
        objc_msgSend(v15, "results");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v99, "sectionBundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v22, "mutableCopy");
        v31 = (void *)v140[5];
        v140[5] = v30;

        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v32 = v22;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
        if (!v33)
          goto LABEL_49;
        v110 = *(_QWORD *)v131;
        v34 = v23 ^ 1;
        if (v24 < 0xFFFFFFFFFFFFFFFCLL)
          v34 = 1;
        v109 = v34;
        v104 = v32;
        v105 = v29;
        while (1)
        {
          v35 = 0;
          v111 = v33;
          do
          {
            if (*(_QWORD *)v131 != v110)
              objc_enumerationMutation(v32);
            v36 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v35);
            if (objc_msgSend(v36, "pinToTop") && objc_msgSend(v36, "resultsCount"))
            {
              ((void (**)(_QWORD, void *, _QWORD, _QWORD))v113)[2](v113, v36, v107, 0);
              goto LABEL_47;
            }
            objc_msgSend(v36, "bundleIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.application")) & v109) == 1)
            {
              v38 = objc_msgSend(v36, "resultsCount") == 0;

              if (v38)
                goto LABEL_27;
              objc_msgSend(v36, "results");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "rankingItem");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v37, "L2FeatureVector");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "scoreForFeature:", 1);
              v43 = v42;

              objc_msgSend(v37, "L2FeatureVector");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "scoreForFeature:", 41);
              v46 = v45;

              if (+[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen") < a8&& v43 == 1.0&& v46 == 0.0)
              {
                goto LABEL_45;
              }
            }

LABEL_27:
            objc_msgSend(v36, "bundleIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.application"));
            if (v108 == 4)
              v49 = 0;
            else
              v49 = v48;

            if ((v49 & 1) == 0)
            {
              objc_msgSend(v36, "bundleIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v37, "isEqualToString:", v29))
              {
                v50 = objc_msgSend(v36, "resultsCount") == 0;

                if (v50)
                  goto LABEL_47;
                objc_msgSend(v36, "results");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v37, "rankingItem");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "shouldHideUnderShowMore");

                if (v53)
                {
                  objc_msgSend(v15, "results");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = (void *)objc_msgSend(v54, "copy");

                  v128 = 0u;
                  v129 = 0u;
                  v126 = 0u;
                  v127 = 0u;
                  v56 = v55;
                  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
                  if (v57)
                  {
                    v58 = 0;
                    v59 = *(_QWORD *)v127;
                    do
                    {
                      v60 = 0;
                      v61 = v58;
                      do
                      {
                        if (*(_QWORD *)v127 != v59)
                          objc_enumerationMutation(v56);
                        v62 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * v60);
                        objc_msgSend(v36, "addResults:atIndex:", v62, v61 + v60);
                        objc_msgSend(v15, "removeResults:", v62);
                        ++v60;
                      }
                      while (v57 != v60);
                      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
                      v58 = v61 + v60;
                    }
                    while (v57);
                  }

                  v32 = v104;
                  v29 = v105;
                  if (v107)
                    objc_msgSend((id)v140[5], "removeObject:", v15);
                  ((void (**)(_QWORD, void *, _QWORD, uint64_t))v113)[2](v113, v36, 0, 1);

                }
                else if (!SSEnableSpotlightFullPageRanking())
                {
LABEL_45:
                  ((void (**)(_QWORD, void *, _QWORD, _QWORD))v113)[2](v113, v36, v107, 0);
                }
              }

            }
LABEL_47:
            ++v35;
          }
          while (v35 != v111);
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
          if (!v33)
          {
LABEL_49:

            v22 = (id)v140[5];
            goto LABEL_82;
          }
        }
      }
    }
  }
  if (objc_msgSend(v22, "count"))
  {
    v63 = objc_msgSend(v22, "mutableCopy");
    v64 = (void *)v140[5];
    v140[5] = v63;

    if (!((v24 < 0xFFFFFFFFFFFFFFFCLL) | (v23 ^ 1) & 1))
    {
      v80 = (id)v140[5];

      v22 = v80;
LABEL_70:
      v81 = objc_msgSend(v22, "mutableCopy");
      v82 = (void *)v140[5];
      v140[5] = v81;

      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v83 = v22;
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v118, v146, 16);
      if (v84)
      {
        v85 = *(_QWORD *)v119;
        while (2)
        {
          for (i = 0; i != v84; ++i)
          {
            if (*(_QWORD *)v119 != v85)
              objc_enumerationMutation(v83);
            v87 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
            if (objc_msgSend(v87, "pinToTop") && objc_msgSend(v87, "resultsCount"))
            {
              ((void (**)(_QWORD, void *, _QWORD, _QWORD))v113)[2](v113, v87, 0, 0);
              goto LABEL_81;
            }
          }
          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v118, v146, 16);
          if (v84)
            continue;
          break;
        }
      }
LABEL_81:
      v99 = v83;

      v22 = (id)v140[5];
LABEL_82:

      goto LABEL_83;
    }
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    obj = v22;
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v147, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v123;
LABEL_54:
      v67 = 0;
      while (1)
      {
        if (*(_QWORD *)v123 != v66)
          objc_enumerationMutation(obj);
        v68 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v67);
        objc_msgSend(v68, "bundleIdentifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v69, "isEqualToString:", CFSTR("com.apple.application")))
          goto LABEL_63;
        v70 = objc_msgSend(v68, "resultsCount") == 0;

        if (!v70)
          break;
LABEL_64:
        if (v65 == ++v67)
        {
          v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v147, 16);
          if (v65)
            goto LABEL_54;
          goto LABEL_66;
        }
      }
      objc_msgSend(v68, "results");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "rankingItem");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v69, "L2FeatureVector");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "scoreForFeature:", 1);
      v75 = v74;

      objc_msgSend(v69, "L2FeatureVector");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "scoreForFeature:", 41);
      v78 = v77;

      if (+[PRSRankingItemRanker spellCorrectedAppMinQueryLen](PRSRankingItemRanker, "spellCorrectedAppMinQueryLen") < a8&& v75 == 1.0&& v78 == 0.0&& (objc_msgSend(v103, "isSpellCorrectPrefixMatchOnlyTopHitExcludedQuery") & 1) == 0)
      {
        ((void (**)(_QWORD, void *, _QWORD, _QWORD))v113)[2](v113, v68, v107, 0);

        v79 = 1;
        goto LABEL_69;
      }
LABEL_63:

      goto LABEL_64;
    }
LABEL_66:
    v79 = 0;
LABEL_69:

    v22 = (id)v140[5];
    if ((v79 & 1) == 0)
      goto LABEL_70;
  }
LABEL_83:
  if (v101)
  {
    v88 = objc_msgSend(v22, "mutableCopy");
    v89 = (void *)v140[5];
    v140[5] = v88;

    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v90 = v22;
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v114, v145, 16);
    if (v91)
    {
      v92 = *(_QWORD *)v115;
      do
      {
        for (j = 0; j != v91; ++j)
        {
          if (*(_QWORD *)v115 != v92)
            objc_enumerationMutation(v90);
          v94 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
          objc_msgSend(v94, "bundleIdentifier");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v95, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));

          if (v96)
            ((void (**)(_QWORD, void *, _QWORD, _QWORD))v113)[2](v113, v94, 0, 0);
        }
        v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v114, v145, 16);
      }
      while (v91);
    }

    v22 = (id)v140[5];
  }
  v97 = v22;

  _Block_object_dispose(&v139, 8);
  return v97;
}

void __115__SSRankingManager_applyTopSectionPolicy_withTopHitSection_isPeopleSearch_queryKind_correction_queryLength_ranker___block_invoke(uint64_t a1, void *a2, int a3, char a4)
{
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:");
  v7 = *(_DWORD *)(a1 + 48) + a3;
  if ((a4 & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 52))
    {
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 4)
      {
        objc_msgSend(v14, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.application"));

        if ((v9 & 1) == 0)
          v7 = *(_DWORD *)(a1 + 48) + 2;
      }
    }
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));

    v13 = v7 + v12;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "insertObject:atIndex:", v14, v13);

}

- (void)updateServerScoresUsingBlockOrder:(id)a3 bundleFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  uint64_t v29;
  float v30;
  uint64_t k;
  void *v32;
  float v33;
  id v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  float v38;
  uint64_t v39;
  uint64_t m;
  id v41;
  id v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
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
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_isCancelled)
  {
    v8 = (void *)objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v42 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v57 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v14, "sectionBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v16, "blockIdValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v16, "blockIdValue");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
                v19 = (void *)objc_opt_new();
              objc_msgSend(v19, "addObject:", v14);
              objc_msgSend(v16, "blockIdValue");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKey:", v19, v20);

            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      v41 = v7;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v8, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v53 != v23)
              objc_enumerationMutation(obj);
            objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
            if (v26)
            {
              v27 = v26;
              v28 = 0;
              v29 = *(_QWORD *)v49;
              v30 = 0.0;
              do
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v49 != v29)
                    objc_enumerationMutation(v25);
                  v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
                  objc_msgSend(v32, "l2score");
                  objc_msgSend(v32, "l2score");
                  v30 = v30 + v33;
                  ++v28;
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
              }
              while (v27);
            }
            else
            {
              v28 = 0;
              v30 = 0.0;
            }
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v34 = v25;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
            if (v35)
            {
              v37 = v35;
              v38 = v30 / (float)v28;
              v39 = *(_QWORD *)v45;
              do
              {
                for (m = 0; m != v37; ++m)
                {
                  if (*(_QWORD *)v45 != v39)
                    objc_enumerationMutation(v34);
                  *(float *)&v36 = v38;
                  objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "setL2score:", v36);
                }
                v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
              }
              while (v37);
            }

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        }
        while (v22);
      }

      v7 = v41;
    }

    v6 = v42;
  }

}

+ (void)extractThresholdABValues:(id)a3 forLanguage:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  _BYTE v49[22];
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v9 = (void *)sLastLanguage;
  if (!v7)
  {
    sLastLanguage = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    goto LABEL_5;
  }
  if (!objc_msgSend((id)sLastLanguage, "isEqualToString:", v7))
  {
    objc_storeStrong((id *)&sLastLanguage, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    objc_msgSend(v8, "localeIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v8, "localeIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v4) & 1) != 0)
      {

        goto LABEL_37;
      }
    }
    objc_msgSend(v8, "languageCode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v8, "languageCode");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v7, "isEqualToString:", v32);

      if (v24)
      {

      }
      if ((v33 & 1) != 0)
      {
LABEL_37:
        v38 = objc_msgSend(v7, "length");
        if (v38 >= 2)
          v39 = 2;
        else
          v39 = v38;
        objc_msgSend(v7, "substringToIndex:", v39);
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKey:", v40);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (id)v40;
        if (v20)
          goto LABEL_46;
LABEL_5:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "localeIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "languageCode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "scriptCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "countryCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v49 = 138413314;
          *(_QWORD *)&v49[4] = v10;
          *(_WORD *)&v49[12] = 2112;
          *(_QWORD *)&v49[14] = v11;
          v50 = 2112;
          v51 = v12;
          v52 = 2112;
          v53 = v13;
          v54 = 2112;
          v55 = v14;
          _os_log_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Looking for thresholds for %@/%@/%@/%@/%@", v49, 0x34u);

        }
        if (!v7)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
          objc_msgSend(v8, "languageCode");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)sLastLanguage;
          sLastLanguage = v15;

          os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
        }
        objc_msgSend(v8, "localeIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17
          && (v18 = (void *)v17,
              objc_msgSend(v8, "localeIdentifier"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v6, "objectForKey:", v19),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v19,
              v18,
              v20))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "localeIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v49 = 138412290;
            *(_QWORD *)&v49[4] = v21;
            v22 = MEMORY[0x1E0C81028];
            v23 = "Using thresholds for identifier %@";
LABEL_45:
            _os_log_impl(&dword_1B86C5000, v22, OS_LOG_TYPE_DEFAULT, v23, v49, 0xCu);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25
            && (v26 = (void *)v25,
                objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v6, "objectForKey:", v27),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v27,
                v26,
                v20))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v49 = 138412290;
              *(_QWORD *)&v49[4] = v21;
              v22 = MEMORY[0x1E0C81028];
              v23 = "Using thresholds for system locale %@";
              goto LABEL_45;
            }
          }
          else
          {
            objc_msgSend(v8, "languageCode");
            v28 = objc_claimAutoreleasedReturnValue();
            if (v28
              && (v29 = (void *)v28,
                  objc_msgSend(v8, "languageCode"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v6, "objectForKey:", v30),
                  v20 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30,
                  v29,
                  v20))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "languageCode");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v49 = 138412290;
                *(_QWORD *)&v49[4] = v21;
                v22 = MEMORY[0x1E0C81028];
                v23 = "Using thresholds for language %@";
                goto LABEL_45;
              }
            }
            else
            {
              objc_msgSend(v8, "scriptCode");
              v34 = objc_claimAutoreleasedReturnValue();
              if (v34
                && (v35 = (void *)v34,
                    objc_msgSend(v8, "scriptCode"),
                    v36 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v6, "objectForKey:", v36),
                    v20 = (void *)objc_claimAutoreleasedReturnValue(),
                    v36,
                    v35,
                    v20))
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v8, "scriptCode");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v49 = 138412290;
                  *(_QWORD *)&v49[4] = v21;
                  v22 = MEMORY[0x1E0C81028];
                  v23 = "Using thresholds for script %@";
                  goto LABEL_45;
                }
              }
              else
              {
                objc_msgSend(v8, "countryCode");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "objectForKey:", v41);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
                if (!v20)
                {
                  if (!v42)
                    goto LABEL_48;
                  objc_msgSend(v8, "localeIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "languageCode");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "scriptCode");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "countryCode");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v49 = 138413314;
                  *(_QWORD *)&v49[4] = v20;
                  *(_WORD *)&v49[12] = 2112;
                  *(_QWORD *)&v49[14] = v45;
                  v50 = 2112;
                  v51 = v46;
                  v52 = 2112;
                  v53 = v47;
                  v54 = 2112;
                  v55 = v48;
                  _os_log_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no locale specific thresholds for %@/%@/%@/%@/%@", v49, 0x34u);

                  goto LABEL_47;
                }
                if (v42)
                {
                  objc_msgSend(v8, "countryCode");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v49 = 138412290;
                  *(_QWORD *)&v49[4] = v21;
                  v22 = MEMORY[0x1E0C81028];
                  v23 = "Using thresholds for country %@";
                  goto LABEL_45;
                }
              }
            }
          }
        }
LABEL_46:
        +[SSCompactValueArray decodeFromDictionary:nesting:](SSCompactValueArray, "decodeFromDictionary:nesting:", v20, 1, *(_OWORD *)v49);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
        v44 = (void *)sTopHitsThreshold;
        sTopHitsThreshold = (uint64_t)v43;
        v45 = v43;

        os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {

      if (v24)
      {

      }
    }
    objc_msgSend(v6, "objectForKey:", v7);
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v20 = (void *)v37;
      goto LABEL_46;
    }
    goto LABEL_37;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
LABEL_48:

}

+ (void)prepareTopHitsParametersForLanguage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v5 = (id)objc_msgSend((id)sAllTopHitThresholds, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  objc_msgSend(a1, "extractThresholdABValues:forLanguage:", v5, v4);

}

+ (void)reloadTopHitsParametersFromTrial
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  SSDefaultsGetResources();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePathForKey:", CFSTR("TopHitsThreshold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SSDefaultsGetResources();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filePathForKey:", CFSTR("TopHitsContinuationThresholds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SSDefaultsGetResources();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filePathForKey:", CFSTR("TopHitsFilterSectionsBundleIds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SSValuesFromPlistWithPath(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SSValuesFromPlistWithPath(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("thresholds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v8;
  SSValuesFromPlistWithPath(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("forbiddenSecondSections"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("poorSecondSections"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v41 = v10;
    v43 = v6;
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_msgSend(v9, "objectForKey:", CFSTR("iOS"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)sAllTopHitThresholds;
    sAllTopHitThresholds = v15;

    v17 = (void *)objc_msgSend((id)sAllTopHitThresholds, "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    objc_msgSend(a1, "extractThresholdABValues:forLanguage:", v17, 0);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("default"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    v42 = v9;
    if (v19)
    {
      if (v20)
      {
        objc_msgSend(v18, "localeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
        v37 = v11;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "languageCode");
        v36 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scriptCode");
        v39 = v4;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "countryCode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v46 = v21;
        v47 = 2112;
        v48 = v22;
        v49 = 2112;
        v50 = v23;
        v51 = 2112;
        v52 = v24;
        v53 = 2112;
        v54 = (uint64_t)v25;
        _os_log_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Getting fallback thresholds for %@/%@/%@/%@/%@", buf, 0x34u);

        v4 = v39;
        v13 = v36;

        v11 = v37;
      }
    }
    else
    {
      if (v20)
      {
        objc_msgSend(v18, "localeIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "languageCode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scriptCode");
        v40 = v4;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "countryCode");
        *(_DWORD *)buf = 138413314;
        v46 = v26;
        v47 = 2112;
        v48 = v38;
        v49 = 2112;
        v50 = v27;
        v51 = 2112;
        v52 = v28;
        v53 = 2112;
        v54 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v54;
        _os_log_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error found no fallback thresholds for %@/%@/%@/%@/%@", buf, 0x34u);

        v4 = v40;
      }
      v19 = &unk_1E6E9B808;
    }
    +[SSCompactValueArray decodeFromDictionary:nesting:](SSCompactValueArray, "decodeFromDictionary:nesting:", v19, 1);
    v30 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    v31 = (void *)sFallbackTopHitsThreshold;
    sFallbackTopHitsThreshold = v30;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
    v9 = v42;
    v6 = v43;
    v10 = v41;
  }
  if (objc_msgSend(v11, "count"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_storeStrong((id *)&sTopHitsContinuationThreshold, v11);
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
  if (objc_msgSend(v13, "count"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)sForbiddenSecondSections;
    sForbiddenSecondSections = v32;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
  if (objc_msgSend(v14, "count"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)sPoorSecondSections;
    sPoorSecondSections = v34;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }

}

+ (void)reloadCommittedSearchParametersFromTrial
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id obj;

  SSDefaultsGetResources();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePathForKey:", CFSTR("CommittedSearchDemotions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  SSValuesFromPlistWithPath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("demoteNonExactMatchBundle"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("legacyTophitSection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "count"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_storeStrong((id *)&sDemoteNonExactMatchBundle, obj);
    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }
  if (objc_msgSend(v5, "count"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)sLegacyTophitSection;
    sLegacyTophitSection = v6;

    os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  }

}

+ (id)getForbiddenSecondSections
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v0 = (id)sForbiddenSecondSections;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (id)getPoorSecondSections
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v0 = (id)sPoorSecondSections;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (id)getDemoteNonExactMatchBundle
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v0 = (id)sDemoteNonExactMatchBundle;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (const)defaultKey
{
  objc_opt_self();
  return CFSTR("default");
}

+ (id)getTopHitsThresholdsForBundleId:(unint64_t)a3 queryLength:(unint64_t)a4 queryTermCount:(char)a5 getFallback:
{
  id v8;
  id *v9;
  void *v10;
  void *v11;

  v8 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  if ((a5 & 1) != 0)
  {
    v9 = (id *)sFallbackTopHitsThreshold;
  }
  else
  {
    v9 = (id *)sTopHitsThreshold;
    if (!sTopHitsThreshold)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
      v10 = 0;
      goto LABEL_7;
    }
  }
  getTrialDictionaryForLengthAndTermCount(v9, a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  if (!v10)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v11;
}

+ (id)getTopHitsThresholdsForBundleId:(uint64_t)a1
{
  id v2;
  id *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  -[SSCompactValueArray defaultValue]((id *)sTopHitsThreshold);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[SSCompactValueArray defaultValue](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("default"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);

  return v5;
}

+ (id)getTopHitsContinuationThresholds
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v0 = (id)sTopHitsContinuationThreshold;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v0;
}

+ (void)reloadSuggestionsRankingThresholds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  SSDefaultsGetResources();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePathForKey:", CFSTR("SuggestionsRankingThresholds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    SSValuesFromPlistWithPath(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("rankingparameters"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "doubleValue", (_QWORD)v16);
          objc_msgSend(v12, "numberWithDouble:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
      v14 = v6;
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v15 = (void *)sSuggestionsRankingThresholds;
  sSuggestionsRankingThresholds = (uint64_t)v14;

  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
}

+ (id)keyForIntervalType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1E6E43630[a3];
}

+ (uint64_t)getRecencyIntervalForBundleId:(uint64_t)a3 intervalType:(unint64_t)a4 indexRequired:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  id v11;
  uint64_t v12;
  void *v13;

  v6 = a2;
  objc_opt_self();
  objc_msgSend((id)objc_opt_class(), "keyForIntervalType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    pthread_rwlock_rdlock(&sIntervalsLock);
    objc_msgSend((id)sRecencyThresholds, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_rwlock_unlock(&sIntervalsLock);
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (a4 == -1 || (isKindOfClass & 1) == 0 || objc_msgSend(v9, "count") <= a4)
        {
          v11 = v9;
        }
        else
        {
          objc_msgSend(v9, "objectAtIndex:", a4);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("default"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v11;
      v12 = objc_msgSend(v11, "integerValue");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (uint64_t)getRecencyIntervalForBundleType:(uint64_t)a3 intervalType:(unint64_t)a4 indexRequired:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  uint64_t v13;
  void *v14;

  v6 = a2;
  objc_opt_self();
  objc_msgSend((id)objc_opt_class(), "keyForIntervalType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    pthread_rwlock_rdlock(&sIntervalsLock);
    objc_msgSend((id)sRecencyThresholds, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_rwlock_unlock(&sIntervalsLock);
    if (v8)
    {
      objc_msgSend(v6, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (a4 == -1 || (isKindOfClass & 1) == 0 || objc_msgSend(v10, "count") <= a4)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(v10, "objectAtIndex:", a4);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("default"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v12;
      v13 = objc_msgSend(v12, "integerValue");

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)reloadRecencyThresholds
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  SSDefaultsGetResources();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePathForKey:", CFSTR("RecencyIntervals"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v8, "length");
  v4 = v8;
  if (v3)
  {
    SSValuesFromPlistWithPath(v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_rwlock_wrlock(&sIntervalsLock);
    objc_msgSend(v5, "objectForKey:", CFSTR("iOS"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)sRecencyThresholds;
    sRecencyThresholds = v6;

    if (!sRecencyThresholds)
      objc_storeStrong((id *)&sRecencyThresholds, v5);
    pthread_rwlock_unlock(&sIntervalsLock);

    v4 = v8;
  }

}

+ (uint64_t)isKeywordsHidingEnabledForLanguage:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_self();
  pthread_rwlock_rdlock(&sLocaleSpecificMatchingLock);
  objc_msgSend((id)sLocaleSpecificMatchingKeywordsHiding, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
LABEL_4:
    v4 = v3;
    v5 = objc_msgSend(v4, "BOOLValue");

    return v5;
  }
  objc_msgSend((id)sLocaleSpecificMatchingKeywordsHiding, "objectForKey:", CFSTR("default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
  if (v3)
    goto LABEL_4;
  return 1;
}

+ (uint64_t)getMinMisspellingLengthForLanguage:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_self();
  pthread_rwlock_rdlock(&sLocaleSpecificMatchingLock);
  objc_msgSend((id)sLocaleSpecificMatchingMinMisspellingLength, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
LABEL_4:
    v4 = v3;
    v5 = objc_msgSend(v4, "integerValue");

    return v5;
  }
  objc_msgSend((id)sLocaleSpecificMatchingMinMisspellingLength, "objectForKey:", CFSTR("default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);
  if (v3)
    goto LABEL_4;
  return 4;
}

+ (void)reloadLocaleSpecificMatchingParameters
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  SSDefaultsGetResources();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePathForKey:", CFSTR("LocaleSpecificMatching"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v12, "length");
  v4 = v12;
  if (v3)
  {
    SSValuesFromPlistWithPath(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_rwlock_wrlock(&sLocaleSpecificMatchingLock);
    objc_msgSend(v5, "objectForKey:", CFSTR("keywords_hiding"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("iOS"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)sLocaleSpecificMatchingKeywordsHiding;
    sLocaleSpecificMatchingKeywordsHiding = v7;

    if (!sLocaleSpecificMatchingKeywordsHiding)
      objc_storeStrong((id *)&sLocaleSpecificMatchingKeywordsHiding, v6);
    objc_msgSend(v5, "objectForKey:", CFSTR("min_misspelling_length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("iOS"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)sLocaleSpecificMatchingMinMisspellingLength;
    sLocaleSpecificMatchingMinMisspellingLength = v10;

    if (!sLocaleSpecificMatchingMinMisspellingLength)
      objc_storeStrong((id *)&sLocaleSpecificMatchingMinMisspellingLength, v9);
    pthread_rwlock_unlock(&sLocaleSpecificMatchingLock);

    v4 = v12;
  }

}

+ (id)getSuggestionsRankingThresholds
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&sABValuesLock);
  v2 = (id)sSuggestionsRankingThresholds;
  os_unfair_lock_unlock((os_unfair_lock_t)&sABValuesLock);
  return v2;
}

+ (void)reloadRankingParametersFromTrial
{
  objc_msgSend((id)objc_opt_class(), "reloadTopHitsParametersFromTrial");
  objc_msgSend((id)objc_opt_class(), "reloadCommittedSearchParametersFromTrial");
  objc_msgSend((id)objc_opt_class(), "reloadSuggestionsRankingThresholds");
  objc_msgSend((id)objc_opt_class(), "reloadRecencyThresholds");
  objc_msgSend((id)objc_opt_class(), "reloadLocaleSpecificMatchingParameters");
}

- (id)CEPValuesForTTR
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  SSRankingManager *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)objc_opt_new();
  -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryDependentCategoryProbabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v19 = self;
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("Got %lu CEP values from response: \n"), objc_msgSend(v6, "count"));
    objc_msgSend(v6, "keysSortedByValueUsingSelector:", sel_compare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@\t:%@\n"), v12, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("\n"));

    self = v19;
  }
  -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

  if (-[__CFString length](v3, "length"))
    v16 = v3;
  else
    v16 = &stru_1E6E549F0;
  v17 = v16;

  return v17;
}

- (void)addCEPValuesForTTR
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableString *logValues;
  id v7;

  if (self->_logValues)
  {
    -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queryDependentCategoryProbabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      logValues = self->_logValues;
      -[SSRankingManager CEPValuesForTTR](self, "CEPValuesForTTR");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](logValues, "appendString:", v7);

    }
  }
}

- (void)finalizeLog
{
  void *v3;
  void *v4;
  id v5;

  if (isInternalDevice)
  {
    -[SSRankingManager addCEPValuesForTTR](self, "addCEPValuesForTTR");
    SSDefaultsGetResources();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getTTRLogs");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    if (v5)
    {
      -[NSMutableString appendString:](self->_logValues, "appendString:", v5);
      v4 = v5;
    }

  }
}

- (void)sendTTRLogsWithSections:(id)a3 searchString:(id)a4 queryKind:(unint64_t)a5 isCommittedSearch:(BOOL)a6 parsecCameLaterThanSRT:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  NSMutableString *logValues;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  float v48;
  void *v49;
  void *v50;
  float v51;
  void *v52;
  void *v53;
  float v54;
  void *v55;
  void *v56;
  float v57;
  void *v58;
  void *v59;
  float v60;
  void *v61;
  void *v62;
  float v63;
  void *v64;
  void *v65;
  float v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  float v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  float v90;
  void *v91;
  void *v92;
  float v93;
  void *v94;
  void *v95;
  float v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  char v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  id obj;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  _BOOL8 v128;
  _BOOL8 v129;
  void *v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  SSRankingManager *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint8_t buf[4];
  void *v149;
  __int16 v150;
  void *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v7 = a7;
  v8 = a6;
  v154 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v116 = a4;
  v117 = a4;
  logValues = self->_logValues;
  -[SSRankingManager query](self, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendFormat:](logValues, "appendFormat:", CFSTR("Query: %@\n"), v14);

  v128 = v8;
  -[NSMutableString appendFormat:](self->_logValues, "appendFormat:", CFSTR("Committed search: %d\n"), v8);
  v131 = a5;
  -[NSMutableString appendFormat:](self->_logValues, "appendFormat:", CFSTR("Query kind: %lu\n"), a5);
  v129 = v7;
  if (v7)
    -[NSMutableString appendString:](self->_logValues, "appendString:", CFSTR("\nParsec came later than timeout\n"));
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  obj = v12;
  v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v153, 16);
  if (v120)
  {
    LODWORD(v133) = 0;
    v139 = 1;
    v119 = *(_QWORD *)v145;
    v136 = self;
    v127 = v15;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v145 != v119)
          objc_enumerationMutation(obj);
        v121 = v16;
        v17 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v16);
        v18 = self->_logValues;
        objc_msgSend(v17, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = (v133 + 1);
        -[NSMutableString appendFormat:](v18, "appendFormat:", CFSTR("Section %d bundleID:%@\n"), v133, v19, v116);

        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        objc_msgSend(v17, "resultSet");
        v135 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v140, v152, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v141;
          v124 = v17;
          v132 = *(_QWORD *)v141;
          do
          {
            v23 = 0;
            v134 = v21;
            do
            {
              if (*(_QWORD *)v141 != v22)
                objc_enumerationMutation(v135);
              v24 = *(id *)(*((_QWORD *)&v140 + 1) + 8 * v23);
              if ((objc_msgSend(v15, "containsObject:", v24) & 1) == 0)
              {
                objc_msgSend(v15, "addObject:", v24);
                objc_msgSend(v24, "rankingItem");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "hasShortCut");
                objc_msgSend(v25, "L2FeatureVector");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (void *)objc_opt_new();
                objc_msgSend(v24, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "bundleIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                SSRedactSuggestionIdentifier(v28, v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("identifier"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v139);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("ResultPosition"));

                objc_msgSend(v24, "title");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "text");
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v34 = (void *)MEMORY[0x1E0CB3940];
                v137 = v33;
                SSRedactString(v33, 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "stringWithFormat:", CFSTR("%@"), v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, CFSTR("ResultTitle"));

                v37 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v24, "applicationBundleIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v38;
                if (!v38)
                {
                  objc_msgSend(v24, "resultBundleId");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = v125;
                }
                objc_msgSend(v37, "stringWithFormat:", CFSTR("%@"), v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v40, CFSTR("ResultBundle"));

                if (!v38)
                v41 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v138, "originalL2Score");
                objc_msgSend(v41, "stringWithFormat:", CFSTR("%.3f"), v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v43, CFSTR("originalL2"));

                v44 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v138, "experimentalScore");
                objc_msgSend(v44, "stringWithFormat:", CFSTR("%.3f"), v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v46, CFSTR("experimentalScore"));

                v47 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "rawScore");
                objc_msgSend(v47, "stringWithFormat:", CFSTR("%.3f"), v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v49, CFSTR("rawScore"));

                v50 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "score");
                objc_msgSend(v50, "stringWithFormat:", CFSTR("%.3f"), v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v52, CFSTR("score"));

                v53 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v24, "l2score");
                objc_msgSend(v53, "stringWithFormat:", CFSTR("%.3f"), v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v55, CFSTR("L2score"));

                v56 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v138, "scoreForFeature:", 386);
                objc_msgSend(v56, "stringWithFormat:", CFSTR("%.3f"), v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v58, CFSTR("parsecEnumScore"));

                v59 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v138, "withinBundleScore");
                objc_msgSend(v59, "stringWithFormat:", CFSTR("%.3f"), v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v61, CFSTR("L2VectorWithinBundleScore"));

                v62 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "withinBundleScore");
                objc_msgSend(v62, "stringWithFormat:", CFSTR("%.3f"), v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v64, CFSTR("withinBundleScore"));

                v65 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v138, "scoreForFeature:", 366);
                objc_msgSend(v65, "stringWithFormat:", CFSTR("%.6f"), v66);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v67, CFSTR("cep"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v24, "topHit"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v68, CFSTR("topHit"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v24, "blockId"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v69, CFSTR("blockId"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v24, "isSafariTopHit"));
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v70, CFSTR("safariTophit"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v26);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v71, CFSTR("hasShortcut"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v24, "isFuzzyMatch"));
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v72, CFSTR("isFuzzyMatch"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v24, "shouldUseCompactDisplay"));
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v73, CFSTR("shouldUseCompactDisplay"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v24, "usesCompactDisplay"));
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v74, CFSTR("usesCompactDisplay"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v25, "shouldHideUnderShowMore"));
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v75, CFSTR("shouldHideUnderShowMore"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v25, "photosMatch"));
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v76, CFSTR("photosMatch"));

                v77 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "keywordMatchScore");
                objc_msgSend(v77, "stringWithFormat:", CFSTR("%.3f"), v78);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v79, CFSTR("topicality"));

                v80 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "engagementScore");
                objc_msgSend(v80, "stringWithFormat:", CFSTR("%.3f"), v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v82, CFSTR("engagement"));

                v83 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "freshnessScore");
                objc_msgSend(v83, "stringWithFormat:", CFSTR("%.3f"), v84);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v85, CFSTR("freshness"));

                v86 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "likelihood");
                objc_msgSend(v86, "stringWithFormat:", CFSTR("%.3f"), v87);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v88, CFSTR("likelihood"));

                v89 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "l2Score");
                objc_msgSend(v89, "stringWithFormat:", CFSTR("%.3f"), v90);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v91, CFSTR("PommesL2score"));

                v92 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "pommesL1Score");
                objc_msgSend(v92, "stringWithFormat:", CFSTR("%.3f"), v93);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v94, CFSTR("PommesL1score"));

                v95 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v25, "embeddingSimilarity");
                objc_msgSend(v95, "stringWithFormat:", CFSTR("%.3f"), v96);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v97, CFSTR("embeddingSimilarity"));

                if (SSResultTypeIsLocalSuggestion(objc_msgSend(v24, "type")))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v24, "type"));
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v98, CFSTR("type"));

                  v99 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v24, "rankingScore");
                  objc_msgSend(v99, "stringWithFormat:", CFSTR("%f"), v100);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v101, CFSTR("compositeScore"));

                }
                +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v27);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v130, "appendString:", v102);

                objc_msgSend(v130, "appendString:", CFSTR("\n\n"));
                self = v136;
                -[NSMutableString appendString:](v136->_logValues, "appendString:", v130);
                objc_msgSend(v130, "setString:", &stru_1E6E549F0);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v129);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v103, CFSTR("parsecCameLaterThanSRT"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v128);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v104, CFSTR("isCommittedSearch"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v131);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v105, CFSTR("queryKind"));

                v106 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v17, "bundleIdentifier");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "stringWithFormat:", CFSTR("%d %@"), v133, v107);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v108, CFSTR("Section"));

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v24, "coreSpotlightIndexUsed"));
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v109, CFSTR("coreSpotlightIndexUsed"));

                SSGeneralLog();
                v110 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                {
                  v111 = _os_feature_enabled_impl();
                  -[SSRankingManager query](v136, "query");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  v113 = v112;
                  if ((v111 & 1) != 0)
                  {
                    v114 = v112;
                  }
                  else
                  {
                    SSRedactString(v112, 0);
                    v122 = v113;
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    v113 = v123;
                    v114 = v126;
                  }
                  +[SSRankingManager jsonStringFromDictionary:](SSRankingManager, "jsonStringFromDictionary:", v27);
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v149 = v113;
                  v150 = 2112;
                  v151 = v115;
                  _os_log_impl(&dword_1B86C5000, v110, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] FinalResults: query=%@ %@", buf, 0x16u);
                  v126 = v114;
                  if ((v111 & 1) == 0)
                  {

                    v114 = v122;
                  }

                  self = v136;
                  v15 = v127;
                  v17 = v124;
                }
                else
                {
                  v15 = v127;
                }
                v22 = v132;

                v139 = (v139 + 1);
                v21 = v134;
              }

              ++v23;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v140, v152, 16);
          }
          while (v21);
        }

        v16 = v121 + 1;
      }
      while (v121 + 1 != v120);
      v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v153, 16);
    }
    while (v120);
  }

  if (self->_logValues
    && objc_msgSend(obj, "count")
    && (!sLastQueryString || (objc_msgSend((id)sLastQueryString, "isEqualToString:", v117) & 1) == 0))
  {
    objc_storeStrong((id *)&sLastQueryString, v116);
  }
  if (v131 && objc_msgSend(obj, "count"))
    -[SSRankingManager finalizeLog](self, "finalizeLog");

}

+ (void)fillRankingPosition:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  id v18;

  v18 = a3;
  if (objc_msgSend(v18, "count"))
  {
    v3 = 0;
    LODWORD(v4) = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resultSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      v4 = (v4 + 1);
      if (v7)
      {
        v8 = 0;
        v9 = 1;
        do
        {
          objc_msgSend(v5, "resultSet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIndexOfSectionWhenRanked:", v12);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIndexOfResultInSectionWhenRanked:", v13);

          v8 = v9;
          objc_msgSend(v5, "resultSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          v16 = v15 > v9;
          v9 = (v9 + 1);
        }
        while (v16);
      }

      v17 = objc_msgSend(v18, "count");
      v3 = v4;
    }
    while (v17 > v4);
  }

}

+ (id)processSearchToolFinalResults:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
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
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (processSearchToolFinalResults_queryContext__onceToken != -1)
    dispatch_once(&processSearchToolFinalResults_queryContext__onceToken, &__block_literal_global_687);
  SSGeneralLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v97) = objc_msgSend(v6, "isAppEntitySearch");
    _os_log_impl(&dword_1B86C5000, v7, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] isAppEntitySearch=%d", buf, 8u);
  }
  v71 = v6;

  v70 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v8 = v5;
  v75 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
  if (!v75)
  {

    goto LABEL_70;
  }
  v9 = 0;
  v10 = *(_QWORD *)v93;
  v11 = &_SpotlightDefineRankingTypes_[268];
  v74 = *(_QWORD *)v93;
  v72 = v8;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v93 != v10)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v12);
      v14 = (void *)*((_QWORD *)v11 + 273);
      objc_msgSend(v13, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v14, "containsObject:", v15);

      if ((_DWORD)v14)
      {
        v16 = v11;
        v17 = v8;
        objc_msgSend(v13, "setIsInitiallyHidden:", 0);
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        objc_msgSend(v13, "resultSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v89;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v89 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "rankingItem");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setShouldHideUnderShowMore:", 0);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
          }
          while (v20);
        }

        objc_msgSend(v13, "resultSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setMaxInitiallyVisibleResults:", objc_msgSend(v24, "count"));

        if (v9)
        {
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v13, "resultSet");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v85;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v85 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
                objc_msgSend(v9, "resultSet");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v30);

                objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v9, "maxInitiallyVisibleResults") + 1);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
            }
            while (v27);
          }

        }
        else
        {
          v9 = v13;
        }
        v8 = v17;
        v11 = v16;
LABEL_61:
        v10 = v74;
        goto LABEL_62;
      }
      objc_msgSend(v13, "bundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

      if (!v33)
      {
        v73 = v12;
        v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(v13, "resultSet");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v51; ++k)
            {
              if (*(_QWORD *)v77 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
              objc_msgSend(v54, "rankingItem");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v55, "isAppEntity");

              if (v56)
                objc_msgSend(v48, "addObject:", v54);
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
          }
          while (v51);
        }

        if (objc_msgSend(v48, "count"))
        {
          v8 = v72;
          v12 = v73;
          if (v9)
          {
            objc_msgSend(v9, "resultSet");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "addObjectsFromArray:", v48);

            objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v9, "maxInitiallyVisibleResults") + objc_msgSend(v48, "count"));
          }
          else
          {
            v9 = v13;
            objc_msgSend(v9, "resultSet");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "removeAllObjects");

            objc_msgSend(v9, "addResultsFromArray:", v48);
          }
          v11 = &_SpotlightDefineRankingTypes_[268];
        }
        else
        {
          SSGeneralLog();
          v58 = objc_claimAutoreleasedReturnValue();
          v8 = v72;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v71, "searchString");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            SSRedactString(v59, 1);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "bundleIdentifier");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v97 = v60;
            v98 = 2112;
            v99 = v61;
            _os_log_impl(&dword_1B86C5000, v58, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ Filtering section %@", buf, 0x16u);

          }
          v11 = _SpotlightDefineRankingTypes_ + 1072;
          v12 = v73;
        }

        goto LABEL_61;
      }
      objc_msgSend(v13, "results");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "count"))
      {
        v35 = v8;
        v36 = (void *)*((_QWORD *)v11 + 273);
        objc_msgSend(v13, "resultSet");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "rankingItem");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sectionBundleIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v36) = objc_msgSend(v36, "containsObject:", v40);

        if ((_DWORD)v36)
        {
          v10 = v74;
          v8 = v35;
          if (v9)
          {
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            objc_msgSend(v13, "resultSet");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v81;
              do
              {
                for (m = 0; m != v43; ++m)
                {
                  if (*(_QWORD *)v81 != v44)
                    objc_enumerationMutation(v41);
                  v46 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * m);
                  objc_msgSend(v9, "resultSet");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "addObject:", v46);

                  objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v9, "maxInitiallyVisibleResults") + 1);
                }
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
              }
              while (v43);
            }

          }
          else
          {
            v9 = v13;
          }
        }
        else
        {
          v10 = v74;
          v8 = v35;
        }
        v11 = _SpotlightDefineRankingTypes_ + 1072;
      }
      else
      {

      }
LABEL_62:
      ++v12;
    }
    while (v12 != v75);
    v63 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
    v75 = v63;
  }
  while (v63);

  if (v9)
  {
    v64 = v71;
    +[SSRankingManager searchToolRanker:queryContext:searchToolBundles:](SSRankingManager, "searchToolRanker:queryContext:searchToolBundles:", v9, v71, *((_QWORD *)v11 + 273));
    objc_msgSend(v9, "setBundleIdentifier:", CFSTR("com.apple.spotlight.tophits"));
    objc_msgSend(v9, "setTitle:", CFSTR("Top Hit"));
    objc_msgSend(v9, "setGroupId:", &unk_1E6E976F8);
    objc_msgSend(v9, "resultSet");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaxInitiallyVisibleResults:", objc_msgSend(v65, "count"));

    objc_msgSend(v70, "addObject:", v9);
    goto LABEL_73;
  }
LABEL_70:
  SSGeneralLog();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v71, "searchString");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    SSRedactString(v67, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v97 = v68;
    _os_log_impl(&dword_1B86C5000, v66, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ No results to rank", buf, 0xCu);

  }
  v9 = 0;
  v64 = v71;
LABEL_73:

  return v70;
}

void __63__SSRankingManager_processSearchToolFinalResults_queryContext___block_invoke()
{
  int v0;
  void *v1;
  void *v2;
  const __CFString **v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v0 = _os_feature_enabled_impl();
  v1 = (void *)MEMORY[0x1E0C99E60];
  if (v0)
  {
    v29 = CFSTR("com.apple.DocumentsApp");
    v30 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
    v31 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
    v32 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
    v33 = CFSTR("com.apple.mobilemail");
    v34 = CFSTR("com.apple.mobilecal");
    v35 = CFSTR("com.apple.MobileSMS");
    v36 = CFSTR("com.apple.reminders");
    v37 = CFSTR("com.apple.spotlight.events");
    v38 = CFSTR("com.apple.Passbook");
    v39 = CFSTR("com.apple.mobilenotes");
    v40 = CFSTR("com.apple.Music");
    v41 = CFSTR("com.apple.Keynote");
    v42 = CFSTR("com.apple.Pages");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = &v29;
    v4 = 14;
  }
  else
  {
    v8 = CFSTR("com.apple.DocumentsApp");
    v9 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
    v10 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
    v11 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
    v12 = CFSTR("com.apple.mobilemail");
    v13 = CFSTR("com.apple.mobilecal");
    v14 = CFSTR("com.apple.MobileSMS");
    v15 = CFSTR("com.apple.reminders");
    v16 = CFSTR("com.apple.spotlight.events");
    v17 = CFSTR("com.apple.Passbook");
    v18 = CFSTR("com.apple.mobilenotes");
    v19 = CFSTR("com.apple.Music");
    v20 = CFSTR("com.apple.Keynote");
    v21 = CFSTR("com.apple.Pages");
    v22 = CFSTR("com.apple.searchd.syndicatedLinks");
    v23 = CFSTR("com.apple.searchd.syndicatedPhotos");
    v24 = CFSTR("com.apple.searchd.syndicatedPhotos.MobileSMS");
    v25 = CFSTR("com.apple.searchd.syndicatedPhotos.mobilenotes");
    v26 = CFSTR("com.apple.searchd.syndicatedPhotos.mobileslideshow");
    v27 = CFSTR("com.apple.mobileslideshow");
    v28 = CFSTR("com.apple.MobileAddressBook");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = &v8;
    v4 = 21;
  }
  objc_msgSend(v2, "arrayWithObjects:count:", v3, v4, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)processSearchToolFinalResults_queryContext__SEARCHTOOL_BUNDLES;
  processSearchToolFinalResults_queryContext__SEARCHTOOL_BUNDLES = v6;

}

+ (void)searchToolRanker:(id)a3 queryContext:(id)a4 searchToolBundles:(id)a5
{
  uint64_t v5;
  __CFString *v6;
  id v9;
  int v10;
  NSObject *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  double Current;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t matched;
  void *v34;
  id v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  uint64_t v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int IsSyndicatedPhotos;
  void *v71;
  void *v72;
  float v73;
  float v74;
  void *v75;
  float v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  float v99;
  double v100;
  double v101;
  double v102;
  double v103;
  NSObject *v104;
  char v105;
  __CFString *v106;
  __CFString *v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  __CFString *v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  char v124;
  __CFString *v125;
  __CFString *v126;
  char v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  __CFString *v136;
  uint64_t v137;
  __CFString *v138;
  NSObject *v139;
  __CFString *v140;
  uint64_t v141;
  __CFString *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  id v151;
  NSObject *v152;
  __CFString *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  float v159;
  double v160;
  float v161;
  double v162;
  float v163;
  double v164;
  float v165;
  double v166;
  uint64_t v167;
  NSObject *v168;
  __CFString *v169;
  uint64_t v170;
  NSObject *v171;
  void *v172;
  __CFString *v173;
  uint64_t v174;
  void *v175;
  id v176;
  __CFString *v177;
  uint64_t i;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  NSObject *v190;
  char v191;
  __CFString *v192;
  __CFString *v193;
  void *v194;
  char v195;
  __CFString *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  __CFString *v202;
  __CFString *v203;
  NSObject *v204;
  void *v205;
  __CFString *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  __CFString *v211;
  __CFString *v212;
  void *v213;
  void *v214;
  void *v215;
  __CFString *v216;
  id v217;
  void *v218;
  void *v219;
  void *v220;
  int v221;
  void *v222;
  void *v223;
  __CFString *v224;
  __CFString *v225;
  void *v226;
  void *v227;
  __CFString *v228;
  void *v229;
  char v230;
  char v231;
  void *v232;
  char v233;
  char v234;
  void *v235;
  int v236;
  id v237;
  void *v238;
  id v239;
  __CFString *v240;
  void *v241;
  void *v242;
  const __CFString *v243;
  __CFString *v244;
  int v245;
  id v246;
  int v247;
  id v248;
  id obj;
  __CFString *obja;
  const __CFString *v251;
  uint64_t v252;
  __CFString *v253;
  void *v254;
  uint64_t v255;
  void *v256;
  void *v257;
  id v258;
  id v259;
  void *v260;
  char v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  uint64_t v265;
  int v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  uint64_t v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  _QWORD v279[4];
  __CFString *v280;
  id v281;
  id v282;
  id v283;
  int v284;
  char v285;
  char v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  uint8_t v291[128];
  uint8_t buf[4];
  __CFString *v293;
  __int16 v294;
  _BYTE v295[34];
  __int16 v296;
  id v297;
  __int16 v298;
  uint64_t v299;
  __int16 v300;
  uint64_t v301;
  __int16 v302;
  double v303;
  __int16 v304;
  double v305;
  __int16 v306;
  double v307;
  __int16 v308;
  double v309;
  __int16 v310;
  uint64_t v311;
  _BYTE v312[128];
  _BYTE v313[128];
  uint64_t v314;

  v314 = *MEMORY[0x1E0C80C00];
  v246 = a3;
  v9 = a4;
  v217 = a5;
  v10 = objc_msgSend(v9, "intentFromQU");
  v245 = objc_msgSend(v9, "earliestTokenFromQU");
  v236 = objc_msgSend(v9, "latestTokenFromQU");
  SSGeneralLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v235 = v9;
  v247 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = _os_feature_enabled_impl();
    objc_msgSend(v9, "searchString");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v13;
    if ((v12 & 1) == 0)
    {
      SSRedactString(v13, 1);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "intentFromQU");
    v16 = v9;
    v17 = intentLabel();
    v6 = (__CFString *)objc_msgSend(v16, "earliestTokenFromQU");
    v18 = objc_msgSend(v16, "latestTokenFromQU");
    v5 = _os_feature_enabled_impl();
    objc_msgSend(v16, "parsedQueryFromQU");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v19;
    if ((v5 & 1) == 0)
    {
      SSRedactString(v19, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138413314;
    v293 = v15;
    v294 = 2080;
    *(_QWORD *)v295 = v17;
    *(_WORD *)&v295[8] = 1024;
    *(_DWORD *)&v295[10] = (_DWORD)v6;
    *(_WORD *)&v295[14] = 1024;
    *(_DWORD *)&v295[16] = v18;
    *(_WORD *)&v295[20] = 2112;
    *(_QWORD *)&v295[22] = v21;
    _os_log_impl(&dword_1B86C5000, v11, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] [QU] query=%@ QU_Intent=%s earliest=%i latest=%i parsedQueryFromQU=%@", buf, 0x2Cu);
    if ((v5 & 1) == 0)

    v9 = v235;
    v10 = v247;
    if ((v12 & 1) == 0)

  }
  v259 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v246, "resultSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v253 = (__CFString *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

  v24 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v246, "resultSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v252 = objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

  Current = CFAbsoluteTimeGetCurrent();
  v287 = 0u;
  v288 = 0u;
  v289 = 0u;
  v290 = 0u;
  objc_msgSend(v246, "resultSet");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v265 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v287, v313, 16);
  if (v265)
  {
    v262 = *(_QWORD *)v288;
    v243 = CFSTR("com.apple.mobilemail");
    v244 = CFSTR("com.apple.mobilecal");
    v251 = CFSTR("com.apple.spotlight.events");
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v288 != v262)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * v27);
        objc_msgSend(v28, "rankingItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sectionBundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
          goto LABEL_75;
        objc_msgSend(v28, "rankingItem");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sectionBundleIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        matched = isQUIntentMatchBundle(v10, v32);

        objc_msgSend(v28, "rankingItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "sectionBundleIdentifier");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        v268 = v5;
        if (!v10)
        {
LABEL_24:
          v38 = 0;
          goto LABEL_29;
        }
        if (v10 == 3 && (objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
          goto LABEL_28;
        v37 = (const char *)intentLabel();
        v38 = (uint64_t)v37;
        if (!v37)
          goto LABEL_29;
        if (strncmp(v37, "INTENT_FLIGHT", 0xDuLL)
          && strncmp((const char *)v38, "INTENT_HOTEL", 0xCuLL)
          && strncmp((const char *)v38, "INTENT_RESTAURANT", 0x11uLL))
        {
          goto LABEL_24;
        }
        if ((objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
          || (objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0
          || (objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0)
        {
LABEL_28:
          v38 = 1;
        }
        else
        {
          v38 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.MobileSMS"));
        }
LABEL_29:

        v6 = (__CFString *)0x1E0CB3000;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", matched);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "rankingItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sectionBundleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setObject:forKeyedSubscript:](v253, "setObject:forKeyedSubscript:", v39, v41);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "rankingItem");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "sectionBundleIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v252, "setObject:forKeyedSubscript:", v42, v44);

        objc_msgSend(v28, "rankingItem");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "sectionBundleIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.spotlight.events"));

        if ((_DWORD)v44)
        {
          objc_msgSend(v28, "rankingItem");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v47, "attributes"), 0x11uLL);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "timeIntervalSinceReferenceDate");
          v50 = (uint64_t)(v49 - Current);
          objc_msgSend(v28, "rankingItem");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setStartDueDateToNowInSeconds:", v50);

        }
        v5 = v268;
        if (!(_DWORD)matched)
          goto LABEL_44;
        objc_msgSend(v28, "rankingItem");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "sectionBundleIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.mobilecal"));
        v56 = (uint64_t)v254;
        v55 = v257;
        if ((v54 & 1) != 0
          || (objc_msgSend(v28, "rankingItem"),
              v242 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v242, "sectionBundleIdentifier"),
              v241 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(v241, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0))
        {
          v57 = 0;
          goto LABEL_35;
        }
        objc_msgSend(v28, "rankingItem");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "sectionBundleIdentifier");
        v56 = objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend((id)v56, "isEqualToString:", CFSTR("com.apple.spotlight.events")) & 1) != 0)
        {
          v57 = 1;
LABEL_35:
          v254 = (void *)v56;
          v257 = v55;
          if (v245)
          {
            objc_msgSend(v28, "rankingItem");
            v56 = objc_claimAutoreleasedReturnValue();
            v238 = (void *)v56;
            if (objc_msgSend((id)v56, "startDueDateToNowInSeconds") < 0)
            {

              LODWORD(v56) = 1;
              if ((v57 & 1) == 0)
                goto LABEL_42;
              goto LABEL_69;
            }
            if ((v236 & 1) == 0)
            {
              LODWORD(v56) = 0;
              goto LABEL_41;
            }
LABEL_40:
            objc_msgSend(v28, "rankingItem");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v56) = objc_msgSend(v58, "startDueDateToNowInSeconds") > 0;

            if (v245)
            {
LABEL_41:

              if ((v57 & 1) == 0)
              {
LABEL_42:
                if ((v54 & 1) != 0)
                  goto LABEL_43;
LABEL_70:
                v5 = v268;
                goto LABEL_81;
              }
LABEL_69:

              if ((v54 & 1) != 0)
              {
LABEL_43:
                v5 = v268;

                v10 = v247;
                if ((_DWORD)v56)
                  goto LABEL_82;
                goto LABEL_44;
              }
              goto LABEL_70;
            }
          }
          else
          {
            if (v236)
              goto LABEL_40;
            LODWORD(v56) = 0;
          }
          if (!v57)
            goto LABEL_42;
          goto LABEL_69;
        }
        v254 = (void *)v56;

        v257 = v55;
        LOBYTE(v56) = 0;
LABEL_81:

        v10 = v247;
        if ((v56 & 1) != 0)
        {
LABEL_82:
          SSGeneralLog();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            v105 = _os_feature_enabled_impl();
            objc_msgSend(v9, "searchString");
            v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v107 = v106;
            v233 = v105;
            if ((v105 & 1) != 0)
            {
              v228 = v106;
            }
            else
            {
              SSRedactString(v106, 1);
              v224 = v107;
              v225 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v107 = v225;
            }
            v108 = _os_feature_enabled_impl();
            objc_msgSend(v28, "title");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "text");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = v110;
            v230 = v108;
            if ((v108 & 1) != 0)
            {
              v112 = v109;
              v113 = v110;
              v109 = v226;
            }
            else
            {
              SSRedactString(v110, 1);
              v222 = v111;
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = v223;
              v112 = (void *)v268;
              v113 = v227;
            }
            objc_msgSend(v28, "rankingItem");
            v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[__CFString sectionBundleIdentifier](v6, "sectionBundleIdentifier");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "rankingItem");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = objc_msgSend(v115, "startDueDateToNowInSeconds");
            *(_DWORD *)buf = 138413058;
            v293 = v107;
            v294 = 2112;
            *(_QWORD *)v295 = v111;
            *(_WORD *)&v295[8] = 2112;
            *(_QWORD *)&v295[10] = v114;
            *(_WORD *)&v295[18] = 2048;
            *(_QWORD *)&v295[20] = v116;
            _os_log_impl(&dword_1B86C5000, v104, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ filter result %@ bundle=%@ for next/last startDueDateToNowInSeconds=%ld", buf, 0x2Au);

            v227 = v113;
            v117 = v112;
            v5 = (uint64_t)v112;
            if ((v230 & 1) == 0)
            {

              v113 = v222;
              v117 = v109;
            }

            v118 = v228;
            v9 = v235;
            v10 = v247;
            if ((v233 & 1) == 0)
            {

              v118 = v224;
            }

            v226 = v109;
          }
          goto LABEL_94;
        }
LABEL_44:
        if ((objc_msgSend(v9, "isAppEntitySearch") & 1) != 0)
          goto LABEL_55;
        objc_msgSend(v28, "rankingItem");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "sectionBundleIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v60, "isEqualToString:", CFSTR("com.apple.spotlight.events")) & 1) != 0)
          goto LABEL_54;
        objc_msgSend(v28, "rankingItem");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "sectionBundleIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if ((SSSectionIsSyndicatedPhotos(v62) & 1) != 0)
          goto LABEL_53;
        objc_msgSend(v28, "rankingItem");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString sectionBundleIdentifier](v6, "sectionBundleIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v63, "isEqualToString:", CFSTR("com.apple.DocumentsApp")) & 1) != 0)
          goto LABEL_52;
        objc_msgSend(v28, "rankingItem");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "sectionBundleIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v65, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
          goto LABEL_51;
        v229 = v65;
        v232 = v64;
        objc_msgSend(v28, "rankingItem");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "sectionBundleIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v67, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0)
        {

          v65 = v229;
          v64 = v232;
LABEL_51:

          v5 = v268;
LABEL_52:

LABEL_53:
          v9 = v235;
          v10 = v247;
LABEL_54:

LABEL_55:
          objc_msgSend(v28, "rankingItem");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "sectionBundleIdentifier");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v69);

          objc_msgSend(v28, "rankingItem");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (IsSyndicatedPhotos)
          {
            objc_msgSend(v71, "l2Score");
            v74 = v73;

            objc_msgSend(v28, "rankingItem");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "l2Score");
            v77 = v76;
            if (v74 >= 70.0)
            {
              v79 = (v77 + -70.0) * 0.025 + 0.25;

              if (v79 > 1.0)
                v79 = 1.0;
            }
            else
            {
              v78 = v77 / 280.0;

              v79 = fmax(v78, 0.0);
            }
            objc_msgSend(v28, "rankingItem");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "setTopicalityScore:", v79);

            objc_msgSend(v28, "rankingItem");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "topicalityScore");
            v95 = v94;
            objc_msgSend(v28, "rankingItem");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setLikelihood:", v95);
          }
          else
          {
            objc_msgSend(v71, "sectionBundleIdentifier");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));

            objc_msgSend(v28, "rankingItem");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v82;
            if (v81)
            {
              objc_msgSend(v82, "engagementScore");
              v85 = v84;
              objc_msgSend(v28, "rankingItem");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "freshnessScore");
              v88 = v87 * 0.8;
              objc_msgSend(v28, "rankingItem");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "topicalityScore");
              v91 = v88 * v90 + v85 * 0.2;
              objc_msgSend(v28, "rankingItem");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "setLikelihood:", v91);

            }
            else
            {
              objc_msgSend(v82, "topicalityScore");
              v97 = v96;

              objc_msgSend(v28, "rankingItem");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = v98;
              if (v97 >= 0.0)
              {
                objc_msgSend(v98, "topicalityScore");
                v102 = v101;
                objc_msgSend(v28, "rankingItem");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "freshnessScore");
                v100 = v102 * v103;
              }
              else
              {
                objc_msgSend(v98, "L2FeatureVector");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "originalL2Score");
                v100 = 0.05 / (float)(expf(-v99) + 1.0);
              }
              objc_msgSend(v28, "rankingItem");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "setLikelihood:", v100);
            }

          }
LABEL_75:
          objc_msgSend(v259, "addObject:", v28);
          goto LABEL_76;
        }
        v219 = v67;
        v220 = v66;
        objc_msgSend(v28, "rankingItem");
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v218, "sectionBundleIdentifier");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v119, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")) & 1) != 0)
        {
          v221 = 0;
        }
        else
        {
          objc_msgSend(v246, "bundleIdentifier");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v221 = objc_msgSend(v217, "containsObject:", v120);

        }
        v9 = v235;
        v10 = v247;
        v5 = v268;
        if (!v221)
          goto LABEL_55;
        objc_msgSend(v28, "rankingItem");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "topicalityScore");
        v123 = v122;

        if (v123 != 0.0)
          goto LABEL_55;
        SSGeneralLog();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          v124 = _os_feature_enabled_impl();
          objc_msgSend(v235, "searchString");
          v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v126 = v125;
          v234 = v124;
          if ((v124 & 1) != 0)
          {
            v216 = v125;
          }
          else
          {
            SSRedactString(v125, 1);
            v211 = v126;
            v212 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v126 = v212;
          }
          v127 = _os_feature_enabled_impl();
          objc_msgSend(v28, "title");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "text");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = v129;
          v231 = v127;
          if ((v127 & 1) != 0)
          {
            v131 = v128;
            v132 = v129;
            v128 = v213;
          }
          else
          {
            SSRedactString(v129, 1);
            v209 = v130;
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            v130 = v210;
            v132 = v214;
            v131 = v215;
          }
          objc_msgSend(v28, "rankingItem");
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString sectionBundleIdentifier](v6, "sectionBundleIdentifier");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "rankingItem");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "topicalityScore");
          *(_DWORD *)buf = 138413058;
          v293 = v126;
          v294 = 2112;
          *(_QWORD *)v295 = v130;
          *(_WORD *)&v295[8] = 2112;
          *(_QWORD *)&v295[10] = v133;
          *(_WORD *)&v295[18] = 2048;
          *(_QWORD *)&v295[20] = v135;
          _os_log_impl(&dword_1B86C5000, v104, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ filter result %@ bundle=%@ for topicalityScore=%f", buf, 0x2Au);

          v214 = v132;
          v215 = v131;
          if ((v231 & 1) == 0)
          {

            v132 = v209;
            v131 = v128;
          }

          v136 = v216;
          v9 = v235;
          v10 = v247;
          v5 = v268;
          if ((v234 & 1) == 0)
          {

            v136 = v211;
          }

          v213 = v128;
        }
LABEL_94:

LABEL_76:
        ++v27;
      }
      while (v265 != v27);
      v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v287, v313, 16);
      v265 = v137;
    }
    while (v137);
  }

  v279[0] = MEMORY[0x1E0C809B0];
  v279[1] = 3221225472;
  v279[2] = __68__SSRankingManager_searchToolRanker_queryContext_searchToolBundles___block_invoke;
  v279[3] = &unk_1E6E43610;
  v240 = v253;
  v280 = v240;
  v237 = (id)v252;
  v281 = v237;
  v239 = v217;
  v282 = v239;
  v284 = v10;
  v285 = v245;
  v286 = v236;
  v258 = v9;
  v283 = v258;
  objc_msgSend(v259, "sortedArrayWithOptions:usingComparator:", 16, v279);
  v138 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    SSGeneralLog();
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v258, "searchString");
      v140 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v141 = -[__CFString count](v138, "count");
      *(_DWORD *)buf = 138412546;
      v293 = v140;
      v294 = 2048;
      *(_QWORD *)v295 = v141;
      _os_log_impl(&dword_1B86C5000, v139, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ rank %lu results", buf, 0x16u);

    }
    v277 = 0u;
    v278 = 0u;
    v275 = 0u;
    v276 = 0u;
    v251 = v138;
    v142 = v138;
    v143 = -[__CFString countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v275, v312, 16);
    if (v143)
    {
      v144 = v143;
      v266 = 0;
      v263 = *(_QWORD *)v276;
      v252 = 138415362;
      v253 = v142;
      do
      {
        v145 = 0;
        v255 = v144;
        do
        {
          if (*(_QWORD *)v276 != v263)
            objc_enumerationMutation(v142);
          objc_msgSend(*(id *)(*((_QWORD *)&v275 + 1) + 8 * v145), "rankingItem");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v146, "attributes"), 0xE3uLL);
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v146, "attributes"), 7uLL);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v146, "attributes"), 0xCuLL);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v146, "attributes"), 4uLL);
          v148 = objc_claimAutoreleasedReturnValue();
          v149 = (void *)v148;
          if (v147)
            v150 = v147;
          else
            v150 = (void *)v148;
          if (v6)
            v150 = v6;
          v151 = v150;
          SSGeneralLog();
          v152 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v258, "searchString");
            v153 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "sectionBundleIdentifier");
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "identifier");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "likelihood");
            v156 = v155;
            objc_msgSend(v146, "topicalityScore");
            v158 = v157;
            objc_msgSend(v146, "pommesL1Score");
            v160 = v159;
            objc_msgSend(v146, "pommesCalibratedL1Score");
            v162 = v161;
            objc_msgSend(v146, "embeddingSimilarity");
            v164 = v163;
            objc_msgSend(v146, "keywordMatchScore");
            v166 = v165;
            objc_msgSend(v146, "freshnessScore");
            *(_DWORD *)buf = 138415362;
            v293 = v153;
            v294 = 1024;
            *(_DWORD *)v295 = ++v266;
            *(_WORD *)&v295[4] = 2112;
            *(_QWORD *)&v295[6] = v260;
            *(_WORD *)&v295[14] = 2112;
            *(_QWORD *)&v295[16] = v154;
            *(_WORD *)&v295[24] = 2112;
            *(_QWORD *)&v295[26] = v269;
            v296 = 2112;
            v297 = v151;
            v298 = 2048;
            v299 = v156;
            v300 = 2048;
            v301 = v158;
            v302 = 2048;
            v303 = v160;
            v304 = 2048;
            v305 = v162;
            v306 = 2048;
            v307 = v164;
            v308 = 2048;
            v309 = v166;
            v310 = 2048;
            v311 = v167;
            _os_log_impl(&dword_1B86C5000, v152, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ ranked result %i: bundleId=%@ identifier=%@ messageID=%@ name=%@ score=(likelihood=%f topicality=%f pommesL1Score=%f pommesCalibratedL1Score=%f embeddingSimilarity=%f keywordMatchScore=%f freshness=%f)", buf, 0x80u);

            v144 = v255;
            v142 = v253;
          }

          ++v145;
        }
        while (v144 != v145);
        v144 = -[__CFString countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v275, v312, 16);
      }
      while (v144);
    }

    SSGeneralLog();
    v168 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v258, "searchString");
      v169 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v170 = -[__CFString count](v142, "count");
      *(_DWORD *)buf = 138412546;
      v293 = v169;
      v294 = 2048;
      *(_QWORD *)v295 = v170;
      _os_log_impl(&dword_1B86C5000, v168, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ ranked %lu results", buf, 0x16u);

    }
    v138 = (__CFString *)v251;
  }
  SSGeneralLog();
  v171 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v258, "searchString");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    SSRedactString(v172, 1);
    v173 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v174 = -[__CFString count](v138, "count");
    *(_DWORD *)buf = 138412546;
    v293 = v173;
    v294 = 2048;
    *(_QWORD *)v295 = v174;
    _os_log_impl(&dword_1B86C5000, v171, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ output %lu candidates", buf, 0x16u);

  }
  objc_msgSend(v246, "resultSet");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "removeAllObjects");

  v176 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v271 = 0u;
  v272 = 0u;
  v273 = 0u;
  v274 = 0u;
  v177 = v138;
  v270 = -[__CFString countByEnumeratingWithState:objects:count:](v177, "countByEnumeratingWithState:objects:count:", &v271, v291, 16);
  if (v270)
  {
    v264 = 0;
    v267 = *(_QWORD *)v272;
    v248 = v176;
    obja = v177;
    do
    {
      for (i = 0; i != v270; ++i)
      {
        if (*(_QWORD *)v272 != v267)
          objc_enumerationMutation(v177);
        v179 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * i);
        objc_msgSend(v179, "rankingItem");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "sectionBundleIdentifier");
        v181 = (void *)objc_claimAutoreleasedReturnValue();

        if (v181)
        {
          objc_msgSend(v179, "rankingItem");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "sectionBundleIdentifier");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "objectForKeyedSubscript:", v183);
          v184 = (void *)objc_claimAutoreleasedReturnValue();

          if (v184)
            v185 = objc_msgSend(v184, "intValue") + 1;
          else
            v185 = 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v185);
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "rankingItem");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "sectionBundleIdentifier");
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "setObject:forKeyedSubscript:", v186, v188);

        }
        else
        {
          LODWORD(v185) = ++v264;
        }
        if ((int)v185 <= 5)
        {
          objc_msgSend(v246, "resultSet");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "addObject:", v179);

          SSGeneralLog();
          v190 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
          {
            v191 = _os_feature_enabled_impl();
            objc_msgSend(v258, "searchString");
            v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v193 = v192;
            v261 = v191;
            if ((v191 & 1) != 0)
            {
              v253 = v192;
            }
            else
            {
              SSRedactString(v192, 1);
              v243 = v193;
              v244 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v193 = v244;
            }
            objc_msgSend(v179, "rankingItem");
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v256, "sectionBundleIdentifier");
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            v195 = _os_feature_enabled_impl();
            objc_msgSend(v179, "title");
            v196 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[__CFString text](v196, "text");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            v198 = v197;
            if ((v195 & 1) != 0)
            {
              v6 = v196;
              v199 = v197;
              v196 = (__CFString *)v251;
            }
            else
            {
              SSRedactString(v197, 1);
              v241 = v198;
              v242 = (void *)objc_claimAutoreleasedReturnValue();
              v198 = v242;
              v199 = (void *)v252;
            }
            objc_msgSend(v179, "rankingItem");
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v200, "likelihood");
            *(_DWORD *)buf = 138413058;
            v293 = v193;
            v294 = 2112;
            *(_QWORD *)v295 = v194;
            *(_WORD *)&v295[8] = 2112;
            *(_QWORD *)&v295[10] = v198;
            *(_WORD *)&v295[18] = 2048;
            *(_QWORD *)&v295[20] = v201;
            _os_log_impl(&dword_1B86C5000, v190, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ output result: bundleID=%@ name=%@ likelihood=%f", buf, 0x2Au);

            v252 = (uint64_t)v199;
            v202 = v6;
            if ((v195 & 1) == 0)
            {

              v199 = v241;
              v202 = v196;
            }

            v203 = v253;
            v177 = obja;
            if ((v261 & 1) == 0)
            {

              v203 = (__CFString *)v243;
            }

            v251 = v196;
            v176 = v248;
          }

        }
      }
      v270 = -[__CFString countByEnumeratingWithState:objects:count:](v177, "countByEnumeratingWithState:objects:count:", &v271, v291, 16);
    }
    while (v270);
  }

  SSGeneralLog();
  v204 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v258, "searchString");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    SSRedactString(v205, 1);
    v206 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "resultSet");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = objc_msgSend(v207, "count");
    *(_DWORD *)buf = 138412546;
    v293 = v206;
    v294 = 2048;
    *(_QWORD *)v295 = v208;
    _os_log_impl(&dword_1B86C5000, v204, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] query=%@ output %lu results", buf, 0x16u);

  }
}

uint64_t __68__SSRankingManager_searchToolRanker_queryContext_searchToolBundles___block_invoke(uint64_t a1, void *a2, void *a3)
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
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  int v34;
  int v35;
  unsigned int v36;
  void *v37;
  float v38;
  float v39;
  void *v40;
  float v41;
  float v42;
  unsigned int v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  char v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  const char *v82;
  NSObject *v83;
  char v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  const char *v92;
  char v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  int v138;
  int v139;
  int v140;
  char v141;
  char v142;
  void *v143;
  void *v144;
  void *v145;
  uint8_t buf[4];
  void *v147;
  __int16 v148;
  void *v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "rankingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "rankingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "resultBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v5, "rankingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "rankingItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "resultBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v14)
      goto LABEL_9;
  }
  else
  {
    v16 = 0;
    if (v14)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if (v10)
        goto LABEL_10;
LABEL_14:
      v20 = 0;
      if (v14)
        goto LABEL_11;
LABEL_15:
      v22 = 0;
      goto LABEL_16;
    }
  }
  v18 = 0;
  if (!v10)
    goto LABEL_14;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (!v14)
    goto LABEL_15;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

LABEL_16:
  objc_msgSend(v5, "rankingItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v23, "isMailCategoryHighImpact");

  objc_msgSend(v6, "rankingItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v24, "isMailCategoryHighImpact");

  objc_msgSend(v5, "rankingItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v25, "isMailCategoryPromotions");

  objc_msgSend(v6, "rankingItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v26, "isMailCategoryPromotions");

  objc_msgSend(v5, "rankingItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "likelihood");
  v29 = v28;

  objc_msgSend(v6, "rankingItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "likelihood");
  v32 = v31;

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.spotlight.events"))
    && !objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.spotlight.events")))
  {
    goto LABEL_146;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.spotlight.events")) & 1) == 0
    && (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.spotlight.events")) & 1) != 0)
  {
    goto LABEL_20;
  }
  v143 = v6;
  v34 = v16 ^ 1;
  if ((v16 ^ 1 | v18) != 1)
    goto LABEL_149;
  v35 = v18 ^ 1;
  if ((v16 | v35) != 1)
    goto LABEL_29;
  if ((v20 ^ 1 | v22) != 1)
    goto LABEL_149;
  if ((v20 | v22 ^ 1) != 1)
  {
LABEL_29:
    v33 = 1;
LABEL_150:
    v6 = v143;
    goto LABEL_151;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10)
    && !objc_msgSend(*(id *)(a1 + 48), "containsObject:", v14))
  {
    goto LABEL_149;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v14) & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_DWORD *)(a1 + 64) - 23) >= 2)
    v36 = v34 | v35 | isEventSearchIntent() ^ 1;
  else
    LOBYTE(v36) = v34 | v35;
  v6 = v143;
  if ((v36 & 1) != 0)
    goto LABEL_78;
  objc_msgSend(v5, "rankingItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "pommesL1Score");
  v39 = v38;

  objc_msgSend(v143, "rankingItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "pommesL1Score");
  v42 = v41;

  v43 = isEventSearchIntent();
  if (v43)
    v44 = 10000.0;
  else
    v44 = v39;
  if (v43)
    v45 = 9999.0;
  else
    v45 = v42;
  if (*(_BYTE *)(a1 + 68))
  {
    objc_msgSend(v5, "rankingItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "startDueDateToNowInSeconds") <= 0)
    {

    }
    else
    {
      objc_msgSend(v143, "rankingItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "startDueDateToNowInSeconds");

      if (v48 < 0)
        goto LABEL_146;
    }
    objc_msgSend(v5, "rankingItem");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "startDueDateToNowInSeconds") < 0)
    {
      objc_msgSend(v143, "rankingItem");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "startDueDateToNowInSeconds");

      if (v59 > 0)
        goto LABEL_20;
    }
    else
    {

    }
    objc_msgSend(v5, "rankingItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "startDueDateToNowInSeconds") >= 1)
    {
      objc_msgSend(v143, "rankingItem");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v55, "startDueDateToNowInSeconds") > 0)
      {
        objc_msgSend(v5, "rankingItem");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v56, "startDueDateToNowInSeconds");
        objc_msgSend(v143, "rankingItem");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v57, "startDueDateToNowInSeconds");

        if (v133 < v129 && v44 > 0.64)
          goto LABEL_146;
LABEL_64:
        objc_msgSend(v5, "rankingItem");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "startDueDateToNowInSeconds") >= 1)
        {
          objc_msgSend(v143, "rankingItem");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v63, "startDueDateToNowInSeconds") >= 1)
          {
            objc_msgSend(v5, "rankingItem");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend(v64, "startDueDateToNowInSeconds");
            objc_msgSend(v143, "rankingItem");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v130 = objc_msgSend(v65, "startDueDateToNowInSeconds");

            if (v134 <= v130)
              goto LABEL_78;
LABEL_67:
            if (v45 <= 0.64)
              goto LABEL_78;
LABEL_20:
            v33 = 1;
            goto LABEL_151;
          }
          goto LABEL_76;
        }
LABEL_77:

        goto LABEL_78;
      }

    }
    goto LABEL_64;
  }
  if (!*(_BYTE *)(a1 + 69))
    goto LABEL_78;
  objc_msgSend(v5, "rankingItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "startDueDateToNowInSeconds") < 0)
  {
    objc_msgSend(v143, "rankingItem");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "startDueDateToNowInSeconds");

    if (v61 > 0)
      goto LABEL_146;
  }
  else
  {

  }
  objc_msgSend(v5, "rankingItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "startDueDateToNowInSeconds") <= 0)
  {

  }
  else
  {
    objc_msgSend(v143, "rankingItem");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "startDueDateToNowInSeconds");

    if (v52 < 0)
      goto LABEL_20;
  }
  objc_msgSend(v5, "rankingItem");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v66, "startDueDateToNowInSeconds") & 0x8000000000000000) == 0)
    goto LABEL_73;
  objc_msgSend(v143, "rankingItem");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v67, "startDueDateToNowInSeconds") & 0x8000000000000000) == 0)
  {

LABEL_73:
    goto LABEL_74;
  }
  objc_msgSend(v5, "rankingItem");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend(v113, "startDueDateToNowInSeconds");
  objc_msgSend(v143, "rankingItem");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v114, "startDueDateToNowInSeconds");

  if (v135 > v131 && v44 > 0.64)
    goto LABEL_146;
LABEL_74:
  objc_msgSend(v5, "rankingItem");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v62, "startDueDateToNowInSeconds") & 0x8000000000000000) == 0)
    goto LABEL_77;
  objc_msgSend(v143, "rankingItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v63, "startDueDateToNowInSeconds") & 0x8000000000000000) == 0)
  {
LABEL_76:

    goto LABEL_77;
  }
  objc_msgSend(v5, "rankingItem");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v115, "startDueDateToNowInSeconds");
  objc_msgSend(v143, "rankingItem");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = objc_msgSend(v116, "startDueDateToNowInSeconds");

  if (v136 < v132)
    goto LABEL_67;
LABEL_78:
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilemail"))
    && objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    if (((v138 ^ 1 | v137) & 1) == 0)
    {
      SSGeneralLog();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        v93 = _os_feature_enabled_impl();
        objc_msgSend(*(id *)(a1 + 56), "searchString");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v94;
        v145 = v94;
        v142 = v93;
        if ((v93 & 1) == 0)
        {
          SSRedactString(v94, 1);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v87 = _os_feature_enabled_impl();
        objc_msgSend(v5, "rankingItem");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "displayName");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v95;
        v91 = v95;
        if ((v87 & 1) == 0)
        {
          SSRedactString(v95, 1);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412546;
        v147 = v145;
        v148 = 2112;
        v149 = v91;
        v92 = "[SpotlightRanking] [SearchTool] query=%@ Result: %@ was promoted due to email Label: High Impact";
        goto LABEL_113;
      }
LABEL_118:

      goto LABEL_146;
    }
    if (((v138 | v137 ^ 1) & 1) == 0)
    {
      SSGeneralLog();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        v96 = _os_feature_enabled_impl();
        objc_msgSend(*(id *)(a1 + 56), "searchString");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v97;
        v144 = v97;
        v141 = v96;
        if ((v96 & 1) == 0)
        {
          SSRedactString(v97, 1);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v77 = _os_feature_enabled_impl();
        objc_msgSend(v6, "rankingItem");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "displayName");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v98;
        v81 = v98;
        if ((v77 & 1) == 0)
        {
          SSRedactString(v98, 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412546;
        v147 = v144;
        v148 = 2112;
        v149 = v81;
        v82 = "[SpotlightRanking] [SearchTool] query=%@ Result: %@ was promoted due to email Label: High Impact";
        goto LABEL_95;
      }
LABEL_100:

      goto LABEL_20;
    }
  }
  if (((v140 ^ 1 | v139) & 1) == 0)
  {
    SSGeneralLog();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = _os_feature_enabled_impl();
      objc_msgSend(*(id *)(a1 + 56), "searchString");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v75;
      v144 = v75;
      v141 = v74;
      if ((v74 & 1) == 0)
      {
        SSRedactString(v75, 1);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v77 = _os_feature_enabled_impl();
      objc_msgSend(v5, "rankingItem");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "displayName");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v79;
      v81 = v79;
      if ((v77 & 1) == 0)
      {
        SSRedactString(v79, 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412546;
      v147 = v144;
      v148 = 2112;
      v149 = v81;
      v82 = "[SpotlightRanking] [SearchTool] query=%@ Result: %@ was demoted due to email Label: Promotional";
LABEL_95:
      _os_log_impl(&dword_1B86C5000, v73, OS_LOG_TYPE_DEFAULT, v82, buf, 0x16u);
      if ((v77 & 1) == 0)

      if ((v141 & 1) == 0)
      goto LABEL_100;
    }
    goto LABEL_100;
  }
  if (((v140 | v139 ^ 1) & 1) == 0)
  {
    SSGeneralLog();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = _os_feature_enabled_impl();
      objc_msgSend(*(id *)(a1 + 56), "searchString");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v85;
      v145 = v85;
      v142 = v84;
      if ((v84 & 1) == 0)
      {
        SSRedactString(v85, 1);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v87 = _os_feature_enabled_impl();
      objc_msgSend(v6, "rankingItem");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "displayName");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v89;
      v91 = v89;
      if ((v87 & 1) == 0)
      {
        SSRedactString(v89, 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412546;
      v147 = v145;
      v148 = 2112;
      v149 = v91;
      v92 = "[SpotlightRanking] [SearchTool] query=%@ Result: %@ was demoted due to email Label: Promotional";
LABEL_113:
      _os_log_impl(&dword_1B86C5000, v83, OS_LOG_TYPE_DEFAULT, v92, buf, 0x16u);
      if ((v87 & 1) == 0)

      if ((v142 & 1) == 0)
      goto LABEL_118;
    }
    goto LABEL_118;
  }
  v68 = v29;
  v69 = v32;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.spotlight.events"))
    || !objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.spotlight.events")))
  {
    goto LABEL_145;
  }
  objc_msgSend(v5, "rankingItem");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "startDueDateToNowInSeconds") <= 0)
  {

  }
  else
  {
    objc_msgSend(v143, "rankingItem");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "startDueDateToNowInSeconds");

    if (v72 < 0)
      goto LABEL_146;
  }
  objc_msgSend(v5, "rankingItem");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v99, "startDueDateToNowInSeconds") < 0)
  {
    objc_msgSend(v143, "rankingItem");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v111, "startDueDateToNowInSeconds");

    if (v112 > 0)
      goto LABEL_20;
  }
  else
  {

  }
  objc_msgSend(v5, "rankingItem");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v100, "startDueDateToNowInSeconds") <= 0)
  {

    goto LABEL_142;
  }
  objc_msgSend(v143, "rankingItem");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "startDueDateToNowInSeconds");

  if (v102 < 1)
  {
LABEL_142:
    objc_msgSend(v5, "rankingItem");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v117, "startDueDateToNowInSeconds") & 0x8000000000000000) == 0)
    {

      goto LABEL_145;
    }
    objc_msgSend(v143, "rankingItem");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v118, "startDueDateToNowInSeconds");

    if ((v119 & 0x8000000000000000) == 0)
    {
LABEL_145:
      if (v68 <= v69)
      {
LABEL_147:
        v33 = v68 < v69;
        goto LABEL_151;
      }
LABEL_146:
      v33 = -1;
      goto LABEL_151;
    }
    objc_msgSend(v5, "rankingItem");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v120, "startDueDateToNowInSeconds");
    objc_msgSend(v143, "rankingItem");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "startDueDateToNowInSeconds");

    if (v121 <= v123)
    {
      objc_msgSend(v5, "rankingItem");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend(v125, "startDueDateToNowInSeconds");
      v6 = v143;
      objc_msgSend(v143, "rankingItem");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_msgSend(v127, "startDueDateToNowInSeconds");

      if (v126 < v128)
        goto LABEL_20;
      goto LABEL_145;
    }
LABEL_149:
    v33 = -1;
    goto LABEL_150;
  }
  objc_msgSend(v5, "rankingItem");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "startDueDateToNowInSeconds");
  objc_msgSend(v143, "rankingItem");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "startDueDateToNowInSeconds");

  if (v104 > v106)
    goto LABEL_20;
  objc_msgSend(v5, "rankingItem");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v107, "startDueDateToNowInSeconds");
  objc_msgSend(v143, "rankingItem");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "startDueDateToNowInSeconds");

  v33 = -1;
  if (v108 >= v110 && v68 <= v69)
    goto LABEL_147;
LABEL_151:

  return v33;
}

- (id)groupSectionsByCategory:(id)a3 genreMap:(id)a4 topSections:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  _BOOL4 v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  _BOOL4 v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  _BOOL4 v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  int v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint8_t v120[4];
  uint64_t v121;
  _BYTE v122[128];
  uint8_t v123[128];
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  uint64_t v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v102 = a4;
  v85 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v10 = objc_msgSend(v7, "count");
  v11 = v9;
  v12 = v7;
  v101 = (id)objc_msgSend(v11, "initWithCapacity:", v10);
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.application"));

    if (v16)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v83 = objc_claimAutoreleasedReturnValue();
      v82 = 1;
    }
    else
    {
      v82 = 0;
      v83 = 0;
    }
    v12 = v13;
  }
  else
  {
    v82 = 0;
    v83 = 0;
  }
  v84 = v12;
  if (objc_msgSend(v85, "count") == 1)
  {
    objc_msgSend(v85, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "results");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      objc_msgSend(v17, "results");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      PRSLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[SSRankingManager groupSectionsByCategory:genreMap:topSections:].cold.3(v21, v22);

      objc_msgSend(v21, "sectionBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v21, "sectionBundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        PRSLogCategoryDefault();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[SSRankingManager groupSectionsByCategory:genreMap:topSections:].cold.2((uint64_t)v25, v26);

        if (v25)
        {
          v89 = v21;
          v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v84, "count"));
          v86 = (void *)objc_opt_new();
          v96 = v17;
          v99 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke((uint64_t)v86, v17);
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v118 = 0u;
          v27 = v84;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
          if (v28)
          {
            v29 = v28;
            v30 = 0;
            v31 = *(_QWORD *)v116;
            do
            {
              v32 = 0;
              v97 = v30;
              do
              {
                if (*(_QWORD *)v116 != v31)
                  objc_enumerationMutation(v27);
                v33 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v32);
                objc_msgSend(v33, "bundleIdentifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (v34)
                {
                  objc_msgSend(v33, "bundleIdentifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "objectForKey:", v35);
                  v36 = objc_claimAutoreleasedReturnValue();

                  v38 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(v37, v33);
                  if (objc_msgSend(v25, "isEqual:", v36) && ((v99 ^ v38) & 1) == 0)
                  {
                    PRSLogCategoryDefault();
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v33, "bundleIdentifier");
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v96, "bundleIdentifier");
                      v42 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v125 = v93;
                      v126 = 2112;
                      v127 = v42;
                      v43 = (void *)v42;
                      _os_log_debug_impl(&dword_1B86C5000, v39, OS_LOG_TYPE_DEBUG, "Grouping %@ with %@", buf, 0x16u);

                    }
                    objc_msgSend(v91, "addObject:", v33);
                    objc_msgSend(v86, "addIndex:", v97 + v32);
                  }
                }
                else
                {
                  PRSLogCategoryDefault();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v33, "bundleIdentifier");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "bundleIdentifier");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v125 = v40;
                    v126 = 2112;
                    v127 = (uint64_t)v41;
                    _os_log_debug_impl(&dword_1B86C5000, v36, OS_LOG_TYPE_DEBUG, "Not grouping %@ with %@", buf, 0x16u);

                  }
                }

                ++v32;
              }
              while (v29 != v32);
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
              v30 = v97 + v32;
            }
            while (v29);
          }

          v21 = v89;
          v44 = v91;
          v17 = v96;
        }
        else
        {
          v44 = 0;
          v86 = 0;
        }

      }
      else
      {
        v44 = 0;
        v86 = 0;
      }
      v12 = v84;

    }
    else
    {
      v44 = 0;
      v86 = 0;
      v12 = v84;
    }

  }
  else
  {
    v44 = 0;
    v86 = 0;
  }
  if (objc_msgSend(v44, "count") && objc_msgSend(v86, "count"))
  {
    v45 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v45, "removeObjectsAtIndexes:", v86);
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v112 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(v44, "addObject:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i));
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
      }
      while (v48);
    }

    v51 = v44;
  }
  else
  {
    v51 = v12;
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v52 = v51;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v108;
    v92 = v44;
    v87 = *(_QWORD *)v108;
    v88 = v52;
    do
    {
      v56 = 0;
      v90 = v54;
      do
      {
        if (*(_QWORD *)v108 != v55)
          objc_enumerationMutation(v52);
        v57 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v56);
        if ((objc_msgSend(v8, "containsObject:", v57) & 1) == 0)
        {
          PRSLogCategoryDefault();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            -[SSRankingManager groupSectionsByCategory:genreMap:topSections:].cold.1(v120, v57, &v121, v58);

          objc_msgSend(v8, "addObject:", v57);
          objc_msgSend(v101, "addObject:", v57);
          objc_msgSend(v57, "bundleIdentifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            objc_msgSend(v57, "bundleIdentifier");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "objectForKey:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            PRSLogCategoryDefault();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v125 = v61;
              _os_log_debug_impl(&dword_1B86C5000, v62, OS_LOG_TYPE_DEBUG, "Genre: %@", buf, 0xCu);
            }

            if (v61)
            {
              v94 = v56;
              v98 = v57;
              v64 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(v63, v57);
              v103 = 0u;
              v104 = 0u;
              v105 = 0u;
              v106 = 0u;
              v65 = v52;
              v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
              if (v66)
              {
                v67 = v66;
                v68 = *(_QWORD *)v104;
                do
                {
                  for (j = 0; j != v67; ++j)
                  {
                    if (*(_QWORD *)v104 != v68)
                      objc_enumerationMutation(v65);
                    v70 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
                    if ((objc_msgSend(v8, "containsObject:", v70) & 1) == 0)
                    {
                      objc_msgSend(v70, "bundleIdentifier");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v71)
                      {
                        objc_msgSend(v70, "bundleIdentifier");
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v102, "objectForKey:", v72);
                        v73 = objc_claimAutoreleasedReturnValue();

                        v75 = __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(v74, v70);
                        if (objc_msgSend(v61, "isEqual:", v73) && ((v64 ^ v75) & 1) == 0)
                        {
                          PRSLogCategoryDefault();
                          v76 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                          {
                            objc_msgSend(v70, "bundleIdentifier");
                            v100 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v98, "bundleIdentifier");
                            v95 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412546;
                            v125 = v100;
                            v126 = 2112;
                            v127 = (uint64_t)v95;
                            _os_log_debug_impl(&dword_1B86C5000, v76, OS_LOG_TYPE_DEBUG, "Grouping %@ with %@", buf, 0x16u);

                          }
                          objc_msgSend(v8, "addObject:", v70);
                          objc_msgSend(v101, "addObject:", v70);
                        }
                      }
                      else
                      {
                        PRSLogCategoryDefault();
                        v73 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(v70, "bundleIdentifier");
                          v77 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v98, "bundleIdentifier");
                          v78 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v125 = v77;
                          v126 = 2112;
                          v127 = (uint64_t)v78;
                          _os_log_debug_impl(&dword_1B86C5000, v73, OS_LOG_TYPE_DEBUG, "Not grouping %@ with %@", buf, 0x16u);

                        }
                      }

                    }
                  }
                  v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
                }
                while (v67);
              }

              v54 = v90;
              v44 = v92;
              v55 = v87;
              v52 = v88;
              v56 = v94;
            }

          }
        }
        ++v56;
      }
      while (v56 != v54);
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
    }
    while (v54);
  }

  v79 = (void *)v83;
  if (v83)
    v80 = v82;
  else
    v80 = 0;
  if (v80 == 1 && (unint64_t)objc_msgSend(v101, "count") >= 2)
  {
    objc_msgSend(v101, "removeObject:", v83);
    v79 = (void *)v83;
    objc_msgSend(v101, "insertObject:atIndex:", v83, 0);
  }

  return v101;
}

BOOL __65__SSRankingManager_groupSectionsByCategory_genreMap_topSections___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    if (objc_msgSend(v3, "domain") == 2)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "resultSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rankingItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "L2FeatureVector");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v6, "rankingItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "L2FeatureVector");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "originalL2Score");
        v12 = v11;

        v4 = v12 < -900.0;
      }
      else
      {
        v4 = 0;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)rankAppsAtTopForScopedSearchWithSections:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.application"));

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v3, "mutableCopy");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v22;
      v20 = v7;
      while (2)
      {
        v13 = 0;
        v19 = v11 + v10;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
          objc_msgSend(v14, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.application"));

          if (v16)
          {
            v17 = v13 + v11;
            v7 = v20;
            objc_msgSend(v20, "removeObjectAtIndex:", v17);
            objc_msgSend(v20, "insertObject:atIndex:", v14, 0);
            goto LABEL_12;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v11 = v19;
        v7 = v20;
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

    v3 = (id)objc_msgSend(v7, "copy");
  }

  return v3;
}

- (id)keyForSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "title");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)updateWithNewRankingInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SSRankingManager rankingConfiguration](self, "rankingConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeWith:", v4);

}

- (PRSRankingConfiguration)rankingConfiguration
{
  return self->_rankingConfiguration;
}

- (void)setRankingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_rankingConfiguration, a3);
}

- (NSMutableString)logValues
{
  return self->_logValues;
}

- (void)setLogValues:(id)a3
{
  objc_storeStrong((id *)&self->_logValues, a3);
}

- (double)blendingTime
{
  return self->_blendingTime;
}

- (void)setBlendingTime:(double)a3
{
  self->_blendingTime = a3;
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSSet)allowedTopHitSections
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAllowedTopHitSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)bullseyeRankingEnabled
{
  return self->_bullseyeRankingEnabled;
}

- (void)setBullseyeRankingEnabled:(BOOL)a3
{
  self->_bullseyeRankingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTopHitSections, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_logValues, 0);
  objc_storeStrong((id *)&self->_rankingConfiguration, 0);
}

- (void)rankSectionsUsingBundleIDToSectionMapping:(_QWORD *)a3 withRanker:(NSObject *)a4 preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:.cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  id v7;

  v7 = a1;
  *(_DWORD *)a2 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1B86C5000, a4, OS_LOG_TYPE_ERROR, "result class >%@< does not respond to selector sectionBundleIdentifier", a2, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)rankSectionsUsingBundleIDToSectionMapping:(os_log_t)log withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "[SpotlightRanking] L3: scoring failed.", v1, 2u);
}

- (void)groupSectionsByCategory:(_QWORD *)a3 genreMap:(NSObject *)a4 topSections:.cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  OUTLINED_FUNCTION_0_1(&dword_1B86C5000, a4, OS_LOG_TYPE_DEBUG, "Inspecting %@", a1);

  OUTLINED_FUNCTION_1_0();
}

- (void)groupSectionsByCategory:(uint64_t)a1 genreMap:(NSObject *)a2 topSections:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1B86C5000, a2, OS_LOG_TYPE_DEBUG, "Genre: %@", (uint8_t *)&v2);
}

- (void)groupSectionsByCategory:(void *)a1 genreMap:(NSObject *)a2 topSections:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1B86C5000, a2, OS_LOG_TYPE_DEBUG, "Inspecting top result %@", (uint8_t *)&v4);

}

@end
