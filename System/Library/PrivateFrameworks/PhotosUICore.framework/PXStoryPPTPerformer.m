@implementation PXStoryPPTPerformer

- (PXStoryPPTPerformer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTPerformer.m"), 77, CFSTR("%s is not available as initializer"), "-[PXStoryPPTPerformer init]");

  abort();
}

- (PXStoryPPTPerformer)initWithDelegate:(id)a3 testOptions:(id)a4
{
  id v6;
  id v7;
  PXStoryPPTPerformer *v8;
  PXStoryPPTPerformer *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *extraResults;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryPPTPerformer;
  v8 = -[PXStoryPPTPerformer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_testOptions, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    extraResults = v9->_extraResults;
    v9->_extraResults = v10;

  }
  return v9;
}

- (PXStoryPPTResultsAggregate)resultsAggregate
{
  PXStoryPPTResultsAggregate *resultsAggregate;
  PXStoryPPTResultsAggregate *v4;
  PXStoryPPTResultsAggregate *v5;

  resultsAggregate = self->_resultsAggregate;
  if (!resultsAggregate)
  {
    v4 = objc_alloc_init(PXStoryPPTResultsAggregate);
    v5 = self->_resultsAggregate;
    self->_resultsAggregate = v4;

    resultsAggregate = self->_resultsAggregate;
  }
  return resultsAggregate;
}

- (void)_finalize
{
  PXStoryPPTResultsAggregate *resultsAggregate;
  PXStoryPPTResultsAggregate *v4;
  void *v5;
  id v6;

  resultsAggregate = self->_resultsAggregate;
  if (resultsAggregate)
  {
    v4 = resultsAggregate;
    -[PXStoryPPTPerformer extraResults](self, "extraResults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTResultsAggregate extraResultsDictionaryRepresentation](v4, "extraResultsDictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  }
}

- (void)enumerateStoryConfigurationsUsingBlock:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[3];
  char v24;

  v7 = a3;
  v8 = a4;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentPPTPreset");
  v11 = objc_msgSend(v9, "currentPPTSubpreset");
  -[PXStoryPPTPerformer testOptions](self, "testOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStoryPPTConfiguration configurationsForPreset:subpreset:testOptions:](PXStoryPPTConfiguration, "configurationsForPreset:subpreset:testOptions:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startedTest:", v14);

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 1;
  -[PXStoryPPTPerformer configurationIterator](self, "configurationIterator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTPerformer.m"), 116, CFSTR("nested configuration enumeration isn't supported yet"));

  }
  objc_msgSend(v13, "count");
  v20 = v13;
  v21 = v14;
  v22 = v7;
  v18 = v21;
  v19 = v8;
  PXIterateAsynchronously();

  _Block_object_dispose(v23, 8);
}

- (void)startSubtestWithName:(id)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startedSubTest:forTest:withMetrics:", v14, v8, v6);

  -[PXStoryPPTPerformer configurationIterator](self, "configurationIterator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < 2)
  {
    -[PXStoryPPTPerformer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startedSubTest:forTest:withMetrics:", v14, v12, v6);
  }
  else
  {
    -[PXStoryPPTPerformer _configurationSpecificSubtestName:](self, "_configurationSpecificSubtestName:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTPerformer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startedSubTest:forTest:withMetrics:", v11, v13, v6);

  }
}

- (void)finishSubtestWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishedSubTest:forTest:", v11, v5);

  -[PXStoryPPTPerformer configurationIterator](self, "configurationIterator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
  {
    -[PXStoryPPTPerformer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishedSubTest:forTest:", v11, v9);
  }
  else
  {
    -[PXStoryPPTPerformer _configurationSpecificSubtestName:](self, "_configurationSpecificSubtestName:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTPerformer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishedSubTest:forTest:", v8, v10);

  }
}

- (id)_configurationSpecificSubtestName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  -[PXStoryPPTPerformer configurationName](self, "configurationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v5, v7);

  return v8;
}

- (void)runPlaybackStartTestWithElement:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  __CFString *v13;
  id v14;
  id v15;
  id v16;

  v6 = a4;
  -[PXStoryPPTPerformer _preparePlaybackTestWithElement:](self, "_preparePlaybackTestWithElement:", a3);
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startedTest:", v7);
  -[PXStoryPPTPerformer startSubtestWithName:metrics:](self, "startSubtestWithName:metrics:", CFSTR("PlaybackStart"), &unk_1E53EA878);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke;
  v12[3] = &unk_1E5139650;
  v12[4] = self;
  v13 = CFSTR("PlaybackStart");
  v14 = v8;
  v15 = v7;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  -[PXStoryPPTPerformer _installPlaybackReadyToPlayHandler:](self, "_installPlaybackReadyToPlayHandler:", v12);

}

- (void)runPlaybackTestWithElement:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PXStoryPPTPerformer *v17;
  id v18;
  id v19;

  v6 = a4;
  -[PXStoryPPTPerformer _preparePlaybackTestWithElement:](self, "_preparePlaybackTestWithElement:", a3);
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer _configurationSpecificSubtestName:](self, "_configurationSpecificSubtestName:", CFSTR("Playback"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke;
  v14[3] = &unk_1E5139650;
  v15 = v9;
  v16 = v7;
  v17 = self;
  v18 = v8;
  v19 = v6;
  v10 = v6;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  -[PXStoryPPTPerformer _installPlaybackReadyToPlayHandler:](self, "_installPlaybackReadyToPlayHandler:", v14);

}

- (void)_preparePlaybackTestWithElement:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PXStoryPPTPerformer setTestElement:](self, "setTestElement:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXStoryPPTPerformer__preparePlaybackTestWithElement___block_invoke;
  v6[3] = &unk_1E5148D08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "installViewDidLoadHandler:", v6);

}

- (void)_installPlaybackReadyToPlayHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  -[PXStoryPPTPerformer testElement](self, "testElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel__preparePlaybackTestWithElement_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTPerformer.m"), 229, CFSTR("%@ called without previous call to %@"), v10, v11);

  }
  -[PXStoryPPTPerformer testElement](self, "testElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke;
  v12[3] = &unk_1E5148CE0;
  v12[4] = self;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "installViewDidLoadHandler:", v12);

}

- (void)_callPlaybackReadyToPlayHandlerIfNeeded
{
  void *v3;
  uint64_t v4;
  void (**v5)(void);

  -[PXStoryPPTPerformer observedModel](self, "observedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "readinessStatus");

  if (v4 == 3)
  {
    -[PXStoryPPTPerformer playbackReadyToPlayHandler](self, "playbackReadyToPlayHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PXStoryPPTPerformer setPlaybackReadyToPlayHandler:](self, "setPlaybackReadyToPlayHandler:", 0);
      v5[2]();
    }

  }
}

- (void)_installPlaybackEndHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  -[PXStoryPPTPerformer playbackEndHandler](self, "playbackEndHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __50__PXStoryPPTPerformer__installPlaybackEndHandler___block_invoke;
  v11 = &unk_1E513F8E8;
  v12 = v5;
  v13 = v4;
  v6 = v4;
  v7 = v5;
  -[PXStoryPPTPerformer setPlaybackEndHandler:](self, "setPlaybackEndHandler:", &v8);
  -[PXStoryPPTPerformer _callPlaybackEndHandlerIfNeeded](self, "_callPlaybackEndHandlerIfNeeded", v8, v9, v10, v11);

}

- (void)_callPlaybackEndHandlerIfNeeded
{
  void *v3;
  int v4;
  void (**v5)(void);

  -[PXStoryPPTPerformer observedModel](self, "observedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAtPlaybackEnd");

  if (v4)
  {
    -[PXStoryPPTPerformer playbackEndHandler](self, "playbackEndHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PXStoryPPTPerformer setPlaybackEndHandler:](self, "setPlaybackEndHandler:", 0);
      v5[2]();
    }

  }
}

- (void)_cleanUpPlaybackTest
{
  -[PXStoryPPTPerformer setObservedModel:](self, "setObservedModel:", 0);
}

- (void)setObservedModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *observedModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  observedModel = self->_observedModel;
  if (observedModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](observedModel, "unregisterChangeObserver:context:", self, ObservedModelObservationContext);
    objc_storeStrong((id *)&self->_observedModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_observedModel, "registerChangeObserver:context:", self, ObservedModelObservationContext);
    v5 = v7;
  }

}

- (void)runScrubbingTestWithElement:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  int64_t v16;

  v6 = a3;
  v7 = a4;
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = -[PXStoryPPTPerformer currentTestIterations](self, "currentTestIterations");
    -[PXStoryPPTPerformer _preparePlaybackTestWithElement:](self, "_preparePlaybackTestWithElement:", v6);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke;
    v11[3] = &unk_1E513AC50;
    v11[4] = self;
    v12 = v6;
    v13 = v8;
    v14 = v9;
    v16 = v10;
    v15 = v7;
    -[PXStoryPPTPerformer _installPlaybackReadyToPlayHandler:](self, "_installPlaybackReadyToPlayHandler:", v11);

  }
  else
  {
    objc_msgSend(v8, "failedTest:withFailureFormat:", v9, CFSTR("Missing PXStoryPlayerTestElement."));
  }

}

