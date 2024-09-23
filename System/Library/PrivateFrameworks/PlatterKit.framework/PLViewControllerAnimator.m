@implementation PLViewControllerAnimator

+ (BOOL)drivesAnimation
{
  return 0;
}

- (id)initForPresentation:(BOOL)a3 withSourceView:(id)a4
{
  id v7;
  PLViewControllerAnimator *v8;
  PLViewControllerAnimator *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLViewControllerAnimator;
  v8 = -[PLViewControllerAnimator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_presenting = a3;
    objc_storeStrong((id *)&v8->_sourceView, a4);
  }

  return v9;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  UIViewPropertyAnimator *propertyAnimator;
  UIViewPropertyAnimator *v4;
  UIViewPropertyAnimator *v5;

  propertyAnimator = self->_propertyAnimator;
  if (!propertyAnimator)
  {
    v4 = -[PLViewControllerAnimator _newPropertyAnimator](self, "_newPropertyAnimator");
    v5 = self->_propertyAnimator;
    self->_propertyAnimator = v4;

    propertyAnimator = self->_propertyAnimator;
  }
  return propertyAnimator;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSPointerArray *observers;
  NSPointerArray *v6;
  NSPointerArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      v6 = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSPointerArray addPointer:](observers, "addPointer:", v8);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  NSPointerArray *observers;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    observers = self->_observers;
    if (observers)
    {
      -[NSPointerArray compact](observers, "compact");
      if (-[NSPointerArray count](self->_observers, "count"))
      {
        v5 = 0;
        while (-[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v5) != v6)
        {
          if (++v5 >= -[NSPointerArray count](self->_observers, "count"))
            goto LABEL_9;
        }
        -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v5);
      }
    }
  }
LABEL_9:

}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, id, void *);
  NSPointerArray *observers;
  unint64_t v6;
  void *v7;
  id v8;
  id location;

  v4 = (void (**)(id, id, void *))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      -[NSPointerArray compact](observers, "compact");
      if (-[NSPointerArray count](self->_observers, "count"))
      {
        v6 = 0;
        do
        {
          objc_initWeak(&location, self);
          -[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_loadWeakRetained(&location);
          v4[2](v4, v8, v7);

          objc_destroyWeak(&location);
          ++v6;
        }
        while (v6 < -[NSPointerArray count](self->_observers, "count"));
      }
    }
  }

}

- (BOOL)_isTransitionAnimated
{
  return !UIAccessibilityIsReduceMotionEnabled();
}

- (id)_newPropertyAnimator
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9D8]), "initWithDampingRatio:", 1.0);
  v4 = (void *)objc_msgSend(v2, "initWithDuration:timingParameters:", v3, 0.3);

  return v4;
}

- (id)_presentingViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x1E0CEBDB0];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x1E0CEBDC0];
  return (id)objc_msgSend(a4, "viewForKey:", *v4);
}

- (id)_presentedViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x1E0CEBDC0];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x1E0CEBDB0];
  return (id)objc_msgSend(a4, "viewForKey:", *v4);
}

- (id)_sourceViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  UIView *sourceView;

  sourceView = self->_sourceView;
  if (sourceView)
    return sourceView;
  -[PLViewControllerAnimator _presentingViewForPresentation:withTransitionContext:](self, "_presentingViewForPresentation:withTransitionContext:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_presentingViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x1E0CEBDA8];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x1E0CEBDB8];
  return (id)objc_msgSend(a4, "viewControllerForKey:", *v4);
}

- (id)_presentedViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x1E0CEBDB8];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x1E0CEBDA8];
  return (id)objc_msgSend(a4, "viewControllerForKey:", *v4);
}

