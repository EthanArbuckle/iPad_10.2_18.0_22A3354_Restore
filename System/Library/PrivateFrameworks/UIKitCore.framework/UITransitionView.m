@implementation UITransitionView

- (void)safeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITransitionView;
  -[UIView safeAreaInsetsDidChange](&v4, sel_safeAreaInsetsDidChange);
  -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_containerViewSafeAreaInsetsDidChange");

}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048611, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

void __50__UITransitionView__startTransition_withDuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  double v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = a3;
  objc_opt_self();
  if (fluidPresentationTransitionsEnabled == 1)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, *(double *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_3;
    v17[3] = &unk_1E16B1BF8;
    v8 = &v18;
    v18 = v5;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_4;
    v15[3] = &unk_1E16C0E38;
    v16 = v6;
    v9 = v5;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v7, 0, v17, v15);

  }
  else
  {
    v10 = *(double *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_5;
    v13[3] = &unk_1E16B1BF8;
    v8 = &v14;
    v14 = v5;
    v12 = v5;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v11, v13, v6, v10, 0.0);
  }

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITransitionView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_containerViewLayoutSubviews");

}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITransitionView;
  -[UIView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_containerViewBoundsDidChange");

}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentedViewForOverrideTraits");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(v5, "traitCollection");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITransitionView;
    -[UIView _traitCollectionForChildEnvironment:](&v10, sel__traitCollectionForChildEnvironment_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (double)durationForTransition:(int)a3
{
  uint64_t v3;
  UITransitionView *WeakRetained;
  UITransitionView *v6;
  BOOL v7;
  double v8;
  double v9;

  v3 = *(_QWORD *)&a3;
  WeakRetained = (UITransitionView *)objc_loadWeakRetained(&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = WeakRetained == self;
  else
    v7 = 1;
  if (v7 || (objc_opt_respondsToSelector() & 1) == 0)
    objc_msgSend((id)objc_opt_class(), "defaultDurationForTransition:", v3);
  else
    -[UITransitionView durationForTransition:](v6, "durationForTransition:", v3);
  v9 = v8;

  return v9;
}

+ (double)defaultDurationForTransition:(int)a3
{
  if (a3 > 0xF)
    return 0.4;
  else
    return dbl_186685600[a3];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)setShouldNotifyDidCompleteImmediately:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFFFB | v3;
}

- (void)setIgnoresInteractionEvents:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFFFD | v3;
}

- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITransitionView;
  v6 = a4;
  -[UIView _viewDidMoveFromScreen:toScreen:](&v8, sel__viewDidMoveFromScreen_toScreen_, a3, v6);
  -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_containerViewScreenDidChangeToScreen:", v6);

}

- (BOOL)transition:(int)a3 toView:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[UIView subviews](self, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 < 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", (v8 - 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[UITransitionView transition:fromView:toView:](self, "transition:fromView:toView:", v4, v9, v6);

  return v10;
}

