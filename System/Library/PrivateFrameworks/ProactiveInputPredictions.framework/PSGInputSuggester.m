@implementation PSGInputSuggester

- (void)hibernate
{
  id v2;

  +[PSGWordBoundaryFSTGrammar sharedInstance](PSGWordBoundaryFSTGrammar, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLMCache");

}

intptr_t __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  psg_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DBD27000, v2, OS_LOG_TYPE_INFO, "PSGInputSuggester serving endpoint warmed up %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  psg_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBD27000, v2, OS_LOG_TYPE_INFO, "PSGInputSuggester triggering endpoint warmed up", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)warmUpForLocaleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  PSGInputSuggesterClient *client;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  psg_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBD27000, v5, OS_LOG_TYPE_INFO, "PSGInputSuggester triggering endpoint warming up", buf, 2u);
  }

  v6 = dispatch_semaphore_create(0);
  client = self->_client;
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke;
  v22[3] = &unk_1EA3F1038;
  v9 = v6;
  v23 = v9;
  -[PSGInputSuggesterClient warmUpWithCompletion:](client, "warmUpWithCompletion:", v22);
  objc_msgSend(MEMORY[0x1E0D70C08], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  psg_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl(&dword_1DBD27000, v11, OS_LOG_TYPE_INFO, "PSGInputSuggester serving endpoint warming up %@", buf, 0xCu);
  }

  v12 = dispatch_semaphore_create(0);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke_8;
  v19[3] = &unk_1EA3F0AA0;
  v13 = v10;
  v20 = v13;
  v14 = v12;
  v21 = v14;
  objc_msgSend(v13, "warmUpWithCompletion:", v19);
  +[PSGWordBoundaryFSTGrammar sharedInstance](PSGWordBoundaryFSTGrammar, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "warmUpForLocaleIdentifier:", v4);

  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v9, 0.5) == 1)
  {
    psg_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DBD27000, v16, OS_LOG_TYPE_ERROR, "PSGInputSuggester triggering endpoint warmUp timeout", buf, 2u);
    }

  }
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v14, 0.5) == 1)
  {
    psg_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DBD27000, v17, OS_LOG_TYPE_ERROR, "PSGInputSuggester serving endpoint warmUp timeout", buf, 2u);
    }

  }
  psg_default_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBD27000, v18, OS_LOG_TYPE_INFO, "PSGInputSuggester warmUp DONE", buf, 2u);
  }

}

- (void)warmUp
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGInputSuggester warmUpForLocaleIdentifier:](self, "warmUpForLocaleIdentifier:", v3);

}

- (PSGInputSuggester)initWithClient:(id)a3
{
  id v5;
  PSGInputSuggester *v6;
  PSGInputSuggester *v7;
  uint64_t v8;
  OS_dispatch_queue *lastPredictionQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSGInputSuggester;
  v6 = -[PSGInputSuggester init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PSGInputSuggester.lastPrediction", 9);
    v8 = objc_claimAutoreleasedReturnValue();
    lastPredictionQueue = v7->_lastPredictionQueue;
    v7->_lastPredictionQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  PSGInputSuggesterClient *client;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_lastRequest, a3);
  client = self->_client;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke;
  v12[3] = &unk_1EA3F0A78;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[PSGInputSuggesterClient inputSuggestionsWithRequest:completion:](client, "inputSuggestionsWithRequest:completion:", v11, v12);

}

