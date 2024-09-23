@implementation PPLocationStore

- (PPLocationStore)init
{
  PPLocationStore *v2;
  PPClientFeedbackHelper *v3;
  PPClientFeedbackHelper *clientFeedbackHelper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPLocationStore;
  v2 = -[PPLocationStore init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v2);
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v3;

  }
  return v2;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a3;
  -[PPLocationStore clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 352, CFSTR("The clientIdentifier property must be set on the %@ in order to send feedback."), v13);

  }
  -[PPLocationStore clientIdentifier](self, "clientIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocationStore registerFeedback:clientIdentifier:completion:](self, "registerFeedback:clientIdentifier:completion:", v8, v14, v7);

}

- (void)registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 365, CFSTR("clientIdentifier must not be nil or zero length"));

  }
  if ((unint64_t)objc_msgSend(v10, "length") >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 366, CFSTR("clientIdentifier was longer than %d characters.  Please choose a shorter identifer"), 10);

  }
  if (objc_msgSend(v9, "isMapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 368, CFSTR("You cannot send mapped feedback on locations. Please use PPFeedback to create the feedback for locations."));

  }
  objc_msgSend(v9, "setClientIdentifier:", v10);
  +[PPLocationReadOnlyClient sharedInstance](PPLocationReadOnlyClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PPLocationStore_registerFeedback_clientIdentifier_completion___block_invoke;
  v17[3] = &unk_1E226C218;
  v17[4] = self;
  v18 = v11;
  v13 = v11;
  objc_msgSend(v12, "registerFeedback:completion:", v9, v17);

}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 error:(id *)a9
{
  _BOOL8 v11;
  uint64_t v12;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  uint8_t v31[16];
  uint8_t buf[16];

  v11 = a7;
  v12 = a6;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locations"));

    if (v18)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 390, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    goto LABEL_3;
  }
  if (!v18)
    goto LABEL_11;
LABEL_3:
  pp_locations_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_generate(v20);

  pp_locations_signpost_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PPLocationStore.donateLocations", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPLocationReadWriteClient sharedInstance](PPLocationReadWriteClient, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:decayRate:error:", v17, v18, v19, v12, v11, a9, a8);

  pp_locations_signpost_handle();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v27, OS_SIGNPOST_INTERVAL_END, v21, "PPLocationStore.donateLocations", (const char *)&unk_18BE9F21B, v31, 2u);
  }

  return v25;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  void *v4;

  +[PPLocationReadWriteClient sharedInstance](PPLocationReadWriteClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "cloudSyncWithError:", a3);

  return (char)a3;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  void *v6;

  +[PPLocationReadWriteClient sharedInstance](PPLocationReadWriteClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "clearWithError:deletedCount:", a3, a4);

  return (char)a4;
}

- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  uint8_t buf[16];
  _QWORD v28[3];
  char v29;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 420, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v11)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 421, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_11;
LABEL_3:
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  pp_locations_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  pp_locations_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PPLocationStore.iterRankedLocationsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPLocationReadOnlyClient sharedInstance](PPLocationReadOnlyClient, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__PPLocationStore_iterRankedLocationsWithQuery_error_block___block_invoke;
  v24[3] = &unk_1E2269D38;
  v26 = v28;
  v17 = v11;
  v25 = v17;
  v18 = objc_msgSend(v16, "rankedLocationsWithQuery:error:handleBatch:", v9, a4, v24);

  pp_locations_signpost_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v20, OS_SIGNPOST_INTERVAL_END, v13, "PPLocationStore.iterRankedLocationsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  _Block_object_dispose(v28, 8);
  return v18;
}

- (id)rankedLocationsWithQuery:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  v8 = (void *)objc_opt_new();
  pp_locations_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_locations_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPLocationStore.rankedLocationsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__PPLocationStore_rankedLocationsWithQuery_error___block_invoke;
  v21[3] = &unk_1E2269D60;
  v22 = v8;
  v13 = v8;
  v14 = -[PPLocationStore iterRankedLocationsWithQuery:error:block:](self, "iterRankedLocationsWithQuery:error:block:", v7, a4, v21);
  pp_locations_signpost_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v16, OS_SIGNPOST_INTERVAL_END, v10, "PPLocationStore.rankedLocationsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v14)
    v17 = v13;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  uint8_t buf[16];
  _QWORD v28[3];
  char v29;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v11)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 462, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_11;
LABEL_3:
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  pp_locations_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  pp_locations_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PPLocationStore.iterLocationRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPLocationReadOnlyClient sharedInstance](PPLocationReadOnlyClient, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__PPLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke;
  v24[3] = &unk_1E2269D38;
  v26 = v28;
  v17 = v11;
  v25 = v17;
  v18 = objc_msgSend(v16, "locationRecordsWithQuery:error:handleBatch:", v9, a4, v24);

  pp_locations_signpost_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v20, OS_SIGNPOST_INTERVAL_END, v13, "PPLocationStore.iterLocationRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  _Block_object_dispose(v28, 8);
  return v18;
}

