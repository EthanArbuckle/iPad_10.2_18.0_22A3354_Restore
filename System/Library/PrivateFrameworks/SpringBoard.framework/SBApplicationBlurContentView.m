@implementation SBApplicationBlurContentView

- (SBApplicationBlurContentView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationBlurContentView.m"), 90, CFSTR("initWithCoder: is unavailable for this class."));

  return -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](self, "initWithFrame:bundleIdentifier:targetViewToBlur:", 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationBlurContentView.m"), 95, CFSTR("initWithFrame: is unavailable for this class."));

  return -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](self, "initWithFrame:bundleIdentifier:targetViewToBlur:", 0, 0, x, y, width, height);
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 targetViewToBlur:(id)a5
{
  return -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:](self, "initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0);
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 targetViewToBlur:(id)a5 initialIconScale:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SBApplicationBlurContentView *v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a5;
  v14 = a4;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applicationIconForBundleIdentifier:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:](self, "initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:", v14, v17, v13, x, y, width, height, a6);
  return v18;
}

- (SBApplicationBlurContentView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4 icon:(id)a5 targetViewToBlur:(id)a6 initialIconScale:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  void *v19;
  SBApplicationBlurContentView *v20;
  SBApplicationBlurContentView *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double *p_width;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *mapStateToCompletionBlocks;
  uint64_t v36;
  NSString *bundleIdentifier;
  id v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  UIView *unblurredRealSnapshotView;
  SBApplicationBlurContentViewBackdropSettings *v44;
  UIView *v45;
  UIView *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  UIView *liveBlurView;
  UIView *v52;
  SBApplicationBlurSnapshotGenerationContainerView *v53;
  SBApplicationBlurSnapshotGenerationContainerView *snapshotGenerationContainerView;
  SBApplicationBlurSnapshotGenerationContainerView *v55;
  uint64_t v56;
  UIView *unblurredCopySnapshotView;
  uint64_t v58;
  UIView *blurredSnapshotView;
  SBSceneViewAppIconView *v60;
  SBSceneViewAppIconView *iconView;
  void *v63;
  void *v64;
  double v65;
  objc_super v66;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v18;
  if (v16)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationBlurContentView.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationBlurContentView.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetViewToBlur"));

LABEL_3:
  v66.receiver = self;
  v66.super_class = (Class)SBApplicationBlurContentView;
  v20 = -[SBApplicationBlurContentView initWithFrame:](&v66, sel_initWithFrame_, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    -[SBApplicationBlurContentView bounds](v20, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_storeStrong((id *)&v21->_targetViewToBlur, a6);
    p_width = &v21->_targetViewOriginalSize.width;
    objc_msgSend(v19, "bounds");
    v21->_targetViewOriginalSize.width = v31;
    v21->_targetViewOriginalSize.height = v32;
    v21->_iconViewScale = a7;
    -[UIView superview](v21->_targetViewToBlur, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      -[SBApplicationBlurContentView addSubview:](v21, "addSubview:", v21->_targetViewToBlur);
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapStateToCompletionBlocks = v21->_mapStateToCompletionBlocks;
    v21->_mapStateToCompletionBlocks = v34;

    v36 = objc_msgSend(v16, "copy");
    bundleIdentifier = v21->_bundleIdentifier;
    v21->_bundleIdentifier = (NSString *)v36;

    v38 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v65 = *MEMORY[0x1E0C9D648];
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v42 = objc_msgSend(v38, "initWithFrame:");
    unblurredRealSnapshotView = v21->_unblurredRealSnapshotView;
    v21->_unblurredRealSnapshotView = (UIView *)v42;

    -[UIView setContentMode:](v21->_unblurredRealSnapshotView, "setContentMode:", 0);
    v44 = -[_UIBackdropViewSettings initWithDefaultValues]([SBApplicationBlurContentViewBackdropSettings alloc], "initWithDefaultValues");
    v45 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithFrame:settings:", v44, v23, v25, v27, v29);
    v46 = v45;
    v47 = *p_width;
    if (*p_width < v21->_targetViewOriginalSize.height)
      v47 = v21->_targetViewOriginalSize.height;
    v48 = v29;
    v49 = fmin(fmax(v47 * 85.0 * 0.0009765625, 20.0), 85.0);
    -[UIView outputSettings](v45, "outputSettings");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setBlurRadius:", v49);

    liveBlurView = v21->_liveBlurView;
    v21->_liveBlurView = v46;
    v52 = v46;

    v53 = -[SBApplicationBlurSnapshotGenerationContainerView initWithFrame:]([SBApplicationBlurSnapshotGenerationContainerView alloc], "initWithFrame:", v23, v25, v27, v48);
    snapshotGenerationContainerView = v21->_snapshotGenerationContainerView;
    v21->_snapshotGenerationContainerView = v53;

    -[SBApplicationBlurSnapshotGenerationContainerView addSubview:](v21->_snapshotGenerationContainerView, "addSubview:", v21->_liveBlurView);
    -[SBApplicationBlurSnapshotGenerationContainerView setLiveBlurView:](v21->_snapshotGenerationContainerView, "setLiveBlurView:", v21->_liveBlurView);
    -[SBApplicationBlurSnapshotGenerationContainerView setRealSnapshotView:](v21->_snapshotGenerationContainerView, "setRealSnapshotView:", v21->_unblurredRealSnapshotView);
    -[SBApplicationBlurSnapshotGenerationContainerView addSubview:](v21->_snapshotGenerationContainerView, "addSubview:", v21->_unblurredRealSnapshotView);
    -[SBApplicationBlurSnapshotGenerationContainerView addSubview:](v21->_snapshotGenerationContainerView, "addSubview:", v21->_liveBlurView);
    v55 = v21->_snapshotGenerationContainerView;
    -[SBApplicationBlurContentView bounds](v21, "bounds");
    -[SBApplicationBlurSnapshotGenerationContainerView setFrame:](v55, "setFrame:");
    -[SBApplicationBlurSnapshotGenerationContainerView setNeedsLayout](v21->_snapshotGenerationContainerView, "setNeedsLayout");
    -[SBApplicationBlurSnapshotGenerationContainerView layoutIfNeeded](v21->_snapshotGenerationContainerView, "layoutIfNeeded");
    -[SBApplicationBlurContentView addSubview:](v21, "addSubview:", v21->_snapshotGenerationContainerView);
    -[UIView setHidden:](v21->_liveBlurView, "setHidden:", 1);
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v65, v39, v40, v41);
    unblurredCopySnapshotView = v21->_unblurredCopySnapshotView;
    v21->_unblurredCopySnapshotView = (UIView *)v56;

    -[SBApplicationBlurContentView addSubview:](v21, "addSubview:", v21->_unblurredCopySnapshotView);
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v23, v25, v27, v48);
    blurredSnapshotView = v21->_blurredSnapshotView;
    v21->_blurredSnapshotView = (UIView *)v58;

    -[UIView setAlpha:](v21->_blurredSnapshotView, "setAlpha:", 0.0);
    -[UIView setContentMode:](v21->_blurredSnapshotView, "setContentMode:", 0);
    -[SBApplicationBlurContentView addSubview:](v21, "addSubview:", v21->_blurredSnapshotView);
    v60 = -[SBSceneViewAppIconView initWithIcon:]([SBSceneViewAppIconView alloc], "initWithIcon:", v17);
    iconView = v21->_iconView;
    v21->_iconView = v60;

    -[SBSceneViewAppIconView setAlpha:](v21->_iconView, "setAlpha:", 0.0);
    -[SBApplicationBlurContentView addSubview:](v21, "addSubview:", v21->_iconView);

    -[SBApplicationBlurContentView _setState:](v21, "_setState:", 0);
    -[SBApplicationBlurContentView setNeedsLayout](v21, "setNeedsLayout");
    -[SBApplicationBlurContentView layoutIfNeeded](v21, "layoutIfNeeded");
    -[SBApplicationBlurContentView setOpaque:](v21, "setOpaque:", 1);

  }
  return v21;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
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
  -[NSMutableDictionary allKeys](self->_mapStateToCompletionBlocks, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[SBApplicationBlurContentView _fireCompletionBlocksForState:](self, "_fireCompletionBlocksForState:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "unsignedIntegerValue"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBApplicationBlurContentView;
  -[SBApplicationBlurContentView dealloc](&v8, sel_dealloc);
}

- (void)generateBlurredSnapshotWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[4];
  void (**v6)(_QWORD);
  id v7;
  id location;

  v4 = (void (**)(_QWORD))a3;
  objc_initWeak(&location, self);
  switch(self->_state)
  {
    case 0uLL:
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __70__SBApplicationBlurContentView_generateBlurredSnapshotWithCompletion___block_invoke;
      v5[3] = &unk_1E8EA1EE0;
      objc_copyWeak(&v7, &location);
      v6 = v4;
      -[SBApplicationBlurContentView _addCompletionBlock:forState:](self, "_addCompletionBlock:forState:", v5, 0);

      objc_destroyWeak(&v7);
      break;
    case 1uLL:
      -[SBApplicationBlurContentView _doBlurGenerationWithCompletion:](self, "_doBlurGenerationWithCompletion:", v4);
      break;
    case 2uLL:
      -[SBApplicationBlurContentView _addCompletionBlock:forState:](self, "_addCompletionBlock:forState:", v4, 2);
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      if (v4)
        v4[2](v4);
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);

}

void __70__SBApplicationBlurContentView_generateBlurredSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "generateBlurredSnapshotWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)animateToBlurredSnapshotWithFactory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  _QWORD v8[4];
  id v9;
  void (**v10)(_QWORD);
  id v11;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_initWeak(&location, self);
  switch(self->_state)
  {
    case 0uLL:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __79__SBApplicationBlurContentView_animateToBlurredSnapshotWithFactory_completion___block_invoke;
      v8[3] = &unk_1E8EA0510;
      objc_copyWeak(&v11, &location);
      v9 = v6;
      v10 = v7;
      -[SBApplicationBlurContentView _addCompletionBlock:forState:](self, "_addCompletionBlock:forState:", v8, 0);

      objc_destroyWeak(&v11);
      break;
    case 1uLL:
    case 2uLL:
      -[SBApplicationBlurContentView generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:](self, "generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:", v6, v7);
      break;
    case 3uLL:
      -[SBApplicationBlurContentView _doAnimationToBlurredSnapshotWithFactory:completion:](self, "_doAnimationToBlurredSnapshotWithFactory:completion:", v6, v7);
      break;
    case 4uLL:
      -[SBApplicationBlurContentView _addCompletionBlock:forState:](self, "_addCompletionBlock:forState:", v7, 4);
      break;
    case 5uLL:
      if (v7)
        v7[2](v7);
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);

}

