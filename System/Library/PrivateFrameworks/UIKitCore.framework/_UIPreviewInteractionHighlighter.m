@implementation _UIPreviewInteractionHighlighter

- (_UIPreviewInteractionHighlighter)initWithView:(id)a3
{
  id v5;
  _UIPreviewInteractionHighlighter *v6;
  _UIPreviewInteractionHighlighter *v7;
  _UIPreviewInteractionHighlighter *v13;
  void *v15;
  objc_super v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewInteractionHighlighter.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_UIPreviewInteractionHighlighter;
  v6 = -[_UIPreviewInteractionHighlighter init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_view, v5);
    *(_WORD *)&v7->_shouldApplyEffectsOnProxyView = 257;
    v7->_shouldApplyBackgroundEffects = 1;
    v7->_cancelsInteractionWhenScrolling = 1;
    v7->_preferredAnimationStyle = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v7->_preferredMinimumScale = _Q0;
    v13 = v7;
  }

  return v7;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "ended");
  v8 = v7;
  if (!self->_active && (v7 & 1) == 0)
    -[_UIPreviewInteractionHighlighter _prepareForInteraction:](self, "_prepareForInteraction:", v9);
  objc_msgSend(v6, "progress");
  -[_UIPreviewInteractionHighlighter _updateFromInteraction:fractionComplete:ended:](self, "_updateFromInteraction:fractionComplete:ended:", v9, v8);
  self->_active = v8 ^ 1;

}

- (_UIInteractiveHighlightEffect)interactiveHighlightEffect
{
  return self->_interactiveHighlightEffect;
}

- (void)_prepareForInteraction:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _UIInteractiveHighlightEffect *v10;
  _UIInteractiveHighlightEffect *interactiveHighlightEffect;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  char isKindOfClass;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_storeWeak((id *)&self->_interaction, obj);
  if (-[_UIPreviewInteractionHighlighter shouldApplyEffectsOnProxyView](self, "shouldApplyEffectsOnProxyView"))
  {
    v5 = objc_loadWeakRetained((id *)&self->_customContainerView);

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_customContainerView);
      +[_UIInteractiveHighlightEnvironment interactiveHighlightEnvironmentForContainerView:](_UIInteractiveHighlightEnvironment, "interactiveHighlightEnvironmentForContainerView:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[_UIInteractiveHighlightEnvironment requestInteractiveHighlightEnvironmentForView:](_UIInteractiveHighlightEnvironment, "requestInteractiveHighlightEnvironmentForView:", WeakRetained);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_UIPreviewInteractionHighlighter customBackgroundEffectView](self, "customBackgroundEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomBackgroundEffectView:", v8);

    -[_UIPreviewInteractionHighlighter backgroundEffectApplyBlock](self, "backgroundEffectApplyBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundEffectApplyBlock:", v9);

    objc_msgSend(v7, "interactiveHighlightEffectForView:options:", WeakRetained, self->_shouldTransferViewOwnership);
    v10 = (_UIInteractiveHighlightEffect *)objc_claimAutoreleasedReturnValue();
    interactiveHighlightEffect = self->_interactiveHighlightEffect;
    self->_interactiveHighlightEffect = v10;

    -[_UIInteractiveHighlightEffect portalView](self->_interactiveHighlightEffect, "portalView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setHidesSourceView:", 1);
      objc_msgSend(v13, "setHidden:", 0);
    }
    objc_msgSend(WeakRetained, "_containingScrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[_UIPreviewInteractionHighlighter _prepareAccessoryViewsForScrollView:environment:](self, "_prepareAccessoryViewsForScrollView:environment:", v14, v7);
    objc_msgSend(WeakRetained, "_viewControllerForAncestor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationController");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = 0.0;
    if (v16)
    {
      v18 = (void *)v16;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v15, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "safeAreaInsets");
        v25 = v24;
        v21 = v26;
        v20 = v27;
        v17 = v28;

        objc_msgSend(v15, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_currentScreenScale");
        v31 = v30;

        v32 = 1.0;
        if (v31 > 0.0)
          v32 = 1.0 / v31;
        v22 = v25 + v32;
      }
    }
    else
    {
      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "_indexBarExtentFromEdge");
      if (v17 < v33)
        v17 = v33;
    }
    -[_UIInteractiveHighlightEffect setPreferredContentInsets:](self->_interactiveHighlightEffect, "setPreferredContentInsets:", v22, v21, v20, v17);

  }
  if (-[_UIPreviewInteractionHighlighter shouldApplyContentEffects](self, "shouldApplyContentEffects"))
    -[_UIPreviewInteractionHighlighter _prepareContentEffectsForInteraction:](self, "_prepareContentEffectsForInteraction:", obj);

}