- (void)_runScrubbingSubtestsWithTestElement:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PXStoryPPTPerformer__runScrubbingSubtestsWithTestElement_completion___block_invoke;
  v10[3] = &unk_1E51396C8;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[PXStoryPPTPerformer _runScrubbingSubtestWithTestElement:direction:subtestName:completion:](self, "_runScrubbingSubtestWithTestElement:direction:subtestName:completion:", v8, 1, CFSTR("SkipNext-Latency"), v10);

}

- (void)_runScrubbingSubtestWithTestElement:(id)a3 direction:(int64_t)a4 subtestName:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v12 = v9;
  v13 = v8;
  v11 = v10;
  PXIterateAsynchronously();

  _Block_object_dispose(v14, 8);
}

- (void)_skipToSegmentWithTestElement:(id)a3 direction:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[6];
  _QWORD v17[3];
  char v18;

  v8 = a3;
  v9 = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  -[PXStoryPPTPerformer _viewModelForPlayerTestElement:](self, "_viewModelForPlayerTestElement:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke;
  v16[3] = &unk_1E5139740;
  v16[4] = v17;
  v16[5] = a4;
  objc_msgSend(v10, "performChanges:", v16);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke_2;
  v13[3] = &unk_1E5149038;
  v14 = v9;
  v15 = v17;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  _Block_object_dispose(v17, 8);
}

- (void)runScrollingWithTestElement:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXStoryPPTPerformer _pausePlaybackWithTestElement:](self, "_pausePlaybackWithTestElement:", v7);
  -[PXStoryPPTPerformer _tungstenViewFromStoryPlayerTestElement:](self, "_tungstenViewFromStoryPlayerTestElement:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryPPTPerformer _mainScrollViewInTungstenView:](self, "_mainScrollViewInTungstenView:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer _runScrollSubtestOnScrollView:containedInTungstenView:completion:](self, "_runScrollSubtestOnScrollView:containedInTungstenView:completion:", v8, v9, v6);

}

- (id)_tungstenViewFromStoryPlayerTestElement:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "storyView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tungstenView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)runExportTestWithElement:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;
  double v25;

  v6 = a3;
  v7 = a4;
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer testOptions](self, "testOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("exportOrientation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("landscape"));
  if (v12)
    v13 = 1080.0;
  else
    v13 = 1920.0;
  if (v12)
    v14 = 1920.0;
  else
    v14 = 1080.0;
  -[PXStoryPPTPerformer _preparePlaybackTestWithElement:](self, "_preparePlaybackTestWithElement:", v6);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke;
  v19[3] = &unk_1E5139768;
  v19[4] = self;
  v20 = v6;
  v24 = v14;
  v25 = v13;
  v21 = v8;
  v22 = v9;
  v23 = v7;
  v15 = v7;
  v16 = v9;
  v17 = v8;
  v18 = v6;
  -[PXStoryPPTPerformer _installPlaybackReadyToPlayHandler:](self, "_installPlaybackReadyToPlayHandler:", v19);

}

- (void)_exportWithTestElement:(id)a3 atResolution:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  PXStoryExportVideoOptions *v11;
  PXStoryExportManager *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXStoryExportConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(PXStoryExportVideoOptions);
  -[PXStoryExportVideoOptions setFrameRate:](v11, "setFrameRate:", 30);
  -[PXStoryExportVideoOptions setResolution:](v11, "setResolution:", width, height);
  v12 = objc_alloc_init(PXStoryExportManager);
  -[PXStoryExportManager setQualityOfService:](v12, "setQualityOfService:", 25);
  objc_msgSend(v10, "storyView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mainConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  objc_msgSend(v16, "setSongsProducerKind:", 1);
  v17 = -[PXStoryExportConfiguration initWithConfiguration:videoOptions:]([PXStoryExportConfiguration alloc], "initWithConfiguration:videoOptions:", v16, v11);
  v18 = (void *)MEMORY[0x1E0CB3940];
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer configurationName](self, "configurationName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%@.mov"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fileURLWithPath:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLByAppendingPathComponent:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryPPTPerformer setExportManager:](self, "setExportManager:", v12);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke;
  v29[3] = &unk_1E5146918;
  v29[4] = self;
  v30 = v25;
  v31 = v9;
  v26 = v9;
  v27 = v25;
  v28 = -[PXStoryExportManager requestExportWithDestinationURL:configuration:progressHandler:completionHandler:](v12, "requestExportWithDestinationURL:configuration:progressHandler:completionHandler:", v27, v17, 0, v29);

}

- (void)runRecipeProductionTestWithViewConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PXStoryPPTPerformer *v17;
  id v18;
  uint64_t v19;

  v6 = a4;
  v7 = a3;
  -[PXStoryPPTPerformer resultsAggregate](self, "resultsAggregate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer configurationName](self, "configurationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke;
  v14[3] = &unk_1E51397E0;
  v19 = v10;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v6;
  v11 = v6;
  v12 = v9;
  v13 = v8;
  -[PXStoryPPTPerformer _requestRecipeForViewConfiguration:resultHandler:](self, "_requestRecipeForViewConfiguration:resultHandler:", v7, v14);

}

- (void)_requestRecipeForViewConfiguration:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  PXStoryRecipeManager *v8;
  void *v9;
  PXStoryRecipeManager *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  PXStoryRecipeManager *v17;
  _QWORD v18[4];
  PXStoryRecipeManager *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = [PXStoryRecipeManager alloc];
  objc_msgSend(v6, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryRecipeManager initWithConfiguration:](v8, "initWithConfiguration:", v9);

  -[PXStoryPPTPerformer currentTestTimeout](self, "currentTestTimeout");
  v12 = v11;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__228097;
  v27[4] = __Block_byref_object_dispose__228098;
  v28 = 0;
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke;
  v24[3] = &unk_1E5139808;
  v26 = v27;
  v25 = v13;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_2;
  v22[3] = &unk_1E5149198;
  v15 = v25;
  v23 = v15;
  -[PXObservable pxStory_enumerateStatesWithTimeout:watchingChanges:usingBlock:timeoutHandler:](v10, "pxStory_enumerateStatesWithTimeout:watchingChanges:usingBlock:timeoutHandler:", 3, v24, v22, v12);
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_3;
  v18[3] = &unk_1E5140330;
  v19 = v10;
  v20 = v7;
  v21 = v27;
  v16 = v7;
  v17 = v10;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v18);

  _Block_object_dispose(v27, 8);
}

- (void)runTimelineProductionTestWithViewConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];

  v6 = a3;
  v7 = a4;
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer currentTestIterations](self, "currentTestIterations");
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v11 = v6;
  v10 = v7;
  PXIterateAsynchronously();

  _Block_object_dispose(v12, 8);
}

