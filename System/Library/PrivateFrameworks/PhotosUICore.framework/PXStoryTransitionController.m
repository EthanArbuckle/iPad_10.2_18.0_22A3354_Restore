@implementation PXStoryTransitionController

- (PXStoryTransitionController)initWithModel:(id)a3 transitionSource:(id)a4
{
  id v6;
  id v7;
  PXStoryTransitionController *v8;
  PXStoryTransitionController *v9;
  id v10;
  id WeakRetained;
  PXStoryTransitionController *v12;
  PXStoryTransitionProducer *v13;
  PXStoryTransitionProducer *transitionProducer;
  NSMutableArray *v15;
  NSMutableArray *activeClipTransitions;
  _QWORD v18[4];
  PXStoryTransitionController *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryTransitionController;
  v8 = -[PXStoryController initWithObservableModel:](&v20, sel_initWithObservableModel_, v6);
  v9 = v8;
  if (v8)
  {
    v10 = objc_storeWeak((id *)&v8->_model, v6);
    objc_msgSend(v6, "registerChangeObserver:context:", v9, ModelObservationContext_183038);

    WeakRetained = objc_loadWeakRetained((id *)&v9->_model);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__PXStoryTransitionController_initWithModel_transitionSource___block_invoke;
    v18[3] = &unk_1E5142E50;
    v12 = v9;
    v19 = v12;
    objc_msgSend(WeakRetained, "performChanges:", v18);

    v12->_activeTransition.fromSegmentIdentifier = 0;
    v12->_activeTransition.toSegmentIdentifier = 0;
    objc_storeWeak((id *)&v12->_transitionSource, v7);
    v13 = objc_alloc_init(PXStoryTransitionProducer);
    transitionProducer = v12->_transitionProducer;
    v12->_transitionProducer = v13;

    v12->_currentSegmentIdentifier = objc_msgSend(v6, "currentSegmentIdentifier");
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeClipTransitions = v12->_activeClipTransitions;
    v12->_activeClipTransitions = v15;

  }
  return v9;
}

- (void)setCurrentSegmentIdentifier:(int64_t)a3 allowTransitions:(BOOL)a4
{
  int64_t currentSegmentIdentifier;
  _BOOL4 v5;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  currentSegmentIdentifier = self->_currentSegmentIdentifier;
  if (currentSegmentIdentifier != a3)
  {
    v5 = a4;
    self->_currentSegmentIdentifier = a3;
    v8 = -[PXStoryTransitionController activeTransition](self, "activeTransition");
    if (v8 | v9)
    {
      +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v5 && (objc_msgSend(v10, "suppressInterruptedTransitionErrors") & 1) == 0)
        -[PXStoryTransitionController _reportInterruptedTransitionForNewTransitionBetweenSegmentWithIdentifier:andSegmentWithIdentifier:](self, "_reportInterruptedTransitionForNewTransitionBetweenSegmentWithIdentifier:andSegmentWithIdentifier:", currentSegmentIdentifier, a3);
      -[PXStoryTransitionController _interruptActiveTransitions](self, "_interruptActiveTransitions");

    }
    if (v5)
    {
      -[PXStoryTransitionController model](self, "model");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeline");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v14, "indexOfSegmentWithIdentifier:", currentSegmentIdentifier);
      if (v13 + 1 == objc_msgSend(v14, "indexOfSegmentWithIdentifier:", a3))
        -[PXStoryTransitionController _updatePendingTransitionModelWithSegmentTransitionInfo:](self, "_updatePendingTransitionModelWithSegmentTransitionInfo:", currentSegmentIdentifier, a3);

    }
  }
}

