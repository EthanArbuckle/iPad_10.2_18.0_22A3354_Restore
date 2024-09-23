@implementation UIContentUnavailableView

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIContentUnavailableView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

uint64_t __50__UIContentUnavailableView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((*(_WORD *)&self->_contentViewFlags & 1) == 0)
  {
    -[UIView window](self, "window", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentUnavailableConfigurationState");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      -[UIContentUnavailableConfiguration updatedConfigurationForState:](self->_configuration, "updatedConfigurationForState:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContentUnavailableView _applyConfiguration:](self, "_applyConfiguration:", v6);

    }
  }
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(_QWORD *)&self->super._viewFlags >> 53) & 1;
}

- (void)_applyConfiguration:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _UIContentUnavailableScrollView *v7;
  _UIContentUnavailableScrollView *v8;
  _UIContentUnavailableScrollView *scrollView;
  _BOOL8 v10;
  _UIContentUnavailableScrollView *v11;
  _QWORD *v12;
  _UIContentUnavailableScrollView *v13;
  UIImageView *v14;
  UIImageView *v15;
  char v16;
  int v17;
  _UIContentUnavailableScrollView *v18;
  __int16 contentViewFlags;
  __int16 v20;
  _UIContentUnavailableScrollView *v21;
  void *v22;
  _UIContentUnavailableScrollView *v23;
  id v24;
  UIActivityIndicatorView *v25;
  UIActivityIndicatorView *v26;
  int v27;
  _UIContentUnavailableScrollView *v28;
  __int16 v29;
  __int16 v30;
  _UIContentUnavailableScrollView *v31;
  void *v32;
  int updated;
  __int16 v34;
  __int16 v35;
  _UIContentUnavailableScrollView *v36;
  void *v37;
  int v38;
  __int16 v39;
  __int16 v40;
  _UIContentUnavailableScrollView *v41;
  void *v42;
  int v43;
  __int16 v44;
  __int16 v45;
  _UIContentUnavailableScrollView *v46;
  void *v47;
  int v48;
  __int16 v49;
  __int16 v50;
  void *v51;
  void *v52;
  void *v54;
  id v55;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIContentUnavailableView.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  objc_storeStrong((id *)&self->_configuration, a3);
  v5 = objc_msgSend(a3, "axesPreservingSuperviewLayoutMargins");
  if ((v5 & 2) != 0)
    v6 = (v5 << 63 >> 63) & 0xA | 5;
  else
    v6 = (v5 << 63 >> 63) & 0xA;
  -[UIView setEdgesPreservingSuperviewLayoutMargins:](self, "setEdgesPreservingSuperviewLayoutMargins:", v6);
  objc_msgSend(a3, "directionalLayoutMargins");
  -[UIView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:");
  if (!self->_scrollView)
  {
    v7 = [_UIContentUnavailableScrollView alloc];
    -[UIView bounds](self, "bounds");
    v8 = -[_UIContentUnavailableScrollView initWithFrame:](v7, "initWithFrame:");
    scrollView = self->_scrollView;
    self->_scrollView = v8;

    -[UIView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 18);
    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
    -[UIView addSubview:](self, "addSubview:", self->_scrollView);
  }
  -[UIView traitCollection](self, "traitCollection");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    v10 = *((_QWORD *)a3 + 7) == 1;
  else
    v10 = 0;
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[UIContentUnavailableView isScrollEnabled](self, "isScrollEnabled"));
  -[UIScrollView _setIsTransientScrollView:](self->_scrollView, "_setIsTransientScrollView:", v10);
  v11 = self->_scrollView;
  objc_msgSend(a3, "imageProperties");
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = self->_imageView;
  v15 = v14;
  if (!v12 || (!v12[2] ? (v16 = 1) : (v16 = v10), (v16 & 1) != 0))
  {
    if (v14 && !-[UIView isHidden](v14, "isHidden"))
    {
      v17 = 1;
      -[UIImageView setHidden:](v15, "setHidden:", 1);
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_28;
  }
  if (v14)
  {
    if (!-[UIView isHidden](v14, "isHidden"))
    {
      v17 = 0;
      goto LABEL_25;
    }
    -[UIImageView setHidden:](v15, "setHidden:", 0);
  }
  else
  {
    v15 = objc_alloc_init(UIImageView);
    objc_storeStrong((id *)&self->_imageView, v15);
  }
  v17 = 1;
LABEL_25:
  -[UIView superview](v15, "superview");
  v18 = (_UIContentUnavailableScrollView *)objc_claimAutoreleasedReturnValue();

  if (v18 != v13)
    -[UIView addSubview:](v13, "addSubview:", v15);
  -[UIContentUnavailableImageProperties _applyToImageView:]((uint64_t)v12, v15);
LABEL_28:

  contentViewFlags = (__int16)self->_contentViewFlags;
  if (v17 | ((contentViewFlags & 8) >> 3))
    v20 = 8;
  else
    v20 = 0;
  *(_WORD *)&self->_contentViewFlags = v20 | contentViewFlags & 0xFFF7;

  v21 = self->_scrollView;
  objc_msgSend(a3, "imageProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  v24 = v22;
  v25 = self->_activityIndicator;
  v26 = v25;
  if (!v10)
  {
    if (v25 && !-[UIView isHidden](v25, "isHidden"))
    {
      v27 = 1;
      -[UIView setHidden:](v26, "setHidden:", 1);
    }
    else
    {
      v27 = 0;
    }
    goto LABEL_45;
  }
  if (v25)
  {
    if (!-[UIView isHidden](v25, "isHidden"))
    {
      v27 = 0;
      goto LABEL_41;
    }
    -[UIView setHidden:](v26, "setHidden:", 0);
  }
  else
  {
    v26 = objc_alloc_init(UIActivityIndicatorView);
    -[UIActivityIndicatorView setHidesWhenStopped:](v26, "setHidesWhenStopped:", 0);
    objc_storeStrong((id *)&self->_activityIndicator, v26);
  }
  v27 = 1;
LABEL_41:
  -[UIView superview](v26, "superview");
  v28 = (_UIContentUnavailableScrollView *)objc_claimAutoreleasedReturnValue();

  if (v28 != v23)
    -[UIView addSubview:](v23, "addSubview:", v26);
  -[UIContentUnavailableImageProperties _applyToActivityIndicatorView:]((uint64_t)v24, v26);
LABEL_45:

  v29 = (__int16)self->_contentViewFlags;
  if (v27 | ((v29 & 0x10) >> 4))
    v30 = 16;
  else
    v30 = 0;
  *(_WORD *)&self->_contentViewFlags = v30 | v29 & 0xFFEF;

  v31 = self->_scrollView;
  objc_msgSend(a3, "textProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  updated = _UIContentUnavailableUpdateLabelUsingTextConfiguration(v31, (id *)&self->_textLabel, v32);
  v34 = (__int16)self->_contentViewFlags;
  if (updated | ((v34 & 0x20) >> 5))
    v35 = 32;
  else
    v35 = 0;
  *(_WORD *)&self->_contentViewFlags = v35 | v34 & 0xFFDF;

  v36 = self->_scrollView;
  objc_msgSend(a3, "secondaryTextProperties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = _UIContentUnavailableUpdateLabelUsingTextConfiguration(v36, (id *)&self->_secondaryTextLabel, v37);
  v39 = (__int16)self->_contentViewFlags;
  if (v38 | ((v39 & 0x40) >> 6))
    v40 = 64;
  else
    v40 = 0;
  *(_WORD *)&self->_contentViewFlags = v40 | v39 & 0xFFBF;

  v41 = self->_scrollView;
  objc_msgSend(a3, "buttonProperties");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = _UIUpdateButtonUsingButtonConfiguration(v41, (id *)&self->_button, v42);
  v44 = (__int16)self->_contentViewFlags;
  if (v43 | ((v44 & 0x80) >> 7))
    v45 = 128;
  else
    v45 = 0;
  *(_WORD *)&self->_contentViewFlags = v45 | v44 & 0xFF7F;

  v46 = self->_scrollView;
  objc_msgSend(a3, "secondaryButtonProperties");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = _UIUpdateButtonUsingButtonConfiguration(v46, (id *)&self->_secondaryButton, v47);
  v49 = (__int16)self->_contentViewFlags;
  if (v48 | ((unsigned __int16)(v49 & 0x100) >> 8))
    v50 = 256;
  else
    v50 = 0;
  *(_WORD *)&self->_contentViewFlags = v50 | v49 & 0xFEFF;

  _UIContentUnavailableConstantsForTraitCollection(v55);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _setOverrideUserInterfaceRenderingMode:](self, "_setOverrideUserInterfaceRenderingMode:", objc_msgSend(v51, "defaultUserInterfaceRenderingMode"));
  objc_msgSend(a3, "background");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _applyBackgroundConfiguration:](self, "_applyBackgroundConfiguration:", v52);

  self->_preferredMaxLayoutWidth = 1.79769313e308;
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIContentUnavailableView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIContentUnavailableView _checkWhetherEmbeddedInWrapperView](self, "_checkWhetherEmbeddedInWrapperView");
  -[UIContentUnavailableView _reconfigureKeyboardLayoutAdjustment](self, "_reconfigureKeyboardLayoutAdjustment");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIContentUnavailableView;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[UIContentUnavailableView _checkWhetherEmbeddedInWrapperView](self, "_checkWhetherEmbeddedInWrapperView");
  -[UIContentUnavailableView _reconfigureKeyboardLayoutAdjustment](self, "_reconfigureKeyboardLayoutAdjustment");
}

