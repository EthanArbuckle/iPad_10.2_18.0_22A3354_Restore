@implementation PURenderIndicatorTileViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PURenderIndicatorTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PURenderIndicatorTileViewController _invalidateSizeClass](self, "_invalidateSizeClass");
  -[PURenderIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  -[PURenderIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)becomeReusable
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURenderIndicatorTileViewController;
  -[PUTileViewController becomeReusable](&v4, sel_becomeReusable);
  -[PURenderIndicatorTileViewController setAssetSharedViewModel:](self, "setAssetSharedViewModel:", 0);
  -[PURenderIndicatorTileViewController setUndoManager:](self, "setUndoManager:", 0);
  -[PURenderIndicatorTileViewController roundedBackgroundView](self, "roundedBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[PURenderIndicatorTileViewController setRoundedBackgroundView:](self, "setRoundedBackgroundView:", 0);
  -[PURenderIndicatorTileViewController setProgressView:](self, "setProgressView:", 0);
  -[PURenderIndicatorTileViewController setRenderingLabel:](self, "setRenderingLabel:", 0);
}

- (void)setAssetSharedViewModel:(id)a3
{
  PUAssetSharedViewModel *v5;
  PUAssetSharedViewModel **p_assetSharedViewModel;
  void *v7;
  PUAssetSharedViewModel *v8;

  v5 = (PUAssetSharedViewModel *)a3;
  p_assetSharedViewModel = &self->_assetSharedViewModel;
  if (self->_assetSharedViewModel != v5)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0D7CD28], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v7, "registerObserver:", self);
    else
      objc_msgSend(v7, "unregisterObserver:", self);
    -[PUAssetSharedViewModel unregisterChangeObserver:](*p_assetSharedViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetSharedViewModel, a3);
    -[PUAssetSharedViewModel registerChangeObserver:](*p_assetSharedViewModel, "registerChangeObserver:", self);
    -[PURenderIndicatorTileViewController _invalidateStatus](self, "_invalidateStatus");
    -[PURenderIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");

    v5 = v8;
  }

}

