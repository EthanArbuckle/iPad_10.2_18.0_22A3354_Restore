@implementation _UIPreviewPresentationController2

- (_UIPreviewPresentationController2)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 previewingContext:(id)a5
{
  id v8;
  _UIPreviewPresentationController2 *v9;
  _UIPreviewPresentationController2 *v10;
  __int128 v11;
  _UIPreviewPresentationController2 *v12;
  _OWORD v14[3];
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIPreviewPresentationController2;
  v9 = -[UIPreviewPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[_UIPreviewPresentationController2 setShouldScaleContentViewToAspectFitPlatter:](v9, "setShouldScaleContentViewToAspectFitPlatter:", 1);
    -[_UIPreviewPresentationController2 setPreviewingContext:](v10, "setPreviewingContext:", v8);
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v14[0] = *MEMORY[0x1E0C9BAA8];
    v14[1] = v11;
    v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[_UIPreviewPresentationController2 setPreferredContentPlatterTransform:](v10, "setPreferredContentPlatterTransform:", v14);
    v12 = v10;
  }

  return v10;
}

- (void)_presentationTransitionWillBeginForContainerEffectView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController2;
  v4 = a3;
  -[UIPreviewPresentationController _presentationTransitionWillBeginForContainerEffectView:](&v6, sel__presentationTransitionWillBeginForContainerEffectView_, v4);
  -[_UIPreviewPresentationController2 _prepareRevealPlatterViewForPresentationTransitionIfNeeded:](self, "_prepareRevealPlatterViewForPresentationTransitionIfNeeded:", v4, v6.receiver, v6.super_class);
  -[_UIPreviewPresentationController2 _prepareContentPlatterViewForPresentationTransitionIfNeeded:](self, "_prepareContentPlatterViewForPresentationTransitionIfNeeded:", v4);

  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");
  objc_msgSend(v5, "layoutIfNeeded");
  -[_UIPreviewPresentationController2 _prepareContentViewsForPresentationAnimationsIfNeeded](self, "_prepareContentViewsForPresentationAnimationsIfNeeded");

}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIPreviewPresentationController2;
  -[UIPreviewPresentationController presentationTransitionWillBegin](&v11, sel_presentationTransitionWillBegin);
  -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIPreviewPresentationController2 revealPlatterView](self, "revealPlatterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIPreviewPresentationController2 currentHighlighter](self, "currentHighlighter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "highlightShouldBeginInContainerView:presentationContainerView:previewingContext:", v5, v7, v8);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68___UIPreviewPresentationController2_presentationTransitionWillBegin__block_invoke;
    v10[3] = &unk_1E16B1B28;
    v10[4] = self;
    -[_UIPreviewPresentationController2 _performTransitionAnimations:](self, "_performTransitionAnimations:", v10);

  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController2;
  -[UIPreviewPresentationController presentationTransitionDidEnd:](&v3, sel_presentationTransitionDidEnd_, a3);
}

- (void)dismissalTransitionWillBegin
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController2;
  -[UIPreviewPresentationController dismissalTransitionWillBegin](&v4, sel_dismissalTransitionWillBegin);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65___UIPreviewPresentationController2_dismissalTransitionWillBegin__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[_UIPreviewPresentationController2 _performTransitionAnimations:](self, "_performTransitionAnimations:", v3);
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController2;
  -[UIPreviewPresentationController dismissalTransitionDidEnd:](&v3, sel_dismissalTransitionDidEnd_, a3);
}

- (void)containerViewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController2;
  -[UIPresentationController containerViewDidLayoutSubviews](&v3, sel_containerViewDidLayoutSubviews);
  if (!-[_UIPreviewPresentationController2 hasPerformedInitialLayout](self, "hasPerformedInitialLayout"))
  {
    -[_UIPreviewPresentationController2 setHasPerformedInitialLayout:](self, "setHasPerformedInitialLayout:", 1);
    -[_UIPreviewPresentationController2 _layoutContentViews](self, "_layoutContentViews");
  }
}

