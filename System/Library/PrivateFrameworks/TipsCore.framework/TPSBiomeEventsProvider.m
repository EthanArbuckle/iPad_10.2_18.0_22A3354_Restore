@implementation TPSBiomeEventsProvider

- (TPSBiomeEventsProvider)init
{
  TPSBiomeDataProvider *v3;
  TPSBiomeEventsProvider *v4;

  v3 = objc_alloc_init(TPSBiomeDataProvider);
  v4 = -[TPSBiomeEventsProvider initWithBiomeDataProvider:](self, "initWithBiomeDataProvider:", v3);

  return v4;
}

- (TPSBiomeEventsProvider)initWithBiomeDataProvider:(id)a3
{
  id v5;
  TPSBiomeEventsProvider *v6;
  TPSBiomeEventsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSBiomeEventsProvider;
  v6 = -[TPSBiomeEventsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_biomeDataProvider, a3);

  return v7;
}

- (void)queryEvents:(id)a3
{
  uint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v6 = objc_msgSend((id)objc_opt_class(), "_limitForContextualBiomeEvent:", v5);
        if (v6 == -1)
        {
          -[TPSBiomeEventsProvider _processProviderResults:bookmark:forEvent:](self, "_processProviderResults:bookmark:forEvent:", 0, 0, v5);
          goto LABEL_11;
        }
        v7 = (void *)v6;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_eventSinceDateForContextualEvent:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        v11 = v10;

        objc_msgSend(v5, "publisherFromStartTime:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bookmark");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sinkBookmark");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        dispatch_get_global_queue(21, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __38__TPSBiomeEventsProvider_queryEvents___block_invoke;
        block[3] = &unk_1E395D020;
        objc_copyWeak(v26, &location);
        block[4] = v5;
        v23 = v12;
        v24 = v14;
        v25 = v8;
        v26[1] = v7;
        v16 = v8;
        v17 = v14;
        v18 = v12;
        dispatch_async(v15, block);

        objc_destroyWeak(v26);
        objc_destroyWeak(&location);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_11:

}

void __38__TPSBiomeEventsProvider_queryEvents___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[4];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  objc_msgSend(*(id *)(a1 + 32), "filterHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "filterHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filterWithIsIncluded:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v4;
  }

  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__TPSBiomeEventsProvider_queryEvents___block_invoke_2;
  v18[3] = &unk_1E395CFD0;
  v8 = *(_QWORD *)(a1 + 32);
  v20 = &v21;
  v18[4] = v8;
  v9 = *(_QWORD *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __38__TPSBiomeEventsProvider_queryEvents___block_invoke_6;
  v14[3] = &unk_1E395CFF8;
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v27;
  v14[4] = v10;
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 72);
  v15 = v11;
  v17 = v12;
  v13 = (id)objc_msgSend(v6, "drivableSinkWithBookmark:completion:shouldContinue:", v9, v18, v14);
  objc_msgSend(WeakRetained, "_processProviderResults:bookmark:forEvent:", *(_QWORD *)(a1 + 56), v22[5], *(_QWORD *)(a1 + 32));

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v27, 8);

}

void __38__TPSBiomeEventsProvider_queryEvents___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[TPSContextualBiomeEventBookmark bookmarkWithSinkBookmark:](TPSContextualBiomeEventBookmark, "bookmarkWithSinkBookmark:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "state");
  if (v9 == 1)
  {
    +[TPSLogger data](TPSLogger, "data");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = (uint64_t)v13;
      _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_INFO, "Sink completed with error: %@ for event: %@", (uint8_t *)&v14, 0x16u);

      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!v9)
  {
    +[TPSLogger data](TPSLogger, "data");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 40), "count");
      v14 = 138412546;
      v15 = v11;
      v16 = 2048;
      v17 = v12;
      _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_INFO, "Sink completed for event: %@ (%lu events found)", (uint8_t *)&v14, 0x16u);
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

BOOL __38__TPSBiomeEventsProvider_queryEvents___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = (void *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "observationDateFromEvent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 56);

  return v8;
}

