@implementation _UIPreviewInteractionClickImpl

- (_UIPreviewInteractionClickImpl)initWithView:(id)a3 previewInteraction:(id)a4
{
  id v6;
  id v7;
  _UIPreviewInteractionClickImpl *v8;
  _UIPreviewInteractionClickImpl *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[_UIPreviewInteractionClickImpl init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_previewInteraction, v7);
    objc_msgSend(v6, "addInteraction:", v9);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIPreviewInteractionClickImpl view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeInteraction:", self);

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionClickImpl;
  -[_UIPreviewInteractionClickImpl dealloc](&v4, sel_dealloc);
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  -[_UIPreviewInteractionClickImpl previewInteraction](self, "previewInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInCoordinateSpace:", v4);
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v11 = 0x7FEFFFFFFFFFFFFFLL;
    v9 = 0x7FEFFFFFFFFFFFFFLL;
  }

  v12 = *(double *)&v9;
  v13 = *(double *)&v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)cancelInteraction
{
  -[_UIPreviewInteractionClickImpl _endInteractionDidComplete:wasCancelledByClient:]((uint64_t)self, 0, 1);
}

- (uint64_t)_endInteractionDidComplete:(char)a3 wasCancelledByClient:
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v4 = *(_QWORD *)(result + 8);
    if (v4 > 4 || ((1 << v4) & 0x13) == 0)
    {
      v6 = result;
      v7 = a2;
      BYTE1(v7) = a3;
      return handleEvent(stateMachineSpec_1, v4, 4, (uint64_t)&v6, (uint64_t *)(result + 8));
    }
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_storeWeak((id *)&self->_privateDelegate, 0);
    self->_delegateImplements.shouldBegin = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.didUpdateCommitTransition = objc_opt_respondsToSelector() & 1;
    -[_UIPreviewInteractionClickImpl privateDelegate](self, "privateDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_delegateImplements.highlighterForPreviewTransition = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.viewControllerPresentationForPresentingViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldFinishTransitionToPreview = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.targetedPreviewForPreviewingAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.overrideViewForCommitPhase = objc_opt_respondsToSelector() & 1;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v7)
      self->_currentState = 1;

    v5 = obj;
  }

}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInteraction:", v6);

  -[_UIPreviewInteractionClickImpl commitClickInteraction](self, "commitClickInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionClickImpl commitClickInteraction](self, "commitClickInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeInteraction:", v9);

  -[_UIPreviewInteractionClickImpl exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionClickImpl exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeGestureRecognizer:", v12);

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  void *v6;
  _UIClickInteraction *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(_UIClickInteraction);
      -[_UIPreviewInteractionClickImpl setPreviewClickInteraction:](self, "setPreviewClickInteraction:", v7);

      -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAllowableMovement:", 10.0);

      -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", self);

    }
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addInteraction:", v11);

    -[_UIPreviewInteractionClickImpl exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setName:", CFSTR("com.apple.UIKit.previewInteractionExclusionRelationships"));
      objc_msgSend(v13, "setDelegate:", self);
      -[_UIPreviewInteractionClickImpl setExclusionRelationshipGestureRecognizer:](self, "setExclusionRelationshipGestureRecognizer:", v13);

    }
    v14 = objc_loadWeakRetained((id *)p_view);
    -[_UIPreviewInteractionClickImpl exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addGestureRecognizer:", v15);

  }
}

- (void)_startPreviewAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  _UIPreviewInteractionClickImpl *v5;

  if (!self->_interactionEffect)
    -[_UIPreviewInteractionClickImpl _prepareInteractionEffect](self, "_prepareInteractionEffect", a4, a3.x, a3.y);
  v5 = self;
  handleEvent(stateMachineSpec_1, self->_currentState, 2, (uint64_t)&v5, (uint64_t *)&self->_currentState);
}