- (void)_layoutContentViews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double Width;
  double v30;
  double Height;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _QWORD v43[13];
  _QWORD v44[4];
  id v45;
  CGRect v46;
  CGRect v47;

  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:");
  v14 = v13;
  v16 = v15;
  v39 = v18;
  v40 = v17;
  -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v16;
  v42 = v14;
  if (v19)
  {
    -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferredSourceViewRectInCoordinateSpace:", v4);
    v35 = v22;
    v37 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v37 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  if (-[_UIPreviewPresentationController2 shouldScaleContentViewToAspectFitPlatter](self, "shouldScaleContentViewToAspectFitPlatter"))
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "preferredContentSize");
    Width = v28;
    Height = v30;

    if (Width == 0.0)
    {
      v46.origin.x = v6;
      v46.origin.y = v8;
      v46.size.width = v10;
      v46.size.height = v12;
      Width = CGRectGetWidth(v46);
    }
    if (Height == 0.0)
    {
      v47.origin.x = v6;
      v47.origin.y = v8;
      v47.size.width = v10;
      v47.size.height = v12;
      Height = CGRectGetHeight(v47);
    }
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView", v35, v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __56___UIPreviewPresentationController2__layoutContentViews__block_invoke;
  v44[3] = &unk_1E16B1B28;
  v45 = v32;
  v33 = v32;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v44);
  objc_msgSend(v33, "setContentSize:", Width, Height);
  objc_msgSend(v33, "setFrame:", v42, v41, v40, v39);
  objc_msgSend(v33, "setCornerRadius:", 13.0);
  objc_msgSend(v33, "setDropShadowEnabled:", 1);
  -[_UIPreviewPresentationController2 preferredContentPlatterTransform](self, "preferredContentPlatterTransform");
  *(_OWORD *)v43 = *(_OWORD *)&v43[7];
  *(_OWORD *)&v43[2] = *(_OWORD *)&v43[9];
  *(_OWORD *)&v43[4] = *(_OWORD *)&v43[11];
  objc_msgSend(v33, "setTransform:", v43);
  -[_UIPreviewPresentationController2 revealPlatterView](self, "revealPlatterView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v24, v26);
  objc_msgSend(v34, "setCenter:", v38 + v24 * 0.5, v36 + v26 * 0.5);
  objc_msgSend(v34, "setDropShadowEnabled:", 0);

}

- (CGRect)_preferredContentPlatterRectForContainerRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    _UIPreviewInteractionPlatterInsetsForRect(x, y, width, height);
    v8 = x + v12;
    v9 = y + v13;
    v10 = width - (v12 + v14);
    v11 = height - (v13 + v15);
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSize");
    v18 = v17;
    v20 = v19;

    if (v18 != *MEMORY[0x1E0C9D820] || v20 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      if (v18 <= 0.0)
        v22 = v10;
      else
        v22 = v18;
      if (v20 <= 0.0)
        v23 = v11;
      else
        v23 = v20;
      v24 = v22 / v23;
      if (v24 <= v10 / v11)
      {
        v25 = v11 * v24;
        v26 = v11;
      }
      else
      {
        v25 = v10;
        v26 = v10 / v24;
      }
      -[UIPresentationController traitCollection](self, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "displayScale");
      v8 = UIRectCenteredIntegralRectScale(0.0, 0.0, v25, v26, v8, v9, v10, v11, v28);
      v9 = v29;
      v10 = v30;
      v11 = v31;

    }
  }
  v32 = v8;
  v33 = v9;
  v34 = v10;
  v35 = v11;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController2;
  -[UIPresentationController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[_UIPreviewPresentationController2 _layoutContentViews](self, "_layoutContentViews");
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPreviewPresentationController2;
  -[UIPresentationController systemLayoutFittingSizeDidChangeForChildContentContainer:](&v5, sel_systemLayoutFittingSizeDidChangeForChildContentContainer_, a3);
  -[UIPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)_prepareRevealPlatterViewForPresentationTransitionIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  _UIPreviewPresentationPlatterView *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_UIPreviewPresentationController2 revealPlatterView](self, "revealPlatterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredSourceViewRectInCoordinateSpace:", 0);
      v8 = v7;
      v10 = v9;

      v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8, v10);
      v12 = -[_UIPreviewPresentationPlatterView initWithContentView:]([_UIPreviewPresentationPlatterView alloc], "initWithContentView:", v11);
      -[UIView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
      objc_msgSend(v14, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v12);

      -[_UIPreviewPresentationController2 setRevealPlatterView:](self, "setRevealPlatterView:", v12);
    }
  }

}

- (void)_prepareContentPlatterViewForPresentationTransitionIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _UIPreviewPresentationPlatterView *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[_UIPreviewPresentationPlatterView initWithContentView:]([_UIPreviewPresentationPlatterView alloc], "initWithContentView:", v6);
    -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", -[_UIPreviewPresentationController2 shouldEnableUserInteractionOnPlatter](self, "shouldEnableUserInteractionOnPlatter"));
    objc_msgSend(v9, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v7);

    -[_UIPreviewPresentationController2 setContentPlatterView:](self, "setContentPlatterView:", v7);
  }

}