- (BOOL)transition:(int)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  id v10;
  id v11;
  __int16 transitionViewFlags;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  UIView **p_toView;
  __int16 v22;
  void *v23;
  uint64_t v24;
  UIWindow *v25;
  UIWindow *originalWindow;
  UITransitionView *WeakRetained;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  UITransitionView *v32;
  void *v33;
  void *v34;
  UITransitionView *v35;
  void *v36;
  void *v37;
  UITransitionView *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  UIView *v50;
  char v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  unint64_t v59;
  int v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  UITransitionView *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  UIView **p_fromView;
  id *v79;
  id v80;
  void *v81;
  void *v82;
  char v83;
  id obj;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  transitionViewFlags = (__int16)self->_transitionViewFlags;
  if ((transitionViewFlags & 1) != 0)
    goto LABEL_83;
  if ((transitionViewFlags & 2) != 0)
    objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 1);
  -[UIView subviews](self, "subviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  v83 = transitionViewFlags;
  v82 = v13;
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    goto LABEL_9;
  if (!v10)
  {
    if (!objc_msgSend(v13, "count"))
    {
      v10 = 0;
      if (v11)
        goto LABEL_9;
LABEL_65:
      if ((unint64_t)objc_msgSend(v13, "count") < 2)
      {
        obj = 0;
      }
      else
      {
        v60 = dyld_program_sdk_at_least();
        objc_msgSend(v13, "objectAtIndex:", 1);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v61;
        if (v60)
        {
          objc_msgSend(v13, "objectAtIndex:", v61 != (_QWORD)v10);
          v63 = objc_claimAutoreleasedReturnValue();

          obj = (id)v63;
        }
        else
        {
          obj = (id)v61;
        }
      }
      goto LABEL_10;
    }
    objc_msgSend(v13, "objectAtIndex:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v11)
    goto LABEL_65;
LABEL_9:
  obj = v11;
LABEL_10:
  -[UITransitionView durationForTransition:](self, "durationForTransition:", v8);
  v17 = v16;
  objc_msgSend(v10, "firstResponder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_responderForBecomeFirstResponder");
  v19 = objc_claimAutoreleasedReturnValue();

  v81 = (void *)v19;
  if (objc_msgSend(v10, "_containsResponder:", v19))
    v20 = (void *)v19;
  else
    v20 = 0;
  v80 = v20;
  p_fromView = &self->_fromView;
  objc_storeStrong((id *)&self->_fromView, v10);
  p_toView = &self->_toView;
  objc_storeStrong((id *)&self->_toView, obj);
  objc_storeStrong((id *)&self->_firstResponderToRemember, v20);
  if (v6)
    v22 = 1024;
  else
    v22 = 0;
  *(_WORD *)&self->_transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFBFF | v22;
  if ((_DWORD)v8
    && v17 != 0.0
    && ((+[UIDevice currentDevice](UIDevice, "currentDevice"),
         v23 = (void *)objc_claimAutoreleasedReturnValue(),
         v24 = objc_msgSend(v23, "userInterfaceIdiom"),
         v23,
         (v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
     || (*p_fromView || !v6)
     && *p_fromView != *p_toView
     && (*p_toView || v8 > 0x13 || ((1 << v8) & 0xC0100) == 0)))
  {
    -[UIView window](self, "window", p_fromView);
    v25 = (UIWindow *)objc_claimAutoreleasedReturnValue();
    originalWindow = self->_originalWindow;
    self->_originalWindow = v25;

    -[UIWindow beginDisablingInterfaceAutorotation](self->_originalWindow, "beginDisablingInterfaceAutorotation");
    WeakRetained = (UITransitionView *)objc_loadWeakRetained(&self->_delegate);
    -[UIView window](self, "window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&self->_transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFFF7 | (8 * (v28 != 0));

    v29 = 0;
    v30 = 1;
    if ((*(_WORD *)&self->_transitionViewFlags & 8) != 0)
    {
LABEL_28:
      if (!WeakRetained
        || (objc_opt_respondsToSelector() & 1) != 0
        && -[UITransitionView transitionViewShouldUseViewControllerCallbacks](WeakRetained, "transitionViewShouldUseViewControllerCallbacks"))
      {
        v32 = WeakRetained;
        +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", *p_fromView, p_fromView);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", *p_toView);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "beginAppearanceTransition:animated:", 1, v30);
        objc_msgSend(v33, "beginAppearanceTransition:animated:", 0, v30);

        WeakRetained = v32;
      }
    }
  }
  else
  {
    WeakRetained = (UITransitionView *)objc_loadWeakRetained(&self->_delegate);
    v30 = 0;
    v31 = *(_WORD *)&self->_transitionViewFlags & 0xFFF7;
    *(_WORD *)&self->_transitionViewFlags = v31;
    v29 = 1;
    if ((v31 & 8) != 0)
      goto LABEL_28;
  }
  if ((v8 - 12) <= 0xFFFFFFFD)
  {
    if (*p_toView)
    {
      -[UIView superview](*p_toView, "superview");
      v35 = (UITransitionView *)objc_claimAutoreleasedReturnValue();

      if (v35 != self)
        -[UIView addSubview:](self, "addSubview:", *p_toView);
    }
  }
  -[UITransitionView _didStartTransition](self, "_didStartTransition", p_fromView);
  if (v29)
  {
    v37 = v80;
    v36 = v81;
    if (*p_toView)
    {
      v38 = WeakRetained;
      -[UIView frame](*p_toView, "frame");
      v40 = v39;
      v42 = v41;
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "userInterfaceIdiom");

      if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (v45 = *v79) == 0)
        v45 = *p_toView;
      objc_msgSend(v45, "frame");
      v47 = v46;
      v49 = v48;
      v50 = *p_toView;
      WeakRetained = v38;
      if ((v8 - 12) <= 0xFFFFFFFD
        && (v8 - 18) <= 0xFFFFFFFD
        && (v8 - 15) <= 0xFFFFFFFD
        && (_DWORD)v8 != 6
        && (_DWORD)v8 != 20
        && (_DWORD)v8 != 9)
      {
        if (v50)
        {
          if (v38)
          {
            if (v38 != self)
            {
              v51 = objc_opt_respondsToSelector();
              v50 = *p_toView;
              if ((v51 & 1) != 0)
              {
                -[UITransitionView transitionView:endOriginForToView:forTransition:defaultOrigin:](v38, "transitionView:endOriginForToView:forTransition:defaultOrigin:", self, v50, v8, v47, v49);
                v47 = v52;
                v49 = v53;
                v50 = *p_toView;
              }
            }
          }
        }
      }
      -[UIView setFrame:](v50, "setFrame:", v47, v49, v40, v42);
    }
    -[UITransitionView _didCompleteTransition:](self, "_didCompleteTransition:", 1);
  }
  else
  {
    v37 = v80;
    v55 = *MEMORY[0x1E0C9D538];
    v54 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    switch((int)v8)
    {
      case 1:
        -[UIView bounds](self, "bounds");
        v55 = v65;
        goto LABEL_73;
      case 2:
        -[UIView bounds](*p_toView, "bounds");
        v55 = floor(-v66);
LABEL_73:
        v54 = 0.0;
        goto LABEL_74;
      case 3:
      case 8:
      case 19:
        -[UIView bounds](self, "bounds");
        v54 = v56;
        v55 = 0.0;
        if ((_DWORD)v8 == 19)
          objc_msgSend(*v79, "setAlpha:", 1.0);
        goto LABEL_74;
      case 6:
        -[UIView setAlpha:](*p_toView, "setAlpha:", 0.0);
        objc_msgSend(*v79, "setAlpha:", 1.0);
        break;
      case 7:
      case 18:
        -[UIView bounds](self, "bounds");
        v54 = -v64;
        v55 = 0.0;
        goto LABEL_74;
      case 9:
      case 12:
      case 20:
        -[UIView subviews](self, "subviews");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57;
        if (*p_toView)
        {
          if (*v79)
          {
            v59 = objc_msgSend(v57, "indexOfObject:");
            if (v59 < objc_msgSend(v58, "indexOfObject:", *p_toView))
              -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](self, "exchangeSubviewAtIndex:withSubviewAtIndex:", objc_msgSend(v58, "indexOfObject:", *v79), objc_msgSend(v58, "indexOfObject:", *p_toView));
          }
        }
        if ((_DWORD)v8 == 20)
          -[UIView setAlpha:](*p_toView, "setAlpha:", 0.0);

        goto LABEL_74;
      case 10:
      case 11:
LABEL_74:
        if (WeakRetained && WeakRetained != self && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UITransitionView transitionView:beginOriginForToView:forTransition:defaultOrigin:](WeakRetained, "transitionView:beginOriginForToView:forTransition:defaultOrigin:", self, *p_toView, v8, v55, v54);
          v55 = v67;
          v54 = v68;
        }
        if (-[UITransitionView rasterizesOnTransition](self, "rasterizesOnTransition"))
        {
          -[UIView layer](*p_toView, "layer");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setShouldRasterize:", 1);

          -[UIView window](self, "window");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "screen");
          v71 = WeakRetained;
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "scale");
          v74 = v73;
          -[UIView layer](*p_toView, "layer");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setRasterizationScale:", v74);

          WeakRetained = v71;
          -[UIView layer](*p_toView, "layer");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setPreloadsCache:", 1);

        }
        -[UIView setFrameOrigin:](*p_toView, "setFrameOrigin:", v55, v54);
        break;
      case 13:
        -[UIWindow beginDisablingInterfaceAutorotation](self->_originalWindow, "beginDisablingInterfaceAutorotation");
        break;
      case 14:
        *(_WORD *)&self->_transitionViewFlags |= 0x200u;
        break;
      default:
        break;
    }
    -[UITransitionView _startTransition:withDuration:](self, "_startTransition:withDuration:", v8, v17);
    v36 = v81;
  }

  LOBYTE(transitionViewFlags) = v83;
  v11 = obj;
