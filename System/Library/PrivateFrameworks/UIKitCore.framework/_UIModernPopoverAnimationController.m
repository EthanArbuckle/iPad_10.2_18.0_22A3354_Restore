@implementation _UIModernPopoverAnimationController

- (double)transitionDuration:(id)a3
{
  void *v4;
  int v5;
  _BOOL4 v6;
  double result;
  double v8;

  -[_UIModernPopoverAnimationController popoverPresentationController](self, "popoverPresentationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldUseNewPopoverAnimations");

  v6 = -[_UIModernPopoverAnimationController isPresenting](self, "isPresenting");
  result = 0.51566;
  if (v6)
    result = 0.4937;
  v8 = 0.35;
  if (v6)
    v8 = 0.0;
  if (!v5)
    return v8;
  return result;
}

- (CGPoint)_anchorPointForArrowDirection:(unint64_t)a3 arrowOfset:(double)a4 popoverSize:(CGSize)a5
{
  double width;
  double v7;
  double v8;
  CGPoint result;

  width = a5.width;
  v7 = 0.5;
  v8 = 0.5;
  switch(a3)
  {
    case 1uLL:
      if (width > 0.0)
      {
        v7 = a4 / width + 0.5;
        v8 = 0.0;
      }
      break;
    case 2uLL:
      if (width > 0.0)
      {
        v7 = a4 / width + 0.5;
        v8 = 1.0;
      }
      break;
    case 4uLL:
      if (a5.height > 0.0)
      {
        v8 = a4 / a5.height + 0.5;
        v7 = 0.0;
      }
      break;
    case 8uLL:
      if (a5.height > 0.0)
      {
        v8 = a4 / a5.height + 0.5;
        v7 = 1.0;
      }
      break;
    default:
      break;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)_arrowPointForPopoverSize:(CGSize)a3 arrowOffset:(double)a4 arrowDirection:(unint64_t)a5
{
  double height;
  double width;
  double v7;
  double v8;
  CGPoint result;

  height = a3.height;
  width = a3.width;
  v7 = 0.0;
  v8 = 0.0;
  switch(a5)
  {
    case 1uLL:
      v7 = width * 0.5 + a4;
      break;
    case 2uLL:
      v7 = width * 0.5 + a4;
      v8 = height;
      break;
    case 4uLL:
      v8 = height * 0.5 + a4;
      break;
    case 8uLL:
      v8 = height * 0.5 + a4;
      v7 = width;
      break;
    default:
      break;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIViewControllerBuiltinTransitionViewAnimator *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  _BOOL4 v29;
  _OWORD *v30;
  double v31;
  double v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _UIModernPopoverAnimationController *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _UIModernPopoverAnimationController *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;

  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
    v8 = v6;
  else
    v8 = v7;
  objc_msgSend(v8, "popoverPresentationController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", CFSTR("UITransitionContextToView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIModernPopoverAnimationController isPresenting](self, "isPresenting");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
      v43 = v9;
    else
      v43 = v10;
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIModernPopoverAnimationController.m"), 87, CFSTR("Expected a popover view, found %@"), v43);

  }
  if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
    v11 = v9;
  else
    v11 = v10;
  v12 = v11;
  objc_msgSend(v5, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIModernPopoverAnimationController popoverPresentationController](self, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_shouldUseNewPopoverAnimations");

  v16 = -[_UIModernPopoverAnimationController isPresenting](self, "isPresenting");
  if ((v15 & 1) != 0)
  {
    if (v16)
    {
      objc_msgSend(v13, "addSubview:", v9);
      objc_msgSend(v12, "setChromeHidden:", 1);
      objc_msgSend(v5, "finalFrameForViewController:", v6);
      objc_msgSend(v12, "_setFrameIgnoringLayerTransform:");
      objc_msgSend(v12, "layoutIfNeeded");
    }
    if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
      objc_msgSend(v12, "_frameIgnoringLayerTransform");
    else
      objc_msgSend(v5, "initialFrameForViewController:", v7);
    v22 = v17;
    v23 = v18;
    v24 = v19;
    v25 = v20;
    objc_msgSend(v12, "setContentSize:", v19, v20 + 40.0);
    objc_msgSend(v12, "setAnimationOvershootHeight:", 40.0);
    if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
      v26 = 100.0;
    else
      v26 = v25;
    objc_msgSend(v12, "_setFrameIgnoringLayerTransform:", v22, v23, v24, v26);
    objc_msgSend(v12, "layoutIfNeeded");
    objc_msgSend(v12, "arrowOffset");
    -[_UIModernPopoverAnimationController _arrowPointForPopoverSize:arrowOffset:arrowDirection:](self, "_arrowPointForPopoverSize:arrowOffset:arrowDirection:", objc_msgSend(v12, "arrowDirection"), v24, v25, v27);
    v28 = objc_msgSend(v12, "arrowDirection");
    objc_msgSend(v12, "arrowOffset");
    -[_UIModernPopoverAnimationController _anchorPointForArrowDirection:arrowOfset:popoverSize:](self, "_anchorPointForArrowDirection:arrowOfset:popoverSize:", v28);
    objc_msgSend(v12, "setAnchorPoint:");
    memset(&v59, 0, sizeof(v59));
    v29 = -[_UIModernPopoverAnimationController isPresenting](self, "isPresenting");
    v30 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    if (v29)
    {
      CGAffineTransformMakeScale(&v59, 0.01, 0.01);
    }
    else
    {
      v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v59.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v59.c = v34;
      *(_OWORD *)&v59.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    v58 = v59;
    objc_msgSend(v12, "setTransform:", &v58);
    if (!-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
    {
      objc_msgSend(v12, "_setFrameIgnoringLayerTransform:", v22, v23, v24, v25);
      objc_msgSend(v12, "layoutIfNeeded");
    }
    memset(&v57, 0, sizeof(v57));
    if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
    {
      v35 = v30[1];
      *(_OWORD *)&v57.a = *v30;
      *(_OWORD *)&v57.c = v35;
      *(_OWORD *)&v57.tx = v30[2];
    }
    else
    {
      CGAffineTransformMakeScale(&v57, 0.01, 0.01);
    }
    -[_UIModernPopoverAnimationController isPresenting](self, "isPresenting");
    if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
      v36 = v25;
    else
      v36 = 100.0;
    -[_UIModernPopoverAnimationController transitionDuration:](self, "transitionDuration:", v5);
    v38 = v37;
    if (-[_UIModernPopoverAnimationController isPresenting](self, "isPresenting"))
      v39 = 0.8;
    else
      v39 = 0.85;
    v40 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke_3;
    v49[3] = &unk_1E16BDEB0;
    v41 = v12;
    v52 = 0;
    v53 = 0;
    v54 = v24;
    v55 = v36;
    v56 = v57;
    v50 = v41;
    v51 = self;
    v45[0] = v40;
    v45[1] = 3221225472;
    v45[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke_4;
    v45[3] = &unk_1E16B2B40;
    v46 = v41;
    v47 = self;
    v48 = v5;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v49, v45, v38, 0.0, v39, 0.0);

  }
  else if (v16)
  {
    v21 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", 0);
    -[UIViewControllerBuiltinTransitionViewAnimator animateTransition:](v21, "animateTransition:", v5);

  }
  else
  {
    -[_UIModernPopoverAnimationController transitionDuration:](self, "transitionDuration:", v5);
    v32 = v31;
    v33 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke;
    v62[3] = &unk_1E16B1B28;
    v63 = v10;
    v60[0] = v33;
    v60[1] = 3221225472;
    v60[2] = __57___UIModernPopoverAnimationController_animateTransition___block_invoke_2;
    v60[3] = &unk_1E16B3FD8;
    v61 = v5;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v62, v60, v32, 0.0);

  }
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return (UIPopoverPresentationController *)objc_loadWeakRetained((id *)&self->_popoverPresentationController);
}

- (void)setPopoverPresentationController:(id)a3
{
  objc_storeWeak((id *)&self->_popoverPresentationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_popoverPresentationController);
}

@end