- (id)locationRecordsWithQuery:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocationStore.m"), 485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  v8 = (void *)objc_opt_new();
  pp_locations_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_locations_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPLocationStore.locationRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__PPLocationStore_locationRecordsWithQuery_error___block_invoke;
  v21[3] = &unk_1E2269D88;
  v22 = v8;
  v13 = v8;
  v14 = -[PPLocationStore iterLocationRecordsWithQuery:error:block:](self, "iterLocationRecordsWithQuery:error:block:", v7, a4, v21);
  pp_locations_signpost_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v16, OS_SIGNPOST_INTERVAL_END, v10, "PPLocationStore.locationRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v14)
    v17 = v13;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  PPClientFeedbackHelper *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_clientFeedbackHelper;
  else
    v4 = 0;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
}

uint64_t __50__PPLocationStore_locationRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __60__PPLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          {
            *a3 = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

uint64_t __50__PPLocationStore_rankedLocationsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __60__PPLocationStore_iterRankedLocationsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          {
            *a3 = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

void __64__PPLocationStore_registerFeedback_clientIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a3);
    v6 = v8;
  }

}

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PPLocationStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken14 != -1)
    dispatch_once(&defaultStore__pasOnceToken14, block);
  return (id)defaultStore__pasExprOnceResult;
}

+ (id)_mergedThoroughfareForThorughfare:(id)a3 subThoroughfare:(id)a4 subPremises:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x18D7805AC]();
  if (v7 && v8)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v8, v7);
  }
  else
  {
    v12 = 0;
    if (!v7 || v8)
      goto LABEL_11;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v7, v17);
  }
  v12 = (id)v11;
  if (!v11)
  {
LABEL_11:
    v12 = v12;
    v15 = v12;
    goto LABEL_12;
  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "count");
    goto LABEL_11;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v9, "_pas_componentsJoinedByString:", CFSTR(" "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@ %@"), v12, v14);

LABEL_12:
  objc_autoreleasePoolPop(v10);

  return v15;
}

+ (id)placemarkWithLocation:(id)a3 name:(id)a4 thoroughfare:(id)a5 subthoroughFare:(id)a6 locality:(id)a7 subLocality:(id)a8 administrativeArea:(id)a9 subAdministrativeArea:(id)a10 postalCode:(id)a11 countryCode:(id)a12 country:(id)a13 inlandWater:(id)a14 ocean:(id)a15 areasOfInterest:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v35;
  id v36;
  id v37;
  id v38;
  id v40;

  v40 = a16;
  v38 = a15;
  v37 = a14;
  v36 = a13;
  v35 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("Name"));

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, CFSTR("Thoroughfare"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, CFSTR("SubThoroughfare"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, CFSTR("City"));

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, CFSTR("SubLocality"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, CFSTR("State"));

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, CFSTR("SubAdministrativeArea"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v19, CFSTR("ZIP"));

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, CFSTR("CountryCode"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, CFSTR("Country"));

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, CFSTR("InlandWater"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v38, CFSTR("Ocean"));

  objc_msgSend(a1, "_mergedThoroughfareForThorughfare:subThoroughfare:subPremises:", v25, v24, MEMORY[0x1E0C9AA60]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("Street"));
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3F0]), "initWithLocation:addressDictionary:region:areasOfInterest:", v27, v28, 0, v40);

  return v30;
}

+ (id)placemarkWithLatitudeDegrees:(id)a3 longitudeDegrees:(id)a4 name:(id)a5 thoroughfare:(id)a6 subthoroughFare:(id)a7 locality:(id)a8 subLocality:(id)a9 administrativeArea:(id)a10 subAdministrativeArea:(id)a11 postalCode:(id)a12 countryCode:(id)a13 country:(id)a14 inlandWater:(id)a15 ocean:(id)a16 areasOfInterest:(id)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v41;
  id v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v49 = a5;
  v48 = a6;
  v47 = a7;
  v46 = a8;
  v45 = a9;
  v21 = a10;
  v42 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = v27;
  v29 = 0;
  if (a3 && a4)
  {
    v30 = (objc_class *)MEMORY[0x1E0C9E3B8];
    v41 = v27;
    v31 = a4;
    v32 = v21;
    v33 = a3;
    v34 = [v30 alloc];
    objc_msgSend(v33, "doubleValue");
    v36 = v35;

    v21 = v32;
    objc_msgSend(v31, "doubleValue");
    v38 = v37;

    v29 = (void *)objc_msgSend(v34, "initWithLatitude:longitude:", v36, v38);
    v28 = v41;
  }
  objc_msgSend(a1, "placemarkWithLocation:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", v29, v49, v48, v47, v46, v45, v21, v42, v22, v23, v24, v25, v26, v28);
  v44 = (id)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (id)placemarkWithName:(id)a3 clLocation:(id)a4
{
  if (!((unint64_t)a3 | (unint64_t)a4))
    return 0;
  objc_msgSend(a1, "placemarkWithLocation:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", a4, a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)describeLocationConsumer:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E2269DA8[a3 - 1];
}

void __31__PPLocationStore_defaultStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult;
  defaultStore__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