- (void)_processProviderResults:(id)a3 bookmark:(id)a4 forEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  TPSEventProviderResult *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(TPSEventProviderResult);
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSEventProviderResult setIdentifier:](v11, "setIdentifier:", v12);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSEventProviderResult setObservationMap:](v11, "setObservationMap:", v13);

  }
  else
  {
    -[TPSEventProviderResult setObservationMap:](v11, "setObservationMap:", MEMORY[0x1E0C9AA70]);
  }
  -[TPSEventProviderResult setBookmark:](v11, "setBookmark:", v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSEventProviderResult setResultDate:](v11, "setResultDate:", v14);

  -[TPSEventsProvider delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataProvider:didFinishQueryWithResults:", self, v16);

}

- (void)registerEventsForCallback:(id)a3
{
  -[TPSBiomeEventsProvider _registerToGetNotifiedWithEvents:clientIdentifier:](self, "_registerToGetNotifiedWithEvents:clientIdentifier:", a3, 0);
}

- (void)deregisterEventsForCallback:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[TPSBiomeEventsProvider _registrationIDForEvent:](self, "_registrationIDForEvent:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSBiomeDataProvider deregisterWakingForRegistrationID:](self->_biomeDataProvider, "deregisterWakingForRegistrationID:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)deregisterAllEventsForCallback
{
  -[TPSBiomeDataProvider deregisterWakingForAllRegistrations](self->_biomeDataProvider, "deregisterWakingForAllRegistrations");
}

- (void)_registerToGetNotifiedWithEvents:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  TPSBiomeDataProvider *biomeDataProvider;
  id obj;
  _QWORD v15[5];
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_initWeak(&location, self);
        if (v7)
          -[TPSBiomeEventsProvider _wakingRegistrationIDForEvent:](self, "_wakingRegistrationIDForEvent:", v11);
        else
          -[TPSBiomeEventsProvider _registrationIDForEvent:](self, "_registrationIDForEvent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        biomeDataProvider = self->_biomeDataProvider;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __76__TPSBiomeEventsProvider__registerToGetNotifiedWithEvents_clientIdentifier___block_invoke;
        v15[3] = &unk_1E395D048;
        objc_copyWeak(&v16, &location);
        v15[4] = v11;
        -[TPSBiomeDataProvider registerWakingForEventWithEvent:registrationID:clientIdentifier:completion:](biomeDataProvider, "registerWakingForEventWithEvent:registrationID:clientIdentifier:completion:", v11, v12, v7, v15);
        objc_destroyWeak(&v16);

        objc_destroyWeak(&location);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

void __76__TPSBiomeEventsProvider__registerToGetNotifiedWithEvents_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  TPSEventProviderResult *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[TPSLogger default](TPSLogger, "default");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_19A906000, v5, OS_LOG_TYPE_INFO, "Got waking callback for identifier: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(TPSEventProviderResult);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSEventProviderResult setIdentifier:](v6, "setIdentifier:", v8);
  v11 = v8;
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSEventProviderResult setObservationMap:](v6, "setObservationMap:", v9);

  -[TPSEventProviderResult setResultDate:](v6, "setResultDate:", v7);
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataProvider:didReceiveCallbackWithResult:", WeakRetained, v6);

}

- (id)_registrationIDForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[TPSCommonDefines mainBundleIdentifier](TPSCommonDefines, "mainBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%p%@%@"), v5, self, CFSTR("-event-"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_wakingRegistrationIDForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[TPSCommonDefines mainBundleIdentifier](TPSCommonDefines, "mainBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@"), v4, CFSTR("-event-"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)_limitForContextualBiomeEvent:(id)a3
{
  id v3;
  unsigned int v4;
  unint64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "status"))
  {
    v4 = objc_msgSend(v3, "currentObservationCount");
    if (v4 >= objc_msgSend(v3, "minObservationCount"))
    {
      v5 = -1;
    }
    else
    {
      v5 = objc_msgSend(v3, "minObservationCount");
      if ((objc_msgSend(v3, "hasLookBackDays") & 1) == 0)
        v5 -= objc_msgSend(v3, "currentObservationCount");
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)_eventSinceDateForContextualEvent:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "eventSinceDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingTimeInterval:", -63072000.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeDataProvider, 0);
}

@end
