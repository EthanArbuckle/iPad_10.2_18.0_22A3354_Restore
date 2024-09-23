@implementation _UITextInputSessionEfficacyAccumulator

+ (id)accumulatorWithName:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[15];
  v4[15] = v5;

  objc_msgSend(v4, "reset");
  return v4;
}

- (void)reset
{
  NSObject *v3;
  uint8_t v4[16];

  -[NSMutableDictionary removeAllObjects](self->_entries, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_sessionErrors, "removeAllObjects");
  self->_sessionIsModeless = 0;
  self->_largestSessionDeletionLength = 0;
  self->_sessionNetCharacters = 0;
  self->_largestSessionInsertionLength = 0;
  self->_insertionObservedInSession = 0;
  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Reset accumulator", v4, 2u);
  }

}

- (_UITextInputSessionEfficacyAccumulator)init
{
  _UITextInputSessionEfficacyAccumulator *v2;
  uint64_t v3;
  NSMutableDictionary *entries;
  NSMutableSet *v5;
  NSMutableSet *sessionErrors;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITextInputSessionEfficacyAccumulator;
  v2 = -[_UITextInputSessionEfficacyAccumulator init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    entries = v2->_entries;
    v2->_entries = (NSMutableDictionary *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sessionErrors = v2->_sessionErrors;
    v2->_sessionErrors = v5;

    UITextInputSessionLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Initialized accumulator", v9, 2u);
    }

  }
  return v2;
}

- (void)increaseWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *language;
  void *v14;
  NSString *v15;
  NSString *region;
  void *v17;
  NSString *v18;
  NSString *keyboardVariant;
  void *v20;
  NSString *v21;
  NSString *keyboardLayout;
  void *v23;
  NSString *v24;
  NSString *keyboardType;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  unint64_t largestSessionInsertionLength;
  uint64_t v39;
  unint64_t largestSessionDeletionLength;
  uint64_t v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_UITextInputSessionEfficacyAccumulatorEntry generateAccumulatorEntryFromAction:](_UITextInputSessionEfficacyAccumulatorEntry, "generateAccumulatorEntryFromAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputModeUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UITextInputSessionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414338;
    v43 = (unint64_t)v4;
    v44 = 2048;
    v45 = objc_msgSend(v5, "netCharacters");
    v46 = 2048;
    v47 = objc_msgSend(v5, "userRemovedCharacters");
    v48 = 2048;
    v49 = objc_msgSend(v5, "netEmojiCharacters");
    v50 = 2048;
    v51 = objc_msgSend(v5, "userRemovedEmojiCharacters");
    v52 = 2048;
    v53 = objc_msgSend(v5, "inputActions");
    v54 = 2048;
    v55 = objc_msgSend(v4, "textInputActionsSource");
    v56 = 2048;
    v57 = objc_msgSend(v4, "textInputActionsType");
    v58 = 2112;
    v59 = v6;
    _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] increaseWithAction(): %@ netCharactersDelta:%ld userRemovedCharactersDelta:%ld netEmojiCharactersDelta:%ld sysRemovedObjectsDelta:%ld inputActionsDelta:%ld for source:%lu type:%lu inputMode:%@", buf, 0x5Cu);
  }

  objc_msgSend(v4, "source");
  objc_msgSend(v4, "appBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextInputSessionEfficacyAccumulator increaseCountForAppBundleId:forSource:forActionType:forFlagOptions:forInputModeKey:byAccumulatorEntry:](self, "increaseCountForAppBundleId:forSource:forActionType:forFlagOptions:forInputModeKey:byAccumulatorEntry:", v8, objc_msgSend(v4, "textInputActionsSource"), objc_msgSend(v4, "textInputActionsType"), objc_msgSend(v4, "flagOptions"), v6, v5);

  objc_msgSend(v4, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    objc_msgSend(v4, "region");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_8;
  }
  objc_msgSend(v4, "language");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend(v11, "copy");
  language = self->_language;
  self->_language = v12;

  objc_msgSend(v4, "region");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSString *)objc_msgSend(v14, "copy");
  region = self->_region;
  self->_region = v15;

  objc_msgSend(v4, "keyboardVariant");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (NSString *)objc_msgSend(v17, "copy");
  keyboardVariant = self->_keyboardVariant;
  self->_keyboardVariant = v18;

  objc_msgSend(v4, "keyboardLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (NSString *)objc_msgSend(v20, "copy");
  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = v21;

  objc_msgSend(v4, "keyboardType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (NSString *)objc_msgSend(v23, "copy");
  keyboardType = self->_keyboardType;
  self->_keyboardType = v24;

  if (objc_msgSend(v4, "textInputActionsSource") == 4)
  {
    _UITextInputActionsValidateLanguage(self->_language);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionEfficacyAccumulator logErrorCodeIfNotNil:](self, "logErrorCodeIfNotNil:", v26);

    _UITextInputActionsValidateRegion(self->_region);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionEfficacyAccumulator logErrorCodeIfNotNil:](self, "logErrorCodeIfNotNil:", v27);

  }