void __79__SBApplicationBlurContentView_animateToBlurredSnapshotWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "animateToBlurredSnapshotWithFactory:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)generateAndAnimateToBlurredSnapshotWithAnimationFactory:(id)a3 completion:(id)a4
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
  v10[2] = __99__SBApplicationBlurContentView_generateAndAnimateToBlurredSnapshotWithAnimationFactory_completion___block_invoke;
  v10[3] = &unk_1E8E9F7B8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBApplicationBlurContentView generateBlurredSnapshotWithCompletion:](self, "generateBlurredSnapshotWithCompletion:", v10);

}

uint64_t __99__SBApplicationBlurContentView_generateAndAnimateToBlurredSnapshotWithAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateToBlurredSnapshotWithFactory:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setIconViewScale:(double)a3
{
  if (self->_iconViewScale != a3)
  {
    self->_iconViewScale = a3;
    -[SBApplicationBlurContentView setNeedsLayout](self, "setNeedsLayout");
    -[SBApplicationBlurContentView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)didMoveToWindow
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD v10[5];

  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke;
  v10[3] = &unk_1E8E9DED8;
  v10[4] = self;
  v4 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v10, a2);
  -[UIView layer](self->_targetViewToBlur, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasBeenCommitted");

  if (v6)
  {
    v4[2](v4);
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0CEB258];
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke_2;
    v8[3] = &unk_1E8E9E8D0;
    v9 = v4;
    objc_msgSend(v7, "sb_performBlockAfterCATransactionSynchronizedCommit:", v8);

  }
}

