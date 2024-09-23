@implementation PUImageAnalysisInteraction

- (PUImageAnalysisInteraction)init
{
  return -[PUImageAnalysisInteraction initWithInteractionCreator:](self, "initWithInteractionCreator:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXVKImageAnalysisInteraction view](self->_interaction, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeInteraction:", self->_interaction);

  v4.receiver = self;
  v4.super_class = (Class)PUImageAnalysisInteraction;
  -[PUImageAnalysisInteraction dealloc](&v4, sel_dealloc);
}

- (PUImageAnalysisInteraction)initWithInteractionCreator:(id)a3
{
  id v4;
  PUImageAnalysisInteraction *v5;
  uint64_t v6;
  PXUpdater *updater;
  const void *v8;
  void *v9;
  id interactionCreator;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUImageAnalysisInteraction;
  v5 = -[PUImageAnalysisInteraction init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:needsUpdateSelector:", v5, sel__scheduleUpdate);
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v6;

    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateInteraction);
    if (v4)
      v8 = v4;
    else
      v8 = &__block_literal_global_47449;
    v9 = _Block_copy(v8);
    interactionCreator = v5->_interactionCreator;
    v5->_interactionCreator = v9;

    -[PUImageAnalysisInteraction _resetInteraction](v5, "_resetInteraction");
  }

  return v5;
}

- (void)setAssetViewModel:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assetViewModel);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_assetViewModel);
    objc_msgSend(v5, "unregisterChangeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_assetViewModel, obj);
    objc_msgSend(obj, "registerChangeObserver:", self);

    -[PUImageAnalysisInteraction _updateContentsRect](self, "_updateContentsRect");
    -[PUImageAnalysisInteraction _invalidateInteraction](self, "_invalidateInteraction");
  }

}

- (void)setBrowsingViewModel:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browsingViewModel);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_browsingViewModel);
    objc_msgSend(v5, "unregisterChangeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_browsingViewModel, obj);
    objc_msgSend(obj, "registerChangeObserver:", self);

    -[PUImageAnalysisInteraction _invalidateInteraction](self, "_invalidateInteraction");
  }

}

- (BOOL)isImageSubjectAnalyzingFinished
{
  void *v2;
  char v3;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubjectAnalysisComplete");

  return v3;
}

- (BOOL)visualSearchExistsAtLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[PUImageAnalysisInteraction visualImageInteractionEnabled](self, "visualImageInteractionEnabled")
    && (-[PUImageAnalysisInteraction interaction](self, "interaction"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "activeInteractionTypes"),
        v5,
        (v6 & 4) != 0))
  {
    -[PUImageAnalysisInteraction interaction](self, "interaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageAnalysisInteraction interaction](self, "interaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v10);
    v7 = objc_msgSend(v8, "visualSearchExistsAtPoint:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    self->_contentsRect.origin.x = x;
    self->_contentsRect.origin.y = y;
    self->_contentsRect.size.width = width;
    self->_contentsRect.size.height = height;
    -[PUImageAnalysisInteraction interaction](self, "interaction");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateContentsRect");

  }
}