- (BOOL)_canPerformPresentation
{
  void *v2;
  BOOL v3;

  if (!self->_delegateImplements.viewControllerPresentationForPresentingViewController)
    return 0;
  -[_UIPreviewInteractionClickImpl presentationAssistant](self, "presentationAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)_performPresentationIfPossible
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _UIPreviewInteractionPresentationAssistant *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD aBlock[4];
  id v27;
  id location;

  if (!-[_UIPreviewInteractionClickImpl _canPerformPresentation](self, "_canPerformPresentation"))
    return 0;
  -[_UIPreviewInteractionClickImpl view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_viewControllerForAncestor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionClickImpl.m"), 263, CFSTR("UIPreviewInteraction cannot determine presenting view controller."));

  }
  -[_UIPreviewInteractionClickImpl privateDelegate](self, "privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionClickImpl previewInteraction](self, "previewInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_previewInteraction:viewControllerPresentationForPresentingViewController:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 != 0;
  if (v8)
  {
    objc_msgSend(v8, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v5)
    {
      objc_msgSend(v8, "viewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "parentViewController");
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionClickImpl.m"), 272, CFSTR("UIPreviewInteraction cannot determine presenting view controller."));

        v5 = 0;
      }
    }
    objc_initWeak(&location, self);
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke;
    aBlock[3] = &unk_1E16B3F40;
    objc_copyWeak(&v27, &location);
    v14 = _Block_copy(aBlock);
    v15 = -[_UIPreviewInteractionPresentationAssistant initWithViewControllerPresentation:]([_UIPreviewInteractionPresentationAssistant alloc], "initWithViewControllerPresentation:", v8);
    -[_UIPreviewInteractionClickImpl setPresentationAssistant:](self, "setPresentationAssistant:", v15);

    -[_UIPreviewInteractionClickImpl highlighter](self, "highlighter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionClickImpl presentationAssistant](self, "presentationAssistant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHighlighter:", v16);

    -[UIInteractionEffect targetedPreviewForEffectContinuation](self->_interactionEffect, "targetedPreviewForEffectContinuation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionClickImpl presentationAssistant](self, "presentationAssistant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentFromViewController:sourcePreview:dismissalCompletion:", v5, v18, v14);

    objc_msgSend(v8, "viewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transitionCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_2;
    v25[3] = &unk_1E16B2150;
    v25[4] = self;
    objc_msgSend(v21, "animateAlongsideTransition:completion:", v25, 0);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (UIPreviewInteractionDelegatePrivate)privateDelegate
{
  void *v3;
  UIPreviewInteractionDelegatePrivate **p_privateDelegate;
  id WeakRetained;
  id v6;

  -[_UIPreviewInteractionClickImpl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_privateDelegate = &self->_privateDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_privateDelegate);
  if (WeakRetained)
  {

  }
  else if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0CE708))
  {
    objc_storeWeak((id *)p_privateDelegate, v3);
  }
  v6 = objc_loadWeakRetained((id *)p_privateDelegate);

  return (UIPreviewInteractionDelegatePrivate *)v6;
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  id v4;
  id v5;
  uint64_t *p_currentState;
  unint64_t currentState;
  _UIPreviewInteractionClickImpl *v9;

  v4 = a3;
  -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    return 1;
  v9 = self;
  currentState = self->_currentState;
  p_currentState = (uint64_t *)&self->_currentState;
  handleEvent(stateMachineSpec_1, currentState, 0, (uint64_t)&v9, p_currentState);
  return (unint64_t)*p_currentState > 1;
}

- (void)clickInteractionDidEnd:(id)a3
{
  id v4;
  unint64_t currentState;
  id v7;
  id v9;

  v4 = a3;
  currentState = self->_currentState;
  if (currentState > 4 || ((1 << currentState) & 0x13) == 0)
  {
    v9 = v4;
    -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    if (currentState < 5 || v7 != v9)
    {
      -[_UIPreviewInteractionClickImpl _endInteractionDidComplete:wasCancelledByClient:]((uint64_t)self, 0, 0);
      v4 = v9;
    }
  }

}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4;
  id v5;
  _UIPercentDrivenInteractionEffect *v6;
  id *v7;
  uint64_t v8;
  _UIPercentDrivenInteractionEffect *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (!self->_delegateImplements.highlighterForPreviewTransition
      && !self->_delegateImplements.targetedPreviewForPreviewingAtLocation)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[_UIPreviewInteractionClickImpl _prepareInteractionEffect](self, "_prepareInteractionEffect");
    v9 = [_UIPercentDrivenInteractionEffect alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke;
    v14[3] = &unk_1E16C75A0;
    v7 = &v15;
    objc_copyWeak(&v15, &location);
    v8 = -[_UIPercentDrivenInteractionEffect initWithProgressBlock:](v9, "initWithProgressBlock:", v14);
  }
  else
  {
    v6 = [_UIPercentDrivenInteractionEffect alloc];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke_2;
    v12[3] = &unk_1E16C75A0;
    v7 = &v13;
    objc_copyWeak(&v13, &location);
    v8 = -[_UIPercentDrivenInteractionEffect initWithProgressBlock:](v6, "initWithProgressBlock:", v12);
  }
  v10 = (void *)v8;
  objc_destroyWeak(v7);
LABEL_7:
  objc_destroyWeak(&location);

  return v10;
}

- (void)_delegateUpdatePreviewTransitionWithProgress:(double)a3 ended:
{
  void *v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "previewInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewInteraction:didUpdatePreviewTransition:ended:", v6, a2, a3);

  }
}

- (void)_delegateUpdateCommitTransitionWithProgress:(double)a3 ended:
{
  void *v6;
  id v7;

  if (a1)
  {
    if (a1[17])
    {
      objc_msgSend(a1, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "previewInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "previewInteraction:didUpdateCommitTransition:ended:", v6, a2, a3);

    }
  }
}

- (void)clickInteractionDidClickDown:(id)a3
{
  id v4;
  id v5;
  _UIPreviewInteractionClickImpl *v6;

  v4 = a3;
  -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = self;
    handleEvent(stateMachineSpec_1, self->_currentState, 1, (uint64_t)&v6, (uint64_t *)&self->_currentState);
  }
}

- (void)clickInteractionDidClickUp:(id)a3
{
  id v4;
  id v5;
  unint64_t currentState;
  _UIPreviewInteractionClickImpl **v7;
  uint64_t v8;
  _UIPreviewInteractionClickImpl *v9;
  _UIPreviewInteractionClickImpl *v10;

  v4 = a3;
  -[_UIPreviewInteractionClickImpl previewClickInteraction](self, "previewClickInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v10 = self;
    currentState = self->_currentState;
    v7 = &v10;
    v8 = 2;
  }
  else
  {
    v9 = self;
    currentState = self->_currentState;
    v7 = &v9;
    v8 = 3;
  }
  handleEvent(stateMachineSpec_1, currentState, v8, (uint64_t)v7, (uint64_t *)&self->_currentState);
}

- (uint64_t)_handleTransitionToPossibleByEndingWithContext:(uint64_t)result
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  _BOOL4 v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[6];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGPoint v54;
  CGRect v55;

  v53 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (_QWORD *)result;
    objc_msgSend((id)result, "associatedDragInteraction");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4 && v3[1] == 3)
    {
      v46 = (void *)v4;
      v6 = (void *)UIApp;
      objc_msgSend(v3, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v6, "_touchesEventForWindow:", v8);

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v45 = v9;
      objc_msgSend(v9, "allTouches");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v49 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if (objc_msgSend(v15, "phase") == 1)
            {
              objc_msgSend(v3, "view");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "bounds");
              v18 = v17;
              v20 = v19;
              v22 = v21;
              v24 = v23;
              objc_msgSend(v3, "view");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "locationInView:", v25);
              v54.x = v26;
              v54.y = v27;
              v55.origin.x = v18;
              v55.origin.y = v20;
              v55.size.width = v22;
              v55.size.height = v24;
              v28 = CGRectContainsPoint(v55, v54);

              if (v28)
              {
                v47[0] = MEMORY[0x1E0C809B0];
                v47[1] = 3221225472;
                v47[2] = __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke;
                v47[3] = &unk_1E16C7908;
                v47[4] = v3;
                v47[5] = v45;
                objc_msgSend(v46, "_immediatelyBeginDragWithTouch:completion:", v15, v47);
                goto LABEL_15;
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_15:

      v5 = v46;
    }
    objc_msgSend(v3, "setAssociatedDragInteraction:", 0);
    v29 = v3[1];
    objc_msgSend(v3, "exclusionRelationshipGestureRecognizer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 > 3)
      objc_msgSend(v30, "reset");
    else
      objc_msgSend(v30, "_fail");

    if (!*(_BYTE *)(a2 + 8) && !*(_BYTE *)(a2 + 9))
    {
      objc_msgSend(v3, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "previewInteraction");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "previewInteractionDidCancel:", v33);

    }
    objc_msgSend(v3, "_endInteractionEffectIfNeeded");
    objc_msgSend(v3, "presentationAssistant");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v3, "presentationAssistant");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dismissViewController");

    }
    else
    {
      -[_UIPreviewInteractionClickImpl _toBeRemoved_CallHighlighterCompletion](v3);
    }
    objc_msgSend(v3, "previewClickInteraction");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v3, "previewClickInteraction");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "cancelInteraction");
    }
    else
    {
      objc_msgSend(v3, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "previewClickInteraction");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addInteraction:", v39);

    }
    objc_msgSend(v3, "previewClickInteraction");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAllowableMovement:", 10.0);

    objc_msgSend(v3, "commitClickInteraction");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "cancelInteraction");

    objc_msgSend(v3, "commitClickInteraction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commitClickInteraction");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeInteraction:", v44);

    return 1;
  }
  return result;
}