void __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (!v3[53])
    {
      v31 = v2;
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBackgroundColor:", v4);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "sb_generateSnapshotContentsSynchronously");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);

      if (v6 == v7)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "removeFromSuperview");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentationLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
      if (v9)
      {
        objc_msgSend(v10, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presentationLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;

      }
      else
      {
        objc_msgSend(v10, "bounds");
        v14 = v21;
        v16 = v22;
        v18 = v23;
        v20 = v24;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", v14, v16, v18, v20);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setContents:", v5);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "screen");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "scale");
      objc_msgSend(v26, "setContentsScale:");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", v14, v16, v18, v20);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setContents:", v5);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "screen");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "scale");
      objc_msgSend(v29, "setContentsScale:");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setHidden:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_setState:", 1);

      v2 = v31;
    }
  }

}

uint64_t __47__SBApplicationBlurContentView_didMoveToWindow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)layoutSubviews
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
  void *v13;
  void *v14;
  SBSceneViewAppIconView *iconView;
  SBSceneViewAppIconView *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  -[SBApplicationBlurContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_blurredSnapshotView, "setFrame:");
  -[UIView setFrame:](self->_unblurredCopySnapshotView, "setFrame:", v4, v6, v8, v10);
  if (self->_state >= 3)
    -[SBApplicationBlurSnapshotGenerationContainerView setFrame:](self->_snapshotGenerationContainerView, "setFrame:", v4, v6, v8, v10);
  if (SBReduceMotion())
  {
    v11 = v8 / self->_targetViewOriginalSize.width;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v12 = 1.0 - v11;
    else
      v12 = 0.0;
    -[UIView layer](self->_unblurredCopySnapshotView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentsRect:", v12, 0.0, v11, 1.0);

    -[UIView layer](self->_unblurredRealSnapshotView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentsRect:", v12, 0.0, v11, 1.0);

  }
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, self->_iconViewScale, self->_iconViewScale);
  iconView = self->_iconView;
  v17 = v18;
  -[SBSceneViewAppIconView setTransform:](iconView, "setTransform:", &v17);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  -[SBSceneViewAppIconView sizeThatFits:](self->_iconView, "sizeThatFits:", CGRectGetWidth(v19), 0.0);
  SBRectWithSize();
  -[SBSceneViewAppIconView setBounds:](self->_iconView, "setBounds:");
  v16 = self->_iconView;
  UIRectGetCenter();
  -[SBSceneViewAppIconView setCenter:](v16, "setCenter:");
}