- (void)_updateFromInteraction:(id)a3 fractionComplete:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  _UIInteractiveHighlightEffect *v9;
  id WeakRetained;
  id v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  NSUUID *v16;
  NSUUID *contentAnimationIdentifier;
  uint64_t v18;
  id v19;
  uint64_t v20;
  double v21;
  uint64_t *v22;
  _UIInteractiveHighlightEffect *v23;
  uint64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  _UIPreviewInteractionHighlighter *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  _UIPreviewInteractionHighlighter *v36;
  id v37;
  id v38;
  BOOL v39;
  _QWORD v40[5];
  id v41;
  _UIInteractiveHighlightEffect *v42;
  double v43;
  BOOL v44;

  v5 = a5;
  v8 = a3;
  v9 = self->_interactiveHighlightEffect;
  if (-[_UIPreviewInteractionHighlighter shouldApplyContentEffects](self, "shouldApplyContentEffects"))
  {
    self->_animatesContentEffects = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_compatibilityHighlightView);

    if (WeakRetained)
    {
      v11 = objc_loadWeakRetained((id *)&self->_compatibilityHighlightView);
      -[_UIPreviewInteractionHighlighter _setHighlighted:forViewIfNeeded:](self, "_setHighlighted:forViewIfNeeded:", !v5, v11);

    }
    if (v5)
    {
      v12 = -[_UIPreviewInteractionHighlighter shouldEndWithCancelAnimation](self, "shouldEndWithCancelAnimation");
      if (-[_UIPreviewInteractionHighlighter clickEffectPhase](self, "clickEffectPhase"))
      {
        v13 = 22.0;
LABEL_19:
        v14 = 500.0;
        goto LABEL_24;
      }
      if (self->_preferredAnimationStyle == 1)
      {
        if (v12)
        {
          v13 = 25.0;
          v14 = 1500.0;
          goto LABEL_24;
        }
        v14 = 500.0;
LABEL_21:
        if (v5)
          v13 = a4 * 10.0 + 35.0 + 10.0;
        else
          v13 = a4 * 10.0 + 35.0;
        goto LABEL_24;
      }
      if (v12)
      {
        v13 = 15.0;
        v14 = 1000.0;
        goto LABEL_24;
      }
    }
    else
    {
      if (-[_UIPreviewInteractionHighlighter clickEffectPhase](self, "clickEffectPhase"))
      {
        v14 = dbl_186682030[a4 > 0.95];
        v13 = 26.0;
LABEL_24:
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (NSUUID *)objc_msgSend(v15, "copy");
        contentAnimationIdentifier = self->_contentAnimationIdentifier;
        self->_contentAnimationIdentifier = v16;

        v18 = MEMORY[0x1E0C809B0];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke;
        v40[3] = &unk_1E16BFD20;
        v40[4] = self;
        v41 = v8;
        v43 = a4;
        v44 = v5;
        v42 = v9;
        v32 = v18;
        v33 = 3221225472;
        v34 = __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_2;
        v35 = &unk_1E16DAE38;
        v36 = self;
        v37 = v15;
        v39 = v5;
        v38 = v41;
        v19 = v15;
        +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v40, &v32, v14, v13);

        goto LABEL_25;
      }
      if (self->_preferredAnimationStyle == 1)
      {
        v14 = 1000.0;
        goto LABEL_21;
      }
    }
    if (v5)
      v13 = a4 * 4.0 + 18.0 + 4.0;
    else
      v13 = a4 * 4.0 + 18.0;
    goto LABEL_19;
  }