- (PXEventCoalescer)sizeChangeCoalescer
{
  PXEventCoalescer *sizeChangeCoalescer;
  void *v4;
  PXEventCoalescer *v5;
  PXEventCoalescer *v6;

  sizeChangeCoalescer = self->_sizeChangeCoalescer;
  if (!sizeChangeCoalescer)
  {
    v4 = (void *)MEMORY[0x1E0D7CCF0];
    objc_msgSend((id)objc_opt_class(), "interactionResetInterval");
    objc_msgSend(v4, "delayedCoalescerWithDelay:");
    v5 = (PXEventCoalescer *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sizeChangeCoalescer;
    self->_sizeChangeCoalescer = v5;

    -[PXEventCoalescer registerObserver:](self->_sizeChangeCoalescer, "registerObserver:", self);
    sizeChangeCoalescer = self->_sizeChangeCoalescer;
  }
  return sizeChangeCoalescer;
}

- (void)_resetInteraction
{
  PXVKImageAnalysisInteraction *interaction;
  void (**v4)(void);
  PXVKImageAnalysisInteraction *v5;
  PXVKImageAnalysisInteraction *v6;
  void *v7;

  -[PUImageAnalysisInteraction setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:](self, "setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:", 0);
  interaction = self->_interaction;
  if (interaction)
  {
    -[PXVKImageAnalysisInteraction setAnalysis:](interaction, "setAnalysis:", 0);
    -[PXVKImageAnalysisInteraction setActiveInteractionTypes:](self->_interaction, "setActiveInteractionTypes:", 0);
    -[PXVKImageAnalysisInteraction set_photosImageForRemoveBackground:](self->_interaction, "set_photosImageForRemoveBackground:", 0);
  }
  else
  {
    -[PUImageAnalysisInteraction interactionCreator](self, "interactionCreator");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (PXVKImageAnalysisInteraction *)objc_claimAutoreleasedReturnValue();
    v6 = self->_interaction;
    self->_interaction = v5;

  }
  -[PXVKImageAnalysisInteraction setDelegate:](self->_interaction, "setDelegate:", self);
  -[PUImageAnalysisInteraction sizeChangeCoalescer](self, "sizeChangeCoalescer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputEvent");

  -[PUImageAnalysisInteraction _updateInteractionView](self, "_updateInteractionView");
  -[PUImageAnalysisInteraction _invalidateInteraction](self, "_invalidateInteraction");
}

- (void)_scheduleUpdate
{
  px_perform_on_main_runloop();
}

- (void)_invalidateInteraction
{
  id v2;

  -[PUImageAnalysisInteraction updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInteraction);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[PUImageAnalysisInteraction _handleAssetViewModelChange:](self, "_handleAssetViewModelChange:", v6);
  }
  else
  {
    -[PUImageAnalysisInteraction browsingViewModel](self, "browsingViewModel");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[PUImageAnalysisInteraction _handleBrowsingViewModelChange:](self, "_handleBrowsingViewModelChange:", v6);
  }

}

- (void)_handleAssetViewModelChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "accessoryViewVisibilityFractionChanged") & 1) != 0
    || (objc_msgSend(v5, "modelTileTransformChanged") & 1) != 0
    || objc_msgSend(v5, "isUserTransformingTileDidChange"))
  {
    -[PUImageAnalysisInteraction sizeChangeCoalescer](self, "sizeChangeCoalescer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputEvent");

  }
  if (objc_msgSend(v5, "visualImageAnalysisChanged"))
  {
    if (-[PUImageAnalysisInteraction isDrivingLivePhotoPlayback](self, "isDrivingLivePhotoPlayback"))
    {
      -[PUImageAnalysisInteraction setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:](self, "setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:", 1);
      goto LABEL_13;
    }
LABEL_12:
    -[PUImageAnalysisInteraction _invalidateInteraction](self, "_invalidateInteraction");
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "bestImageChanged") & 1) != 0
    || (objc_msgSend(v5, "isFullyInFocusChanged") & 1) != 0
    || (objc_msgSend(v5, "accessoryViewVisibilityFractionChanged") & 1) != 0
    || objc_msgSend(v5, "isBeingDismissedChanged"))
  {
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "mainImageContentsRectChanged"))
    -[PUImageAnalysisInteraction _updateContentsRect](self, "_updateContentsRect");
LABEL_13:

}

- (void)_updateContentsRect
{
  id v3;

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainImageContentsRect");
  -[PUImageAnalysisInteraction setContentsRect:](self, "setContentsRect:");

}

- (void)_handleBrowsingViewModelChange:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "chromeVisibilityDidChange") & 1) != 0
    || objc_msgSend(v4, "isInteractingWithVideoScrubberDidChange"))
  {
    -[PUImageAnalysisInteraction _invalidateInteraction](self, "_invalidateInteraction");
  }

}

- (void)setHostView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_hostView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_hostView, a3);
    -[PUImageAnalysisInteraction _resetInteraction](self, "_resetInteraction");
    v5 = v6;
  }

}