- (void)_setState:(unint64_t)a3
{
  unint64_t *p_state;
  unint64_t state;
  NSObject *v6;

  p_state = &self->_state;
  state = self->_state;
  if (state != a3)
  {
    *p_state = a3;
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBApplicationBlurContentView _setState:].cold.1((uint64_t)self, p_state, v6);

    -[SBApplicationBlurContentView _fireCompletionBlocksForState:](self, "_fireCompletionBlocksForState:", state);
  }
}

- (void)_addCompletionBlock:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *mapStateToCompletionBlocks;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  if (v6)
  {
    v13 = v6;
    mapStateToCompletionBlocks = self->_mapStateToCompletionBlocks;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](mapStateToCompletionBlocks, "objectForKey:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = self->_mapStateToCompletionBlocks;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v11);

    }
    v12 = (void *)MEMORY[0x1D17E5550](v13);
    objc_msgSend(v9, "addObject:", v12);

    v6 = v13;
  }

}

- (void)_fireCompletionBlocksForState:(unint64_t)a3
{
  NSMutableDictionary *mapStateToCompletionBlocks;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  mapStateToCompletionBlocks = self->_mapStateToCompletionBlocks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mapStateToCompletionBlocks, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_msgSend(v7, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v13 = self->_mapStateToCompletionBlocks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

}

- (void)_doBlurGenerationWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  if (self->_state != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationBlurContentView.m"), 384, CFSTR("State must be possible to begin generating blurred snapshots."));

  }
  -[SBApplicationBlurContentView _setState:](self, "_setState:", 2);
  -[SBApplicationBlurContentView _addCompletionBlock:forState:](self, "_addCompletionBlock:forState:", v5, 2);
  v6 = (void *)*MEMORY[0x1E0CEB258];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__SBApplicationBlurContentView__doBlurGenerationWithCompletion___block_invoke;
  v8[3] = &unk_1E8E9DED8;
  v8[4] = self;
  objc_msgSend(v6, "sb_performBlockAfterCATransactionSynchronizedCommit:", v8);

}