- (void)_reconfigureKeyboardLayoutAdjustment
{
  $1B4C8A047F38094B3B36BFCC6E97ECAE contentViewFlags;
  void *v4;
  int v5;
  int v6;
  __int16 v7;
  __int16 v8;
  id v9;

  contentViewFlags = self->_contentViewFlags;
  -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isInViewControllerThatHandlesKeyboardAvoidance");

  v6 = ((_UIApplicationIsMessagesExtension() | v5) ^ 1) & *(_DWORD *)&contentViewFlags;
  v7 = (__int16)self->_contentViewFlags;
  if (((v6 ^ ((v7 & 4) == 0)) & 1) == 0)
  {
    if (v6)
      v8 = 4;
    else
      v8 = 0;
    *(_WORD *)&self->_contentViewFlags = v8 | v7 & 0xFFFB;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardAboutToShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardAboutToHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardAboutToChangeFrame_, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), 0);
    }
    else
    {
      objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
      objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
      objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), 0);
    }

  }
}

- (void)_checkWhetherEmbeddedInWrapperView
{
  void *v3;
  int isKindOfClass;
  __int16 contentViewFlags;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  contentViewFlags = (__int16)self->_contentViewFlags;
  if (((isKindOfClass ^ ((contentViewFlags & 1) == 0)) & 1) == 0)
  {
    *(_WORD *)&self->_contentViewFlags = contentViewFlags & 0xFFFE | isKindOfClass & 1;
    -[UIContentUnavailableView _applyConfiguration:](self, "_applyConfiguration:", self->_configuration);
  }
}

- (void)setConfiguration:(UIContentUnavailableConfiguration *)configuration
{
  UIContentUnavailableConfiguration *v5;
  void *v6;
  void *v8;
  _QWORD v9[4];
  UIContentUnavailableConfiguration *v10;
  id v11;
  id location;

  if (!configuration)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIContentUnavailableView.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v5 = self->_configuration;
  if ((-[UIContentUnavailableConfiguration _isEqualToConfigurationQuick:]((uint64_t)v5, configuration) & 1) == 0)
  {
    v6 = (void *)-[UIContentUnavailableConfiguration copy](configuration, "copy");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__UIContentUnavailableView_setConfiguration___block_invoke;
      v9[3] = &unk_1E16E80B8;
      objc_copyWeak(&v11, &location);
      v10 = v5;
      +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    -[UIContentUnavailableView _applyConfiguration:](self, "_applyConfiguration:", v6);

  }
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[UIView setNeedsLayout](self, "setNeedsLayout", a3);
  -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*(_WORD *)&self->_contentViewFlags & 1) != 0)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "_hasAppeared");
    v5 = v8;
    if (v6)
    {
      objc_msgSend(v8, "transitionCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
      if (v7)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __68__UIContentUnavailableView_scrollViewDidChangeAdjustedContentInset___block_invoke;
        v9[3] = &unk_1E16B1B28;
        v9[4] = self;
        +[UIView _performWithAnimation:](UIView, "_performWithAnimation:", v9);
        v5 = v8;
      }
    }
  }

}

- (UIContentUnavailableConfiguration)configuration
{
  return (UIContentUnavailableConfiguration *)(id)-[UIContentUnavailableConfiguration copy](self->_configuration, "copy");
}

- (BOOL)shouldReparentScrollViewPanGestureRecognizer
{
  int v2;
  void *v3;

  if ((*(_WORD *)&self->_contentViewFlags & 1) != 0)
  {
    -[UIContentUnavailableConfiguration background](self->_configuration, "background");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "_hasBackgroundFill") ^ 1;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)_applyBackgroundConfiguration:(id)a3
{
  _UISystemBackgroundView *backgroundView;
  _UISystemBackgroundView *v6;
  _UISystemBackgroundView *v7;

  backgroundView = self->_backgroundView;
  if (backgroundView)
    goto LABEL_2;
  if (objc_msgSend(a3, "_hasBackgroundFill"))
  {
    v6 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", a3);
    v7 = self->_backgroundView;
    self->_backgroundView = v6;

    -[_UISystemBackgroundView frameInContainerView:](self->_backgroundView, "frameInContainerView:", self);
    -[_UISystemBackgroundView setFrame:](self->_backgroundView, "setFrame:");
    -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
  }
  else
  {
    backgroundView = self->_backgroundView;
    if (backgroundView)
    {
LABEL_2:
      -[_UISystemBackgroundView setConfiguration:](backgroundView, "setConfiguration:", a3);
      -[_UISystemBackgroundView frameInContainerView:](self->_backgroundView, "frameInContainerView:", self);
      -[_UISystemBackgroundView setFrame:](self->_backgroundView, "setFrame:");
    }
  }
}

- (UIContentUnavailableView)initWithConfiguration:(UIContentUnavailableConfiguration *)configuration
{
  UIContentUnavailableView *v5;
  UIContentUnavailableView *v6;
  void *v9;
  _QWORD v10[4];
  UIContentUnavailableView *v11;
  UIContentUnavailableConfiguration *v12;
  objc_super v13;

  if (!configuration)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIContentUnavailableView.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)UIContentUnavailableView;
  v5 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__UIContentUnavailableView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v11 = v5;
    v12 = configuration;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  return v6;
}

