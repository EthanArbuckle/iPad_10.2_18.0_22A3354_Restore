@implementation PGSuggestionSession

- (PGSuggestionSession)initWithProfile:(unsigned __int8)a3 workingContext:(id)a4
{
  id v7;
  PGSuggestionSession *v8;
  PGSuggestionSession *v9;
  id v10;
  void *v11;
  uint64_t v12;
  CLSCurationContext *curationContext;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGSuggestionSession;
  v8 = -[PGSuggestionSession init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_profile = a3;
    objc_storeStrong((id *)&v8->_workingContext, a4);
    v10 = objc_alloc(MEMORY[0x1E0D77E08]);
    objc_msgSend(v7, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithPhotoLibrary:", v11);
    curationContext = v9->_curationContext;
    v9->_curationContext = (CLSCurationContext *)v12;

    v9->_topTierAestheticScore = 2.22507386e-308;
  }

  return v9;
}

- (PHPhotoLibrary)photoLibrary
{
  return -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
}

- (OS_os_log)loggingConnection
{
  return -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
}

- (void)setExistingSuggestions:(id)a3
{
  NSArray *v4;
  PGSuggestionNotificationProfile *v5;
  void *v6;
  PGSuggestionNotificationProfile *v7;
  PGSuggestionNotificationProfile *notificationProfile;
  NSArray *existingSuggestions;

  v4 = (NSArray *)a3;
  if (self->_profile == 1)
  {
    v5 = [PGSuggestionNotificationProfile alloc];
    -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGSuggestionNotificationProfile initWithExistingSuggestions:serviceManager:](v5, "initWithExistingSuggestions:serviceManager:", v4, v6);
    notificationProfile = self->_notificationProfile;
    self->_notificationProfile = v7;

  }
  existingSuggestions = self->_existingSuggestions;
  self->_existingSuggestions = v4;

}

- (unint64_t)reasonForSuggestion:(id)a3 collidingWithSuggestion:(id)a4 relaxCollisionRules:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "state") != 4
    || (v10 = -[PGSuggestionSession deniedSuggestion:collidesWithSuggestion:](self, "deniedSuggestion:collidesWithSuggestion:", v9, v8)) == 0)
  {
    if (objc_msgSend(v8, "type") == 1
      || objc_msgSend(v9, "type") == 1
      || objc_msgSend(v8, "type") == 6
      || objc_msgSend(v9, "type") == 6)
    {
      v10 = 0;
    }
    else
    {
      if (objc_msgSend(v8, "type") == 5)
        v12 = -[PGSuggestionSession outstanderSuggestion:collidesWithSuggestion:relaxCollisionRules:](self, "outstanderSuggestion:collidesWithSuggestion:relaxCollisionRules:", v8, v9, v5);
      else
        v12 = -[PGSuggestionSession singleAssetSuggestion:collidesWithSuggestion:](self, "singleAssetSuggestion:collidesWithSuggestion:", v8, v9);
      v10 = v12;
    }
  }

  return v10;
}

- (unint64_t)singleAssetSuggestion:(id)a3 collidesWithSuggestion:(id)a4
{
  id v6;
  id v7;
  NSDate *v8;
  NSDate *universalToday;
  NSDate *v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *context;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "creationDate");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  universalToday = v8;
  if (!v8)
    universalToday = self->_universalToday;
  v10 = universalToday;

  objc_msgSend(v7, "creationDate");
  v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v12 = self->_universalToday;
  v13 = v12;

  -[NSDate timeIntervalSinceDate:](v10, "timeIntervalSinceDate:", v13);
  v15 = fabs(v14);
  if (v15 >= 2592000.0)
  {
    v23 = 0;
  }
  else
  {
    v16 = dbl_1CA8ED8A0[v15 < 604800.0];
    objc_msgSend(v6, "universalStartDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateByAddingTimeInterval:", -v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "universalEndDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateByAddingTimeInterval:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "universalStartDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "universalEndDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "compare:", v20) == 1 || objc_msgSend(v22, "compare:", v18) == -1)
    {
      if (v15 < 259200.0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        context = (void *)MEMORY[0x1CAA4EB2C]();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v6, "features");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v36)
        {
          v25 = *(_QWORD *)v48;
          v40 = v20;
          v41 = v18;
          v38 = v24;
          v39 = v22;
          v35 = *(_QWORD *)v48;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v48 != v25)
                objc_enumerationMutation(v24);
              v37 = v26;
              v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v26);
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(v7, "features", v35);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v44;
                while (2)
                {
                  for (i = 0; i != v30; ++i)
                  {
                    if (*(_QWORD *)v44 != v31)
                      objc_enumerationMutation(v28);
                    if ((objc_msgSend(v27, "collidesWithFeature:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i)) & 1) != 0)
                    {

                      v23 = 2;
                      v20 = v40;
                      v18 = v41;
                      v24 = v38;
                      v22 = v39;
                      goto LABEL_34;
                    }
                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
                  if (v30)
                    continue;
                  break;
                }
              }

              v26 = v37 + 1;
              v20 = v40;
              v18 = v41;
              v24 = v38;
              v22 = v39;
              v25 = v35;
            }
            while (v37 + 1 != v36);
            v33 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
            v25 = v35;
            v23 = 0;
            v36 = v33;
          }
          while (v33);
        }
        else
        {
          v23 = 0;
        }
LABEL_34:

        objc_autoreleasePoolPop(context);
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      v23 = 1;
    }

  }
  return v23;
}

- (unint64_t)outstanderSuggestion:(id)a3 collidesWithSuggestion:(id)a4 relaxCollisionRules:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSDate *v10;
  NSDate *universalToday;
  NSDate *v12;
  NSDate *v13;
  NSDate *v14;
  NSDate *v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "creationDate");
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  universalToday = v10;
  if (!v10)
    universalToday = self->_universalToday;
  v12 = universalToday;

  objc_msgSend(v9, "creationDate");
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v14 = self->_universalToday;
  v15 = v14;

  -[NSDate timeIntervalSinceDate:](v12, "timeIntervalSinceDate:", v15);
  v17 = v16;

  v18 = fabs(v17);
  if (v18 >= 15552000.0 || v18 >= 2592000.0 && v5)
  {
    v19 = 0;
  }
  else
  {
    if (v18 >= 2592000.0 || v5)
      v21 = 3600.0;
    else
      v21 = 43200.0;
    objc_msgSend(v8, "universalStartDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dateByAddingTimeInterval:", -v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "universalEndDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateByAddingTimeInterval:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "universalStartDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "universalEndDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v26, "compare:", v25) != 1 && objc_msgSend(v27, "compare:", v23) != -1;

  }
  return v19;
}