- (void)_updatePendingTransitionModelWithSegmentTransitionInfo:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  PXStoryTransitionModel *v17;
  PXStoryTransitionModel *v18;
  PXStoryTransitionModel *v19;
  void (**v20)(void *, int64_t, uint64_t);
  _QWORD aBlock[4];
  id v22;
  PXStoryTransitionController *v23;
  PXStoryTransitionModel *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  __int128 v31;
  _BYTE v32[23];
  _OWORD v33[2];
  uint64_t v34;
  _OWORD v35[2];
  uint64_t v36;
  __int128 v37;
  _OWORD v38[2];
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  _QWORD v50[12];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  var1 = a3.var1;
  var0 = a3.var0;
  -[PXStoryTransitionController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "size");
  PXRectWithOriginAndSize();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  memset(v50, 0, sizeof(v50));
  if (v7)
  {
    objc_msgSend(v7, "infoForSegmentWithIdentifier:", var0);
    v49 = 0;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    memset(v39, 0, sizeof(v39));
    objc_msgSend(v7, "infoForSegmentWithIdentifier:", var1);
    v16 = v50[6];
  }
  else
  {
    v16 = 0;
    v49 = 0;
    v47 = 0uLL;
    v48 = 0uLL;
    v45 = 0uLL;
    v46 = 0uLL;
    v43 = 0uLL;
    v44 = 0uLL;
    v41 = 0uLL;
    v42 = 0uLL;
    v40 = 0uLL;
    memset(v39, 0, sizeof(v39));
  }
  v37 = *(_OWORD *)((char *)&v50[6] + 1);
  v38[0] = *(_OWORD *)((char *)&v50[8] + 1);
  *(_QWORD *)((char *)v38 + 15) = v50[10];
  if (-[PXStoryTransitionController _canStartTransitionWithKind:](self, "_canStartTransitionWithKind:", v16))
  {
    v17 = [PXStoryTransitionModel alloc];
    v35[0] = *(_OWORD *)&v50[1];
    v35[1] = *(_OWORD *)&v50[3];
    v33[0] = *(_OWORD *)&v39[1];
    v33[1] = *(_OWORD *)&v39[3];
    v31 = v37;
    v36 = v50[5];
    v34 = v39[5];
    v30 = v16;
    *(_OWORD *)v32 = v38[0];
    *(_QWORD *)&v32[15] = *(_QWORD *)((char *)v38 + 15);
    v18 = -[PXStoryTransitionModel initWithSegmentTransitionInfo:orderOutCompositionInfo:orderInCompositionInfo:transitionInfo:](v17, "initWithSegmentTransitionInfo:orderOutCompositionInfo:orderInCompositionInfo:transitionInfo:", var0, var1, v35, v33, &v30);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__PXStoryTransitionController__updatePendingTransitionModelWithSegmentTransitionInfo___block_invoke;
    aBlock[3] = &unk_1E51327E0;
    v25 = v9;
    v26 = v11;
    v27 = v13;
    v28 = v15;
    v22 = v7;
    v23 = self;
    v29 = v16;
    v24 = v18;
    v19 = v18;
    v20 = (void (**)(void *, int64_t, uint64_t))_Block_copy(aBlock);
    v20[2](v20, var0, 2);
    v20[2](v20, var1, 1);
    -[PXStoryTransitionController setPendingTransitionModel:](self, "setPendingTransitionModel:", v19);

  }
}

