@implementation PXGEngine

void __36__PXGEngine__updateInteractionState__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1[4] + 8);
  v11 = v3;
  if (*(_BYTE *)(v5 + 24))
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "isAnimating");
    v4 = v11;
    v5 = *(_QWORD *)(a1[4] + 8);
  }
  *(_BYTE *)(v5 + 24) = v6;
  v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v8 = objc_msgSend(v4, "intrinsicScrollRegime");
  if (v7 <= v8)
    v9 = v8;
  else
    v9 = v7;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
  v10 = objc_msgSend(v11, "contentChangeTrend");
  if (v10)
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v10;

}

void __38__PXGEngine__updateLayoutInteractions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "interactions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setScrollViewController:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v8, "setView:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 48), "removeObject:", v8);
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)layoutNeedsUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 1);
    goto LABEL_6;
  }
  if (self->_isUpdatingScrollView || self->_isUpdatingTextureManager)
  {
    -[PXGEngine _deferredInvalidate:](self, "_deferredInvalidate:", 1);
LABEL_6:
    v4 = v5;
  }

}

- (void)_updateIfNeededWithReason:(id)a3
{
  id v4;
  $6AF0136504CCF97645EE7C74F8AB9C3B *stats;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  PXGTungstenEngineRecordingSession *recordingSession;
  PXGTungstenEngineRecordingSession *v13;
  void *v14;
  unint64_t pendingUpdateEntities;
  _BOOL8 v16;
  unint64_t needsUpdate;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL isUpdatingTextureManager;
  unint64_t v22;
  BOOL isUpdatingRenderer;
  uint64_t v24;
  PXGTungstenEngineRecordingSession *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  PXGTungstenEngineRecordingSession *v30;
  void *v31;
  __int128 v32;
  CGSize v33;
  PXGTungstenEngineRecordingSession *v34;
  void *v35;
  void *v36;
  void *v37;
  PXGViewEnvironment *pendingViewEnvironment;
  PXGViewEnvironment *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  uint8_t buf[16];
  __int128 v54;
  CGPoint v55;
  CGSize v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isSuspended)
    goto LABEL_51;
  if (!self->_updateFlags.needsUpdate)
  {
    self->_updateFlags.willPerformUpdate = 0;
LABEL_49:
    pendingViewEnvironment = self->_pendingViewEnvironment;
    if (pendingViewEnvironment)
    {
      self->_pendingViewEnvironment = 0;
      v39 = pendingViewEnvironment;

      -[PXGEngine setViewEnvironment:](self, "setViewEnvironment:", v39);
    }
    goto LABEL_51;
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    *(_WORD *)&self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 0;
    if (-[PXGEngine statsTrackingEnabled](self, "statsTrackingEnabled"))
    {
      stats = self->_stats;
      *(_OWORD *)&stats->var0[2] = 0u;
      *(_OWORD *)&stats->var0[4] = 0u;
      *(_OWORD *)stats->var0 = 0u;
    }
    -[PXGEngine displayLink](self, "displayLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetTimestamp");
    v8 = v7;

    -[PXGEngine displayLink](self, "displayLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentMediaTime");
    v11 = v10;

    if (v8 < v11)
      v8 = v11;
    self->_animatorWasAnimatingAtBeginningOfFrame = -[PXGAnimator isAnimating](self->_animator, "isAnimating");
    kdebug_trace();
    recordingSession = self->_recordingSession;
    if (recordingSession)
    {
      -[PXGTungstenRecordingSession startNextFrame](recordingSession, "startNextFrame");
      v13 = self->_recordingSession;
      +[PXGEngineRecordingUpdateStartEvent eventWithTargetTimestamp:needsUpdate:pendingUpdateEntities:](PXGEngineRecordingUpdateStartEvent, "eventWithTargetTimestamp:needsUpdate:pendingUpdateEntities:", self->_updateFlags.needsUpdate, self->_pendingUpdateEntities, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTungstenRecordingSession recordEvent:](v13, "recordEvent:", v14);

    }
    pendingUpdateEntities = self->_pendingUpdateEntities;
    if (pendingUpdateEntities)
    {
      self->_updateFlags.needsUpdate |= pendingUpdateEntities;
      self->_pendingUpdateEntities = 0;
    }
    v16 = -[PXGEngine _shouldDeferRenderUntilNextFrame](self, "_shouldDeferRenderUntilNextFrame");
    -[PXGEngine _updateScrollStateWithReason:](self, "_updateScrollStateWithReason:", 3);
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGEngine _updateIfNeededWithReason:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("PXGEngine.m"), 992, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    needsUpdate = self->_updateFlags.needsUpdate;
    self->_updateFlags.updated |= 1uLL;
    if ((needsUpdate & 1) != 0)
    {
      self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGEngine _updateLayout](self, "_updateLayout");
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGEngine _updateIfNeededWithReason:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PXGEngine.m"), 997, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v19 = self->_updateFlags.needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((v19 & 2) != 0)
    {
      self->_updateFlags.needsUpdate = v19 & 0xFFFFFFFFFFFFFFFDLL;
      v18 |= 2uLL;
      -[PXGEngine _updateAnimatorWithTargetTimestamp:](self, "_updateAnimatorWithTargetTimestamp:", v8);
      v19 = self->_updateFlags.needsUpdate;
    }
    if ((v19 & 0xC) != 0)
      -[PXGEngine _updateInteractionState](self, "_updateInteractionState");
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGEngine _updateIfNeededWithReason:]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("PXGEngine.m"), 1006, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v20 = self->_updateFlags.needsUpdate;
    self->_updateFlags.updated |= 4uLL;
    if ((v20 & 4) != 0)
    {
      self->_updateFlags.needsUpdate = v20 & 0xFFFFFFFFFFFFFFFBLL;
      v18 |= 4uLL;
      isUpdatingTextureManager = self->_isUpdatingTextureManager;
      self->_isUpdatingTextureManager = 1;
      -[PXGEngine _updateTextureManager](self, "_updateTextureManager");
      self->_isUpdatingTextureManager = isUpdatingTextureManager;
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGEngine _updateIfNeededWithReason:]");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("PXGEngine.m"), 1014, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v22 = self->_updateFlags.needsUpdate;
    self->_updateFlags.updated |= 8uLL;
    if ((v22 & 8) != 0)
    {
      self->_updateFlags.needsUpdate = v22 & 0xFFFFFFFFFFFFFFF7;
      isUpdatingRenderer = self->_isUpdatingRenderer;
      v24 = MEMORY[0x1E0C809B0];
      self->_isUpdatingRenderer = 1;
      v52[0] = v24;
      v52[1] = 3221225472;
      v52[2] = __39__PXGEngine__updateIfNeededWithReason___block_invoke;
      v52[3] = &unk_1E5137228;
      v52[4] = self;
      -[PXGEngine _enumerateRenderers:](self, "_enumerateRenderers:", v52);
      v25 = self->_recordingSession;
      if (v25)
      {
        +[PXGEngineRecordingChangeDetailsEvent eventWithChangeDetails:](PXGEngineRecordingChangeDetailsEvent, "eventWithChangeDetails:", self->_animationChangeDetails);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGTungstenRecordingSession recordEvent:](v25, "recordEvent:", v26);

      }
      -[PXGEngine delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        -[PXGEngine delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "engine:shouldRenderLayout:sprites:", self, self->_layout, self->_animationPresentationSpriteDataStore);

      }
      else
      {
        v29 = 1;
      }
      v18 |= 8uLL;

      if (v16 | v29 ^ 1)
      {
        self->_pendingUpdateEntities |= 8uLL;
        v30 = self->_recordingSession;
        if (v30)
        {
          +[PXGEngineDeferRenderEvent eventWithShouldDeferRenderUntilNextFrame:delegateAllowsRender:](PXGEngineDeferRenderEvent, "eventWithShouldDeferRenderUntilNextFrame:delegateAllowsRender:", v16, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXGTungstenRecordingSession recordEvent:](v30, "recordEvent:", v31);

        }
      }
      else
      {
        -[PXGEngine _setNeedsRender](self, "_setNeedsRender");
      }
      self->_isUpdatingRenderer = isUpdatingRenderer;
    }
    -[PXGEngine _resetChangeDetails](self, "_resetChangeDetails");
    if (self->_viewSizeDidChange)
      -[PXGEngine _deferredInvalidate:](self, "_deferredInvalidate:", 13);
    -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
    self->_previousUpdateEntities = v18;
    -[PXGEngine interactionState](self, "interactionState");
    v32 = v54;
    *(_OWORD *)&self->_previousInteractionState.scrollRegime = *(_OWORD *)buf;
    *(_OWORD *)&self->_previousInteractionState.contentChangeTrend = v32;
    v33 = v56;
    self->_previousInteractionState.targetRect.origin = v55;
    self->_previousInteractionState.targetRect.size = v33;
    kdebug_trace();
    v34 = self->_recordingSession;
    if (v34)
    {
      +[PXGEngineRecordingUpdateEndEvent eventWithUpdated:](PXGEngineRecordingUpdateEndEvent, "eventWithUpdated:", v18 != 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTungstenRecordingSession recordEvent:](v34, "recordEvent:", v35);

    }
    if (self->_delegateRespondsTo.updateDebugHUDWithStats)
    {
      -[PXGEngine delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "engine:updateDebugHUDWithStats:", self, self->_stats);

    }
    -[PXGEngine entityManager](self, "entityManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "cleanupUnusedObjects");

    self->_updateFlags.isPerformingUpdate = 0;
    if (self->_updateFlags.needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGEngine _updateIfNeededWithReason:]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("PXGEngine.m"), 1068, CFSTR("still needing to update %lu after update pass"), self->_updateFlags.needsUpdate);

    }
    goto LABEL_49;
  }
  PXGTungstenGetLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    PFBitmaskDescription();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v41;
    _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_ERROR, "Recursive update in PXGEngine (needs update: %@)", buf, 0xCu);

  }
  -[PXGEngine _recursiveUpdateDetected](self, "_recursiveUpdateDetected");
LABEL_51:

}