- (void)_produceTimelineForViewConfiguration:(id)a3 recipeManagerWithProducedRecipe:(id)a4 initialCompletionHandler:(id)a5 finalCompletionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  PXStoryResourcesDataSourceManager *v17;
  PXStoryStyleManager *v18;
  void *v19;
  PXStoryStyleManager *v20;
  PXStoryTimelineSpecManager *v21;
  void *v22;
  PXStoryTimelineSpecManager *v23;
  PXStoryTimelineManager *v24;
  void *v25;
  PXStoryTimelineManager *v26;
  double v27;
  double v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[3];
  char v43;
  _QWORD v44[3];
  char v45;

  v10 = a3;
  v11 = a4;
  v33 = a5;
  v34 = a6;
  objc_msgSend(v10, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timelineProducer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    PXStoryTimelineProducerCreateDefault();
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  v17 = -[PXStoryResourcesDataSourceManager initWithRecipeManager:]([PXStoryResourcesDataSourceManager alloc], "initWithRecipeManager:", v11);
  v18 = [PXStoryStyleManager alloc];
  objc_msgSend(v12, "errorReporter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PXStoryStyleManager initWithRecipeManager:errorReporter:](v18, "initWithRecipeManager:errorReporter:", v11, v19);

  v21 = [PXStoryTimelineSpecManager alloc];
  objc_msgSend(v10, "extendedTraitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PXStoryTimelineSpecManager initWithExtendedTraitCollection:configuration:](v21, "initWithExtendedTraitCollection:configuration:", v22, v12);

  v24 = [PXStoryTimelineManager alloc];
  objc_msgSend(v12, "errorReporter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  v26 = -[PXStoryTimelineManager initWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:loadingCoordinator:errorReporter:options:paperTrailOptions:](v24, "initWithTimelineProducer:resourcesDataSourceManager:styleManager:specManager:loadingCoordinator:errorReporter:options:paperTrailOptions:", v16, v17, v20, v23, 0, v25, 0, 0);

  -[PXStoryPPTPerformer currentTestTimeout](self, "currentTestTimeout");
  v28 = v27;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v29 = MEMORY[0x1E0C809B0];
  v43 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke;
  v37[3] = &unk_1E51398F8;
  v40 = v44;
  v30 = v33;
  v38 = v30;
  v41 = v42;
  v39 = v34;
  v35[0] = v29;
  v35[1] = 3221225472;
  v35[2] = __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke_2;
  v35[3] = &unk_1E5148A40;
  v31 = v39;
  v36 = v31;
  -[PXObservable pxStory_enumerateStatesWithTimeout:watchingChanges:usingBlock:timeoutHandler:](v26, "pxStory_enumerateStatesWithTimeout:watchingChanges:usingBlock:timeoutHandler:", 3, v37, v35, v28);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

}

- (void)enumerateFeedConfigurationsUsingBlock:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[3];
  char v23;

  v7 = a3;
  v8 = a4;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentFeedPPTPreset");
  -[PXStoryPPTPerformer testOptions](self, "testOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXFeedPPTConfiguration configurationsForPreset:testOptions:](PXFeedPPTConfiguration, "configurationsForPreset:testOptions:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startedTest:", v13);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 1;
  -[PXStoryPPTPerformer configurationIterator](self, "configurationIterator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTPerformer.m"), 613, CFSTR("nested configuration enumeration isn't supported yet"));

  }
  objc_msgSend(v12, "count");
  v20 = v12;
  v21 = v7;
  v17 = v14;
  v18 = v13;
  v19 = v8;
  PXIterateAsynchronously();

  _Block_object_dispose(v22, 8);
}

- (void)runFeedScrollingTestWithElement:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "ppt_scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_ancestorViewOfClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer _runScrollSubtestOnScrollView:containedInTungstenView:completion:](self, "_runScrollSubtestOnScrollView:containedInTungstenView:completion:", v8, v7, v6);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  id v11;

  v9 = a3;
  if ((void *)ObservedModelObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTPerformer.m"), 658, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v9;
  if ((a4 & 0x200000) != 0)
  {
    -[PXStoryPPTPerformer _callPlaybackReadyToPlayHandlerIfNeeded](self, "_callPlaybackReadyToPlayHandlerIfNeeded");
    v9 = v11;
  }
  if ((a4 & 0x40000000000) != 0)
  {
    -[PXStoryPPTPerformer _callPlaybackEndHandlerIfNeeded](self, "_callPlaybackEndHandlerIfNeeded");
    v9 = v11;
  }

}

- (void)_pausePlaybackWithTestElement:(id)a3
{
  id v3;

  -[PXStoryPPTPerformer _viewModelForPlayerTestElement:](self, "_viewModelForPlayerTestElement:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_228050);

}

- (NSString)currentTestName
{
  void *v2;
  void *v3;

  -[PXStoryPPTPerformer testOptions](self, "testOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)currentTestTimeout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PXStoryPPTPerformer testOptions](self, "testOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeoutInSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "no timeout specified for %@", (uint8_t *)&v10, 0xCu);

    }
    v6 = 60.0;
  }

  return v6;
}