- (void)_updateInteractionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    -[PUImageAnalysisInteraction hostView](self, "hostView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
    {
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeInteraction:", v7);

      objc_msgSend(v4, "addInteraction:", v7);
    }

    v3 = v7;
  }

}

- (void)_updateInteraction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_49;
  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction browsingViewModel](self, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFullyInFocus"))
    v7 = objc_msgSend(v4, "isBeingDismissed") ^ 1;
  else
    v7 = 0;
  objc_msgSend(v3, "analysis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualImageAnalysis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    objc_msgSend(v4, "visualImageAnalysis");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnalysis:", v10);

  }
  v26 = v6;
  if (v7)
  {
    objc_msgSend(v4, "bestImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textsToHighlightForImageAnalysisInteraction:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isChromeVisible"))
    {
      -[PUImageAnalysisInteraction sizeChangeCoalescer](self, "sizeChangeCoalescer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasPendingEvent") && (objc_msgSend(v3, "hasActiveTextSelection") & 1) == 0)
        v14 = objc_msgSend(v3, "highlightSelectableItems");
      else
        v14 = 1;

    }
    else if ((objc_msgSend(v3, "hasActiveTextSelection") & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v14 = objc_msgSend(v3, "highlightSelectableItems");
    }
    v16 = -[PUImageAnalysisInteraction _allowsSubjectLifting](self, "_allowsSubjectLifting", v5);
    -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessoryViewVisibilityFraction");
    v18 = PXFloatGreaterThanOrApproximatelyEqualToFloat();

    if (!v18)
    {
      if (v16)
        v15 = 9;
      else
        v15 = 1;
      v16 = 0;
LABEL_33:
      v5 = v25;
      if ((v14 & 1) == 0)
      {
        v14 = 0;
        goto LABEL_36;
      }
      goto LABEL_34;
    }
    if (!v16)
    {
      objc_msgSend(v3, "analysis");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasVisualSearchResults");

      if (v21)
      {
        v16 = 0;
        v15 = 4;
        goto LABEL_33;
      }
      v15 = 0;
LABEL_51:
      v5 = v25;
      if (!v14)
        goto LABEL_36;
      goto LABEL_34;
    }
    -[PUImageAnalysisInteraction sizeChangeCoalescer](self, "sizeChangeCoalescer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "hasPendingEvent"))
    {

LABEL_32:
      v16 = 0;
      v15 = 0;
      goto LABEL_33;
    }
    if (v26)
    {
      v22 = objc_msgSend(v26, "imageAnalysisInteractionShouldHighlightSubjectWhenAccessoryIsVisible:", self);

      if ((v22 & 1) == 0)
        goto LABEL_32;
      v15 = 8;
      goto LABEL_51;
    }

    v16 = 1;
    v15 = 8;
    v5 = v25;
    if ((v14 & 1) != 0)
    {
LABEL_34:
      objc_msgSend(v3, "updateActionInfoLayout");
      v14 = 1;
      goto LABEL_36;
    }
  }
  else
  {
    v12 = 0;
    v15 = 0;
    v11 = 0;
    v16 = 0;
  }
  v14 = 0;
LABEL_36:
  if (objc_msgSend(v3, "activeInteractionTypes") != v15)
    objc_msgSend(v3, "setActiveInteractionTypes:", v15);
  objc_msgSend(v3, "_photosImageForRemoveBackground");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 != v11)
    objc_msgSend(v3, "set_photosImageForRemoveBackground:", v11);
  if (v16 != objc_msgSend(v3, "_photosInfoSingleTapSubjectModeEnabled"))
    objc_msgSend(v3, "set_photosInfoSingleTapSubjectModeEnabled:", v16);
  if (v14 == objc_msgSend(v3, "actionInfoViewHidden"))
    objc_msgSend(v3, "setActionInfoViewHidden:", v14 ^ 1u);
  if (v7)
    objc_msgSend(v3, "beginImageSubjectAnalysisIfNecessary");
  if (v12)
    objc_msgSend(v3, "highlightMatchesForStrings:animated:", v12, 1);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __48__PUImageAnalysisInteraction__updateInteraction__block_invoke;
  v27[3] = &unk_1E58ABCA8;
  v28 = v4;
  v29 = v3;
  v24 = v4;
  objc_msgSend(v24, "performChanges:", v27);