- (PXGEngineDelegate)delegate
{
  return (PXGEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  __int128 v3;
  CGSize v4;

  v3 = *(_OWORD *)&self[8].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var8.size.height;
  *(_OWORD *)&retstr->var4 = v3;
  v4 = *(CGSize *)&self[8].var8.origin.y;
  retstr->var8.origin = *(CGPoint *)&self[8].var5;
  retstr->var8.size = v4;
  return self;
}

- (void)_invalidateOrDefer:(unint64_t)a3
{
  if (!self->_updateFlags.isPerformingUpdate
    && (-[PXGEngine _shouldDeferRenderUntilNextFrame](self, "_shouldDeferRenderUntilNextFrame")
     || -[PXGEngine _shouldWaitForScrollEvent](self, "_shouldWaitForScrollEvent")))
  {
    -[PXGEngine _deferredInvalidate:](self, "_deferredInvalidate:", a3);
  }
  else
  {
    -[PXGEngine _forceInvalidate:](self, "_forceInvalidate:", a3);
  }
}

- (BOOL)_shouldDeferRenderUntilNextFrame
{
  _BOOL4 v3;

  v3 = -[PXGEngine didRenderThisFrame](self, "didRenderThisFrame");
  if (v3)
    LOBYTE(v3) = !-[PXGEngine _isInBackground](self, "_isInBackground");
  return v3;
}

- (BOOL)_shouldWaitForScrollEvent
{
  _BOOL4 v3;

  v3 = -[PXGEngine expectingScrollEvents](self, "expectingScrollEvents");
  if (v3)
  {
    if (-[PXGEngine _isInBackground](self, "_isInBackground"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[PXGAnimator hasCriticalAnimations](self->_animator, "hasCriticalAnimations");
  }
  return v3;
}

- (void)_setNeedsRender
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXGEngine displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  -[PXGEngine displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTimestamp");
  CACurrentMediaTime();
  kdebug_trace();

  -[PXGEngine setDidRenderThisFrame:](self, "setDidRenderThisFrame:", 1);
  v5 = -[PXGEngine _shouldDeferContentOffsetUpdates](self, "_shouldDeferContentOffsetUpdates");
  -[PXGEngine scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeferContentOffsetUpdates:", v5);

  -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXGEngine renderers](self, "renderers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setNeedsRender");
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[PXGEngine drivingRenderer](self, "drivingRenderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    -[PXGEngine _performRender](self, "_performRender");
}

- (void)_updateDisplayLink
{
  unint64_t needsUpdate;
  BOOL v4;
  _BOOL4 keepDisplayLinkAlive;
  _BOOL4 v6;
  _BOOL4 v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id pendingUpdateEntities;
  id v21;

  needsUpdate = self->_updateFlags.needsUpdate;
  pendingUpdateEntities = (id)self->_pendingUpdateEntities;
  v4 = -[PXGEngine didRenderThisFrame](self, "didRenderThisFrame");
  keepDisplayLinkAlive = self->_keepDisplayLinkAlive;
  v6 = -[PXGEngine gotScrollEventThisFrame](self, "gotScrollEventThisFrame");
  v7 = -[PXGEngine expectingScrollEvents](self, "expectingScrollEvents");
  v8 = -[PXGAnimator isAnimating](self->_animator, "isAnimating");
  v9 = -[PXGAnimator hasCriticalAnimations](self->_animator, "hasCriticalAnimations");
  -[PXGEngine scrollViewController](self, "scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deferContentOffsetUpdates");

  v12 = 1;
  if (!needsUpdate
    && !pendingUpdateEntities
    && !v4
    && !keepDisplayLinkAlive
    && !v6
    && !v7
    && !v8
    && !v9
    && (v11 & 1) == 0)
  {
    v12 = -[PXGEngine isExporting](self, "isExporting");
  }
  v13 = -[PXGEngine isVisible](self, "isVisible") & v12 ^ 1;
  -[PXGEngine displayLink](self, "displayLink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPaused:", v13);

  v15 = -[PXGAnimator highFrameRateReason](self->_animator, "highFrameRateReason");
  if (v6 || v7)
    v16 = 2228225;
  else
    v16 = 2228224;
  if (v15)
    v17 = v15;
  else
    v17 = v16;
  if (v15)
    v18 = 3;
  else
    v18 = 2;
  -[PXGEngine displayLink](self, "displayLink");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHighFrameRateReason:", v17);

  -[PXGEngine displayLink](self, "displayLink");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrameRateRangeType:", v18);

}

- (PXDisplayLinkProtocol)displayLink
{
  return self->_displayLink;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (BOOL)didRenderThisFrame
{
  return self->_didRenderThisFrame;
}

- (BOOL)expectingScrollEvents
{
  return self->_expectingScrollEvents;
}

- (BOOL)gotScrollEventThisFrame
{
  return self->_gotScrollEventThisFrame;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)_enumerateRenderers:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXGEngine renderers](self, "renderers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)renderers
{
  return self->_renderers;
}

uint64_t __39__PXGEngine__updateIfNeededWithReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithChangeDetails:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
}

void __27__PXGEngine__performRender__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _OWORD v14[13];
  __int128 v15;
  __int128 v16;
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
  _OWORD v28[4];

  v3 = a2;
  v4 = objc_msgSend(v3, "presentationType");
  objc_msgSend(v3, "setVisibleRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v5 = *(_OWORD *)(a1 + 120);
  v28[0] = *(_OWORD *)(a1 + 104);
  v28[1] = v5;
  v6 = *(_OWORD *)(a1 + 152);
  v28[2] = *(_OWORD *)(a1 + 136);
  v28[3] = v6;
  objc_msgSend(v3, "setInteractionState:", v28);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v7)
  {
    objc_msgSend(v7, "cameraConfiguration");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
  }
  v14[10] = v25;
  v14[11] = v26;
  v14[12] = v27;
  v14[6] = v21;
  v14[7] = v22;
  v14[8] = v23;
  v14[9] = v24;
  v14[2] = v17;
  v14[3] = v18;
  v14[4] = v19;
  v14[5] = v20;
  v14[0] = v15;
  v14[1] = v16;
  objc_msgSend(v3, "setCameraConfiguration:", v14);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  if (!(_DWORD)v4)
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "enableMetalRenderer") & 1) != 0)
      goto LABEL_12;
LABEL_11:

    v13 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  if ((_DWORD)v4 == 1 && (objc_msgSend(*(id *)(a1 + 48), "enableViewRenderer") & 1) == 0)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v3, "renderSpritesWithTextures:dataStore:presentationDataStore:presentationMetadataStore:layout:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));

}

- (void)handleDisplayLink:(id)a3
{
  PXDisplayLinkProtocol *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double lastRenderCompletionTimestamp;
  double v13;
  void *v14;
  PXDisplayLinkProtocol *v15;

  v4 = (PXDisplayLinkProtocol *)a3;
  if (self->_displayLink == v4)
  {
    v15 = v4;
    -[PXDisplayLinkProtocol timestamp](v4, "timestamp");
    -[PXDisplayLinkProtocol currentMediaTime](v15, "currentMediaTime");
    -[PXDisplayLinkProtocol targetTimestamp](v15, "targetTimestamp");
    kdebug_trace();
    v5 = -[PXGEngine gotScrollEventThisFrame](self, "gotScrollEventThisFrame");
    v6 = -[PXGEngine missedScrollEventThisFrame](self, "missedScrollEventThisFrame");
    -[PXGEngine lastScrollEventTime](self, "lastScrollEventTime");
    v8 = v7;
    -[PXDisplayLinkProtocol timestamp](v15, "timestamp");
    v10 = v8 >= v9 || v6;
    -[PXGEngine setExpectingScrollEvents:](self, "setExpectingScrollEvents:", v5 | v10);
    -[PXGEngine setGotScrollEventThisFrame:](self, "setGotScrollEventThisFrame:", v10);
    if (v6)
    {
      -[PXGEngine setMissedScrollEventThisFrame:](self, "setMissedScrollEventThisFrame:", 0);
      -[PXGEngine _forceInvalidate:](self, "_forceInvalidate:", 15);
    }
    -[PXGEngine textureManager](self, "textureManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_keepDisplayLinkAlive = objc_msgSend(v11, "streamUpdatedTexturesForDisplayLinkIfNeeded:", v15);

    lastRenderCompletionTimestamp = self->_lastRenderCompletionTimestamp;
    -[PXDisplayLinkProtocol timestamp](v15, "timestamp");
    -[PXGEngine setDidRenderThisFrame:](self, "setDidRenderThisFrame:", lastRenderCompletionTimestamp > v13);
    if (self->_pendingUpdateEntities)
    {
      self->_pendingUpdateEntities = 0;
      -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:");
    }
    if (-[PXGAnimator isAnimating](self->_animator, "isAnimating"))
      -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 2);
    -[PXGEngine scrollViewController](self, "scrollViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDeferContentOffsetUpdates:", 0);

    -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
    v4 = v15;
  }

}

- (PXGTextureManager)textureManager
{
  return self->_textureManager;
}

- (void)setDidRenderThisFrame:(BOOL)a3
{
  if (self->_didRenderThisFrame != a3)
  {
    self->_didRenderThisFrame = a3;
    kdebug_trace();
  }
}

- (void)setGotScrollEventThisFrame:(BOOL)a3
{
  if (self->_gotScrollEventThisFrame != a3)
  {
    self->_gotScrollEventThisFrame = a3;
    kdebug_trace();
  }
}

- (void)setExpectingScrollEvents:(BOOL)a3
{
  if (self->_expectingScrollEvents != a3)
  {
    self->_expectingScrollEvents = a3;
    kdebug_trace();
  }
}

- (BOOL)missedScrollEventThisFrame
{
  return self->_missedScrollEventThisFrame;
}

- (double)lastScrollEventTime
{
  return self->_lastScrollEventTime;
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (BOOL)statsTrackingEnabled
{
  return self->_statsTrackingEnabled;
}

- (PXGRenderer)drivingRenderer
{
  return self->_drivingRenderer;
}

- (BOOL)_shouldDeferContentOffsetUpdates
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v8;
  char v9;

  -[PXGEngine scrollViewController](self, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTracking");

  if ((v4 & 1) != 0)
    return 1;
  -[PXGEngine scrollViewController](self, "scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDragging");

  if ((v6 & 1) != 0)
    return 1;
  -[PXGEngine scrollViewController](self, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDecelerating");

  return v9;
}

- (void)_updateAnimatorWithTargetTimestamp:(double)a3
{
  double Current;
  PXGAnimator *animator;
  PXGSpriteDataStore *layoutSpriteDataStore;
  PXGChangeDetails *layoutChangeDetails;
  PXGLayout *layout;
  PXGSpriteDataStore *animationPresentationSpriteDataStore;
  PXGSpriteDataStore *animationTargetSpriteDataStore;
  id v12;
  id v13;
  PXGLayout *v14;
  NSObject *v15;
  PXGLayout *animationLayout;
  PXGLayout *v17;
  PXGSpriteMetadataStore *v18;
  PXGSpriteMetadataStore *presentationSpriteMetadaStore;
  PXGEngine *v20;
  uint64_t v21;
  double v22;
  double v23;
  PXGAnimator *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  PXGAnimator *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  Current = CFAbsoluteTimeGetCurrent();
  -[PXGAnimator setPreferredFramesPerSecond:](self->_animator, "setPreferredFramesPerSecond:", -[PXDisplayLinkProtocol preferredFramesPerSecond](self->_displayLink, "preferredFramesPerSecond"));
  animator = self->_animator;
  layoutSpriteDataStore = self->_layoutSpriteDataStore;
  layoutChangeDetails = self->_layoutChangeDetails;
  layout = self->_layout;
  animationPresentationSpriteDataStore = self->_animationPresentationSpriteDataStore;
  animationTargetSpriteDataStore = self->_animationTargetSpriteDataStore;
  v25 = 0;
  v26 = 0;
  -[PXGAnimator computeAnimationStateForTime:inputSpriteDataStore:inputChangeDetails:inputLayout:viewportShift:animationPresentationSpriteDataStore:animationTargetSpriteDataStore:animationChangeDetails:animationLayout:](animator, "computeAnimationStateForTime:inputSpriteDataStore:inputChangeDetails:inputLayout:viewportShift:animationPresentationSpriteDataStore:animationTargetSpriteDataStore:animationChangeDetails:animationLayout:", layoutSpriteDataStore, layoutChangeDetails, layout, animationPresentationSpriteDataStore, animationTargetSpriteDataStore, &v26, a3, self->_viewportShift.x, self->_viewportShift.y, &v25);
  v12 = v26;
  v13 = v26;
  v14 = (PXGLayout *)v25;
  self->_viewportShift = (CGPoint)*MEMORY[0x1E0C9D538];
  objc_storeStrong((id *)&self->_animationChangeDetails, v12);
  if (!v14)
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_animator;
      *(_DWORD *)buf = 134218242;
      v28 = a3;
      v29 = 2112;
      v30 = v24;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "missing animationLayout when computing state for time %f for animator %@", buf, 0x16u);
    }

  }
  animationLayout = self->_animationLayout;
  self->_animationLayout = v14;
  v17 = v14;

  -[PXGLayout spriteMetadataStore](self->_layout, "spriteMetadataStore");
  v18 = (PXGSpriteMetadataStore *)objc_claimAutoreleasedReturnValue();
  presentationSpriteMetadaStore = self->_presentationSpriteMetadaStore;
  self->_presentationSpriteMetadaStore = v18;

  -[PXGSpriteDataStore count](self->_animationPresentationSpriteDataStore, "count");
  kdebug_trace();
  v20 = objc_retainAutorelease(self);
  v21 = -[PXGEngine stats](v20, "stats");
  v22 = CFAbsoluteTimeGetCurrent() - Current;
  *(double *)(v21 + 16) = v22;
  *(double *)(v21 + 64) = v22 + *(double *)(v21 + 64);
  ++*(_QWORD *)(v21 + 112);
  v23 = *(double *)(v21 + 160);
  if (v23 > v22 || v23 == 0.0)
    *(double *)(v21 + 160) = v22;
  if (*(double *)(v21 + 208) < v22)
    *(double *)(v21 + 208) = v22;
  if (v20->_renderForTargetTimestamp == 0.0)
    v20->_renderForTargetTimestamp = a3;
  -[PXGEngine _forceInvalidate:](v20, "_forceInvalidate:", 12);

}

- (BOOL)wantsImmediateUpdates
{
  return self->_wantsImmediateUpdates;
}

- (BOOL)_isInBackground
{
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;

  -[PXGEngine layoutQueue](self, "layoutQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C80D38];

  if (v3 != v4)
    return -[PXGEngine wantsImmediateUpdates](self, "wantsImmediateUpdates");
  if (_UIApplicationIsExtension())
  {
    if (!self->_extensionHostIsInBackground)
      return -[PXGEngine wantsImmediateUpdates](self, "wantsImmediateUpdates");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "applicationState");

    if (v7 != 2)
      return -[PXGEngine wantsImmediateUpdates](self, "wantsImmediateUpdates");
  }
  return 1;
}

- (void)_deferredInvalidate:(unint64_t)a3
{
  unint64_t pendingUpdateEntities;

  kdebug_trace();
  pendingUpdateEntities = self->_pendingUpdateEntities;
  if ((pendingUpdateEntities | a3) != pendingUpdateEntities)
  {
    self->_pendingUpdateEntities = pendingUpdateEntities | a3;
    -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
  }
}

- (void)textureManagerNeedsUpdate:(id)a3
{
  -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 4);
}