- (int64_t)currentTestIterations
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXStoryPPTPerformer testOptions](self, "testOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iterations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (id)_viewModelForPlayerTestElement:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "storyView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mainScrollViewInTungstenView:(id)a3
{
  return (id)objc_msgSend(a3, "diagnosticsMainScrollView");
}

- (void)_runScrollSubtestOnScrollView:(id)a3 containedInTungstenView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  PXStoryPPTPerformer *v24;
  __CFString *v25;
  id v26;
  id v27;
  id v28;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[PXStoryPPTPerformer currentTestName](self, "currentTestName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer configurationName](self, "configurationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer testOptions](self, "testOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer _configurationSpecificSubtestName:](self, "_configurationSpecificSubtestName:", CFSTR("Scrolling"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPPTPerformer startSubtestWithName:metrics:](self, "startSubtestWithName:metrics:", CFSTR("Scrolling"), &unk_1E53EA920);
  objc_msgSend(v8, "ppt_prepareForTest:withOptions:isScrollTest:", v11, v14, 1);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke;
  v21[3] = &unk_1E5139968;
  v22 = v8;
  v23 = v11;
  v24 = self;
  v25 = CFSTR("Scrolling");
  v26 = v12;
  v27 = v13;
  v28 = v9;
  v16 = v9;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v8;
  objc_msgSend(v17, "runScrollTestOnScrollView:withOptions:subTestName:completion:", v10, v14, v15, v21);

}

- (PXPPTDelegate)delegate
{
  return (PXPPTDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (NSMutableDictionary)extraResults
{
  return self->_extraResults;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (void)setConfigurationName:(id)a3
{
  objc_storeStrong((id *)&self->_configurationName, a3);
}

- (PXAsyncIterator)configurationIterator
{
  return (PXAsyncIterator *)objc_loadWeakRetained((id *)&self->_configurationIterator);
}

- (void)setConfigurationIterator:(id)a3
{
  objc_storeWeak((id *)&self->_configurationIterator, a3);
}

- (PXStoryPlayerTestElement)testElement
{
  return self->_testElement;
}

- (void)setTestElement:(id)a3
{
  objc_storeStrong((id *)&self->_testElement, a3);
}

- (PXStoryModel)observedModel
{
  return self->_observedModel;
}

- (id)playbackReadyToPlayHandler
{
  return self->_playbackReadyToPlayHandler;
}

- (void)setPlaybackReadyToPlayHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)playbackEndHandler
{
  return self->_playbackEndHandler;
}

- (void)setPlaybackEndHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PXStoryExportManager)exportManager
{
  return self->_exportManager;
}

- (void)setExportManager:(id)a3
{
  objc_storeStrong((id *)&self->_exportManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportManager, 0);
  objc_storeStrong(&self->_playbackEndHandler, 0);
  objc_storeStrong(&self->_playbackReadyToPlayHandler, 0);
  objc_storeStrong((id *)&self->_observedModel, 0);
  objc_storeStrong((id *)&self->_testElement, 0);
  objc_destroyWeak((id *)&self->_configurationIterator);
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_storeStrong((id *)&self->_extraResults, 0);
  objc_storeStrong((id *)&self->_testOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultsAggregate, 0);
}

void __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "ppt_extraResults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "addEntriesFromDictionary:", v11);
  objc_msgSend(*(id *)(a1 + 32), "ppt_cleanUpAfterTest:isScrollTest:", *(_QWORD *)(a1 + 40), 1);
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishSubtestWithName:", *(_QWORD *)(a1 + 56));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke_2;
    v12[3] = &unk_1E5140FF8;
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 48);
    v13 = v8;
    v14 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "failedTest:withFailureFormat:", *(_QWORD *)(a1 + 40), CFSTR("Scrolling failure, results %@"), v7);
  }
  v10 = *(_QWORD *)(a1 + 80);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, a2);

}

void __88__PXStoryPPTPerformer__runScrollSubtestOnScrollView_containedInTungstenView_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("sub:%@:%@"), v6, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "extraResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

uint64_t __53__PXStoryPPTPerformer__pausePlaybackWithTestElement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", 0);
}

void __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, _QWORD *);
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setConfigurationIterator:", v3);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConfigurationName:", v5);

  objc_msgSend(v4, "feedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke_2;
  v11[3] = &unk_1E5149088;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v12 = v3;
  v13 = v7;
  v9 = *(void (**)(uint64_t, void *, _QWORD *))(v8 + 16);
  v10 = v3;
  v9(v8, v6, v11);

}

uint64_t __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setConfigurationIterator:", 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_finalize");
    v3 = *(void **)(a1 + 40);
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "extraResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishedTest:extraResults:", v2, v4);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  return result;
}

uint64_t __72__PXStoryPPTPerformer_enumerateFeedConfigurationsUsingBlock_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "next");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

void __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    if (objc_msgSend(v5, "numberOfSegments"))
    {
      (*(void (**)(void))(a1[4] + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("initially delivered timeline is unexpectedly empty"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[4] + 16))();
      *a3 = 1;

    }
    v6 = v10;
  }
  if (objc_msgSend(v6, "isTimelineFinal"))
  {
    v9 = *(_QWORD *)(a1[7] + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
      (*(void (**)(void))(a1[5] + 16))();
      *a3 = 1;
    }
  }

}

void __140__PXStoryPPTPerformer__produceTimelineForViewConfiguration_recipeManagerWithProducedRecipe_initialCompletionHandler_finalCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("timed out"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  __int128 v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_2;
  v8[3] = &unk_1E5139880;
  v8[4] = v5;
  v9 = v4;
  v10 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  v11 = v3;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v5, "_requestRecipeForViewConfiguration:resultHandler:", v9, v8);

}

uint64_t __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v3 != v2)
    objc_msgSend(*(id *)(a1 + 32), "failedTest:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v3 == v2);
  return result;
}