- (void)applyLayoutInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PURenderIndicatorTileViewController;
  -[PUTileViewController applyLayoutInfo:](&v4, sel_applyLayoutInfo_, a3);
  -[PURenderIndicatorTileViewController _invalidateSizeClass](self, "_invalidateSizeClass");
  -[PURenderIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setStatus:(id)a3
{
  PXOperationStatus *v5;
  PXOperationStatus *v6;
  char v7;
  PXOperationStatus *v8;

  v5 = (PXOperationStatus *)a3;
  v6 = v5;
  if (self->_status != v5)
  {
    v8 = v5;
    v7 = -[PXOperationStatus isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_status, a3);
      -[PURenderIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
      v6 = v8;
    }
  }

}

- (void)setSizeClass:(int64_t)a3
{
  CGSize *p_progressIndicatorSize;
  CGFloat v5;
  CGFloat v6;

  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    p_progressIndicatorSize = &self->_progressIndicatorSize;
    objc_msgSend((id)objc_opt_class(), "progressIndicatorTileSizeForSizeClass:", a3);
    p_progressIndicatorSize->width = v5;
    p_progressIndicatorSize->height = v6;
    -[PURenderIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  }
}

- (CGRect)_expandedBackgroundViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[PURenderIndicatorTileViewController progressIndicatorSize](self, "progressIndicatorSize");
  v6 = v5 + 4.0;
  v8 = v7 + 3.0 + 5.0;
  -[PURenderIndicatorTileViewController renderLabelTextWidth](self, "renderLabelTextWidth");
  v10 = v9 + v8 + 6.0;
  v11 = v3;
  v12 = v4;
  v13 = v6;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_updateViewFramesForCollapseState:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  id v29;

  v3 = a3;
  -[PURenderIndicatorTileViewController progressIndicatorSize](self, "progressIndicatorSize");
  v6 = v5;
  v8 = v7;
  -[PURenderIndicatorTileViewController renderingLabel](self, "renderingLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicContentSize");
  v11 = v10;
  v13 = v12;

  -[PUTileViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "layoutDirection");

  v17 = *MEMORY[0x1E0C9D648];
  v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v28 = v6;
  v18 = v6 + 3.0 + 5.0;
  if (!v3)
  {
    -[PURenderIndicatorTileViewController renderLabelTextWidth](self, "renderLabelTextWidth");
    v21 = 6.0;
    v18 = v18 + v22 + 6.0;
    if (v16 == 1)
    {
      v20 = v11 + 5.0 + 6.0;
      goto LABEL_7;
    }
LABEL_6:
    -[PURenderIndicatorTileViewController progressIndicatorSize](self, "progressIndicatorSize");
    v20 = 3.0;
    v21 = v23 + 3.0 + 5.0;
    goto LABEL_7;
  }
  if (v16 != 1)
    goto LABEL_6;
  -[PURenderIndicatorTileViewController renderLabelTextWidth](self, "renderLabelTextWidth");
  v17 = v19 + 6.0;
  v20 = v11 + 5.0 + 6.0 - (v19 + 6.0);
  v21 = 6.0 - (v19 + 6.0);
LABEL_7:
  -[PURenderIndicatorTileViewController roundedBackgroundView](self, "roundedBackgroundView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v27, v18, v8 + 4.0);

  -[PURenderIndicatorTileViewController progressView](self, "progressView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v20, 2.0, v28, v8);

  -[PURenderIndicatorTileViewController errorButton](self, "errorButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v20, 2.0, v28, v8);

  -[PURenderIndicatorTileViewController renderingLabel](self, "renderingLabel");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v21, (v8 + 4.0 - v13) * 0.5, v11, v13);

}

- (void)setProgressViewVisible:(BOOL)a3
{
  -[PURenderIndicatorTileViewController setProgressViewVisible:animated:](self, "setProgressViewVisible:animated:", a3, 0);
}

- (void)setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[PURenderIndicatorTileViewController setProgressViewVisible:animated:completion:](self, "setProgressViewVisible:animated:completion:", a3, a4, 0);
}

- (void)setProgressViewVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  void (**v15)(void *, uint64_t);
  uint64_t v16;
  id v17;
  void (**v18)(void *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  PURenderIndicatorTileViewController *v24;
  id v25;
  _QWORD v26[4];
  _QWORD v27[2];
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  _QWORD aBlock[4];
  id v32;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (!v6 || -[PURenderIndicatorTileViewController willShowProgressAfterDelay](self, "willShowProgressAfterDelay"))
  {
    -[PURenderIndicatorTileViewController setWillShowProgressAfterDelay:](self, "setWillShowProgressAfterDelay:", 0);
    if (self->_isProgressViewVisible != v6)
    {
      self->_isProgressViewVisible = v6;
      -[PURenderIndicatorTileViewController roundedBackgroundView](self, "roundedBackgroundView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[PURenderIndicatorTileViewController progressView](self, "progressView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startProgressTimer");

        -[PURenderIndicatorTileViewController _updateViewFramesForCollapseState:](self, "_updateViewFramesForCollapseState:", 1);
        v11 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke;
        aBlock[3] = &unk_1E58ABD10;
        v12 = &v32;
        v32 = v9;
        v13 = (void (**)(_QWORD))_Block_copy(aBlock);
        v30[0] = v11;
        v30[1] = 3221225472;
        v30[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_2;
        v30[3] = &unk_1E58ABD10;
        v30[4] = self;
        v14 = (void (**)(_QWORD))_Block_copy(v30);
        v28[0] = v11;
        v28[1] = 3221225472;
        v28[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_3;
        v28[3] = &unk_1E58AA518;
        v29 = v8;
        v15 = (void (**)(void *, uint64_t))_Block_copy(v28);
        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v13, 0, 0.2, 0.0);
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 128, v14, v15, 0.8, 0.0);
        }
        else
        {
          v13[2](v13);
          v14[2](v14);
          v15[2](v15, 1);
        }

      }
      else
      {
        -[PURenderIndicatorTileViewController _updateViewFramesForCollapseState:](self, "_updateViewFramesForCollapseState:", 0);
        v16 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_4;
        v26[3] = &unk_1E58ABCA8;
        v12 = (id *)v27;
        v17 = v9;
        v27[0] = v17;
        v27[1] = self;
        v13 = (void (**)(_QWORD))_Block_copy(v26);
        v19 = v16;
        v20 = 3221225472;
        v21 = __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_5;
        v22 = &unk_1E58A6BF8;
        v23 = v17;
        v24 = self;
        v25 = v8;
        v18 = (void (**)(void *, uint64_t))_Block_copy(&v19);
        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v13, v18, 0.8, 0.3, v19, v20, v21, v22, v23, v24);
        }
        else
        {
          v13[2](v13);
          v18[2](v18, 1);
        }

      }
    }
  }

}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PURenderIndicatorTileViewController _needsUpdate](self, "_needsUpdate")
    && -[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PURenderIndicatorTileViewController _updateStatusIfNeeded](self, "_updateStatusIfNeeded");
    -[PURenderIndicatorTileViewController _updateSizeClassIfNeeded](self, "_updateSizeClassIfNeeded");
    -[PURenderIndicatorTileViewController _updateStatusViewsIfNeeded](self, "_updateStatusViewsIfNeeded");
    if (-[PURenderIndicatorTileViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PURenderIndicatorTileViewController.m"), 299, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PURenderIndicatorTileViewController needsUpdateStatus](self, "needsUpdateStatus")
      || -[PURenderIndicatorTileViewController needsUpdateSizeClass](self, "needsUpdateSizeClass")
      || -[PURenderIndicatorTileViewController needsUpdateStatusViews](self, "needsUpdateStatusViews");
}

- (void)_invalidateStatus
{
  void *v3;
  int v4;

  -[PURenderIndicatorTileViewController setNeedsUpdateStatus:](self, "setNeedsUpdateStatus:", 1);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowRenderIndicator");

  if (v4)
    -[PURenderIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
  -[PURenderIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateStatusIfNeeded
{
  void *v3;
  id v4;

  if (-[PURenderIndicatorTileViewController needsUpdateStatus](self, "needsUpdateStatus"))
  {
    -[PURenderIndicatorTileViewController setNeedsUpdateStatus:](self, "setNeedsUpdateStatus:", 0);
    -[PURenderIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadingStatus");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PURenderIndicatorTileViewController setStatus:](self, "setStatus:", v4);
  }
}

- (void)_invalidateSizeClass
{
  -[PURenderIndicatorTileViewController setNeedsUpdateSizeClass:](self, "setNeedsUpdateSizeClass:", 1);
  -[PURenderIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSizeClassIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  if (-[PURenderIndicatorTileViewController needsUpdateSizeClass](self, "needsUpdateSizeClass"))
  {
    -[PURenderIndicatorTileViewController setNeedsUpdateSizeClass:](self, "setNeedsUpdateSizeClass:", 0);
    if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUTileViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      v5 = v4;
      v7 = v6;

      if (v5 >= v7)
        v5 = v7;
      objc_msgSend((id)objc_opt_class(), "renderIndicatorTileSizeForSizeClass:", 1);
      if (v8 >= v9)
        v8 = v9;
      if (v5 <= v8)
        v10 = 1;
      else
        v10 = 2;
      -[PURenderIndicatorTileViewController setSizeClass:](self, "setSizeClass:", v10);
    }
  }
}

- (void)_invalidateStatusViews
{
  -[PURenderIndicatorTileViewController setNeedsUpdateStatusViews:](self, "setNeedsUpdateStatusViews:", 1);
  -[PURenderIndicatorTileViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateStatusViewsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  dispatch_time_t v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id location;
  _QWORD block[5];
  _QWORD v65[2];
  _QWORD v66[4];
  CGRect v67;

  v66[2] = *MEMORY[0x1E0C80C00];
  if (!-[PURenderIndicatorTileViewController needsUpdateStatusViews](self, "needsUpdateStatusViews"))
    return;
  -[PURenderIndicatorTileViewController setNeedsUpdateStatusViews:](self, "setNeedsUpdateStatusViews:", 0);
  if (!-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    return;
  -[PURenderIndicatorTileViewController progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURenderIndicatorTileViewController roundedBackgroundView](self, "roundedBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURenderIndicatorTileViewController status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURenderIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deferredProcessingNeeded");

  -[PURenderIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v5, "progress");
    goto LABEL_7;
  }
  v9 = +[PURenderIndicatorTileViewController wantsRenderViewForTypeOfProcessingNeeded:](PURenderIndicatorTileViewController, "wantsRenderViewForTypeOfProcessingNeeded:", v7);

  objc_msgSend(v5, "progress");
  if (!v9)
  {
LABEL_7:
    -[PURenderIndicatorTileViewController editActionStatus](self, "editActionStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "state") == 1;
    objc_msgSend(v13, "progress");
    v11 = v14;

    goto LABEL_8;
  }
  v11 = v10;
  v12 = 1;
LABEL_8:
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "alwaysShowRenderIndicator"))
  {
    objc_msgSend(v15, "simulatedRenderProgress");
    v11 = v16;
  }
  -[PUTileViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v4)
    {
      v18 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0DC3990]);
      v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v53 = *MEMORY[0x1E0C9D648];
      v60 = (void *)objc_msgSend(v19, "initWithFrame:");
      -[PURenderIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "asset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "mediaType");

      if (v25 == 2)
        v26 = CFSTR("RENDERING_PROGRESS_LABEL_VIDEO");
      else
        v26 = CFSTR("RENDERING_PROGRESS_LABEL_PHOTO");
      PULocalizedString(v26);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1448]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0DC1140];
      v65[0] = *MEMORY[0x1E0DC1138];
      v65[1] = v27;
      v66[0] = v57;
      v66[1] = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v56, v55);
      objc_msgSend(v60, "setAttributedText:", v28);

      objc_msgSend(v60, "setAlpha:", 0.0);
      objc_msgSend(v60, "setAutoresizingMask:", 2);
      -[PURenderIndicatorTileViewController setRenderingLabel:](self, "setRenderingLabel:", v60);
      objc_msgSend(v60, "intrinsicContentSize");
      -[PURenderIndicatorTileViewController setRenderLabelTextWidth:](self, "setRenderLabelTextWidth:", ceil(v29));
      -[PURenderIndicatorTileViewController _expandedBackgroundViewFrame](self, "_expandedBackgroundViewFrame");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithFrame:", v30, v32, v34, v36);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setEffect:", v38);

      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v31, v33, v35, v37);
      objc_msgSend(v4, "addSubview:", v59);
      objc_msgSend(v4, "setClipsToBounds:", 1);
      objc_msgSend(v4, "bounds");
      objc_msgSend(v59, "_setCornerRadius:continuous:maskedCorners:", 1, 15, CGRectGetHeight(v67) * 0.5);
      objc_msgSend(v59, "setAutoresizingMask:", 2);
      objc_msgSend(v4, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v54, "setBackgroundColor:", objc_msgSend(v39, "CGColor"));

      objc_msgSend(v4, "setAlpha:", 0.0);
      objc_msgSend(v17, "addSubview:", v4);
      -[PURenderIndicatorTileViewController setRoundedBackgroundView:](self, "setRoundedBackgroundView:", v4);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B8]), "initWithFrame:style:", 0, v53, v20, v21, v22);

      objc_msgSend(v18, "setAutoresizingMask:", 20);
      objc_msgSend(v18, "setManualColor:", v58);
      objc_msgSend(v18, "setSkipResetOnRelayout:", 1);
      objc_msgSend(v18, "setAllowFake25PercentProgress:", 0);
      -[PURenderIndicatorTileViewController setProgressView:](self, "setProgressView:", v18);
      objc_msgSend(v4, "addSubview:", v18);
      objc_msgSend(v4, "addSubview:", v60);
      -[PURenderIndicatorTileViewController _updateViewFramesForCollapseState:](self, "_updateViewFramesForCollapseState:", 1);
      -[PUTileViewController view](self, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "frame");
      -[PURenderIndicatorTileViewController roundedBackgroundView](self, "roundedBackgroundView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "frame");
      PXRectWithOriginAndSize();
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v49 = v48;
      -[PUTileViewController view](self, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

      -[PURenderIndicatorTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
    }
    objc_msgSend(v18, "progress");
    if (v11 < v51)
      objc_msgSend(v18, "resetProgress");
    objc_msgSend(v18, "setProgress:", v11);
    if (!-[PURenderIndicatorTileViewController isProgressViewVisible](self, "isProgressViewVisible")
      && !-[PURenderIndicatorTileViewController willShowProgressAfterDelay](self, "willShowProgressAfterDelay"))
    {
      -[PURenderIndicatorTileViewController setWillShowProgressAfterDelay:](self, "setWillShowProgressAfterDelay:", 1);
      v52 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke;
      block[3] = &unk_1E58ABD10;
      block[4] = self;
      dispatch_after(v52, MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    objc_msgSend(v3, "setProgress:", 1.0);
    objc_initWeak(&location, self);
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2;
    v61[3] = &unk_1E58AA420;
    objc_copyWeak(&v62, &location);
    -[PURenderIndicatorTileViewController setProgressViewVisible:animated:completion:](self, "setProgressViewVisible:animated:completion:", 0, 1, v61);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
    v18 = v3;
  }
  objc_msgSend(v17, "setUserInteractionEnabled:", v12);

}

- (void)_updateSubviewOrdering
{
  void *v3;
  void *v4;
  id v5;

  -[PUTileViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PURenderIndicatorTileViewController errorButton](self, "errorButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v3);

  -[PURenderIndicatorTileViewController progressView](self, "progressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v4);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PURenderIndicatorTileViewController assetSharedViewModel](self, "assetSharedViewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    -[PURenderIndicatorTileViewController _handleAssetSharedViewModel:didChange:](self, "_handleAssetSharedViewModel:didChange:", v8, v6);

}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "deferredProcessingNeededChanged") & 1) != 0
    || objc_msgSend(v5, "needsDeferredProcessingChanged"))
  {
    -[PURenderIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    -[PURenderIndicatorTileViewController _invalidateStatus](self, "_invalidateStatus");
  }
  if (objc_msgSend(v5, "loadingStatusChanged"))
    -[PURenderIndicatorTileViewController _invalidateStatus](self, "_invalidateStatus");
  -[PURenderIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  PUAssetSharedViewModel *assetSharedViewModel;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a4;
  assetSharedViewModel = self->_assetSharedViewModel;
  v9 = a5;
  -[PUAssetSharedViewModel asset](assetSharedViewModel, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    objc_storeStrong((id *)&self->_editActionStatus, a4);
    -[PURenderIndicatorTileViewController _invalidateStatusViews](self, "_invalidateStatusViews");
    -[PURenderIndicatorTileViewController _updateIfNeeded](self, "_updateIfNeeded");
  }

}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (BOOL)needsUpdateStatus
{
  return self->_needsUpdateStatus;
}

- (void)setNeedsUpdateStatus:(BOOL)a3
{
  self->_needsUpdateStatus = a3;
}

- (BOOL)needsUpdateSizeClass
{
  return self->_needsUpdateSizeClass;
}

- (void)setNeedsUpdateSizeClass:(BOOL)a3
{
  self->_needsUpdateSizeClass = a3;
}

- (BOOL)needsUpdateStatusViews
{
  return self->_needsUpdateStatusViews;
}

- (void)setNeedsUpdateStatusViews:(BOOL)a3
{
  self->_needsUpdateStatusViews = a3;
}

- (PXOperationStatus)status
{
  return self->_status;
}

- (PXOperationStatus)editActionStatus
{
  return self->_editActionStatus;
}

- (void)setEditActionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_editActionStatus, a3);
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (CGSize)progressIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_progressIndicatorSize.width;
  height = self->_progressIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setProgressIndicatorSize:(CGSize)a3
{
  self->_progressIndicatorSize = a3;
}

- (UIView)roundedBackgroundView
{
  return self->_roundedBackgroundView;
}

- (void)setRoundedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedBackgroundView, a3);
}