void __40__PXGEngine__propagateTextureConverters__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "textureConverter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __37__PXGEngine_setScrollViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setScrollViewController:", *(_QWORD *)(a1 + 32));

}

- (void)rendererNeedsUpdate:(id)a3
{
  -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 8);
}

- (void)rendererPerformRender:(id)a3
{
  if (self->_drivingRenderer == a3)
    -[PXGEngine _performRender](self, "_performRender");
}

- (void)renderer:(id)a3 viewportSizeWillChange:(CGSize)a4
{
  -[PXGEngine _forceInvalidate:](self, "_forceInvalidate:", 15, a4.width, a4.height);
}

uint64_t __26__PXGEngine__updateLayout__block_invoke_4()
{
  return kdebug_trace();
}

- (void)_updateLayout
{
  void *v3;
  PXGEngine *v4;
  uint64_t v5;
  double Current;
  void *v7;
  BOOL isLiveResizing;
  int v9;
  NSObject *v10;
  int v11;
  char v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  PXGSpriteDataStore *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  PXGSpriteDataStore *v48;
  double *v49;
  uint64_t v50;
  _BYTE *v51;
  unint64_t v52;
  char v53;
  BOOL isUpdatingScrollView;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  void (**v70)(_QWORD);
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  double v79;
  uint64_t v80;
  double v81;
  unsigned int v82;
  id obj;
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  -[PXGEngine layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(self);
  v5 = -[PXGEngine stats](v4, "stats");
  v102 = 0;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[PXGEngine scrollState](v4, "scrollState");
  kdebug_trace();
  Current = CFAbsoluteTimeGetCurrent();
  -[PXGEngine coalescingAXResponder](v4, "coalescingAXResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v7, "pauseEventDelivery");
  isLiveResizing = 1;
  objc_msgSend(v7, "setPauseEventDelivery:", 1);
  objc_msgSend(v3, "visibleRect");
  if (PXSizeApproximatelyEqualToSize())
    isLiveResizing = v4->_isLiveResizing;
  v4->_viewSizeDidChange = isLiveResizing;
  v9 = -[PXGEngine didDisappear](v4, "didDisappear") || -[PXGEngine isInitialLoad](v4, "isInitialLoad");
  objc_msgSend(v3, "setAppearState:", v9 ^ 1u);
  objc_msgSend(v3, "setVisibleRect:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, "setSafeAreaInsets:", v93, v94);
  objc_msgSend(v3, "setReferenceSize:", v92);
  objc_msgSend(v3, "setLastScrollDirection:", v101);
  objc_msgSend(v3, "setScrollSpeedRegime:", v102);
  -[PXGEngine _updateLayoutInteractions](v4, "_updateLayoutInteractions");
  -[PXGEngine layoutQueue](v4, "layoutQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v12 = PXGLayoutCanInstallLayoutCompletionBlock;
  if (v11)
    PXGLayoutCanInstallLayoutCompletionBlock = 1;
  v13 = -[PXGEngine scrollStateIncludesScrollEvent](v4, "scrollStateIncludesScrollEvent");
  -[PXGEngine setScrollStateIncludesScrollEvent:](v4, "setScrollStateIncludesScrollEvent:", 0);
  PXPointSubtract();
  v15 = v14;
  v17 = v16;
  v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v79 = *MEMORY[0x1E0C9D538];
  if ((PXPointApproximatelyEqualToPoint() & 1) == 0 && v13)
    objc_msgSend(v3, "containingScrollViewDidScroll:", v15, v17);
  objc_msgSend(v3, "updateIfNeeded");
  if (v11)
    PXGLayoutCanInstallLayoutCompletionBlock = v12;
  v19 = CFAbsoluteTimeGetCurrent() - Current;
  *(double *)v5 = v19;
  *(double *)(v5 + 48) = v19 + *(double *)(v5 + 48);
  ++*(_QWORD *)(v5 + 96);
  v20 = *(double *)(v5 + 144);
  if (v20 > v19 || v20 == 0.0)
    *(double *)(v5 + 144) = v19;
  if (*(double *)(v5 + 192) < v19)
    *(double *)(v5 + 192) = v19;
  v80 = v5;
  v21 = CFAbsoluteTimeGetCurrent();
  v22 = objc_msgSend(v3, "numberOfSprites");
  objc_msgSend(v3, "changeDetails");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");

  if (kdebug_is_enabled())
  {
    v75 = v24;
    v76 = v7;
    v77 = v3;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v24;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v89;
      v28 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v89 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          objc_msgSend(v30, "removedIndexes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v87[0] = v28;
          v87[1] = 3221225472;
          v87[2] = __26__PXGEngine__updateLayout__block_invoke;
          v87[3] = &unk_1E5140880;
          v87[4] = v4;
          objc_msgSend(v31, "enumerateRangesUsingBlock:", v87);

          objc_msgSend(v30, "insertedIndexes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v86[0] = v28;
          v86[1] = 3221225472;
          v86[2] = __26__PXGEngine__updateLayout__block_invoke_2;
          v86[3] = &unk_1E5140880;
          v86[4] = v4;
          objc_msgSend(v32, "enumerateRangesUsingBlock:", v86);

          objc_msgSend(v30, "movesToIndexes");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v85[0] = v28;
          v85[1] = 3221225472;
          v85[2] = __26__PXGEngine__updateLayout__block_invoke_3;
          v85[3] = &unk_1E5140880;
          v85[4] = v4;
          objc_msgSend(v33, "enumerateRangesUsingBlock:", v85);

          objc_msgSend(v30, "changedIndexes");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v84[0] = v28;
          v84[1] = 3221225472;
          v84[2] = __26__PXGEngine__updateLayout__block_invoke_4;
          v84[3] = &unk_1E5140880;
          v84[4] = v4;
          objc_msgSend(v34, "enumerateRangesUsingBlock:", v84);

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
      }
      while (v26);
    }

    v7 = v76;
    v3 = v77;
    v24 = v75;
  }
  v35 = -[PXGChangeDetails layoutVersionAfterChange](v4->_layoutChangeDetails, "layoutVersionAfterChange");
  -[PXGChangeDetails configureWithNumberOfSpritesAfterChange:changeDetails:](v4->_layoutChangeDetails, "configureWithNumberOfSpritesAfterChange:changeDetails:", v22, v24);
  -[PXGChangeDetails setLayoutVersionBeforeChange:](v4->_layoutChangeDetails, "setLayoutVersionBeforeChange:", v35);
  -[PXGChangeDetails setLayoutVersionAfterChange:](v4->_layoutChangeDetails, "setLayoutVersionAfterChange:", objc_msgSend(v3, "version"));
  objc_msgSend(v3, "changeDetails");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeAllObjects");

  v37 = v4->_layoutSpriteDataStore;
  objc_msgSend(v3, "copyLayoutForSpritesInRange:toSpriteDataStore:", v22 << 32, v37);
  objc_msgSend(v3, "contentSize");
  v39 = v38;
  v41 = v40;
  objc_msgSend(v3, "changeDetails");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "changeDetails");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PXGEngine.m"), 1182, CFSTR("%@ modified itself during the layout copy pass, details:%@"), v3, v73);

  }
  v44 = CFAbsoluteTimeGetCurrent() - v21;
  *(double *)(v80 + 8) = v44;
  *(double *)(v80 + 56) = v44 + *(double *)(v80 + 56);
  ++*(_QWORD *)(v80 + 104);
  v45 = *(double *)(v80 + 152);
  if (v45 > v44 || v45 == 0.0)
    *(double *)(v80 + 152) = v44;
  if (*(double *)(v80 + 200) < v44)
    *(double *)(v80 + 200) = v44;
  v81 = v18;
  kdebug_trace();
  if (objc_msgSend(v3, "scrollableAxis") != 2 && objc_msgSend(v3, "userInterfaceDirection") == 1)
  {
    objc_msgSend(v3, "referenceSize");
    v47 = v46;
    v48 = objc_retainAutorelease(v37);
    v49 = (double *)-[PXGSpriteDataStore geometries](v48, "geometries");
    v50 = -[PXGSpriteDataStore styles](objc_retainAutorelease(v48), "styles");
    if ((_DWORD)v22)
    {
      v51 = (_BYTE *)(v50 + 70);
      do
      {
        *v49 = v47 - *v49;
        v52 = *v51;
        if (v52 > 0xD)
          v53 = 0;
        else
          v53 = byte_1A7C0A988[v52];
        *v51 = v53;
        v51 += 160;
        v49 += 4;
        LODWORD(v22) = v22 - 1;
      }
      while ((_DWORD)v22);
    }
  }
  isUpdatingScrollView = v4->_isUpdatingScrollView;
  v4->_isUpdatingScrollView = 1;
  -[PXGEngine scrollController](v4, "scrollController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "contentBounds");
  v57 = v56;
  v59 = v58;
  objc_msgSend(v55, "visibleOrigin");
  objc_msgSend(v3, "visibleRect");
  v61 = v60;
  v63 = v62;
  objc_msgSend(v55, "setContentBounds:", v57, v59, v39, v41);
  v64 = v79;
  v65 = v81;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    objc_msgSend(v55, "setVisibleOrigin:", v61, v63);
    objc_msgSend(v55, "visibleOrigin");
    PXPointSubtract();
    v64 = v66;
    v65 = v67;
    -[PXGEngine _updateScrollStateWithReason:](v4, "_updateScrollStateWithReason:", 1);
  }
  v4->_viewportShift.x = v64;
  v4->_viewportShift.y = v65;
  objc_msgSend(v55, "constrainedVisibleRect");
  v4->_previousVisibleOrigin.x = v68;
  v4->_previousVisibleOrigin.y = v69;
  v4->_isUpdatingScrollView = isUpdatingScrollView;
  -[PXGEngine _forceInvalidate:](v4, "_forceInvalidate:", 14);
  objc_msgSend(v7, "setPauseEventDelivery:", v82);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v70 = (void (**)(_QWORD))_Block_copy((const void *)PXGLayoutLayoutCompletionBlock);
    v71 = (void *)PXGLayoutLayoutCompletionBlock;
    PXGLayoutLayoutCompletionBlock = 0;

    if (v70)
      v70[2](v70);
    if (PXGSimulatedLayoutGlitchPeriod)
    {
      v74 = _updateLayout_counter;
      if (!(_updateLayout_counter % PXGSimulatedLayoutGlitchPeriod))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", *(double *)&PXGSimulatedLayoutGlitchDuration);
        v74 = _updateLayout_counter;
      }
      _updateLayout_counter = v74 + 1;
    }

  }
  -[PXGEngine setDidChangeWindow:](v4, "setDidChangeWindow:", 0);

}