LABEL_49:
}

- (BOOL)_allowsSubjectLifting
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryViewVisibilityFraction");
  v4 = PXFloatGreaterThanOrApproximatelyEqualToFloat();

  if (!v4)
    return 1;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  -[PUImageAnalysisInteraction browsingViewModel](self, "browsingViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");

  return !v6 || v8 == 1;
}

- (void)setAdditionalActionInfoBottomEdgeInset:(double)a3
{
  if (self->_additionalActionInfoBottomEdgeInset != a3)
  {
    self->_additionalActionInfoBottomEdgeInset = a3;
    -[PUImageAnalysisInteraction _updateActionInfoEdgeInsets](self, "_updateActionInfoEdgeInsets");
  }
}

- (void)_updateActionInfoEdgeInsets
{
  id v3;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction additionalActionInfoBottomEdgeInset](self, "additionalActionInfoBottomEdgeInset");
  objc_msgSend(v3, "actionInfoEdgeInsets");
  objc_msgSend(v3, "setActionInfoEdgeInsets:");

}

- (id)contentViewForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;

  -[PUImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentViewForImageAnalysisInteraction:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PUImageAnalysisInteraction hostView](self, "hostView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)contentImageForImageAnalysisInteraction:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CVBuffer *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CGImageRef imageOut;

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mediaType");

  if (v5 != 2)
    goto LABEL_6;
  objc_msgSend(v3, "videoPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CVBuffer *)objc_msgSend(v7, "currentPixelBuffer");

  if (!v8)
    goto LABEL_8;
  imageOut = 0;
  VTCreateCGImageFromCVPixelBuffer(v8, 0, &imageOut);
  if (!imageOut)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "videoPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "videoSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "preferredTransform");
  v12 = PXVKImageOrientationFromPreferredTransform();

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", imageOut, v12, 1.0);
  v8 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(imageOut);
LABEL_8:

  return v8;
}

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGRect result;

  -[PUImageAnalysisInteraction contentsRect](self, "contentsRect", a3);
  -[PUImageAnalysisInteraction hostView](self, "hostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aspectRatio");
  v8 = v7;

  if (v8 < 0.0 || v8 > 0.0)
  {
    -[PUImageAnalysisInteraction hostView](self, "hostView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");
    PFFrameApplyingContentsRectInBounds();

    PXRectNormalize();
  }
  else
  {
    v9 = *MEMORY[0x1E0D7D078];
    v10 = *(double *)(MEMORY[0x1E0D7D078] + 8);
    v11 = *(double *)(MEMORY[0x1E0D7D078] + 16);
    v12 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  char v5;
  double y;
  double x;
  id v9;
  id v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v9)
    goto LABEL_2;
  if ((v5 & 8) == 0)
  {
LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  if (-[PUImageAnalysisInteraction allowsVKRemoveBackground](self, "allowsVKRemoveBackground"))
  {
    if (!objc_msgSend(v9, "isSubjectHighlightAvailable"))
      goto LABEL_4;
    if (objc_msgSend(v9, "imageSubjectExistsAtPoint:", x, y))
    {
      v13 = (void *)MEMORY[0x1E0D7BC00];
      -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preheatResourcesForSubjectExtractionOfAsset:", v15);

      goto LABEL_4;
    }
  }
LABEL_2:
  v11 = 0;
LABEL_5:

  return v11;
}

- (void)imageAnalysisInteractionSubjectInteractionInProgressDidChange:(id)a3
{
  id v4;

  -[PUImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageAnalysisInteractionSubjectInteractionInProgressDidChange:", self);

}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldShowLookupForItemFromCallout:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD block[5];
  id v14;
  id location;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsVisualIntelligenceVisualLookupInfoPanelMode");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 != 1
      || (-[PUImageAnalysisInteraction browsingViewModel](self, "browsingViewModel"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "horizontalSizeClass"),
          v9,
          v10 != 2))
    {
      objc_initWeak(&location, self);
      v11 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __90__PUImageAnalysisInteraction_imageAnalysisInteraction_shouldShowLookupForItemFromCallout___block_invoke;
      block[3] = &unk_1E58AB210;
      objc_copyWeak(&v14, &location);
      block[4] = self;
      dispatch_after(v11, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  return 1;
}

- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4
{
  px_perform_on_main_runloop();
}

- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "playbackStyle") == 3;

  return v5;
}

