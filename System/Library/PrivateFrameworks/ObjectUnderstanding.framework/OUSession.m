@implementation OUSession

- (id)init:(BOOL)a3
{
  _BOOL4 v3;
  OUSession *v4;
  OUSession *v5;
  OUPipelineOnline *v6;
  void *ouPipeline;
  OU3DObjectDetector *v8;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *detSemaphore;
  uint64_t v11;
  NSMutableDictionary *allKeyframes;
  uint64_t v13;
  NSMutableDictionary *skipedKeyframes;
  uint64_t v15;
  OS_os_workgroup *workgroupOD;
  uint64_t v17;
  OS_dispatch_queue *detQueue;
  uint64_t v19;
  OS_os_workgroup *workgroupFrame;
  uint64_t v21;
  OS_dispatch_queue *ouframeQueue;
  OUSession *v23;
  objc_super v25;

  v3 = a3;
  v25.receiver = self;
  v25.super_class = (Class)OUSession;
  v4 = -[OUSession init](&v25, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->isOnline_ = v3;
    if (v3)
    {
      v6 = objc_alloc_init(OUPipelineOnline);
      ouPipeline = v5->ouPipeline_;
      v5->ouPipeline_ = v6;
    }
    else
    {
      v8 = -[OU3DObjectDetector init:]([OU3DObjectDetector alloc], "init:", 0);
      ouPipeline = v5->det3d_;
      v5->det3d_ = v8;
    }

    v9 = dispatch_semaphore_create(1);
    detSemaphore = v5->detSemaphore_;
    v5->detSemaphore_ = (OS_dispatch_semaphore *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    allKeyframes = v5->allKeyframes_;
    v5->allKeyframes_ = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    skipedKeyframes = v5->skipedKeyframes_;
    v5->skipedKeyframes_ = (NSMutableDictionary *)v13;

    CreateWorkGroup("OU_OnlineOD3d_TG");
    v15 = objc_claimAutoreleasedReturnValue();
    workgroupOD = v5->_workgroupOD;
    v5->_workgroupOD = (OS_os_workgroup *)v15;

    CreateFixedPrioritySerialDispatchQueue((_anonymous_namespace_ *)"com.apple.ObjectUnderstanding.onlineOD3d", (const char *)0x11, 0, 1, &v5->_workgroupOD);
    v17 = objc_claimAutoreleasedReturnValue();
    detQueue = v5->detQueue_;
    v5->detQueue_ = (OS_dispatch_queue *)v17;

    CreateWorkGroup("OU_UpdateFrame_TG");
    v19 = objc_claimAutoreleasedReturnValue();
    workgroupFrame = v5->_workgroupFrame;
    v5->_workgroupFrame = (OS_os_workgroup *)v19;

    CreateFixedPrioritySerialDispatchQueue((_anonymous_namespace_ *)"com.apple.ObjectUnderstanding.updateFrame", (const char *)0x11, 0, 1, &v5->_workgroupFrame);
    v21 = objc_claimAutoreleasedReturnValue();
    ouframeQueue = v5->ouframeQueue_;
    v5->ouframeQueue_ = (OS_dispatch_queue *)v21;

  }
  v23 = v5;

  return v23;
}

- (void)runWithConfiguration:(id)a3
{
  id v4;
  OUConfiguration *v5;
  OUConfiguration *configuration;
  OUPipelineOnlineConfig *v7;
  OUPipelineOnline *v8;
  OUPipelineOnline *ouPipeline;
  float v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *allKeyframes;
  NSMutableDictionary *v13;
  NSMutableDictionary *skipedKeyframes;

  v4 = a3;
  v5 = (OUConfiguration *)objc_msgSend(v4, "copy");
  configuration = self->configuration_;
  self->configuration_ = v5;

  if (self->isOnline_)
  {
    -[OUPipelineOnline clear](self->ouPipeline_, "clear");
    v7 = objc_alloc_init(OUPipelineOnlineConfig);
    -[OUPipelineOnlineConfig setEnableRgbRefinement:](v7, "setEnableRgbRefinement:", objc_msgSend(v4, "enableRgbRefinement"));
    -[OUPipelineOnlineConfig setEnable3DOROnline:](v7, "setEnable3DOROnline:", objc_msgSend(v4, "enable3DOR"));
    v8 = -[OUPipelineOnline initWithConfig:]([OUPipelineOnline alloc], "initWithConfig:", v7);
    ouPipeline = self->ouPipeline_;
    self->ouPipeline_ = v8;

  }
  else
  {
    -[OU3DObjectDetector clear](self->det3d_, "clear");
    -[OU3DObjectDetector setRgbRefinementEnabled:](self->det3d_, "setRgbRefinementEnabled:", objc_msgSend(v4, "enableRgbRefinement"));
    -[OU3DObjectDetector setObjectRepresentationEnabled:](self->det3d_, "setObjectRepresentationEnabled:", objc_msgSend(v4, "enable3DOR"));
  }
  -[OUConfiguration maxFramerate](self->configuration_, "maxFramerate");
  self->_minFrameInterval = 1.0 / v10;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  allKeyframes = self->allKeyframes_;
  self->allKeyframes_ = v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  skipedKeyframes = self->skipedKeyframes_;
  self->skipedKeyframes_ = v13;

}

- (void)updateWithKeyframes:(__n128)a3 currentCameraPose:(__n128)a4
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  id v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  _QWORD block[4];
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  id v32;
  id v33[2];
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v25 = a4;
  v26 = a5;
  v23 = a2;
  v24 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = a7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v13 = *(void **)(a1 + 96);
        objc_msgSend(v12, "identifier", *(_OWORD *)&v23, *(_OWORD *)&v24, *(_OWORD *)&v25, *(_OWORD *)&v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

        v15 = *(void **)(a1 + 104);
        objc_msgSend(v12, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v16);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v9);
  }

  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFELL))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    v19 = v18 < *(float *)(a1 + 60);

    if (v19)
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
    else
    {
      objc_initWeak(&location, (id)a1);
      objc_msgSend(*(id *)(a1 + 104), "allValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 104), "removeAllObjects");
      v21 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__OUSession_updateWithKeyframes_currentCameraPose___block_invoke;
      block[3] = &unk_24F243888;
      objc_copyWeak(v33, &location);
      v32 = v20;
      v28 = v23;
      v29 = v24;
      v30 = v25;
      v31 = v26;
      v22 = v20;
      dispatch_async(v21, block);

      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
    }
  }

}

