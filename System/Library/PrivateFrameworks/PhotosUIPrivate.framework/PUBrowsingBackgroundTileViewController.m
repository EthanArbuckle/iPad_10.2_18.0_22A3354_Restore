@implementation PUBrowsingBackgroundTileViewController

- (PUBrowsingBackgroundTileViewController)initWithReuseIdentifier:(id)a3
{
  PUBrowsingBackgroundTileViewController *result;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUBrowsingBackgroundTileViewController;
  result = -[PUTileController initWithReuseIdentifier:](&v5, sel_initWithReuseIdentifier_, a3);
  if (result)
  {
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->__emptyPlaceholderFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->__emptyPlaceholderFrame.size = v4;
  }
  return result;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingBackgroundTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUBrowsingBackgroundTileViewController _updateColorIfNeeded](self, "_updateColorIfNeeded");
  -[PUBrowsingBackgroundTileViewController _updateEmptyPlaceholderAnimated:](self, "_updateEmptyPlaceholderAnimated:", 0);
  -[PUBrowsingBackgroundTileViewController _updateBackgroundBlurViewAnimated:](self, "_updateBackgroundBlurViewAnimated:", 0);
}

- (void)applyLayoutInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUBrowsingBackgroundTileViewController;
  v4 = a3;
  -[PUTileViewController applyLayoutInfo:](&v13, sel_applyLayoutInfo_, v4);
  -[PUBrowsingBackgroundTileViewController _emptyPlaceholderFrameForLayoutInfo:](self, "_emptyPlaceholderFrameForLayoutInfo:", v4, v13.receiver, v13.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[PUBrowsingBackgroundTileViewController _setEmptyPlaceholderFrame:](self, "_setEmptyPlaceholderFrame:", v6, v8, v10, v12);
}

- (void)setViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  PUBrowsingViewModel *viewModel;
  PUBrowsingViewModel *v7;

  v5 = (PUBrowsingViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PUBrowsingViewModel unregisterChangeObserver:](viewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_viewModel, "registerChangeObserver:", self);
    -[PUBrowsingBackgroundTileViewController _invalidateColor](self, "_invalidateColor");
    v5 = v7;
  }

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingBackgroundTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUBrowsingBackgroundTileViewController setViewModel:](self, "setViewModel:", 0);
  -[PUBrowsingBackgroundTileViewController setBackgroundColorOverride:](self, "setBackgroundColorOverride:", 0);
  -[PUBrowsingBackgroundTileViewController setVisualEffect:](self, "setVisualEffect:", 0);
}

- (void)setBackgroundColorOverride:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_backgroundColorOverride != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColorOverride, a3);
      -[PUBrowsingBackgroundTileViewController _invalidateColor](self, "_invalidateColor");
      v6 = v8;
    }
  }

}

- (void)_invalidateColor
{
  -[PUBrowsingBackgroundTileViewController _invalidateColorWithAnimatorBlock:](self, "_invalidateColorWithAnimatorBlock:", 0);
}

- (void)_invalidateColorWithAnimatorBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[PUBrowsingBackgroundTileViewController _setNeedsUpdateColor:](self, "_setNeedsUpdateColor:", 1);
  -[PUBrowsingBackgroundTileViewController _setNextColorUpdateAnimatorBlock:](self, "_setNextColorUpdateAnimatorBlock:", v4);

  -[PUBrowsingBackgroundTileViewController _updateColorIfNeeded](self, "_updateColorIfNeeded");
}

- (void)_updateColorIfNeeded
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  _QWORD aBlock[5];

  if (-[PUBrowsingBackgroundTileViewController _needsUpdateColor](self, "_needsUpdateColor")
    && -[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUBrowsingBackgroundTileViewController _setNeedsUpdateColor:](self, "_setNeedsUpdateColor:", 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PUBrowsingBackgroundTileViewController__updateColorIfNeeded__block_invoke;
    aBlock[3] = &unk_1E58ABD10;
    aBlock[4] = self;
    v3 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PUBrowsingBackgroundTileViewController _nextColorUpdateAnimatorBlock](self, "_nextColorUpdateAnimatorBlock");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t, void (**)(_QWORD), _QWORD))(v4 + 16))(v4, v3, 0);
    else
      v3[2](v3);

  }
}

- (void)setShouldDisplayEmptyPlaceholder:(BOOL)a3
{
  if (self->_shouldDisplayEmptyPlaceholder != a3)
  {
    self->_shouldDisplayEmptyPlaceholder = a3;
    -[PUBrowsingBackgroundTileViewController _updateEmptyPlaceholderAnimated:](self, "_updateEmptyPlaceholderAnimated:", 0);
  }
}