- (void)_updateScrollStateWithReason:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  int64_t v32;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int64_t scrollSpeedRegime;
  int v38;
  void *v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  void *v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  -[PXGEngine scrollController](self, "scrollController");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXGEngine isExporting](self, "isExporting"))
  {
    objc_msgSend(v66, "referenceSize");
    v6 = v5;
    v65 = v7;
    objc_msgSend(v66, "contentInset");
    v63 = v9;
    v64 = v8;
    v61 = v11;
    v62 = v10;
    objc_msgSend(v66, "visibleRect");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v66, "targetRect");
    v59 = v21;
    v60 = v20;
    v57 = v23;
    v58 = v22;
    objc_msgSend(v66, "constrainedVisibleRect");
    v55 = v25;
    v56 = v24;
    v53 = v27;
    v54 = v26;
    -[PXGEngine scrollViewSpeedometer](self, "scrollViewSpeedometer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastScrollDirection");
    v51 = v30;
    v52 = v29;
    -[PXGEngine scrollViewSpeedometer](self, "scrollViewSpeedometer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "regime");

    v50 = v6;
    if (self->_scrollState.referenceSize.width != v6)
      goto LABEL_24;
    if (self->_scrollState.referenceSize.height != v65)
      goto LABEL_24;
    x = self->_scrollState.visibleRect.origin.x;
    y = self->_scrollState.visibleRect.origin.y;
    width = self->_scrollState.visibleRect.size.width;
    height = self->_scrollState.visibleRect.size.height;
    v48 = self->_scrollState.targetRect.origin.y;
    v49 = self->_scrollState.targetRect.origin.x;
    v46 = self->_scrollState.targetRect.size.height;
    v47 = self->_scrollState.targetRect.size.width;
    v44 = self->_scrollState.constrainedVisibleRect.origin.y;
    v45 = self->_scrollState.constrainedVisibleRect.origin.x;
    v42 = self->_scrollState.constrainedVisibleRect.size.height;
    v43 = self->_scrollState.constrainedVisibleRect.size.width;
    v40 = self->_scrollState.lastScrollDirection.y;
    v41 = self->_scrollState.lastScrollDirection.x;
    scrollSpeedRegime = self->_scrollState.scrollSpeedRegime;
    if (!PXEdgeInsetsEqualToEdgeInsets())
      goto LABEL_24;
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v70.origin.x = v13;
    v70.origin.y = v15;
    v70.size.width = v17;
    v70.size.height = v19;
    if (!CGRectEqualToRect(v67, v70))
      goto LABEL_24;
    v68.origin.y = v48;
    v68.origin.x = v49;
    v68.size.height = v46;
    v68.size.width = v47;
    v71.origin.y = v59;
    v71.origin.x = v60;
    v71.size.height = v57;
    v71.size.width = v58;
    if (!CGRectEqualToRect(v68, v71))
      goto LABEL_24;
    v69.origin.y = v44;
    v69.origin.x = v45;
    v69.size.height = v42;
    v69.size.width = v43;
    v72.origin.y = v55;
    v72.origin.x = v56;
    v72.size.height = v53;
    v72.size.width = v54;
    if (!CGRectEqualToRect(v69, v72) || v41 != v52 || v40 != v51 || scrollSpeedRegime != v32)
    {
LABEL_24:
      if (a3 == 4
        && (v73.origin.x = v13,
            v73.origin.y = v15,
            v73.size.width = v17,
            v73.size.height = v19,
            !CGRectEqualToRect(self->_scrollState.visibleRect, v73)))
      {
        v38 = 1;
        -[PXGEngine setGotScrollEventThisFrame:](self, "setGotScrollEventThisFrame:", 1);
        -[PXGEngine setExpectingScrollEvents:](self, "setExpectingScrollEvents:", 1);
        -[PXGEngine displayLink](self, "displayLink");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "currentMediaTime");
        -[PXGEngine setLastScrollEventTime:](self, "setLastScrollEventTime:");

        -[PXGEngine setScrollStateIncludesScrollEvent:](self, "setScrollStateIncludesScrollEvent:", 1);
        -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
      }
      else
      {
        v38 = 0;
      }
      self->_scrollState.referenceSize.width = v50;
      self->_scrollState.referenceSize.height = v65;
      self->_scrollState.contentInsets.top = v64;
      self->_scrollState.contentInsets.left = v63;
      self->_scrollState.contentInsets.bottom = v62;
      self->_scrollState.contentInsets.right = v61;
      self->_scrollState.visibleRect.origin.x = v13;
      self->_scrollState.visibleRect.origin.y = v15;
      self->_scrollState.visibleRect.size.width = v17;
      self->_scrollState.visibleRect.size.height = v19;
      self->_scrollState.targetRect.origin.x = v60;
      self->_scrollState.targetRect.origin.y = v59;
      self->_scrollState.targetRect.size.width = v58;
      self->_scrollState.targetRect.size.height = v57;
      self->_scrollState.constrainedVisibleRect.origin.x = v56;
      self->_scrollState.constrainedVisibleRect.origin.y = v55;
      self->_scrollState.constrainedVisibleRect.size.width = v54;
      self->_scrollState.constrainedVisibleRect.size.height = v53;
      self->_scrollState.lastScrollDirection.x = v52;
      self->_scrollState.lastScrollDirection.y = v51;
      self->_scrollState.scrollSpeedRegime = v32;
      if (!self->_isUpdatingScrollView)
      {
        kdebug_trace();
        if (v38)
        {
          if (!-[PXGEngine _shouldDeferRenderUntilNextFrame](self, "_shouldDeferRenderUntilNextFrame"))
          {
            -[PXGEngine _forceInvalidate:](self, "_forceInvalidate:", 15);
            goto LABEL_21;
          }
          -[PXGEngine setMissedScrollEventThisFrame:](self, "setMissedScrollEventThisFrame:", 1);
        }
        -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 15);
      }
    }
  }
LABEL_21:

}

- (PXScrollViewSpeedometer)scrollViewSpeedometer
{
  return self->_scrollViewSpeedometer;
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)_updateInteractionState
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  BOOL v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  BOOL v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  __int128 v26;
  _BYTE v27[117];
  __int128 v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _BYTE v42[37];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  -[PXGEngine scrollViewSpeedometer](self, "scrollViewSpeedometer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "regime");

  v37 = v4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  -[PXGEngine layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __36__PXGEngine__updateInteractionState__block_invoke;
  v29[3] = &unk_1E5137278;
  v29[4] = &v38;
  v29[5] = &v34;
  v29[6] = &v30;
  objc_msgSend(v5, "enumerateDescendantsLayoutsUsingBlock:", v29);

  v6 = self->_animatorWasAnimatingAtBeginningOfFrame && -[PXGAnimator isAnimating](self->_animator, "isAnimating");
  v7 = -[PXGEngine isExporting](self, "isExporting");
  v17 = v35[3];
  -[PXGEngine scrollViewController](self, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAnimatingScroll");
  -[PXGEngine scrollViewController](self, "scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isScrubbing");
  v12 = v6 || *((_BYTE *)v39 + 24) != 0;
  v13 = v31[3];
  v14 = self->_viewSizeDidChange && !v7;
  v15 = self->_isInitialLoad && !v7;
  v16 = -[PXGEngine isVisible](self, "isVisible");
  -[PXGEngine scrollState](self, "scrollState");
  *(_OWORD *)&v42[5] = *(_OWORD *)&v27[101];
  *(_OWORD *)&v42[21] = v28;
  v26 = *(_OWORD *)v42;
  v18 = v17;
  v19 = v9;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  *(_OWORD *)v27 = *(_OWORD *)&v42[16];
  *(_QWORD *)&v27[13] = *((_QWORD *)&v28 + 1);
  -[PXGEngine setInteractionState:](self, "setInteractionState:", &v18);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

- (_PXGEngineScrollState)scrollState
{
  CGPoint v3;
  CGPoint lastScrollDirection;
  CGPoint v5;
  CGPoint origin;
  CGPoint v7;

  retstr->scrollSpeedRegime = *(_QWORD *)&self[4].visibleRect.origin.y;
  v3 = *(CGPoint *)&self[4].contentInsets.right;
  retstr->constrainedVisibleRect.size = *(CGSize *)&self[4].contentInsets.left;
  retstr->lastScrollDirection = v3;
  lastScrollDirection = self[3].lastScrollDirection;
  retstr->visibleRect.size = self[3].constrainedVisibleRect.size;
  retstr->targetRect.origin = lastScrollDirection;
  v5 = *(CGPoint *)&self[4].referenceSize.height;
  retstr->targetRect.size = *(CGSize *)&self[3].scrollSpeedRegime;
  retstr->constrainedVisibleRect.origin = v5;
  origin = self[3].targetRect.origin;
  retstr->referenceSize = self[3].visibleRect.size;
  *(CGPoint *)&retstr->contentInsets.top = origin;
  v7 = self[3].constrainedVisibleRect.origin;
  *(CGSize *)&retstr->contentInsets.bottom = self[3].targetRect.size;
  retstr->visibleRect.origin = v7;
  return self;
}

- (void)setInteractionState:(id *)a3
{
  __int128 v3;
  __int128 v4;
  CGSize size;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var4;
  size = a3->var8.size;
  self->_interactionState.targetRect.origin = a3->var8.origin;
  self->_interactionState.targetRect.size = size;
  *(_OWORD *)&self->_interactionState.scrollRegime = v3;
  *(_OWORD *)&self->_interactionState.contentChangeTrend = v4;
}

- (void)_resetChangeDetails
{
  PXGChangeDetails *layoutChangeDetails;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  layoutChangeDetails = self->_layoutChangeDetails;
  v4 = -[PXGSpriteDataStore count](self->_layoutSpriteDataStore, "count");
  v5 = MEMORY[0x1E0C9AA60];
  -[PXGChangeDetails configureWithNumberOfSpritesAfterChange:changeDetails:](layoutChangeDetails, "configureWithNumberOfSpritesAfterChange:changeDetails:", v4, MEMORY[0x1E0C9AA60]);
  -[PXGChangeDetails configureWithNumberOfSpritesAfterChange:changeDetails:](self->_animationChangeDetails, "configureWithNumberOfSpritesAfterChange:changeDetails:", -[PXGSpriteDataStore count](self->_animationTargetSpriteDataStore, "count"), v5);
  -[PXGEngine layout](self, "layout");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "version");
  -[PXGChangeDetails setLayoutVersionAfterChange:](self->_layoutChangeDetails, "setLayoutVersionAfterChange:", v6);
  -[PXGChangeDetails setLayoutVersionBeforeChange:](self->_layoutChangeDetails, "setLayoutVersionBeforeChange:", v6);

}

- (void)_performRender
{
  PXGEngine *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double Current;
  PXGSpriteDataStore *v13;
  PXGSpriteMetadataStore *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  PXGSpriteDataStore *v26;
  PXGSpriteMetadataStore *v27;
  PXGTungstenEngineRecordingSession *recordingSession;
  void *v29;
  void *v30;
  PXGSpriteMetadataStore *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void (**v41)(_QWORD);
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  PXGSpriteDataStore *v47;
  PXGSpriteMetadataStore *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v2 = objc_retainAutorelease(self);
  v3 = -[PXGEngine stats](v2, "stats");
  -[PXGLayout visibleRect](v2->_layout, "visibleRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  kdebug_trace();
  Current = CFAbsoluteTimeGetCurrent();
  v13 = v2->_animationPresentationSpriteDataStore;
  -[PXGSpriteDataStore count](v13, "count");
  v14 = v2->_presentationSpriteMetadaStore;
  v60 = 0u;
  v59 = 0u;
  v58 = 0u;
  v57 = 0u;
  -[PXGEngine interactionState](v2, "interactionState");
  -[PXGEngine textureManager](v2, "textureManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "texturesByPresentationType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGEngine overlayTextureManager](v2, "overlayTextureManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "overlayTexturesByPresentationTypeForTextures:spriteDataStore:", v16, v13);
  v18 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v18;
  -[PXGEngine _mergeTexturesByPresentationType:withOverlayTexturesByPresentationType:](v2, "_mergeTexturesByPresentationType:withOverlayTexturesByPresentationType:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = CFAbsoluteTimeGetCurrent() - Current;
  *(double *)(v3 + 32) = v20;
  *(double *)(v3 + 80) = v20 + *(double *)(v3 + 80);
  ++*(_QWORD *)(v3 + 128);
  v21 = *(double *)(v3 + 176);
  if (v21 > v20 || v21 == 0.0)
    *(double *)(v3 + 176) = v20;
  if (*(double *)(v3 + 224) < v20)
    *(double *)(v3 + 224) = v20;
  v22 = CFAbsoluteTimeGetCurrent();
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __27__PXGEngine__performRender__block_invoke;
  v44[3] = &unk_1E51372A0;
  v49 = v5;
  v50 = v7;
  v51 = v9;
  v52 = v11;
  v53 = v57;
  v54 = v58;
  v55 = v59;
  v56 = v60;
  v44[4] = v2;
  v24 = v19;
  v45 = v24;
  v25 = v23;
  v46 = v25;
  v26 = v13;
  v47 = v26;
  v27 = v14;
  v48 = v27;
  -[PXGEngine _enumerateRenderers:](v2, "_enumerateRenderers:", v44);
  recordingSession = v2->_recordingSession;
  if (recordingSession)
  {
    -[PXGTungstenRecordingSession frameState](v2->_recordingSession, "frameState");
    v42 = v25;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "recordedSpriteIndexes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEngine layout](v2, "layout");
    v31 = v27;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "displayScale");
    +[PXGEngineRecordingDataStoreEvent eventWithTextures:dataStore:spriteIndexes:screenScale:](PXGEngineRecordingDataStoreEvent, "eventWithTextures:dataStore:spriteIndexes:screenScale:", v24, v26, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGTungstenRecordingSession recordEvent:](recordingSession, "recordEvent:", v33);

    v27 = v31;
    v25 = v42;
  }
  -[PXGEngine setIsInitialLoad:](v2, "setIsInitialLoad:", 0);
  -[PXGEngine setDidDisappear:](v2, "setDidDisappear:", 0);
  -[PXGEngine layout](v2, "layout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAppearState:", 1);

  -[PXGEngine layout](v2, "layout");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "didRender");

  -[PXGEngine displayLink](v2, "displayLink");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "currentMediaTime");
  v2->_lastRenderCompletionTimestamp = v37;

  v38 = CFAbsoluteTimeGetCurrent() - v22;
  *(double *)(v3 + 40) = v38;
  *(double *)(v3 + 88) = v38 + *(double *)(v3 + 88);
  ++*(_QWORD *)(v3 + 136);
  v39 = *(double *)(v3 + 184);
  if (v39 > v38 || v39 == 0.0)
    *(double *)(v3 + 184) = v38;
  if (*(double *)(v3 + 232) < v38)
    *(double *)(v3 + 232) = v38;
  -[PXGEngine displayLink](v2, "displayLink");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "targetTimestamp");
  kdebug_trace();

  -[PXGEngine renderingCompletionHandler](v2, "renderingCompletionHandler");
  v41 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    -[PXGEngine setRenderingCompletionHandler:](v2, "setRenderingCompletionHandler:", 0);
    v41[2](v41);
  }
  -[PXGEngine _retargetAnimations](v2, "_retargetAnimations");

}