void __51__OUSession_updateWithKeyframes_currentCameraPose___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)WeakRetained + 8);
    *((_QWORD *)WeakRetained + 8) = v3;

    objc_msgSend(*((id *)WeakRetained + 3), "updatePipelineWithKeyframes:currentCameraPose:", *(_QWORD *)(a1 + 96), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)WeakRetained + 10);
    *((_QWORD *)WeakRetained + 10) = v5;

    objc_msgSend(*((id *)WeakRetained + 10), "objects");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)WeakRetained + 9);
    *((_QWORD *)WeakRetained + 9) = v7;

    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*((id *)WeakRetained + 10), "objects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134217984;
      v15 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_2294C8000, v9, OS_LOG_TYPE_INFO, "[OD] Detected objects number: %lu", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(WeakRetained, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "session:didUpdateDetectedObjects:", WeakRetained, *((_QWORD *)WeakRetained + 9));

    }
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 6));
  }

}

- (void)updateWithKeyframes:(id)a3 ouframe:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *allKeyframes;
  void *v11;
  NSMutableDictionary *skipedKeyframes;
  void *v13;
  void *v14;
  double v15;
  _BOOL4 v16;
  NSObject *ouframeQueue;
  uint64_t v18;
  void *v19;
  NSObject *detQueue;
  id v21;
  NSObject *v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  OUSession *v32;
  _QWORD *v33;
  id v34;
  _QWORD block[6];
  id v36;
  _QWORD v37[5];
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSUInteger v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        allKeyframes = self->allKeyframes_;
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](allKeyframes, "setObject:forKeyedSubscript:", v9, v11);

        skipedKeyframes = self->skipedKeyframes_;
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](skipedKeyframes, "setObject:forKeyedSubscript:", v9, v13);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v6);
  }

  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->detSemaphore_, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", self->_detStartDate);
    v16 = v15 < self->_minFrameInterval;

    if (v16)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->detSemaphore_);
    }
    else
    {
      objc_initWeak(&location, self);
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = *(_QWORD *)"";
      v37[3] = __Block_byref_object_copy__0;
      v37[4] = __Block_byref_object_dispose__0;
      v38 = 0;
      ouframeQueue = self->ouframeQueue_;
      v18 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[2] = __41__OUSession_updateWithKeyframes_ouframe___block_invoke;
      block[3] = &unk_24F2438B0;
      block[1] = 3221225472;
      objc_copyWeak(&v36, &location);
      block[4] = self;
      block[5] = v37;
      dispatch_sync(ouframeQueue, block);
      -[NSMutableDictionary allValues](self->skipedKeyframes_, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeAllObjects](self->skipedKeyframes_, "removeAllObjects");
      detQueue = self->detQueue_;
      v27 = v18;
      v28 = 3221225472;
      v29 = __41__OUSession_updateWithKeyframes_ouframe___block_invoke_2;
      v30 = &unk_24F2438D8;
      objc_copyWeak(&v34, &location);
      v21 = v19;
      v32 = self;
      v33 = v37;
      v31 = v21;
      dispatch_async(detQueue, &v27);
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = -[NSArray count](self->objects_, "count", v27, v28, v29, v30);
        v24 = -[NSMutableDictionary count](self->allKeyframes_, "count");
        v25 = objc_msgSend(v5, "count");
        v26 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 134218752;
        v45 = v23;
        v46 = 2048;
        v47 = v24;
        v48 = 2048;
        v49 = v25;
        v50 = 2048;
        v51 = v26;
        _os_log_impl(&dword_2294C8000, v22, OS_LOG_TYPE_INFO, "[OD] Detected objects number: %lu in %lu keyframes (%lu, %lu)", buf, 0x2Au);
      }

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      _Block_object_dispose(v37, 8);

      objc_destroyWeak(&location);
    }
  }

}