- (void)startPendingTransitionIfNeeded
{
  void *v3;
  void *v4;
  PXStoryTransitionConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PXStoryTransitionController pendingTransitionModel](self, "pendingTransitionModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryTransitionController setPendingTransitionModel:](self, "setPendingTransitionModel:", 0);
    -[PXStoryTransitionController model](self, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(PXStoryTransitionConfiguration);
    -[PXStoryTransitionConfiguration setTransitionModel:](v5, "setTransitionModel:", v3);
    -[PXStoryTransitionController entityManager](self, "entityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTransitionConfiguration setEntityManager:](v5, "setEntityManager:", v6);

    -[PXStoryTransitionController transitionSource](self, "transitionSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTransitionConfiguration setSource:](v5, "setSource:", v7);

    objc_msgSend(v4, "timeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTransitionConfiguration setTimeline:](v5, "setTimeline:", v8);

    objc_msgSend(v4, "timelineSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTransitionConfiguration setTimelineSpec:](v5, "setTimelineSpec:", v9);

    -[PXStoryTransitionProducer transitionsWithConfiguration:](self->_transitionProducer, "transitionsWithConfiguration:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          -[PXStoryTransitionController _startTransition:](self, "_startTransition:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }
    if (!objc_msgSend(v10, "count"))
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __61__PXStoryTransitionController_startPendingTransitionIfNeeded__block_invoke;
      v24[3] = &unk_1E5132808;
      v24[4] = self;
      -[PXStoryTransitionController performChanges:](self, "performChanges:", v24);
    }
    -[PXStoryTransitionProducer fallbackTransitionReasons](self->_transitionProducer, "fallbackTransitionReasons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 >= 1)
    {
      PXStoryErrorCreateWithCodeDebugFormat(18, CFSTR("Transitions fell back to cuts %ld times."), v17, v18, v19, v20, v21, v22, v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryTransitionController setCurrentError:](self, "setCurrentError:", v23);

    }
  }

}

- (void)_startTransition:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryTransitionController log](self, "log");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134218242;
      v21 = -[PXStoryTransitionController logContext](self, "logContext");
      v22 = 2114;
      v23 = v4;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXStoryTransitionActive", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
    }
  }

  if (v4)
  {
    -[NSMutableArray addObject:](self->_activeClipTransitions, "addObject:", v4);
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    objc_msgSend(v4, "completionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__PXStoryTransitionController__startTransition___block_invoke;
    v15[3] = &unk_1E5132830;
    objc_copyWeak(&v17, (id *)buf);
    objc_copyWeak(&v18, &location);
    v10 = v8;
    v16 = v10;
    objc_msgSend(v4, "setCompletionHandler:", v15);
    -[PXStoryTransitionController model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __48__PXStoryTransitionController__startTransition___block_invoke_2;
    v13[3] = &unk_1E51459A0;
    v14 = v4;
    objc_msgSend(v12, "performChanges:", v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_interruptActiveTransitions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXStoryTransitionController setPendingTransitionModel:](self, "setPendingTransitionModel:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_activeClipTransitions, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_msgSend(v8, "performChanges:", &__block_literal_global_14_183061);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_reportInterruptedTransitionForNewTransitionBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v7 = -[PXStoryTransitionController activeTransition](self, "activeTransition");
  v9 = v8;
  -[PXStoryTransitionController interruptedTransitionErrorDescriptions](self, "interruptedTransitionErrorDescriptions");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld → %ld"), a3, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld → %ld"), v7, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("New transition (%@) started while existing one (%@) was in progress."), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObject:", v17);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryTransitionController setInterruptedTransitionErrorDescriptions:](self, "setInterruptedTransitionErrorDescriptions:", v26);
  v18 = objc_msgSend(v26, "count");
  PXStoryErrorCreateWithCodeDebugFormat(18, CFSTR("Transitions got interrupted %ld times."), v19, v20, v21, v22, v23, v24, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTransitionController setCurrentError:](self, "setCurrentError:", v25);

}

- (void)_handleTransitionCompleted:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryTransitionController log](self, "log");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      v10 = -[PXStoryTransitionController logContext](self, "logContext");
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryTransitionActive", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  -[NSMutableArray removeObject:](self->_activeClipTransitions, "removeObject:", v4);
  if (!-[NSMutableArray count](self->_activeClipTransitions, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__PXStoryTransitionController__handleTransitionCompleted___block_invoke;
    v8[3] = &unk_1E5132808;
    v8[4] = self;
    -[PXStoryTransitionController performChanges:](self, "performChanges:", v8);
  }

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionController;
  -[PXStoryController performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setPendingTransitionModel:(id)a3
{
  PXStoryTransitionModel *v5;
  _QWORD v6[5];
  PXStoryTransitionModel *v7;

  v5 = (PXStoryTransitionModel *)a3;
  if (self->_pendingTransitionModel != v5)
  {
    objc_storeStrong((id *)&self->_pendingTransitionModel, a3);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __57__PXStoryTransitionController_setPendingTransitionModel___block_invoke;
      v6[3] = &unk_1E5132878;
      v6[4] = self;
      v7 = v5;
      -[PXStoryTransitionController performChanges:](self, "performChanges:", v6);

    }
  }

}

- (void)setActiveTransition:(id)a3
{
  $8C9244E3D42D84E0B7FD6D08D56F93FB *p_activeTransition;
  int64_t fromSegmentIdentifier;
  int64_t toSegmentIdentifier;
  int64_t var1;
  int64_t var0;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_activeTransition = &self->_activeTransition;
  fromSegmentIdentifier = self->_activeTransition.fromSegmentIdentifier;
  toSegmentIdentifier = self->_activeTransition.toSegmentIdentifier;
  if (fromSegmentIdentifier != a3.var0 || toSegmentIdentifier != a3.var1)
  {
    var1 = a3.var1;
    var0 = a3.var0;
    if (fromSegmentIdentifier | toSegmentIdentifier)
    {
      -[PXStoryTransitionController log](self, "log");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = os_signpost_id_make_with_pointer(v10, self);
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          v17 = 134217984;
          v18 = -[PXStoryTransitionController logContext](self, "logContext");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryTransitionControllerChangedActiveTransition", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
        }
      }

    }
    if (var0 | var1)
    {
      -[PXStoryTransitionController log](self, "log");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = os_signpost_id_make_with_pointer(v13, self);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v15 = v14;
        if (os_signpost_enabled(v13))
        {
          v16 = -[PXStoryTransitionController logContext](self, "logContext");
          v17 = 134218496;
          v18 = v16;
          v19 = 2048;
          v20 = var0;
          v21 = 2048;
          v22 = var1;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryTransitionControllerChangedActiveTransition", "Context=%{signpost.telemetry:string2}lu segmentIdentifier: %ld -> %ld", (uint8_t *)&v17, 0x20u);
        }
      }

    }
    p_activeTransition->fromSegmentIdentifier = var0;
    p_activeTransition->toSegmentIdentifier = var1;
    -[PXStoryTransitionController signalChange:](self, "signalChange:", 1);
  }
}