- (void)imageAnalysisInteraction:(id)a3 livePhotoShouldPlay:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = a4;
  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAccessoryViewVisible");

  if ((v7 & 1) == 0)
  {
    -[PUImageAnalysisInteraction browsingViewModel](self, "browsingViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__PUImageAnalysisInteraction_imageAnalysisInteraction_livePhotoShouldPlay___block_invoke;
    v9[3] = &unk_1E58AAD68;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "performChanges:", v9);

    -[PUImageAnalysisInteraction setIsDrivingLivePhotoPlayback:](self, "setIsDrivingLivePhotoPlayback:", v4);
  }
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;

  -[PUImageAnalysisInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForImageAnalysisInteraction:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__PUImageAnalysisInteraction_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke;
  v6[3] = &unk_1E58ABD10;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)imageAnalysisInteractionDidDismissVisualSearchController:(id)a3
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__PUImageAnalysisInteraction_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke;
  v5[3] = &unk_1E58ABD10;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)setIsDrivingLivePhotoPlayback:(BOOL)a3
{
  id v4;

  if (self->_isDrivingLivePhotoPlayback != a3)
  {
    self->_isDrivingLivePhotoPlayback = a3;
    if (!a3)
    {
      if (-[PUImageAnalysisInteraction shouldResetInteractionWhenNotDrivingLivePhotoPlayback](self, "shouldResetInteractionWhenNotDrivingLivePhotoPlayback"))
      {
        -[PUImageAnalysisInteraction _resetInteraction](self, "_resetInteraction");
      }
    }
    -[PUImageAnalysisInteraction delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange:", self);

  }
}

- (BOOL)visualImageInteractionEnabled
{
  PUImageAnalysisInteraction *v2;
  void *v3;

  v2 = self;
  -[PUImageAnalysisInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "analysisInteractionAllowedForImageAnalysisInteraction:", v2);

  return (char)v2;
}

- (BOOL)textExistsAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "textExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)dataDetectorExistsAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "dataDetectorExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)interactiveItemExistsAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "interactableItemExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)actionInfoItemExistsAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "actionInfoItemExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)imageSubjectExistsAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[PUImageAnalysisInteraction allowsVKRemoveBackground](self, "allowsVKRemoveBackground"))
  {
    -[PUImageAnalysisInteraction interaction](self, "interaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImageAnalysisInteraction interaction](self, "interaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v7);
    v8 = objc_msgSend(v5, "imageSubjectExistsAtPoint:");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isVisualIntelligenceOverlayInitialized
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "analysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasActiveTextSelection
{
  void *v2;
  char v3;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveTextSelection");

  return v3;
}

- (BOOL)isImageSubjectAnalysisAvailable
{
  void *v2;
  char v3;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubjectHighlightAvailable");

  return v3;
}

- (void)beginImageSubjectAnalysisIfNecessary
{
  id v3;

  if (-[PUImageAnalysisInteraction allowsVKRemoveBackground](self, "allowsVKRemoveBackground"))
  {
    -[PUImageAnalysisInteraction interaction](self, "interaction");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginImageSubjectAnalysisIfNecessary");

  }
}

- (BOOL)imageInteractionHasAnalysisAndSubjectLiftingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (-[PUImageAnalysisInteraction allowsVKRemoveBackground](self, "allowsVKRemoveBackground")
    && (-[PUImageAnalysisInteraction interaction](self, "interaction"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "analysis"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    -[PUImageAnalysisInteraction interaction](self, "interaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ((unint64_t)objc_msgSend(v5, "activeInteractionTypes") >> 3) & 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)subjectHighlightActive
{
  void *v2;
  char v3;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectHighlightActive");

  return v3;
}

- (BOOL)isSubjectInteractionInProgress
{
  void *v2;
  char v3;

  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "subjectInteractionInProgress");

  return v3;
}

- (void)_updateStatusCornerState
{
  void *v3;
  void *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "actionInfoViewHidden") & 1) == 0 && objc_msgSend(v4, "liveTextButtonVisible"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v5 = __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke;
    v6 = &v9;
LABEL_6:
    v6[1] = 3221225472;
    v6[2] = (uint64_t)v5;
    v6[3] = (uint64_t)&unk_1E58ABD10;
    v7 = v3;
    v6[4] = (uint64_t)v7;
    objc_msgSend(v7, "performChanges:", v6);

    goto LABEL_7;
  }
  if (objc_msgSend(v3, "statusCornerState") == 1)
  {
    v8 = MEMORY[0x1E0C809B0];
    v5 = __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke_2;
    v6 = &v8;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_setActionInfoViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PUImageAnalysisInteraction interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionInfoViewHidden:", v3);

  -[PUImageAnalysisInteraction _updateStatusCornerState](self, "_updateStatusCornerState");
}

- (BOOL)allowsVKRemoveBackground
{
  void *v2;
  char v3;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsVisualIntelligenceRemoveBackground");

  return v3;
}

- (void)_ppt_resetVKAnalysisWaitingTimer
{
  void *v3;

  -[PUImageAnalysisInteraction pptVKAnalysisWaitingTimer](self, "pptVKAnalysisWaitingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PUImageAnalysisInteraction setPptVKAnalysisWaitingTimer:](self, "setPptVKAnalysisWaitingTimer:", 0);
}

- (void)_ppt_fireVKAnalysisWaitingTimer
{
  void *v3;

  -[PUImageAnalysisInteraction pptVKAnalysisWaitingTimer](self, "pptVKAnalysisWaitingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fire");

  -[PUImageAnalysisInteraction _ppt_resetVKAnalysisWaitingTimer](self, "_ppt_resetVKAnalysisWaitingTimer");
}

- (void)ppt_notifyWhenVKAnalysisIsReadyWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id location[5];
  id v28;

  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "launchedToTest");

    if (v9)
    {
      -[PUImageAnalysisInteraction pptVKAnalysisWaitingTimer](self, "pptVKAnalysisWaitingTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isValid");

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImageAnalysisInteraction.m"), 625, CFSTR("Should not request notification, when a request is already on going"));

      }
      v12 = (void *)MEMORY[0x1E0D7BC00];
      -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "canRequestVKImageAnalysisForAsset:", v14);

      -[PUImageAnalysisInteraction assetViewModel](self, "assetViewModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "visualImageAnalysis");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 || (v15 & 1) == 0)
      {
        -[PUImageAnalysisInteraction _ppt_resetVKAnalysisWaitingTimer](self, "_ppt_resetVKAnalysisWaitingTimer");
        location[1] = (id)MEMORY[0x1E0C809B0];
        location[2] = (id)3221225472;
        location[3] = __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke;
        location[4] = &unk_1E58ABAC8;
        v28 = v7;
        px_dispatch_on_main_queue();

      }
      else
      {
        objc_initWeak(location, self);
        v18 = (void *)MEMORY[0x1E0C99E88];
        v21 = MEMORY[0x1E0C809B0];
        v22 = 3221225472;
        v23 = __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke_2;
        v24 = &unk_1E58A4AC8;
        v25 = v7;
        objc_copyWeak(&v26, location);
        objc_msgSend(v18, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, &v21, a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUImageAnalysisInteraction setPptVKAnalysisWaitingTimer:](self, "setPptVKAnalysisWaitingTimer:", v19, v21, v22, v23, v24);

        objc_destroyWeak(&v26);
        objc_destroyWeak(location);
      }
    }
  }

}