- (void)_toBeRemoved_CreateHighlighterIfPossible
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    if (a1[18])
    {
      objc_msgSend(a1, "privateDelegate");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "previewInteraction");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_previewInteractionHighlighterForPreviewTransition:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "setHighlighter:", v4);
    }
  }
}

- (void)_toBeRemoved_CallHighlighterCompletion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "highlighter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(a1, "highlighter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "completionBlock");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v4, "copy");

      objc_msgSend(a1, "setHighlighter:", 0);
      v5 = v6;
      if (v6)
      {
        (*((void (**)(id))v6 + 2))(v6);
        v5 = v6;
      }

    }
  }
}

- (void)_prepareInteractionEffect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *interactionEffect;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIPreviewTarget *v22;
  void *v23;
  UIInteractionEffect *v24;
  UITargetedPreview *v25;
  UITargetedPreview *v26;

  if (self->_delegateImplements.targetedPreviewForPreviewingAtLocation)
  {
    -[_UIPreviewInteractionClickImpl previewInteraction](self, "previewInteraction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionClickImpl view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationInCoordinateSpace:", v4);
    v6 = v5;
    v8 = v7;

    -[_UIPreviewInteractionClickImpl privateDelegate](self, "privateDelegate");
    interactionEffect = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionClickImpl previewInteraction](self, "previewInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(interactionEffect, "_previewInteraction:targetedPreviewForPreviewingAtLocation:", v10, v6, v8);
    v26 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[_UIPreviewInteractionClickImpl _toBeRemoved_CreateHighlighterIfPossible](self);
  -[_UIPreviewInteractionClickImpl highlighter](self, "highlighter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  interactionEffect = v11;
  if (!v11)
  {
LABEL_11:
    v26 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v11, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(interactionEffect, "customContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v10, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

      goto LABEL_11;
    }
  }
  objc_msgSend(v10, "center");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v10, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:fromView:", v17, v14, v16);
  v19 = v18;
  v21 = v20;

  v22 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v12, v19, v21);
  v23 = (void *)objc_opt_new();
  v26 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", v10, v23, v22);

LABEL_7:
  if (v26)
  {
    +[_UIClickHighlightInteractionEffect effectWithPreview:continuingFromPreview:](_UIClickHighlightInteractionEffect, "effectWithPreview:continuingFromPreview:", v26, 0);
    v24 = (UIInteractionEffect *)objc_claimAutoreleasedReturnValue();
    interactionEffect = self->_interactionEffect;
    self->_interactionEffect = v24;
LABEL_12:

    v25 = v26;
    goto LABEL_13;
  }
  v25 = 0;
LABEL_13:

}

