@implementation SXLayoutPipeline

- (SXLayoutPipeline)initWithLayoutOperationFactory:(id)a3 DOMObjectProviderFactory:(id)a4
{
  id v7;
  id v8;
  SXLayoutPipeline *v9;
  SXLayoutPipeline *v10;
  uint64_t v11;
  NSMutableArray *preProcessors;
  uint64_t v13;
  NSMutableArray *postProcessors;
  NSOperationQueue *v15;
  NSOperationQueue *layoutOperationQueue;
  NSOperationQueue *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SXLayoutPipeline;
  v9 = -[SXLayoutPipeline init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutOperationFactory, a3);
    objc_storeStrong((id *)&v10->_DOMObjectProviderFactory, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    preProcessors = v10->_preProcessors;
    v10->_preProcessors = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    postProcessors = v10->_postProcessors;
    v10->_postProcessors = (NSMutableArray *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    layoutOperationQueue = v10->_layoutOperationQueue;
    v10->_layoutOperationQueue = v15;

    v17 = v10->_layoutOperationQueue;
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("com.apple.news.anf-layout (%@)"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v17, "setName:", v21);

    -[NSOperationQueue setQualityOfService:](v10->_layoutOperationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_layoutOperationQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v10;
}

- (void)layoutWithTask:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 *p_buf;
  id v45;
  id v46;
  id from;
  id location;
  _QWORD v49[5];
  uint8_t v50[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int128 buf;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Pipeline receieved new layout task, task-identifier=%{public}@", (uint8_t *)&buf, 0xCu);

  }
  -[SXLayoutPipeline DOMObjectProviderFactory](self, "DOMObjectProviderFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createDOMObjectProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "DOM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDOM:", v10);

  -[SXLayoutPipeline layoutOperationFactory](self, "layoutOperationFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutOperationWithTask:DOMObjectProvider:", v4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v57 = 0x2020000000;
  v58 = 0;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke;
  v49[3] = &unk_24D6886F0;
  v49[4] = &buf;
  v15 = objc_msgSend(v13, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("ANF Layout"), v49);

  *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v15;
  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  v41[0] = v14;
  v41[1] = 3221225472;
  v41[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke_2;
  v41[3] = &unk_24D688740;
  v28 = &v45;
  objc_copyWeak(&v45, &location);
  v29 = &v46;
  objc_copyWeak(&v46, &from);
  v16 = v4;
  v42 = v16;
  v17 = v9;
  v43 = v17;
  p_buf = &buf;
  objc_msgSend(v12, "setCompletionBlock:", v41);
  v37[0] = v14;
  v37[1] = 3221225472;
  v37[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke_8;
  v37[3] = &unk_24D688768;
  objc_copyWeak(&v40, &from);
  v18 = v16;
  v38 = v18;
  v19 = v17;
  v39 = v19;
  objc_msgSend(v12, "beforeLayout:", v37);
  v30 = v14;
  v31 = 3221225472;
  v32 = __35__SXLayoutPipeline_layoutWithTask___block_invoke_10;
  v33 = &unk_24D688768;
  objc_copyWeak(&v36, &from);
  v20 = v18;
  v34 = v20;
  v21 = v19;
  v35 = v21;
  objc_msgSend(v12, "afterLayout:", &v30);
  -[SXLayoutPipeline layoutOperationQueue](self, "layoutOperationQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cancelAllOperations");

  v23 = (id)SXLayoutLog;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v20, "identifier", &v45, &v46, v30, v31, v32, v33, v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLayoutPipeline layoutOperationQueue](self, "layoutOperationQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v50 = 138412802;
    v51 = v12;
    v52 = 2114;
    v53 = v24;
    v54 = 2114;
    v55 = v26;
    _os_log_impl(&dword_217023000, v23, OS_LOG_TYPE_DEFAULT, "Adding layout operation: %@, task-identifier= %{public}@, layout-queue: %{public}@", v50, 0x20u);

  }
  -[SXLayoutPipeline layoutOperationQueue](self, "layoutOperationQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addOperation:", v12);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v40);

  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x24BDF7608];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SXLayoutPipeline_layoutWithTask___block_invoke_3;
  block[3] = &unk_24D688718;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v10 = v4;
  v5 = WeakRetained;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v11);
}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v4 = (void *)SXLayoutLog;
  v5 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0 || !WeakRetained)
  {
    if (v5)
    {
      v11 = *(void **)(a1 + 40);
      v12 = v4;
      objc_msgSend(v11, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "duration");
      v17 = 138543618;
      v18 = *(double *)&v13;
      v19 = 2048;
      v20 = v14 * 1000.0;
      _os_log_impl(&dword_217023000, v12, OS_LOG_TYPE_DEFAULT, "Cancelled layout task; dropping result, task-identifier=%{public}@, duration=%fms",
        (uint8_t *)&v17,
        0x16u);

    }
  }
  else
  {
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      v7 = v4;
      objc_msgSend(v6, "duration");
      v9 = v8 * 1000.0;
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v17 = 134218242;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_217023000, v7, OS_LOG_TYPE_DEFAULT, "Finished layout task in %fms, task-identifier=%{public}@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(WeakRetained, "finalizeLayoutForLayoutOperation:task:DOMObjectProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  v15 = *MEMORY[0x24BDF7608];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;
  }

}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "preProcessors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412546;
    v17 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(void **)(a1 + 32);
          v15 = v13;
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v17;
          v23 = v12;
          v24 = 2114;
          v25 = v16;
          _os_log_impl(&dword_217023000, v15, OS_LOG_TYPE_DEFAULT, "Executing pre-processor: %@, task-identifier= %{public}@", buf, 0x16u);

        }
        objc_msgSend(v12, "processLayoutTask:layoutBlueprint:DOMObjectProvider:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40), v17, (_QWORD)v18);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

}