void __41__OUSession_updateWithKeyframes_ouframe___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
    WeakRetained = v3;
  }

}

void __41__OUSession_updateWithKeyframes_ouframe___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)WeakRetained + 8);
    *((_QWORD *)WeakRetained + 8) = v3;

    objc_msgSend(*((id *)WeakRetained + 3), "updatePipelineWithKeyframes:ouframe:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)WeakRetained + 10);
    *((_QWORD *)WeakRetained + 10) = v5;

    objc_msgSend(*((id *)WeakRetained + 10), "objects");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)WeakRetained + 9);
    *((_QWORD *)WeakRetained + 9) = v7;

    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "session:didUpdateDetectedObjects:", WeakRetained, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));

    }
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "session:didUpdateObjectAsset:", WeakRetained, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));

    }
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 6));
  }

}

- (void)updateWithFrame:(id)a3
{
  id v4;
  void *v5;
  NSObject *ouframeQueue;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(v4, "sceneCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    ouframeQueue = self->ouframeQueue_;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__OUSession_updateWithFrame___block_invoke;
    block[3] = &unk_24F243900;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(ouframeQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __29__OUSession_updateWithFrame___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 14, *(id *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)generateOfflineObjects:(id)a3 onlineObjects:(id)a4
{
  id v6;
  id v7;
  NSObject *detQueue;
  _QWORD block[4];
  id v10;
  id v11;
  OUSession *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->detSemaphore_, 0xFFFFFFFFFFFFFFFELL))
  {
    objc_initWeak(&location, self);
    detQueue = self->detQueue_;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke;
    block[3] = &unk_24F243928;
    objc_copyWeak(&v13, &location);
    v10 = v6;
    v11 = v7;
    v12 = self;
    dispatch_async(detQueue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "generateOfflineObjects:onlineObjects:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v3[11];
    v3[11] = (id)v4;

    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke_cold_1(buf, objc_msgSend(v3[11], "count"), v6);

    objc_msgSend(v3, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v3, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "session:didGeneratedOfflineObjects:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));

    }
    objc_msgSend(v3, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v3, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session:didGeneratedOfflineObjectAsset:", v3, v3[10]);

    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v3[6]);
  }

}

- (void)generateOfflineObjects:(id)a3 onlineObjects:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *detQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  detQueue = self->detQueue_;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__OUSession_generateOfflineObjects_onlineObjects_block___block_invoke;
  v15[3] = &unk_24F243950;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(detQueue, v15);

}

uint64_t __56__OUSession_generateOfflineObjects_onlineObjects_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "generateOfflineObjects:onlineObjects:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)v2 + 88);
  *(_QWORD *)(*(_QWORD *)v2 + 88) = v3;

  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    v8 = objc_msgSend(*(id *)(a1 + 48), "count");
    v10 = 134218496;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    _os_log_impl(&dword_2294C8000, v5, OS_LOG_TYPE_INFO, "[OD] Offline detected objects number: %lu, from %lu keyframes and %lu online objects", (uint8_t *)&v10, 0x20u);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  return result;
}