- (BOOL)_canStartTransitionWithKind:(char)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  BOOL v10;
  void *v12;

  v4 = a3;
  -[PXStoryTransitionController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "desiredPlayState");
  -[PXStoryTransitionController entityManager](self, "entityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v10 = objc_msgSend(v5, "viewMode") == 4 && (v4 - 4) < 0xFFFFFFFD;
  if (v6 == 1 && !v10 && v7)
  {
    if ((objc_msgSend(v5, "isScrolling") & 1) != 0
      || (objc_msgSend(v5, "inLiveResize") & 1) != 0
      || (objc_msgSend(v5, "isTouching") & 1) != 0
      || (objc_msgSend(v5, "isPerformingViewControllerTransition") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "wantsTransitions");

    }
  }

  return v8;
}

- (void)enumerateClipIdentifiersForPendingTransitionUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v4 = a3;
  -[PXStoryTransitionController pendingTransitionModel](self, "pendingTransitionModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  if (v5)
  {
    objc_msgSend(v5, "transitionInfo");
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "orderOutCompositionInfo");
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "orderInCompositionInfo");
  }
  else
  {
    v24 = 0;
    v22 = 0uLL;
    v23 = 0uLL;
    v21 = 0;
    v19 = 0uLL;
    v20 = 0uLL;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PXStoryTransitionController_enumerateClipIdentifiersForPendingTransitionUsingBlock___block_invoke;
  v8[3] = &unk_1E51328A0;
  v10 = v25;
  v11 = v26;
  v12 = v27;
  v13 = v22;
  v14 = v23;
  v15 = v24;
  v18 = v21;
  v17 = v20;
  v16 = v19;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateClipIdentifiersUsingBlock:", v8);

}

- (void)enumerateClipIdentifiersForActiveTransitionsUsingBlock:(id)a3
{
  void (**v3)(id, uint64_t, char *);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[96];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, char *))a3;
  PXFilter();
  v27 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v9, "clipLayouts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "clip");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15)
              {
                objc_msgSend(v15, "info");
                v17 = v18[0];
              }
              else
              {
                bzero(v18, 0x300uLL);
                v17 = 0;
              }
              v3[2](v3, v17, &v27);

              if (v27)
              {

                goto LABEL_21;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v6);
  }
LABEL_21:

}

