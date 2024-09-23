@implementation SASActivePresentationInstrumentationSender

- (SASActivePresentationInstrumentationSender)initWithAnalyticsStream:(id)a3
{
  SASActivePresentationInstrumentationSender *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableArray *queuedMesasges;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SASActivePresentationInstrumentationSender;
  v3 = -[SASActivationInstrumentationSender initWithAnalyticsStream:](&v9, sel_initWithAnalyticsStream_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.siri-activation.activePresentationSender", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    queuedMesasges = v3->_queuedMesasges;
    v3->_queuedMesasges = (NSMutableArray *)v6;

  }
  return v3;
}

- (void)instrumentActivationMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SASActivePresentationInstrumentationSender_instrumentActivationMessage___block_invoke;
  block[3] = &unk_1E91FBF68;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __74__SASActivePresentationInstrumentationSender_instrumentActivationMessage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_instrumentActivationMessage:", *(_QWORD *)(a1 + 32));

}

- (void)aggregatePresentationRequestStateDidChange:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__SASActivePresentationInstrumentationSender_aggregatePresentationRequestStateDidChange___block_invoke;
  block[3] = &unk_1E91FBE48;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __89__SASActivePresentationInstrumentationSender_aggregatePresentationRequestStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestStateDidChange:", *(_QWORD *)(a1 + 40));

}

- (void)barrierWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SASActivePresentationInstrumentationSender_barrierWithCompletion___block_invoke;
  block[3] = &unk_1E91FC570;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __68__SASActivePresentationInstrumentationSender_barrierWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SASActivePresentationInstrumentationSender barrierWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1D132F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_instrumentActivationMessage:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject **v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSMutableArray *v13;
  NSMutableArray *queuedMesasges;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SASActivePresentationInstrumentationSender _canInstrumentForRequestState:](self, "_canInstrumentForRequestState:", self->_aggregateRequestState);
  v6 = (NSObject **)MEMORY[0x1E0CFE6A0];
  v7 = *MEMORY[0x1E0CFE6A0];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SASActivePresentationInstrumentationSender _instrumentActivationMessage:]";
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Allowing message %@", buf, 0x16u);
    }
    v15.receiver = self;
    v15.super_class = (Class)SASActivePresentationInstrumentationSender;
    -[SASActivationInstrumentationSender instrumentActivationMessage:](&v15, sel_instrumentActivationMessage_, v4);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SASActivePresentationInstrumentationSender _instrumentActivationMessage:]";
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Buffering message %@", buf, 0x16u);
    }
    -[NSMutableArray lastObject](self->_queuedMesasges, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activationEventIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activationEventIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
    {
      v12 = *v6;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "-[SASActivePresentationInstrumentationSender _instrumentActivationMessage:]";
        v18 = 2112;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New activation interaction detected. Old %@, New %@", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      queuedMesasges = self->_queuedMesasges;
      self->_queuedMesasges = v13;

    }
    -[NSMutableArray addObject:](self->_queuedMesasges, "addObject:", v4);

  }
}

- (void)_requestStateDidChange:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  NSMutableArray *queuedMesasges;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    SASRequestStateGetName(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "-[SASActivePresentationInstrumentationSender _requestStateDidChange:]";
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Request state did change %@", buf, 0x16u);

  }
  if (-[SASActivePresentationInstrumentationSender _canInstrumentForRequestState:](self, "_canInstrumentForRequestState:", a3))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_queuedMesasges;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          v16.receiver = self;
          v16.super_class = (Class)SASActivePresentationInstrumentationSender;
          -[SASActivationInstrumentationSender instrumentActivationMessage:](&v16, sel_instrumentActivationMessage_, v13);
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    queuedMesasges = self->_queuedMesasges;
    self->_queuedMesasges = v14;

  }
  self->_aggregateRequestState = a3;
}

- (BOOL)_canInstrumentForRequestState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

- (int64_t)aggregateRequestState
{
  return self->_aggregateRequestState;
}

- (void)setAggregateRequestState:(int64_t)a3
{
  self->_aggregateRequestState = a3;
}

- (NSMutableArray)queuedMesasges
{
  return self->_queuedMesasges;
}

- (void)setQueuedMesasges:(id)a3
{
  objc_storeStrong((id *)&self->_queuedMesasges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedMesasges, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