- (PXGLayout)layout
{
  return self->_layout;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  if (self->_isInitialLoad != a3)
  {
    self->_isInitialLoad = a3;
    -[PXGEngine _deferredInvalidate:](self, "_deferredInvalidate:", 12);
  }
}

- (void)setDidDisappear:(BOOL)a3
{
  self->_didDisappear = a3;
}

- (id)renderingCompletionHandler
{
  return self->_renderingCompletionHandler;
}

- (void)_retargetAnimations
{
  double renderForTargetTimestamp;
  double v4;
  void (**v5)(void);

  renderForTargetTimestamp = self->_renderForTargetTimestamp;
  if (renderForTargetTimestamp != 0.0)
  {
    -[PXDisplayLinkProtocol currentMediaTime](self->_displayLink, "currentMediaTime");
    if (v4 - renderForTargetTimestamp > 0.0)
      -[PXGAnimator retargetAnimationsAfterStartTime:newStartTime:](self->_animator, "retargetAnimationsAfterStartTime:newStartTime:", renderForTargetTimestamp, v4);
    self->_renderForTargetTimestamp = 0.0;
  }
  if (!-[PXGAnimator isAnimating](self->_animator, "isAnimating"))
  {
    -[PXGEngine animationRenderingCompletionHandler](self, "animationRenderingCompletionHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PXGEngine setAnimationRenderingCompletionHandler:](self, "setAnimationRenderingCompletionHandler:", 0);
      v5[2]();
    }

  }
}

- (void)_updateTextureManager
{
  PXGSpriteDataStore *animationPresentationSpriteDataStore;
  int v5;
  double Current;
  PXGLayout *animationLayout;
  NSObject *v8;
  PXGTextureManager *textureManager;
  PXGSpriteDataStore *animationTargetSpriteDataStore;
  PXGSpriteDataStore *v11;
  PXGChangeDetails *animationChangeDetails;
  PXGEngine *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  _BYTE v18[64];
  uint8_t buf[16];

  animationPresentationSpriteDataStore = self->_animationPresentationSpriteDataStore;
  if (animationPresentationSpriteDataStore)
  {
    v5 = -[PXGSpriteDataStore count](animationPresentationSpriteDataStore, "count");
    if (v5 != -[PXGSpriteDataStore count](self->_animationTargetSpriteDataStore, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEngine.m"), 1304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_animationPresentationSpriteDataStore.count == _animationTargetSpriteDataStore.count"));

    }
  }
  Current = CFAbsoluteTimeGetCurrent();
  animationLayout = self->_animationLayout;
  if (!animationLayout)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "missing _animationLayout", buf, 2u);
    }

    animationLayout = self->_animationLayout;
  }
  textureManager = self->_textureManager;
  v11 = self->_animationPresentationSpriteDataStore;
  animationTargetSpriteDataStore = self->_animationTargetSpriteDataStore;
  animationChangeDetails = self->_animationChangeDetails;
  -[PXGEngine interactionState](self, "interactionState");
  -[PXGTextureManager streamTexturesForSpritesInDataStore:presentationDataStore:changeDetails:layout:interactionState:](textureManager, "streamTexturesForSpritesInDataStore:presentationDataStore:changeDetails:layout:interactionState:", animationTargetSpriteDataStore, v11, animationChangeDetails, animationLayout, v18);
  v13 = objc_retainAutorelease(self);
  v14 = -[PXGEngine stats](v13, "stats");
  v15 = CFAbsoluteTimeGetCurrent() - Current;
  *(double *)(v14 + 24) = v15;
  *(double *)(v14 + 72) = v15 + *(double *)(v14 + 72);
  ++*(_QWORD *)(v14 + 120);
  v16 = *(double *)(v14 + 168);
  if (v16 > v15 || v16 == 0.0)
    *(double *)(v14 + 168) = v15;
  if (*(double *)(v14 + 216) < v15)
    *(double *)(v14 + 216) = v15;
  -[PXGEngine _notifyContentLoadedObserversIfNeeded](v13, "_notifyContentLoadedObserversIfNeeded");
  -[PXGEngine _forceInvalidate:](v13, "_forceInvalidate:", 8);
}

- (void)_forceInvalidate:(unint64_t)a3
{
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_updateFlags.isPerformingUpdate)
  {
    if ((self->_updateFlags.updated & a3) == 0)
    {
      needsUpdate = self->_updateFlags.needsUpdate;
LABEL_4:
      self->_updateFlags.needsUpdate = needsUpdate | a3;
      return;
    }
    PXGTungstenGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PFBitmaskDescription();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PFBitmaskDescription();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Recursive update in PXGEngine (invalidating: %@; already updated: %@)",
        (uint8_t *)&v9,
        0x16u);

    }
    -[PXGEngine _recursiveUpdateDetected](self, "_recursiveUpdateDetected");
  }
  else
  {
    needsUpdate = self->_updateFlags.needsUpdate;
    if (!a3 || needsUpdate)
      goto LABEL_4;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    self->_updateFlags.needsUpdate = a3;
    if (!willPerformUpdate)
    {
      kdebug_trace();
      -[PXGEngine __setNeedsUpdate](self, "__setNeedsUpdate");
      -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
    }
  }
}

- ($6AF0136504CCF97645EE7C74F8AB9C3B)stats
{
  return self->_stats;
}

- (void)__setNeedsUpdate
{
  id v3;

  kdebug_trace();
  -[PXGEngine delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "engineSetNeedsUpdate:", self);

}

- (void)_notifyContentLoadedObserversIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  PXGSpriteDataStore *animationPresentationSpriteDataStore;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  -[PXGEngine pendingContentLoadedNotificationBlocks](self, "pendingContentLoadedNotificationBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    -[PXGEngine entityManager](self, "entityManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadingStatus");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "states");

    animationPresentationSpriteDataStore = self->_animationPresentationSpriteDataStore;
    -[PXGLayout visibleRect](self->_layout, "visibleRect");
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke;
    v17[3] = &unk_1E5145818;
    v17[4] = &v18;
    v17[5] = v7;
    -[PXGSpriteDataStore enumerateSpritesInRect:usingBlock:](animationPresentationSpriteDataStore, "enumerateSpritesInRect:usingBlock:", v17);
    if (!*((_BYTE *)v19 + 24))
    {
      -[PXGEngine pendingContentLoadedNotificationBlocks](self, "pendingContentLoadedNotificationBlocks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      -[PXGEngine pendingContentLoadedNotificationBlocks](self, "pendingContentLoadedNotificationBlocks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeAllObjects");

      -[PXGEngine layoutQueue](self, "layoutQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke_2;
      block[3] = &unk_1E5149198;
      v16 = v11;
      v14 = v11;
      dispatch_async(v13, block);

    }
    _Block_object_dispose(&v18, 8);
  }
}

- (NSMutableArray)pendingContentLoadedNotificationBlocks
{
  return self->_pendingContentLoadedNotificationBlocks;
}

- (PXGAXCoalescingResponder)coalescingAXResponder
{
  return self->_coalescingAXResponder;
}

- (void)_updateLayoutInteractions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PXGEngine interactions](self, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGEngine activeInteractions](self, "activeInteractions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");
  -[PXGEngine interactionView](self, "interactionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGEngine scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGEngine layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __38__PXGEngine__updateLayoutInteractions__block_invoke;
  v23[3] = &unk_1E5137250;
  v8 = v6;
  v24 = v8;
  v9 = v5;
  v25 = v9;
  v10 = v3;
  v26 = v10;
  v11 = v4;
  v27 = v11;
  objc_msgSend(v7, "enumerateDescendantsLayoutsUsingBlock:", v23);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v17, "setScrollViewController:", 0, (_QWORD)v19);
        objc_msgSend(v17, "setView:", 0);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v14);
  }

  -[PXGEngine interactions](self, "interactions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSet:", v11);

}

- (NSMutableSet)interactions
{
  return self->_interactions;
}

- (PXGHitTestEnvironment)interactionView
{
  return (PXGHitTestEnvironment *)objc_loadWeakRetained((id *)&self->_interactionView);
}

- (NSMutableSet)activeInteractions
{
  return self->_activeInteractions;
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (id)animationRenderingCompletionHandler
{
  return self->_animationRenderingCompletionHandler;
}

- (void)_propagateTextureConverters
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXGEngine__propagateTextureConverters__block_invoke;
  v6[3] = &unk_1E5137228;
  v7 = v3;
  v4 = v3;
  -[PXGEngine _enumerateRenderers:](self, "_enumerateRenderers:", v6);
  -[PXGEngine textureManager](self, "textureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextureConverters:", v4);

}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3 namedImagesBundle:(id)a4
{
  id v6;
  PXGDisplayAssetTextureProvider *v7;
  void *v8;
  PXGDisplayAssetTextureProvider *v9;
  PXGStringTextureProvider *v10;
  PXGTitleSubtitleTextureProvider *v11;
  PXGSolidColorTextureProvider *v12;
  PXGDecorationTextureProvider *v13;
  PXGGradientTextureProvider *v14;
  PXGShadowTextureProvider *v15;
  PXGViewTextureProvider *v16;
  PXGCaptureSpriteTextureProvider *v17;
  PXGPathTextureProvider *v18;
  PXGPersonTextureProvider *v19;
  PXGHostedContentTextureProvider *v20;
  PXGNamedImageTextureProvider *v21;
  PXGNamedImageTextureProvider *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (v24)
  {
    v7 = [PXGDisplayAssetTextureProvider alloc];
    -[PXGEngine layoutQueue](self, "layoutQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXGDisplayAssetTextureProvider initWithDefaultMediaProvider:layoutQueue:](v7, "initWithDefaultMediaProvider:layoutQueue:", v24, v8);

    -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v9, 2);
    -[PXGEngine setMediaProvider:](self, "setMediaProvider:", v24);

  }
  v10 = objc_alloc_init(PXGStringTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v10, 3);

  v11 = objc_alloc_init(PXGTitleSubtitleTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v11, 4);

  v12 = objc_alloc_init(PXGSolidColorTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v12, 5);

  v13 = objc_alloc_init(PXGDecorationTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v13, 8);

  v14 = objc_alloc_init(PXGGradientTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v14, 6);

  v15 = objc_alloc_init(PXGShadowTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v15, 7);

  v16 = objc_alloc_init(PXGViewTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v16, 10);

  v17 = objc_alloc_init(PXGCaptureSpriteTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v17, 9);

  v18 = objc_alloc_init(PXGPathTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v18, 11);

  v19 = objc_alloc_init(PXGPersonTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v19, 12);

  v20 = objc_alloc_init(PXGHostedContentTextureProvider);
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v20, 13);

  v21 = objc_alloc_init(PXGNamedImageTextureProvider);
  v22 = v21;
  if (v6)
  {
    -[PXGNamedImageTextureProvider setBundle:](v21, "setBundle:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGNamedImageTextureProvider setBundle:](v22, "setBundle:", v23);

  }
  -[PXGEngine registerTextureProvider:forMediaKind:](self, "registerTextureProvider:forMediaKind:", v22, 1);

}

- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PXGEngine textureManager](self, "textureManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerTextureProvider:forMediaKind:", v6, v4);

}

- (void)setMediaProvider:(id)a3
{
  void *v5;
  PXMediaProvider *v6;

  v6 = (PXMediaProvider *)a3;
  if (self->_mediaProvider != v6)
  {
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXGEngine layout](self, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediaProvider:", v6);

  }
}