void __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[5];
  __int128 v22;
  id v23;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "recipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "startSubtestWithName:metrics:", CFSTR("totalTimeBetweenRecipeAndDeliveredTimeline"), &unk_1E53EA8D8);
    objc_msgSend(*(id *)(a1 + 32), "startSubtestWithName:metrics:", CFSTR("timeBetweenRecipeAndDeliveredInitialTimeline"), &unk_1E53EA8F0);
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_3;
    v21[3] = &unk_1E5139830;
    v21[4] = v9;
    v22 = *(_OWORD *)(a1 + 48);
    v23 = *(id *)(a1 + 64);
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_4;
    v17[3] = &unk_1E5139858;
    v13 = *(void **)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 72);
    v17[4] = *(_QWORD *)(a1 + 32);
    v20 = v12;
    v18 = v13;
    v19 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v9, "_produceTimelineForViewConfiguration:recipeManagerWithProducedRecipe:initialCompletionHandler:finalCompletionHandler:", v10, v6, v21, v17);

  }
  else
  {
    v15 = *(void **)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "failedTest:withFailureFormat:", v14, CFSTR("recipe production failed: %@"), v16);

  }
}

uint64_t __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_3(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishSubtestWithName:", CFSTR("timeBetweenRecipeAndDeliveredInitialTimeline"));
    return objc_msgSend(*(id *)(a1 + 32), "startSubtestWithName:metrics:", CFSTR("timeBetweenRecipeAndDeliveredFinalTimeline"), &unk_1E53EA908);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "failedTest:withFailureFormat:", *(_QWORD *)(a1 + 48), CFSTR("failed to produce initial timeline: %@"), a3);
    return objc_msgSend(*(id *)(a1 + 56), "stop");
  }
}

uint64_t __81__PXStoryPPTPerformer_runTimelineProductionTestWithViewConfiguration_completion___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishSubtestWithName:", CFSTR("timeBetweenRecipeAndDeliveredFinalTimeline"));
    objc_msgSend(*(id *)(a1 + 32), "finishSubtestWithName:", CFSTR("totalTimeBetweenRecipeAndDeliveredTimeline"));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    return objc_msgSend(*(id *)(a1 + 40), "next");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "failedTest:withFailureFormat:", *(_QWORD *)(a1 + 56), CFSTR("failed to produce final timeline: %@"), a3);
    return objc_msgSend(*(id *)(a1 + 40), "stop");
  }
}

void __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isRecipeFinal"))
  {
    objc_msgSend(v8, "resultsByComponent");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__PXStoryPPTPerformer__requestRecipeForViewConfiguration_resultHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isRecipeFinal")
    && (objc_msgSend(*(id *)(a1 + 32), "recipe"), v2 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v2,
                                                  !v2))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("failed to produce final recipe"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v17 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a2;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v11 = v10;
  v12 = *(double *)(a1 + 64);
  objc_msgSend(v9, "recipe");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke_2;
    v18[3] = &unk_1E51397B8;
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v18);
    objc_msgSend(*(id *)(a1 + 32), "addValue:metric:forMeasure:configuration:", 1, CFSTR("Recipe:Total"), *(_QWORD *)(a1 + 40), v11 - v12);

    v14 = v19;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "currentTestName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "failedTest:withFailureFormat:", v15, CFSTR("recipe production failed: %@"), v16);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __79__PXStoryPPTPerformer_runRecipeProductionTestWithViewConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v11 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("Recipe:%@"), v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "productionDuration");
  v10 = v9;

  objc_msgSend(v8, "addValue:metric:forMeasure:configuration:", 1, v11, *(_QWORD *)(a1 + 40), v10);
}

void __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setExportManager:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke_2;
  block[3] = &unk_1E5139790;
  v13 = a2;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__PXStoryPPTPerformer__exportWithTestElement_atResolution_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  id v11;

  if (!*(_BYTE *)(a1 + 64))
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "testOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("keepFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("exportPath:%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "extraResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E53EEDC0, v7);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_5:
    v9();
    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeItemAtPath:error:", v10, 0);

}

void __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_pausePlaybackWithTestElement:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "startSubtestWithName:metrics:", CFSTR("Export"), &unk_1E53EA8C0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke_2;
  v4[3] = &unk_1E5146940;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_exportWithTestElement:atResolution:completion:", v3, v4, *(double *)(a1 + 72), *(double *)(a1 + 80));

}

void __59__PXStoryPPTPerformer_runExportTestWithElement_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishSubtestWithName:", CFSTR("Export"));
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "configurationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failedTest:withFailureFormat:", v5, CFSTR("failure for configuration %@ error %@"), v7, v9);

  }
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);

}

