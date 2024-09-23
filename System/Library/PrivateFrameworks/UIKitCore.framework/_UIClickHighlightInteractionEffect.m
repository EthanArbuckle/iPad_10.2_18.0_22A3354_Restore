@implementation _UIClickHighlightInteractionEffect

+ (id)effectWithPreview:(id)a3 continuingFromPreview:(id)a4
{
  id v5;
  id v6;
  _UIClickHighlightInteractionEffect *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_UIClickHighlightInteractionEffect initWithTargetedPreview:continuingFromPreview:]([_UIClickHighlightInteractionEffect alloc], "initWithTargetedPreview:continuingFromPreview:", v6, v5);

  return v7;
}

- (_UIClickHighlightInteractionEffect)initWithTargetedPreview:(id)a3 continuingFromPreview:(id)a4
{
  id v7;
  id v8;
  _UIClickHighlightInteractionEffect *v9;
  _UIClickHighlightInteractionEffect *v10;
  void *v11;
  _BOOL8 v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIClickHighlightInteractionEffect;
  v9 = -[_UIClickHighlightInteractionEffect init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[_UIClickHighlightInteractionEffect setContinuationPreview:](v9, "setContinuationPreview:", v8);
    objc_storeStrong((id *)&v10->_targetedPreview, a3);
    objc_msgSend(v7, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_previewMode") != 1;

    v10->_phase = v12;
    -[_UIClickHighlightInteractionEffect _createHighlightPlatter](v10, "_createHighlightPlatter");
  }

  return v10;
}

- (UITargetedPreview)targetedPreviewForEffectContinuation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIPreviewTarget *v18;
  void *v19;
  UIPreviewTarget *v20;
  void *v21;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  CGAffineTransform v26;
  CATransform3D v27;
  CGAffineTransform v28;

  -[_UIClickHighlightInteractionEffect highlightPlatter](self, "highlightPlatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIClickHighlightInteractionEffect targetedPreview](self, "targetedPreview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v4, "layer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;

    memset(&v28, 0, sizeof(v28));
    if (v13)
      objc_msgSend(v13, "transform");
    else
      memset(&v27, 0, sizeof(v27));
    CATransform3DGetAffineTransform(&v28, &v27);
    objc_msgSend(v4, "center");
    v15 = v14;
    v17 = v16;
    v18 = [UIPreviewTarget alloc];
    objc_msgSend(v7, "container");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v28;
    v20 = -[UIPreviewTarget initWithContainer:center:transform:](v18, "initWithContainer:center:transform:", v19, &v26, v15, v17);

    -[_UIClickHighlightInteractionEffect targetedPreview](self, "targetedPreview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "retargetedPreviewWithTarget:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v28.a) = 0;
          _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "Presenting while the highlight platter isn't in a window. If you see this, please file a bug against UIKit | Context Menu with reproduction steps.", (uint8_t *)&v28, 2u);
        }

      }
      else
      {
        v23 = targetedPreviewForEffectContinuation___s_category;
        if (!targetedPreviewForEffectContinuation___s_category)
        {
          v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v23, (unint64_t *)&targetedPreviewForEffectContinuation___s_category);
        }
        v24 = *(NSObject **)(v23 + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v28.a) = 0;
          _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Presenting while the highlight platter isn't in a window. If you see this, please file a bug against UIKit | Context Menu with reproduction steps.", (uint8_t *)&v28, 2u);
        }
      }
    }
    v12 = 0;
  }

  return (UITargetedPreview *)v12;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v5;
  int v6;
  double v7;
  double v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD aBlock[5];
  id v21;
  id v22;
  double v23;

  v5 = a4;
  v6 = objc_msgSend(v5, "ended");
  self->_isActive = v6 ^ 1;
  if (((v6 ^ 1) & 1) == 0 && !+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    -[_UIClickHighlightInteractionEffect _completeHighlightEffect](self, "_completeHighlightEffect");
    goto LABEL_10;
  }
  objc_msgSend(v5, "progress");
  v8 = v7;
  if (v7 >= 1.0)
  {
    v9 = 2;
    goto LABEL_7;
  }
  if (v7 >= 0.1)
  {
    v9 = 1;
LABEL_7:
    self->_phase = v9;
  }
  -[_UIClickHighlightInteractionEffect highlightPlatter](self, "highlightPlatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke;
  aBlock[3] = &unk_1E16C5CA0;
  aBlock[4] = self;
  v21 = v10;
  v23 = v8;
  v22 = v5;
  v12 = v10;
  v13 = _Block_copy(aBlock);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke_2;
  v19[3] = &unk_1E16B2588;
  v19[4] = self;
  v14 = _Block_copy(v19);
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setTrackingDampingRatio:response:dampingRatioSmoothing:responseSmoothing:", 0.6, 0.4, 0.08, 0.08);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke_42;
  v17[3] = &unk_1E16B1BF8;
  v18 = v13;
  v16 = v13;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v15, 1, v17, v14);

LABEL_10:
}

- (void)_createHighlightPlatter
{
  _UIAnchoredClickHighlightPlatterView *v3;
  void *v4;
  _UIAnchoredClickHighlightPlatterView *v5;
  void *v6;
  void *v7;
  _UIPortalView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = [_UIAnchoredClickHighlightPlatterView alloc];
  -[_UIClickHighlightInteractionEffect targetedPreview](self, "targetedPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIAnchoredClickHighlightPlatterView initWithTargetedPreview:](v3, "initWithTargetedPreview:", v4);

  -[_UIAnchoredClickHighlightPlatterView anchorToContainer](v5, "anchorToContainer");
  -[_UIClickHighlightInteractionEffect setHighlightPlatter:](self, "setHighlightPlatter:", v5);
  -[_UIClickHighlightInteractionEffect continuationPreview](self, "continuationPreview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_isVisible"))
  {
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v7);
    -[_UIPortalView setHidesSourceView:](v8, "setHidesSourceView:", 1);
    -[_UIAnchoredClickHighlightPlatterView anchorView](v5, "anchorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addContentView:", v8);

    objc_msgSend(v6, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "transform");
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
    }
    -[_UIAnchoredClickHighlightPlatterView anchorView](v5, "anchorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    objc_msgSend(v12, "setTransform:", v15);

    -[_UIAnchoredClickHighlightPlatterView anchorView](v5, "anchorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_transferAnimationsToView:", v13);

  }
  -[_UIAnchoredClickHighlightPlatterView anchorView](v5, "anchorView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addContentView:", v5);

}

- (void)_completeHighlightEffect
{
  void *v3;
  void *v4;
  id v5;

  -[_UIClickHighlightInteractionEffect highlightPlatter](self, "highlightPlatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deAnchor");

  -[_UIClickHighlightInteractionEffect setHighlightPlatter:](self, "setHighlightPlatter:", 0);
  -[_UIClickHighlightInteractionEffect completionBlock](self, "completionBlock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIClickHighlightInteractionEffect setCompletionBlock:](self, "setCompletionBlock:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _UIClickHighlightInteractionEffect *))v5 + 2))(v5, self);
    v4 = v5;
  }

}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_UIAnchoredClickHighlightPlatterView)highlightPlatter
{
  return self->_highlightPlatter;
}

- (void)setHighlightPlatter:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPlatter, a3);
}

- (UITargetedPreview)continuationPreview
{
  return self->_continuationPreview;
}

- (void)setContinuationPreview:(id)a3
{
  objc_storeStrong((id *)&self->_continuationPreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuationPreview, 0);
  objc_storeStrong((id *)&self->_highlightPlatter, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end
