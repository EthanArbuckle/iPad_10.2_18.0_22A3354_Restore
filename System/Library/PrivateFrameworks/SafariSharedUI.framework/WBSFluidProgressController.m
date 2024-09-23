@implementation WBSFluidProgressController

- (void)registerObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)setWindowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_windowDelegate, a3);
}

- (WBSFluidProgressController)init
{
  WBSFluidProgressController *v2;
  uint64_t v3;
  NSHashTable *observers;
  WBSFluidProgressController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSFluidProgressController;
  v2 = -[WBSFluidProgressController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)unregisterObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      -[WBSFluidProgressController unregisterObserver:](self, "unregisterObserver:", WeakRetained);
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
      -[WBSFluidProgressController registerObserver:](self, "registerObserver:", obj);
  }

}

- (void)startFluidProgressWithProgressStateSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id WeakRetained;
  id v12;
  NSHashTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "progressState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expectedOrCurrentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_originalDataAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "loadURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if ((v9 & 1) != 0)
    goto LABEL_2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
  objc_msgSend(WeakRetained, "currentFluidProgressStateSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 && v12 == v4)
    objc_msgSend(v4, "clearFluidProgressState");
  if (objc_msgSend(v4, "createFluidProgressState") && v12 == v4)
  {
    objc_msgSend(v4, "progressState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setFluidProgressAnimationPhase:", 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = self->_observers;
    v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "fluidProgressController:startFluidProgressBar:animateFillFade:", self, v10, 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

    -[WBSFluidProgressController _updateFluidProgressWithProgressStateSource:](self, "_updateFluidProgressWithProgressStateSource:", v4);
  }
  else
  {
LABEL_2:
    v10 = v5;
  }

}

- (void)updateFluidProgressWithProgressStateSource:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "progressState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
    {
      v5 = objc_msgSend(v4, "fluidProgressAnimationPhase");
      if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 4 && (objc_msgSend(v4, "hasCompletedLoad") & 1) == 0)
      {
        objc_msgSend(v7, "estimatedProgress");
        if (v6 == 1.0)
        {
          -[WBSFluidProgressController startRocketEffectWithProgressStateSource:](self, "startRocketEffectWithProgressStateSource:", v7);
        }
        else
        {
          objc_msgSend(v4, "setWebKitProgressValue:");
          if (v5 == 2)
            -[WBSFluidProgressController _updateFluidProgressWithProgressStateSource:](self, "_updateFluidProgressWithProgressStateSource:", v7);
        }
      }
    }
  }

}

- (void)finishFluidProgressWithProgressStateSource:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "progressState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "hasCommittedLoad") & 1) != 0)
  {
    objc_msgSend(v5, "setHasCompletedLoad:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
    objc_msgSend(WeakRetained, "currentFluidProgressStateSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "progressState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "fluidProgressAnimationPhase") != 4 || v5 != v8)
    {
      if (objc_msgSend(v5, "fluidProgressAnimationPhase") == 5
        || v5 != v8
        || (objc_msgSend(v9, "hasFailedURL") & 1) != 0)
      {
        if (objc_msgSend(v5, "fluidProgressAnimationPhase") == 4)
          objc_msgSend(v5, "setFluidProgressAnimationPhase:", 5);
        -[WBSFluidProgressController _updateFluidProgressWithProgressStateSource:](self, "_updateFluidProgressWithProgressStateSource:", v9);
      }
      else
      {
        -[WBSFluidProgressController startRocketEffectWithProgressStateSource:](self, "startRocketEffectWithProgressStateSource:", v9);
      }
    }

  }
}

- (void)cancelFluidProgressWithProgressStateSource:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "progressState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setHasCanceledLoad:", 1);
    -[WBSFluidProgressController _updateFluidProgressWithProgressStateSource:](self, "_updateFluidProgressWithProgressStateSource:", v6);
  }

}

