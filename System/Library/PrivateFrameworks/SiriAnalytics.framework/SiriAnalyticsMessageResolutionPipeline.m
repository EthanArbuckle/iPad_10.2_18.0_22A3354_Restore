@implementation SiriAnalyticsMessageResolutionPipeline

- (SiriAnalyticsMessageResolutionPipeline)initWithQueue:(id)a3
{
  id v5;
  SiriAnalyticsMessageResolutionPipeline *v6;
  SiriAnalyticsMessageResolutionPipeline *v7;
  NSMutableArray *v8;
  NSMutableArray *resolutionTimers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriAnalyticsMessageResolutionPipeline;
  v6 = -[SiriAnalyticsMessageResolutionPipeline init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resolutionTimers = v7->_resolutionTimers;
    v7->_resolutionTimers = v8;

  }
  return v7;
}

- (void)resolveMessage:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SiriAnalyticsMessageResolutionPipeline_resolveMessage_timestamp_completion___block_invoke;
  block[3] = &unk_1E4357C48;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)_continueResolutionWithMessage:(id)a3 resolvers:(id)a4 currentResolverIndex:(unint64_t)a5 resolversApplied:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id val;
  _QWORD v24[4];
  id v25;
  _BYTE *v26;
  id v27;
  id v28;
  id from;
  id location;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _BYTE *v35;
  _QWORD aBlock[5];
  id v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  _BYTE buf[24];
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = objc_msgSend(v13, "count");
  if (v12 && v15 > a5)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke;
    aBlock[3] = &unk_1E43579A8;
    aBlock[4] = self;
    v16 = v13;
    v37 = v16;
    v39 = a5;
    v40 = a6;
    v38 = v14;
    v17 = _Block_copy(aBlock);
    objc_msgSend(v16, "objectAtIndex:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "handlesMessage:", v12) & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v42 = 0;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2;
      v31[3] = &unk_1E43579D0;
      v19 = v18;
      v32 = v19;
      v20 = v12;
      v33 = v20;
      v35 = buf;
      v21 = v17;
      v34 = v21;
      -[SiriAnalyticsMessageResolutionPipeline _startResolutionTimerWithElapsed:](self, "_startResolutionTimerWithElapsed:", v31);
      val = (id)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      objc_initWeak(&from, val);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2;
      v24[3] = &unk_1E4357A20;
      objc_copyWeak(&v27, &location);
      objc_copyWeak(&v28, &from);
      v26 = buf;
      v25 = v21;
      objc_msgSend(v19, "resolveMessage:completion:", v20, v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      (*((void (**)(void *, id, _QWORD))v17 + 2))(v17, v12, 0);
    }

  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v22 = SiriAnalyticsLogContextResolution;
    if (a6)
    {
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SiriAnalyticsMessageResolutionPipeline _continueResolutionWithMessage:resolvers:currentRe"
                             "solverIndex:resolversApplied:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        _os_log_debug_impl(&dword_1A025F000, v22, OS_LOG_TYPE_DEBUG, "%s Resolved message: %@", buf, 0x16u);
      }
      (*((void (**)(id, id))v14 + 2))(v14, v12);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SiriAnalyticsMessageResolutionPipeline _continueResolutionWithMessage:resolvers:currentRe"
                             "solverIndex:resolversApplied:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        _os_log_error_impl(&dword_1A025F000, v22, OS_LOG_TYPE_ERROR, "%s No applicable resolvers found for message: %@, dropping.", buf, 0x16u);
      }
      (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
    }
  }

}

- (void)registerMessageResolver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SiriAnalyticsMessageResolutionPipeline *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SiriAnalyticsMessageResolutionPipeline_registerMessageResolver___block_invoke;
  v7[3] = &unk_1E4357A90;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_startResolutionTimerWithElapsed:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __75__SiriAnalyticsMessageResolutionPipeline__startResolutionTimerWithElapsed___block_invoke;
  v15 = &unk_1E4357A48;
  objc_copyWeak(&v18, &location);
  v7 = v5;
  v16 = v7;
  v8 = v4;
  v17 = v8;
  dispatch_source_set_event_handler(v7, &v12);
  -[NSMutableArray addObject:](self->_resolutionTimers, "addObject:", v7, v12, v13, v14, v15);
  v9 = v17;
  v10 = v7;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

- (void)_discardResolutionTimer:(id)a3
{
  NSObject *v4;

  if (a3)
  {
    v4 = a3;
    dispatch_source_cancel(v4);
    -[NSMutableArray removeObject:](self->_resolutionTimers, "removeObject:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTimers, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __75__SiriAnalyticsMessageResolutionPipeline__startResolutionTimerWithElapsed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_discardResolutionTimer:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __66__SiriAnalyticsMessageResolutionPipeline_registerMessageResolver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextResolution;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "-[SiriAnalyticsMessageResolutionPipeline registerMessageResolver:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1A025F000, v2, OS_LOG_TYPE_INFO, "%s Registering message resolver: %@", (uint8_t *)&v9, 0x16u);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  }
  return objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueResolutionWithMessage:resolvers:currentResolverIndex:resolversApplied:completion:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 64) + a3, *(_QWORD *)(a1 + 48));
}

uint64_t __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextResolution;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_ERROR))
  {
    v4 = a1[4];
    v5 = a1[5];
    v6 = 136315906;
    v7 = "-[SiriAnalyticsMessageResolutionPipeline _continueResolutionWithMessage:resolvers:currentResolverIndex:resolver"
         "sApplied:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v4;
    v10 = 2048;
    v11 = 10;
    v12 = 2112;
    v13 = v5;
    _os_log_error_impl(&dword_1A025F000, v2, OS_LOG_TYPE_ERROR, "%s Message resolver: %@ timed out after %lu seconds and failed to resolve message: %@", (uint8_t *)&v6, 0x2Au);
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  id v9;
  __int128 v10;
  _QWORD block[5];
  id v12;
  __int128 v13;
  id v14;
  char v15;

  v5 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2_3;
    block[3] = &unk_1E43579F8;
    block[4] = WeakRetained;
    objc_copyWeak(&v14, (id *)(a1 + 56));
    v10 = *(_OWORD *)(a1 + 32);
    v9 = (id)v10;
    v13 = v10;
    v12 = v5;
    v15 = a3;
    dispatch_async(v8, block);

    objc_destroyWeak(&v14);
  }

}

void __132__SiriAnalyticsMessageResolutionPipeline__continueResolutionWithMessage_resolvers_currentResolverIndex_resolversApplied_completion___block_invoke_2_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v2, "_discardResolutionTimer:", WeakRetained);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __78__SiriAnalyticsMessageResolutionPipeline_resolveMessage_timestamp_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = (void *)SiriAnalyticsLogContextResolution;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextResolution, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    v6 = 136315650;
    v7 = "-[SiriAnalyticsMessageResolutionPipeline resolveMessage:timestamp:completion:]_block_invoke";
    v8 = 2112;
    v9 = v4;
    v10 = 2048;
    v11 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1A025F000, v5, OS_LOG_TYPE_INFO, "%s Resolving message: %@ with %lu resolvers", (uint8_t *)&v6, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_continueResolutionWithMessage:resolvers:currentResolverIndex:resolversApplied:completion:", *(_QWORD *)(a1 + 40), v2, 0, 0, *(_QWORD *)(a1 + 48));

}

@end