- (void)_prepareContentViewsForPresentationAnimationsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MidX;
  CGFloat v27;
  double MidY;
  CGFloat v29;
  double Height;
  CGFloat v31;
  void *v32;
  void *v33;
  CGFloat v34;
  double tx;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[_UIPreviewPresentationController2 currentTransitionAnimator](self, "currentTransitionAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferredSourceViewRectInCoordinateSpace:", v17);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v34 = v24;

      v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v40.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v40.c = v36;
      *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v41.origin.x = v19;
      v41.origin.y = v21;
      v41.size.width = v23;
      v41.size.height = v25;
      MidX = CGRectGetMidX(v41);
      v42.origin.x = v9;
      v42.origin.y = v11;
      v42.size.width = v13;
      v42.size.height = v15;
      tx = MidX - CGRectGetMidX(v42);
      v43.origin.x = v19;
      v43.origin.y = v21;
      v27 = v21;
      v43.size.width = v23;
      v43.size.height = v34;
      MidY = CGRectGetMidY(v43);
      v44.origin.x = v9;
      v44.origin.y = v11;
      v44.size.width = v13;
      v44.size.height = v15;
      v29 = CGRectGetMidY(v44);
      *(_OWORD *)&v39.a = *(_OWORD *)&v40.a;
      *(_OWORD *)&v39.c = v36;
      *(_OWORD *)&v39.tx = *(_OWORD *)&v40.tx;
      CGAffineTransformTranslate(&v40, &v39, tx, MidY - v29);
      v45.origin.x = v19;
      v45.origin.y = v27;
      v45.size.width = v23;
      v45.size.height = v34;
      Height = CGRectGetHeight(v45);
      v46.origin.x = v9;
      v46.origin.y = v11;
      v46.size.width = v13;
      v46.size.height = v15;
      v31 = CGRectGetHeight(v46);
      v38 = v40;
      CGAffineTransformScale(&v39, &v38, Height / v31 * 1.2, Height / v31 * 1.2);
      *(_OWORD *)&v40.tx = *(_OWORD *)&v39.tx;
      v37 = v39;
      objc_msgSend(v7, "setTransform:", &v37);
      objc_msgSend(v7, "setAlpha:", 0.0);
      objc_msgSend(v7, "setBlurRadius:", 96.0);
      objc_msgSend(v7, "setDropShadowEnabled:", 0);
      -[UIPresentationController traitCollection](self, "traitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIForcePresentationHelper visualEffectForPresentationPhase:traitCollection:variant:](UIForcePresentationHelper, "visualEffectForPresentationPhase:traitCollection:variant:", 0, v32, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEffect:", v33);

    }
  }
}

- (void)_performTransitionAnimations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIPreviewPresentationController2 currentTransitionAnimator](self, "currentTransitionAnimator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimations:", v4);

}

- (void)_performPresentationAnimationsWithTransitionContext:(id)a3
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _UIPreviewPresentationController2 *v46;
  id v47;
  id v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController2 revealPlatterView](self, "revealPlatterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:", v6, v8, v10, v12);
  v41 = v16;
  v42 = v15;
  v40 = v17;
  v19 = v18;
  -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferredSourceViewRectInCoordinateSpace:", v21);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  -[_UIPreviewPresentationController2 currentTransitionAnimator](self, "currentTransitionAnimator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "duration");
  v32 = v31;

  -[_UIPreviewPresentationController2 interactiveTransitionFraction](self, "interactiveTransitionFraction");
  v34 = v33;
  -[UIPresentationController traitCollection](self, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke;
  v43[3] = &unk_1E16DAA70;
  v44 = v14;
  v45 = v4;
  v46 = self;
  v47 = v35;
  v49 = v34;
  v50 = 1.0 - v34;
  v51 = v42;
  v52 = v41;
  v53 = v40;
  v54 = v19;
  v55 = v23;
  v56 = v25;
  v57 = v27;
  v58 = v29;
  v48 = v13;
  v36 = v13;
  v37 = v35;
  v38 = v4;
  v39 = v14;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 6, v43, 0, v32, 0.0);

}

- (void)_performReducedMotionPresentationAnimationsWithTransitionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[_UIPreviewPresentationController2 revealPlatterView](self, "revealPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = (void *)objc_opt_class();
  -[UIPresentationController traitCollection](self, "traitCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_backgroundEffectForTraitCollection:interactive:", v9, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEffect:", v7);

}

- (void)_performDismissAnimationsWithTransitionContext:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v4 = a3;
  if (-[_UIPreviewPresentationController2 _shouldReduceMotion](self, "_shouldReduceMotion"))
  {
    -[_UIPreviewPresentationController2 _performReducedMotionDismissAnimationsWithTransitionContext:](self, "_performReducedMotionDismissAnimationsWithTransitionContext:", v4);
  }
  else
  {
    -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:", v7, v9, v11, v13);
    v37 = v15;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[_UIPreviewPresentationController2 previewingContext](self, "previewingContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferredSourceViewRectInCoordinateSpace:", v23);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    -[_UIPreviewPresentationController2 currentTransitionAnimator](self, "currentTransitionAnimator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "duration");
    v34 = v33;

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke;
    v38[3] = &unk_1E16B7030;
    v39 = v5;
    v40 = v14;
    v41 = v25;
    v42 = v27;
    v43 = v29;
    v44 = v31;
    v45 = v37;
    v46 = v17;
    v47 = v19;
    v48 = v21;
    v35 = v14;
    v36 = v5;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 6, v38, 0, v34, 0.0);

  }
}