- (PUAssetViewModel)assetViewModel
{
  return (PUAssetViewModel *)objc_loadWeakRetained((id *)&self->_assetViewModel);
}

- (PUBrowsingViewModel)browsingViewModel
{
  return (PUBrowsingViewModel *)objc_loadWeakRetained((id *)&self->_browsingViewModel);
}

- (PUImageAnalysisInteractionDelegate)delegate
{
  return (PUImageAnalysisInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDrivingLivePhotoPlayback
{
  return self->_isDrivingLivePhotoPlayback;
}

- (UIView)hostView
{
  return self->_hostView;
}

- (double)additionalActionInfoBottomEdgeInset
{
  return self->_additionalActionInfoBottomEdgeInset;
}

- (BOOL)interactionIsResetAndControlledByVKC
{
  return self->_interactionIsResetAndControlledByVKC;
}

- (void)setInteractionIsResetAndControlledByVKC:(BOOL)a3
{
  self->_interactionIsResetAndControlledByVKC = a3;
}

- (int64_t)vkOverlayUpdateToken
{
  return self->_vkOverlayUpdateToken;
}

- (void)setVkOverlayUpdateToken:(int64_t)a3
{
  self->_vkOverlayUpdateToken = a3;
}

- (NSTimer)pptVKAnalysisWaitingTimer
{
  return self->_pptVKAnalysisWaitingTimer;
}

- (void)setPptVKAnalysisWaitingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pptVKAnalysisWaitingTimer, a3);
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugLabel, a3);
}