void __64__SBApplicationBlurContentView__doBlurGenerationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "sb_generateSnapshotContentsSynchronously");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContents:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentsScale:", SBScreenScale());

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setLiveBlurView:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "removeFromSuperview");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 480);
  *(_QWORD *)(v4 + 480) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_setState:", 3);
}

- (void)_doAnimationToBlurredSnapshotWithFactory:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  _QWORD v23[5];

  v7 = a3;
  v8 = a4;
  if (self->_state != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationBlurContentView.m"), 405, CFSTR("State must be idle to begin generating blurred snapshots."));

  }
  -[SBApplicationBlurContentView _setState:](self, "_setState:", 4);
  -[SBApplicationBlurContentView _addCompletionBlock:forState:](self, "_addCompletionBlock:forState:", v8, 4);
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke;
  v23[3] = &unk_1E8E9DED8;
  v23[4] = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v23);
  -[SBApplicationBlurContentView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7
    && v11
    && (objc_msgSend(v11, "isHidden") & 1) == 0
    && (-[SBApplicationBlurContentView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0D01908];
    -[SBApplicationBlurContentView blurDelay](self, "blurDelay");
    v15 = v14;
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_2;
    v22[3] = &unk_1E8E9DED8;
    v22[4] = self;
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_3;
    v20[3] = &unk_1E8E9F1C0;
    v21 = v10;
    objc_msgSend(v13, "animateWithFactory:additionalDelay:actions:completion:", v7, v22, v20, v15);
    objc_msgSend(v7, "duration");
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:delay:", v16, v16 * 0.5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_4;
    v19[3] = &unk_1E8E9DED8;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:actions:completion:", v17, v19, 0);

  }
  else
  {
    -[UIView setAlpha:](self->_blurredSnapshotView, "setAlpha:", 1.0);
    -[SBSceneViewAppIconView setAlpha:](self->_iconView, "setAlpha:", 1.0);
    v10[2](v10);
  }

}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 472);
  *(_QWORD *)(v2 + 472) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "removeFromSuperview");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 504);
  *(_QWORD *)(v4 + 504) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 464);
  *(_QWORD *)(v6 + 464) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_setState:", 5);
}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 1.0);
}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__SBApplicationBlurContentView__doAnimationToBlurredSnapshotWithFactory_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", 1.0);
}

- (SBSceneViewAppIconView)iconView
{
  return self->_iconView;
}

- (double)iconViewScale
{
  return self->_iconViewScale;
}

- (double)blurDelay
{
  return self->_blurDelay;
}

- (void)setBlurDelay:(double)a3
{
  self->_blurDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_snapshotGenerationContainerView, 0);
  objc_storeStrong((id *)&self->_blurredSnapshotView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_liveBlurView, 0);
  objc_storeStrong((id *)&self->_unblurredCopySnapshotView, 0);
  objc_storeStrong((id *)&self->_unblurredRealSnapshotView, 0);
  objc_storeStrong((id *)&self->_targetViewToBlur, 0);
  objc_storeStrong((id *)&self->_mapStateToCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)_setState:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = *(_QWORD *)(a1 + 416);
  v10 = *a2 - 1;
  if (v10 > 4)
    v11 = CFSTR("0 - Waiting for snapshot");
  else
    v11 = off_1E8EB3648[v10];
  v12 = 138413058;
  v13 = v7;
  v14 = 2048;
  v15 = a1;
  v16 = 2112;
  v17 = v9;
  v18 = 2112;
  v19 = v11;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "<%@:%p - %@>: blur view state changed to: %@", (uint8_t *)&v12, 0x2Au);

}

@end