- (PXGEngine)initWithAnimator:(id)a3 renderers:(id)a4 displayLinkClass:(Class)a5 layoutQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXGEngine *v14;
  void *v15;
  uint64_t v16;
  PXDisplayLinkProtocol *displayLink;
  NSMutableSet *v18;
  NSMutableSet *interactions;
  NSMutableSet *v20;
  NSMutableSet *activeInteractions;
  NSMutableArray *v22;
  NSMutableArray *pendingContentLoadedNotificationBlocks;
  uint64_t v24;
  NSArray *renderers;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  PXGEngine *v32;
  id *p_drivingRenderer;
  uint64_t i;
  void *v35;
  void *v36;
  PXGTextureManager *v37;
  PXGTextureManager *textureManager;
  uint64_t v39;
  PXGSpriteDataStore *layoutSpriteDataStore;
  PXGChangeDetails *v41;
  PXGChangeDetails *layoutChangeDetails;
  uint64_t v43;
  PXGSpriteDataStore *animationPresentationSpriteDataStore;
  uint64_t v45;
  PXGSpriteDataStore *animationTargetSpriteDataStore;
  PXGAXCoalescingResponder *v47;
  PXGAXCoalescingResponder *coalescingAXResponder;
  void *v49;
  void *v50;
  id v52;
  id v53;
  id v54;
  id v55;
  NSArray *obj;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v62.receiver = self;
  v62.super_class = (Class)PXGEngine;
  v14 = -[PXGEngine init](&v62, sel_init);
  if (v14)
  {
    v52 = a3;
    v55 = v11;
    v53 = v13;
    v15 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B29D0), "initWithQueue:", v13);
    objc_storeStrong((id *)&v14->_entityManager, v15);
    v14->_displayLinkClass = a5;
    objc_storeStrong((id *)&v14->_layoutQueue, a6);
    -[PXGEngine _createDisplayLinkWithScreen:](v14, "_createDisplayLinkWithScreen:", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    displayLink = v14->_displayLink;
    v14->_displayLink = (PXDisplayLinkProtocol *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    interactions = v14->_interactions;
    v14->_interactions = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeInteractions = v14->_activeInteractions;
    v14->_activeInteractions = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingContentLoadedNotificationBlocks = v14->_pendingContentLoadedNotificationBlocks;
    v14->_pendingContentLoadedNotificationBlocks = v22;

    v14->_canBlockMainThreadIfNeeded = 1;
    v54 = v12;
    v24 = objc_msgSend(v12, "copy");
    renderers = v14->_renderers;
    v14->_renderers = (NSArray *)v24;

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v14->_renderers;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (!v26)
    {
      v32 = v14;
      v28 = 0;
      v30 = 0;
      v57 = 12;
      goto LABEL_23;
    }
    v27 = v26;
    LOBYTE(v28) = 0;
    v29 = 0;
    LOBYTE(v30) = 0;
    v31 = *(_QWORD *)v59;
    v32 = v14;
    p_drivingRenderer = (id *)&v14->_drivingRenderer;
    v57 = 12;
    while (1)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v59 != v31)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v35, "setDelegate:", v32, v52);
        objc_msgSend(v35, "setEntityManager:", v15);
        if (objc_msgSend(v35, "wantsToDriveRender") && !*p_drivingRenderer)
        {
          objc_storeStrong(p_drivingRenderer, v35);
          if ((v30 & 1) != 0)
          {
LABEL_10:
            v30 = 1;
            if ((v28 & 1) == 0)
              goto LABEL_11;
            goto LABEL_15;
          }
        }
        else if ((v30 & 1) != 0)
        {
          goto LABEL_10;
        }
        v30 = objc_msgSend(v35, "wantsBGRATextures");
        if ((v28 & 1) == 0)
        {
LABEL_11:
          v28 = objc_msgSend(v35, "wantsMipmaps");
          if (!v29)
            goto LABEL_12;
          goto LABEL_16;
        }
LABEL_15:
        v28 = 1;
        if (!v29)
        {
LABEL_12:
          v29 = objc_msgSend(v35, "presentationType") == 0;
          goto LABEL_17;
        }
LABEL_16:
        v29 = 1;
LABEL_17:
        if (objc_msgSend(v35, "destinationColorSpaceName"))
          v57 = objc_msgSend(v35, "destinationColorSpaceName");
      }
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (!v27)
      {
LABEL_23:

        objc_msgSend(off_1E50B5CD0, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        -[PXGEngine setLowMemoryMode:](v32, "setLowMemoryMode:", objc_msgSend(v36, "lowMemoryMode"));
        v13 = v53;
        v37 = -[PXGTextureManager initWithEntityManager:layoutQueue:]([PXGTextureManager alloc], "initWithEntityManager:layoutQueue:", v15, v53);
        textureManager = v32->_textureManager;
        v32->_textureManager = v37;

        -[PXGTextureManager setDelegate:](v32->_textureManager, "setDelegate:", v32);
        -[PXGTextureManager setPreferBGRA:](v32->_textureManager, "setPreferBGRA:", v30);
        -[PXGTextureManager setPreferMipmaps:](v32->_textureManager, "setPreferMipmaps:", v28);
        -[PXGTextureManager setPreferredColorSpaceName:](v32->_textureManager, "setPreferredColorSpaceName:", v57);
        v39 = objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
        layoutSpriteDataStore = v32->_layoutSpriteDataStore;
        v32->_layoutSpriteDataStore = (PXGSpriteDataStore *)v39;

        v41 = (PXGChangeDetails *)objc_alloc_init((Class)off_1E50B28A8);
        layoutChangeDetails = v32->_layoutChangeDetails;
        v32->_layoutChangeDetails = v41;

        objc_storeStrong((id *)&v32->_animator, v52);
        v43 = objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
        animationPresentationSpriteDataStore = v32->_animationPresentationSpriteDataStore;
        v32->_animationPresentationSpriteDataStore = (PXGSpriteDataStore *)v43;

        v45 = objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
        animationTargetSpriteDataStore = v32->_animationTargetSpriteDataStore;
        v32->_animationTargetSpriteDataStore = (PXGSpriteDataStore *)v45;

        v32->_stats = ($6AF0136504CCF97645EE7C74F8AB9C3B *)malloc_type_calloc(1uLL, 0xF0uLL, 0x100004019FCA701uLL);
        v32->_keepDisplayLinkAlive = 0;
        v47 = objc_alloc_init(PXGAXCoalescingResponder);
        coalescingAXResponder = v32->_coalescingAXResponder;
        v32->_coalescingAXResponder = v47;

        -[PXGEngine _propagateTextureConverters](v32, "_propagateTextureConverters");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObserver:selector:name:object:", v32, sel__extensionHostDidEnterBackground_, *MEMORY[0x1E0CB29F0], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObserver:selector:name:object:", v32, sel__extensionHostWillEnterForeground_, *MEMORY[0x1E0CB29F8], 0);

        v12 = v54;
        v11 = v55;
        break;
      }
    }
  }

  return v14;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_lowMemoryMode != a3)
  {
    v3 = a3;
    self->_lowMemoryMode = a3;
    v5 = -[PXGEngine lowMemoryMode](self, "lowMemoryMode");
    -[PXGEngine textureManager](self, "textureManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLowMemoryMode:", v5);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PXGEngine renderers](self, "renderers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setLowMemoryMode:", v3);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)setViewEnvironment:(id)a3
{
  PXGViewEnvironment *v5;
  void *pendingViewEnvironment;
  PXGViewEnvironment *v7;
  BOOL v8;
  PXGViewEnvironment *v9;
  void *v10;
  PXGViewEnvironment *v11;

  v11 = (PXGViewEnvironment *)a3;
  v5 = self->_viewEnvironment;
  pendingViewEnvironment = v11;
  if (v5 == v11)
    goto LABEL_7;
  v7 = v5;
  v8 = -[PXGViewEnvironment isEqual:](v5, "isEqual:");

  if (!v8 && !-[PXGViewEnvironment hasEqualAppearanceTo:](self->_viewEnvironment, "hasEqualAppearanceTo:", v11))
  {
    if (self->_isUpdatingRenderer)
    {
      v9 = v11;
      pendingViewEnvironment = self->_pendingViewEnvironment;
      self->_pendingViewEnvironment = v9;
    }
    else
    {
      objc_storeStrong((id *)&self->_viewEnvironment, a3);
      -[PXGEngine layout](self, "layout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setViewEnvironment:", v11);

      -[PXGEngine textureManager](self, "textureManager");
      pendingViewEnvironment = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(pendingViewEnvironment, "setViewEnvironment:", v11);
    }
LABEL_7:

  }
}

- (void)setVisible:(BOOL)a3
{
  id pendingIsInvisibleForSomeTimeBlock;
  id v6;
  void *v7;
  dispatch_block_t v8;
  id v9;
  void *v10;
  double v11;
  dispatch_time_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  if (self->_visible != a3)
  {
    self->_visible = a3;
    -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
    if (a3)
    {
      pendingIsInvisibleForSomeTimeBlock = self->_pendingIsInvisibleForSomeTimeBlock;
      if (pendingIsInvisibleForSomeTimeBlock)
      {
        dispatch_block_cancel(pendingIsInvisibleForSomeTimeBlock);
        v6 = self->_pendingIsInvisibleForSomeTimeBlock;
        self->_pendingIsInvisibleForSomeTimeBlock = 0;

      }
      -[PXGEngine setIsInvisibleForSomeTime:](self, "setIsInvisibleForSomeTime:", 0);
    }
    else
    {
      -[PXGEngine setDidDisappear:](self, "setDidDisappear:", 1);
      -[PXGEngine layout](self, "layout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAppearState:", 3);

      if (!self->_pendingIsInvisibleForSomeTimeBlock)
      {
        objc_initWeak(&location, self);
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __24__PXGEngine_setVisible___block_invoke;
        v17 = &unk_1E5148D30;
        objc_copyWeak(&v18, &location);
        v8 = dispatch_block_create((dispatch_block_flags_t)0, &v14);
        v9 = self->_pendingIsInvisibleForSomeTimeBlock;
        self->_pendingIsInvisibleForSomeTimeBlock = v8;

        objc_msgSend(off_1E50B5CD0, "sharedInstance", v14, v15, v16, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "inactivityTimeout");
        v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
        -[PXGEngine layoutQueue](self, "layoutQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_after(v12, v13, self->_pendingIsInvisibleForSomeTimeBlock);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      if (-[PXGEngine lowMemoryMode](self, "lowMemoryMode"))
        -[PXGEngine _releaseResources](self, "_releaseResources");
    }
  }
}

- (void)setIsInvisibleForSomeTime:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  uint64_t v6;
  void *v7;

  if (self->_isInvisibleForSomeTime != a3)
  {
    v4 = a3;
    self->_isInvisibleForSomeTime = a3;
    if (a3)
    {
      objc_msgSend(off_1E50B5CD0, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "shouldDeactivateTextureManagerWhenNotVisible");
    }
    else
    {
      v6 = 0;
    }
    -[PXGEngine textureManager](self, "textureManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsInactive:", v6);

    if (v4)
    {

      -[PXGEngine _updateInvisibleTextureManager](self, "_updateInvisibleTextureManager");
      -[PXGEngine _releaseResources](self, "_releaseResources");
    }
    else
    {
      -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 13);
    }
  }
}

- (void)setScrollViewSpeedometer:(id)a3
{
  PXScrollViewSpeedometer *v5;
  PXScrollViewSpeedometer *scrollViewSpeedometer;
  PXScrollViewSpeedometer *v7;

  v5 = (PXScrollViewSpeedometer *)a3;
  scrollViewSpeedometer = self->_scrollViewSpeedometer;
  if (scrollViewSpeedometer != v5)
  {
    v7 = v5;
    -[PXScrollViewSpeedometer unregisterChangeObserver:context:](scrollViewSpeedometer, "unregisterChangeObserver:context:", self, speedometerObservationContext);
    objc_storeStrong((id *)&self->_scrollViewSpeedometer, a3);
    -[PXScrollViewSpeedometer registerChangeObserver:context:](self->_scrollViewSpeedometer, "registerChangeObserver:context:", self, speedometerObservationContext);
    v5 = v7;
  }

}