LABEL_8:
  objc_msgSend(v4, "asDictationBegan");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28 && objc_msgSend(v28, "modelessUsedAtLeastOnceCount"))
    self->_sessionIsModeless = 1;
  v30 = objc_msgSend(v4, "largestSingleInsertionLength");
  v31 = objc_msgSend(v4, "largestSingleDeletionLength");
  v32 = objc_msgSend(v4, "netCharacterCount");
  if ((objc_msgSend(v4, "flagOptions") & 1) != 0)
  {
    v30 = objc_msgSend(v4, "insertedEmojiCount");
    v31 = objc_msgSend(v4, "removedEmojiCount");
    v33 = objc_msgSend(v4, "insertedEmojiCount");
    v32 = v33 - objc_msgSend(v4, "removedEmojiCount");
    UITextInputSessionLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v43 = v30;
      v44 = 2048;
      v45 = v31;
      v46 = 2048;
      v47 = v32;
      _os_log_debug_impl(&dword_185066000, v34, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] emoji search - override insertion %lu, deletion %lu, net %ld", buf, 0x20u);
    }

  }
  if (v30 > self->_largestSessionInsertionLength)
  {
    UITextInputSessionLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      largestSessionInsertionLength = self->_largestSessionInsertionLength;
      v39 = objc_msgSend(v4, "largestSingleInsertionLength");
      *(_DWORD *)buf = 134218240;
      v43 = largestSessionInsertionLength;
      v44 = 2048;
      v45 = v39;
      _os_log_debug_impl(&dword_185066000, v35, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] largestSessionInsertionLength %lu -> %lu", buf, 0x16u);
    }

    self->_largestSessionInsertionLength = v30;
  }
  if (v31 > self->_largestSessionDeletionLength)
  {
    UITextInputSessionLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      largestSessionDeletionLength = self->_largestSessionDeletionLength;
      v41 = objc_msgSend(v4, "largestSingleDeletionLength");
      *(_DWORD *)buf = 134218240;
      v43 = largestSessionDeletionLength;
      v44 = 2048;
      v45 = v41;
      _os_log_debug_impl(&dword_185066000, v36, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] largestSessionDeletionLength %lu -> %lu", buf, 0x16u);
    }

    self->_largestSessionDeletionLength = v31;
  }
  self->_sessionNetCharacters += v32;
  if (objc_msgSend(v4, "isCapableOfTextInsertion")
    && ((objc_msgSend(v4, "flagOptions") & 1) == 0
     || (objc_msgSend(v4, "flagOptions") & 1) != 0 && objc_msgSend(v4, "insertedEmojiCount")))
  {
    self->_insertionObservedInSession = 1;
  }
  else if (!self->_insertionObservedInSession && (objc_msgSend(v4, "flagOptions") & 1) == 0)
  {
    v37 = objc_msgSend(v4, "removedTextLength");
    self->_charsRemovedBeforeFirstInsertionCount += v37 - objc_msgSend(v4, "removedEmojiCount");
    self->_emojisRemovedBeforeFirstInsertionCount += objc_msgSend(v4, "removedEmojiCount");
  }

}

