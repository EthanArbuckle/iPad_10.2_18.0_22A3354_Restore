@implementation PXCuratedLibrarySkimmingController

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySkimmingController.m"), 85, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x2804) != 0)
  {
    v13 = v9;
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "zoomLevelTransitionPhase") && objc_msgSend(v11, "scrollRegime") <= 1)
    {
      if (-[PXCuratedLibrarySkimmingController skimmingSlideshowEnabled](self, "skimmingSlideshowEnabled"))
        -[PXCuratedLibrarySkimmingController _updateSlideshow](self, "_updateSlideshow");
      else
        -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:", 0);
    }

    v9 = v13;
  }

}

- (void)_cancelEnteringTouchingState
{
  void *v3;
  void *v4;
  void *v5;

  -[PXCuratedLibrarySkimmingController preSkimmedAssetCollectionReference](self, "preSkimmedAssetCollectionReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DE7910];
    -[PXCuratedLibrarySkimmingController preSkimmedAssetCollectionReference](self, "preSkimmedAssetCollectionReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__enterTouchingStateForAssetCollectionReference_, v5);

    -[PXCuratedLibrarySkimmingController setPreSkimmedAssetCollectionReference:](self, "setPreSkimmedAssetCollectionReference:", 0);
  }
}

- (PXAssetCollectionReference)preSkimmedAssetCollectionReference
{
  return self->_preSkimmedAssetCollectionReference;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCuratedLibrarySkimmingController)initWithSkimmingModel:(id)a3
{
  id v5;
  PXCuratedLibrarySkimmingController *v6;
  PXCuratedLibrarySkimmingController *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibrarySkimmingController;
  v6 = -[PXCuratedLibrarySkimmingController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_skimmingModel, a3);
    objc_msgSend(v5, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", v7, PXCuratedLibraryViewModelObserverContext);

    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySkimmingController setSkimmingSlideshowEnabled:](v7, "setSkimmingSlideshowEnabled:", objc_msgSend(v9, "enableSlideshowInYears"));
    objc_msgSend(v9, "slideshowTriggerDelay");
    v7->_slideshowTriggerDelay = v10;
    objc_msgSend(v9, "slideshowIntervalDelay");
    v7->_slideshowIntervalDelay = v11;

  }
  return v7;
}

- (void)setSkimmingSlideshowEnabled:(BOOL)a3
{
  if (self->_skimmingSlideshowEnabled != a3)
  {
    self->_skimmingSlideshowEnabled = a3;
    if (a3)
      -[PXCuratedLibrarySkimmingController _updateSlideshow](self, "_updateSlideshow");
    else
      -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:");
  }
}

- (void)_updateSlideshow
{
  void *v3;
  int v4;

  if (-[PXCuratedLibrarySkimmingController skimmingSlideshowEnabled](self, "skimmingSlideshowEnabled"))
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canStartSkimming");

    if (v4)
      -[PXCuratedLibrarySkimmingController _startOrResumeSlideshowTouchesEnded:](self, "_startOrResumeSlideshowTouchesEnded:", 0);
    else
      -[PXCuratedLibrarySkimmingController _stopSlideshow](self, "_stopSlideshow");
  }
}

- (BOOL)skimmingSlideshowEnabled
{
  return self->_skimmingSlideshowEnabled;
}

- (PXCuratedLibraryAssetCollectionSkimmingModel)skimmingModel
{
  return self->_skimmingModel;
}

- (void)_stopSlideshow
{
  if (-[PXCuratedLibrarySkimmingController state](self, "state") == 1)
    -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:", 0);
}

- (int64_t)state
{
  return self->_state;
}

- (PXCuratedLibrarySkimmingController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySkimmingController.m"), 62, CFSTR("%s is not available as initializer"), "-[PXCuratedLibrarySkimmingController init]");

  abort();
}

- (void)_startOrResumeSlideshowTouchesEnded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PXCuratedLibrarySkimmingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollectionReferenceForSkimmingSlideshow:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validatedAssetCollectionReference:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v8 = -[PXCuratedLibrarySkimmingController state](self, "state");
      if (v8 < 2
        || v8 - 2 <= 1
        && (-[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "persistSkimmingState"),
            v9,
            v3))
      {
        -[PXCuratedLibrarySkimmingController _enterSlideshowStateForAssetCollectionReference:](self, "_enterSlideshowStateForAssetCollectionReference:", v10);
      }
      else
      {
        -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:", 1);
      }

    }
  }
}