- (id)_previewInteractionPresentableViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  -[PLViewControllerAnimator _presentedViewControllerForPresentation:withTransitionContext:](self, "_presentedViewControllerForPresentation:withTransitionContext:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFC7CEC0))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)_presentedExpandedPlatterForPresentedView:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EFC6B7C8))
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "expandedPlatterView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (void)prepareForTransitionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _OWORD v46[3];
  CGAffineTransform v47;
  CGAffineTransform v48;

  v4 = a3;
  self->_didPrepareForTransition = 1;
  if (self->_presenting)
  {
    -[PLViewControllerAnimator _presentedViewForPresentation:withTransitionContext:](self, "_presentedViewForPresentation:withTransitionContext:", 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLViewControllerAnimator _presentedExpandedPlatterForPresentedView:](self, "_presentedExpandedPlatterForPresentedView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsVisibleContentToBounds:", 1);
    -[PLViewControllerAnimator _presentedViewControllerForPresentation:withTransitionContext:](self, "_presentedViewControllerForPresentation:withTransitionContext:", self->_presenting, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandedPlatterPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialFrameOfPresentedViewInContainerView");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v8, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:fromView:", v18, v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(v5, "setFrame:", v20, v22, v24, v26);
    objc_msgSend(v5, "layoutIfNeeded");
    if (-[PLViewControllerAnimator includePresentingViewInAnimation](self, "includePresentingViewInAnimation"))
    {
      memset(&v48, 0, sizeof(v48));
      if (v4)
        objc_msgSend(v4, "targetTransform");
      v47 = v48;
      if (CGAffineTransformIsIdentity(&v47))
      {
        v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v47.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v47.c = v27;
        v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      else
      {
        *(_OWORD *)&v47.a = *(_OWORD *)&v48.a;
        *(_OWORD *)&v47.c = *(_OWORD *)&v48.c;
        v28 = *(_OWORD *)&v48.tx;
      }
      *(_OWORD *)&v47.tx = v28;
      v46[0] = *(_OWORD *)&v47.a;
      v46[1] = *(_OWORD *)&v47.c;
      v46[2] = v28;
      objc_msgSend(v5, "setTransform:", v46);
    }
    objc_msgSend(v5, "setAlpha:", 0.1);
    objc_msgSend(v6, "setActionsHidden:", 1);
LABEL_15:

    goto LABEL_16;
  }
  if (-[PLViewControllerAnimator includePresentingViewInAnimation](self, "includePresentingViewInAnimation"))
  {
    -[PLViewControllerAnimator _presentedViewControllerForPresentation:withTransitionContext:](self, "_presentedViewControllerForPresentation:withTransitionContext:", self->_presenting, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandedPlatterPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finalPresentationFrameOfPresentingViewInContainerView");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[PLViewControllerAnimator _previewInteractionPresentableViewControllerForPresentation:withTransitionContext:](self, "_previewInteractionPresentableViewControllerForPresentation:withTransitionContext:", self->_presenting, v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "presenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "viewForPreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "convertRect:fromView:", v40, v30, v32, v34, v36);
    objc_msgSend(v7, "setFrame:");

    objc_msgSend(v7, "layoutIfNeeded");
    objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "convertRect:fromView:", v42, v30, v32, v34, v36);
    objc_msgSend(v8, "setFrame:");

    memset(&v48, 0, sizeof(v48));
    if (v4)
      objc_msgSend(v4, "targetTransform");
    v47 = v48;
    if (!CGAffineTransformIsIdentity(&v47))
    {
      v47 = v48;
      objc_msgSend(v8, "setTransform:", &v47);
    }
    goto LABEL_15;
  }
LABEL_16:
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __60__PLViewControllerAnimator_prepareForTransitionWithContext___block_invoke;
  v44[3] = &unk_1E91D3540;
  v45 = v4;
  v43 = v4;
  -[PLViewControllerAnimator _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v44);

}

void __60__PLViewControllerAnimator_prepareForTransitionWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "isPresenting") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "viewControllerAnimator:willBeginPresentationAnimationWithTransitionContext:", v6, *(_QWORD *)(a1 + 32));
  }
  else if ((objc_msgSend(v6, "isPresenting") & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "viewControllerAnimator:willBeginDismissalAnimationWithTransitionContext:", v6, *(_QWORD *)(a1 + 32));
  }

}