- (unint64_t)deniedSuggestion:(id)a3 collidesWithSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "state") == 4)
  {
    objc_msgSend(v6, "universalStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", -120.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "universalEndDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", 120.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "universalStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "universalEndDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "compare:", v10) == 1)
    {
      v13 = 0;
    }
    else if (objc_msgSend(v12, "compare:", v8) == -1)
    {
      v13 = 0;
    }
    else
    {
      v13 = 3;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)supportsRelaxedCollisionRulesForSuggester:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)anySuggestionCollidingWithSuggestion:(id)a3 inSuggestions:(id)a4 relaxCollisionRules:(BOOL)a5 collisionReason:(unint64_t *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  unint64_t v21;
  unint64_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (a6)
    *a6 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v23 = a6;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1CAA4EB2C]();
        v19 = -[PGSuggestionSession reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:](self, "reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:", v10, v17, v7);
        if (v19)
        {
          v21 = v19;
          v20 = v17;
          if (v23)
            *v23 = v21;
          objc_autoreleasePoolPop(v18);
          goto LABEL_15;
        }
        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_15:

  return v20;
}

- (id)suggestionsByCollisionReasonCollidingWithSuggestion:(id)a3 inSuggestions:(id)a4 relaxCollisionRules:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  id v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v23 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CAA4EB2C]();
        v15 = -[PGSuggestionSession reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:](self, "reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:", v7, v13, v23);
        if (v15)
        {
          v16 = v15;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v17);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, v19);

          }
          objc_msgSend(v18, "addObject:", v13);

        }
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return v22;
}

- (BOOL)suggestion:(id)a3 collidesWithMemories:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "universalStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "cls_universalStartDate", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cls_universalEndDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "compare:", v8) != 1 && objc_msgSend(v15, "compare:", v7) != -1)
        {

          LOBYTE(v10) = 1;
          goto LABEL_12;
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

  return v10;
}

- (id)electedSuggestionsFromSuggestions:(id)a3 options:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  void (**v10)(void *, _QWORD *, double);
  double v11;
  double Current;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  void *v26;
  NSObject *loggingConnection;
  unint64_t v28;
  NSObject *v29;
  __CFString *v30;
  __CFString *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t v36;
  __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  unint64_t v40;
  __CFString *v41;
  uint64_t v42;
  id v44;
  id v45;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  _BYTE v52[18];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(void *, _QWORD *, double))_Block_copy(a5);
  v11 = 0.0;
  if (v10)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v46) = 0;
      v10[2](v10, &v46, 0.0);
      if ((_BYTE)v46)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v52 = 453;
          *(_WORD *)&v52[4] = 2080;
          *(_QWORD *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v13 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_54;
      }
      v11 = Current;
    }
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_msgSend(v8, "count");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v44 = v8;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (!v17)
    goto LABEL_42;
  v18 = v17;
  v19 = 1.0 / (double)v15;
  v20 = *(_QWORD *)v48;
  v21 = 0.0;
  v45 = v14;
  while (2)
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v48 != v20)
        objc_enumerationMutation(v16);
      v23 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v22);
      if (v10)
      {
        v24 = CFAbsoluteTimeGetCurrent();
        if (v24 - v11 >= 0.01)
        {
          LOBYTE(v46) = 0;
          v10[2](v10, &v46, v21);
          if ((_BYTE)v46)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v52 = 460;
              *(_WORD *)&v52[4] = 2080;
              *(_QWORD *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/PGSuggestionSession.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            v13 = (id)MEMORY[0x1E0C9AA60];
            goto LABEL_52;
          }
          v11 = v24;
        }
      }
      v46 = 0;
      if ((objc_msgSend(v9, "ignoreCollisionsWithExistingSuggestions") & 1) != 0)
      {
LABEL_18:
        if ((objc_msgSend(v9, "ignoreCollisionsWithSameBatchSuggestions") & 1) != 0
          || (-[PGSuggestionSession anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:](self, "anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:", v23, v14, 0, &v46), (v25 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          objc_msgSend(v14, "addObject:", v23);
          goto LABEL_37;
        }
        v26 = (void *)v25;
        loggingConnection = self->_loggingConnection;
        if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
          goto LABEL_36;
        v28 = v46;
        v29 = loggingConnection;
        v30 = CFSTR("Unknown");
        if (v28 <= 3)
          v30 = off_1E842E1C0[v28];
        v31 = v30;
        *(_DWORD *)buf = 138412547;
        *(_QWORD *)v52 = v31;
        *(_WORD *)&v52[8] = 2113;
        *(_QWORD *)&v52[10] = v26;
        v32 = v29;
        v33 = "Suggestion did collide (%@) with same batch suggestion %{private}@";
        goto LABEL_35;
      }
      -[PGSuggestionSession anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:](self, "anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:", v23, self->_existingSuggestions, 0, &v46);
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v26 = (void *)v34;
        v35 = self->_loggingConnection;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = v46;
          v29 = v35;
          v37 = CFSTR("Unknown");
          if (v36 <= 3)
            v37 = off_1E842E1C0[v36];
          v31 = v37;
          *(_DWORD *)buf = 138412547;
          *(_QWORD *)v52 = v31;
          *(_WORD *)&v52[8] = 2113;
          *(_QWORD *)&v52[10] = v26;
          v32 = v29;
          v33 = "Suggestion did collide (%@) with existing suggestion %{private}@";
LABEL_35:
          _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, v33, buf, 0x16u);

          v14 = v45;
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      -[PGSuggestionSession anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:](self, "anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:", v23, self->_deniedSuggestions, 0, &v46);
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v26 = (void *)v38;
        v39 = self->_loggingConnection;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v40 = v46;
          v29 = v39;
          v41 = CFSTR("Unknown");
          if (v40 <= 3)
            v41 = off_1E842E1C0[v40];
          v31 = v41;
          *(_DWORD *)buf = 138412547;
          *(_QWORD *)v52 = v31;
          *(_WORD *)&v52[8] = 2113;
          *(_QWORD *)&v52[10] = v26;
          v32 = v29;
          v33 = "Suggestion did collide (%@) with denied suggestion %{private}@";
          goto LABEL_35;
        }
LABEL_36:

        goto LABEL_37;
      }
      if (!-[PGSuggestionSession suggestion:collidesWithMemories:](self, "suggestion:collidesWithMemories:", v23, self->_collidableMemories))goto LABEL_18;
LABEL_37:
      v21 = v19 + v21;
      ++v22;
    }
    while (v18 != v22);
    v42 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    v18 = v42;
    if (v42)
      continue;
    break;
  }
LABEL_42:

  if (v10 && CFAbsoluteTimeGetCurrent() - v11 >= 0.01 && (LOBYTE(v46) = 0, v10[2](v10, &v46, 1.0), (_BYTE)v46))
  {
    v8 = v44;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v52 = 505;
      *(_WORD *)&v52[4] = 2080;
      *(_QWORD *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/PGSuggestionSession.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v13 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v13 = v14;
LABEL_52:
    v8 = v44;
  }

LABEL_54:
  return v13;
}

- (id)bestSuggestionBetween:(id)a3 and:(id)a4
{
  return a3;
}