- (void)_slideshowTimerTick:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  int64x2_t v26;
  __int128 v27;
  __int128 v28;

  if (-[PXCuratedLibrarySkimmingController state](self, "state", a3) == 1)
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scrollRegime");

    if (!v6)
    {
      -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transitionToSlideshow");

      -[PXCuratedLibrarySkimmingController skimmingIndexes](self, "skimmingIndexes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 >= 2)
      {
        -[PXCuratedLibrarySkimmingController skimmingIndexes](self, "skimmingIndexes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[PXCuratedLibrarySkimmingController currentSkimmingIndex](self, "currentSkimmingIndex");
        if (v11 + 1 < (unint64_t)objc_msgSend(v10, "count"))
          v12 = v11 + 1;
        else
          v12 = 0;
        if (v12 < objc_msgSend(v10, "count"))
        {
          -[PXCuratedLibrarySkimmingController setCurrentSkimmingIndex:](self, "setCurrentSkimmingIndex:", v12);
          v27 = 0u;
          v28 = 0u;
          -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "skimmedIndexPath");
          }
          else
          {
            v27 = 0u;
            v28 = 0u;
          }

          v15 = -[PXCuratedLibrarySkimmingController skimmingDataSourceIdentifier](self, "skimmingDataSourceIdentifier");
          objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");
          -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v15;
          v25[1] = v17;
          v26 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          objc_msgSend(v18, "setSkimmedIndexPath:", v25);

          -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
            objc_msgSend(v19, "skimmedIndexPath");
          v23 = v27;
          v24 = v28;
          v21 = PXSimpleIndexPathCompare();

          if (v21)
          {
            -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel", v23, v24);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "persistSkimmingState");

          }
        }

      }
    }
  }
}

- (BOOL)canStartSkimming
{
  void *v2;
  char v3;

  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canStartSkimming");

  return v3;
}

- (BOOL)isTouching
{
  return -[PXCuratedLibrarySkimmingController state](self, "state") == 2;
}

- (void)startTouchingForAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canStartSkimming");

  if (v6)
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validatedAssetCollectionReference:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    -[PXCuratedLibrarySkimmingController setPreSkimmedAssetCollectionReference:](self, "setPreSkimmedAssetCollectionReference:", v8);
    v10[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySkimmingController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__enterTouchingStateForAssetCollectionReference_, v8, v9, 0.15);

    v4 = (id)v8;
  }

}

- (BOOL)endTouchingGestureEnded:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PXCuratedLibrarySkimmingController _cancelEnteringTouchingState](self, "_cancelEnteringTouchingState");
  if (v3)
  {
    if (-[PXCuratedLibrarySkimmingController state](self, "state") == 2)
    {
      LOBYTE(v3) = 1;
      if (-[PXCuratedLibrarySkimmingController skimmingSlideshowEnabled](self, "skimmingSlideshowEnabled"))
        -[PXCuratedLibrarySkimmingController _startOrResumeSlideshowTouchesEnded:](self, "_startOrResumeSlideshowTouchesEnded:", 1);
      else
        -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:", 1);
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)startPanningForAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canStartSkimming");

  if (v6)
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validatedAssetCollectionReference:", v4);
    v9 = objc_claimAutoreleasedReturnValue();

    if (-[PXCuratedLibrarySkimmingController state](self, "state") != 2)
    {
      -[PXCuratedLibrarySkimmingController _cancelEnteringTouchingState](self, "_cancelEnteringTouchingState");
      -[PXCuratedLibrarySkimmingController _enterTouchingStateForAssetCollectionReference:](self, "_enterTouchingStateForAssetCollectionReference:", v9);
    }
    -[PXCuratedLibrarySkimmingController setLastPanningTranslation:](self, "setLastPanningTranslation:", 0.0);
    -[PXCuratedLibrarySkimmingController setState:](self, "setState:", 3);
    -[PXCuratedLibrarySkimmingController _ensureFeedbackGenerator](self, "_ensureFeedbackGenerator");
    v8 = (void *)v9;
  }
  else
  {
    v8 = v4;
  }

}