- (void)setScrollViewController:(id)a3
{
  PXScrollViewController *v5;
  _QWORD v6[4];
  PXScrollViewController *v7;

  v5 = (PXScrollViewController *)a3;
  if (self->_scrollViewController != v5)
  {
    objc_storeStrong((id *)&self->_scrollViewController, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__PXGEngine_setScrollViewController___block_invoke;
    v6[3] = &unk_1E5137228;
    v7 = v5;
    -[PXGEngine _enumerateRenderers:](self, "_enumerateRenderers:", v6);

  }
}

- (void)setLayout:(id)a3
{
  PXGLayout *v5;
  PXGLayout *layout;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXGLayout *v18;

  v5 = (PXGLayout *)a3;
  layout = self->_layout;
  v18 = v5;
  if (layout != v5)
  {
    -[PXGLayout setUpdateDelegate:](layout, "setUpdateDelegate:", 0);
    -[PXGLayout setEntityManager:](self->_layout, "setEntityManager:", 0);
    -[PXGLayout changeDetails](self->_layout, "changeDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    objc_storeStrong((id *)&self->_layout, a3);
    -[PXGLayout setUpdateDelegate:](self->_layout, "setUpdateDelegate:", self);
    -[PXGEngine entityManager](self, "entityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setEntityManager:](self->_layout, "setEntityManager:", v8);

    -[PXGEngine coalescingAXResponder](self, "coalescingAXResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setAxNextResponder:](self->_layout, "setAxNextResponder:", v9);

    -[PXGLayout changeDetails](self->_layout, "changeDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    -[PXGLayout changeDetails](self->_layout, "changeDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, -[PXGSpriteDataStore count](self->_layoutSpriteDataStore, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    -[PXGLayout changeDetails](self->_layout, "changeDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, -[PXGLayout numberOfSprites](self->_layout, "numberOfSprites"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    -[PXGEngine setIsInitialLoad:](self, "setIsInitialLoad:", 1);
    -[PXGEngine layoutQueue](self, "layoutQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setLayoutQueue:](v18, "setLayoutQueue:", v15);

    -[PXGEngine viewEnvironment](self, "viewEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setViewEnvironment:](v18, "setViewEnvironment:", v16);

    -[PXGEngine mediaProvider](self, "mediaProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setMediaProvider:](v18, "setMediaProvider:", v17);

    -[PXGEngine _updateLayoutInteractions](self, "_updateLayoutInteractions");
    -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 15);
  }

}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (void)setInteractionView:(id)a3
{
  objc_storeWeak((id *)&self->_interactionView, a3);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = objc_opt_respondsToSelector();
    v5 = obj;
    self->_delegateRespondsTo.updateDebugHUDWithStats = v6 & 1;
    if (self->_updateFlags.needsUpdate)
    {
      -[PXGEngine __setNeedsUpdate](self, "__setNeedsUpdate");
      v5 = obj;
    }
  }

}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

uint64_t __26__PXGEngine__updateLayout__block_invoke_2()
{
  return kdebug_trace();
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3
{
  -[PXGEngine registerAllTextureProvidersWithMediaProvider:namedImagesBundle:](self, "registerAllTextureProvidersWithMediaProvider:namedImagesBundle:", a3, 0);
}

- (PXGEngine)initWithPixelBufferDestination:(id)a3 layoutQueue:(id)a4 displayLinkClass:(Class)a5
{
  id v9;
  id v10;
  id v11;
  PXGMetalRenderer *v12;
  PXGAnimator *v13;
  void *v14;
  PXGEngine *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  __int128 v28;
  CGSize v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "layoutQueue");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEngine.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pixelBufferDestination.layoutQueue == layoutQueue"));

  }
  v12 = -[PXGMetalRenderer initWithRenderDestination:layoutQueue:]([PXGMetalRenderer alloc], "initWithRenderDestination:layoutQueue:", v9, v10);
  v13 = objc_alloc_init(PXGAnimator);
  v36[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXGEngine initWithAnimator:renderers:displayLinkClass:layoutQueue:](self, "initWithAnimator:renderers:displayLinkClass:layoutQueue:", v13, v14, a5, v10);

  if (v15)
  {
    objc_msgSend(v9, "renderBoundsInPoints");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v9, "renderBoundsInPoints");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v9, "renderBoundsInPoints");
    v15->_scrollState.referenceSize.width = v17;
    v15->_scrollState.referenceSize.height = v19;
    v28 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&v15->_scrollState.contentInsets.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v15->_scrollState.contentInsets.bottom = v28;
    v15->_scrollState.visibleRect.origin.x = v21;
    v15->_scrollState.visibleRect.origin.y = v23;
    v15->_scrollState.visibleRect.size.width = v25;
    v15->_scrollState.visibleRect.size.height = v27;
    v29 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v15->_scrollState.targetRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v15->_scrollState.targetRect.size = v29;
    v15->_scrollState.constrainedVisibleRect.origin.x = v30;
    v15->_scrollState.constrainedVisibleRect.origin.y = v31;
    v15->_scrollState.constrainedVisibleRect.size.width = v32;
    v15->_scrollState.constrainedVisibleRect.size.height = v33;
    v15->_scrollState.lastScrollDirection = (CGPoint)*MEMORY[0x1E0C9D538];
    v15->_scrollState.scrollSpeedRegime = 0;
  }

  return v15;
}

- (PXGEngine)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEngine.m"), 365, CFSTR("%s is not available as initializer"), "-[PXGEngine init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_stats);
  -[PXDisplayLinkProtocol invalidate](self->_displayLink, "invalidate");
  -[PXGSpriteDataStore recycle](self->_layoutSpriteDataStore, "recycle");
  -[PXGSpriteDataStore recycle](self->_animationPresentationSpriteDataStore, "recycle");
  -[PXGSpriteDataStore recycle](self->_animationTargetSpriteDataStore, "recycle");
  v3.receiver = self;
  v3.super_class = (Class)PXGEngine;
  -[PXGEngine dealloc](&v3, sel_dealloc);
}

- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  PXGSpriteDataStore *layoutSpriteDataStore;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXGEngine ensureUpdatedLayout](self, "ensureUpdatedLayout");
  -[PXGEngine layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changeDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "layout has unprocessed changes, sprite enumeration is currently undefined", buf, 2u);
    }

  }
  else
  {
    layoutSpriteDataStore = self->_layoutSpriteDataStore;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__PXGEngine_enumerateSpritesInRect_usingBlock___block_invoke;
    v15[3] = &unk_1E5137138;
    v16 = v9;
    -[PXGSpriteDataStore enumerateSpritesInRect:usingBlock:](layoutSpriteDataStore, "enumerateSpritesInRect:usingBlock:", v15, x, y, width, height);

  }
}

- (BOOL)copyPresentedSpriteFor:(id)a3 geometry:(id *)a4 style:(id *)a5 info:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  PXGSpriteDataStore *layoutSpriteDataStore;
  _QWORD v19[7];
  uint8_t buf[16];

  v10 = a3;
  -[PXGEngine ensureUpdatedLayout](self, "ensureUpdatedLayout");
  -[PXGEngine layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "layout has unprocessed changes, sprite enumeration is currently undefined", buf, 2u);
    }

  }
  -[PXGEngine layout](self, "layout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "spriteIndexForSpriteReference:options:", v10, 0);

  if (v16 != -1)
  {
    layoutSpriteDataStore = self->_layoutSpriteDataStore;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__PXGEngine_copyPresentedSpriteFor_geometry_style_info___block_invoke;
    v19[3] = &__block_descriptor_56_e34_v52__0I8____________________12_B44l;
    v19[4] = a4;
    v19[5] = a5;
    v19[6] = a6;
    -[PXGSpriteDataStore enumerateSpritesInRange:usingBlock:](layoutSpriteDataStore, "enumerateSpritesInRange:usingBlock:", v16 | 0x100000000, v19);
  }
  return v16 != -1;
}

- (void)handleScreensDidWakeNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PXGEngine_handleScreensDidWakeNotification___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXGEngine _performOnLayoutQueue:](self, "_performOnLayoutQueue:", v3);
}

- (void)_extensionHostDidEnterBackground:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PXGEngine__extensionHostDidEnterBackground___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXGEngine _performOnLayoutQueue:](self, "_performOnLayoutQueue:", v3);
}

- (void)_extensionHostWillEnterForeground:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PXGEngine__extensionHostWillEnterForeground___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXGEngine _performOnLayoutQueue:](self, "_performOnLayoutQueue:", v3);
}

- (void)_windowSceneDidBeginLiveResize:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PXGEngine__windowSceneDidBeginLiveResize___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXGEngine _performOnLayoutQueue:](self, "_performOnLayoutQueue:", v3);
}

- (void)_windowSceneDidEndLiveResize:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PXGEngine__windowSceneDidEndLiveResize___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXGEngine _performOnLayoutQueue:](self, "_performOnLayoutQueue:", v3);
}

- (BOOL)lowMemoryMode
{
  void *v3;
  char v4;

  if (self->_lowMemoryMode)
    return 1;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lowMemoryMode");

  return v4;
}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  if (self->_allowLargerImagesDuringScrollingInLowMemoryMode != a3)
  {
    self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
    v4 = -[PXGEngine allowLargerImagesDuringScrollingInLowMemoryMode](self, "allowLargerImagesDuringScrollingInLowMemoryMode");
    -[PXGEngine textureManager](self, "textureManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowLargerImagesDuringScrollingInLowMemoryMode:", v4);

  }
}

- (void)setDisableMetalViewDisplayCompositing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_disableMetalViewDisplayCompositing != a3)
  {
    v3 = a3;
    self->_disableMetalViewDisplayCompositing = a3;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PXGEngine renderers](self, "renderers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v8);
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;

          objc_msgSend(v10, "renderDestination");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = v11;
            if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v12;

              objc_msgSend(v13, "setDisableDisplayCompositing:", v3);
            }
            else
            {

              v13 = 0;
            }

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
}

- (void)setIsSuspended:(BOOL)a3
{
  if (self->_isSuspended != a3)
  {
    self->_isSuspended = a3;
    if (!a3)
      -[PXGEngine __setNeedsUpdate](self, "__setNeedsUpdate");
  }
}

- (void)_hasBeenInvisibleForSomeTime
{
  if (!-[PXGEngine isVisible](self, "isVisible"))
    -[PXGEngine setIsInvisibleForSomeTime:](self, "setIsInvisibleForSomeTime:", 1);
}

- (void)_updateInvisibleTextureManager
{
  -[PXGEngine _updateInteractionState](self, "_updateInteractionState");
  -[PXGEngine _updateTextureManager](self, "_updateTextureManager");
  -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 4);
}

- (void)_releaseResources
{
  NSObject *v3;
  int v4;
  PXGEngine *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PXGTungstenGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%@ releasing resources", (uint8_t *)&v4, 0xCu);
  }

  -[PXGEngine _enumerateRenderers:](self, "_enumerateRenderers:", &__block_literal_global_214434);
}

- (void)setScreen:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  PXDisplayLinkProtocol *v7;
  PXDisplayLinkProtocol *displayLink;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_screen, obj);
    v5 = obj;
    if (obj)
    {
      v6 = -[objc_class supportsSpecificScreen](self->_displayLinkClass, "supportsSpecificScreen");
      v5 = obj;
      if (v6)
      {
        -[PXDisplayLinkProtocol invalidate](self->_displayLink, "invalidate");
        -[PXGEngine _createDisplayLinkWithScreen:](self, "_createDisplayLinkWithScreen:", obj);
        v7 = (PXDisplayLinkProtocol *)objc_claimAutoreleasedReturnValue();
        displayLink = self->_displayLink;
        self->_displayLink = v7;

        -[PXGEngine _updateDisplayLink](self, "_updateDisplayLink");
        v5 = obj;
      }
    }
  }

}

- (void)test_installRenderSnapshotHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PXGEngine_test_installRenderSnapshotHandler___block_invoke;
  v6[3] = &unk_1E51371C0;
  v7 = v4;
  v5 = v4;
  -[PXGEngine _enumerateRenderers:](self, "_enumerateRenderers:", v6);
  -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 8);

}

- (int64_t)currentFrameTime
{
  void *v2;
  double v3;
  int64_t v4;

  -[PXGEngine displayLink](self, "displayLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetTimestamp");
  v4 = llround(v3 * 1000.0);

  return v4;
}

- (PXGAnimator)ppt_animator
{
  return self->_animator;
}

- (void)notifyContentFullyLoadedWithTimeout:(double)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v6 = a4;
  -[PXGEngine pendingContentLoadedNotificationBlocks](self, "pendingContentLoadedNotificationBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _Block_copy(v6);
  objc_msgSend(v7, "addObject:", v8);

  -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 5);
  objc_initWeak(&location, self);
  v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  -[PXGEngine layoutQueue](self, "layoutQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PXGEngine_notifyContentFullyLoadedWithTimeout_block___block_invoke;
  block[3] = &unk_1E5146480;
  objc_copyWeak(&v14, &location);
  v13 = v6;
  v11 = v6;
  dispatch_after(v9, v10, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_handleTimeoutForNotificationBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id aBlock;

  aBlock = a3;
  -[PXGEngine pendingContentLoadedNotificationBlocks](self, "pendingContentLoadedNotificationBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _Block_copy(aBlock);
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXGEngine pendingContentLoadedNotificationBlocks](self, "pendingContentLoadedNotificationBlocks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", v6);

    (*((void (**)(id, _QWORD))aBlock + 2))(aBlock, 0);
  }

}

- (void)setMissedScrollEventThisFrame:(BOOL)a3
{
  if (self->_missedScrollEventThisFrame != a3)
  {
    self->_missedScrollEventThisFrame = a3;
    kdebug_trace();
  }
}