- (void)_endInteractionEffectIfNeeded
{
  void *v3;
  void *v4;
  UIInteractionEffect *interactionEffect;
  id v6;

  -[_UIPreviewInteractionClickImpl interactionEffect](self, "interactionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = (id)objc_opt_new();
    objc_msgSend(v6, "setProgress:", 0.0);
    objc_msgSend(v6, "setEnded:", 1);
    -[_UIPreviewInteractionClickImpl interactionEffect](self, "interactionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interaction:didChangeWithContext:", self, v6);

    interactionEffect = self->_interactionEffect;
    self->_interactionEffect = 0;

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[_UIPreviewInteractionClickImpl exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (UIPreviewInteractionDelegate)delegate
{
  return (UIPreviewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UIPreviewInteractionTouchForceProviding)touchForceProvider
{
  return self->_touchForceProvider;
}

- (UIPreviewInteraction)previewInteraction
{
  return (UIPreviewInteraction *)objc_loadWeakRetained((id *)&self->_previewInteraction);
}

- (void)setPreviewInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_previewInteraction, a3);
}

- (UIInteractionEffect)interactionEffect
{
  return self->_interactionEffect;
}

- (void)setInteractionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_interactionEffect, a3);
}

- (_UIClickInteraction)previewClickInteraction
{
  return self->_previewClickInteraction;
}

- (void)setPreviewClickInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_previewClickInteraction, a3);
}

- (_UIClickInteraction)commitClickInteraction
{
  return self->_commitClickInteraction;
}

- (void)setCommitClickInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_commitClickInteraction, a3);
}

- (_UIRelationshipGestureRecognizer)exclusionRelationshipGestureRecognizer
{
  return self->_exclusionRelationshipGestureRecognizer;
}

- (void)setExclusionRelationshipGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionRelationshipGestureRecognizer, a3);
}

- (_UIPreviewInteractionPresentationAssistant)presentationAssistant
{
  return self->_presentationAssistant;
}

- (void)setPresentationAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_presentationAssistant, a3);
}

- (_UIPreviewInteractionHighlighter)highlighter
{
  return self->_highlighter;
}

- (void)setHighlighter:(id)a3
{
  objc_storeStrong((id *)&self->_highlighter, a3);
}

- (UIDragInteraction)associatedDragInteraction
{
  return (UIDragInteraction *)objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
}

- (void)setAssociatedDragInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_associatedDragInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedDragInteraction);
  objc_storeStrong((id *)&self->_highlighter, 0);
  objc_storeStrong((id *)&self->_presentationAssistant, 0);
  objc_storeStrong((id *)&self->_exclusionRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_commitClickInteraction, 0);
  objc_storeStrong((id *)&self->_previewClickInteraction, 0);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_destroyWeak((id *)&self->_previewInteraction);
  objc_storeStrong((id *)&self->_touchForceProvider, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