- (void)increaseCountForAppBundleId:(id)a3 forSource:(int64_t)a4 forActionType:(int64_t)a5 forFlagOptions:(int64_t)a6 forInputModeKey:(id)a7 byAccumulatorEntry:(id)a8
{
  __CFString *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  _UITextInputSessionEfficacyAccumulatorEntry *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  int64_t v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a3;
  v15 = a7;
  v16 = a8;
  if ((objc_msgSend(v16, "isAllZeroes") & 1) == 0)
  {
    if (v15)
    {
      if (!v14)
        v14 = &stru_1E16EDF20;
      +[_UITextInputSessionEfficacyAccumulator getOrInitializeArrayFromDictionary:forKey:initCapacity:](_UITextInputSessionEfficacyAccumulator, "getOrInitializeArrayFromDictionary:forKey:initCapacity:", self->_entries, v14, 13);
      v17 = objc_claimAutoreleasedReturnValue();
      +[_UITextInputSessionEfficacyAccumulator getOrInitializeArrayFromArray:forKey:initCapacity:](_UITextInputSessionEfficacyAccumulator, "getOrInitializeArrayFromArray:forKey:initCapacity:", v17, a4, 17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UITextInputSessionEfficacyAccumulator getOrInitializeArrayFromArray:forKey:initCapacity:](_UITextInputSessionEfficacyAccumulator, "getOrInitializeArrayFromArray:forKey:initCapacity:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UITextInputSessionEfficacyAccumulator getOrInitializeDictionaryFrom:forKey:initCapacity:](_UITextInputSessionEfficacyAccumulator, "getOrInitializeDictionaryFrom:forKey:initCapacity:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v15);
      v19 = (_UITextInputSessionEfficacyAccumulatorEntry *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v19 = objc_alloc_init(_UITextInputSessionEfficacyAccumulatorEntry);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v15);
        UITextInputSessionLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          v30 = a4;
          v31 = 2048;
          v32 = a5;
          v33 = 2048;
          v34 = a6;
          v35 = 2112;
          v36 = v15;
          _os_log_debug_impl(&dword_185066000, v20, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New input mode key found - initializing new entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%@\", buf, 0x2Au);
        }

      }
      -[_UITextInputSessionEfficacyAccumulatorEntry increaseWithEntry:](v19, "increaseWithEntry:", v16);
      UITextInputSessionLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v26 = objc_msgSend(v16, "netCharacters");
        v25 = objc_msgSend(v16, "userRemovedCharacters");
        v24 = objc_msgSend(v16, "netEmojiCharacters");
        v23 = objc_msgSend(v16, "userRemovedEmojiCharacters");
        v22 = objc_msgSend(v16, "inputActions");
        *(_DWORD *)buf = 134220034;
        v30 = a4;
        v31 = 2048;
        v32 = a5;
        v33 = 2048;
        v34 = a6;
        v35 = 2112;
        v36 = v15;
        v37 = 2048;
        v38 = v26;
        v39 = 2048;
        v40 = v25;
        v41 = 2048;
        v42 = v24;
        v43 = 2048;
        v44 = v23;
        v45 = 2048;
        v46 = v22;
        _os_log_debug_impl(&dword_185066000, v21, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Updated entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%@\" by netChars:%ld userRemovedChars:%ld netEmojiChars:%ld userRemovedEmojiChars:%ld actions:%ld", buf, 0x5Cu);
      }

    }
    else
    {
      UITextInputSessionLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "[UITextInputSessionEfficacyAccumulator] Received nil input mode unique key", buf, 2u);
      }
    }

  }
}

- (void)logErrorCodeIfNotNil:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    if (objc_msgSend(v4, "length") == 1)
    {
      v5 = v7;
    }
    else
    {
      objc_msgSend(CFSTR("E"), "stringByAppendingString:", v7);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v6;
    }
    v8 = v5;
    -[NSMutableSet addObject:](self->_sessionErrors, "addObject:");

  }
}

+ (id)getOrInitializeArrayFromDictionary:(id)a3 forKey:(id)a4 initCapacity:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
    if (a5)
    {
      v10 = a5;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

        --v10;
      }
      while (v10);
    }
    objc_msgSend(v7, "setObject:forKey:", v9, v8);
    UITextInputSessionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134218240;
      v15 = v8;
      v16 = 2048;
      v17 = a5;
      _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New key found - initializing new array for key \"%lu\" with capacity %lu", (uint8_t *)&v14, 0x16u);
    }

  }
  return v9;
}