- (void)logMetricForEventType:(unsigned __int8)a3 externalMetadata:(id)a4 request:(id)a5 responseItems:(id)a6
{
  int v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *lastImpression;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _PASTuple2 *v18;
  _PASTuple2 *v19;
  NSObject *v20;
  _PASTuple2 *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v8 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v8 == 2)
  {
    psg_default_log_handle();
    lastImpression = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(lastImpression, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v28) = 0;
      v15 = "Use -[PSGInputSuggester logMetricForEventType:externalMetadata:predictedValues:] instead for logging Speed Metric";
      v16 = lastImpression;
      v17 = 2;
LABEL_4:
      _os_log_fault_impl(&dword_1DBD27000, v16, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v28, v17);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (!objc_msgSend(v12, "count"))
  {
    psg_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v28 = 67109120;
      LODWORD(v29) = v8;
      _os_log_error_impl(&dword_1DBD27000, v20, OS_LOG_TYPE_ERROR, "No response item specified for logging event type %d", (uint8_t *)&v28, 8u);
    }

    lastImpression = self->_lastImpression;
    self->_lastImpression = 0;
    goto LABEL_25;
  }
  if (v8 == 1)
  {
    v21 = self->_lastImpression;
    self->_lastImpression = 0;

    objc_msgSend(v10, "objectForKey:", CFSTR("pos"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastImpression = v22;
    if (v22)
    {
      v23 = -[NSObject unsignedIntegerValue](v22, "unsignedIntegerValue");
      if (v23 && v23 <= objc_msgSend(v13, "count"))
        goto LABEL_22;
      psg_default_log_handle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v28 = 134217984;
        v29 = (const __CFString *)v23;
        v25 = "position param (%tu) out of range";
LABEL_27:
        _os_log_error_impl(&dword_1DBD27000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      psg_default_log_handle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v28 = 138412290;
        v29 = CFSTR("pos");
        v25 = "position param %@ not specified for engagement logging";
        goto LABEL_27;
      }
    }

    v23 = 10000;
LABEL_22:
    psg_default_log_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_msgSend(v13, "count");
      v28 = 134218240;
      v29 = (const __CFString *)v23;
      v30 = 2048;
      v31 = v27;
      _os_log_debug_impl(&dword_1DBD27000, v26, OS_LOG_TYPE_DEBUG, "Logging engagement at position %tu of %tu item(s)", (uint8_t *)&v28, 0x16u);
    }

    -[PSGInputSuggesterClient logEngagement:request:position:](self->_client, "logEngagement:request:position:", v13, v11, v23);
    goto LABEL_25;
  }
  if (v8)
  {
    psg_default_log_handle();
    lastImpression = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(lastImpression, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v28 = 67109120;
    LODWORD(v29) = v8;
    v15 = "Unknown event type: %d";
    v16 = lastImpression;
    v17 = 8;
    goto LABEL_4;
  }
  -[PSGInputSuggesterClient logImpression:request:](self->_client, "logImpression:request:", v13, v11);
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v11, v13);
  v18 = (_PASTuple2 *)objc_claimAutoreleasedReturnValue();
  v19 = self->_lastImpression;
  self->_lastImpression = v18;

  psg_default_log_handle();
  lastImpression = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(lastImpression, OS_LOG_TYPE_DEBUG))
  {
    v28 = 134217984;
    v29 = (const __CFString *)objc_msgSend(v13, "count");
    _os_log_debug_impl(&dword_1DBD27000, lastImpression, OS_LOG_TYPE_DEBUG, "Logging impression for %tu item(s)", (uint8_t *)&v28, 0xCu);
  }
LABEL_25:

}

- (void)_reportSpeedMetricWithData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardLanguage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    if (-[NSObject length](v6, "length"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardRegion"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      if (-[NSObject length](v8, "length"))
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v6, v8);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalMessageDuration"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (v11 = objc_msgSend(v10, "intValue"), v11 == -1))
        {
          psg_default_log_handle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v4;
            _os_log_fault_impl(&dword_1DBD27000, v12, OS_LOG_TYPE_FAULT, "[SpeedMetric] messageDuration missing | data: %@", buf, 0xCu);
          }
        }
        else
        {
          v18 = v11;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalMessageLength"));
          v12 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (v13 = -[NSObject intValue](v12, "intValue"), v13 == -1))
          {
            psg_default_log_handle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v4;
              _os_log_fault_impl(&dword_1DBD27000, v14, OS_LOG_TYPE_FAULT, "[SpeedMetric] messageLength missing | data: %@", buf, 0xCu);
            }
          }
          else
          {
            v17 = v13;
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalWordsEntered"));
            v14 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (v15 = -[NSObject intValue](v14, "intValue"), (_DWORD)v15 == -1))
            {
              psg_default_log_handle();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v20 = v4;
                _os_log_fault_impl(&dword_1DBD27000, v16, OS_LOG_TYPE_FAULT, "[SpeedMetric] messageWords missing | data: %@", buf, 0xCu);
              }

            }
            else
            {
              -[PSGInputSuggesterClient logSpeedMetricForLocaleIdentifier:messageDurationMilliseconds:messageLength:messageWords:](self->_client, "logSpeedMetricForLocaleIdentifier:messageDurationMilliseconds:messageLength:messageWords:", v9, v18, v17, v15);
            }
          }

        }
      }
      else
      {
        psg_default_log_handle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v4;
          _os_log_fault_impl(&dword_1DBD27000, v9, OS_LOG_TYPE_FAULT, "[SpeedMetric] keyboardRegion missing | data: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      psg_default_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_fault_impl(&dword_1DBD27000, v8, OS_LOG_TYPE_FAULT, "[SpeedMetric] keyboardLanguage missing | data: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    psg_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1DBD27000, v6, OS_LOG_TYPE_FAULT, "[SpeedMetric] Empty data", buf, 2u);
    }
  }

}