- (void)_setEmptyPlaceholderFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_emptyPlaceholderFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_emptyPlaceholderFrame = &self->__emptyPlaceholderFrame;
  if (!CGRectEqualToRect(self->__emptyPlaceholderFrame, a3))
  {
    p_emptyPlaceholderFrame->origin.x = x;
    p_emptyPlaceholderFrame->origin.y = y;
    p_emptyPlaceholderFrame->size.width = width;
    p_emptyPlaceholderFrame->size.height = height;
    -[PUBrowsingBackgroundTileViewController _updateEmptyPlaceholderAnimated:](self, "_updateEmptyPlaceholderAnimated:", 0);
  }
}

- (CGRect)_emptyPlaceholderFrameForLayoutInfo:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = a3;
  -[PUTileViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");

  objc_msgSend(v4, "expandedRectInsets");
  PXEdgeInsetsAbsoluteValue();
  PXEdgeInsetsInsetRect();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_updateEmptyPlaceholderAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL IsNull;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  CGRect v46;

  v3 = a3;
  if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[PUBrowsingBackgroundTileViewController shouldDisplayEmptyPlaceholder](self, "shouldDisplayEmptyPlaceholder"))
    {
      -[PUBrowsingBackgroundTileViewController viewModel](self, "viewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetsDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
      {
        -[PUBrowsingBackgroundTileViewController _emptyPlaceholderFrame](self, "_emptyPlaceholderFrame");
        IsNull = CGRectIsNull(v46);

        if (!IsNull)
        {
          -[PUBrowsingBackgroundTileViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            -[PUBrowsingBackgroundTileViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              -[PUBrowsingBackgroundTileViewController _emptyPlaceholderFrame](self, "_emptyPlaceholderFrame");
              v11 = v10;
              v13 = v12;
              v15 = v14;
              v17 = v16;
              -[PUBrowsingBackgroundTileViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
              v39 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setFrame:", v11, v13, v15, v17);

            }
            return;
          }
          -[PUBrowsingBackgroundTileViewController _emptyPlaceholderFrame](self, "_emptyPlaceholderFrame");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUBrowsingBackgroundTileViewController emptyPlaceholderCustomTitle](self, "emptyPlaceholderCustomTitle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v20, "setText:", v31);
          }
          else
          {
            PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setText:", v32);

          }
          -[PUBrowsingBackgroundTileViewController emptyPlaceholderCustomSubtitle](self, "emptyPlaceholderCustomSubtitle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v20, "setSecondaryText:", v33);
          }
          else
          {
            PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "string");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setSecondaryText:", v35);

          }
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v20);
          objc_msgSend(v36, "setFrame:", v24, v26, v28, v30);
          objc_msgSend(v36, "setAutoresizingMask:", 18);
          objc_msgSend(v36, "setNeedsUpdateConstraints");
          -[PUBrowsingBackgroundTileViewController _setEmptyPlaceholderView:](self, "_setEmptyPlaceholderView:", v36);
          -[PUTileViewController view](self, "view");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addSubview:", v36);

          if (v3)
          {
            objc_msgSend(v36, "setAlpha:", 0.0);
            v38 = (void *)MEMORY[0x1E0DC3F10];
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke;
            v44[3] = &unk_1E58ABD10;
            v45 = v36;
            objc_msgSend(v38, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v44, 0);

          }
LABEL_14:

          return;
        }
      }
      else
      {

      }
    }
    -[PUBrowsingBackgroundTileViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      return;
    -[PUBrowsingBackgroundTileViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v3)
    {
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v22 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_2;
      v42[3] = &unk_1E58ABD10;
      v43 = v19;
      v40[0] = v22;
      v40[1] = 3221225472;
      v40[2] = __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_3;
      v40[3] = &unk_1E58A9910;
      v41 = v43;
      objc_msgSend(v21, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v42, v40);

    }
    else
    {
      objc_msgSend(v19, "removeFromSuperview");
    }
    -[PUBrowsingBackgroundTileViewController _setEmptyPlaceholderView:](self, "_setEmptyPlaceholderView:", 0);
    goto LABEL_14;
  }
}

- (void)setVisualEffect:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIVisualEffect isEqual:](self->_visualEffect, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualEffect, a3);
    -[PUBrowsingBackgroundTileViewController _updateBackgroundBlurViewAnimated:](self, "_updateBackgroundBlurViewAnimated:", 0);
  }

}