- (id)suggesterClasses
{
  return (id)objc_msgSend((id)objc_opt_class(), "suggesterClassesWithProfile:", self->_profile);
}

- (BOOL)suggesterClass:(Class)a3 supportsOptions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "suggestionTypeWhitelist");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionTypeBlocklist");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    -[objc_class suggestionTypes](a3, "suggestionTypes");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v6 && !objc_msgSend((id)v6, "pg_intersectsIndexSet:", v8)
      || v7 && (objc_msgSend((id)v7, "containsIndexes:", v8) & 1) != 0)
    {
      v9 = 0;
      goto LABEL_18;
    }

  }
  objc_msgSend(v5, "suggestionSubtypeWhitelist");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionSubtypeBlocklist");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v8 | v10)
  {
    -[objc_class suggestionSubtypes](a3, "suggestionSubtypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (!v8 || objc_msgSend((id)v8, "pg_intersectsIndexSet:", v11))
      && (!v10 || !objc_msgSend((id)v10, "containsIndexes:", v11));

  }
  else
  {
    v9 = 1;
  }

LABEL_18:
  return v9;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  double Current;
  char v8;
  id v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *universalToday;
  void *v14;
  OS_os_log *v15;
  uint64_t v16;
  uint64_t profile;
  unint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  double v25;
  char v26;
  void *v27;
  void *v28;
  NSObject *loggingConnection;
  void *v30;
  int v31;
  NSObject *v32;
  OS_os_log *v33;
  uint64_t v34;
  int v35;
  double v36;
  char v37;
  OS_os_log *v38;
  uint64_t v39;
  void (**v40)(void *, _BYTE *, double);
  void *v41;
  NSObject *v42;
  OS_os_log *v43;
  uint64_t v44;
  double v45;
  char v46;
  void *v48;
  id v49;
  id obj;
  id v51;
  void (**v52)(void *, _BYTE *, double);
  _QWORD v53[4];
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  _QWORD v58[4];
  void (**v59)(void *, _BYTE *, double);
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  double v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  char v69;
  uint64_t v70;
  double *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint8_t buf[4];
  _BYTE v79[18];
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v6 = a4;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = (double *)&v70;
  v72 = 0x2020000000;
  v73 = 0;
  v52 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v48 = v6;
  if (v52)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v71[3] >= 0.01)
    {
      v71[3] = Current;
      v69 = 0;
      v52[2](v52, &v69, 0.0);
      v8 = *((_BYTE *)v75 + 24) | v69;
      *((_BYTE *)v75 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v79 = 558;
          *(_WORD *)&v79[4] = 2080;
          *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v9 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_60;
      }
    }
  }
  v10 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v51, "localToday");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "universalDateFromLocalDate:", v11);
  v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  universalToday = self->_universalToday;
  self->_universalToday = v12;

  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGSuggestionSession suggesterClasses](self, "suggesterClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v14, "count");
    profile = self->_profile;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v79 = v16;
    *(_WORD *)&v79[8] = 2048;
    *(_QWORD *)&v79[10] = profile;
    _os_log_impl(&dword_1CA237000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Querying %lu Suggesters for profile %lu", buf, 0x16u);
  }

  v18 = objc_msgSend(v14, "count");
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v14;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
  if (!v19)
    goto LABEL_34;
  v20 = 0.5 / (double)v18;
  v21 = *(_QWORD *)v66;
  v22 = 0.0;
  while (2)
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v66 != v21)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
      if (v52)
      {
        v25 = CFAbsoluteTimeGetCurrent();
        if (v25 - v71[3] >= 0.01)
        {
          v71[3] = v25;
          v69 = 0;
          v52[2](v52, &v69, v22);
          v26 = *((_BYTE *)v75 + 24) | v69;
          *((_BYTE *)v75 + 24) = v26;
          if (v26)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v79 = 571;
              *(_WORD *)&v79[4] = 2080;
              *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/PGSuggestionSession.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_48:

            goto LABEL_49;
          }
        }
      }
      v27 = (void *)MEMORY[0x1CAA4EB2C]();
      if (-[PGSuggestionSession suggesterClass:supportsOptions:](self, "suggesterClass:supportsOptions:", v24, v51))
      {
        objc_msgSend(v24, "suggesterWithSession:", self);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v79 = v24;
          *(_WORD *)&v79[8] = 2112;
          *(_QWORD *)&v79[10] = v28;
          _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Querying Suggester of class %@ - %@", buf, 0x16u);
        }
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke;
        v58[3] = &unk_1E84311C8;
        v59 = v52;
        v60 = &v70;
        v63 = v22;
        v64 = v20;
        v62 = 0x3F847AE147AE147BLL;
        v61 = &v74;
        objc_msgSend(v28, "suggestionsWithOptions:progress:", v51, v58);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *((unsigned __int8 *)v75 + 24);
        if (*((_BYTE *)v75 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v79 = 584;
            *(_WORD *)&v79[4] = 2080;
            *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/PGSuggestionSession.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          v33 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = objc_msgSend(v30, "count");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)v79 = v34;
            *(_WORD *)&v79[8] = 2112;
            *(_QWORD *)&v79[10] = v24;
            v80 = 2112;
            v81 = v28;
            _os_log_impl(&dword_1CA237000, (os_log_t)v33, OS_LOG_TYPE_DEFAULT, "Added %lu suggestions from suggester of class %@ - %@", buf, 0x20u);
          }

          objc_msgSend(v49, "addObjectsFromArray:", v30);
        }

        if (v31)
        {
          v35 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        v32 = self->_loggingConnection;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v79 = v24;
          _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEFAULT, "Suggester class %@ doesn't support passed options", buf, 0xCu);
        }
      }
      v35 = 1;
LABEL_31:
      objc_autoreleasePoolPop(v27);
      if (!v35)
        goto LABEL_48;
      v22 = v20 + v22;
    }
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
    if (v19)
      continue;
    break;
  }
LABEL_34:

  if (!v52
    || (v36 = CFAbsoluteTimeGetCurrent(), v36 - v71[3] < 0.01)
    || (v71[3] = v36,
        v69 = 0,
        v52[2](v52, &v69, 0.5),
        v37 = *((_BYTE *)v75 + 24) | v69,
        (*((_BYTE *)v75 + 24) = v37) == 0))
  {
    v38 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v49, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v79 = v39;
      _os_log_impl(&dword_1CA237000, (os_log_t)v38, OS_LOG_TYPE_DEFAULT, "Got %lu suggestions in total, running elections.", buf, 0xCu);
    }

    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke_194;
    v53[3] = &unk_1E8434F30;
    v40 = v52;
    v54 = v40;
    v55 = &v70;
    v56 = &v74;
    v57 = 0x3F847AE147AE147BLL;
    -[PGSuggestionSession electedSuggestionsFromSuggestions:options:progress:](self, "electedSuggestionsFromSuggestions:options:progress:", v49, v51, v53);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v75 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v79 = 605;
        *(_WORD *)&v79[4] = 2080;
        *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/PGSuggestionSession.m";
        v42 = MEMORY[0x1E0C81028];