- (void)setCurrentError:(id)a3
{
  NSError *v5;
  NSError **p_currentError;
  NSError *v7;
  NSError *v8;
  char v9;
  NSObject *v10;
  int v11;
  NSError *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (NSError *)a3;
  p_currentError = &self->_currentError;
  v7 = *p_currentError;
  if (v7 == v5)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSError isEqual:](v7, "isEqual:", v5);

    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)p_currentError, a3);
      if (v5)
      {
        PLStoryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = v5;
          _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_INFO, "Transition controller encountered error: %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if ((void *)ModelObservationContext_183038 == a5)
  {
    if ((a4 & 0x40020) != 0)
      -[PXStoryTransitionController _updateCurrentSegmentIdentifierIfNeeded](self, "_updateCurrentSegmentIdentifierIfNeeded");
    if ((a4 & 0x400010000) != 0)
      -[PXStoryTransitionController _interruptActiveTransitions](self, "_interruptActiveTransitions");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryTransitionController;
    -[PXStoryController observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (void)_updateCurrentSegmentIdentifierIfNeeded
{
  void *v3;
  BOOL v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;

  -[PXStoryTransitionController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "shouldPauseTransitions") & 1) == 0 && objc_msgSend(v3, "lastPlaybackTimeChangeSource") == 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PXStoryTransitionController__updateCurrentSegmentIdentifierIfNeeded__block_invoke;
  v6[3] = &unk_1E5132908;
  v7 = v3;
  v8 = v4;
  v5 = v3;
  -[PXStoryTransitionController performChanges:](self, "performChanges:", v6);

}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  void *v22;
  const __CFString *v23;
  int64_t currentSegmentIdentifier;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t i;
  __CFString *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  uint64_t j;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  PXStoryTransitionController *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int *v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  _OWORD v61[3];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  objc_msgSend(WeakRetained, "timeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0uLL;
  v71 = 0;
  v8 = objc_loadWeakRetained((id *)&self->_model);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "nominalPlaybackTime");
  }
  else
  {
    v70 = 0uLL;
    v71 = 0;
  }

  +[PXStoryAutoEditConfigurationFactory autoEditConfiguration](PXStoryAutoEditConfigurationFactory, "autoEditConfiguration");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)&self->_model);
  objc_msgSend(v10, "currentStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originalColorGradeCategory");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "size");
  PXRectWithOriginAndSize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  if (v7)
    objc_msgSend(v7, "timeRangeForSegmentWithIdentifier:", self->_currentSegmentIdentifier);
  v65 = v67;
  v66 = v68;
  v21 = (int *)malloc_type_calloc(0xAuLL, 4uLL, 0x100004052888210uLL);
  v62 = v70;
  *(_QWORD *)&v63 = v71;
  PXStoryTimeDescription((CMTime *)&v62);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Time: %@\n"), v22);

  v23 = CFSTR("-");
  if (v12)
    v23 = v12;
  objc_msgSend(v5, "appendFormat:", CFSTR("Style: %@\n"), v23);
  currentSegmentIdentifier = self->_currentSegmentIdentifier;
  v62 = v67;
  v63 = v68;
  v64 = v69;
  PXStoryTimeRangeDescription((uint64_t)&v62);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Current Segment %ld @ %@\n"), currentSegmentIdentifier, v25);

  v26 = -[PXStoryTransitionController activeTransition](self, "activeTransition");
  -[PXStoryTransitionController activeTransition](self, "activeTransition");
  objc_msgSend(v5, "appendFormat:", CFSTR("Active Transition %ld -> %ld\n"), v26, v27);
  if (v7)
    objc_msgSend(v7, "timeRange");
  else
    memset(v61, 0, sizeof(v61));
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke;
  v48[3] = &unk_1E5132980;
  v28 = v5;
  v49 = v28;
  v29 = v7;
  v52 = v14;
  v53 = v16;
  v54 = v18;
  v55 = v20;
  v50 = v29;
  v51 = self;
  v57 = v70;
  v58 = v71;
  v59 = v65;
  v60 = v66;
  v56 = v21;
  objc_msgSend(v29, "enumerateSegmentsInTimeRange:usingBlock:", v61, v48);
  objc_msgSend(v28, "appendFormat:", CFSTR("Counts:\n"));
  for (i = 0; i != 10; ++i)
  {
    if (v21[i] >= 1)
    {
      v31 = off_1E5136018[i];
      objc_msgSend(v28, "appendFormat:", CFSTR(" - %@ : %d\n"), v31, v21[i]);

    }
  }
  free(v21);
  v32 = objc_loadWeakRetained((id *)&self->_model);
  objc_msgSend(v32, "currentStyle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "songResource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "px_storyResourceSongAsset");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "defaultTransitionTable");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "transitionsForColorGrade:songPace:", v12, objc_msgSend(v35, "pace"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = 0;
  do
  {
    objc_msgSend(v37, "objectAtIndexedSubscript:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 += objc_msgSend(v40, "intValue");

    ++v38;
  }
  while (v38 != 9);
  if (v39 > 0)
  {
    objc_msgSend(v28, "appendFormat:", CFSTR("Expected Ratios:\n"));
    for (j = 0; j != 9; ++j)
    {
      objc_msgSend(v37, "objectAtIndexedSubscript:", j);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (double)(int)objc_msgSend(v42, "intValue") * 100.0 / (double)v39;

      if (v43 > 0.0)
      {
        PFStoryRecipeClipTransitionKindDescription();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "appendFormat:", CFSTR(" - %@ : %.2f%%\n"), v44, *(_QWORD *)&v43);

      }
    }
  }
  v45 = (void *)objc_msgSend(v28, "copy");

  return v45;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  -[PXStoryTransitionController currentError](self, "currentError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Transitions"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXStoryTransitionProducer fallbackTransitionReasons](self->_transitionProducer, "fallbackTransitionReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);
  -[PXStoryTransitionController interruptedTransitionErrorDescriptions](self, "interruptedTransitionErrorDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttachmentWithText:name:", v7, CFSTR("TransitionErrors"));

  }
}