- (double)_keyboardInset
{
  double v2;
  void *v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;

  v2 = 0.0;
  if ((*(_WORD *)&self->_contentViewFlags & 4) != 0)
  {
    -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((*(_WORD *)&self->_contentViewFlags & 2) != 0)
    {
      x = self->_keyboardFrame.origin.x;
      y = self->_keyboardFrame.origin.y;
      width = self->_keyboardFrame.size.width;
      height = self->_keyboardFrame.size.height;
    }
    else
    {
      if (!objc_msgSend(v4, "isOnScreen"))
      {
LABEL_7:
        -[UIContentUnavailableView _scrollViewInsets](self, "_scrollViewInsets");
        v2 = fmax(v2 - v10, 0.0);

        return v2;
      }
      objc_msgSend(v5, "visibleFrameInView:", 0);
      +[_UIKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:inView:](_UIKeyboardLayoutAlignmentView, "_frameInBoundsForKeyboardFrame:inView:", self);
    }
    v2 = CGRectGetHeight(*(CGRect *)&x);
    goto LABEL_7;
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double Height;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD *v29;
  id v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  void (*v34)(_QWORD *, void *, __int128 *, uint64_t);
  void *v35;
  uint64_t v36;
  void (*v37)(_QWORD *, void *, __int128 *, uint64_t);
  void *v38;
  uint64_t v39;
  void (*v40)(_QWORD *, void *, __int128 *, uint64_t);
  void *v41;
  uint64_t v42;
  void (*v43)(_QWORD *, void *, __int128 *, uint64_t);
  void *v44;
  uint64_t v45;
  void (*v46)(_QWORD *, void *, __int128 *, uint64_t);
  uint64_t v47;
  void (*v48)(_QWORD *, void *, __int128 *, uint64_t);
  void *v49;
  $1B4C8A047F38094B3B36BFCC6E97ECAE contentViewFlags;
  void *v51;
  void (*v52)(_QWORD *, void *, __int128 *, _QWORD, void *, _OWORD *, uint64_t);
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double Width;
  double v63;
  double v64;
  uint64_t v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  _OWORD v69[3];
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  _QWORD *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  _BYTE v82[416];
  double v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  char v89;
  _QWORD v90[4];
  id v91;
  _QWORD *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  _BYTE v97[416];
  double v98;
  double v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  char v104;
  _QWORD aBlock[7];
  char v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _QWORD v113[6];
  _OWORD __src[26];
  objc_super v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v115.receiver = self;
  v115.super_class = (Class)UIContentUnavailableView;
  -[UIView layoutSubviews](&v115, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIContentUnavailableView _scrollViewInsets](self, "_scrollViewInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIContentUnavailableView _keyboardInset](self, "_keyboardInset");
  v68 = v19;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v65 = v20;
  v116.origin.x = v4;
  v116.origin.y = v6;
  v116.size.width = v8;
  v116.size.height = v10;
  v63 = v18;
  v64 = v14;
  v21 = CGRectGetWidth(v116) - v14 - v18;
  v117.origin.x = v4;
  v117.origin.y = v6;
  v117.size.width = v8;
  v117.size.height = v10;
  v22 = CGRectGetHeight(v117) - v12 - v16 - v68;
  memset(__src, 0, sizeof(__src));
  -[UIContentUnavailableView _computeLayoutInfoRestrictedToSize:](self, "_computeLayoutInfoRestrictedToSize:", v21, v22);
  v118.origin.x = v4;
  v118.origin.y = v6;
  v118.size.width = v8;
  v118.size.height = v10;
  Width = CGRectGetWidth(v118);
  v67 = v6;
  v119.origin.x = v4;
  v119.origin.y = v6;
  v66 = v10;
  v119.size.width = v8;
  v119.size.height = v10;
  Height = CGRectGetHeight(v119);
  if (v21 <= 0.0)
    v21 = *(double *)&__src[24];
  if (*((double *)&__src[24] + 1) >= v22)
    v24 = *((double *)&__src[24] + 1);
  else
    v24 = v22;
  -[UIContentUnavailableView _scrollView](self, "_scrollView", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentSize:", v21, v68 + v24);

  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x3010000000;
  v113[3] = &unk_18685B0AF;
  v113[4] = 0;
  *(double *)&v113[5] = (v24 - 0.0) * 0.5 + 0.0;
  v107 = 0;
  v108 = &v107;
  v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__220;
  v111 = __Block_byref_object_dispose__220;
  v112 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E16E80E0;
  v106 = 0;
  aBlock[6] = v65;
  aBlock[4] = v113;
  aBlock[5] = &v107;
  v27 = _Block_copy(aBlock);
  v90[0] = v26;
  v90[1] = 3221225472;
  v90[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke_3;
  v90[3] = &unk_1E16E8108;
  v93 = v12 + 0.0;
  v94 = v64 + v61;
  v95 = v16 + 0.0;
  v96 = v63 + 0.0;
  memcpy(v97, __src, sizeof(v97));
  v98 = Width - (v64 + v61) - (v63 + 0.0);
  v99 = Height - (v12 + 0.0) - (v16 + 0.0) - v68;
  v104 = 0;
  v100 = v4;
  v101 = v67;
  v102 = v8;
  v103 = v66;
  v28 = v27;
  v91 = v28;
  v92 = v113;
  v29 = _Block_copy(v90);
  v75[0] = v26;
  v75[1] = 3221225472;
  v75[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke_4;
  v75[3] = &unk_1E16E8130;
  v78 = v12 + 0.0;
  v79 = v64 + v61;
  v80 = v16 + 0.0;
  v81 = v63 + 0.0;
  memcpy(v82, __src, sizeof(v82));
  v83 = Width - (v64 + v61) - (v63 + 0.0);
  v84 = Height - (v12 + 0.0) - (v16 + 0.0) - v68;
  v89 = 0;
  v85 = v4;
  v86 = v67;
  v87 = v8;
  v88 = v66;
  v30 = v28;
  v76 = v30;
  v77 = v113;
  v31 = _Block_copy(v75);
  -[UIContentUnavailableView _imageView](self, "_imageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (*(_WORD *)&self->_contentViewFlags >> 3) & 1;
  v34 = (void (*)(_QWORD *, void *, __int128 *, uint64_t))v29[2];
  v71 = __src[0];
  v72 = __src[1];
  v73 = __src[2];
  v74 = *(_QWORD *)&__src[3];
  v34(v29, v32, &v71, v33);

  -[UIContentUnavailableView _activityIndicator](self, "_activityIndicator");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (*(_WORD *)&self->_contentViewFlags >> 4) & 1;
  v37 = (void (*)(_QWORD *, void *, __int128 *, uint64_t))v29[2];
  v71 = *(_OWORD *)((char *)&__src[17] + 8);
  v72 = *(_OWORD *)((char *)&__src[18] + 8);
  v73 = *(_OWORD *)((char *)&__src[19] + 8);
  v74 = *((_QWORD *)&__src[20] + 1);
  v37(v29, v35, &v71, v36);

  -[UIContentUnavailableView _textLabel](self, "_textLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (*(_WORD *)&self->_contentViewFlags >> 5) & 1;
  v40 = (void (*)(_QWORD *, void *, __int128 *, uint64_t))v29[2];
  v71 = *(_OWORD *)((char *)&__src[3] + 8);
  v72 = *(_OWORD *)((char *)&__src[4] + 8);
  v73 = *(_OWORD *)((char *)&__src[5] + 8);
  v74 = *((_QWORD *)&__src[6] + 1);
  v40(v29, v38, &v71, v39);

  -[UIContentUnavailableView _secondaryTextLabel](self, "_secondaryTextLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (*(_WORD *)&self->_contentViewFlags >> 6) & 1;
  v43 = (void (*)(_QWORD *, void *, __int128 *, uint64_t))v29[2];
  v71 = __src[7];
  v72 = __src[8];
  v73 = __src[9];
  v74 = *(_QWORD *)&__src[10];
  v43(v29, v41, &v71, v42);

  if (LOBYTE(__src[21]))
  {
    -[UIContentUnavailableView _button](self, "_button");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    contentViewFlags = self->_contentViewFlags;
    -[UIContentUnavailableView _secondaryButton](self, "_secondaryButton");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void (*)(_QWORD *, void *, __int128 *, _QWORD, void *, _OWORD *, uint64_t))v31[2];
    v53 = HIBYTE(*(_WORD *)&self->_contentViewFlags) & 1;
    v71 = *(_OWORD *)((char *)&__src[10] + 8);
    v72 = *(_OWORD *)((char *)&__src[11] + 8);
    v73 = *(_OWORD *)((char *)&__src[12] + 8);
    v74 = *((_QWORD *)&__src[13] + 1);
    v69[0] = __src[14];
    v69[1] = __src[15];
    v69[2] = __src[16];
    v70 = *(_QWORD *)&__src[17];
    v52(v31, v49, &v71, (*(unsigned int *)&contentViewFlags >> 7) & 1, v51, v69, v53);

  }
  else
  {
    -[UIContentUnavailableView _button](self, "_button");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (*(_WORD *)&self->_contentViewFlags >> 7) & 1;
    v46 = (void (*)(_QWORD *, void *, __int128 *, uint64_t))v29[2];
    v71 = *(_OWORD *)((char *)&__src[10] + 8);
    v72 = *(_OWORD *)((char *)&__src[11] + 8);
    v73 = *(_OWORD *)((char *)&__src[12] + 8);
    v74 = *((_QWORD *)&__src[13] + 1);
    v46(v29, v44, &v71, v45);

    -[UIContentUnavailableView _secondaryButton](self, "_secondaryButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = HIBYTE(*(_WORD *)&self->_contentViewFlags) & 1;
    v48 = (void (*)(_QWORD *, void *, __int128 *, uint64_t))v29[2];
    v71 = __src[14];
    v72 = __src[15];
    v73 = __src[16];
    v74 = *(_QWORD *)&__src[17];
    v48(v29, v49, &v71, v47);
  }

  -[NSObject setAccessibilityElements:](self, "setAccessibilityElements:", v108[5]);
  -[UIContentUnavailableConfiguration imageProperties](self->_configuration, "imageProperties");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "cornerRadius");
  v56 = v55;
  -[UIContentUnavailableView _imageView](self, "_imageView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  _UIApplyCornerRadiusToView(v57, v56);

  -[UIContentUnavailableView _activityIndicator](self, "_activityIndicator");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "startAnimating");

  -[UIContentUnavailableView _button](self, "_button");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setNeedsUpdateConfiguration");

  -[UIContentUnavailableView _secondaryButton](self, "_secondaryButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setNeedsUpdateConfiguration");

  -[UIContentUnavailableView _clearInvalidFrameFlags](self, "_clearInvalidFrameFlags");
  _Block_object_dispose(&v107, 8);

  _Block_object_dispose(v113, 8);
}

uint64_t __42__UIContentUnavailableView_layoutSubviews__block_invoke_3(uint64_t a1, __n128 a2, uint64_t a3, uint64_t a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t result;

  v6 = *(double *)(a4 + 8);
  v7 = *(double *)(a4 + 24);
  v8 = *(double *)(a4 + 40);
  v9 = *(double *)a4 + *(double *)(a4 + 32) + *(double *)(a4 + 48);
  a2.n128_u64[0] = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 424))
  {
    if (*(_BYTE *)(a1 + 544))
      a2.n128_f64[0] = CGRectGetWidth(*(CGRect *)(a1 + 512)) - v9 - *(double *)(a1 + 72);
  }
  else
  {
    a2.n128_f64[0] = a2.n128_f64[0] + (*(double *)(a1 + 496) - v9) * 0.5;
  }
  result = (*(uint64_t (**)(__n128, double))(*(_QWORD *)(a1 + 32) + 16))(a2, 0.0);
  if (*(_BYTE *)(a4 + 16))
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v6
                                                                + v7
                                                                + v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
  return result;
}

uint64_t __42__UIContentUnavailableView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4, double a5, double a6)
{
  int v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v19[9];

  v9 = *(unsigned __int8 *)(a3 + 16);
  if (*(_BYTE *)(a1 + 56))
    v10 = (double *)(a3 + 48);
  else
    v10 = (double *)(a3 + 32);
  v11 = UIRectIntegralWithScale(a5 + *v10 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a6 + *(double *)(a3 + 24) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)a3, *(double *)(a3 + 8), *(double *)(a1 + 48));
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (v9
    && a4
    && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke_2;
    v19[3] = &unk_1E16B20D8;
    v19[4] = a2;
    *(double *)&v19[5] = v11;
    *(double *)&v19[6] = v13;
    *(double *)&v19[7] = v15;
    *(double *)&v19[8] = v17;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
LABEL_9:
    objc_msgSend(a2, "setAlpha:", 1.0);
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a2);
  }
  objc_msgSend(a2, "setFrame:", v11, v13, v15, v17);
  if (v9)
    goto LABEL_9;
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

- (UIContentUnavailableViewLayoutInfo)_computeLayoutInfoRestrictedToSize:(SEL)a3
{
  double height;
  double width;
  UIContentUnavailableConfiguration *v8;
  BOOL v9;
  _BOOL4 v10;
  double v11;
  double v12;
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
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGSize *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL prefersSideBySideButtonAndSecondaryButton;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  _BOOL4 var1;
  BOOL v50;
  BOOL v51;
  double v52;
  double v53;
  CGFloat v54;
  UIContentUnavailableViewLayoutInfo *result;
  double v56;
  double v57;
  void *v58;
  id v59;

  height = a4.height;
  width = a4.width;
  -[UIView traitCollection](self, "traitCollection");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  v8 = self->_configuration;
  _UIContentUnavailableConstantsForTraitCollection(v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft;
  v10 = -[UIContentUnavailableView isScrollEnabled](self, "isScrollEnabled");
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIContentUnavailableView _scrollViewInsets](self, "_scrollViewInsets");
  v21 = v12 - v20;
  v22 = v14 - v19;
  v24 = v16 - v23;
  v26 = v18 - v25;
  if (v14 - v19 + v26 >= width)
    v27 = width;
  else
    v27 = v14 - v19 + v26;
  if (v21 + v24 < height || v10)
    v29 = v21 + v24;
  else
    v29 = height;
  v30 = 2777777.0;
  if ((*(_WORD *)&self->_contentViewFlags & 1) != 0)
  {
    v56 = v22;
    v31 = v21;
    v32 = v26;
    v33 = v24;
    v34 = v29;
    v35 = v27;
    v30 = __UIViewReadableWidthForFont(0);
    v27 = v35;
    v29 = v34;
    v24 = v33;
    v26 = v32;
    v21 = v31;
    v22 = v56;
  }
  v36 = (CGSize *)MEMORY[0x1E0C9D820];
  v57 = v27;
  if (width - v27 < v30)
    v30 = width - v27;
  v37 = *MEMORY[0x1E0C9D820];
  v38 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  retstr->var2.var0 = 0u;
  v39 = fmax(v37, fmin(v30, width));
  retstr->var11 = 0u;
  retstr->var12 = 0u;
  v40 = fmax(v38, fmin(fmin(height - v29, 2777777.0), height));
  *(_OWORD *)&retstr->var10.top = 0u;
  *(_OWORD *)&retstr->var10.bottom = 0u;
  *(_OWORD *)&retstr->var5.var2.bottom = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var5.var0.height = 0u;
  *(_OWORD *)&retstr->var5.var2.top = 0u;
  *(_OWORD *)&retstr->var4.var2.leading = 0u;
  *(_OWORD *)&retstr->var4.var2.trailing = 0u;
  retstr->var4.var0 = 0u;
  *(_OWORD *)&retstr->var4.var1 = 0u;
  *(_OWORD *)&retstr->var3.var2.top = 0u;
  *(_OWORD *)&retstr->var3.var2.bottom = 0u;
  *(_OWORD *)&retstr->var2.var2.trailing = 0u;
  *(_OWORD *)&retstr->var3.var0.height = 0u;
  *(_OWORD *)&retstr->var2.var1 = 0u;
  *(_OWORD *)&retstr->var2.var2.leading = 0u;
  *(_OWORD *)&retstr->var1.var2.top = 0u;
  *(_OWORD *)&retstr->var1.var2.bottom = 0u;
  *(_OWORD *)&retstr->var0.var2.trailing = 0u;
  *(_OWORD *)&retstr->var1.var0.height = 0u;
  *(_OWORD *)&retstr->var0.var1 = 0u;
  *(_OWORD *)&retstr->var0.var2.leading = 0u;
  retstr->var0.var0 = 0u;
  if (v8)
    prefersSideBySideButtonAndSecondaryButton = v8->_prefersSideBySideButtonAndSecondaryButton;
  else
    prefersSideBySideButtonAndSecondaryButton = 0;
  retstr->var6 = prefersSideBySideButtonAndSecondaryButton;
  retstr->var7 = v9;
  retstr->var8 = v10;
  retstr->var9 = -[UIContentUnavailableConfiguration alignment](v8, "alignment");
  retstr->var10.top = v21;
  retstr->var10.leading = v22;
  retstr->var10.bottom = v24;
  retstr->var10.trailing = v26;
  retstr->var11 = *v36;
  retstr->var12.width = v39;
  retstr->var12.height = v40;
  -[UIContentUnavailableView _textLabel](self, "_textLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _button](self, "_button");
  v43 = objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _secondaryButton](self, "_secondaryButton");
  v44 = objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _secondaryTextLabel](self, "_secondaryTextLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _imageView](self, "_imageView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _activityIndicator](self, "_activityIndicator");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    retstr->var1.var1 = 1;
    -[UIContentUnavailableView _computeLayoutInfoForView:info:layoutInfo:](self, "_computeLayoutInfoForView:info:layoutInfo:", v42, &retstr->var1, retstr);
  }
  if (v43 | v44)
  {
    retstr->var3.var1 = v43 != 0;
    retstr->var4.var1 = v44 != 0;
    -[UIContentUnavailableView _computeButtonLayoutInfo:](self, "_computeButtonLayoutInfo:", retstr);
  }
  if (v45)
  {
    var1 = retstr->var1.var1;
    if (v42)
      v50 = !var1;
    else
      v50 = 0;
    v51 = !v50;
    retstr->var2.var1 = v51;
    v52 = 0.0;
    if (!var1
      || (-[UIContentUnavailableConfiguration textToSecondaryTextPadding](v8, "textToSecondaryTextPadding"),
          v52 = v53,
          v48 = 0.0,
          !retstr->var1.var1))
    {
      if (retstr->var3.var1 || retstr->var4.var1)
        -[UIContentUnavailableConfiguration textToButtonPadding](v8, "textToButtonPadding", v48);
      else
        v48 = 0.0;
    }
    retstr->var2.var2.top = v52 + retstr->var2.var2.top;
    retstr->var2.var2.bottom = v48 + retstr->var2.var2.bottom;
    -[UIContentUnavailableView _computeLayoutInfoForView:info:layoutInfo:](self, "_computeLayoutInfoForView:info:layoutInfo:", v45, &retstr->var2, retstr);
  }
  if (v46)
  {
    retstr->var0.var1 = 1;
    if (retstr->var1.var1 || retstr->var2.var1 || retstr->var3.var1 || (v48 = 0.0, retstr->var4.var1))
      -[UIContentUnavailableConfiguration imageToTextPadding](v8, "imageToTextPadding", v48);
    retstr->var0.var2.bottom = v48 + retstr->var0.var2.bottom;
    -[UIContentUnavailableView _computeLayoutInfoForView:info:layoutInfo:](self, "_computeLayoutInfoForView:info:layoutInfo:", v46, retstr, retstr);
  }
  if (v47)
  {
    retstr->var5.var1 = 1;
    if (retstr->var1.var1 || retstr->var2.var1 || retstr->var3.var1 || (v48 = 0.0, retstr->var4.var1))
      -[UIContentUnavailableConfiguration imageToTextPadding](v8, "imageToTextPadding", v48);
    retstr->var5.var2.bottom = v48 + retstr->var5.var2.bottom;
    -[UIContentUnavailableView _computeLayoutInfoForView:info:layoutInfo:](self, "_computeLayoutInfoForView:info:layoutInfo:", v47, &retstr->var5, retstr);
  }
  v54 = v29 + retstr->var11.height;
  retstr->var11.width = v57 + retstr->var11.width;
  retstr->var11.height = v54;

  return result;
}

- (UILabel)_secondaryTextLabel
{
  UILabel *secondaryTextLabel;

  if (-[UIView isHidden](self->_secondaryTextLabel, "isHidden"))
    secondaryTextLabel = 0;
  else
    secondaryTextLabel = self->_secondaryTextLabel;
  return secondaryTextLabel;
}

- (void)_computeLayoutInfoForView:(id)a3 info:(UIContentUnavailableViewElementLayoutInfo *)a4 layoutInfo:(UIContentUnavailableViewLayoutInfo *)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _BOOL4 v39;
  double v40;
  double v41;
  id v42;
  _BOOL4 v43;
  int v44;
  int v45;
  double width;
  double height;

  -[UIContentUnavailableView _alignmentInsetsForView:](self, "_alignmentInsetsForView:");
  v10 = a4->var2.top + v9;
  v12 = v11 + a4->var2.leading;
  v14 = v13 + a4->var2.bottom;
  v16 = v15 + a4->var2.trailing;
  a4->var2.top = v10;
  a4->var2.leading = v12;
  a4->var2.bottom = v14;
  a4->var2.trailing = v16;
  v17 = fmax(*MEMORY[0x1E0C9D820], fmin(a5->var12.width - v12 - v16, a5->var12.width));
  -[UIContentUnavailableView _textLabel](self, "_textLabel");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18 == a3)
  {

  }
  else
  {
    v19 = v18;
    -[UIContentUnavailableView _secondaryTextLabel](self, "_secondaryTextLabel");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20 != a3)
    {
      objc_msgSend(a3, "_intrinsicSizeWithinSize:", v17, 2777777.0);
      v22 = v21;
      v24 = v23;
      goto LABEL_6;
    }
  }
  v25 = *MEMORY[0x1E0C9D538];
  v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v27 = a3;
  objc_msgSend(v27, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v27, "numberOfLines"), v25, v26, v17, 2777777.0);
  v22 = v28;
  v24 = v29;

