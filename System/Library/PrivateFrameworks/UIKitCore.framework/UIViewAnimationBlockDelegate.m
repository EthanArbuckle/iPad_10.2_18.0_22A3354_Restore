@implementation UIViewAnimationBlockDelegate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationState);
  objc_storeStrong((id *)&self->_systemPostAnimationActions, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_start, 0);
}

uint64_t __71__UIViewAnimationBlockDelegate__didEndBlockAnimation_finished_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDeferredCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_didEndBlockAnimation:(id)a3 finished:(id)a4 context:(void *)a5
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id WeakRetained;
  id *v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_systemPostAnimationActions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i) + 16))();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  -[NSMutableArray removeAllObjects](self->_systemPostAnimationActions, "removeAllObjects");
  if (self->_completion)
  {
    if (self->_didBeginBlockAnimation && !self->_isZeroDuration
      || -[UIViewAnimationBlockDelegate _forcingImmediateCompletion](self, "_forcingImmediateCompletion"))
    {
      if (!self->_animationDidStopSent)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_animationState);

        if (WeakRetained)
        {
          v13 = (id *)objc_loadWeakRetained((id *)&self->_animationState);
          v14 = objc_loadWeakRetained(v13 + 34);
          if (v14)
          {
            v15 = (id *)objc_loadWeakRetained((id *)&self->_animationState);
            v16 = objc_loadWeakRetained(v15 + 34);
            self->_animationDidStopSent = objc_msgSend(v16, "_pausesOnCompletion") ^ 1;

          }
          else
          {
            self->_animationDidStopSent = 1;
          }

        }
        else
        {
          self->_animationDidStopSent = 1;
        }
        v18 = _Block_copy(self->_completion);
        __UIVIEW_IS_EXECUTING_ANIMATION_COMPLETION_BLOCK__(objc_msgSend(v6, "BOOLValue"), (uint64_t)v18);

      }
    }
    else if (dyld_program_sdk_at_least())
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __71__UIViewAnimationBlockDelegate__didEndBlockAnimation_finished_context___block_invoke;
      v19[3] = &unk_1E16B1B50;
      v19[4] = self;
      v20 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v19);

    }
    else
    {
      v25 = *MEMORY[0x1E0C99860];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewAnimationBlockDelegate performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__sendDeferredCompletion_, v6, v17, 0.0);

    }
  }

}

- (BOOL)_forcingImmediateCompletion
{
  return self->__forcingImmediateCompletion;
}

- (void)set_animationState:(id)a3
{
  objc_storeWeak((id *)&self->_animationState, a3);
}

+ (id)animationBlockDelegateWithDuration:(double)a3 options:(unint64_t)a4 start:(id)a5 completion:(id)a6
{
  __int16 v7;
  id v9;
  id v10;
  UIViewAnimationBlockDelegate *v11;
  uint64_t v12;
  id start;
  uint64_t v14;
  id completion;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = objc_alloc_init(UIViewAnimationBlockDelegate);
  v11->_allowUserInteraction = (v7 & 2) != 0;
  v11->_allowsUserInteractionToCutOffEndOfAnimation = (v7 & 0x400) != 0;
  v11->_allowsHitTesting = (v7 & 0x1000) != 0;
  v12 = objc_msgSend(v10, "copy");

  start = v11->_start;
  v11->_start = (id)v12;

  v14 = objc_msgSend(v9, "copy");
  completion = v11->_completion;
  v11->_completion = (id)v14;

  v11->_isZeroDuration = a3 <= 0.0;
  return v11;
}

- (void)_setForcingImmediateCompletion:(BOOL)a3
{
  self->__forcingImmediateCompletion = a3;
}

- (void)_sendDeferredCompletion:(id)a3
{
  id completion;
  id v4;
  uint64_t v5;
  id v6;

  if (!self->_animationDidStopSent)
  {
    self->_animationDidStopSent = 1;
    completion = self->_completion;
    v4 = a3;
    v6 = _Block_copy(completion);
    v5 = objc_msgSend(v4, "BOOLValue");

    __UIVIEW_IS_EXECUTING_ANIMATION_COMPLETION_BLOCK__(v5, (uint64_t)v6);
  }
}

- (void)_willBeginBlockAnimation:(id)a3 context:(id)a4
{
  void (**start)(void);

  self->_didBeginBlockAnimation = 1;
  start = (void (**)(void))self->_start;
  if (start)
    start[2]();
}

+ (void)setAnimationBlockDelegateWithDuration:(double)a3 options:(unint64_t)a4 start:(id)a5 completion:(id)a6
{
  __int16 v7;
  id v9;
  id v10;
  UIViewAnimationBlockDelegate *v11;
  uint64_t v12;
  id start;
  uint64_t v14;
  id completion;
  void *v16;
  uint64_t v17;
  UIViewAnimationBlockDelegate *v18;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = objc_alloc_init(UIViewAnimationBlockDelegate);
  v11->_allowUserInteraction = (v7 & 2) != 0;
  v11->_allowsUserInteractionToCutOffEndOfAnimation = (v7 & 0x400) != 0;
  v11->_allowsHitTesting = (v7 & 0x1000) != 0;
  v12 = objc_msgSend(v10, "copy");

  start = v11->_start;
  v11->_start = (id)v12;

  v14 = objc_msgSend(v9, "copy");
  completion = v11->_completion;
  v11->_completion = (id)v14;

  v11->_isZeroDuration = a3 <= 0.0;
  v16 = *(void **)(__currentViewAnimationState + 32);
  *(_QWORD *)(__currentViewAnimationState + 32) = v11;
  v18 = v11;

  v17 = __currentViewAnimationState;
  *(_QWORD *)(__currentViewAnimationState + 152) = sel__willBeginBlockAnimation_context_;
  *(_QWORD *)(v17 + 160) = sel__didEndBlockAnimation_finished_context_;

}

- (BOOL)_allowsUserInteractionToCutOffEndOfAnimation
{
  return self->_allowsUserInteractionToCutOffEndOfAnimation;
}

- (BOOL)_allowsHitTesting
{
  return self->_allowsHitTesting;
}

- (BOOL)_allowsUserInteraction
{
  return self->_allowUserInteraction;
}

- (UIViewAnimationState)_animationState
{
  return (UIViewAnimationState *)objc_loadWeakRetained((id *)&self->_animationState);
}

@end