LABEL_25:
  if (-[_UIPreviewInteractionHighlighter shouldApplyEffectsOnProxyView](self, "shouldApplyEffectsOnProxyView")
    && -[_UIPreviewInteractionHighlighter shouldApplyBackgroundEffects](self, "shouldApplyBackgroundEffects"))
  {
    if (v5)
    {
      v20 = MEMORY[0x1E0C809B0];
      self->_animatesBackgroundEffects = 1;
      v27 = v20;
      v28 = 3221225472;
      v29 = __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_3;
      v30 = &unk_1E16B2588;
      v31 = self;
      v21 = 0.0;
      v22 = &v27;
      v23 = v9;
      v24 = 0;
    }
    else
    {
      v25 = -[_UIPreviewInteractionHighlighter clickEffectPhase](self, "clickEffectPhase");
      v26 = -[_UIPreviewInteractionHighlighter shouldApplyBackgroundEffects](self, "shouldApplyBackgroundEffects");
      v21 = 0.0;
      if (v26 && v25 != 1)
      {
        if (-[_UIPreviewInteractionHighlighter clickEffectPhase](self, "clickEffectPhase", 0.0) == 2)
        {
          v21 = 1.2;
        }
        else
        {
          v21 = (a4 + -0.3) * 1.2 / 0.7 + 0.0;
          if (v21 > 1.2)
            v21 = (log10(v21 / 1.2) + 1.0) * 1.2;
        }
        if (v21 < 0.0)
          v21 = 0.0;
      }
      v22 = (uint64_t *)&__block_literal_global_424;
      v23 = v9;
      v24 = 1;
    }
    -[_UIInteractiveHighlightEffect applyBackgroundEffectWithMagnitude:interactive:completion:](v23, "applyBackgroundEffectWithMagnitude:interactive:completion:", v24, v22, v21, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
  }

}

- (void)_finalizeAfterInteractionIfNeeded
{
  if (!self->_animatesContentEffects && !self->_animatesBackgroundEffects)
    -[_UIPreviewInteractionHighlighter _finalizeAfterInteraction](self, "_finalizeAfterInteraction");
}

- (void)_finalizeAfterInteraction
{
  void (**v3)(_QWORD);
  id privateCompletionBlock;
  void (**v5)(_QWORD);
  id completionBlock;
  _UIInteractiveHighlightEffect *interactiveHighlightEffect;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *accessoryHighlightEffects;
  _UIInteractiveHighlightEffect *presentationControllerHighlightEffect;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD))_Block_copy(self->_privateCompletionBlock);
  privateCompletionBlock = self->_privateCompletionBlock;
  self->_privateCompletionBlock = 0;

  if (v3)
    v3[2](v3);
  v5 = (void (**)(_QWORD))_Block_copy(self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  if (v5)
    v5[2](v5);
  -[_UIInteractiveHighlightEffect finalizeEffect](self->_interactiveHighlightEffect, "finalizeEffect");
  interactiveHighlightEffect = self->_interactiveHighlightEffect;
  self->_interactiveHighlightEffect = 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_accessoryHighlightEffects;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "finalizeEffect", (_QWORD)v15);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  accessoryHighlightEffects = self->_accessoryHighlightEffects;
  self->_accessoryHighlightEffects = 0;

  -[_UIInteractiveHighlightEffect finalizeEffect](self->_presentationControllerHighlightEffect, "finalizeEffect");
  presentationControllerHighlightEffect = self->_presentationControllerHighlightEffect;
  self->_presentationControllerHighlightEffect = 0;

}