- (void)_recursiveUpdateDetected
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[PXGEngine recursiveUpdateRescheduled](self, "recursiveUpdateRescheduled"))
  {
    -[PXGEngine setRecursiveUpdateRescheduled:](self, "setRecursiveUpdateRescheduled:", 1);
    objc_initWeak(&location, self);
    -[PXGEngine layoutQueue](self, "layoutQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__PXGEngine__recursiveUpdateDetected__block_invoke;
    v4[3] = &unk_1E5148D30;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_handleRescheduledRecursiveUpdate
{
  -[PXGEngine setRecursiveUpdateRescheduled:](self, "setRecursiveUpdateRescheduled:", 0);
  -[PXGEngine _forceInvalidate:](self, "_forceInvalidate:", 15);
}

- (void)allowSecondRenderThisFrame
{
  -[PXGEngine setDidRenderThisFrame:](self, "setDidRenderThisFrame:", 0);
}

- (void)ensureUpdatedLayout
{
  void *v3;
  void *v4;
  unint64_t pendingUpdateEntities;

  if (!self->_updateFlags.isPerformingUpdate)
  {
    -[PXGEngine layout](self, "layout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "changeDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {

    }
    else
    {
      pendingUpdateEntities = self->_pendingUpdateEntities;

      if ((pendingUpdateEntities & 1) == 0)
      {
LABEL_6:
        -[PXGEngine _updateIfNeededWithReason:](self, "_updateIfNeededWithReason:", CFSTR("ensureUpdatedLayout"));
        return;
      }
    }
    -[PXGEngine _forceInvalidate:](self, "_forceInvalidate:", 1);
    goto LABEL_6;
  }
}

- (void)updateIfNeeded
{
  -[PXGEngine _updateIfNeededWithReason:](self, "_updateIfNeededWithReason:", CFSTR("Client Manual Update"));
}

- (id)_createDisplayLinkWithScreen:(id)a3
{
  objc_class *displayLinkClass;
  id v5;
  void *v6;

  displayLinkClass = self->_displayLinkClass;
  v5 = a3;
  v6 = (void *)objc_msgSend([displayLinkClass alloc], "initWithWeakTarget:selector:screen:queue:", self, sel_handleDisplayLink_, v5, self->_layoutQueue);

  return v6;
}

- (void)_performOnLayoutQueue:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_block_t block;

  block = a3;
  -[PXGEngine layoutQueue](self, "layoutQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C80D38];

  if (v4 == v5)
  {
    px_dispatch_on_main_queue();
  }
  else
  {
    -[PXGEngine layoutQueue](self, "layoutQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, block);

  }
}

- (id)_rendererForPresentationType:(unsigned __int8)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXGEngine renderers](self, "renderers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "presentationType") == v3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_mergeTexturesByPresentationType:(id)a3 withOverlayTexturesByPresentationType:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    do
    {
      v10 = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      if (v12 | v14)
      {
        v15 = (id)v12;
        v16 = v15;
        if (v14)
        {
          if (v12)
          {
            objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v14);
            v17 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v17;
          }
          else
          {
            v16 = (id)v14;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v16, v18);

      }
      ++v9;
    }
    while (v10 < 2);

  }
  return v8;
}

- (void)setScrollController:(id)a3
{
  PXScrollController *v5;
  PXScrollController *v6;
  uint64_t v7;
  void *v8;
  PXGEngine *v9;
  NSObject *v10;
  __int16 v11[8];

  v5 = (PXScrollController *)a3;
  v6 = v5;
  if (self->_scrollController != v5)
  {
    -[PXScrollController updateDelegate](v5, "updateDelegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[PXScrollController updateDelegate](self->_scrollController, "updateDelegate");
      v9 = (PXGEngine *)objc_claimAutoreleasedReturnValue();

      if (v9 != self)
      {
        PXAssertGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11[0] = 0;
          _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "unexpected updateDelegate", (uint8_t *)v11, 2u);
        }

      }
    }
    -[PXScrollController setUpdateDelegate:](self->_scrollController, "setUpdateDelegate:", 0);
    objc_storeStrong((id *)&self->_scrollController, a3);
    -[PXScrollController setUpdateDelegate:](self->_scrollController, "setUpdateDelegate:", self);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PXGEngine setScrollViewController:](self, "setScrollViewController:", v6);
    -[PXGEngine _updateScrollStateWithReason:](self, "_updateScrollStateWithReason:", 0);
  }

}

- (void)layoutNeedsRenderUpdate:(id)a3
{
  -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 8);
}

- (id)textureManager:(id)a3 requestRenderSnapshot:(id *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v9[2];
  CGFloat height;

  -[PXGEngine _rendererForPresentationType:](self, "_rendererForPresentationType:", a4->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->var1.origin.y;
  v9[0] = *(_OWORD *)&a4->var0;
  v9[1] = v6;
  height = a4->var1.size.height;
  objc_msgSend(v5, "renderSnapshotForRequest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)px_scrollControllerDidUpdate:(id)a3
{
  -[PXGEngine _updateScrollStateWithReason:](self, "_updateScrollStateWithReason:", 2);
  -[PXGEngine _updateIfNeededWithReason:](self, "_updateIfNeededWithReason:", CFSTR("px_scrollControllerDidUpdate"));
}

- (void)px_scrollControllerDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_isUpdatingScrollView)
  {
    v5 = v4;
    if (self->_isInitialLoad || self->_didDisappear || self->_didChangeWindow)
    {
      -[PXGEngine _updateScrollStateWithReason:](self, "_updateScrollStateWithReason:", 5);
    }
    else
    {
      -[PXGEngine _updateScrollStateWithReason:](self, "_updateScrollStateWithReason:", 4);
      -[PXGEngine _updateIfNeededWithReason:](self, "_updateIfNeededWithReason:", CFSTR("px_scrollControllerDidScroll"));
    }
    v4 = v5;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)speedometerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEngine.m"), 1720, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 2) != 0)
  {
    v11 = v9;
    if (self->_isUpdatingScrollView)
      -[PXGEngine _deferredInvalidate:](self, "_deferredInvalidate:", 5);
    else
      -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 5);
    v9 = v11;
  }

}

- (id)startRecordingToDirectoryURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  PXGTungstenEngineRecordingSession *v9;
  PXGTungstenEngineRecordingSession *recordingSession;
  void *v11;

  v4 = a3;
  -[PXGEngine recordingSession](self, "recordingSession");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PXGEngine recordingSession](self, "recordingSession"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isStopped"),
        v7,
        v6,
        !v8))
  {
    v11 = 0;
  }
  else
  {
    v9 = -[PXGTungstenEngineRecordingSession initWithEngine:directoryURL:]([PXGTungstenEngineRecordingSession alloc], "initWithEngine:directoryURL:", self, v4);
    recordingSession = self->_recordingSession;
    self->_recordingSession = v9;

    -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:", 8);
    -[PXGEngine recordingSession](self, "recordingSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)debugEngineUpdates
{
  return 0;
}

- (void)setSlowAnimationsEnabled:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  if (self->_slowAnimationsEnabled != a3)
  {
    self->_slowAnimationsEnabled = a3;
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "slowAnimationsSpeed");
    v6 = v5;

    v7 = 1.0;
    if (self->_slowAnimationsEnabled)
      v7 = v6;
    -[PXGAnimator setSpeed:](self->_animator, "setSpeed:", v7);
  }
}

- (PXScrollController)scrollController
{
  return self->_scrollController;
}

- (void)setRenderingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setAnimationRenderingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void)setIsExporting:(BOOL)a3
{
  self->_isExporting = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (BOOL)scrollStateIncludesScrollEvent
{
  return self->_scrollStateIncludesScrollEvent;
}

- (void)setScrollStateIncludesScrollEvent:(BOOL)a3
{
  self->_scrollStateIncludesScrollEvent = a3;
}

- (void)setLastScrollEventTime:(double)a3
{
  self->_lastScrollEventTime = a3;
}

- (BOOL)isInvisibleForSomeTime
{
  return self->_isInvisibleForSomeTime;
}

- (PXGTungstenEngineRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (void)setRecordingSession:(id)a3
{
  objc_storeStrong((id *)&self->_recordingSession, a3);
}

- (BOOL)recursiveUpdateRescheduled
{
  return self->_recursiveUpdateRescheduled;
}

- (void)setRecursiveUpdateRescheduled:(BOOL)a3
{
  self->_recursiveUpdateRescheduled = a3;
}

- (PXGOverlayTextureManager)overlayTextureManager
{
  return self->_overlayTextureManager;
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (void)setStatsTrackingEnabled:(BOOL)a3
{
  self->_statsTrackingEnabled = a3;
}

- (BOOL)slowAnimationsEnabled
{
  return self->_slowAnimationsEnabled;
}

- (void)setWantsImmediateUpdates:(BOOL)a3
{
  self->_wantsImmediateUpdates = a3;
}

- (BOOL)disableMetalViewDisplayCompositing
{
  return self->_disableMetalViewDisplayCompositing;
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (BOOL)canBlockMainThreadIfNeeded
{
  return self->_canBlockMainThreadIfNeeded;
}

- (void)setCanBlockMainThreadIfNeeded:(BOOL)a3
{
  self->_canBlockMainThreadIfNeeded = a3;
}

- (BOOL)didChangeWindow
{
  return self->_didChangeWindow;
}

- (void)setDidChangeWindow:(BOOL)a3
{
  self->_didChangeWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_coalescingAXResponder, 0);
  objc_destroyWeak((id *)&self->_interactionView);
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_renderers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overlayTextureManager, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_pendingContentLoadedNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_activeInteractions, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_drivingRenderer, 0);
  objc_storeStrong(&self->_animationRenderingCompletionHandler, 0);
  objc_storeStrong(&self->_renderingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_textureManager, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_scrollViewSpeedometer, 0);
  objc_storeStrong((id *)&self->_scrollController, 0);
  objc_storeStrong((id *)&self->_pendingViewEnvironment, 0);
  objc_storeStrong(&self->_pendingIsInvisibleForSomeTimeBlock, 0);
  objc_storeStrong((id *)&self->_presentationSpriteMetadaStore, 0);
  objc_storeStrong((id *)&self->_animationChangeDetails, 0);
  objc_storeStrong((id *)&self->_animationLayout, 0);
  objc_storeStrong((id *)&self->_animationTargetSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_animationPresentationSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_layoutChangeDetails, 0);
  objc_storeStrong((id *)&self->_layoutSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

uint64_t __26__PXGEngine__updateLayout__block_invoke()
{
  return kdebug_trace();
}

uint64_t __26__PXGEngine__updateLayout__block_invoke_3()
{
  return kdebug_trace();
}

void __37__PXGEngine__recursiveUpdateDetected__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRescheduledRecursiveUpdate");

}

uint64_t __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke(uint64_t result, uint64_t a2, unsigned int **a3, _BYTE *a4)
{
  if (*(unsigned __int8 *)(*(_QWORD *)(result + 40) + **a3) - 1 <= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_35_214428);
}

uint64_t __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, 1);
}

void __55__PXGEngine_notifyContentFullyLoadedWithTimeout_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleTimeoutForNotificationBlock:", *(_QWORD *)(a1 + 32));

}

void __47__PXGEngine_test_installRenderSnapshotHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setTest_renderSnapshotHandler:", *(_QWORD *)(a1 + 32));

}

uint64_t __30__PXGEngine__releaseResources__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "releaseResources");
}

void __24__PXGEngine_setVisible___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hasBeenInvisibleForSomeTime");

}

uint64_t __42__PXGEngine__windowSceneDidEndLiveResize___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 265) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateOrDefer:", 13);
}

uint64_t __44__PXGEngine__windowSceneDidBeginLiveResize___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 265) = 1;
  return result;
}

void __47__PXGEngine__extensionHostWillEnterForeground___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = 0;
  PXGTungstenGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%@ _extensionHostWillEnterForeground", (uint8_t *)&v4, 0xCu);
  }

}

void __46__PXGEngine__extensionHostDidEnterBackground___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = 1;
  PXGTungstenGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%@ _extensionHostDidEnterBackground", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __46__PXGEngine_handleScreensDidWakeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayLink");
}

__n128 __56__PXGEngine_copyPresentedSpriteFor_geometry_style_info___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  _OWORD *v3;
  _OWORD *v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __n128 result;
  __int128 v18;

  v3 = (_OWORD *)a1[4];
  v4 = (_OWORD *)a3[1];
  v5 = v4[1];
  *v3 = *v4;
  v3[1] = v5;
  v6 = (_OWORD *)a1[5];
  v7 = (_OWORD *)a3[2];
  v8 = v7[5];
  v10 = v7[2];
  v9 = v7[3];
  v6[4] = v7[4];
  v6[5] = v8;
  v6[2] = v10;
  v6[3] = v9;
  v11 = v7[9];
  v13 = v7[6];
  v12 = v7[7];
  v6[8] = v7[8];
  v6[9] = v11;
  v6[6] = v13;
  v6[7] = v12;
  v14 = v7[1];
  *v6 = *v7;
  v6[1] = v14;
  v15 = a1[6];
  v16 = a3[3];
  result = *(__n128 *)v16;
  v18 = *(_OWORD *)(v16 + 16);
  *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
  *(__n128 *)v15 = result;
  *(_OWORD *)(v15 + 16) = v18;
  return result;
}

uint64_t __47__PXGEngine_enumerateSpritesInRect_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