LABEL_83:

  return (transitionViewFlags & 1) == 0;
}

- (void)_didStartTransition
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "transitionViewDidStart:", self);
      v4 = v6;
    }
  }

}

- (BOOL)transition:(int)a3 fromView:(id)a4 toView:(id)a5
{
  return -[UITransitionView transition:fromView:toView:removeFromView:](self, "transition:fromView:toView:removeFromView:", *(_QWORD *)&a3, a4, a5, 1);
}

- (void)_didCompleteTransition:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  $802F755A6CDB6E48F3999BA741DE358D transitionViewFlags;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableArray *frozenSubviews;
  UIView *fromView;
  UITransitionView *v21;
  UIResponder *firstResponderToRemember;
  __int16 v23;
  UIWindow *originalWindow;
  void *v25;
  void *v26;
  UIView *v27;
  void *v28;
  void *v29;
  UIView *toView;
  UIView *v31;
  UIView *v32;
  UIView *v33;
  UIView *v34;
  id WeakRetained;
  __int16 v36;
  void *v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v40 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  -[UIView layer](self->_toView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", 0);

  -[UIView layer](self->_toView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreloadsCache:", 0);

  -[UIView layer](self->_fromView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldRasterize:", 0);

  -[UIView layer](self->_fromView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreloadsCache:", 0);

  transitionViewFlags = self->_transitionViewFlags;
  if ((*(_BYTE *)&transitionViewFlags & 0x20) != 0)
  {
    v9 = (*(unsigned int *)&transitionViewFlags >> 7) & 1;
    -[UIView layer](self->_toView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", v9);

    v11 = (*(_WORD *)&self->_transitionViewFlags >> 6) & 1;
    -[UIView layer](self->_fromView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", v11);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = self->_frozenSubviews;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrozen:", 0);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v15);
  }

  frozenSubviews = self->_frozenSubviews;
  self->_frozenSubviews = 0;

  fromView = self->_fromView;
  if (fromView)
  {
    if (fromView != self->_toView)
    {
      -[UIView superview](fromView, "superview");
      v21 = (UITransitionView *)objc_claimAutoreleasedReturnValue();

      if (v21 == self)
      {
        v39 = (__int16)self->_transitionViewFlags;
        if ((v39 & 0x400) != 0)
        {
          -[UIView removeFromSuperview](self->_fromView, "removeFromSuperview");
          v39 = (__int16)self->_transitionViewFlags;
        }
        if ((v39 & 0x10) != 0)
          -[UIView setAlpha:](self->_fromView, "setAlpha:", 1.0);
        if (self->_firstResponderToRemember
          && -[UIResponder _containsResponder:](self->_fromView, "_containsResponder:"))
        {
          -[UIResponder _becomeFirstResponderWhenPossible](self->_firstResponderToRemember, "_becomeFirstResponderWhenPossible");
        }
      }
    }
  }
  firstResponderToRemember = self->_firstResponderToRemember;
  self->_firstResponderToRemember = 0;

  v23 = (__int16)self->_transitionViewFlags;
  if ((v23 & 2) != 0)
  {
    objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 0);
    v23 = (__int16)self->_transitionViewFlags;
  }
  *(_WORD *)&self->_transitionViewFlags = v23 & 0xFFFE;
  ++self->_transitionID;
  -[UIWindow endDisablingInterfaceAutorotation](self->_originalWindow, "endDisablingInterfaceAutorotation");
  originalWindow = self->_originalWindow;
  self->_originalWindow = 0;

  v25 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self->_fromView;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(_WORD *)&self->_transitionViewFlags >> 10) & 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v26, CFSTR("finished"), v27, CFSTR("fromView"), v28, CFSTR("removeFromView"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  toView = self->_toView;
  if (toView)
    objc_msgSend(v29, "setObject:forKey:", toView, CFSTR("toView"));
  v31 = self->_fromView;
  v32 = self->_toView;
  v33 = self->_fromView;
  self->_fromView = 0;

  v34 = self->_toView;
  self->_toView = 0;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (!WeakRetained)
    goto LABEL_24;
  v36 = (__int16)self->_transitionViewFlags;
  if (-[UITransitionView shouldNotifyDidCompleteImmediately](self, "shouldNotifyDidCompleteImmediately"))
  {
    -[UITransitionView notifyDidCompleteTransition:](self, "notifyDidCompleteTransition:", v29);
    if ((v36 & 8) == 0)
      goto LABEL_25;
  }
  else
  {
    -[UITransitionView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_notifyDidCompleteTransition_, v29, 0.0);
    if ((v36 & 8) == 0)
      goto LABEL_25;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "transitionViewShouldUseViewControllerCallbacks"))
  {
LABEL_24:
    +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v32);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "endAppearanceTransition");
    objc_msgSend(v38, "endAppearanceTransition");

  }