- (void)startRocketEffectWithProgressStateSource:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "progressState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "hasCommittedLoad"))
    {
      if ((objc_msgSend(v9, "hasFailedURL") & 1) == 0)
      {
        v6 = objc_msgSend(v5, "fluidProgressAnimationPhase");
        if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 4)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
          objc_msgSend(WeakRetained, "currentFluidProgressStateSource");
          v8 = (id)objc_claimAutoreleasedReturnValue();

          if (v8 != v9)
          {
            objc_msgSend(v5, "setFluidProgressAnimationPhase:", 5);
LABEL_8:
            -[WBSFluidProgressController _updateFluidProgressWithProgressStateSource:](self, "_updateFluidProgressWithProgressStateSource:", v9);
            goto LABEL_9;
          }
          objc_msgSend(v5, "setFluidProgressAnimationPhase:", 4);
          if (v6 == 2)
            goto LABEL_8;
        }
      }
    }
  }
LABEL_9:

}

- (void)frontmostTabDidChange
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
  objc_msgSend(WeakRetained, "currentFluidProgressStateSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progressState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "fluidProgressController:startFluidProgressBar:animateFillFade:", self, v5, 0);
        }
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v7);
    }

    if (!objc_msgSend(v5, "isFluidProgressStalled"))
    {
      objc_msgSend(v5, "setShouldAnimateUsingInitialPosition:", 1);
      -[WBSFluidProgressController _updateFluidProgressWithProgressStateSource:](self, "_updateFluidProgressWithProgressStateSource:", 0);
      goto LABEL_27;
    }
    objc_msgSend(v5, "setFluidProgressAnimationPhase:", 2);
    objc_msgSend(v5, "updateFluidProgressValue");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = self->_observers;
    v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "fluidProgressController:setProgressToCurrentPosition:", self, v5, (_QWORD)v17);
        }
        v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      }
      while (v11);
    }
  }
  else
  {
    v27 = 0uLL;
    v28 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v10 = self->_observers;
    v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v14; ++k)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "fluidProgressControllerFinishProgressBar:animateFillFade:", self, 0);
        }
        v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v14);
    }
  }

LABEL_27:
}

- (void)animationStepCompleted:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "fluidProgressAnimationPhase") == 5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
    objc_msgSend(WeakRetained, "fluidProgressRocketAnimationDidComplete");

  }
  if (objc_msgSend(v5, "fluidProgressAnimationPhase") == 3)
    objc_msgSend(v5, "setFluidProgressAnimationPhase:", 2);
  -[WBSFluidProgressController _updateFluidProgressWithProgressStateSource:](self, "_updateFluidProgressWithProgressStateSource:", 0);

}

- (void)progressStateSourceDidCommitLoad:(id)a3 loadingSingleResource:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a4;
  objc_msgSend(a3, "progressState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      objc_msgSend(v5, "setFluidProgressType:", 1);
    objc_msgSend(v5, "setHasCommittedLoad:", 1);
  }

}

- (void)setProgressAnimationSuppressed:(BOOL)a3 forProgressStateSource:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
    objc_msgSend(WeakRetained, "currentFluidProgressStateSource");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  v17 = v8;
  objc_msgSend(v8, "progressState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = self->_observers;
    v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "fluidProgressController:suppressProgressAnimation:duringFluidProgressState:animated:", self, v6, v11, v5);
          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v11, "fluidProgressAnimationPhase") != 5)
      -[WBSFluidProgressController _sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:](self, "_sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:", 0, v11, v17, 0);
  }

}