- (void)_performReducedMotionDismissAnimationsWithTransitionContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[_UIPreviewPresentationController2 revealPlatterView](self, "revealPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEffect:", 0);

}

- (BOOL)_shouldReduceMotion
{
  return _AXSReduceMotionEnabled() != 0;
}

- (CGRect)_computedPlatterFrame
{
  void *v3;
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
  double v14;
  double v15;
  CGRect result;

  -[UIPreviewPresentationController presentationContainerEffectView](self, "presentationContainerEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:", v5, v7, v9, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_updateFromInteractionEffect:(id)a3
{
  void *v4;
  _OWORD v5[6];
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  if (a3)
  {
    objc_msgSend(a3, "preferredContentTransform");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  -[_UIPreviewPresentationController2 setPreferredContentPlatterTransform:](self, "setPreferredContentPlatterTransform:", v6);
  -[_UIPreviewPresentationController2 preferredContentPlatterTransform](self, "preferredContentPlatterTransform");
  -[_UIPreviewPresentationController2 contentPlatterView](self, "contentPlatterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v5[3];
  v5[1] = v5[4];
  v5[2] = v5[5];
  objc_msgSend(v4, "setTransform:", v5);

}

- (UIViewControllerPreviewing_Internal)previewingContext
{
  return (UIViewControllerPreviewing_Internal *)objc_loadWeakRetained((id *)&self->_previewingContext);
}

- (void)setPreviewingContext:(id)a3
{
  objc_storeWeak((id *)&self->_previewingContext, a3);
}

- (_UIPreviewPresentationPlatterView)revealPlatterView
{
  return self->_revealPlatterView;
}

- (void)setRevealPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_revealPlatterView, a3);
}

- (BOOL)hasPerformedInitialLayout
{
  return self->_hasPerformedInitialLayout;
}

- (void)setHasPerformedInitialLayout:(BOOL)a3
{
  self->_hasPerformedInitialLayout = a3;
}

- (CGAffineTransform)preferredContentPlatterTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].a;
  return self;
}

- (void)setPreferredContentPlatterTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_preferredContentPlatterTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_preferredContentPlatterTransform.c = v4;
  *(_OWORD *)&self->_preferredContentPlatterTransform.tx = v3;
}

- (_UIPreviewInteractionHighlighting)currentHighlighter
{
  return (_UIPreviewInteractionHighlighting *)objc_loadWeakRetained((id *)&self->_currentHighlighter);
}

- (void)setCurrentHighlighter:(id)a3
{
  objc_storeWeak((id *)&self->_currentHighlighter, a3);
}

- (UIViewPropertyAnimator)currentTransitionAnimator
{
  return (UIViewPropertyAnimator *)objc_loadWeakRetained((id *)&self->_currentTransitionAnimator);
}

- (void)setCurrentTransitionAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_currentTransitionAnimator, a3);
}

- (double)interactiveTransitionFraction
{
  return self->_interactiveTransitionFraction;
}

- (void)setInteractiveTransitionFraction:(double)a3
{
  self->_interactiveTransitionFraction = a3;
}

- (_UIPreviewPresentationPlatterView)contentPlatterView
{
  return self->_contentPlatterView;
}

- (void)setContentPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_contentPlatterView, a3);
}

- (BOOL)shouldScaleContentViewToAspectFitPlatter
{
  return self->_shouldScaleContentViewToAspectFitPlatter;
}

- (void)setShouldScaleContentViewToAspectFitPlatter:(BOOL)a3
{
  self->_shouldScaleContentViewToAspectFitPlatter = a3;
}

- (BOOL)shouldEnableUserInteractionOnPlatter
{
  return self->_shouldEnableUserInteractionOnPlatter;
}

- (void)setShouldEnableUserInteractionOnPlatter:(BOOL)a3
{
  self->_shouldEnableUserInteractionOnPlatter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPlatterView, 0);
  objc_destroyWeak((id *)&self->_currentTransitionAnimator);
  objc_destroyWeak((id *)&self->_currentHighlighter);
  objc_storeStrong((id *)&self->_revealPlatterView, 0);
  objc_destroyWeak((id *)&self->_previewingContext);
}

@end