+ (id)getOrInitializeArrayFromArray:(id)a3 forKey:(unint64_t)a4 initCapacity:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  void *v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (objc_msgSend(v9, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITextInputSessionEfficacyAccumulator.m"), 243, CFSTR("Attempt to access index %lu, which is out of bounds for array with capacity %lu"), a4, objc_msgSend(v9, "count"));

  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
    if (a5)
    {
      v14 = a5;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v15);

        --v14;
      }
      while (v14);
    }
    objc_msgSend(v9, "setObject:atIndexedSubscript:", v13, a4);
    UITextInputSessionLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v20 = a4;
      v21 = 2048;
      v22 = a5;
      _os_log_debug_impl(&dword_185066000, v16, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New key found - initializing new array for key \"%lu\" with capacity %lu", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)getOrInitializeDictionaryFrom:(id)a3 forKey:(unint64_t)a4 initCapacity:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  unint64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a5);

    objc_msgSend(v7, "setObject:atIndexedSubscript:", v11, a4);
    UITextInputSessionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134218240;
      v15 = a4;
      v16 = 2048;
      v17 = a5;
      _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New key found - initializing new dictionary for key \"%lu\" with capacity %lu", (uint8_t *)&v14, 0x16u);
    }

    v8 = (void *)v11;
  }

  return v8;
}

- (BOOL)isPrimaryInput:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 4 && (a3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

- (id)computeSessionActionsStringOnSession:(id)a3
{
  id v5;
  _UITextInputSessionActionInformation *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _UITextInputSessionActionInformation *v12;
  void *v13;
  void *v14;
  _UITextInputSessionActionInformation *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;
  _UITextInputSessionActionInformation *v26;
  SEL v27;

  v5 = a3;
  v6 = objc_alloc_init(_UITextInputSessionActionInformation);
  -[_UITextInputSessionActionInformation setSessionHasOnlyPrimaryInput:](v6, "setSessionHasOnlyPrimaryInput:", 1);
  -[_UITextInputSessionActionInformation setSessionHasDictation:](v6, "setSessionHasDictation:", 0);
  v7 = 12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    --v7;
  }
  while (v7);
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke;
  v24[3] = &unk_1E16E7740;
  v27 = a2;
  v24[4] = self;
  v11 = v8;
  v25 = v11;
  v12 = v6;
  v26 = v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v24);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__213;
  v22 = __Block_byref_object_dispose__213;
  v23 = (id)objc_msgSend(&stru_1E16EDF20, "mutableCopy");
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_71;
  v17[3] = &unk_1E16E7768;
  v17[4] = &v18;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);
  v13 = (void *)v19[5];
  _UITextInputActionsSessionActionsStringFromEnumValue(2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "isEqualToString:", v14);

  if ((_DWORD)v13)
    -[_UITextInputSessionActionInformation setSessionHasOnlyPrimaryInput:](v12, "setSessionHasOnlyPrimaryInput:", 0);
  -[_UITextInputSessionActionInformation setSessionActionString:](v12, "setSessionActionString:", v19[5]);
  v15 = v12;
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (id)generateSessionErrorStringFromSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "componentsJoinedByString:", &stru_1E16EDF20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)cleanIdForPublishing:(id)a3
{
  __CFString *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;

  v3 = (__CFString *)a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(MEMORY[0x1E0DBDB38], "performSelector:withObject:", sel_isReportableClientId_, v3) != 0;
  else
    v4 = -[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("com.apple."));
  if (v4)
    v5 = v3;
  else
    v5 = CFSTR("other");
  v6 = v5;

  return v6;
}

- (void)enumerateTextInputActionsAnalytics:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *entries;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  UITextInputSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Enumerating TextInputActions...", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__213;
  v20 = __Block_byref_object_dispose__213;
  _UIMainBundleIdentifier();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextInputSessionEfficacyAccumulator cleanIdForPublishing:](self, "cleanIdForPublishing:", *((_QWORD *)v17 + 5));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v17 + 5);
  *((_QWORD *)v17 + 5) = v6;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__213;
  v14[4] = __Block_byref_object_dispose__213;
  -[_UITextInputSessionEfficacyAccumulator generateSessionErrorStringFromSet:](self, "generateSessionErrorStringFromSet:", self->_sessionErrors);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  entries = self->_entries;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke;
  v10[3] = &unk_1E16E7830;
  v10[4] = self;
  v12 = buf;
  v13 = v14;
  v9 = v4;
  v11 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entries, "enumerateKeysAndObjectsUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(buf, 8);

}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (void)setKeyboardTrialParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardTrialParameters, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionErrors, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