- (void)updatePanningWithTranslation:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  int64x2_t v16;

  x = a3.x;
  if (-[PXCuratedLibrarySkimmingController state](self, "state", a3.x, a3.y) == 3)
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionToSkimming");

    -[PXCuratedLibrarySkimmingController lastPanningTranslation](self, "lastPanningTranslation");
    if (vabdd_f64(x, v6) >= 15.0)
    {
      -[PXCuratedLibrarySkimmingController setLastPanningTranslation:](self, "setLastPanningTranslation:", x);
      -[PXCuratedLibrarySkimmingController skimmingIndexes](self, "skimmingIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (double)-[PXCuratedLibrarySkimmingController currentSkimmingIndex](self, "currentSkimmingIndex");
      PXFloatSign();
      v10 = (uint64_t)(v9 + v8);
      if ((v10 & 0x8000000000000000) == 0 && objc_msgSend(v7, "count") > v10)
      {
        -[PXCuratedLibrarySkimmingController setCurrentSkimmingIndex:](self, "setCurrentSkimmingIndex:", v10);
        v11 = -[PXCuratedLibrarySkimmingController skimmingDataSourceIdentifier](self, "skimmingDataSourceIdentifier");
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");
        -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v11;
        v15[1] = v13;
        v16 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        objc_msgSend(v14, "setSkimmedIndexPath:", v15);

        -[PXCuratedLibrarySkimmingController _generateFeedbackForSkimmingGesture](self, "_generateFeedbackForSkimmingGesture");
      }

    }
  }
}

- (void)endPanning
{
  if (-[PXCuratedLibrarySkimmingController state](self, "state") == 3)
  {
    -[PXCuratedLibrarySkimmingController _cleanupFeedbackGenerator](self, "_cleanupFeedbackGenerator");
    if (-[PXCuratedLibrarySkimmingController skimmingSlideshowEnabled](self, "skimmingSlideshowEnabled"))
      -[PXCuratedLibrarySkimmingController _startOrResumeSlideshowTouchesEnded:](self, "_startOrResumeSlideshowTouchesEnded:", 1);
    else
      -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:", 1);
  }
}

- (void)_ensureFeedbackGenerator
{
  UISelectionFeedbackGenerator *v3;
  UISelectionFeedbackGenerator *skimmingFeedbackGenerator;

  v3 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
  skimmingFeedbackGenerator = self->_skimmingFeedbackGenerator;
  self->_skimmingFeedbackGenerator = v3;

  -[UISelectionFeedbackGenerator prepare](self->_skimmingFeedbackGenerator, "prepare");
}

- (void)_generateFeedbackForSkimmingGesture
{
  -[UISelectionFeedbackGenerator selectionChanged](self->_skimmingFeedbackGenerator, "selectionChanged");
  -[UISelectionFeedbackGenerator prepare](self->_skimmingFeedbackGenerator, "prepare");
}

- (void)_cleanupFeedbackGenerator
{
  UISelectionFeedbackGenerator *skimmingFeedbackGenerator;

  skimmingFeedbackGenerator = self->_skimmingFeedbackGenerator;
  self->_skimmingFeedbackGenerator = 0;

}