- (BOOL)shouldResetInteractionWhenNotDrivingLivePhotoPlayback
{
  return self->_shouldResetInteractionWhenNotDrivingLivePhotoPlayback;
}

- (void)setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:(BOOL)a3
{
  self->_shouldResetInteractionWhenNotDrivingLivePhotoPlayback = a3;
}

- (void)setSizeChangeCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_sizeChangeCoalescer, a3);
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (UICoordinateSpace)contentCoordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_contentCoordinateSpace);
}

- (void)setContentCoordinateSpace:(id)a3
{
  objc_storeWeak((id *)&self->_contentCoordinateSpace, a3);
}

- (id)interactionCreator
{
  return self->_interactionCreator;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXVKImageAnalysisInteraction)interaction
{
  return self->_interaction;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong(&self->_interactionCreator, 0);
  objc_destroyWeak((id *)&self->_contentCoordinateSpace);
  objc_storeStrong((id *)&self->_sizeChangeCoalescer, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_pptVKAnalysisWaitingTimer, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_browsingViewModel);
  objc_destroyWeak((id *)&self->_assetViewModel);
}

uint64_t __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_copyWeak(&v3, (id *)(a1 + 40));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v3);

}

void __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "assetViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualImageAnalysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v3 != 0);

}

uint64_t __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatusCornerState:", 1);
}

uint64_t __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatusCornerState:", 2);
}

uint64_t __87__PUImageAnalysisInteraction_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsVisualSearchCardShowing:", 0);
}

uint64_t __108__PUImageAnalysisInteraction_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsVisualSearchCardShowing:", 1);
}

void __75__PUImageAnalysisInteraction_imageAnalysisInteraction_livePhotoShouldPlay___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "browsingViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLivePhotoShouldPlay:", v1);

}

uint64_t __88__PUImageAnalysisInteraction_imageAnalysisInteraction_liveTextButtonDidChangeToVisible___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateStatusCornerState");
  return objc_msgSend(*(id *)(a1 + 32), "_updateActionInfoEdgeInsets");
}

void __90__PUImageAnalysisInteraction_imageAnalysisInteraction_shouldShowLookupForItemFromCallout___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showDetailsViewForImageAnalysisInteraction:", *(_QWORD *)(a1 + 32));

}

uint64_t __48__PUImageAnalysisInteraction__updateInteraction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisualSearchImageAnalysisInteraction:", *(_QWORD *)(a1 + 40));
}

void __45__PUImageAnalysisInteraction__scheduleUpdate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateIfNeeded");

}

uint64_t __57__PUImageAnalysisInteraction_initWithInteractionCreator___block_invoke()
{
  return PXVKCreateImageAnalysisInteraction();
}

+ (double)maxFocusAbsoluteValueForInteraction
{
  return 0.01;
}

+ (double)interactionResetInterval
{
  return 0.3;
}

@end