- (void)_prepareForViewControllerPresentation:(id)a3
{
  _UIInteractiveHighlightEffect *interactiveHighlightEffect;
  id v5;
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
  id v19;

  interactiveHighlightEffect = self->_interactiveHighlightEffect;
  v5 = a3;
  -[_UIInteractiveHighlightEffect portalView](interactiveHighlightEffect, "portalView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(interactiveHighlightEffect) = objc_msgSend(v5, "shouldUpdateFromViewBeforePresentation");

  if ((_DWORD)interactiveHighlightEffect)
  {
    objc_msgSend(v19, "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInteractiveHighlightEffect effectView](self->_interactiveHighlightEffect, "effectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:toCoordinateSpace:", v16, v9, v11, v13, v15);
    objc_msgSend(v7, "setFrame:");

  }
  objc_msgSend(v19, "setMatchesPosition:", 0);
  -[_UIInteractiveHighlightEffect environment](self->_interactiveHighlightEffect, "environment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:animated:completion:", 0, 1, 0);
  objc_msgSend(v17, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserInteractionEnabled:", 1);

}

- (void)_animateAlongsideViewControllerPresentationDismiss
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  -[_UIInteractiveHighlightEffect environment](self->_interactiveHighlightEffect, "environment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[_UIInteractiveHighlightEffect portalView](self->_interactiveHighlightEffect, "portalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchesPosition:", 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  -[_UIPreviewInteractionHighlighter _updateFromInteraction:fractionComplete:ended:](self, "_updateFromInteraction:fractionComplete:ended:", WeakRetained, 1, 0.0);

}

- (void)_animateForDelayedViewControllerPresentation
{
  id v2;

  -[_UIInteractiveHighlightEffect environment](self->_interactiveHighlightEffect, "environment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:animated:completion:", 1, 1, 0);

}

- (void)_delayedViewControllerPresentationDidCancel
{
  id v3;

  -[_UIInteractiveHighlightEffect environment](self->_interactiveHighlightEffect, "environment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");
  -[_UIPreviewInteractionHighlighter _finalizeAfterInteraction](self, "_finalizeAfterInteraction");

}

- (void)_applyHighlightEffectsToViewControllerDuringCancellation:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93___UIPreviewInteractionHighlighter__applyHighlightEffectsToViewControllerDuringCancellation___block_invoke;
  v5[3] = &unk_1E16B2150;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

- (void)_prepareContentEffectsForInteraction:(id)a3
{
  id WeakRetained;
  int v5;
  id v6;
  char v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v22 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v5 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EDE9E708);
  v6 = WeakRetained;
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __73___UIPreviewInteractionHighlighter__prepareContentEffectsForInteraction___block_invoke;
      v23[3] = &unk_1E16B1B50;
      v24 = v6;
      v25 = v22;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->_preferredAnimationStyle = objc_msgSend(v6, "_preferredHighlightAnimationStyleForInteraction:", v22);
    objc_storeWeak((id *)&self->_interactiveHighlightView, v6);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    objc_storeWeak((id *)&self->_compatibilityHighlightView, v6);
LABEL_11:
  objc_msgSend(v6, "frame");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v12 = CGRectGetWidth(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v13 = CGRectGetHeight(v27);
  if (v12 >= v13)
    v13 = v12;
  v14 = (v13 + -153.0) * -0.016 / 153.0 + 1.04;
  if (v14 < 1.024)
    v14 = 1.024;
  self->_preferredMinimumScale = v14;
  objc_msgSend(v6, "frame");
  v15 = v28.origin.x;
  v16 = v28.origin.y;
  v17 = v28.size.width;
  v18 = v28.size.height;
  v19 = CGRectGetWidth(v28);
  v29.origin.x = v15;
  v29.origin.y = v16;
  v29.size.width = v17;
  v29.size.height = v18;
  v20 = CGRectGetHeight(v29);
  if (v19 >= v20)
    v20 = v19;
  v21 = (v20 + -153.0) * -0.13 / 229.5 + 1.16;
  if (v21 < 1.03)
    v21 = 1.03;
  self->_preferredMaximumScale = v21;

}

- (void)_prepareAccessoryViewsForScrollView:(id)a3 environment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *accessoryHighlightEffects;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_verticalScrollIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "interactiveHighlightEffectForView:options:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(v14, "_horizontalScrollIndicator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "interactiveHighlightEffectForView:options:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  v12 = (NSArray *)objc_msgSend(v7, "copy");
  accessoryHighlightEffects = self->_accessoryHighlightEffects;
  self->_accessoryHighlightEffects = v12;

}

- (void)_setHighlighted:(BOOL)a3 forViewIfNeeded:(id)a4
{
  int v4;
  id v5;
  double v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v4 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "isHighlighted") != v4)
  {
    if (v4)
      v6 = 0.2;
    else
      v6 = 0.3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68___UIPreviewInteractionHighlighter__setHighlighted_forViewIfNeeded___block_invoke;
    v7[3] = &unk_1E16B1B78;
    v8 = v5;
    v9 = v4;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v7, 0, v6, 0.0);

  }
}