- (void)_enterSlideshowStateForAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _OWORD v21[8];

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "indexPath");
  else
    memset(&v21[6], 0, 32);
  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containingAssetCollectionReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "indexPath");
    v9 = *(_QWORD *)&v21[4];
  }
  else
  {
    v9 = 0;
    memset(&v21[4], 0, 32);
  }
  if (*(_QWORD *)&v21[6] == v9 && *(_OWORD *)((char *)&v21[6] + 8) == *(_OWORD *)((char *)&v21[4] + 8))
  {

    if (*((_QWORD *)&v21[7] + 1) == *((_QWORD *)&v21[5] + 1))
    {
      v10 = -[PXCuratedLibrarySkimmingController state](self, "state");
      if (v10 <= 3 && v10 != 1)
      {
        -[PXCuratedLibrarySkimmingController setState:](self, "setState:", 1);
        -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "transitionToSlideshow");

      }
      goto LABEL_27;
    }
  }
  else
  {

  }
  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "skimmedIndexPath");
  else
    memset(&v21[2], 0, 32);
  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "initialIndexPath");
    v16 = *(_QWORD *)&v21[0];
  }
  else
  {
    v16 = 0;
    memset(v21, 0, 32);
  }
  v17 = *(_QWORD *)&v21[2] != v16
     || *(_OWORD *)((char *)&v21[2] + 8) != *(_OWORD *)((char *)v21 + 8)
     || *((_QWORD *)&v21[3] + 1) != *((_QWORD *)&v21[1] + 1);
  -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:", v17, *(_QWORD *)&v21[0]);

  objc_msgSend(v5, "assetCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "px_highlightKind");

  if (v19 == 2 && (unint64_t)-[PXCuratedLibrarySkimmingController state](self, "state") <= 1)
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "prepareForSlideshowForAssetCollectionReference:", v5);

    -[PXCuratedLibrarySkimmingController _adoptIndexesFromSkimmingModel](self, "_adoptIndexesFromSkimmingModel");
    -[PXCuratedLibrarySkimmingController setState:](self, "setState:", 1);
  }
LABEL_27:

}

- (void)_enterTouchingStateForAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _OWORD v12[4];

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "indexPath");
  else
    memset(&v12[2], 0, 32);
  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containingAssetCollectionReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "indexPath");
    v9 = *(_QWORD *)&v12[0];
  }
  else
  {
    v9 = 0;
    memset(v12, 0, 32);
  }
  if (*(_QWORD *)&v12[2] == v9 && *(_OWORD *)((char *)&v12[2] + 8) == *(_OWORD *)((char *)v12 + 8))
  {

    if (*((_QWORD *)&v12[3] + 1) == *((_QWORD *)&v12[1] + 1))
    {
      -[PXCuratedLibrarySkimmingController setState:](self, "setState:", 2);
      -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transitionToSkimming");

      goto LABEL_14;
    }
  }
  else
  {

  }
  if ((unint64_t)-[PXCuratedLibrarySkimmingController state](self, "state", *(_QWORD *)&v12[0]) <= 2)
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareForSkimmingInAssetCollectionReference:", v5);

    -[PXCuratedLibrarySkimmingController _adoptIndexesFromSkimmingModel](self, "_adoptIndexesFromSkimmingModel");
    -[PXCuratedLibrarySkimmingController setState:](self, "setState:", 2);
  }
LABEL_14:

}

- (void)_adoptIndexesFromSkimmingModel
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathSetForSkimming");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  if (v3)
    objc_msgSend(v3, "initialIndexPath");
  if (v4)
  {
    objc_msgSend(v4, "anySectionIndexPath");
    v5 = v12;
  }
  else
  {
    v5 = 0;
    v12 = 0u;
    v13 = 0u;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "sectionIndexSetForDataSourceIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PXCuratedLibrarySkimmingController__adoptIndexesFromSkimmingModel__block_invoke;
  v10[3] = &unk_1E5148928;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v10);

  -[PXCuratedLibrarySkimmingController setSkimmingDataSourceIdentifier:](self, "setSkimmingDataSourceIdentifier:", v5);
  -[PXCuratedLibrarySkimmingController setSkimmingIndexes:](self, "setSkimmingIndexes:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v14 + 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySkimmingController setCurrentSkimmingIndex:](self, "setCurrentSkimmingIndex:", objc_msgSend(v8, "indexOfObject:", v9));

}

- (void)_enterIdleStatePersistSkimmingState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[PXCuratedLibrarySkimmingController state](self, "state"))
  {
    -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tearDownAfterSkimmingShowHints:persistState:", 0, v3);

    -[PXCuratedLibrarySkimmingController _cancelEnteringTouchingState](self, "_cancelEnteringTouchingState");
    -[PXCuratedLibrarySkimmingController setSkimmingIndexes:](self, "setSkimmingIndexes:", 0);
    -[PXCuratedLibrarySkimmingController setCurrentSkimmingIndex:](self, "setCurrentSkimmingIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[PXCuratedLibrarySkimmingController setSkimmingDataSourceIdentifier:](self, "setSkimmingDataSourceIdentifier:", 0);
    -[PXCuratedLibrarySkimmingController setState:](self, "setState:", 0);
  }
}