LABEL_6:
  -[UIContentUnavailableView _imageView](self, "_imageView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v30 == a3)
  {

  }
  else
  {
    v31 = v30;
    -[UIContentUnavailableView _activityIndicator](self, "_activityIndicator");
    v32 = (id)objc_claimAutoreleasedReturnValue();

    if (v32 != a3)
      goto LABEL_21;
  }
  -[UIContentUnavailableConfiguration imageProperties](self->_configuration, "imageProperties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "maximumSize");
  if (v22 >= v34)
    v36 = v34;
  else
    v36 = v22;
  if (v34 > 0.0)
    v22 = v36;
  if (v24 >= v35)
    v37 = v35;
  else
    v37 = v24;
  if (v35 > 0.0)
    v24 = v37;

LABEL_21:
  if (v22 >= v17)
    v22 = v17;
  a4->var0.width = v22;
  a4->var0.height = v24;
  if (a4->var1)
  {
    v38 = v14 + v10 + v24;
    v39 = v24 > 0.0 && v22 > 0.0;
    v40 = round(v38);
    v41 = round(a5->var12.height);
    if (a5->var8)
    {
      -[UIContentUnavailableView _imageView](self, "_imageView");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = v42 != a3;

    }
    else
    {
      v43 = 0;
    }
    v44 = v40 <= v41 || v43;
    v45 = v39 & v44;
    a4->var1 = v45;
    if (v45 == 1)
    {
      width = v16 + v12 + v22;
      height = a5->var11.height;
      if (a5->var11.width >= width)
        width = a5->var11.width;
      a5->var11.width = width;
      a5->var11.height = v38 + height;
      a5->var12.height = a5->var12.height - v38;
    }
  }
}

- (UIImageView)_imageView
{
  UIImageView *imageView;

  if (-[UIView isHidden](self->_imageView, "isHidden"))
    imageView = 0;
  else
    imageView = self->_imageView;
  return imageView;
}

- (UIActivityIndicatorView)_activityIndicator
{
  UIActivityIndicatorView *activityIndicator;

  if (-[UIView isHidden](self->_activityIndicator, "isHidden"))
    activityIndicator = 0;
  else
    activityIndicator = self->_activityIndicator;
  return activityIndicator;
}

- (UILabel)_textLabel
{
  UILabel *textLabel;

  if (-[UIView isHidden](self->_textLabel, "isHidden"))
    textLabel = 0;
  else
    textLabel = self->_textLabel;
  return textLabel;
}

- (NSDirectionalEdgeInsets)_alignmentInsetsForView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSDirectionalEdgeInsets result;

  objc_opt_class();
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a3;
    if (objc_msgSend(v8, "behavioralStyle") == 2
      || (objc_msgSend(v8, "_currentConfiguration"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "_hasObscuringBackground"),
          v9,
          (v10 & 1) != 0))
    {
      v11 = objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection");
      objc_msgSend(v8, "alignmentRectInsets");
      if (v11 == 1)
        v16 = v15;
      else
        v16 = v13;
      if (v11 != 1)
        v13 = v15;
      v7 = -v12;
      v6 = -v16;
      v5 = -v14;
      v4 = -v13;
    }
    else
    {
      objc_msgSend(v8, "_currentConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentInsets");
      v7 = -v18;
      v6 = -v19;
      v5 = -v20;
      v4 = -v21;

    }
  }
  v22 = v7;
  v23 = v6;
  v24 = v5;
  v25 = v4;
  result.trailing = v25;
  result.bottom = v24;
  result.leading = v23;
  result.top = v22;
  return result;
}