LABEL_25:

}

- (BOOL)shouldNotifyDidCompleteImmediately
{
  return (*(_WORD *)&self->_transitionViewFlags >> 2) & 1;
}

- (void)notifyDidCompleteTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UITransitionView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("fromView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("toView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("removeFromView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transitionViewDidComplete:fromView:toView:removeFromView:", self, v5, v6, objc_msgSend(v7, "BOOLValue"));

LABEL_6:
LABEL_7:

      goto LABEL_8;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("fromView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("toView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transitionViewDidComplete:fromView:toView:", self, v5, v6);
      goto LABEL_6;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("finished"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transitionViewDidComplete:finished:", self, objc_msgSend(v5, "BOOLValue"));
      goto LABEL_7;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "transitionViewDidComplete:", self);
  }
LABEL_8:

}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UITransitionView;
  -[UIView willMoveToSuperview:](&v7, sel_willMoveToSuperview_, v4);
  -[UITransitionView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "overrideTextEffectsVisibilityLevelForTransitionView:", self);
  else
    v6 = 300;
  self->_textEffectsVisibilityLevel = v6;

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)_startTransition:(int)a3 withDuration:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIView *fromView;
  UIView *toView;
  int64_t animationTimingCurve;
  unint64_t transitionID;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v39;
  double v40;
  double MaxY;
  double v42;
  double v43;
  BOOL v44;
  unsigned int v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  BOOL v50;
  BOOL v51;
  BOOL v53;
  BOOL v54;
  _QWORD recta[5];
  __int128 v57;
  __int128 v58;
  _QWORD v59[12];
  int v60;
  BOOL v61;
  BOOL v62;
  BOOL v63;
  _QWORD v64[6];
  _QWORD aBlock[6];
  _QWORD v66[4];
  __int128 v67;
  _QWORD v68[4];
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v71 = *MEMORY[0x1E0C80C00];
  *(_WORD *)&self->_transitionViewFlags |= 1u;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3010000000;
  v68[3] = &unk_18685B0AF;
  v69 = *MEMORY[0x1E0C9D538];
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3010000000;
  v66[3] = &unk_18685B0AF;
  v67 = v69;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  fromView = self->_fromView;
  toView = self->_toView;
  animationTimingCurve = self->_animationTimingCurve;
  transitionID = self->_transitionID;
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__UITransitionView__startTransition_withDuration___block_invoke;
  aBlock[3] = &unk_1E16B7A60;
  aBlock[4] = self;
  aBlock[5] = transitionID;
  v19 = _Block_copy(aBlock);
  v20 = a3 & 0xFFFFFFFE;
  v21 = animationTimingCurve << 16;
  if (a3 <= 0xE && ((1 << a3) & 0x6C00) != 0)
  {
    if (v20 == 10)
    {
      v22 = 0x200000;
      if (a3 == 10)
        v22 = 0x100000;
      +[UIView transitionFromView:toView:duration:options:completion:](UIView, "transitionFromView:toView:duration:options:completion:", self->_fromView, self->_toView, v21 | v22, v19, a4);
    }
    else if (a3 == 14)
    {
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_fromView, 0);
      +[UIView _animateWithFilter:filterView:filterValue:duration:delay:options:completion:](UIView, "_animateWithFilter:filterView:filterValue:duration:delay:options:completion:", 200, self->_toView, v21 | 0x10000, v19, 0.0, a4, 0.0);
    }
    else if (a3 == 13)
    {
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_toView, 0);
      -[UIView layoutBelowIfNeeded](self->_toView, "layoutBelowIfNeeded");
      -[UIView bounds](self->_toView, "bounds");
      recta[0] = v23;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      -[UIView subviews](self->_toView, "subviews");
      v57 = 0u;
      v58 = 0u;
      memset(&recta[1], 0, 32);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &recta[1], v70, 16);
      if (v31)
      {
        v32 = *(_QWORD *)recta[3];
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)recta[3] != v32)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(recta[2] + 8 * i), "frame");
            x = v72.origin.x;
            y = v72.origin.y;
            width = v72.size.width;
            height = v72.size.height;
            MinY = CGRectGetMinY(v72);
            *(_QWORD *)&v73.origin.x = recta[0];
            v73.origin.y = v25;
            v73.size.width = v27;
            v73.size.height = v29;
            if (MinY < CGRectGetMaxY(v73))
            {
              v74.origin.x = x;
              v74.origin.y = y;
              v74.size.width = width;
              v74.size.height = height;
              v39 = CGRectGetMinY(v74);
              *(_QWORD *)&v75.origin.x = recta[0];
              v75.origin.y = v25;
              v75.size.width = v27;
              v75.size.height = v29;
              v29 = v39 - CGRectGetMinY(v75);
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &recta[1], v70, 16);
        }
        while (v31);
      }

      -[UIView bounds](self->_toView, "bounds");
      v40 = CGRectGetHeight(v76);
      *(_QWORD *)&v77.origin.x = recta[0];
      v77.origin.y = v25;
      v77.size.width = v27;
      v77.size.height = v29;
      MaxY = CGRectGetMaxY(v77);
      if (MaxY < 40.0)
        MaxY = 40.0;
      self->_curlUpRevealedHeight = v40 - MaxY;
      -[UIView bounds](self->_toView, "bounds");
      _UIViewCurlUpTransitionToTime(&self->_curlUpRevealedHeight, v42, v43);
      +[UIView _animateWithFilter:filterView:filterValue:duration:delay:options:completion:](UIView, "_animateWithFilter:filterView:filterValue:duration:delay:options:completion:", 200, self->_fromView, v21 | 0x20000, v19, self->_curlUpRevealedHeight, a4, 0.0);

    }
  }
  else
  {
    v44 = v20 == 16;
    v45 = a3 - 12;
    v46 = a3 != 6;
    v47 = a3 == 9 || toView == 0;
    v64[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_2;
    v64[3] = &__block_descriptor_48_e24_v24__0___v___8___v__B_16l;
    v48 = v47 || a3 == 20;
    v64[0] = v18;
    v64[1] = 3221225472;
    v50 = !v48 && (a3 - 18) < 0xFFFFFFFE && a3 != 6;
    *(double *)&v64[4] = a4;
    v64[5] = v21;
    v51 = a3 == 8 || fromView == 0;
    v59[0] = v18;
    v59[1] = 3221225472;
    v59[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_6;
    v59[3] = &unk_1E16EB0B0;
    if (v51 || (a3 - 20) >= 0xFFFFFFFC)
      v46 = 0;
    v60 = a3;
    v53 = __CFADD__(v45, 2);
    v54 = v45 < 0xFFFFFFFE && v50;
    if (v53)
      v46 = 0;
    v59[4] = self;
    v59[5] = v68;
    v59[7] = v7;
    v59[8] = v9;
    v59[9] = v11;
    v59[10] = v13;
    *(double *)&v59[11] = a4;
    v61 = v46;
    v62 = v54;
    v59[6] = v66;
    v63 = v44;
    +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", a4 > 0.0, v64, v59, v19);
  }

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
}

- (UITransitionView)initWithFrame:(CGRect)a3
{
  UITransitionView *v3;
  UITransitionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITransitionView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 16);
    *(_WORD *)&v4->_transitionViewFlags = *(_WORD *)&v4->_transitionViewFlags & 0xFEFD | 2;
    v4->_textEffectsVisibilityLevel = 300;
    -[UITransitionView setAnimationTimingCurve:](v4, "setAnimationTimingCurve:", 7);
  }
  return v4;
}