- (void)generateOfflineObjectAsset:(id)a3 onlineObjects:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *detQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  detQueue = self->detQueue_;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__OUSession_generateOfflineObjectAsset_onlineObjects_block___block_invoke;
  v15[3] = &unk_24F243950;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(detQueue, v15);

}

uint64_t __60__OUSession_generateOfflineObjectAsset_onlineObjects_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "generateOfflineObjects:onlineObjects:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)v2 + 88);
  *(_QWORD *)(*(_QWORD *)v2 + 88) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)v2 + 16), "getObjectAsset");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)v2 + 80);
  *(_QWORD *)(*(_QWORD *)v2 + 80) = v5;

  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    v10 = objc_msgSend(*(id *)(a1 + 48), "count");
    v12 = 134218496;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    v16 = 2048;
    v17 = v10;
    _os_log_impl(&dword_2294C8000, v7, OS_LOG_TYPE_INFO, "[OD] Offline detected objects number: %lu, from %lu keyframes and %lu online objects", (uint8_t *)&v12, 0x20u);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  return result;
}

- (void)stop
{
  NSObject *detQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  detQueue = self->detQueue_;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __17__OUSession_stop__block_invoke;
  v4[3] = &unk_24F243978;
  objc_copyWeak(&v5, &location);
  dispatch_async(detQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __17__OUSession_stop__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  __int16 v4[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "clear");
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_2294C8000, v3, OS_LOG_TYPE_INFO, "Detected objects session ends.", (uint8_t *)v4, 2u);
    }

  }
}

- (OUSessionDelegate)delegate
{
  return (OUSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workgroupFrame, 0);
  objc_storeStrong((id *)&self->_workgroupOD, 0);
  objc_storeStrong((id *)&self->ouframe_, 0);
  objc_storeStrong((id *)&self->skipedKeyframes_, 0);
  objc_storeStrong((id *)&self->allKeyframes_, 0);
  objc_storeStrong((id *)&self->offline_objects_, 0);
  objc_storeStrong((id *)&self->object_asset_, 0);
  objc_storeStrong((id *)&self->objects_, 0);
  objc_storeStrong((id *)&self->_detStartDate, 0);
  objc_storeStrong((id *)&self->detSemaphore_, 0);
  objc_storeStrong((id *)&self->ouframeQueue_, 0);
  objc_storeStrong((id *)&self->detQueue_, 0);
  objc_storeStrong((id *)&self->ouPipeline_, 0);
  objc_storeStrong((id *)&self->det3d_, 0);
  objc_storeStrong((id *)&self->configuration_, 0);
}

- (void)init:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1);
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0_6(&dword_2294C8000, v2, v3, "OUOnline Error: (init) %s", v4, v5, v6, v7, v8);
  }
  OUTLINED_FUNCTION_3_1();
}

- (void)init:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1);
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0_6(&dword_2294C8000, v2, v3, "OUOffline Error: (init) %s", v4, v5, v6, v7, v8);
  }
  OUTLINED_FUNCTION_3_1();
}

- (void)runWithConfiguration:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6(&dword_2294C8000, v1, v2, "OUError: (init) %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

- (void)runWithConfiguration:(void *)a3 .cold.2(void *a1, uint64_t a2, void **a3)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  *a3 = OUTLINED_FUNCTION_6(a1);
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v3 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_2_0(v3))
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0_6(&dword_2294C8000, v4, v5, "OUError: (run) %s", v6, v7, v8, v9, v10);
  }
  OUTLINED_FUNCTION_3_1();
}

- (void)runWithConfiguration:(uint64_t)a1 .cold.4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6(&dword_2294C8000, v1, v2, "OUError: (run) %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

void __41__OUSession_updateWithKeyframes_ouframe___block_invoke_2_cold_1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1);
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0_6(&dword_2294C8000, v2, v3, "OUError: (online) %s", v4, v5, v6, v7, v8);
  }
  OUTLINED_FUNCTION_3_1();
}

void __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_error_impl(&dword_2294C8000, log, OS_LOG_TYPE_ERROR, "[OD] Offline detected objects number: %lu", buf, 0xCu);
}

void __50__OUSession_generateOfflineObjects_onlineObjects___block_invoke_cold_2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6(a1);
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_2_0(v1))
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0_6(&dword_2294C8000, v2, v3, "OUError: (offline) %s", v4, v5, v6, v7, v8);
  }
  OUTLINED_FUNCTION_3_1();
}

@end
