@implementation CHCachedRecognizerManager

- (CHCachedRecognizerManager)init
{
  CHCachedRecognizerManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cachedRecognizersByConfigurationKey;
  NSMutableDictionary *v5;
  NSMutableDictionary *writingStatsByConfigurationKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHCachedRecognizerManager;
  v2 = -[CHCachedRecognizerManager init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedRecognizersByConfigurationKey = v2->_cachedRecognizersByConfigurationKey;
    v2->_cachedRecognizersByConfigurationKey = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    writingStatsByConfigurationKey = v2->_writingStatsByConfigurationKey;
    v2->_writingStatsByConfigurationKey = v5;

  }
  return v2;
}

- (id)checkOutRecognizerForTextRequest:(id)a3 locale:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager _recognizerWrapperForRequest:locale:](self, "_recognizerWrapperForRequest:locale:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "checkOutRecognizer"));

  return v5;
}

- (id)checkOutRecognizerForMathRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager _recognizerWrapperForRequest:locale:](self, "_recognizerWrapperForRequest:locale:", v4, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "checkOutRecognizer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "declaredVariables"));
  objc_msgSend(v6, "setDeclaredVariables:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locales"));
  objc_msgSend(v6, "setLocales:", v8);

  return v6;
}

- (id)checkOutRecognizerForSketchRequest:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager _recognizerWrapperForRequest:locale:](self, "_recognizerWrapperForRequest:locale:", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "checkOutRecognizer"));

  return v4;
}

- (void)checkInRecognizerForRequest:(id)a3 locale:(id)a4 onQueue:(id)a5 idleCallbackBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  double v15;
  dispatch_time_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  CHCachedRecognizerManager *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager _recognizerWrapperForRequest:locale:](self, "_recognizerWrapperForRequest:locale:", v10, v11));
  objc_msgSend(v14, "checkInRecognizer");
  objc_msgSend(v14, "targetIdleLifetime");
  v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_100008430;
  v24 = &unk_100024980;
  v25 = self;
  v17 = v13;
  v26 = v17;
  dispatch_after(v16, v12, &v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager _recognizerConfigurationKeyForRequest:locale:](self, "_recognizerConfigurationKeyForRequest:locale:", v10, v11, v21, v22, v23, v24, v25));
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v19 = (id)qword_10002AE38;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = objc_msgSend(v14, "activeRequestCount");
    *(_DWORD *)buf = 138412546;
    v28 = v18;
    v29 = 2048;
    v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Finished request for recognizer %@. Remaining processing requests: %li", buf, 0x16u);
  }

}

- (id)writingStatsForRequest:(id)a3 locale:(id)a4
{
  void *v5;
  CHWritingStatistics *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager _recognizerConfigurationKeyForRequest:locale:](self, "_recognizerConfigurationKeyForRequest:locale:", a3, a4));
  v6 = (CHWritingStatistics *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_writingStatsByConfigurationKey, "objectForKey:", v5));
  if (!v6)
  {
    v6 = objc_alloc_init(CHWritingStatistics);
    -[NSMutableDictionary setObject:forKey:](self->_writingStatsByConfigurationKey, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (id)_recognizerConfigurationKeyForRequest:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v13[16];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(CHRemoteRecognitionTextRequest);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recognizerConfigurationKeyWithLocale:", v6));
  }
  else
  {
    v9 = objc_opt_class(CHRemoteRecognitionMathRequest);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      v8 = CFSTR("Math");
    }
    else
    {
      v10 = objc_opt_class(CHRemoteRecognitionSketchRequest);
      if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
      {
        v8 = CFSTR("Sketch");
      }
      else
      {
        if (qword_10002AE88 != -1)
          dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v11 = (id)qword_10002AE18[0];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Invalid recognition request class", v13, 2u);
        }

        v8 = 0;
      }
    }
  }

  return v8;
}

- (id)_recognizerWrapperForRequest:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  CHCachedRecognizerWrapper *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  void *v26;
  __int16 v27;
  int v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager _recognizerConfigurationKeyForRequest:locale:](self, "_recognizerConfigurationKeyForRequest:locale:", v6, v7));
  v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedRecognizersByConfigurationKey, "objectForKey:", v8));
  if (v9)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v10 = (id)qword_10002AE38;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    v25 = 138412290;
    v26 = v8;
    v11 = "Loaded recognizer with configuration key %@";
    v12 = v10;
    v13 = OS_LOG_TYPE_DEBUG;
    v14 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v25, v14);