LABEL_44:
        _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v43 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_msgSend(v41, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v79 = v44;
        _os_log_impl(&dword_1CA237000, (os_log_t)v43, OS_LOG_TYPE_DEFAULT, "Elected results: %lu", buf, 0xCu);
      }

      if (!v52
        || (v45 = CFAbsoluteTimeGetCurrent(), v45 - v71[3] < 0.01)
        || (v71[3] = v45,
            v69 = 0,
            v40[2](v40, &v69, 1.0),
            v46 = *((_BYTE *)v75 + 24) | v69,
            (*((_BYTE *)v75 + 24) = v46) == 0))
      {
        v9 = v41;
        goto LABEL_58;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v79 = 608;
        *(_WORD *)&v79[4] = 2080;
        *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/PGSuggestionSession.m";
        v42 = MEMORY[0x1E0C81028];
        goto LABEL_44;
      }
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_58:

    goto LABEL_59;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v79 = 598;
    *(_WORD *)&v79[4] = 2080;
    *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/PGSuggestionSession.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_49:
  v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_59:

LABEL_60:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  return v9;
}

- (id)activeSuggestersWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *loggingConnection;
  NSObject *v7;
  uint64_t v8;
  void *profile;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGSuggestionSession suggesterClasses](self, "suggesterClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = loggingConnection;
    v8 = objc_msgSend(v5, "count");
    profile = (void *)self->_profile;
    *(_DWORD *)buf = 134218240;
    v30 = v8;
    v31 = 2048;
    v32 = profile;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Querying %lu Suggesters for profile %lu", buf, 0x16u);

  }
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v25;
    *(_QWORD *)&v12 = 138412290;
    v22 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1CAA4EB2C]();
        if (-[PGSuggestionSession suggesterClass:supportsOptions:](self, "suggesterClass:supportsOptions:", v16, v4))
        {
          objc_msgSend(v16, "suggesterWithSession:", self);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = self->_loggingConnection;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v30 = (uint64_t)v16;
            v31 = 2112;
            v32 = v18;
            _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "Querying Suggester of class %@ - %@", buf, 0x16u);
          }
          objc_msgSend(v18, "startSuggestingWithOptions:", v4, v22);
          objc_msgSend(v23, "addObject:", v18);

        }
        else
        {
          v20 = self->_loggingConnection;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            v30 = (uint64_t)v16;
            _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_DEFAULT, "Suggester class %@ doesn't support passed options", buf, 0xCu);
          }
        }
        objc_autoreleasePoolPop(v17);
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  return v23;
}

- (id)coordinatedSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  double Current;
  char v6;
  NSObject *loggingConnection;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *universalToday;
  unint64_t v16;
  void *v17;
  double v18;
  char v19;
  void *v20;
  OS_os_log *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint32_t numer;
  uint32_t denom;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  uint32_t v40;
  uint32_t v41;
  NSObject *v42;
  NSObject *v43;
  OS_os_log *v44;
  uint64_t v45;
  double v46;
  char v47;
  uint64_t v49;
  os_signpost_id_t spid;
  unint64_t v51;
  id v52;
  NSObject *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  int v59;
  unint64_t v61;
  void (**v62)(void *, mach_timebase_info *, double);
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  _BYTE *v70;
  _QWORD v71[4];
  void (**v72)(void *, mach_timebase_info *, double);
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  mach_timebase_info v76;
  mach_timebase_info info;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  _BYTE buf[24];
  char v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v52 = a4;
  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  v85 = 0;
  v78 = 0;
  v79 = (double *)&v78;
  v80 = 0x2020000000;
  v81 = 0;
  v62 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v52);
  if (v62)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v79[3] >= 0.01)
    {
      v79[3] = Current;
      LOBYTE(info.numer) = 0;
      v62[2](v62, &info, 0.0);
      v6 = *((_BYTE *)v83 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v83 + 24) = v6;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 645;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v54 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_72;
      }
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Starting coordinated suggestion generation", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  v8 = loggingConnection;
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  spid = v9;
  v51 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CoordinatedSuggestionGeneration", ", buf, 2u);
  }
  v53 = v11;

  info = 0;
  mach_timebase_info(&info);
  v49 = mach_absolute_time();
  v12 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v57, "localToday");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "universalDateFromLocalDate:", v13);
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  universalToday = self->_universalToday;
  self->_universalToday = v14;

  -[PGSuggestionSession activeSuggestersWithOptions:](self, "activeSuggestersWithOptions:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v58, "count");
  v63 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v61);
  v55 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v16 = 0;
  v54 = (id)MEMORY[0x1E0C9AA60];
  while (objc_msgSend(v63, "count") < v61)
  {
    v17 = (void *)MEMORY[0x1CAA4EB2C]();
    if (v62
      && (v18 = CFAbsoluteTimeGetCurrent(), v18 - v79[3] >= 0.01)
      && (v79[3] = v18,
          LOBYTE(v76.numer) = 0,
          v62[2](v62, &v76, 0.5),
          v19 = *((_BYTE *)v83 + 24) | LOBYTE(v76.numer),
          (*((_BYTE *)v83 + 24) = v19) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 662;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/PGSuggestionSession.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if ((objc_msgSend(v63, "containsIndex:", v16) & 1) != 0)
        goto LABEL_53;
      objc_msgSend(v58, "objectAtIndexedSubscript:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_loggingConnection;
      v22 = os_signpost_id_generate((os_log_t)v21);
      v23 = v21;
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "NextSuggestion", ", buf, 2u);
      }

      v76 = 0;
      mach_timebase_info(&v76);
      v25 = mach_absolute_time();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke;
      v71[3] = &unk_1E8434F30;
      v72 = v62;
      v73 = &v78;
      v75 = 0x3F847AE147AE147BLL;
      v74 = &v82;
      objc_msgSend(v20, "nextSuggestionWithProgress:", v71);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *((unsigned __int8 *)v83 + 24);
      if (*((_BYTE *)v83 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 672;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        v27 = self->_loggingConnection;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412547;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v26;
          _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_DEFAULT, "Suggester %@ returned suggestion %{private}@", buf, 0x16u);
        }
        v28 = mach_absolute_time();
        numer = v76.numer;
        denom = v76.denom;
        v31 = v24;
        v32 = v31;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_END, v22, "NextSuggestion", ", buf, 2u);
        }

        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "NextSuggestion";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (float)((float)((float)((float)(v28 - v25) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        objc_msgSend(v20, "setLastSuggestionWasColliding:", 0);
        if (v26)
        {
          if ((objc_msgSend(v57, "ignoreCollisionsWithExistingSuggestions") & 1) != 0
            || !-[PGSuggestionSession _suggestionIsColliding:relaxCollisionRules:](self, "_suggestionIsColliding:relaxCollisionRules:", v26, objc_msgSend(v55, "containsIndex:", v16)))
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v87 = 1;
            if ((objc_msgSend(v57, "ignoreCollisionsWithSameBatchSuggestions") & 1) == 0 && objc_msgSend(v56, "count"))
            {
              v34 = objc_alloc_init(MEMORY[0x1E0CB3788]);
              v67[0] = MEMORY[0x1E0C809B0];
              v67[1] = 3221225472;
              v67[2] = __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_196;
              v67[3] = &unk_1E8428BC8;
              v67[4] = self;
              v68 = v26;
              v35 = v34;
              v69 = v35;
              v70 = buf;
              objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v67);
              if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) && objc_msgSend(v35, "count"))
              {
                v64[0] = MEMORY[0x1E0C809B0];
                v64[1] = 3221225472;
                v64[2] = __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_198;
                v64[3] = &unk_1E84348D0;
                v65 = v56;
                v66 = v63;
                objc_msgSend(v35, "enumerateIndexesUsingBlock:", v64);

              }
            }
            if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v26, v36);

              objc_msgSend(v63, "addIndex:", v16);
            }
            _Block_object_dispose(buf, 8);
            v33 = 0;
          }
          else
          {
            v33 = 1;
          }
          objc_msgSend(v20, "setLastSuggestionWasColliding:", v33);
        }
        else if (-[PGSuggestionSession supportsRelaxedCollisionRulesForSuggester:](self, "supportsRelaxedCollisionRulesForSuggester:", v20)&& (objc_msgSend(v55, "containsIndex:", v16) & 1) == 0)
        {
          objc_msgSend(v55, "addIndex:", v16);
          objc_msgSend(v20, "reset");
        }
        else
        {
          objc_msgSend(v63, "addIndex:", v16);
        }
      }

      if (!v59)
      {
LABEL_53:
        v16 = (v16 + 1) % v61;
        v37 = 1;
        goto LABEL_54;
      }
    }
    v37 = 0;