- (void)setAnimationTimingCurve:(int64_t)a3
{
  self->_animationTimingCurve = a3;
}

- (void)setIgnoreDirectTouchEvents:(BOOL)a3
{
  self->_ignoreDirectTouchEvents = a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITransitionView;
  -[UIView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_containerViewTraitCollectionDidChange");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWindow, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_firstResponderToRemember, 0);
  objc_storeStrong((id *)&self->_frozenSubviews, 0);
  objc_storeStrong((id *)&self->_toView, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)rasterizesOnTransition
{
  return HIBYTE(*(_WORD *)&self->_transitionViewFlags) & 1;
}

_QWORD *__50__UITransitionView__startTransition_withDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) == result[61])
    return (_QWORD *)objc_msgSend(result, "_transitionDidStopFinished:", a2);
  return result;
}

- (void)_transitionDidStopFinished:(BOOL)a3
{
  _BOOL8 v3;

  if ((*(_WORD *)&self->_transitionViewFlags & 1) != 0)
  {
    v3 = a3;
    if ((*(_WORD *)&self->_transitionViewFlags & 0x200) != 0)
    {
      -[UIWindow endDisablingInterfaceAutorotation](self->_originalWindow, "endDisablingInterfaceAutorotation");
      *(_WORD *)&self->_transitionViewFlags &= ~0x200u;
    }
    -[UITransitionView _didCompleteTransition:](self, "_didCompleteTransition:", v3);
  }
}