- (UIButton)_secondaryButton
{
  UIButton *secondaryButton;

  if (-[UIView isHidden](self->_secondaryButton, "isHidden"))
    secondaryButton = 0;
  else
    secondaryButton = self->_secondaryButton;
  return secondaryButton;
}

- (UIButton)_button
{
  UIButton *button;

  if (-[UIView isHidden](self->_button, "isHidden"))
    button = 0;
  else
    button = self->_button;
  return button;
}

- (BOOL)isScrollEnabled
{
  return (*(_WORD *)&self->_contentViewFlags & 1) != 0 || self->_scrollEnabled;
}

- (NSDirectionalEdgeInsets)_scrollViewInsets
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSDirectionalEdgeInsets result;

  -[UIContentUnavailableView _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "layoutDirection");

    objc_msgSend(v3, "adjustedContentInset");
    v9 = v8;
    v11 = v10;
    if (v5 == 1)
      v12 = v7;
    else
      v12 = v6;
    if (v5 == 1)
      v13 = v6;
    else
      v13 = v7;
  }
  else
  {
    v13 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v9 = 0.0;
  }

  v14 = v9;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  result.trailing = v17;
  result.bottom = v16;
  result.leading = v15;
  result.top = v14;
  return result;
}

- (_UIContentUnavailableScrollView)_scrollView
{
  return self->_scrollView;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width >= self->_preferredMaxLayoutWidth)
    a3.width = self->_preferredMaxLayoutWidth;
  -[UIContentUnavailableView _computeLayoutInfoRestrictedToSize:](self, "_computeLayoutInfoRestrictedToSize:", a3.width, a3.height, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v4 = 0.0;
  v3 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_clearInvalidFrameFlags
{
  *(_WORD *)&self->_contentViewFlags &= 0xFE07u;
}

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
  if (self->_scrollEnabled != scrollEnabled)
  {
    self->_scrollEnabled = scrollEnabled;
    -[UIContentUnavailableView _reconfigureKeyboardLayoutAdjustment](self, "_reconfigureKeyboardLayoutAdjustment");
    -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", self->_scrollEnabled);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __48___UIContentUnavailableView__rebuildConstraints__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a2, 4, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), 4, 1.0, 0.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "addObject:", v3);

}

- (UIContentUnavailableView)initWithCoder:(NSCoder *)coder
{
  void *v5;
  UIContentUnavailableView *v6;
  UIContentUnavailableView *v7;
  _QWORD v9[4];
  UIContentUnavailableView *v10;
  id v11;
  objc_super v12;

  -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIContentUnavailableView;
  v6 = -[UIView initWithCoder:](&v12, sel_initWithCoder_, coder);
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__UIContentUnavailableView_initWithCoder___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v7 = v6;
  v10 = v7;
  v11 = v5;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

LABEL_6:
  return v7;
}

uint64_t __42__UIContentUnavailableView_initWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIContentUnavailableView;
  -[UIView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"));
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsConfiguration:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

void __45__UIContentUnavailableView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a3)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_applyConfiguration:", *(_QWORD *)(a1 + 32));
    WeakRetained = v6;
  }

}