LABEL_54:
    objc_autoreleasePoolPop(v17);
    if ((v37 & 1) == 0)
      goto LABEL_71;
  }
  objc_msgSend(v56, "allValues");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = mach_absolute_time();
  v40 = info.numer;
  v41 = info.denom;
  v42 = v53;
  v43 = v42;
  if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v43, OS_SIGNPOST_INTERVAL_END, spid, "CoordinatedSuggestionGeneration", ", buf, 2u);
  }

  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CoordinatedSuggestionGeneration";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v39 - v49) * (float)v40) / (float)v41) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v44 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v45;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v38;
    _os_log_impl(&dword_1CA237000, (os_log_t)v44, OS_LOG_TYPE_DEFAULT, "Generated %lu suggestions:\n%@", buf, 0x16u);
  }

  if (v62
    && (v46 = CFAbsoluteTimeGetCurrent(), v46 - v79[3] >= 0.01)
    && (v79[3] = v46,
        LOBYTE(v76.numer) = 0,
        v62[2](v62, &v76, 1.0),
        v47 = *((_BYTE *)v83 + 24) | LOBYTE(v76.numer),
        (*((_BYTE *)v83 + 24) = v47) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 755;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/PGSuggestionSession.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v54 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v54 = v38;
  }

LABEL_71:
LABEL_72:
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

  return v54;
}

- (id)uncoordinatedSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v5;
  double Current;
  char v7;
  NSObject *loggingConnection;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *universalToday;
  uint64_t v17;
  uint64_t v18;
  double v19;
  char v20;
  NSObject *v21;
  int v22;
  void *v23;
  OS_os_log *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint32_t numer;
  uint32_t denom;
  NSObject *v36;
  NSObject *v37;
  PGSuggestionSession *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  unint64_t v46;
  NSObject *v47;
  NSObject *v48;
  __CFString *v49;
  __CFString *v50;
  NSObject *v51;
  uint64_t v52;
  uint32_t v53;
  uint32_t v54;
  NSObject *v55;
  NSObject *v56;
  OS_os_log *v57;
  uint64_t v58;
  double v59;
  char v60;
  id v62;
  uint64_t v63;
  os_signpost_id_t spid;
  unint64_t v65;
  id v66;
  NSObject *v67;
  id v68;
  id v69;
  void *v70;
  unint64_t v71;
  id v72;
  unint64_t v73;
  id v74;
  unint64_t v75;
  void *context;
  void (**v77)(void *, mach_timebase_info *, double);
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  void (**v84)(void *, mach_timebase_info *, double);
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  mach_timebase_info v88;
  mach_timebase_info info;
  uint64_t v90;
  double *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  char v97;
  uint8_t v98[128];
  uint8_t buf[4];
  _BYTE v100[18];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v66 = a4;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v90 = 0;
  v91 = (double *)&v90;
  v92 = 0x2020000000;
  v93 = 0;
  v77 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v66);
  if (v77)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v91[3] >= 0.01)
    {
      v91[3] = Current;
      LOBYTE(info.numer) = 0;
      v77[2](v77, &info, 0.0);
      v7 = *((_BYTE *)v95 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v95 + 24) = v7;
      if (v7)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v100 = 763;
          *(_WORD *)&v100[4] = 2080;
          *(_QWORD *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/PGSuggestionSession.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v68 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_94;
      }
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Starting uncoordinated suggestion generation", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  v9 = loggingConnection;
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  spid = v10;
  v65 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UncoordinatedSuggestionGeneration", ", buf, 2u);
  }
  v67 = v12;

  info = 0;
  mach_timebase_info(&info);
  v63 = mach_absolute_time();
  v13 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v5, "localToday");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "universalDateFromLocalDate:", v14);
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  universalToday = self->_universalToday;
  self->_universalToday = v15;

  -[PGSuggestionSession activeSuggestersWithOptions:](self, "activeSuggestersWithOptions:", v5);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v70, "count");
  v17 = objc_msgSend(v5, "maximumNumberOfSuggestions");
  if (v17)
    v18 = v17;
  else
    v18 = -1;
  v71 = v18;
  v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v72 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v69 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v75 = 0;
  v68 = (id)MEMORY[0x1E0C9AA60];
  while (objc_msgSend(v74, "count") < v71 && objc_msgSend(v72, "count") < v73)
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    if (v77)
    {
      v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v91[3] >= 0.01)
      {
        v91[3] = v19;
        LOBYTE(v88.numer) = 0;
        v77[2](v77, &v88, 0.5);
        v20 = *((_BYTE *)v95 + 24) | LOBYTE(v88.numer);
        *((_BYTE *)v95 + 24) = v20;
        if (v20)
        {
          v21 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v100 = 781;
            *(_WORD *)&v100[4] = 2080;
            *(_QWORD *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Suggestions/PGSuggestionSession.m";
            _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v22 = 1;
          goto LABEL_76;
        }
      }
    }
    objc_msgSend(v70, "objectAtIndexedSubscript:", v75);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = self->_loggingConnection;
    v25 = os_signpost_id_generate((os_log_t)v24);
    v26 = v24;
    v27 = v26;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "NextSuggestion", ", buf, 2u);
    }
    v28 = v27;

    v88 = 0;
    mach_timebase_info(&v88);
    v29 = mach_absolute_time();
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __68__PGSuggestionSession_uncoordinatedSuggestionsWithOptions_progress___block_invoke;
    v83[3] = &unk_1E8434F30;
    v84 = v77;
    v85 = &v90;
    v87 = 0x3F847AE147AE147BLL;
    v86 = &v94;
    objc_msgSend(v23, "nextSuggestionWithProgress:", v83);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v95 + 24))
    {
      v22 = 1;
      v31 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v100 = 789;
        *(_WORD *)&v100[4] = 2080;
        *(_QWORD *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/PGSuggestionSession.m";
        _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_74;
    }
    v32 = self->_loggingConnection;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412547;
      *(_QWORD *)v100 = v23;
      *(_WORD *)&v100[8] = 2113;
      *(_QWORD *)&v100[10] = v30;
      _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEFAULT, "Suggester %@ returned suggestion %{private}@", buf, 0x16u);
    }
    v33 = mach_absolute_time();
    numer = v88.numer;
    denom = v88.denom;
    v36 = v28;
    v37 = v36;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v37, OS_SIGNPOST_INTERVAL_END, v25, "NextSuggestion", ", buf, 2u);
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v100 = "NextSuggestion";
      *(_WORD *)&v100[8] = 2048;
      *(double *)&v100[10] = (float)((float)((float)((float)(v33 - v29) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    objc_msgSend(v23, "setLastSuggestionWasColliding:", 0);
    v38 = self;
    if (v30)
    {
      if ((objc_msgSend(v5, "ignoreCollisionsWithExistingSuggestions") & 1) == 0
        && -[PGSuggestionSession _suggestionIsColliding:relaxCollisionRules:](self, "_suggestionIsColliding:relaxCollisionRules:", v30, objc_msgSend(v69, "containsIndex:", v75)))
      {
        v39 = 1;
        v40 = v30;
LABEL_64:
        v30 = 0;
        goto LABEL_70;
      }
      if ((objc_msgSend(v5, "ignoreCollisionsWithSameBatchSuggestions") & 1) != 0)
      {
        v39 = 0;
      }
      else
      {
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v40 = v74;
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
        if (v42)
        {
          v62 = v5;
          v43 = *(_QWORD *)v80;
          while (2)
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v80 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
              v46 = -[PGSuggestionSession reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:](v38, "reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:", v30, v45, 0);
              v47 = v38->_loggingConnection;
              if (v46)
              {
                v48 = v47;
                v5 = v62;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = CFSTR("Unknown");
                  if (v46 <= 3)
                    v49 = off_1E842E1C0[v46];
                  v50 = v49;
                  *(_DWORD *)buf = 138412547;
                  *(_QWORD *)v100 = v50;
                  *(_WORD *)&v100[8] = 2113;
                  *(_QWORD *)&v100[10] = v45;
                  _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_DEFAULT, "Suggestion did collide (%@) with same batch suggestion %{private}@", buf, 0x16u);

                }
                v39 = 0;
                goto LABEL_64;
              }
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                *(_QWORD *)v100 = v45;
                _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_DEFAULT, "Suggestion didn't collide with same batch suggestion %{private}@", buf, 0xCu);
              }
              v38 = self;
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
            if (v42)
              continue;
            break;
          }
          v39 = 0;
          v5 = v62;
        }
        else
        {
          v39 = 0;
        }