- (PXGEntityManager)entityManager
{
  return (PXGEntityManager *)objc_loadWeakRetained((id *)&self->_entityManager);
}

- (void)setEntityManager:(id)a3
{
  objc_storeWeak((id *)&self->_entityManager, a3);
}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)activeTransition
{
  $8C9244E3D42D84E0B7FD6D08D56F93FB *p_activeTransition;
  int64_t fromSegmentIdentifier;
  int64_t toSegmentIdentifier;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_activeTransition = &self->_activeTransition;
  fromSegmentIdentifier = self->_activeTransition.fromSegmentIdentifier;
  toSegmentIdentifier = p_activeTransition->toSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- (PXStoryTransitionSource)transitionSource
{
  return (PXStoryTransitionSource *)objc_loadWeakRetained((id *)&self->_transitionSource);
}

- (int64_t)currentSegmentIdentifier
{
  return self->_currentSegmentIdentifier;
}

- (void)setCurrentSegmentIdentifier:(int64_t)a3
{
  self->_currentSegmentIdentifier = a3;
}

- (PXStoryTransitionModel)pendingTransitionModel
{
  return self->_pendingTransitionModel;
}

- (NSError)currentError
{
  return self->_currentError;
}

- (NSArray)interruptedTransitionErrorDescriptions
{
  return self->_interruptedTransitionErrorDescriptions;
}

- (void)setInterruptedTransitionErrorDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_interruptedTransitionErrorDescriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptedTransitionErrorDescriptions, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_pendingTransitionModel, 0);
  objc_destroyWeak((id *)&self->_transitionSource);
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_entityManager);
  objc_storeStrong((id *)&self->_transitionProducer, 0);
  objc_storeStrong((id *)&self->_activeClipTransitions, 0);
}