- (UITransitionView)initWithCoder:(id)a3
{
  id v4;
  UITransitionView *v5;
  uint64_t v6;
  UIView *fromView;
  uint64_t v8;
  UIView *toView;
  uint64_t v10;
  UIResponder *firstResponderToRemember;
  void *v12;
  __int16 v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UITransitionView;
  v5 = -[UIView initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIFromView"));
    v6 = objc_claimAutoreleasedReturnValue();
    fromView = v5->_fromView;
    v5->_fromView = (UIView *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIToView"));
    v8 = objc_claimAutoreleasedReturnValue();
    toView = v5->_toView;
    v5->_toView = (UIView *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIFirstResponderToRemember"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstResponderToRemember = v5->_firstResponderToRemember;
    v5->_firstResponderToRemember = (UIResponder *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v5->_delegate, v12);

    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIIgnoresInteractionEvents")))
      v13 = 2;
    else
      v13 = 0;
    *(_WORD *)&v5->_transitionViewFlags = *(_WORD *)&v5->_transitionViewFlags & 0xFEFD | v13;
    v5->_textEffectsVisibilityLevel = objc_msgSend(v4, "decodeIntForKey:", CFSTR("UITextEffectsVisibilityLevel"));
    -[UITransitionView setAnimationTimingCurve:](v5, "setAnimationTimingCurve:", 7);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIView *fromView;
  UIView *toView;
  UIResponder *firstResponderToRemember;
  id WeakRetained;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITransitionView;
  -[UIView encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  fromView = self->_fromView;
  if (fromView)
    objc_msgSend(v4, "encodeObject:forKey:", fromView, CFSTR("UIFromView"));
  toView = self->_toView;
  if (toView)
    objc_msgSend(v4, "encodeObject:forKey:", toView, CFSTR("UIToView"));
  firstResponderToRemember = self->_firstResponderToRemember;
  if (firstResponderToRemember)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", firstResponderToRemember, CFSTR("UIFirstResponderToRemember"));
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  if ((*(_WORD *)&self->_transitionViewFlags & 2) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIIgnoresInteractionEvents"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_textEffectsVisibilityLevel, CFSTR("UITextEffectsVisibilityLevel"));

}

- (int)textEffectsVisibilityLevel
{
  return self->_textEffectsVisibilityLevel;
}

- (id)fromView
{
  return self->_fromView;
}

- (id)toView
{
  return self->_toView;
}

- (BOOL)isTransitioning
{
  return *(_WORD *)&self->_transitionViewFlags & 1;
}

- (BOOL)_isTransitioningFromFromView:(id)a3
{
  UIView *v4;
  BOOL v5;
  objc_super v7;

  v4 = (UIView *)a3;
  if (-[UITransitionView isTransitioning](self, "isTransitioning") && self->_fromView == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITransitionView;
    v5 = -[UIResponder _isTransitioningFromView:](&v7, sel__isTransitioningFromView_, self);
  }

  return v5;
}

- (void)setRasterizesOnTransition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFEFF | v3;
}

- (BOOL)ignoresInteractionEvents
{
  return (*(_WORD *)&self->_transitionViewFlags >> 1) & 1;
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048611, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

void __50__UITransitionView__startTransition_withDuration___block_invoke_6(uint64_t a1)
{
  int v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  _QWORD v73[5];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 96);
  switch(v2)
  {
    case 1:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "bounds");
      v6 = -v5;
      goto LABEL_7;
    case 2:
      v6 = *(double *)(a1 + 72);
LABEL_7:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(double *)(v7 + 32) = floor(v6);
      *(_QWORD *)(v7 + 40) = 0;
      goto LABEL_9;
    case 3:
    case 12:
      v3 = -*(double *)(a1 + 80);
      goto LABEL_4;
    case 7:
    case 9:
    case 20:
      v3 = *(double *)(a1 + 80);
LABEL_4:
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(_QWORD *)(v4 + 32) = 0;
      *(double *)(v4 + 40) = floor(v3);
      goto LABEL_9;
    case 17:
      objc_msgSend(*(id *)(a1 + 32), "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
LABEL_9:
      v2 = *(_DWORD *)(a1 + 96);
      break;
    default:
      break;
  }
  switch(v2)
  {
    case 20:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
      break;
    case 19:
      v14 = *(double *)(a1 + 88);
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_7;
      v73[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
      *(double *)&v73[4] = v14;
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_9;
      v72[3] = &unk_1E16B1B28;
      v72[4] = *(_QWORD *)(a1 + 32);
      +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v14 > 0.0, v73, v72, 0);
      *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) |= 0x10u;
      if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisableGroupOpacityOnAlphaTransitions"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "allowsGroupOpacity"))
          v16 = 128;
        else
          v16 = 0;
        *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) & 0xFF7F | v16;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "allowsGroupOpacity"))
          v18 = 64;
        else
          v18 = 0;
        *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) & 0xFFBF | v18;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAllowsGroupOpacity:", 0);

        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
        goto LABEL_30;
      }
      break;
    case 6:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
      *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) |= 0x10u;
      if (objc_msgSend(*(id *)(a1 + 32), "_shouldDisableGroupOpacityOnAlphaTransitions"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "allowsGroupOpacity"))
          v9 = 128;
        else
          v9 = 0;
        *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) & 0xFF7F | v9;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "allowsGroupOpacity"))
          v11 = 64;
        else
          v11 = 0;
        *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) & 0xFFBF | v11;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