LABEL_70:

      }
      objc_msgSend(v23, "setLastSuggestionWasColliding:", v39);
      if (!v30)
      {
        v22 = 0;
        goto LABEL_75;
      }
      objc_msgSend(v74, "addObject:", v30);
      goto LABEL_73;
    }
    if (-[PGSuggestionSession supportsRelaxedCollisionRulesForSuggester:](self, "supportsRelaxedCollisionRulesForSuggester:", v23)&& (objc_msgSend(v69, "containsIndex:", v75) & 1) == 0)
    {
      v51 = self->_loggingConnection;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v100 = v23;
        _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_DEFAULT, "No more suggestions for suggester %@, trying with relaxed collision rules", buf, 0xCu);
      }
      objc_msgSend(v69, "addIndex:", v75);
      objc_msgSend(v23, "reset");
    }
    else
    {
      v41 = self->_loggingConnection;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v100 = v23;
        _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_DEFAULT, "No more suggestions for suggester %@", buf, 0xCu);
      }
      objc_msgSend(v72, "addIndex:", v75);
    }
    v30 = 0;
LABEL_73:
    v22 = 0;
    v75 = (v75 + 1) % v73;
LABEL_74:

LABEL_75:
LABEL_76:
    objc_autoreleasePoolPop(context);
    if (v22)
      goto LABEL_93;
  }
  v52 = mach_absolute_time();
  v53 = info.numer;
  v54 = info.denom;
  v55 = v67;
  v56 = v55;
  if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v56, OS_SIGNPOST_INTERVAL_END, spid, "UncoordinatedSuggestionGeneration", ", buf, 2u);
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v100 = "UncoordinatedSuggestionGeneration";
    *(_WORD *)&v100[8] = 2048;
    *(double *)&v100[10] = (float)((float)((float)((float)(v52 - v63) * (float)v53) / (float)v54) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v57 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = objc_msgSend(v74, "count");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v100 = v58;
    *(_WORD *)&v100[8] = 2112;
    *(_QWORD *)&v100[10] = v74;
    _os_log_impl(&dword_1CA237000, (os_log_t)v57, OS_LOG_TYPE_DEFAULT, "Generated %lu suggestions:\n%@", buf, 0x16u);
  }

  if (v77
    && (v59 = CFAbsoluteTimeGetCurrent(), v59 - v91[3] >= 0.01)
    && (v91[3] = v59,
        LOBYTE(v88.numer) = 0,
        v77[2](v77, &v88, 1.0),
        v60 = *((_BYTE *)v95 + 24) | LOBYTE(v88.numer),
        (*((_BYTE *)v95 + 24) = v60) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v100 = 860;
      *(_WORD *)&v100[4] = 2080;
      *(_QWORD *)&v100[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/PGSuggestionSession.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v68 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v68 = v74;
  }
LABEL_93:

LABEL_94:
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);

  return v68;
}