- (void)logMetricForEventType:(unsigned __int8)a3 externalMetadata:(id)a4 predictedValues:(id)a5
{
  unsigned int v6;
  NSObject *lastPredictionQueue;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  NSObject *v24;
  unsigned int v25;
  id v27;
  id v28;
  id obj;
  NSObject *log;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[7];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v6 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  v27 = a5;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__15;
  v51 = __Block_byref_object_dispose__16;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__15;
  v45 = __Block_byref_object_dispose__16;
  v46 = 0;
  if (v6 == 2)
  {
    psg_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v28;
      _os_log_debug_impl(&dword_1DBD27000, v8, OS_LOG_TYPE_DEBUG, "[Speed] %@", buf, 0xCu);
    }

    -[PSGInputSuggester _reportSpeedMetricWithData:](self, "_reportSpeedMetricWithData:", v28);
    goto LABEL_36;
  }
  v25 = v6;
  if (v6 == 1)
  {
    -[_PASTuple2 first](self->_lastImpression, "first");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v48[5];
    v48[5] = v9;

    -[_PASTuple2 second](self->_lastImpression, "second");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v42[5];
    v42[5] = v11;

  }
  else
  {
    if (v6)
    {
      psg_default_log_handle();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v56) = v6;
        _os_log_fault_impl(&dword_1DBD27000, log, OS_LOG_TYPE_FAULT, "Unknown event type: %d", buf, 8u);
      }
      goto LABEL_35;
    }
    lastPredictionQueue = self->_lastPredictionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PSGInputSuggester_logMetricForEventType_externalMetadata_predictedValues___block_invoke;
    block[3] = &unk_1EA3F0AC8;
    block[4] = self;
    block[5] = &v47;
    block[6] = &v41;
    dispatch_sync(lastPredictionQueue, block);
  }
  if (!v48[5])
  {
    psg_default_log_handle();
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
LABEL_35:

      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v23 = "No known request has been recorded!";
LABEL_41:
    _os_log_error_impl(&dword_1DBD27000, log, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_35;
  }
  if (!objc_msgSend((id)v42[5], "count"))
  {
    psg_default_log_handle();
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v23 = "No known response items to log.";
    goto LABEL_41;
  }
  if (objc_msgSend(v27, "count"))
  {
    log = objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v27;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
    if (v13)
    {
      v31 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v16 = (id)v42[5];
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v53, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v33;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v33 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                objc_msgSend(v20, "predictedValue");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v15, "isEqualToString:", v21);

                if (v22)
                {
                  -[NSObject addObject:](log, "addObject:", v20);
                  goto LABEL_27;
                }
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v53, 16);
              if (v17)
                continue;
              break;
            }
          }
LABEL_27:

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
      }
      while (v13);
    }

    -[PSGInputSuggester logMetricForEventType:externalMetadata:request:responseItems:](self, "logMetricForEventType:externalMetadata:request:responseItems:", v25, v28, v48[5], log);
    goto LABEL_35;
  }
  psg_default_log_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBD27000, v24, OS_LOG_TYPE_DEFAULT, "No predictedValues given. Logging last recorded as a fallback.", buf, 2u);
  }

  -[PSGInputSuggester logMetricForEventType:externalMetadata:request:responseItems:](self, "logMetricForEventType:externalMetadata:request:responseItems:", v25, v28, v48[5], v42[5]);
LABEL_36:
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

- (void)logTimeoutForRequest:(id)a3
{
  PSGInputSuggestionsRequest *v4;
  uint8_t v5[16];

  v4 = (PSGInputSuggestionsRequest *)a3;
  if (v4 || (v4 = self->_lastRequest) != 0)
  {
    -[PSGInputSuggesterClient logErrorForRequest:trigger:errorType:](self->_client, "logErrorForRequest:trigger:errorType:", v4, 0, 0);
  }
  else
  {
    psg_default_log_handle();
    v4 = (PSGInputSuggestionsRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1DBD27000, &v4->super, OS_LOG_TYPE_ERROR, "Logging called before any request has been made!", v5, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImpression, 0);
  objc_storeStrong((id *)&self->_lastPrediction, 0);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->_lastPredictionQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __76__PSGInputSuggester_logMetricForEventType_externalMetadata_predictedValues___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = *(id *)(a1[4] + 32);
  objc_msgSend(v8, "first");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(v8, "second");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a1[4];
  v7 = (void *)a1[5];
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke_2;
  block[3] = &unk_1EA3F1010;
  block[4] = v6;
  v12 = v7;
  v13 = v5;
  v9 = v5;
  v10 = a3;
  dispatch_async(v8, block);
  (*(void (**)(void))(a1[6] + 16))();

}

void __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D81638];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "responseItems");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tupleWithFirst:second:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v4;

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PSGInputSuggester_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  return (id)sharedInstance__pasExprOnceResult;
}

void __35__PSGInputSuggester_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1DF0B9950]();
  v3 = objc_alloc(*(Class *)(a1 + 32));
  +[PSGInputSuggesterClient sharedInstance](PSGInputSuggesterClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithClient:", v4);
  v6 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v5;

  objc_autoreleasePoolPop(v2);
}

@end
