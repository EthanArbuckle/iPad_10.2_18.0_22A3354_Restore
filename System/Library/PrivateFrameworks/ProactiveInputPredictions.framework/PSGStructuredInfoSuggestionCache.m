@implementation PSGStructuredInfoSuggestionCache

- (PSGStructuredInfoSuggestionCache)initWithTTLSeconds:(double)a3
{
  PSGStructuredInfoSuggestionCache *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGStructuredInfoSuggestionCache;
  result = -[PSGStructuredInfoSuggestionCache init](&v5, sel_init);
  if (result)
    result->_ttlSeconds = a3;
  return result;
}

- (void)addStructuredInfoSuggestions:(id)a3 localeIdentifier:(id)a4
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
  char v15;
  void *v16;
  void *v17;
  void *v18;
  _PASTuple2 *v19;
  _PASTuple2 *cachedSuggestions;
  NSDate *v21;
  NSDate *startTime;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  id obj;
  id v27;
  uint8_t buf[2];
  __int16 v29;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    psg_default_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_11;
    }
    v29 = 0;
    v24 = "Trying to add empty structured info array to cache.";
    v25 = (uint8_t *)&v29;
LABEL_13:
    _os_log_error_impl(&dword_1DBD27000, v23, OS_LOG_TYPE_ERROR, v24, v25, 2u);
    goto LABEL_10;
  }
  obj = a4;
  v27 = v7;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v8 = 1;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "proactiveTrigger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "triggerAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "proactiveTrigger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "triggerAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "isEqualToDictionary:", v14);

      if ((v15 & 1) == 0)
        break;
      if (++v8 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_6;
    }
    psg_default_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    v7 = v27;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v24 = "Trigger is inconsistent for the structured info array.";
    v25 = buf;
    goto LABEL_13;
  }
LABEL_6:
  v16 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(v6, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "proactiveTrigger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tupleWithFirst:second:", v18, v6);
  v19 = (_PASTuple2 *)objc_claimAutoreleasedReturnValue();
  cachedSuggestions = self->_cachedSuggestions;
  self->_cachedSuggestions = v19;

  objc_storeStrong((id *)&self->_localeIdentifier, obj);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v21;

  v7 = v27;
LABEL_11:

}

- (void)addEmptyPlaceholderForTrigger:(id)a3 localeIdentifier:(id)a4
{
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  _PASTuple2 *v10;
  _PASTuple2 *cachedSuggestions;
  NSString *localeIdentifier;
  NSDate *v13;
  NSDate *startTime;
  NSString *v15;

  v6 = (NSString *)a4;
  v7 = (void *)MEMORY[0x1E0D81638];
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "emptySuggestionsPlaceholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tupleWithFirst:second:", v8, v9);
  v10 = (_PASTuple2 *)objc_claimAutoreleasedReturnValue();

  cachedSuggestions = self->_cachedSuggestions;
  self->_cachedSuggestions = v10;

  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v6;
  v15 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v13;

}

- (id)searchWithTrigger:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  PSGStructuredInfoSuggestion *v32;
  void *v33;
  void *v34;
  PSGStructuredInfoSuggestion *v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[PSGStructuredInfoSuggestionCache _isCacheEmpty](self, "_isCacheEmpty")
    && objc_msgSend(v9, "isEqualToString:", self->_localeIdentifier)
    && !-[PSGStructuredInfoSuggestionCache _maybeClearCache](self, "_maybeClearCache"))
  {
    -[_PASTuple2 first](self->_cachedSuggestions, "first");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triggerAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "triggerAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToDictionary:", v14);

    if (v15)
    {
      psg_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DBD27000, v16, OS_LOG_TYPE_DEBUG, "[StructuredInfoCache] Exact trigger match", buf, 2u);
      }

      -[_PASTuple2 second](self->_cachedSuggestions, "second");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    objc_msgSend(v8, "triggerCategory");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v18 == CFSTR("TaggedTextFieldContactsAutocomplete"))
    {
      -[_PASTuple2 first](self->_cachedSuggestions, "first");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "triggerCategory");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v20 == CFSTR("TaggedTextFieldContactsAutocomplete"))
      {
        objc_msgSend(v8, "triggerAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSGProactiveTrigger getSearchTerm:](PSGProactiveTrigger, "getSearchTerm:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        +[PSGProactiveTrigger getSearchTerm:](PSGProactiveTrigger, "getSearchTerm:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length")
          && objc_msgSend(v24, "length")
          && objc_msgSend(v23, "hasPrefix:", v24))
        {
          psg_default_log_handle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1DBD27000, v25, OS_LOG_TYPE_DEBUG, "[StructuredInfoCache] Partial trigger match for Contacts Autocomplete", buf, 2u);
          }

          -[_PASTuple2 second](self->_cachedSuggestions, "second");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "emptySuggestionsPlaceholder");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 == v27)
          {
            -[_PASTuple2 second](self->_cachedSuggestions, "second");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = 0;
LABEL_20:

            goto LABEL_5;
          }
          v38 = v24;
          v17 = (void *)objc_opt_new();
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          -[_PASTuple2 second](self->_cachedSuggestions, "second");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v42)
          {
            v41 = *(_QWORD *)v44;
            v39 = v23;
            while (2)
            {
              for (i = 0; i != v42; ++i)
              {
                if (*(_QWORD *)v44 != v41)
                  objc_enumerationMutation(obj);
                v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_msgSend(v29, "portraitItem");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "name");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v31, "length"))
                {
                  if (_PASInsensitiveStringContainsString())
                  {
                    v32 = [PSGStructuredInfoSuggestion alloc];
                    objc_msgSend(v29, "portraitItem");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "operationalItem");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:](v32, "initWithProactiveTrigger:portraitItem:operationalItem:", v8, v33, v34);

                    objc_msgSend(v17, "addObject:", v35);
                    v36 = objc_msgSend(v17, "count");

                    v37 = v36 == a5;
                    v23 = v39;
                    if (v37)
                    {

                      goto LABEL_42;
                    }
                  }
                }

              }
              v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
              if (v42)
                continue;
              break;
            }
          }