- (BOOL)_suggestionIsColliding:(id)a3 relaxCollisionRules:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *loggingConnection;
  _BOOL4 v9;
  unint64_t v10;
  NSObject *v11;
  __CFString *v12;
  NSObject *v13;
  _BOOL4 v14;
  unint64_t v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  BOOL v21;
  unint64_t v23;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  -[PGSuggestionSession anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:](self, "anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:", v6, self->_existingSuggestions, v4, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  v9 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = v23;
      v11 = loggingConnection;
      if (v10 > 3)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1E842E1C0[v10];
      v17 = v12;
      *(_DWORD *)buf = 138412547;
      v25 = v17;
      v26 = 2113;
      v27 = v7;
      v18 = "Suggestion did collide (%@) with existing suggestion %{private}@";
      v19 = v11;
      v20 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_1CA237000, v19, v20, v18, buf, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Suggestion didn't collide with any existing suggestion", buf, 2u);
  }
  -[PGSuggestionSession anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:](self, "anySuggestionCollidingWithSuggestion:inSuggestions:relaxCollisionRules:collisionReason:", v6, self->_deniedSuggestions, 0, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_loggingConnection;
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v14)
    {
      v15 = v23;
      v11 = v13;
      if (v15 > 3)
        v16 = CFSTR("Unknown");
      else
        v16 = off_1E842E1C0[v15];
      v17 = v16;
      *(_DWORD *)buf = 138412547;
      v25 = v17;
      v26 = 2113;
      v27 = v7;
      v18 = "Suggestion did collide (%@) with denied suggestion %{private}@";
      v19 = v11;
      v20 = OS_LOG_TYPE_INFO;
      goto LABEL_18;
    }
LABEL_19:

    v21 = 1;
    goto LABEL_20;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Suggestion didn't collide with any denied suggestion", buf, 2u);
  }
  v21 = 0;
LABEL_20:

  return v21;
}

- (double)topTierAestheticScore
{
  double result;
  void *v4;
  NSObject *v5;
  void *v6;
  double v7;
  uint8_t v8[8];
  _QWORD v9[5];

  result = self->_topTierAestheticScore;
  if (result == 2.22507386e-308)
  {
    -[PGSuggestionSession workingContext](self, "workingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__PGSuggestionSession_topTierAestheticScore__block_invoke;
    v9[3] = &unk_1E84353C0;
    v9[4] = self;
    objc_msgSend(v4, "performSynchronousConcurrentGraphReadUsingBlock:", v9);

    if (self->_topTierAestheticScore == 2.22507386e-308)
    {
      -[PGSuggestionSession loggingConnection](self, "loggingConnection");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_DEFAULT, "topTierAestheticScore could not be determined from the graph, computing it from the photoLibrary.", v8, 2u);
      }

      -[PGSuggestionSession photoLibrary](self, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphBuilder topTierAestheticScoreForRatio:inPhotoLibrary:](PGGraphBuilder, "topTierAestheticScoreForRatio:inPhotoLibrary:", v6, 0.01);
      self->_topTierAestheticScore = v7;

    }
    return self->_topTierAestheticScore;
  }
  return result;
}

- (BOOL)suggestion:(id)a3 isEqualToSuggestion:(id)a4
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
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  char v37;
  char v38;
  char v39;
  void *v40;
  char v41;
  BOOL v42;
  char v43;
  char v44;
  id v46;
  char v47;
  int v48;
  int v49;
  int v50;
  int v51;

  v6 = a3;
  v7 = a4;
  v51 = objc_msgSend(v6, "type");
  v50 = objc_msgSend(v7, "type");
  v49 = objc_msgSend(v6, "subtype");
  v48 = objc_msgSend(v7, "subtype");
  objc_msgSend(v6, "keyAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "count");
  if (!v9)
  {
    objc_msgSend(v7, "keyAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
    {
      v47 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "keyAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v10, "isEqualToArray:", v11);

  if (!v9)
    goto LABEL_6;
LABEL_7:

  objc_msgSend(v6, "representativeAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "count");
  if (!v13)
  {
    objc_msgSend(v7, "representativeAssets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count"))
    {
      v16 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  objc_msgSend(v6, "representativeAssets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "representativeAssets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToArray:", v15);

  if (!v13)
    goto LABEL_12;
LABEL_13:

  objc_msgSend(v6, "features");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18
    || (objc_msgSend(v7, "features"), v13 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v13, "count")))
  {
    objc_msgSend(v6, "features");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "features");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToSet:", v20);

    if (v18)
      goto LABEL_19;
  }
  else
  {
    v21 = 1;
  }

LABEL_19:
  objc_msgSend(v6, "suggestedPersonLocalIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v7, "suggestedPersonLocalIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v6, "suggestedPersonLocalIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "suggestedPersonLocalIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToArray:", v25);

    }
    else
    {
      v26 = 1;
    }

  }
  else
  {
    v26 = 1;
  }

  objc_msgSend(v6, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 == v28)
  {
    v31 = 1;
  }
  else
  {
    objc_msgSend(v6, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqualToString:", v30);

  }
  objc_msgSend(v6, "subtitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32 == v33)
  {
    v41 = 1;
  }
  else
  {
    objc_msgSend(v6, "subtitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtitle");
    v46 = v6;
    v35 = v7;
    v36 = v31;
    v37 = v26;
    v38 = v21;
    v39 = v16;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v34, "isEqualToString:", v40);

    v16 = v39;
    v21 = v38;
    v26 = v37;
    v31 = v36;
    v7 = v35;
    v6 = v46;

  }
  v42 = v51 == v50 && v49 == v48;
  v43 = v47;
  if (!v42)
    v43 = 0;
  v44 = v43 & v16 & v21 & v26 & v31 & v41;

  return v44;
}

- (id)infoWithSuggestion:(id)a3
{
  id v3;
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
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v3, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("subtype");
  v23[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v3, "subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isInvalid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isInvalid"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("uuid"));

  }
  objc_msgSend(v3, "universalStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("universalStartDate"));

  objc_msgSend(v3, "universalEndDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("universalEndDate"));

  objc_msgSend(v3, "keyAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("keyAssetUUID"));

    objc_msgSend(v13, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("keyAssetCreationDate"));

  }
  objc_msgSend(v3, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("creationDate"));

  objc_msgSend(v3, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("title"));

  objc_msgSend(v3, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("subtitle"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "reasons");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("reasons"));

    }
  }

  return v7;
}

- (id)infosWithSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __CFString *v14;
  unint64_t v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
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
  v4 = a3;
  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v32;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v5);
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        -[NSArray reverseObjectEnumerator](self->_existingSuggestions, "reverseObjectEnumerator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        v25 = v5;
        if (!v8)
        {
          v10 = 0;
          goto LABEL_24;
        }
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(v7);
            v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (-[PGSuggestionSession suggestion:isEqualToSuggestion:](self, "suggestion:isEqualToSuggestion:", v6, v13))
            {
              -[PGSuggestionSession infoWithSuggestion:](self, "infoWithSuggestion:", v13);
              v14 = v10;
              v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v15 = -[PGSuggestionSession reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:](self, "reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:", v6, v13, 0);
              if (!v15)
                continue;
              v16 = CFSTR("Unknown");
              if (v15 <= 3)
                v16 = off_1E842E1C0[v15];
              v14 = v16;
              objc_msgSend(v26, "objectForKeyedSubscript:", v14);
              v17 = (id)objc_claimAutoreleasedReturnValue();
              if (!v17)
              {
                v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, v14);
              }
              -[PGSuggestionSession infoWithSuggestion:](self, "infoWithSuggestion:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v18);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v9);
LABEL_24:

        -[PGSuggestionSession infoWithSuggestion:](self, "infoWithSuggestion:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, CFSTR("identicalExistingSuggestionInfo"));
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("suggestionsByCollisionReason"));
        objc_msgSend(v23, "addObject:", v19);

        v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v24);
  }

  return v23;
}