- (void)setState:(int64_t)a3
{
  int64_t state;
  double v6;
  double v7;
  _BOOL4 v8;
  int v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    if (state == 2)
      v6 = 0.5;
    else
      v6 = 0.0;
    if (state == 3)
      v7 = 1.0;
    else
      v7 = v6;
    v8 = state == 3 || state == 2;
    if ((unint64_t)(a3 - 2) < 2)
    {
      v9 = 1;
      v10 = 0.2;
    }
    else
    {
      v9 = 0;
      if ((unint64_t)a3 <= 1)
        v10 = 0.5;
      else
        v10 = 0.0;
    }
    if (-[PXCuratedLibrarySkimmingController skimmingSlideshowEnabled](self, "skimmingSlideshowEnabled", 0.0, 0.5, 1.0, v6))
    {
      -[PXCuratedLibrarySkimmingController slideshowTimer](self, "slideshowTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[PXCuratedLibrarySkimmingController setSlideshowTimer:](self, "setSlideshowTimer:", 0);
      if (a3 == 1)
      {
        v12 = objc_alloc(MEMORY[0x1E0C99E88]);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", self->_slideshowTriggerDelay);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithFireDate:interval:target:selector:userInfo:repeats:", v13, self, sel__slideshowTimerTick_, 0, 1, self->_slideshowIntervalDelay);

        -[PXCuratedLibrarySkimmingController setSlideshowTimer:](self, "setSlideshowTimer:", v14);
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTimer:forMode:", v14, *MEMORY[0x1E0C99748]);

      }
    }
    if (((v8 | v9 ^ 1) & 1) != 0)
    {
      if (((v9 | !v8) & 1) != 0)
        return;
      -[PXCuratedLibrarySkimmingController delegate](self, "delegate");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "skimmingControllerDidStopSkimming:animationDuration:", self, v7);
    }
    else
    {
      -[PXCuratedLibrarySkimmingController delegate](self, "delegate");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySkimmingController skimmingModel](self, "skimmingModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "containingAssetCollectionReference");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "skimmingController:willStartSkimmingAssetCollectionReference:animationDuration:", self, v17, v10);

    }
  }
}

- (PXCuratedLibrarySkimmingControllerDelegate)delegate
{
  return (PXCuratedLibrarySkimmingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setPreSkimmedAssetCollectionReference:(id)a3
{
  objc_storeStrong((id *)&self->_preSkimmedAssetCollectionReference, a3);
}

- (double)lastPanningTranslation
{
  return self->_lastPanningTranslation;
}

- (void)setLastPanningTranslation:(double)a3
{
  self->_lastPanningTranslation = a3;
}

- (int64_t)currentSkimmingIndex
{
  return self->_currentSkimmingIndex;
}

- (void)setCurrentSkimmingIndex:(int64_t)a3
{
  self->_currentSkimmingIndex = a3;
}

- (NSArray)skimmingIndexes
{
  return self->_skimmingIndexes;
}

- (void)setSkimmingIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_skimmingIndexes, a3);
}

- (int64_t)skimmingDataSourceIdentifier
{
  return self->_skimmingDataSourceIdentifier;
}

- (void)setSkimmingDataSourceIdentifier:(int64_t)a3
{
  self->_skimmingDataSourceIdentifier = a3;
}

- (NSTimer)slideshowTimer
{
  return self->_slideshowTimer;
}

- (void)setSlideshowTimer:(id)a3
{
  objc_storeStrong((id *)&self->_slideshowTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slideshowTimer, 0);
  objc_storeStrong((id *)&self->_skimmingIndexes, 0);
  objc_storeStrong((id *)&self->_preSkimmedAssetCollectionReference, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skimmingModel, 0);
  objc_storeStrong((id *)&self->_skimmingFeedbackGenerator, 0);
}

void __68__PXCuratedLibrarySkimmingController__adoptIndexesFromSkimmingModel__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (PXCuratedLibrarySkimmingController)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCuratedLibrarySkimmingController.m"), 66, CFSTR("%s is not available as initializer"), "+[PXCuratedLibrarySkimmingController new]");

  abort();
}

@end