uint64_t __68__UIContentUnavailableView_scrollViewDidChangeAdjustedContentInset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[7];
  CGRect v23;

  if (a4)
  {
    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[UIContentUnavailableView _scrollView](self, "_scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyboardLayoutAlignmentView _endFrameForNotification:inView:](_UIKeyboardLayoutAlignmentView, "_endFrameForNotification:inView:", a3, v10);
    v6 = v11;
    v7 = v12;
    v8 = v13;
    v9 = v14;

  }
  v23.origin.x = v6;
  v23.origin.y = v7;
  v23.size.width = v8;
  v23.size.height = v9;
  if (!CGRectEqualToRect(v23, self->_keyboardFrame))
  {
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;
    *(_WORD *)&self->_contentViewFlags |= 2u;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(a3, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    objc_msgSend(a3, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationCurveUserInfoKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (int)objc_msgSend(v20, "intValue");

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke;
    v22[3] = &unk_1E16B4E70;
    v22[5] = v18;
    v22[6] = (v21 << 16) | 6;
    v22[4] = self;
    +[UIView _performWithAnimation:](UIView, "_performWithAnimation:", v22);
    *(_WORD *)&self->_contentViewFlags &= ~2u;
  }
}

uint64_t __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke(double *a1)
{
  double v1;
  uint64_t v2;
  _QWORD v4[5];

  v1 = a1[5];
  v2 = *((_QWORD *)a1 + 6);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke_2;
  v4[3] = &unk_1E16B1B28;
  *(double *)&v4[4] = a1[4];
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v2, v4, 0, v1, 0.0);
}

uint64_t __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_keyboardAboutToShow:(id)a3
{
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
    -[UIContentUnavailableView _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", a3, 0);
}

- (void)_keyboardAboutToChangeFrame:(id)a3
{
  -[UIContentUnavailableView _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", a3, 0);
}

- (void)_keyboardAboutToHide:(id)a3
{
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
    -[UIContentUnavailableView _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", a3, 1);
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)UIContentUnavailableView;
  -[UIView _prepareForFirstIntrinsicContentSizeCalculation](&v2, sel__prepareForFirstIntrinsicContentSizeCalculation);
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UIContentUnavailableView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (double)_preferredMaxLayoutWidth
{
  double result;

  result = 0.0;
  if ((*(_QWORD *)&self->super._viewFlags & 0x4000000000000) == 0)
    return self->_preferredMaxLayoutWidth;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (a3.height <= 0.0)
    a3.height = 1.79769313e308;
  -[UIContentUnavailableView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = 1.79769313e308;
  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (height > 0.0)
    v9 = height;
  -[UIContentUnavailableView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
  if (a4 >= 1000.0)
    v10 = width;
  if (a5 >= 1000.0)
    v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIContentUnavailableView *v5;
  UIContentUnavailableView *v6;
  UIContentUnavailableView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIContentUnavailableView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIContentUnavailableView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)_computeButtonLayoutInfo:(UIContentUnavailableViewLayoutInfo *)a3
{
  void *v5;
  UIContentUnavailableConfiguration *v6;
  _BOOL4 var1;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  BOOL v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double top;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double height;
  _BOOL4 v76;
  BOOL v78;
  double width;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double bottom;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  id v94;

  -[UIContentUnavailableView _button](self, "_button");
  v94 = (id)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _secondaryButton](self, "_secondaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_configuration;
  var1 = a3->var3.var1;
  v8 = a3->var4.var1;
  -[UIContentUnavailableConfiguration buttonToSecondaryButtonPadding](v6, "buttonToSecondaryButtonPadding");
  v10 = v9;
  if (a3->var1.var1 || a3->var2.var1)
  {
    -[UIContentUnavailableConfiguration textToButtonPadding](v6, "textToButtonPadding");
    v12 = v11;
  }
  else
  {
    v12 = 0.0;
  }
  v13 = -[UIContentUnavailableView _prefersEqualButtonAndSecondaryButtonWidths](self, "_prefersEqualButtonAndSecondaryButtonWidths");
  v14 = !v8 || !var1;
  v15 = !v14;
  v16 = !v14 && v13;
  if (a3->var6)
    v17 = v15;
  else
    v17 = 0;
  -[UIContentUnavailableView _alignmentInsetsForView:](self, "_alignmentInsetsForView:", v94);
  v19 = v18;
  v88 = v20;
  top = a3->var3.var2.top;
  bottom = a3->var3.var2.bottom;
  v23 = v22 + a3->var3.var2.leading;
  v25 = v24 + a3->var3.var2.trailing;
  -[UIContentUnavailableView _alignmentInsetsForView:](self, "_alignmentInsetsForView:", v5);
  v29 = v27 + a3->var4.var2.leading;
  v31 = v30 + a3->var4.var2.trailing;
  v92 = v23;
  v93 = v25;
  v91 = v31;
  if (var1 && v8)
  {
    if (v17)
    {
      v90 = v10 + v29;
      v32 = v23 + v10 + v29 + 0.0;
      v33 = v25 + v31 + 0.0;
      v86 = v12;
    }
    else
    {
      v86 = v10;
      v90 = v27 + a3->var4.var2.leading;
      if (v23 >= v29)
        v35 = v23;
      else
        v35 = v27 + a3->var4.var2.leading;
      v32 = v35 + 0.0;
      if (v25 >= v31)
        v31 = v25;
      v33 = v31 + 0.0;
    }
  }
  else
  {
    if (var1)
      v34 = -0.0;
    else
      v34 = v12;
    v86 = v34;
    if (var1)
    {
      v33 = v25;
    }
    else
    {
      v12 = -0.0;
      v33 = v31;
    }
    v90 = v27 + a3->var4.var2.leading;
    if (var1)
      v32 = v23;
    else
      v32 = v27 + a3->var4.var2.leading;
  }
  v36 = top + v19;
  v37 = a3->var4.var2.bottom;
  v38 = a3->var4.var2.top + v26;
  v40 = *MEMORY[0x1E0C9D820];
  v39 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v41 = fmax(*MEMORY[0x1E0C9D820], fmin(a3->var12.width - v32 - v33, a3->var12.width));
  v42 = v39;
  v43 = *MEMORY[0x1E0C9D820];
  if (var1)
  {
    v44 = v28;
    objc_msgSend(v94, "_intrinsicSizeWithinSize:", v41, 2777777.0);
    v28 = v44;
    v43 = v45;
  }
  v81 = v42;
  v83 = v36 + v12;
  v85 = v88 + bottom;
  v87 = v38 + v86;
  v89 = v28 + v37;
  if (v8)
  {
    objc_msgSend(v5, "_intrinsicSizeWithinSize:", v41, 2777777.0);
    v40 = v46;
    v39 = v47;
  }
  -[UIContentUnavailableConfiguration buttonProperties](v6, "buttonProperties", *(_QWORD *)&v81);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minimumSize");
  v50 = v49;
  v52 = v51;

  -[UIContentUnavailableConfiguration secondaryButtonProperties](v6, "secondaryButtonProperties");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "minimumSize");
  v55 = v54;
  v57 = v56;

  if (v43 >= v50)
    v58 = v43;
  else
    v58 = v50;
  if (v82 >= v52)
    v59 = v82;
  else
    v59 = v52;
  if (v40 >= v55)
    v60 = v40;
  else
    v60 = v55;
  if (v39 >= v57)
    v61 = v39;
  else
    v61 = v57;
  if (v58 >= v41)
    v58 = v41;
  if (v60 >= v41)
    v60 = v41;
  if (v58 >= v60)
    v62 = v58;
  else
    v62 = v60;
  if (v16)
    v63 = v62;
  else
    v63 = v60;
  if (!v16)
    v62 = v58;
  v64 = v93 + v92 + v62;
  v65 = v85 + v83 + v59;
  v66 = v91 + v90 + v63;
  v67 = v89 + v87 + v61;
  if (v64 >= v66)
    v68 = v93 + v92 + v62;
  else
    v68 = v91 + v90 + v63;
  v69 = v65 + v67;
  v70 = v64 + v66;
  if (v65 >= v67)
    v71 = v85 + v83 + v59;
  else
    v71 = v89 + v87 + v61;
  if (v17)
    v72 = v70;
  else
    v72 = v68;
  if (v17)
    v73 = v71;
  else
    v73 = v69;
  if (v17 && round(v72) > round(a3->var12.width))
  {
    a3->var6 = 0;
    -[UIContentUnavailableView _computeButtonLayoutInfo:](self, "_computeButtonLayoutInfo:", a3);
    goto LABEL_99;
  }
  if (var1 && v62 > 0.0 && v59 > 0.0)
  {
    v74 = round(v73);
    height = a3->var12.height;
  }
  else
  {
    v76 = 0;
    height = a3->var12.height;
    if (!v8 || v63 <= 0.0 || v61 <= 0.0)
      goto LABEL_92;
    v74 = round(v73);
  }
  v76 = v74 <= round(height) || a3->var8;
LABEL_92:
  a3->var3.var0.width = v62;
  a3->var3.var0.height = v59;
  a3->var3.var1 &= v76;
  a3->var3.var2.top = v83;
  a3->var3.var2.leading = v92;
  a3->var3.var2.bottom = v85;
  a3->var3.var2.trailing = v93;
  a3->var4.var0.width = v63;
  a3->var4.var0.height = v61;
  v78 = a3->var4.var1 && v76;
  a3->var4.var1 = v78;
  a3->var4.var2.top = v87;
  a3->var4.var2.leading = v90;
  a3->var4.var2.bottom = v89;
  a3->var4.var2.trailing = v91;
  a3->var6 = v17;
  if (v76)
  {
    width = a3->var11.width;
    if (width < v72)
      width = v72;
    v80 = v73 + a3->var11.height;
    a3->var11.width = width;
    a3->var11.height = v80;
    a3->var12.height = height - v73;
  }
LABEL_99:

}

- (BOOL)_prefersEqualButtonAndSecondaryButtonWidths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  char v9;

  -[UIContentUnavailableView _button](self, "_button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView _secondaryButton](self, "_secondaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_currentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_hasObscuringBackground"))
  {
    objc_msgSend(v4, "_currentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_hasObscuringBackground");

  }
  else
  {
    v7 = 0;
  }

  v8 = objc_msgSend(v3, "behavioralStyle") == 2 && objc_msgSend(v4, "behavioralStyle") == 2;
  v9 = v7 | v8;

  return v9;
}

uint64_t __42__UIContentUnavailableView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

double __42__UIContentUnavailableView_layoutSubviews__block_invoke_4(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5, double *a6, uint64_t a7)
{
  double v12;
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
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, __int128 *, uint64_t, uint64_t, double *, uint64_t);
  __int128 v27;
  void (*v28)(double, double);
  __int128 v29;
  uint64_t v30;
  double result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v12 = a3[1];
  v13 = a3[3];
  v14 = a3[5];
  v15 = *a3 + a3[4] + a3[6];
  v16 = a6[1];
  v17 = a6[3];
  v18 = a6[5];
  v19 = v15 + *a6 + a6[4] + a6[6];
  v20 = *(double *)(a1 + 56);
  if (*(_QWORD *)(a1 + 424))
  {
    if (*(_BYTE *)(a1 + 544))
      v20 = CGRectGetWidth(*(CGRect *)(a1 + 512)) - v19 - *(double *)(a1 + 72);
  }
  else
  {
    v20 = v20 + (*(double *)(a1 + 496) - v19) * 0.5;
  }
  v21 = v16 + v17 + v18;
  if (v12 + v13 + v14 >= v21)
    v22 = v12 + v13 + v14;
  else
    v22 = v16 + v17 + v18;
  v23 = v15 + v20;
  v24 = (v22 - v21) * 0.5;
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void (**)(uint64_t, uint64_t, __int128 *, uint64_t, uint64_t, double *, uint64_t))(v25 + 16);
  v27 = *((_OWORD *)a3 + 1);
  v32 = *(_OWORD *)a3;
  v33 = v27;
  v34 = *((_OWORD *)a3 + 2);
  v35 = *((_QWORD *)a3 + 6);
  v26(v25, a2, &v32, a4, a5, a6, a7);
  v28 = *(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16);
  v29 = *((_OWORD *)a6 + 1);
  v32 = *(_OWORD *)a6;
  v33 = v29;
  v34 = *((_OWORD *)a6 + 2);
  v35 = *((_QWORD *)a6 + 6);
  v28(v23, v24);
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v22 + *(double *)(v30 + 40);
  *(double *)(v30 + 40) = result;
  return result;
}

- (_UISystemBackgroundView)_backgroundView
{
  return self->_backgroundView;
}

void __73___UIContentUnavailableView__buttonBackgroundImageForStyle_controlState___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_9_10;
  _MergedGlobals_9_10 = (uint64_t)v0;

}

void __73___UIContentUnavailableView__buttonBackgroundImageForStyle_controlState___block_invoke_2(uint64_t a1)
{
  _QWORD *ContextStack;
  CGContext *v3;
  _QWORD *v4;
  CGContext *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v3 = 0;
  else
    v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetFillColorWithColor(v3, *(CGColorRef *)(a1 + 32));
  v4 = GetContextStack(0);
  if (*(int *)v4 < 1)
    v5 = 0;
  else
    v5 = (CGContext *)v4[3 * (*(_DWORD *)v4 - 1) + 1];
  CGContextSetStrokeColorWithColor(v5, *(CGColorRef *)(a1 + 32));
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  v9 = *(double *)(a1 + 64);
  v10 = *(double *)(a1 + 72);
  if (!*(_QWORD *)(a1 + 80))
  {
    *(CGRect *)&v6 = CGRectInset(*(CGRect *)&v6, 0.5, 0.5);
    v10 = v10 + -0.5;
  }
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 80);
  if (!v12)
  {
    v13 = v11;
    objc_msgSend(v11, "stroke");
    goto LABEL_13;
  }
  if (v12 == 1)
  {
    v13 = v11;
    objc_msgSend(v11, "fill");
LABEL_13:
    v11 = v13;
  }

}

void __65___UIContentUnavailableView_windowWillAnimateRotateNotification___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat Width;
  uint64_t v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UISnapshotView *obj;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setHidden:", 1);
  obj = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](obj, "captureSnapshotRect:fromView:withSnapshotType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setHidden:", 0);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 504), obj);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "bounds");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "bounds");
  Width = CGRectGetWidth(v25);
  v7 = *(_QWORD *)(a1 + 32);
  if (Width > *(double *)(v7 + 512))
  {
    objc_msgSend(*(id *)(v7 + 504), "bounds");
    v8 = CGRectGetWidth(v26);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "bounds");
    v9 = v8 - CGRectGetWidth(v27);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "bounds");
    v10 = CGRectGetMidX(v28) + v9 * -0.5;
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
    objc_msgSend(v11, "bounds");
    objc_msgSend(v11, "_setContentStretchInPixels:forContentSize:shouldTile:", 0, v10, v3, v9, v5, v12, v13);
    v7 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v7 + 456), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentationLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setFrame:", v17, v19, v21, v23);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));

}

@end