- (UILabel)renderingLabel
{
  return self->_renderingLabel;
}

- (void)setRenderingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_renderingLabel, a3);
}

- (PLRoundProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (BOOL)isProgressViewVisible
{
  return self->_isProgressViewVisible;
}

- (void)setIsProgressViewVisible:(BOOL)a3
{
  self->_isProgressViewVisible = a3;
}

- (UIButton)errorButton
{
  return self->_errorButton;
}

- (void)setErrorButton:(id)a3
{
  objc_storeStrong((id *)&self->_errorButton, a3);
}

- (double)renderLabelTextWidth
{
  return self->_renderLabelTextWidth;
}

- (void)setRenderLabelTextWidth:(double)a3
{
  self->_renderLabelTextWidth = a3;
}

- (BOOL)willShowProgressAfterDelay
{
  return self->_willShowProgressAfterDelay;
}

- (void)setWillShowProgressAfterDelay:(BOOL)a3
{
  self->_willShowProgressAfterDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_renderingLabel, 0);
  objc_storeStrong((id *)&self->_roundedBackgroundView, 0);
  objc_storeStrong((id *)&self->_editActionStatus, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
}

uint64_t __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProgressViewVisible:animated:", 1, 1);
}

void __65__PURenderIndicatorTileViewController__updateStatusViewsIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "isProgressViewVisible") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "roundedBackgroundView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {
      objc_msgSend(WeakRetained, "roundedBackgroundView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeFromSuperview");

      objc_msgSend(WeakRetained, "setRoundedBackgroundView:", 0);
    }
    objc_msgSend(WeakRetained, "progressView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(WeakRetained, "progressView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      objc_msgSend(WeakRetained, "setProgressView:", 0);
    }
    objc_msgSend(WeakRetained, "renderingLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(WeakRetained, "renderingLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      objc_msgSend(WeakRetained, "setRenderingLabel:", 0);
    }
  }

}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateViewFramesForCollapseState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "renderingLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "_updateViewFramesForCollapseState:", 1);
}