- (void)_updateBackgroundBlurViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = a3;
  if (-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUBrowsingBackgroundTileViewController visualEffect](self, "visualEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUBrowsingBackgroundTileViewController _backgroundBlurView](self, "_backgroundBlurView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v6)
      {
        -[PUBrowsingBackgroundTileViewController _backgroundBlurView](self, "_backgroundBlurView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[PUTileViewController view](self, "view");
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "bounds");
          v9 = v8;
          v11 = v10;
          v13 = v12;
          v15 = v14;
          -[PUBrowsingBackgroundTileViewController _backgroundBlurView](self, "_backgroundBlurView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

        }
        return;
      }
      v21 = objc_alloc(MEMORY[0x1E0DC3F58]);
      -[PUBrowsingBackgroundTileViewController visualEffect](self, "visualEffect");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v21, "initWithEffect:", v22);

      -[PUTileViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      objc_msgSend(v18, "setFrame:");

      objc_msgSend(v18, "setAutoresizingMask:", 18);
      objc_msgSend(v18, "setNeedsUpdateConstraints");
      -[PUBrowsingBackgroundTileViewController _setBackgroundBlurView:](self, "_setBackgroundBlurView:", v18);
      -[PUTileViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addSubview:", v18);

      if (v3)
      {
        objc_msgSend(v18, "setAlpha:", 0.0);
        v25 = (void *)MEMORY[0x1E0DC3F10];
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke;
        v31[3] = &unk_1E58ABD10;
        v32 = v18;
        objc_msgSend(v25, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v31, 0);

      }
    }
    else
    {
      if (!v6)
        return;
      -[PUBrowsingBackgroundTileViewController _backgroundBlurView](self, "_backgroundBlurView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v3)
      {
        v19 = (void *)MEMORY[0x1E0DC3F10];
        v20 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_2;
        v29[3] = &unk_1E58ABD10;
        v30 = v17;
        v27[0] = v20;
        v27[1] = 3221225472;
        v27[2] = __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_3;
        v27[3] = &unk_1E58A9910;
        v28 = v30;
        objc_msgSend(v19, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v29, v27);

      }
      else
      {
        objc_msgSend(v17, "removeFromSuperview");
      }
      -[PUBrowsingBackgroundTileViewController _setBackgroundBlurView:](self, "_setBackgroundBlurView:", 0);
    }

  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "chromeVisibilityDidChange"))
  {
    -[PUBrowsingBackgroundTileViewController backgroundColorOverride](self, "backgroundColorOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      PUBackgroundColorAnimatorBlockForChromeAnimation(v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingBackgroundTileViewController _invalidateColorWithAnimatorBlock:](self, "_invalidateColorWithAnimatorBlock:", v8);

    }
  }
  if (objc_msgSend(v6, "assetsDataSourceDidChange"))
  {
    -[PUBrowsingBackgroundTileViewController _updateEmptyPlaceholderAnimated:](self, "_updateEmptyPlaceholderAnimated:", 1);
    -[PUBrowsingBackgroundTileViewController _updateBackgroundBlurViewAnimated:](self, "_updateBackgroundBlurViewAnimated:", 1);
  }

}

- (UIColor)backgroundColorOverride
{
  return self->_backgroundColorOverride;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (BOOL)shouldDisplayEmptyPlaceholder
{
  return self->_shouldDisplayEmptyPlaceholder;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (NSString)emptyPlaceholderCustomTitle
{
  return self->_emptyPlaceholderCustomTitle;
}

- (void)setEmptyPlaceholderCustomTitle:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderCustomTitle, a3);
}

- (NSString)emptyPlaceholderCustomSubtitle
{
  return self->_emptyPlaceholderCustomSubtitle;
}

- (void)setEmptyPlaceholderCustomSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_emptyPlaceholderCustomSubtitle, a3);
}

- (BOOL)_needsUpdateColor
{
  return self->__needsUpdateColor;
}

- (void)_setNeedsUpdateColor:(BOOL)a3
{
  self->__needsUpdateColor = a3;
}

- (id)_nextColorUpdateAnimatorBlock
{
  return self->__nextColorUpdateAnimatorBlock;
}

- (void)_setNextColorUpdateAnimatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (UIContentUnavailableView)_emptyPlaceholderView
{
  return self->__emptyPlaceholderView;
}

- (void)_setEmptyPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->__emptyPlaceholderView, a3);
}

- (CGRect)_emptyPlaceholderFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__emptyPlaceholderFrame.origin.x;
  y = self->__emptyPlaceholderFrame.origin.y;
  width = self->__emptyPlaceholderFrame.size.width;
  height = self->__emptyPlaceholderFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIVisualEffectView)_backgroundBlurView
{
  return self->__backgroundBlurView;
}

- (void)_setBackgroundBlurView:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundBlurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundBlurView, 0);
  objc_storeStrong((id *)&self->__emptyPlaceholderView, 0);
  objc_storeStrong(&self->__nextColorUpdateAnimatorBlock, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderCustomSubtitle, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderCustomTitle, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_backgroundColorOverride, 0);
}

uint64_t __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __76__PUBrowsingBackgroundTileViewController__updateBackgroundBlurViewAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __74__PUBrowsingBackgroundTileViewController__updateEmptyPlaceholderAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __62__PUBrowsingBackgroundTileViewController__updateColorIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "backgroundColorOverride");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isChromeVisible");

    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 1) != 0)
      objc_msgSend(v5, "photoBrowserChromeVisibleBackgroundColor");
    else
      objc_msgSend(v5, "photoBrowserChromeHiddenBackgroundColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v2 = (uint64_t)v8;
  }
  v9 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

}

@end