LABEL_30:
        objc_msgSend(v13, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAllowsGroupOpacity:", 0);

        *(_WORD *)(*(_QWORD *)(a1 + 32) + 464) |= 0x20u;
      }
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (*(_BYTE *)(a1 + 100) && v21 && v21 != *(_QWORD *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v22, "transitionView:endOriginForFromView:forTransition:defaultOrigin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), *(unsigned int *)(a1 + 96), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v23 + 32) = v24;
    *(_QWORD *)(v23 + 40) = v25;
  }
  if (*(_BYTE *)(a1 + 101) && v22 && v22 != *(void **)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v22, "transitionView:endOriginForToView:forTransition:defaultOrigin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(unsigned int *)(a1 + 96), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v26 + 32) = v27;
    *(_QWORD *)(v26 + 40) = v28;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 432);
  *(_QWORD *)(v30 + 432) = v29;

  if (*(_BYTE *)(a1 + 100))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "rasterizesOnTransition") & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setShouldRasterize:", 1);

      objc_msgSend(*(id *)(a1 + 32), "window");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "screen");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scale");
      v36 = v35;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setRasterizationScale:", v36);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setPreloadsCache:", 1);

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "subviews");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v69 != v42)
              objc_enumerationMutation(v39);
            v44 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_msgSend(v44, "layer");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isFrozen");

            if ((v46 & 1) == 0)
            {
              objc_msgSend(v44, "layer");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setFrozen:", 1);

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addObject:", v44);
            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
        }
        while (v41);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrameOrigin:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  if (*(_BYTE *)(a1 + 101))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "rasterizesOnTransition") & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setShouldRasterize:", 1);

      objc_msgSend(*(id *)(a1 + 32), "window");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "screen");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "scale");
      v52 = v51;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setRasterizationScale:", v52);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setPreloadsCache:", 1);

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "subviews");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v57; ++j)
          {
            if (*(_QWORD *)v65 != v58)
              objc_enumerationMutation(v55);
            v60 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            objc_msgSend(v60, "layer");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "isFrozen");

            if ((v62 & 1) == 0)
            {
              objc_msgSend(v60, "layer");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "setFrozen:", 1);

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addObject:", v60);
            }
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
        }
        while (v57);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrameOrigin:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  if (*(_BYTE *)(a1 + 102) && v22 && v22 != *(void **)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "transitionView:startCustomTransitionWithDuration:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 88));

}