void __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  __int128 v16;
  unint64_t v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  __int128 *v30;
  __int128 *v31;
  _OWORD v32[3];
  _QWORD v33[5];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  if (a2 >= 1)
  {
    v45 = v11;
    v46 = v10;
    v47 = v9;
    v48 = v8;
    v49 = v7;
    v50 = v6;
    v51 = v4;
    v52 = v5;
    v14 = a2;
    v31 = (__int128 *)(a1 + 96);
    v30 = (__int128 *)(a1 + 120);
    do
    {
      v16 = a3[1];
      v42 = *a3;
      v43 = v16;
      v44 = a3[2];
      v17 = *(unsigned __int8 *)(a4 + 48);
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Segment: %ld @"), *(_QWORD *)a4);
      v18 = CFSTR("??");
      if (v17 <= 0xA)
        v18 = off_1E5136018[v17];
      a4 += 200;
      v19 = v18;
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" ➡️: %@\n"), v19);
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" Clips: "));
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_2;
      v33[3] = &unk_1E5132958;
      v39 = *((_QWORD *)v31 + 2);
      v41 = *((_QWORD *)v30 + 2);
      v22 = *(void **)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 48);
      v35 = v42;
      v36 = v43;
      v37 = v44;
      v38 = *v31;
      v40 = *v30;
      v33[4] = v21;
      v34 = v20;
      v32[0] = v42;
      v32[1] = v43;
      v32[2] = v44;
      v23 = *(double *)(a1 + 56);
      v24 = *(double *)(a1 + 64);
      v25 = *(double *)(a1 + 72);
      v26 = *(double *)(a1 + 80);
      v27 = v20;
      objc_msgSend(v22, "enumerateClipsInTimeRange:rect:usingBlock:", v32, v33, v23, v24, v25, v26);
      v28 = *(void **)(a1 + 32);
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "appendFormat:", CFSTR("%@ \n"), v29);

      ++*(_DWORD *)(*(_QWORD *)(a1 + 88) + 4 * (char)v17);
      a3 += 3;
      --v14;
    }
    while (v14);
  }
}

void __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_2(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7;
  _OWORD *v9;
  CMTime *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  __int128 v15;
  const __CFString *v16;
  __int128 v17;
  int v18;
  CMTime *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTimeRange range;
  CMTime time;

  if (a2 >= 1)
  {
    v7 = a2;
    v9 = (_OWORD *)(a1 + 48);
    v10 = (CMTime *)(a1 + 96);
    v19 = (CMTime *)(a1 + 120);
    do
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v12 = *a5;
      v13 = a3[1];
      v25 = *a3;
      v26 = v13;
      v27 = a3[2];
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v14 = *(void **)(a1 + 32);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_3;
      v20[3] = &unk_1E5132930;
      v20[4] = &v21;
      v20[5] = v12;
      objc_msgSend(v14, "enumerateClipIdentifiersForActiveTransitionsUsingBlock:", v20);
      if (*((_BYTE *)v22 + 24))
      {
        v15 = v9[1];
        *(_OWORD *)&range.start.value = *v9;
        *(_OWORD *)&range.start.epoch = v15;
        *(_OWORD *)&range.duration.timescale = v9[2];
        *(_OWORD *)&time.value = v25;
        time.epoch = v26;
        if (CMTimeRangeContainsTime(&range, &time))
          v16 = CFSTR("▶️");
        else
          v16 = CFSTR("✅");
      }
      else
      {
        v17 = v9[1];
        *(_OWORD *)&range.start.value = *v9;
        *(_OWORD *)&range.start.epoch = v17;
        *(_OWORD *)&range.duration.timescale = v9[2];
        time = *v10;
        v18 = CMTimeRangeContainsTime(&range, &time);
        v16 = CFSTR("🟧");
        if (!v18)
        {
          *(_OWORD *)&range.start.value = v25;
          range.start.epoch = v26;
          time = *v19;
          if (CMTimeCompare(&range.start, &time) >= 0)
            v16 = CFSTR("🟥");
          else
            v16 = CFSTR("✅");
        }
      }
      objc_msgSend(v11, "appendFormat:", v16);
      objc_msgSend(v11, "appendFormat:", CFSTR(" %ld"), v12);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      a5 += 96;
      _Block_object_dispose(&v21, 8);

      a3 += 3;
      --v7;
    }
    while (v7);
  }
}