- (void)performTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLViewControllerAnimator _performTransitionWithContext:](self, "_performTransitionWithContext:");
  if (self->_runAlongsideAnimationsManually && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "__runAlongsideAnimations");
  -[PLViewControllerAnimator _presentedViewControllerForPresentation:withTransitionContext:](self, "_presentedViewControllerForPresentation:withTransitionContext:", self->_presenting, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expandedPlatterPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completeDismissal");

}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)_performTransitionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  __int128 *v52;
  void *v53;
  void *v54;
  __int128 v55;
  void *v56;
  void *v57;
  __int128 v58;
  void *v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;

  v4 = a3;
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "_removeAllAnimations:", 1);
  -[PLViewControllerAnimator _presentedViewControllerForPresentation:withTransitionContext:](self, "_presentedViewControllerForPresentation:withTransitionContext:", self->_presenting, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "expandedPlatterPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (self->_presenting)
    objc_msgSend(v14, "finalPresentationFrameOfPresentingViewInContainerView");
  else
    objc_msgSend(v14, "finalDismissalFrameOfPresentingViewInContainerView");
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  if (self->_presenting)
    objc_msgSend(v15, "frameOfPresentedViewInContainerView");
  else
    objc_msgSend(v15, "initialFrameOfPresentedViewInContainerView");
  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  if (self->_presenting)
    v32 = v11;
  else
    v32 = v7;
  v61 = v32;
  -[PLViewControllerAnimator _previewInteractionPresentableViewControllerForPresentation:withTransitionContext:](self, "_previewInteractionPresentableViewControllerForPresentation:withTransitionContext:", self->_presenting, v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "presenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "viewForPreview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "superview");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "containerView");
  v38 = v13;
  v39 = v11;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "convertRect:fromView:", v40, v28, v29, v30, v31);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;

  -[PLViewControllerAnimator _presentedExpandedPlatterForPresentedView:](self, "_presentedExpandedPlatterForPresentedView:", v36);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[PLViewControllerAnimator includePresentingViewInAnimation](self, "includePresentingViewInAnimation");
  v51 = v7;
  v52 = (__int128 *)MEMORY[0x1E0C9BAA8];
  if (v50)
  {
    v59 = v39;
    v60 = v51;
    objc_msgSend(v35, "superview");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "convertRect:fromView:", v54, v20, v21, v22, v23);
    objc_msgSend(v35, "setFrame:");

    objc_msgSend(v35, "layoutIfNeeded");
    if (self->_presenting)
    {
      v55 = v52[1];
      v62 = *v52;
      v63 = v55;
      v64 = v52[2];
      objc_msgSend(v61, "setTransform:", &v62);
    }
    objc_msgSend(v61, "superview");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "convertRect:fromView:", v57, v20, v21, v22, v23);
    objc_msgSend(v61, "setFrame:");

    objc_msgSend(v61, "layoutIfNeeded");
    v39 = v59;
    v51 = v60;
  }
  objc_msgSend(v49, "setClipsVisibleContentToBounds:", !self->_presenting);
  v58 = v52[1];
  v62 = *v52;
  v63 = v58;
  v64 = v52[2];
  objc_msgSend(v36, "setTransform:", &v62);
  objc_msgSend(v36, "setFrame:", v42, v44, v46, v48);
  objc_msgSend(v36, "layoutIfNeeded");
  objc_msgSend(v49, "setActionsHidden:", !self->_presenting);
  objc_msgSend(v51, "setAlpha:", 1.0);
  objc_msgSend(v39, "setAlpha:", 0.0);

}

- (void)_animateTransitionWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  -[PLViewControllerAnimator propertyAnimator](self, "propertyAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke;
  v13[3] = &unk_1E91D3568;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v8, "addAnimations:", v13);
  if (v7)
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke_2;
    v11[3] = &unk_1E91D3590;
    v12 = v7;
    objc_msgSend(v8, "addCompletion:", v11);

  }
  objc_msgSend(v8, "startAnimation");

}

uint64_t __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTransitionWithContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void)animateTransition:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (!self->_didPrepareForTransition)
    -[PLViewControllerAnimator prepareForTransitionWithContext:](self, "prepareForTransitionWithContext:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PLViewControllerAnimator_animateTransition___block_invoke;
  v6[3] = &unk_1E91D31D8;
  v7 = v4;
  v5 = v4;
  -[PLViewControllerAnimator _animateTransitionWithContext:completion:](self, "_animateTransitionWithContext:completion:", v5, v6);

}

uint64_t __46__PLViewControllerAnimator_animateTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (void)animationEnded:(BOOL)a3
{
  UIViewPropertyAnimator *propertyAnimator;

  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = 0;

}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (BOOL)includePresentingViewInAnimation
{
  return self->_includePresentingViewInAnimation;
}

- (void)setIncludePresentingViewInAnimation:(BOOL)a3
{
  self->_includePresentingViewInAnimation = a3;
}

- (BOOL)runAlongsideAnimationsManually
{
  return self->_runAlongsideAnimationsManually;
}

- (void)setRunAlongsideAnimationsManually:(BOOL)a3
{
  self->_runAlongsideAnimationsManually = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
