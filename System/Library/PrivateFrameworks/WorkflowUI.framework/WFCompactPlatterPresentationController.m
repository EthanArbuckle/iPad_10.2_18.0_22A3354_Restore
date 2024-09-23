@implementation WFCompactPlatterPresentationController

- (WFCompactPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  WFCompactPlatterPresentationController *v7;
  void *v8;
  WFCompactPlatterPresentationController *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFCompactPlatterPresentationController;
  v7 = -[WFCompactPlatterPresentationController initWithPresentedViewController:presentingViewController:](&v11, sel_initWithPresentedViewController_presentingViewController_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "setPlatterContentContainer:", v7);
    objc_msgSend(MEMORY[0x24BEC2EF8], "beginObservingKeyboardNotifications");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_keyboardWillChange, *MEMORY[0x24BEC2F58], 0);

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC2F58], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController dealloc](&v4, sel_dealloc);
}

- (CGRect)frameOfPresentedViewInContainerView
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
  double v16;
  double v17;
  CGRect result;

  -[WFCompactPlatterPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[WFCompactPlatterPresentationController presentedViewFrameInContainerViewOfSize:withSizeCalculation:](self, "presentedViewFrameInContainerViewOfSize:withSizeCalculation:", 1, v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)frameOfDismissedViewInContainerView
{
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  -[WFCompactPlatterPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  x = v9.origin.x;
  width = v9.size.width;
  height = v9.size.height;
  v5 = -CGRectGetHeight(v9);
  v6 = x;
  v7 = width;
  v8 = height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v5;
  result.origin.x = v6;
  return result;
}

- (void)presentationTransitionWillBegin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController presentationTransitionWillBegin](&v3, sel_presentationTransitionWillBegin);
  self->_transitionState = 1;
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController presentationTransitionDidEnd:](&v6, sel_presentationTransitionDidEnd_);
  v5 = 2;
  if (!v3)
    v5 = 0;
  self->_transitionState = v5;
}

- (void)dismissalTransitionWillBegin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController dismissalTransitionWillBegin](&v3, sel_dismissalTransitionWillBegin);
  self->_transitionState = 3;
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  v5 = 2;
  if (v3)
    v5 = 0;
  self->_transitionState = v5;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (BOOL)_containerIgnoresDirectTouchEvents
{
  return 1;
}

- (void)platterPresentationDidInvalidateSize:(id)a3
{
  id WeakRetained;

  if (self->_transitionState == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);

    if (!WeakRetained)
      -[WFCompactPlatterPresentationController updatePresentedViewFrameAnimatedAlongsideKeyboard:](self, "updatePresentedViewFrameAnimatedAlongsideKeyboard:", 0);
  }
}

- (void)updatePresentedViewFrameAnimatedAlongsideKeyboard:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  _QWORD aBlock[4];
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  -[WFCompactPlatterPresentationController presentedView](self, "presentedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "frame");
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  if (!CGRectEqualToRect(v27, v28))
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__WFCompactPlatterPresentationController_updatePresentedViewFrameAnimatedAlongsideKeyboard___block_invoke;
    aBlock[3] = &unk_24E6039E8;
    v22 = v5;
    v23 = v7;
    v24 = v9;
    v25 = v11;
    v26 = v13;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[WFCompactPlatterPresentationController presentedViewController](self, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[WFCompactPlatterPresentationController presentedViewController](self, "presentedViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "platterHeightAnimationsDisabled");

      if (v17)
      {
        v14[2](v14);
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

    }
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BEBDB00];
      objc_msgSend(v18, "animationDuration");
      objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v18, "animationCurve") << 16, v14, 0, v20, 0.0);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v14, 0, 1.0, 0.5, 0.0, 0.0, 0.0, 0.998);
    }
    goto LABEL_9;
  }
LABEL_10:

}

- (double)maximumExpectedHeightForPlatterPresentation:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[WFCompactPlatterPresentationController containerView](self, "containerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[WFCompactPlatterPresentationController presentedViewFrameInContainerViewOfSize:withSizeCalculation:](self, "presentedViewFrameInContainerViewOfSize:withSizeCalculation:", 0, v5, v6);
  v8 = v7;

  return v8;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  WFCompactPlatterPresentationController *v27;
  double v28;
  double v29;
  objc_super v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  memset(&v33, 0, sizeof(v33));
  if (v7)
    objc_msgSend(v7, "targetTransform");
  v32 = v33;
  if (!CGAffineTransformIsIdentity(&v32))
  {
    -[WFCompactPlatterPresentationController containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v32 = v33;
    v34.origin.x = v11;
    v34.origin.y = v13;
    v34.size.width = v15;
    v34.size.height = v17;
    v35 = CGRectApplyAffineTransform(v34, &v32);
    x = v35.origin.x;
    y = v35.origin.y;
    v20 = v35.size.width;
    v21 = v35.size.height;
    CGAffineTransformMakeTranslation(&v31, -v35.origin.x, -v35.origin.y);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = v20;
    v36.size.height = v21;
    v37 = CGRectApplyAffineTransform(v36, &v31);
    width = v37.size.width;
    height = v37.size.height;
  }
  objc_storeWeak((id *)&self->_activeTransitionCoordinator, v8);
  v30.receiver = self;
  v30.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v30, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
  -[WFCompactPlatterPresentationController presentedView](self, "presentedView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v25[3] = &unk_24E603800;
  v26 = v22;
  v27 = self;
  v28 = width;
  v29 = height;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v24[3] = &unk_24E603828;
  v24[4] = self;
  v23 = v22;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v25, v24);

}

- (void)keyboardWillChange
{
  id WeakRetained;

  if (self->_transitionState == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);

    if (!WeakRetained)
      -[WFCompactPlatterPresentationController updatePresentedViewFrameAnimatedAlongsideKeyboard:](self, "updatePresentedViewFrameAnimatedAlongsideKeyboard:", 1);
  }
}