uint64_t __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_3(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 40) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __70__PXStoryTransitionController__updateCurrentSegmentIdentifierIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setCurrentSegmentIdentifier:allowTransitions:", objc_msgSend(v3, "currentSegmentIdentifier"), *(unsigned __int8 *)(a1 + 40));

}

uint64_t __86__PXStoryTransitionController_enumerateClipIdentifiersForActiveTransitionsUsingBlock___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __86__PXStoryTransitionController_enumerateClipIdentifiersForPendingTransitionUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v5;
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  v5 = *(_OWORD *)(a1 + 56);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v5;
  v11 = *(_QWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 96);
  v8[0] = *(_OWORD *)(a1 + 80);
  v8[1] = v6;
  v9 = *(_QWORD *)(a1 + 112);
  PXStoryTransitionGetLayoutOrder(v10, (uint64_t)v8, a3, a4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PXStoryTransitionController_setPendingTransitionModel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 40), "segmentTransitionInfo");
  return objc_msgSend(*(id *)(a1 + 32), "setActiveTransition:", v2, v3);
}

uint64_t __58__PXStoryTransitionController__handleTransitionCompleted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveTransition:", 0, 0);
}

uint64_t __58__PXStoryTransitionController__interruptActiveTransitions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

uint64_t __48__PXStoryTransitionController__startTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleTransitionCompleted:", v5);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __48__PXStoryTransitionController__startTransition___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addAnimation:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__PXStoryTransitionController_startPendingTransitionIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveTransition:", 0, 0);
}

void __86__PXStoryTransitionController__updatePendingTransitionModelWithSegmentTransitionInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[3];
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "timeRangeForSegmentWithIdentifier:", a2);
    v6 = *(void **)(a1 + 32);
  }
  else
  {
    v6 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__PXStoryTransitionController__updatePendingTransitionModelWithSegmentTransitionInfo___block_invoke_2;
  v9[3] = &unk_1E51327B8;
  v7 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 88);
  v10 = v7;
  v11 = a3;
  v8[0] = v13;
  v8[1] = v14;
  v8[2] = v15;
  objc_msgSend(v6, "enumerateClipsInTimeRange:rect:usingBlock:", v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

uint64_t __86__PXStoryTransitionController__updatePendingTransitionModelWithSegmentTransitionInfo___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];
  _BYTE v15[752];
  _BYTE __dst[752];
  uint64_t v17;
  uint64_t v18;

  if (a2 >= 1)
  {
    v17 = v5;
    v18 = v6;
    v7 = a2;
    v8 = result;
    v9 = (_QWORD *)(a5 + 16);
    do
    {
      v10 = *(v9 - 2);
      v11 = *(v9 - 1);
      memcpy(__dst, v9, sizeof(__dst));
      result = objc_msgSend((id)objc_opt_class(), "_isSupportedTransitionWithKind:forClipWithResourceKind:", *(char *)(v8 + 56), v11);
      if ((_DWORD)result)
      {
        v12 = *(void **)(v8 + 40);
        v13 = *(_QWORD *)(v8 + 48);
        v14[0] = v10;
        v14[1] = v11;
        memcpy(v15, __dst, sizeof(v15));
        result = objc_msgSend(v12, "addClipWithIdentifier:info:event:", v10, v14, v13);
      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t __62__PXStoryTransitionController_initWithModel_transitionSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 6);
}

+ (BOOL)_isSupportedTransitionWithKind:(char)a3 forClipWithResourceKind:(int64_t)a4
{
  if (_isSupportedTransitionWithKind_forClipWithResourceKind__onceToken != -1)
    dispatch_once(&_isSupportedTransitionWithKind_forClipWithResourceKind__onceToken, &__block_literal_global_183077);
  return objc_msgSend((id)_isSupportedTransitionWithKind_forClipWithResourceKind__supportedTransitionKinds, "containsIndex:", a4);
}

void __86__PXStoryTransitionController__isSupportedTransitionWithKind_forClipWithResourceKind___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 5);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_isSupportedTransitionWithKind_forClipWithResourceKind__supportedTransitionKinds;
  _isSupportedTransitionWithKind_forClipWithResourceKind__supportedTransitionKinds = v0;

}

@end