uint64_t __82__PURenderIndicatorTileViewController_setProgressViewVisible_animated_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  double v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  if (v4 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "progressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetProgress");

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

+ (CGSize)progressIndicatorTileSizeForSizeClass:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 20.0;
  v4 = 20.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)renderIndicatorTileSizeForSizeClass:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "progressIndicatorTileSizeForSizeClass:", a3);
  v4 = v3 + 4.0;
  v5 = 154.0;
  result.height = v4;
  result.width = v5;
  return result;
}

+ (id)_loadErrorIconForSizeClass:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(a3)
  {
    case 2:
      objc_msgSend(v6, "regularLoadErrorIcon");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v10;
      goto LABEL_9;
    case 1:
      objc_msgSend(v6, "compactLoadErrorIcon");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PURenderIndicatorTileViewController.m"), 124, CFSTR("unspecified size class"));

      break;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

+ (BOOL)wantsRenderViewForTypeOfProcessingNeeded:(unsigned __int16)a3
{
  void *v3;
  int v4;
  char v5;
  void *v7;
  char v8;

  v4 = a3;
  if (a3 == 7 || a3 == 2)
  {
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "enableLiveVideoRender") ^ 1;
  }
  else
  {
    v5 = 0;
  }
  if (v4 == 7 || v4 == 2)

  if ((v5 & 1) != 0)
    return 1;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "alwaysShowRenderIndicator");

  return v8;
}

@end