- (CGRect)presentedViewFrameInContainerViewOfSize:(CGSize)a3 withSizeCalculation:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
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
  CGRect result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = (void *)objc_opt_class();
  -[WFCompactPlatterPresentationController containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterPresentationController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:", v9, v4, v10, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (int64_t)transitionState
{
  return self->_transitionState;
}

- (void)setTransitionState:(int64_t)a3
{
  self->_transitionState = a3;
}

- (UIViewControllerTransitionCoordinator)activeTransitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);
}

- (void)setActiveTransitionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_activeTransitionCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeTransitionCoordinator);
}

uint64_t __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "presentedViewFrameInContainerViewOfSize:withSizeCalculation:", 1, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 360), 0);
  objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "keyboardWillChange");
}

uint64_t __92__WFCompactPlatterPresentationController_updatePresentedViewFrameAnimatedAlongsideKeyboard___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

+ (CGRect)usableFrameForPresentingInContainerViewOfSize:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_peripheryInsets");
  v7 = v6;

  v8 = v7 + 8.0;
  v9 = height - (v7 + 8.0);
  v10 = 0.0;
  v11 = width;
  result.size.height = v9;
  result.size.width = v11;
  result.origin.y = v8;
  result.origin.x = v10;
  return result;
}

+ (CGSize)preferredSizeForPresentingInContainerViewOfSize:(CGSize)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;
  CGRect v12;

  objc_msgSend((id)objc_opt_class(), "usableFrameForPresentingInContainerViewOfSize:", a3.width, a3.height);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = fmin(CGRectGetWidth(v11) + -16.0, 425.0);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = fmin(CGRectGetHeight(v12) * 0.8, 425.0);
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (CGRect)presentedViewFrameInContainerView:(id)a3 containerViewSize:(CGSize)a4 withSizeCalculation:(BOOL)a5 ofPresentedPlatter:(id)a6
{
  _BOOL4 v7;
  double height;
  double width;
  id v10;
  id v11;
  CGFloat x;
  CGFloat y;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double MinX;
  double v20;
  CGFloat MinY;
  void *v22;
  int v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double MaxY;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat rect;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect result;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a6;
  objc_msgSend((id)objc_opt_class(), "usableFrameForPresentingInContainerViewOfSize:", width, height);
  x = v52.origin.x;
  y = v52.origin.y;
  v14 = v52.size.width;
  v15 = v52.size.height;
  v16 = fmin(CGRectGetWidth(v52) + -16.0, 425.0);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = v14;
  v53.size.height = v15;
  v17 = CGRectGetHeight(v53) * 0.8;
  v18 = v17;
  if (v7)
    objc_msgSend(v11, "platterHeightForWidth:withMaximumHeight:", v16, v17);
  if (v17 >= v18)
    v17 = v18;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = v14;
  v54.size.height = v15;
  MinX = CGRectGetMinX(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = v14;
  v55.size.height = v15;
  v20 = MinX + (CGRectGetWidth(v55) - v16) * 0.5;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = v14;
  v56.size.height = v15;
  MinY = CGRectGetMinY(v56);
  objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isVisible");

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "keyboardFrameInView:", v10);
    v27 = v26;
    v29 = v28;
    rect = v30;
    v32 = v31;

    v33 = v32 + 10.0;
    v34 = 0.0;
    if (height - v33 - v17 < 0.0)
    {
      v35 = v27 + 0.0;
      v36 = v29 + -10.0;
      v57.origin.x = v20;
      v57.origin.y = MinY;
      v57.size.width = v16;
      v57.size.height = v17;
      MaxY = CGRectGetMaxY(v57);
      v58.origin.x = v35;
      v58.origin.y = v36;
      v58.size.width = rect;
      v58.size.height = v33;
      v34 = MaxY - CGRectGetMinY(v58);
    }
    v24 = v17 - v34;
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", v24);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "scale");
  UIRectIntegralWithScale();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v47 = v40;
  v48 = v42;
  v49 = v44;
  v50 = v46;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

@end