void __50__UITransitionView__startTransition_withDuration___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v6 = a3;
  objc_opt_self();
  if (fluidPresentationTransitionsEnabled == 1)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, *(double *)(a1 + 32) * 0.375);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_8;
    v8[3] = &unk_1E16C0E38;
    v9 = v6;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v7, 0, v5, v8);

  }
  else
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 512, v5, v6, *(double *)(a1 + 32) * 0.375, 0.0);
  }

}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
}

- (void)_completeRunningTransition
{
  -[UITransitionView _transitionDidStopFinished:](self, "_transitionDidStopFinished:", 1);
}

- (BOOL)_shouldDisableGroupOpacityOnAlphaTransitions
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UITransitionView *v5;
  int v6;
  void *v7;
  int v8;
  UITransitionView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UITransitionView;
  -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UITransitionView *)objc_claimAutoreleasedReturnValue();
  if (self->_ignoreDirectTouchEvents)
  {
    v6 = 0;
  }
  else
  {
    -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_containerViewShouldIgnoreDirectTouchEvents");

    v6 = v8 ^ 1;
  }
  if (v5 == self && v6 == 0)
    v10 = 0;
  else
    v10 = v5;

  return v10;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sublayerTransform")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITransitionView;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setBounds:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITransitionView;
  -[UIView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView _presentationControllerToNotifyOnLayoutSubviews](self, "_presentationControllerToNotifyOnLayoutSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_containerViewBoundsDidChange");

}

- (int64_t)animationTimingCurve
{
  return self->_animationTimingCurve;
}

- (BOOL)ignoreDirectTouchEvents
{
  return self->_ignoreDirectTouchEvents;
}

- (double)_curlUpRevealedHeight
{
  return self->_curlUpRevealedHeight;
}

@end
