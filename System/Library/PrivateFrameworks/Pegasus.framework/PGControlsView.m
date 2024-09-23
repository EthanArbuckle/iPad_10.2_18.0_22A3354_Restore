@implementation PGControlsView

- (PGControlsView)initWithFrame:(CGRect)a3 viewModel:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PGControlsView *v11;
  PGControlsView *v12;
  PGCABackdropLayerView *v13;
  uint64_t v14;
  PGCABackdropLayerView *captureOnlyView;
  PGDimmingView *v16;
  uint64_t v17;
  UIView *dimmingView;
  PGLayoutContainerView *v19;
  uint64_t v20;
  PGLayoutContainerView *hidableItemsLayoutContainerView;
  uint64_t v22;
  PGButtonView *cancelButton;
  uint64_t v24;
  PGButtonView *restoreButton;
  uint64_t v26;
  PGButtonView *skipBackButton;
  uint64_t v28;
  PGButtonView *actionButton;
  uint64_t v30;
  PGButtonView *skipForwardButton;
  uint64_t v32;
  PGButtonView *liveIndicatorBadgeButton;
  PGButtonView *v34;
  void *v35;
  uint64_t v36;
  NSArray *allButtons;
  PGProgressIndicator *v38;
  uint64_t v39;
  PGProgressIndicator *progressIndicator;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  PGPrerollIndicatorView *v46;
  uint64_t v47;
  PGPrerollIndicatorView *prerollIndicatorView;
  void *v49;
  PGDisplayLink *v50;
  PGDisplayLink *displayLinkForProgressUpdates;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _QWORD v60[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v60[6] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v58.receiver = self;
  v58.super_class = (Class)PGControlsView;
  v11 = -[PGLayoutContainerView initWithFrame:](&v58, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    v53 = v10;
    objc_storeStrong((id *)&v11->_viewModel, a4);
    v13 = [PGCABackdropLayerView alloc];
    -[PGControlsView bounds](v12, "bounds");
    v14 = -[PGCABackdropLayerView initWithFrame:captureOnly:](v13, "initWithFrame:captureOnly:", 1);
    captureOnlyView = v12->_captureOnlyView;
    v12->_captureOnlyView = (PGCABackdropLayerView *)v14;

    -[PGControlsView addSubview:](v12, "addSubview:", v12->_captureOnlyView);
    v16 = [PGDimmingView alloc];
    -[PGControlsView bounds](v12, "bounds");
    v17 = -[PGDimmingView initWithFrame:](v16, "initWithFrame:");
    dimmingView = v12->_dimmingView;
    v12->_dimmingView = (UIView *)v17;

    -[PGControlsView addSubview:](v12, "addSubview:", v12->_dimmingView);
    v19 = [PGLayoutContainerView alloc];
    -[PGControlsView bounds](v12, "bounds");
    v20 = -[PGLayoutContainerView initWithFrame:](v19, "initWithFrame:");
    hidableItemsLayoutContainerView = v12->_hidableItemsLayoutContainerView;
    v12->_hidableItemsLayoutContainerView = (PGLayoutContainerView *)v20;

    -[PGControlsView addSubview:](v12, "addSubview:", v12->_hidableItemsLayoutContainerView);
    +[PGButtonView buttonWithDelegate:](PGButtonView, "buttonWithDelegate:", v12);
    v22 = objc_claimAutoreleasedReturnValue();
    cancelButton = v12->_cancelButton;
    v12->_cancelButton = (PGButtonView *)v22;

    -[PGMaterialView _setContinuousCornerRadius:](v12->_cancelButton, "_setContinuousCornerRadius:", 6.0);
    +[PGButtonView buttonWithDelegate:](PGButtonView, "buttonWithDelegate:", v12);
    v24 = objc_claimAutoreleasedReturnValue();
    restoreButton = v12->_restoreButton;
    v12->_restoreButton = (PGButtonView *)v24;

    -[PGMaterialView _setContinuousCornerRadius:](v12->_restoreButton, "_setContinuousCornerRadius:", 6.0);
    +[PGButtonView buttonWithDelegate:](PGButtonView, "buttonWithDelegate:", v12);
    v26 = objc_claimAutoreleasedReturnValue();
    skipBackButton = v12->_skipBackButton;
    v12->_skipBackButton = (PGButtonView *)v26;

    -[PGButtonView setGlyphSize:](v12->_skipBackButton, "setGlyphSize:", 26.0);
    -[PGButtonView setCircular:](v12->_skipBackButton, "setCircular:", 1);
    +[PGButtonView buttonWithDelegate:](PGButtonView, "buttonWithDelegate:", v12);
    v28 = objc_claimAutoreleasedReturnValue();
    actionButton = v12->_actionButton;
    v12->_actionButton = (PGButtonView *)v28;

    -[PGButtonView setGlyphSize:](v12->_actionButton, "setGlyphSize:", 38.0);
    -[PGButtonView setCircular:](v12->_actionButton, "setCircular:", 1);
    +[PGButtonView buttonWithDelegate:](PGButtonView, "buttonWithDelegate:", v12);
    v30 = objc_claimAutoreleasedReturnValue();
    skipForwardButton = v12->_skipForwardButton;
    v12->_skipForwardButton = (PGButtonView *)v30;

    -[PGButtonView setGlyphSize:](v12->_skipForwardButton, "setGlyphSize:", 24.0);
    -[PGButtonView setCircular:](v12->_skipForwardButton, "setCircular:", 1);
    +[PGButtonView buttonWithDelegate:](PGButtonView, "buttonWithDelegate:", v12);
    v32 = objc_claimAutoreleasedReturnValue();
    liveIndicatorBadgeButton = v12->_liveIndicatorBadgeButton;
    v12->_liveIndicatorBadgeButton = (PGButtonView *)v32;

    -[PGButtonView setEnabled:](v12->_liveIndicatorBadgeButton, "setEnabled:", 0);
    -[PGMaterialView _setContinuousCornerRadius:](v12->_liveIndicatorBadgeButton, "_setContinuousCornerRadius:", 6.0);
    v34 = v12->_liveIndicatorBadgeButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.75);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGButtonView setTintColor:](v34, "setTintColor:", v35);

    v60[0] = v12->_restoreButton;
    v60[1] = v12->_cancelButton;
    v60[2] = v12->_skipBackButton;
    v60[3] = v12->_actionButton;
    v60[4] = v12->_skipForwardButton;
    v60[5] = v12->_liveIndicatorBadgeButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 6);
    v36 = objc_claimAutoreleasedReturnValue();
    allButtons = v12->_allButtons;
    v12->_allButtons = (NSArray *)v36;

    v38 = [PGProgressIndicator alloc];
    -[PGControlsView _progressIndicatorFrameWithScaling:](v12, "_progressIndicatorFrameWithScaling:", 1.0);
    v39 = -[PGProgressIndicator initWithFrame:](v38, "initWithFrame:");
    progressIndicator = v12->_progressIndicator;
    v12->_progressIndicator = (PGProgressIndicator *)v39;

    -[PGLayoutContainerView addSubview:](v12->_hidableItemsLayoutContainerView, "addSubview:", v12->_progressIndicator);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v41 = v12->_allButtons;
    v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v55;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(v41);
          -[PGLayoutContainerView addSubview:](v12->_hidableItemsLayoutContainerView, "addSubview:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v45++));
        }
        while (v43 != v45);
        v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v43);
    }

    v46 = [PGPrerollIndicatorView alloc];
    v10 = v53;
    v47 = -[PGPrerollIndicatorView initWithFrame:viewModel:](v46, "initWithFrame:viewModel:", v53, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    prerollIndicatorView = v12->_prerollIndicatorView;
    v12->_prerollIndicatorView = (PGPrerollIndicatorView *)v47;

    -[PGControlsView addSubview:](v12, "addSubview:", v12->_prerollIndicatorView);
    objc_msgSend(v53, "values");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGControlsView viewModelDidUpdateValuesFromOldValues:](v12, "viewModelDidUpdateValuesFromOldValues:", v49);

    v50 = -[PGDisplayLink initWithOwner:linkFired:]([PGDisplayLink alloc], "initWithOwner:linkFired:", v12, &__block_literal_global_7);
    displayLinkForProgressUpdates = v12->_displayLinkForProgressUpdates;
    v12->_displayLinkForProgressUpdates = v50;

    -[UIView PG_recursivelyDisallowGroupBlending](v12, "PG_recursivelyDisallowGroupBlending");
  }

  return v12;
}