LABEL_7:

    v15 = (CHCachedRecognizerWrapper *)v9;
    goto LABEL_24;
  }
  v16 = objc_opt_class(CHRemoteRecognitionTextRequest);
  if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
  {
    v17 = v6;
    v18 = objc_alloc_init((Class)CHRecognizerOptions);
    objc_msgSend(v18, "setEnableCachingIfAvailable:", objc_msgSend(v17, "enableCachingIfAvailable"));
    objc_msgSend(v18, "setEnableGen2ModelIfAvailable:", objc_msgSend(v17, "enableGen2ModelIfAvailable"));
    objc_msgSend(v18, "setEnableGen2CharacterLMIfAvailable:", objc_msgSend(v17, "enableGen2CharacterLMIfAvailable"));
    v19 = objc_msgSend(objc_alloc((Class)CHRecognizer), "initWithMode:locale:recognizerOptions:", objc_msgSend(v17, "recognitionMode"), v7, v18);

  }
  else
  {
    v20 = objc_opt_class(CHRemoteRecognitionMathRequest);
    if ((objc_opt_isKindOfClass(v6, v20) & 1) != 0)
    {
      v19 = objc_alloc_init((Class)CHMathRecognizer);
      +[CHPowerLogging logModelLoaded:](CHPowerLogging, "logModelLoaded:", 2);
    }
    else
    {
      v21 = objc_opt_class(CHRemoteRecognitionSketchRequest);
      if ((objc_opt_isKindOfClass(v6, v21) & 1) != 0)
      {
        v19 = objc_alloc_init((Class)CHSketchRecognizer);
        +[CHPowerLogging logModelLoaded:](CHPowerLogging, "logModelLoaded:", 12);
      }
      else
      {
        if (qword_10002AE88 != -1)
          dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v22 = (id)qword_10002AE18[0];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Invalid recognition request class", (uint8_t *)&v25, 2u);
        }

        v19 = 0;
      }
    }
  }
  v15 = -[CHCachedRecognizerWrapper initWithRecognizer:]([CHCachedRecognizerWrapper alloc], "initWithRecognizer:", v19);
  -[NSMutableDictionary setObject:forKey:](self->_cachedRecognizersByConfigurationKey, "setObject:forKey:", v15, v8);
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v23 = (id)qword_10002AE38;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v25 = 138412546;
    v26 = v8;
    v27 = 1024;
    v28 = dword_10002ADE0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Created recognizer with configuration key %@, recognizer index = %d", (uint8_t *)&v25, 0x12u);
  }

  ++dword_10002ADE0;
  if (!v15)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v10 = (id)qword_10002AE18[0];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    LOWORD(v25) = 0;
    v11 = "A valid recognizer wrapper is required to serve a request";
    v12 = v10;
    v13 = OS_LOG_TYPE_FAULT;
    v14 = 2;
    goto LABEL_6;
  }
LABEL_24:

  return v15;
}

- (void)_cleanupCachedRecognizersTargetLifetime:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *cachedRecognizersByConfigurationKey;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;

  v20 = a3;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v5 = v4;
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v6 = (id)qword_10002AE38;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Starting scheduled recognizer cleanup at %f", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  cachedRecognizersByConfigurationKey = self->_cachedRecognizersByConfigurationKey;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100008F4C;
  v25[3] = &unk_1000249A8;
  v19 = v20;
  v26 = v19;
  v28 = v5;
  v9 = v7;
  v27 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedRecognizersByConfigurationKey, "enumerateKeysAndObjectsUsingBlock:", v25);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (qword_10002AE88 == -1)
        {
          v16 = (id)qword_10002AE38;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
LABEL_15:
          *(_DWORD *)buf = 138412290;
          v31 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Evicting recognizer with config key: %@", buf, 0xCu);
          goto LABEL_16;
        }
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v16 = (id)qword_10002AE38;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
LABEL_16:

        -[NSMutableDictionary removeObjectForKey:](self->_cachedRecognizersByConfigurationKey, "removeObjectForKey:", v15);
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Math")) & 1) != 0)
        {
          v14 = 2;
LABEL_9:
          +[CHPowerLogging logModelUnloaded:](CHPowerLogging, "logModelUnloaded:", v14);
          continue;
        }
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("Sketch")))
        {
          v14 = 12;
          goto LABEL_9;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v11);
  }

  if (qword_10002AE88 != -1)
  {
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v17 = (id)qword_10002AE38;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
    goto LABEL_24;
  }
  v17 = (id)qword_10002AE38;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