void __35__SXLayoutPipeline_layoutWithTask___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "postProcessors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412546;
    v17 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(void **)(a1 + 32);
          v15 = v13;
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v17;
          v23 = v12;
          v24 = 2114;
          v25 = v16;
          _os_log_impl(&dword_217023000, v15, OS_LOG_TYPE_DEFAULT, "Executing post-processor: %@, task-identifier= %{public}@", buf, 0x16u);

        }
        objc_msgSend(v12, "processLayoutTask:layoutBlueprint:DOMObjectProvider:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40), v17, (_QWORD)v18);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

}

- (void)finalizeLayoutForLayoutOperation:(id)a3 task:(id)a4 DOMObjectProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  SXLayoutResult *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  SXLayoutResult *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [SXLayoutResult alloc];
  objc_msgSend(v10, "layoutBlueprint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DOM");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "duration");
  v15 = v14;

  v17 = -[SXLayoutResult initWithLayoutBlueprint:DOM:duration:](v11, "initWithLayoutBlueprint:DOM:duration:", v12, v13, v15);
  -[SXLayoutPipeline delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutPipeline:finishedTask:withResult:", self, v9, v17);

}

- (void)addProcessor:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if (v6)
  {
    if (a4 == 1)
    {
      v9 = v6;
      -[SXLayoutPipeline postProcessors](self, "postProcessors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (!a4)
    {
      v9 = v6;
      -[SXLayoutPipeline preProcessors](self, "preProcessors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = v7;
      objc_msgSend(v7, "addObject:", v9);

      v6 = v9;
    }
  }

}

- (void)removeProcessor:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if (v6)
  {
    if (a4 == 1)
    {
      v9 = v6;
      -[SXLayoutPipeline postProcessors](self, "postProcessors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (!a4)
    {
      v9 = v6;
      -[SXLayoutPipeline preProcessors](self, "preProcessors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = v7;
      objc_msgSend(v7, "removeObject:", v9);

      v6 = v9;
    }
  }

}

- (void)cancelTasks
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_217023000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all layout tasks", v5, 2u);
  }
  -[SXLayoutPipeline layoutOperationQueue](self, "layoutOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

}

- (SXLayoutPipelineDelegate)delegate
{
  return (SXLayoutPipelineDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SXLayoutOperationFactory)layoutOperationFactory
{
  return self->_layoutOperationFactory;
}

- (SXDOMObjectProviderFactory)DOMObjectProviderFactory
{
  return self->_DOMObjectProviderFactory;
}

- (NSOperationQueue)layoutOperationQueue
{
  return self->_layoutOperationQueue;
}

- (NSMutableArray)preProcessors
{
  return self->_preProcessors;
}

- (NSMutableArray)postProcessors
{
  return self->_postProcessors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessors, 0);
  objc_storeStrong((id *)&self->_preProcessors, 0);
  objc_storeStrong((id *)&self->_layoutOperationQueue, 0);
  objc_storeStrong((id *)&self->_DOMObjectProviderFactory, 0);
  objc_storeStrong((id *)&self->_layoutOperationFactory, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