- (WBSFluidProgressControllerDelegate)delegate
{
  return (WBSFluidProgressControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (WBSFluidProgressControllerWindowDelegate)windowDelegate
{
  return (WBSFluidProgressControllerWindowDelegate *)objc_loadWeakRetained((id *)&self->_windowDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_updateFluidProgressWithProgressStateSource:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowDelegate);
  v6 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "currentFluidProgressStateSource");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "progressState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "currentFluidProgressStateSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "progressState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "hasCompletedLoad") && objc_msgSend(v7, "fluidProgressAnimationPhase") != 4
      || objc_msgSend(v7, "hasCanceledLoad"))
    {
      if (v9 == v7)
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v10 = self->_observers;
        v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v16;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "fluidProgressControllerFinishProgressBar:animateFillFade:", self, 1, (_QWORD)v15);
            }
            while (v11 != v13);
            v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v11);
        }

      }
      objc_msgSend(v4, "clearFluidProgressState", (_QWORD)v15);
    }
    else if (v9 == v7)
    {
      v14 = objc_msgSend(v7, "fluidProgressAnimationPhase");
      if (v14 != 2 && v14 != 5)
        -[WBSFluidProgressController _sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:](self, "_sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:", 0, v7, v4, 1);
    }

  }
}

- (void)_sendUpdateFluidProgressToObservers:(id)a3 progressState:(id)a4 source:(id)a5 updateAnimationPhase:(BOOL)a6
{
  _BOOL4 v6;
  NSHashTable *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSHashTable *observers;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  void *v20;
  NSHashTable *v21;
  id v22;
  id v23;
  BOOL v24;
  id v25;
  NSHashTable *obj;
  _QWORD block[4];
  id v28;
  id v29;
  WBSFluidProgressController *v30;
  NSHashTable *v31;
  _QWORD *v32;
  BOOL v33;
  BOOL v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  char v43;
  _BYTE v44[128];
  uint64_t v45;

  v6 = a6;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = (NSHashTable *)a3;
  v11 = a4;
  v25 = a5;
  if (v6)
    objc_msgSend(v11, "updateNextFluidProgressAnimation");
  v12 = objc_msgSend(v11, "fluidProgressAnimationPhase");
  v13 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  observers = v10;
  if (!v10)
    observers = self->_observers;
  v24 = v6;
  obj = observers;
  v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        v18 = v11;
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        dispatch_group_enter(v13);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke;
        v35[3] = &unk_1E54435B8;
        v37 = v42;
        v36 = v13;
        v20 = v19;
        v11 = v18;
        objc_msgSend(v20, "fluidProgressController:updateFluidProgressBar:completion:", self, v18, v35);

      }
      v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v15);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke_2;
  block[3] = &unk_1E54435E0;
  v28 = v11;
  v29 = v25;
  v33 = v12 == 4;
  v34 = v24;
  v32 = v42;
  v30 = self;
  v31 = v10;
  v21 = v10;
  v22 = v25;
  v23 = v11;
  dispatch_group_notify(v13, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v42, 8);
}

void __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    a2 = 1;
  *(_BYTE *)(v2 + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __118__WBSFluidProgressController_Internal___sendUpdateFluidProgressToObservers_progressState_source_updateAnimationPhase___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "progressState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      if (*(_BYTE *)(a1 + 73))
      {
        objc_msgSend(*(id *)(a1 + 32), "setFluidProgressAnimationPhase:", 5);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          v10 = 0u;
          v11 = 0u;
          v8 = 0u;
          v9 = 0u;
          v4 = *(id *)(*(_QWORD *)(a1 + 48) + 8);
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          if (v5)
          {
            v6 = *(_QWORD *)v9;
            do
            {
              for (i = 0; i != v5; ++i)
              {
                if (*(_QWORD *)v9 != v6)
                  objc_enumerationMutation(v4);
                objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "fluidProgressControllerFinishProgressBar:animateFillFade:", *(_QWORD *)(a1 + 48), 1, (_QWORD)v8);
              }
              v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
            }
            while (v5);
          }

        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 48), "animationStepCompleted:", *(_QWORD *)(a1 + 32));
    if (!*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 32), "hasCompletedLoad") && *(_BYTE *)(a1 + 73))
    {
      objc_msgSend(*(id *)(a1 + 32), "setFluidProgressAnimationPhase:", 4);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        objc_msgSend(*(id *)(a1 + 48), "_sendUpdateFluidProgressToObservers:progressState:source:updateAnimationPhase:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 73));
    }
  }
}

@end