LABEL_24:
    v18 = -[NSMutableDictionary count](self->_cachedRecognizersByConfigurationKey, "count");
    *(_DWORD *)buf = 134217984;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Number of recognizers after clean-up: %lu", buf, 0xCu);
  }
LABEL_25:

}

- (BOOL)_hasCachedRecognizers
{
  return -[NSMutableDictionary count](self->_cachedRecognizersByConfigurationKey, "count") != 0;
}

- (void)optimizeResourceUsageWithTimeout:(double)a3 onQueue:(id)a4 idleCallbackBlock:(id)a5
{
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  double v14;

  v8 = a5;
  v9 = a4;
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000091BC;
  block[3] = &unk_1000249D0;
  v14 = a3;
  block[4] = self;
  v13 = v8;
  v11 = v8;
  dispatch_after(v10, v9, block);

}

+ (void)configureRecognizer:(id)a3 forRequest:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if (v8)
      goto LABEL_14;
    goto LABEL_9;
  }
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v10 = (id)qword_10002AE18[0];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "A valid recognizer is required", buf, 2u);
  }

  if (!v8)
  {
LABEL_9:
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v11 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "A valid recognition request is required", v14, 2u);
    }

  }
LABEL_14:
  objc_msgSend(v7, "setMaxRecognitionResultCount:", objc_msgSend(v8, "maxRecognitionResultCount"));
  objc_msgSend(v8, "minimumDrawingSize");
  objc_msgSend(v7, "setMinimumDrawingSize:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeCharacterSetPerLocale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));
  objc_msgSend(v7, "setActiveCharacterSet:", v13);

  objc_msgSend(v7, "setContentType:", objc_msgSend(v8, "contentType"));
  objc_msgSend(v7, "setAutoCapitalizationMode:", objc_msgSend(v8, "autoCapitalizationMode"));
  objc_msgSend(v7, "setAutoCorrectionMode:", objc_msgSend(v8, "autoCorrectionMode"));
  objc_msgSend(v7, "setBaseWritingDirection:", objc_msgSend(v8, "baseWritingDirection"));
  objc_msgSend(v7, "setEnableCachingIfAvailable:", objc_msgSend(v8, "enableCachingIfAvailable"));
  objc_msgSend(v7, "setEnableGen2ModelIfAvailable:", objc_msgSend(v8, "enableGen2ModelIfAvailable"));
  objc_msgSend(v7, "setEnableGen2CharacterLMIfAvailable:", objc_msgSend(v8, "enableGen2CharacterLMIfAvailable"));

}

+ (void)configureRecognizer:(id)a3 forRequest:(id)a4 locale:(id)a5 transientLexicon:(_LXLexicon *)a6 transientPhraseLexicon:(_LXLexicon *)a7 vocabulary:(void *)a8 textReplacements:(id)a9 addressBookLexicon:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v19 = a10;
  objc_msgSend((id)objc_opt_class(a1), "configureRecognizer:forRequest:locale:", v21, v16, v17);
  if (objc_msgSend(v16, "shouldUseTextReplacements"))
    v20 = v18;
  else
    v20 = 0;
  objc_msgSend(v21, "setTextReplacements:", v20);
  objc_msgSend(v21, "setCustomLexicon:customVocabulary:", a6, a8);
  objc_msgSend(v21, "updateAddressBookLexicon:", v19);
  objc_msgSend(v21, "setCustomPhraseLexicon:", a7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writingStatsByConfigurationKey, 0);
  objc_storeStrong((id *)&self->_cachedRecognizersByConfigurationKey, 0);
}

@end