- (id)existingSuggestionsWithState:(unsigned __int16)a3 count:(unint64_t)a4
{
  int v5;
  unint64_t v7;
  unint64_t v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = -[NSArray count](self->_existingSuggestions, "count");
  if (v7 >= a4)
    v8 = a4;
  else
    v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_existingSuggestions;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
      if (objc_msgSend(v15, "state", (_QWORD)v17) == v5)
      {
        objc_msgSend(v9, "addObject:", v15);
        if (objc_msgSend(v9, "count") >= v8)
          break;
      }
      if (v12 == ++v14)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          goto LABEL_6;
        break;
      }
    }
  }

  return v9;
}

- (unsigned)profile
{
  return self->_profile;
}

- (PGManagerWorkingContext)workingContext
{
  return self->_workingContext;
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (NSArray)existingSuggestions
{
  return self->_existingSuggestions;
}

- (NSArray)collidableMemories
{
  return self->_collidableMemories;
}

- (void)setCollidableMemories:(id)a3
{
  objc_storeStrong((id *)&self->_collidableMemories, a3);
}

- (PGSuggestionNotificationProfile)notificationProfile
{
  return self->_notificationProfile;
}

- (NSArray)deniedSuggestions
{
  return self->_deniedSuggestions;
}

- (void)setDeniedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_deniedSuggestions, a3);
}

- (NSSet)forbiddenAssetUUIDs
{
  return self->_forbiddenAssetUUIDs;
}

- (void)setForbiddenAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_forbiddenAssetUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_deniedSuggestions, 0);
  objc_storeStrong((id *)&self->_notificationProfile, 0);
  objc_storeStrong((id *)&self->_collidableMemories, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
  objc_storeStrong((id *)&self->_universalToday, 0);
}

void __44__PGSuggestionSession_topTierAestheticScore__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topTierAestheticScore");
  v6 = v5;

  if (v6 > 0.0)
    *(double *)(*(_QWORD *)(a1 + 32) + 88) = v6;
}

void __68__PGSuggestionSession_uncoordinatedSuggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_196(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  __CFString *v8;
  unint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  int v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(*(id *)(a1 + 32), "reasonForSuggestion:collidingWithSuggestion:relaxCollisionRules:", *(_QWORD *)(a1 + 40), v8, 0);
  v10 = *(_QWORD **)(a1 + 32);
  v11 = v10[5];
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      v13 = v11;
      if (v9 > 3)
        v14 = CFSTR("Unknown");
      else
        v14 = off_1E842E1C0[v9];
      v15 = v14;
      v17 = 138412547;
      v18 = v15;
      v19 = 2113;
      v20 = v8;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "Suggestion did collide (%@) with same batch suggestion %{private}@", (uint8_t *)&v17, 0x16u);

      v10 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v10, "bestSuggestionBetween:and:", v8, *(_QWORD *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == *(void **)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v7, "unsignedIntegerValue"));
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }

  }
  else if (v12)
  {
    v17 = 138477827;
    v18 = v8;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "Suggestion didn't collide with same batch suggestion %{private}@", (uint8_t *)&v17, 0xCu);
  }

}

uint64_t __66__PGSuggestionSession_coordinatedSuggestionsWithOptions_progress___block_invoke_198(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  return objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a2);
}

void __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72) * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __55__PGSuggestionSession_suggestionsWithOptions_progress___block_invoke_194(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)suggesterClassesWithProfile:(unsigned __int8)a3
{
  void *v3;
  uint64_t *v4;
  id result;
  uint64_t v6;
  _QWORD v7[4];
  _QWORD v8[6];
  uint64_t v9;
  _QWORD v10[10];
  _QWORD v11[2];
  uint64_t v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0u:
      v13[0] = objc_opt_class();
      v13[1] = objc_opt_class();
      v13[2] = objc_opt_class();
      v13[3] = objc_opt_class();
      v13[4] = objc_opt_class();
      v13[5] = objc_opt_class();
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = v13;
      goto LABEL_10;
    case 1u:
      v11[0] = objc_opt_class();
      v11[1] = objc_opt_class();
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = v11;
      v6 = 2;
      goto LABEL_12;
    case 2u:
      v10[0] = objc_opt_class();
      v10[1] = objc_opt_class();
      v10[2] = objc_opt_class();
      v10[3] = objc_opt_class();
      v10[4] = objc_opt_class();
      v10[5] = objc_opt_class();
      v10[6] = objc_opt_class();
      v10[7] = objc_opt_class();
      v10[8] = objc_opt_class();
      v10[9] = objc_opt_class();
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = v10;
      v6 = 10;
      goto LABEL_12;
    case 3u:
      v9 = objc_opt_class();
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v9;
      goto LABEL_7;
    case 4u:
      v12 = objc_opt_class();
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v12;
LABEL_7:
      v6 = 1;
      goto LABEL_12;
    case 5u:
      v8[0] = objc_opt_class();
      v8[1] = objc_opt_class();
      v8[2] = objc_opt_class();
      v8[3] = objc_opt_class();
      v8[4] = objc_opt_class();
      v8[5] = objc_opt_class();
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = v8;
LABEL_10:
      v6 = 6;
      goto LABEL_12;
    case 6u:
      v7[0] = objc_opt_class();
      v7[1] = objc_opt_class();
      v7[2] = objc_opt_class();
      v7[3] = objc_opt_class();
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = v7;
      v6 = 4;
LABEL_12:
      objc_msgSend(v3, "arrayWithObjects:count:", v4, v6);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)suggestionTypesWithProfile:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggesterClassesWithProfile:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "suggestionTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addIndexes:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)suggestionSubtypesWithProfile:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggesterClassesWithProfile:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "suggestionSubtypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addIndexes:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)availableSuggestionTypeInfosWithProfile:(unsigned __int8)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "suggesterClassesWithProfile:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "suggestionTypes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "suggestionSubtypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke;
        v17[3] = &unk_1E84348D0;
        v18 = v14;
        v19 = v5;
        v15 = v14;
        objc_msgSend(v13, "enumerateIndexesUsingBlock:", v17);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v5;
}

void __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  PHSuggestionStringWithType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke_2;
  v7[3] = &unk_1E8428BA0;
  v8 = v4;
  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6 = v4;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v7);

}

void __63__PGSuggestionSession_availableSuggestionTypeInfosWithProfile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  PHSuggestionStringWithSubtype();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), *(_QWORD *)(a1 + 32), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[0] = CFSTR("uuid");
  v9[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  v9[2] = CFSTR("subtype");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5);
}

@end
