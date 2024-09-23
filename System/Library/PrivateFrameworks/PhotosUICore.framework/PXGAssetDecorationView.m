@implementation PXGAssetDecorationView

+ (BOOL)wantsDecorationViewForConfiguration:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "loadStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state") == 1;

  return v4;
}

- (PXGAssetDecorationView)initWithFrame:(CGRect)a3
{
  PXGAssetDecorationView *v3;
  uint64_t v4;
  PXUpdater *updater;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGAssetDecorationView;
  v3 = -[PXGAssetDecorationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v3, sel__setNeedsUpdate);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateProgressIndicator);
  }
  return v3;
}

- (void)setUserData:(id)a3
{
  PXGAssetDecorationViewConfiguration *v4;
  BOOL v5;
  PXGAssetDecorationViewConfiguration *v6;
  PXGAssetDecorationViewConfiguration *userData;
  PXGAssetDecorationViewConfiguration *v8;

  v8 = (PXGAssetDecorationViewConfiguration *)a3;
  v4 = self->_userData;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXGAssetDecorationViewConfiguration isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXGAssetDecorationViewConfiguration *)-[PXGAssetDecorationViewConfiguration copy](v8, "copy");
      userData = self->_userData;
      self->_userData = v6;

      -[PXGAssetDecorationView _invalidateProgressIndicator](self, "_invalidateProgressIndicator");
    }
  }

}

- (void)layoutSubviews
{
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  -[PXGAssetDecorationView bounds](self, "bounds");
  PXRectGetCenter();
  -[PXRoundProgressView setCenter:](self->_progressIndicatorView, "setCenter:");
}

- (void)_invalidateProgressIndicator
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateProgressIndicator);
}

- (void)_updateProgressIndicator
{
  void *v3;
  int v4;
  int v5;
  NSTimer *progressIndicatorDelayTimer;
  void *v7;
  NSTimer *v8;
  NSTimer *v9;
  PXRoundProgressView *v10;
  PXRoundProgressView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PXRoundProgressView *v16;
  PXRoundProgressView *progressIndicatorView;
  void *v18;
  double v19;
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v21;
  UIActivityIndicatorView **p_activityIndicatorView;
  UIActivityIndicatorView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIActivityIndicatorView *v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  -[PXGAssetDecorationView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "_wantsProgressIndicatorForConfiguration:", v3);
  v5 = objc_msgSend((id)objc_opt_class(), "_wantsActivityIndicatorForConfiguration:", v3);
  if (v4)
  {
    progressIndicatorDelayTimer = self->_progressIndicatorDelayTimer;
    if (!progressIndicatorDelayTimer)
    {
LABEL_5:
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E0C99E88];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __50__PXGAssetDecorationView__updateProgressIndicator__block_invoke;
      v34[3] = &unk_1E5141230;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v34, 1.0);
      v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v9 = self->_progressIndicatorDelayTimer;
      self->_progressIndicatorDelayTimer = v8;

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
    if (-[NSTimer isValid](progressIndicatorDelayTimer, "isValid"))
    {
      if (self->_progressIndicatorDelayTimer)
        goto LABEL_11;
      goto LABEL_5;
    }
    if (!self->_progressIndicatorView)
    {
      +[PXRoundProgressView sizeForSizeClass:](PXRoundProgressView, "sizeForSizeClass:", 1);
      PXRectWithOriginAndSize();
      v16 = -[PXRoundProgressView initWithFrame:style:]([PXRoundProgressView alloc], "initWithFrame:style:", 1, v12, v13, v14, v15);
      progressIndicatorView = self->_progressIndicatorView;
      self->_progressIndicatorView = v16;

      -[PXRoundProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PXGAssetDecorationView addSubview:](self, "addSubview:", self->_progressIndicatorView);
    }
    objc_msgSend(v3, "loadStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "progress");
    *(float *)&v19 = v19;
    -[PXRoundProgressView setProgress:](self->_progressIndicatorView, "setProgress:", v19);

  }
  else
  {
    v10 = self->_progressIndicatorView;
    if (v10)
    {
      -[PXRoundProgressView removeFromSuperview](v10, "removeFromSuperview");
      v11 = self->_progressIndicatorView;
      self->_progressIndicatorView = 0;

    }
  }
LABEL_11:
  activityIndicatorView = self->_activityIndicatorView;
  if (v5)
  {
    if (!activityIndicatorView)
    {
      v21 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
      p_activityIndicatorView = &self->_activityIndicatorView;
      v23 = self->_activityIndicatorView;
      self->_activityIndicatorView = v21;

      -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](self->_activityIndicatorView, "setColor:", v24);

      -[PXGAssetDecorationView addSubview:](self, "addSubview:", self->_activityIndicatorView);
      v25 = (void *)MEMORY[0x1E0CB3718];
      -[UIActivityIndicatorView centerXAnchor](self->_activityIndicatorView, "centerXAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGAssetDecorationView centerXAnchor](self, "centerXAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v28;
      -[UIActivityIndicatorView centerYAnchor](self->_activityIndicatorView, "centerYAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGAssetDecorationView centerYAnchor](self, "centerYAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activateConstraints:", v32);

      -[UIActivityIndicatorView startAnimating](*p_activityIndicatorView, "startAnimating");
    }
  }
  else if (activityIndicatorView)
  {
    -[UIActivityIndicatorView removeFromSuperview](activityIndicatorView, "removeFromSuperview");
    v33 = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;

  }
}

- (void)prepareForReuse
{
  NSTimer *progressIndicatorDelayTimer;

  -[NSTimer invalidate](self->_progressIndicatorDelayTimer, "invalidate");
  progressIndicatorDelayTimer = self->_progressIndicatorDelayTimer;
  self->_progressIndicatorDelayTimer = 0;

  -[PXGAssetDecorationView setUserData:](self, "setUserData:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXGAssetDecorationViewConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_progressIndicatorDelayTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

void __50__PXGAssetDecorationView__updateProgressIndicator__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_msgSend(a2, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateProgressIndicator");

}

+ (BOOL)_wantsProgressIndicatorForConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "loadStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") == 1)
  {
    objc_msgSend(v3, "loadStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isIndeterminate") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)_wantsActivityIndicatorForConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "loadStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") == 1)
  {
    objc_msgSend(v3, "loadStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isIndeterminate");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