uint64_t __42__PGControlsView_initWithFrame_viewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateProgress");
}

- (PGControlsView)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  PGControlsView *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGControlsView.m"), 113, CFSTR("You cannot do this, but Xcode thinks you can."));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGControlsView initWithFrame:viewModel:](self, "initWithFrame:viewModel:", v6, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PGDisplayLink invalidate](self->_displayLinkForProgressUpdates, "invalidate");
  -[PGProgressIndicator setIncludesWaitingToPlayIndicator:](self->_progressIndicator, "setIncludesWaitingToPlayIndicator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PGControlsView;
  -[PGControlsView dealloc](&v3, sel_dealloc);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGControlsView;
  -[PGControlsView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIView _setContinuousCornerRadius:](self->_dimmingView, "_setContinuousCornerRadius:", a3);
  -[UIView _setContinuousCornerRadius:](self->_contentLoadingIndicatorContainerView, "_setContinuousCornerRadius:", a3);
}

- (void)viewModelDidUpdateValuesFromOldValues:(id)a3
{
  void *v4;
  PGButtonView *cancelButton;
  void *v6;
  void *v7;
  PGButtonView *v8;
  void *v9;
  PGButtonView *skipBackButton;
  void *v11;
  void *v12;
  PGButtonView *v13;
  void *v14;
  PGButtonView *skipForwardButton;
  void *v16;
  void *v17;
  PGButtonView *v18;
  void *v19;
  PGButtonView *actionButton;
  void *v21;
  void *v22;
  PGButtonView *v23;
  void *v24;
  PGButtonView *v25;
  void *v26;
  PGButtonView *restoreButton;
  void *v28;
  PGButtonView *v29;
  void *v30;
  PGButtonView *v31;
  void *v32;
  PGButtonView *v33;
  void *v34;
  PGButtonView *v35;
  void *v36;
  PGButtonView *v37;
  void *v38;
  PGButtonView *v39;
  void *v40;
  PGButtonView *v41;
  void *v42;
  PGButtonView *v43;
  void *v44;
  PGButtonView *v45;
  void *v46;
  PGButtonView *v47;
  void *v48;
  int v49;
  double v50;
  double v51;
  int v52;
  int v53;
  PGProgressIndicator *progressIndicator;
  void *v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;

  v74 = a3;
  -[PGControlsViewModel values](self->_viewModel, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setHidden:](self->_restoreButton, "setHidden:", objc_msgSend(v4, "includesRestoreButton") ^ 1);
  -[PGButtonView setHidden:](self->_skipBackButton, "setHidden:", objc_msgSend(v4, "includesSkipBackButton") ^ 1);
  -[PGButtonView setHidden:](self->_actionButton, "setHidden:", objc_msgSend(v4, "includesActionButton") ^ 1);
  -[PGButtonView setHidden:](self->_skipForwardButton, "setHidden:", objc_msgSend(v4, "includesSkipForwardButton") ^ 1);
  -[PGButtonView setHidden:](self->_cancelButton, "setHidden:", objc_msgSend(v4, "includesCancelButton") ^ 1);
  -[PGButtonView setHidden:](self->_liveIndicatorBadgeButton, "setHidden:", objc_msgSend(v4, "includesLiveIndicatorBadge") ^ 1);
  -[PGButtonView setEnabled:](self->_skipBackButton, "setEnabled:", objc_msgSend(v4, "isSkipBackButtonEnabled"));
  -[PGButtonView setEnabled:](self->_actionButton, "setEnabled:", objc_msgSend(v4, "isActionButtonEnabled"));
  -[PGButtonView setEnabled:](self->_skipForwardButton, "setEnabled:", objc_msgSend(v4, "isSkipForwardButtonEnabled"));
  cancelButton = self->_cancelButton;
  objc_msgSend(v4, "cancelButtonImageTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PGButtonView setTintColor:](cancelButton, "setTintColor:", v6);
  }
  else
  {
    -[PGButtonView enabledTintColor](self->_cancelButton, "enabledTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGButtonView setTintColor:](cancelButton, "setTintColor:", v7);

  }
  v8 = self->_cancelButton;
  objc_msgSend(v4, "cancelButtonBackgroundTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMaterialView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  skipBackButton = self->_skipBackButton;
  objc_msgSend(v4, "skipBackButtonImageTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PGButtonView setTintColor:](skipBackButton, "setTintColor:", v11);
  }
  else
  {
    -[PGButtonView enabledTintColor](self->_actionButton, "enabledTintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGButtonView setTintColor:](skipBackButton, "setTintColor:", v12);

  }
  v13 = self->_skipBackButton;
  objc_msgSend(v4, "skipBackButtonBackgroundTintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMaterialView setBackgroundColor:](v13, "setBackgroundColor:", v14);

  skipForwardButton = self->_skipForwardButton;
  objc_msgSend(v4, "skipForwardButtonImageTintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[PGButtonView setTintColor:](skipForwardButton, "setTintColor:", v16);
  }
  else
  {
    -[PGButtonView enabledTintColor](self->_actionButton, "enabledTintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGButtonView setTintColor:](skipForwardButton, "setTintColor:", v17);

  }
  v18 = self->_skipForwardButton;
  objc_msgSend(v4, "skipForwardButtonBackgroundTintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMaterialView setBackgroundColor:](v18, "setBackgroundColor:", v19);

  actionButton = self->_actionButton;
  objc_msgSend(v4, "actionButtonImageTintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[PGButtonView setTintColor:](actionButton, "setTintColor:", v21);
  }
  else
  {
    -[PGButtonView enabledTintColor](self->_actionButton, "enabledTintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGButtonView setTintColor:](actionButton, "setTintColor:", v22);

  }
  v23 = self->_actionButton;
  objc_msgSend(v4, "actionButtonBackgroundTintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMaterialView setBackgroundColor:](v23, "setBackgroundColor:", v24);

  v25 = self->_cancelButton;
  objc_msgSend(v4, "cancelButtonSystemImageName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setSystemImageName:](v25, "setSystemImageName:", v26);

  restoreButton = self->_restoreButton;
  objc_msgSend(v4, "restoreButtonSystemImageName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setSystemImageName:](restoreButton, "setSystemImageName:", v28);

  v29 = self->_skipBackButton;
  objc_msgSend(v4, "skipBackButtonSystemImageName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setSystemImageName:](v29, "setSystemImageName:", v30);

  v31 = self->_actionButton;
  objc_msgSend(v4, "actionButtonSystemImageName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setSystemImageName:](v31, "setSystemImageName:", v32);

  v33 = self->_skipForwardButton;
  objc_msgSend(v4, "skipForwardButtonSystemImageName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setSystemImageName:](v33, "setSystemImageName:", v34);

  v35 = self->_restoreButton;
  -[PGButtonView enabledTintColor](v35, "enabledTintColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setTintColor:](v35, "setTintColor:", v36);

  v37 = self->_cancelButton;
  objc_msgSend(v4, "cancelButtonAccessibilityIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setAccessibilityIdentifier:](v37, "setAccessibilityIdentifier:", v38);

  v39 = self->_restoreButton;
  objc_msgSend(v4, "restoreButtonAccessibilityIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setAccessibilityIdentifier:](v39, "setAccessibilityIdentifier:", v40);

  v41 = self->_skipBackButton;
  objc_msgSend(v4, "skipBackButtonAccessibilityIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setAccessibilityIdentifier:](v41, "setAccessibilityIdentifier:", v42);

  v43 = self->_actionButton;
  objc_msgSend(v4, "actionButtonAccessibilityIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setAccessibilityIdentifier:](v43, "setAccessibilityIdentifier:", v44);

  v45 = self->_skipForwardButton;
  objc_msgSend(v4, "skipForwardButtonAccessibilityIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setAccessibilityIdentifier:](v45, "setAccessibilityIdentifier:", v46);

  v47 = self->_cancelButton;
  objc_msgSend(v4, "cancelButtonCustomImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setImage:](v47, "setImage:", v48);

  -[PGMaterialView setBackdropHidden:](self->_cancelButton, "setBackdropHidden:", objc_msgSend(v4, "cancelButtonWantsBackground") ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_restoreButton, "setBackdropHidden:", objc_msgSend(v4, "restoreButtonWantsBackground") ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_skipBackButton, "setBackdropHidden:", objc_msgSend(v4, "actionButtonsWantBackground") ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_actionButton, "setBackdropHidden:", objc_msgSend(v4, "actionButtonsWantBackground") ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_skipForwardButton, "setBackdropHidden:", objc_msgSend(v4, "actionButtonsWantBackground") ^ 1);
  v49 = objc_msgSend(v4, "actionButtonsWantBackground");
  if (v49)
    v50 = 23.0;
  else
    v50 = 21.0;
  if (v49)
    v51 = 23.0;
  else
    v51 = 30.0;
  -[PGButtonView setGlyphSize:](self->_skipBackButton, "setGlyphSize:", v50);
  -[PGButtonView setGlyphSize:](self->_actionButton, "setGlyphSize:", v51);
  -[PGButtonView setGlyphSize:](self->_skipForwardButton, "setGlyphSize:", v50);
  -[PGProgressIndicator setHidden:](self->_progressIndicator, "setHidden:", objc_msgSend(v4, "includesProgressBar") ^ 1);
  -[PGControlsView updateProgress](self, "updateProgress");
  v52 = objc_msgSend(v4, "isPrerollActive");
  v53 = v52 ^ -[PGPrerollIndicatorView isHidden](self->_prerollIndicatorView, "isHidden");
  if ((v53 & 1) == 0)
  {
    -[PGPrerollIndicatorView setHidden:](self->_prerollIndicatorView, "setHidden:", v52 ^ 1u);
    progressIndicator = self->_progressIndicator;
    objc_msgSend(v4, "prerollTintColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGProgressIndicator setCustomElapsedTrackTintColor:](progressIndicator, "setCustomElapsedTrackTintColor:", v55);

  }
  v56 = objc_msgSend(v74, "cancelButtonWantsBackground");
  v57 = v56 ^ objc_msgSend(v4, "cancelButtonWantsBackground") | v53 ^ 1;
  v58 = objc_msgSend(v74, "restoreButtonWantsBackground");
  v59 = v58 ^ objc_msgSend(v4, "restoreButtonWantsBackground");
  v60 = objc_msgSend(v74, "actionButtonsWantBackground");
  v61 = v60 ^ objc_msgSend(v4, "actionButtonsWantBackground");
  v62 = objc_msgSend(v74, "includesLiveIndicatorBadge");
  v63 = v62 ^ objc_msgSend(v4, "includesLiveIndicatorBadge");
  v64 = objc_msgSend(v74, "includesContentLoadingIndicator");
  v65 = v64 ^ objc_msgSend(v4, "includesContentLoadingIndicator") | v63 | v61 | v59 | v57;
  objc_msgSend(v74, "cancelButtonCustomText");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelButtonCustomText");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66 != v67)
  {
    objc_msgSend(v74, "cancelButtonCustomText");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelButtonCustomText");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "isEqualToString:", v69) ^ 1;

    v65 |= v70;
  }

  objc_msgSend(v74, "cancelButtonCustomImage");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelButtonCustomImage");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71 != v72 || v65)
  {
    -[PGControlsView setNeedsLayout](self, "setNeedsLayout");
    -[PGControlsView layoutIfNeeded](self, "layoutIfNeeded");
  }
  -[PGPrerollIndicatorView updateValues](self->_prerollIndicatorView, "updateValues");
  -[UIView setHidden:](self->_dimmingView, "setHidden:", -[PGControlsView _showsDimmingView](self, "_showsDimmingView") ^ 1);
  -[PGControlsView PG_backdropGroupLeader](self, "PG_backdropGroupLeader");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "updateEffects");

}

- (void)updateProgress
{
  PGProgressIndicator *progressIndicator;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGFloat Width;
  PGDisplayLink *v10;
  unint64_t v11;
  PGDisplayLink *displayLinkForProgressUpdates;
  PGProgressIndicator *v13;
  id v14;
  CGRect v15;

  progressIndicator = self->_progressIndicator;
  -[PGControlsViewModel playbackState](self->_viewModel, "playbackState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedProgress");
  -[PGProgressIndicator setProgress:](progressIndicator, "setProgress:");

  if (-[PGControlsView prefersControlsHidden](self, "prefersControlsHidden")
    || (-[PGControlsView window](self, "window"), v5 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v5,
                                                  !v5))
  {
    displayLinkForProgressUpdates = self->_displayLinkForProgressUpdates;
    v11 = 0;
  }
  else
  {
    -[PGControlsView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v8 = v7;

    -[PGProgressIndicator frame](self->_progressIndicator, "frame");
    Width = CGRectGetWidth(v15);
    v10 = self->_displayLinkForProgressUpdates;
    v11 = -[PGControlsViewModel recommendedUpdateCadenceForProgressBarWithWidthInPixels:](self->_viewModel, "recommendedUpdateCadenceForProgressBarWithWidthInPixels:", fmax(v8, 1.0) * Width);
    displayLinkForProgressUpdates = v10;
  }
  -[PGDisplayLink setPreferredFramesPerSecond:](displayLinkForProgressUpdates, "setPreferredFramesPerSecond:", v11);
  v13 = self->_progressIndicator;
  -[PGControlsViewModel values](self->_viewModel, "values");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PGProgressIndicator setIncludesWaitingToPlayIndicator:](v13, "setIncludesWaitingToPlayIndicator:", objc_msgSend(v14, "includesWaitingToPlayIndicator"));

}

- (void)updateControlsAlpha
{
  double v3;
  UIView **p_dimmingView;
  void *v5;
  int v6;

  if (-[PGControlsView prefersControlsHidden](self, "prefersControlsHidden"))
  {
    v3 = 0.0;
    -[PGLayoutContainerView setAlpha:](self->_hidableItemsLayoutContainerView, "setAlpha:", 0.0);
    p_dimmingView = &self->_dimmingView;
  }
  else
  {
    p_dimmingView = &self->_dimmingView;
    -[UIView setHidden:](self->_dimmingView, "setHidden:", -[PGControlsView _showsDimmingView](self, "_showsDimmingView") ^ 1);
    -[PGLayoutContainerView setHidden:](self->_hidableItemsLayoutContainerView, "setHidden:", 0);
    v3 = 1.0;
    -[PGLayoutContainerView setAlpha:](self->_hidableItemsLayoutContainerView, "setAlpha:", 1.0);
  }
  -[UIView setAlpha:](*p_dimmingView, "setAlpha:", v3);
  -[PGControlsViewModel values](self->_viewModel, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPrerollActive");

  if (v6)
  {
    -[PGControlsView setNeedsLayout](self, "setNeedsLayout");
    -[PGControlsView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)updateControlsHidden
{
  int v3;
  id v4;

  -[PGControlsView updateProgress](self, "updateProgress");
  v3 = -[PGLayoutContainerView isHidden](self->_hidableItemsLayoutContainerView, "isHidden");
  -[PGLayoutContainerView setHidden:](self->_hidableItemsLayoutContainerView, "setHidden:", -[PGControlsView prefersControlsHidden](self, "prefersControlsHidden"));
  if (v3 != -[PGLayoutContainerView isHidden](self->_hidableItemsLayoutContainerView, "isHidden"))
  {
    -[PGControlsView PG_backdropGroupLeader](self, "PG_backdropGroupLeader");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateEffects");

  }
}

- (void)setPrefersControlsHidden:(BOOL)a3
{
  id v4;

  if (self->_prefersControlsHidden != a3)
  {
    self->_prefersControlsHidden = a3;
    -[PGControlsView updateProgress](self, "updateProgress");
    -[PGControlsView PG_backdropGroupLeader](self, "PG_backdropGroupLeader");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateEffects");

  }
}

- (id)PG_backdropGroupLeader
{
  return self->_captureOnlyView;
}

- (BOOL)PG_preferredVisibilityForView:(id)a3
{
  PGButtonView *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (PGButtonView *)a3;
  v5 = -[PGButtonView isHidden](v4, "isHidden");
  if (!-[PGControlsView prefersControlsHidden](self, "prefersControlsHidden"))
  {
    -[PGControlsViewModel values](self->_viewModel, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (self->_cancelButton == v4)
    {
      v9 = objc_msgSend(v8, "includesCancelButton");
    }
    else if (self->_restoreButton == v4)
    {
      v9 = objc_msgSend(v8, "includesRestoreButton");
    }
    else if (self->_skipBackButton == v4)
    {
      v9 = objc_msgSend(v8, "includesSkipBackButton");
    }
    else if (self->_actionButton == v4)
    {
      v9 = objc_msgSend(v8, "includesActionButton");
    }
    else
    {
      if (self->_skipForwardButton != v4)
        goto LABEL_16;
      v9 = objc_msgSend(v8, "includesSkipForwardButton");
    }
    LOBYTE(v5) = v9;
    goto LABEL_16;
  }
  if (-[PGButtonView isDescendantOfView:](v4, "isDescendantOfView:", self->_prerollIndicatorView))
  {
    -[PGControlsViewModel values](self->_viewModel, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prerollAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = v7 != 0;

LABEL_16:
    goto LABEL_17;
  }
  v5 &= ~-[PGButtonView isDescendantOfView:](v4, "isDescendantOfView:", self);
LABEL_17:

  return v5;
}

- (void)layoutSubviews
{
  PGCABackdropLayerView *captureOnlyView;
  UIView *dimmingView;
  PGLayoutContainerView *hidableItemsLayoutContainerView;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double Width;
  double Height;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  PGButtonView *restoreButton;
  double v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v36;
  double v37;
  _BOOL4 v38;
  double v39;
  PGButtonView *cancelButton;
  void *v41;
  void *v42;
  PGButtonView *v43;
  PGButtonView *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double MaxX;
  void *v54;
  int v55;
  void *v56;
  PGButtonView *liveIndicatorBadgeButton;
  void *v58;
  PGButtonView *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  PGButtonView *v68;
  double MinX;
  CGFloat v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  double v79;
  double v80;
  double MidX;
  double v82;
  double v83;
  PGButtonView *skipBackButton;
  PGButtonView *actionButton;
  PGButtonView *skipForwardButton;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  double v94;
  double v95;
  void *v96;
  int v97;
  UIActivityIndicatorView *v98;
  UIActivityIndicatorView *contentLoadingIndicator;
  id v100;
  UIView *v101;
  UIView *contentLoadingIndicatorContainerView;
  UIView *v103;
  void *v104;
  UIView *v105;
  UIView *v106;
  UIActivityIndicatorView *v107;
  UIActivityIndicatorView *v108;
  UIActivityIndicatorView *v109;
  __int128 v110;
  double v111;
  __int128 v112;
  __int128 v113;
  BOOL IsIdentity;
  CGAffineTransform v115;
  CGAffineTransform v116;
  CGAffineTransform v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  objc_super v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  _BYTE v127[128];
  uint64_t v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v128 = *MEMORY[0x1E0C80C00];
  v122.receiver = self;
  v122.super_class = (Class)PGControlsView;
  -[PGControlsView layoutSubviews](&v122, sel_layoutSubviews);
  captureOnlyView = self->_captureOnlyView;
  -[PGControlsView bounds](self, "bounds");
  -[PGCABackdropLayerView setFrame:](captureOnlyView, "setFrame:");
  dimmingView = self->_dimmingView;
  -[PGControlsView bounds](self, "bounds");
  -[UIView setFrame:](dimmingView, "setFrame:");
  hidableItemsLayoutContainerView = self->_hidableItemsLayoutContainerView;
  -[PGControlsView bounds](self, "bounds");
  -[PGLayoutContainerView setFrame:](hidableItemsLayoutContainerView, "setFrame:");
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v6 = self->_allButtons;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v119;
    v112 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v113 = *MEMORY[0x1E0C9BAA8];
    v110 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v119 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        *(_OWORD *)&v117.a = v113;
        *(_OWORD *)&v117.c = v112;
        *(_OWORD *)&v117.tx = v110;
        objc_msgSend(v11, "setTransform:", &v117);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
    }
    while (v8);
  }

  -[PGControlsViewModel preferredMinimumWidth](self->_viewModel, "preferredMinimumWidth");
  v13 = v12;
  -[PGControlsView bounds](self, "bounds");
  Width = CGRectGetWidth(v129);
  -[PGControlsView bounds](self, "bounds");
  Height = CGRectGetHeight(v130);
  v16 = Width / v13;
  if (Width / v13 > 1.0)
    v16 = 1.0;
  v17 = Height / 110.0;
  if (Height / 110.0 > 1.0)
    v17 = 1.0;
  if (v16 >= v17)
    v18 = v17;
  else
    v18 = v16;
  v19 = Height / 136.0;
  memset(&v117.c, 0, 32);
  if (v19 <= 1.0)
    v20 = v19;
  else
    v20 = 1.0;
  *(_OWORD *)&v117.a = 0uLL;
  CGAffineTransformMakeScale(&v117, v18, v18);
  memset(&v116, 0, sizeof(v116));
  CGAffineTransformMakeScale(&v116, v18 * 0.5 + 0.5, v18 * 0.5 + 0.5);
  v115 = v117;
  IsIdentity = CGAffineTransformIsIdentity(&v115);
  restoreButton = self->_restoreButton;
  -[PGControlsView bounds](self, "bounds");
  v22 = 32.0;
  -[PGButtonView setFrame:](restoreButton, "setFrame:", CGRectGetMaxX(v131) + -32.0 + -9.0, 9.0, 32.0, 25.0);
  v23 = -[PGMaterialView isBackdropHidden](self->_restoreButton, "isBackdropHidden");
  v24 = 15.0;
  if (!v23)
    v24 = 13.0;
  -[PGButtonView setGlyphSize:](self->_restoreButton, "setGlyphSize:", v24);
  -[PGControlsViewModel values](self->_viewModel, "values");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cancelButtonCustomText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGControlsViewModel values](self->_viewModel, "values");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cancelButtonCustomText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0CEB5E8]);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = 12.5;
    if (v29)
    {
      v125 = *MEMORY[0x1E0CEA098];
      v126 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sizeWithAttributes:", v32);
      v34 = v33;

      _NF = v18 > 0.0 && v18 < 1.0;
      v36 = Width;
      if (_NF)
        v36 = Width * (1.0 / v18);
      v37 = v36 + -27.0 + -32.0;
      if (v34 + 27.0 + 6.0 >= v37)
        v22 = v37;
      else
        v22 = v34 + 27.0 + 6.0;
    }
    else
    {
      v22 = 32.0;
    }
  }
  else
  {
    v30 = 0;
    v31 = 6.0;
  }
  v38 = -[PGMaterialView isBackdropHidden](self->_cancelButton, "isBackdropHidden");
  v39 = 17.0;
  if (!v38)
    v39 = 13.0;
  if (v26)
    v39 = 11.0;
  -[PGButtonView setGlyphSize:](self->_cancelButton, "setGlyphSize:", v39);
  -[PGButtonView setText:](self->_cancelButton, "setText:", v28);
  -[PGButtonView setFont:](self->_cancelButton, "setFont:", v30);
  cancelButton = self->_cancelButton;
  -[PGControlsViewModel values](self->_viewModel, "values");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "cancelButtonCustomImage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGButtonView setImage:](cancelButton, "setImage:", v42);

  -[PGButtonView setFrame:](self->_cancelButton, "setFrame:", 9.0, 9.0, v22, 25.0);
  -[PGMaterialView _setContinuousCornerRadius:](self->_cancelButton, "_setContinuousCornerRadius:", v31);
  if (!IsIdentity)
  {
    v43 = self->_cancelButton;
    v115 = v117;
    -[PGButtonView setTransform:](v43, "setTransform:", &v115);
    __asm { FMOV            V3.2D, #9.0 }
    -[PGButtonView setFrameOrigin:](self->_cancelButton, "setFrameOrigin:", vaddq_f64(*(float64x2_t *)&v116.tx, vmlaq_f64(vmulq_f64(*(float64x2_t *)&v116.c, _Q3), _Q3, *(float64x2_t *)&v116.a)));
    v48 = self->_restoreButton;
    v115 = v117;
    -[PGButtonView setTransform:](v48, "setTransform:", &v115);
    -[PGButtonView origin](self->_cancelButton, "origin");
    v50 = v49;
    v52 = v51;
    -[PGControlsView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v132);
    -[PGButtonView frame](self->_restoreButton, "frame");
    -[PGButtonView setFrameOrigin:](self->_restoreButton, "setFrameOrigin:", MaxX - (v50 + CGRectGetWidth(v133)), v52);
  }
  -[PGControlsView _progressIndicatorFrameWithScaling:](self, "_progressIndicatorFrameWithScaling:", v18);
  -[PGProgressIndicator setFrame:](self->_progressIndicator, "setFrame:");
  -[PGControlsView updateProgress](self, "updateProgress");
  -[PGControlsView _prerollIndicatorFrameWithScaling:](self, "_prerollIndicatorFrameWithScaling:", v18);
  -[PGPrerollIndicatorView setFrame:](self->_prerollIndicatorView, "setFrame:");
  -[PGControlsViewModel values](self->_viewModel, "values");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "includesLiveIndicatorBadge");

  if (v55)
  {
    -[PGButtonView text](self->_liveIndicatorBadgeButton, "text");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v56)
    {
      liveIndicatorBadgeButton = self->_liveIndicatorBadgeButton;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0CEB5E8]);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGButtonView setFont:](liveIndicatorBadgeButton, "setFont:", v58);

      v59 = self->_liveIndicatorBadgeButton;
      PGLocalizedString(CFSTR("LIVE_INDICATOR_BADGE"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGButtonView setText:](v59, "setText:", v60);

    }
    -[PGButtonView text](self->_liveIndicatorBadgeButton, "text");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = *MEMORY[0x1E0CEA098];
    -[PGButtonView font](self->_liveIndicatorBadgeButton, "font");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v62;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "sizeWithAttributes:", v63);

    v64 = *MEMORY[0x1E0C9D538];
    v65 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    UISizeRoundToScale();
    -[PGButtonView setFrame:](self->_liveIndicatorBadgeButton, "setFrame:", v64, v65, v66, v67);
    v68 = self->_liveIndicatorBadgeButton;
    v115 = v117;
    -[PGButtonView setTransform:](v68, "setTransform:", &v115);
    -[PGProgressIndicator frame](self->_progressIndicator, "frame");
    MinX = CGRectGetMinX(v134);
    -[PGProgressIndicator frame](self->_progressIndicator, "frame");
    v70 = CGRectGetMinY(v135) + (v18 * 0.5 + 0.5) * -6.0;
    -[PGButtonView frame](self->_liveIndicatorBadgeButton, "frame");
    -[PGButtonView setFrameOrigin:](self->_liveIndicatorBadgeButton, "setFrameOrigin:", MinX, v70 - CGRectGetHeight(v136));
  }
  -[PGControlsViewModel values](self->_viewModel, "values");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v71, "actionButtonsWantBackground"))
    v72 = 52.0;
  else
    v72 = 48.0;

  v111 = fmin(fmax(v20 * ((Width + v72 * -3.0) * 0.25), 12.0), 20.0);
  v73 = v72 + v111;
  -[PGButtonView glyphSize](self->_cancelButton, "glyphSize");
  -[PGButtonView glyphSize](self->_restoreButton, "glyphSize");
  -[PGControlsViewModel values](self->_viewModel, "values");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v74, "includesLiveIndicatorBadge"))
    -[PGButtonView frame](self->_liveIndicatorBadgeButton, "frame");
  else
    -[PGProgressIndicator frame](self->_progressIndicator, "frame");
  CGRectGetMinY(*(CGRect *)&v75);

  UIRoundToScale();
  v80 = v79;
  -[PGControlsView bounds](self, "bounds");
  MidX = CGRectGetMidX(v137);
  v82 = MidX - v72 * 0.5;
  v83 = v80 - v72 * 0.5;
  -[PGButtonView setFrame:](self->_skipBackButton, "setFrame:", v82 - v73, v83, v72, v72);
  -[PGButtonView setFrame:](self->_actionButton, "setFrame:", v82, v83, v72, v72);
  -[PGButtonView setFrame:](self->_skipForwardButton, "setFrame:", v73 + v82, v83 + 0.0, v72, v72);
  if (!IsIdentity)
  {
    -[PGControlsView bounds](self, "bounds");
    if (!CGRectIsEmpty(v138))
    {
      skipBackButton = self->_skipBackButton;
      v115 = v117;
      -[PGButtonView setTransform:](skipBackButton, "setTransform:", &v115);
      actionButton = self->_actionButton;
      v115 = v117;
      -[PGButtonView setTransform:](actionButton, "setTransform:", &v115);
      skipForwardButton = self->_skipForwardButton;
      v115 = v117;
      -[PGButtonView setTransform:](skipForwardButton, "setTransform:", &v115);
      -[PGButtonView setCenter:](self->_actionButton, "setCenter:", MidX, v80);
      -[PGButtonView frame](self->_actionButton, "frame");
      v87 = CGRectGetWidth(v139) + v111 * v18;
      -[PGButtonView center](self->_actionButton, "center");
      v89 = v88;
      v91 = v90 - v87;
      -[PGButtonView center](self->_actionButton, "center");
      v93 = v87 + v92;
      v95 = v94 + 0.0;
      -[PGButtonView setCenter:](self->_skipBackButton, "setCenter:", v91, v89);
      -[PGButtonView setCenter:](self->_skipForwardButton, "setCenter:", v93, v95);
    }
  }
  -[PGControlsViewModel values](self->_viewModel, "values");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "includesContentLoadingIndicator");

  if ((v97 & 1) != 0)
  {
    if (!self->_contentLoadingIndicator)
    {
      v98 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
      contentLoadingIndicator = self->_contentLoadingIndicator;
      self->_contentLoadingIndicator = v98;

      v100 = objc_alloc(MEMORY[0x1E0CEABB0]);
      -[PGControlsView bounds](self, "bounds");
      v101 = (UIView *)objc_msgSend(v100, "initWithFrame:");
      contentLoadingIndicatorContainerView = self->_contentLoadingIndicatorContainerView;
      self->_contentLoadingIndicatorContainerView = v101;

      -[PGLayoutContainerView insertSubview:atIndex:](self->_hidableItemsLayoutContainerView, "insertSubview:atIndex:", self->_contentLoadingIndicatorContainerView, 0);
      -[UIView addSubview:](self->_contentLoadingIndicatorContainerView, "addSubview:", self->_contentLoadingIndicator);
      v103 = self->_contentLoadingIndicatorContainerView;
      objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v103, "setBackgroundColor:", v104);

      v105 = self->_contentLoadingIndicatorContainerView;
      -[UIView _continuousCornerRadius](self->_dimmingView, "_continuousCornerRadius");
      -[UIView _setContinuousCornerRadius:](v105, "_setContinuousCornerRadius:");
    }
    v106 = self->_contentLoadingIndicatorContainerView;
    -[PGControlsView bounds](self, "bounds");
    -[UIView setFrame:](v106, "setFrame:");
    v107 = self->_contentLoadingIndicator;
    v115 = v117;
    -[UIActivityIndicatorView setTransform:](v107, "setTransform:", &v115);
    v108 = self->_contentLoadingIndicator;
    -[UIView bounds](self->_contentLoadingIndicatorContainerView, "bounds");
    UIRectGetCenter();
    -[UIActivityIndicatorView setCenter:](v108, "setCenter:");
  }
  -[UIView setHidden:](self->_contentLoadingIndicatorContainerView, "setHidden:", v97 ^ 1u);
  if ((v97 ^ 1) == -[UIActivityIndicatorView isAnimating](self->_contentLoadingIndicator, "isAnimating"))
  {
    v109 = self->_contentLoadingIndicator;
    if (v97)
      -[UIActivityIndicatorView startAnimating](v109, "startAnimating");
    else
      -[UIActivityIndicatorView stopAnimating](v109, "stopAnimating");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGControlsView;
  -[PGControlsView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PGControlsView updateProgress](self, "updateProgress");
  if (-[PGControlsView _isInAWindow](self, "_isInAWindow"))
  {
    -[PGControlsView PG_backdropGroupLeader](self, "PG_backdropGroupLeader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateEffects");

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PGControlsView *v5;
  PGControlsView *v6;
  PGControlsView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGControlsView;
  -[PGLayoutContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PGControlsView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (void)buttonViewDidReceiveTouchUpInside:(id)a3
{
  PGButtonView *v4;
  PGButtonView *v5;

  v4 = (PGButtonView *)a3;
  if (self->_restoreButton == v4)
  {
    v5 = v4;
    -[PGControlsViewModel handleRestoreButtonTapped](self->_viewModel, "handleRestoreButtonTapped");
    goto LABEL_11;
  }
  if (self->_actionButton == v4)
  {
    v5 = v4;
    -[PGControlsViewModel handleActionButtonTapped](self->_viewModel, "handleActionButtonTapped");
    goto LABEL_11;
  }
  if (self->_skipBackButton == v4)
  {
    v5 = v4;
    -[PGControlsViewModel handleSkipBackButtonTapped](self->_viewModel, "handleSkipBackButtonTapped");
    goto LABEL_11;
  }
  if (self->_skipForwardButton == v4)
  {
    v5 = v4;
    -[PGControlsViewModel handleSkipForwardButtonTapped](self->_viewModel, "handleSkipForwardButtonTapped");
    goto LABEL_11;
  }
  if (self->_cancelButton == v4)
  {
    v5 = v4;
    -[PGControlsViewModel handleCancelButtonTapped](self->_viewModel, "handleCancelButtonTapped");
LABEL_11:
    v4 = v5;
  }

}

- (CGRect)buttonView:(id)a3 imageRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  PGButtonView *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = (PGButtonView *)a3;
  if (self->_cancelButton == v10)
  {
    -[PGControlsViewModel values](self->_viewModel, "values");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelButtonCustomImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PGButtonView bounds](v10, "bounds");
      width = CGRectGetHeight(v17) + -4.0;
      -[PGButtonView bounds](v10, "bounds");
      height = CGRectGetHeight(v18) + -4.0;
      y = 2.0;
      x = 2.0;
    }
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)buttonView:(id)a3 titleRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  PGButtonView *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = (PGButtonView *)a3;
  if (self->_cancelButton == v10)
  {
    -[PGControlsViewModel values](self->_viewModel, "values");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelButtonCustomText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PGButtonView bounds](v10, "bounds");
      x = CGRectGetMaxX(v17) - width + -6.0;
    }
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIEdgeInsets)buttonView:(id)a3 contentEdgeInsetsForProposedInsets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  double left;
  CGFloat top;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[PGControlsViewModel values](self->_viewModel, "values", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelButtonCustomImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 2.0;
  else
    v10 = left;
  v11 = top;
  v12 = bottom;
  v13 = right;
  result.right = v13;
  result.bottom = v12;
  result.left = v10;
  result.top = v11;
  return result;
}

- (CGRect)_prerollIndicatorFrameWithScaling:(double)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat MinX;
  double MaxY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat rect;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[PGControlsView _progressIndicatorFrameWithScaling:](self, "_progressIndicatorFrameWithScaling:", a3);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  v9 = CGRectGetWidth(v21);
  +[PGPrerollIndicatorView preferredHeight](PGPrerollIndicatorView, "preferredHeight");
  v19 = a3;
  v11 = v10 * a3;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxY = CGRectGetMaxY(v23);
  v24.origin.x = MinX;
  v24.origin.y = rect;
  v24.size.width = v9;
  v24.size.height = v11;
  v14 = MaxY - CGRectGetHeight(v24);
  if (!-[PGControlsView prefersControlsHidden](self, "prefersControlsHidden"))
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v14 = v14 - (CGRectGetHeight(v25) + (v19 * 0.5 + 0.5) * 6.0);
  }
  v15 = MinX;
  v16 = v14;
  v17 = v9;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_progressIndicatorFrameWithScaling:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  -[PGControlsView bounds](self, "bounds");
  -[PGControlsView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");

  -[PGControlsView bounds](self, "bounds");
  CGRectGetMaxY(v15);
  UIPointRoundToViewScale();
  v6 = v5;
  v8 = v7;
  UISizeRoundToViewScale();
  v10 = v9;
  v12 = v11;
  v13 = v6;
  v14 = v8;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_showsDimmingView
{
  void *v3;
  char v4;
  void *v5;

  -[PGControlsViewModel values](self->_viewModel, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "actionButtonsWantBackground") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[PGControlsViewModel values](self->_viewModel, "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "includesActionButton");

  }
  return v4 & ~-[PGControlsView prefersControlsHidden](self, "prefersControlsHidden");
}

- (BOOL)prefersControlsHidden
{
  return self->_prefersControlsHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkForProgressUpdates, 0);
  objc_storeStrong((id *)&self->_groupNameBase, 0);
  objc_storeStrong((id *)&self->_allButtons, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_prerollIndicatorView, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_captureOnlyView, 0);
  objc_storeStrong((id *)&self->_hidableItemsLayoutContainerView, 0);
  objc_storeStrong((id *)&self->_contentLoadingIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_contentLoadingIndicator, 0);
  objc_storeStrong((id *)&self->_liveIndicatorBadgeButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_skipBackButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_restoreButton, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