- (BOOL)shouldApplyEffectsOnProxyView
{
  return self->_shouldApplyEffectsOnProxyView;
}

- (void)setShouldApplyEffectsOnProxyView:(BOOL)a3
{
  self->_shouldApplyEffectsOnProxyView = a3;
}

- (BOOL)shouldApplyContentEffects
{
  return self->_shouldApplyContentEffects;
}

- (void)setShouldApplyContentEffects:(BOOL)a3
{
  self->_shouldApplyContentEffects = a3;
}

- (BOOL)shouldApplyBackgroundEffects
{
  return self->_shouldApplyBackgroundEffects;
}

- (void)setShouldApplyBackgroundEffects:(BOOL)a3
{
  self->_shouldApplyBackgroundEffects = a3;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)shouldEndWithCancelAnimation
{
  return self->_shouldEndWithCancelAnimation;
}

- (void)setShouldEndWithCancelAnimation:(BOOL)a3
{
  self->_shouldEndWithCancelAnimation = a3;
}

- (unint64_t)clickEffectPhase
{
  return self->_clickEffectPhase;
}

- (void)setClickEffectPhase:(unint64_t)a3
{
  self->_clickEffectPhase = a3;
}

- (id)privateCompletionBlock
{
  return self->_privateCompletionBlock;
}

- (void)setPrivateCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (UIView)customContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_customContainerView);
}

- (void)setCustomContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_customContainerView, a3);
}

- (UIView)customBackgroundEffectView
{
  return self->_customBackgroundEffectView;
}

- (void)setCustomBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundEffectView, a3);
}

- (BOOL)shouldTransferViewOwnership
{
  return self->_shouldTransferViewOwnership;
}

- (void)setShouldTransferViewOwnership:(BOOL)a3
{
  self->_shouldTransferViewOwnership = a3;
}

- (BOOL)cancelsInteractionWhenScrolling
{
  return self->_cancelsInteractionWhenScrolling;
}

- (void)setCancelsInteractionWhenScrolling:(BOOL)a3
{
  self->_cancelsInteractionWhenScrolling = a3;
}

- (id)backgroundEffectApplyBlock
{
  return self->_backgroundEffectApplyBlock;
}

- (void)setBackgroundEffectApplyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundEffectApplyBlock, 0);
  objc_storeStrong((id *)&self->_customBackgroundEffectView, 0);
  objc_destroyWeak((id *)&self->_customContainerView);
  objc_storeStrong(&self->_privateCompletionBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_contentAnimationIdentifier, 0);
  objc_destroyWeak((id *)&self->_interaction);
  objc_storeStrong((id *)&self->_presentationControllerHighlightEffect, 0);
  objc_storeStrong((id *)&self->_accessoryHighlightEffects, 0);
  objc_storeStrong((id *)&self->_interactiveHighlightEffect, 0);
  objc_destroyWeak((id *)&self->_compatibilityHighlightView);
  objc_destroyWeak((id *)&self->_interactiveHighlightView);
  objc_destroyWeak((id *)&self->_view);
}

@end