uint64_t __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "skipToSegmentWithOffset:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __74__PXStoryPPTPerformer__skipToSegmentWithTestElement_direction_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startSubtestWithName:metrics:", *(_QWORD *)(a1 + 40), &unk_1E53EA8A8);
  v4 = *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke_2;
  v10[3] = &unk_1E51396F0;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 56);
  v13 = v3;
  v14 = v8;
  v12 = v7;
  v9 = v3;
  objc_msgSend(v11, "_skipToSegmentWithTestElement:direction:completion:", v6, v4, v10);

}

uint64_t __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= 4)
  {
    PLStoryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v5 = 134218240;
      v6 = v3;
      v7 = 2048;
      v8 = 5;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "scrubbing test failed because number of skips (%ti) is too low (minimum: %ti)", (uint8_t *)&v5, 0x16u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__PXStoryPPTPerformer__runScrubbingSubtestWithTestElement_direction_subtestName_completion___block_invoke_2(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "finishSubtestWithName:", *(_QWORD *)(a1 + 40));
  if (!a2)
    return objc_msgSend(*(id *)(a1 + 48), "stop");
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 48), "next");
}

uint64_t __71__PXStoryPPTPerformer__runScrubbingSubtestsWithTestElement_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_runScrubbingSubtestWithTestElement:direction:subtestName:completion:", *(_QWORD *)(a1 + 40), -1, CFSTR("SkipPrevious-Latency"), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "_pausePlaybackWithTestElement:", *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 500000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_2;
  v6[3] = &unk_1E513AC50;
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 64);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v6);

}

void __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_2(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  _QWORD v6[3];
  char v7;

  objc_msgSend(a1[4], "startedTest:", a1[5]);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 1;
  v5 = a1[7];
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[8];
  PXIterateAsynchronously();

  _Block_object_dispose(v6, 8);
}

void __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_4;
  v8[3] = &unk_1E5149088;
  v6 = a1[6];
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v4, "_runScrubbingSubtestsWithTestElement:completion:", v5, v8);

}

uint64_t __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_5(_QWORD *a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
  v3 = (void *)a1[4];
  v4 = a1[5];
  if (v2)
    objc_msgSend(v3, "finishedTest:", v4);
  else
    objc_msgSend(v3, "failedTest:", v4);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24));
  return result;
}

uint64_t __62__PXStoryPPTPerformer_runScrubbingTestWithElement_completion___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "next");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

uint64_t __50__PXStoryPPTPerformer__installPlaybackEndHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "playbackReadyToPlayHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke_2;
  v8 = &unk_1E513F8E8;
  v9 = v2;
  v10 = *(id *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  objc_msgSend(v3, "setPlaybackReadyToPlayHandler:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "_callPlaybackReadyToPlayHandlerIfNeeded", v5, v6, v7, v8);

}

uint64_t __58__PXStoryPPTPerformer__installPlaybackReadyToPlayHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__PXStoryPPTPerformer__preparePlaybackTestWithElement___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_viewModelForPlayerTestElement:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObservedModel:", v2);

}

void __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "startSubtestWithName:metrics:", *(_QWORD *)(a1 + 56), &unk_1E53EA890);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke_2;
  v3[3] = &unk_1E5139650;
  v2 = *(void **)(a1 + 56);
  v4 = *(id *)(a1 + 48);
  v5 = v2;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "_installPlaybackEndHandler:", v3);

}

uint64_t __61__PXStoryPPTPerformer_runPlaybackTestWithElement_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishSubtestWithName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "finishedTest:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_cleanUpPlaybackTest");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "finishSubtestWithName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "finishedTest:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_cleanUpPlaybackTest");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke_2;
  block[3] = &unk_1E5148A40;
  v3 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__PXStoryPPTPerformer_runPlaybackStartTestWithElement_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setConfigurationIterator:", v3);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConfigurationName:", v5);

  objc_msgSend(*(id *)(a1 + 32), "testOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_2;
  v11[3] = &unk_1E5139600;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = v4;
  v14 = v3;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v16 = v8;
  v9 = v3;
  v10 = v4;
  objc_msgSend(v10, "requestStoryConfigurationWithOptions:resultHandler:", v6, v11);

}

uint64_t __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setConfigurationIterator:", 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_finalize");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "extraResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishedTest:extraResults:", v3, v4);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  return result;
}

void __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (a2)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_3;
    v10[3] = &unk_1E5149088;
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 72);
    v11 = v5;
    v12 = v6;
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, a2, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "failedTest:withFailureFormat:", v8, CFSTR("Unable to create story configuration for %@"), v9);

    objc_msgSend(*(id *)(a1 + 56), "stop");
  }
}

uint64_t __73__PXStoryPPTPerformer_enumerateStoryConfigurationsUsingBlock_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "next");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

@end