LABEL_42:

          v24 = v38;
        }
        else
        {
          v17 = 0;
        }

LABEL_14:
        if (objc_msgSend(v17, "count"))
        {
          if (objc_msgSend(v17, "count") <= a5)
          {
            v21 = v17;
            v17 = v21;
          }
          else
          {
            objc_msgSend(v17, "subarrayWithRange:", 0, a5);
            v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          v10 = v21;
        }
        else
        {
          v10 = 0;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    v17 = 0;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (id)searchWithContext:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[PSGStructuredInfoSuggestionCache _isCacheEmpty](self, "_isCacheEmpty")
    || !objc_msgSend(v8, "isEqualToString:", self->_localeIdentifier))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length") && !-[PSGStructuredInfoSuggestionCache _maybeClearCache](self, "_maybeClearCache"))
    {
      v21 = v8;
      v22 = v7;
      v11 = (void *)objc_opt_new();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[_PASTuple2 second](self->_cachedSuggestions, "second");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
LABEL_9:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v16);
          v18 = (void *)objc_opt_class();
          objc_msgSend(v17, "predictedValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v18) = objc_msgSend(v18, "_matchesPredictedValue:prefixValue:", v19, v10);

          if ((_DWORD)v18)
          {
            objc_msgSend(v11, "addObject:", v17);
            if (objc_msgSend(v11, "count") == a5)
              break;
          }
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v14)
              goto LABEL_9;
            break;
          }
        }
      }

      if (!objc_msgSend(v11, "count"))
        -[PSGStructuredInfoSuggestionCache invalidate](self, "invalidate");
      v8 = v21;
      v7 = v22;
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (void)invalidate
{
  _PASTuple2 *cachedSuggestions;

  cachedSuggestions = self->_cachedSuggestions;
  self->_cachedSuggestions = 0;

}

- (BOOL)_isCacheEmpty
{
  _PASTuple2 *cachedSuggestions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  cachedSuggestions = self->_cachedSuggestions;
  if (!cachedSuggestions)
    return 1;
  -[_PASTuple2 first](cachedSuggestions, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_PASTuple2 second](self->_cachedSuggestions, "second");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[_PASTuple2 second](self->_cachedSuggestions, "second");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "emptySuggestionsPlaceholder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v9 = 0;
      }
      else
      {
        -[_PASTuple2 second](self->_cachedSuggestions, "second");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count") == 0;

      }
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_maybeClearCache
{
  double v3;
  double v4;
  double ttlSeconds;

  -[NSDate timeIntervalSinceNow](self->_startTime, "timeIntervalSinceNow");
  v4 = -v3;
  ttlSeconds = self->_ttlSeconds;
  if (ttlSeconds < -v3)
    -[PSGStructuredInfoSuggestionCache invalidate](self, "invalidate");
  return ttlSeconds < v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSuggestions, 0);
}

+ (PSGStructuredInfoSuggestionCache)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PSGStructuredInfoSuggestionCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_819 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_819, block);
  return (PSGStructuredInfoSuggestionCache *)(id)sharedInstance__pasExprOnceResult_820;
}

+ (id)emptySuggestionsPlaceholder
{
  if (emptySuggestionsPlaceholder__pasOnceToken3 != -1)
    dispatch_once(&emptySuggestionsPlaceholder__pasOnceToken3, &__block_literal_global_818);
  return (id)emptySuggestionsPlaceholder__pasExprOnceResult;
}

+ (BOOL)_matchesPredictedValue:(id)a3 prefixValue:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  int v9;
  uint64_t v10;
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

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "hasPrefix:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));

    if (!v9
      || (v19 = 0u,
          v20 = 0u,
          v17 = 0u,
          v18 = 0u,
          (v10 = objc_msgSend(&unk_1EA3F4880, "countByEnumeratingWithState:objects:count:", &v17, v21, 16)) == 0))
    {
      v7 = 0;
      goto LABEL_14;
    }
    v11 = v10;
    v12 = *(_QWORD *)v18;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(&unk_1EA3F4880);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v14, "stringByAppendingString:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v14) = objc_msgSend(v5, "hasPrefix:", v15);
      if ((v14 & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(&unk_1EA3F4880, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v7 = 0;
        if (v11)
          goto LABEL_6;
        goto LABEL_14;
      }
    }
  }
  v7 = 1;
LABEL_14:

  return v7;
}

void __63__PSGStructuredInfoSuggestionCache_emptySuggestionsPlaceholder__block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = (void *)emptySuggestionsPlaceholder__pasExprOnceResult;
  emptySuggestionsPlaceholder__pasExprOnceResult = MEMORY[0x1E0C9AA60];

  objc_autoreleasePoolPop(v0);
}

void __50__PSGStructuredInfoSuggestionCache_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1DF0B9950]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithTTLSeconds:", 180.0);
  v4 = (void *)sharedInstance__pasExprOnceResult_820;
  sharedInstance__pasExprOnceResult_820 = v3;

  objc_autoreleasePoolPop(v2);
}

@end
