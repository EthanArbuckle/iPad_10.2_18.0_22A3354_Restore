@implementation VideosExtrasZoomingImageTransitionController

- (VideosExtrasZoomingImageTransitionController)initWithItemIndex:(unint64_t)a3 forInteractiveTransition:(BOOL)a4
{
  _BOOL8 v4;
  VideosExtrasZoomingImageTransitionController *v6;
  VideosExtrasZoomingImageTransitionController *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasZoomingImageTransitionController;
  v6 = -[UIPercentDrivenInteractiveTransition init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[VideosExtrasZoomingImageTransitionController setItemIndex:](v6, "setItemIndex:", a3);
    -[VideosExtrasZoomingImageTransitionController setInteractive:](v7, "setInteractive:", v4);
  }
  return v7;
}

- (double)transitionDuration:(id)a3
{
  _BOOL4 v3;
  double result;

  v3 = -[VideosExtrasZoomingImageTransitionController shouldUseSpringAnimation](self, "shouldUseSpringAnimation", a3);
  result = 0.2;
  if (v3)
    return 0.4;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  VideosExtrasBorderedImageView *v10;
  _BOOL8 v11;
  VideosExtrasZoomingImageTransitionContext *v12;
  VideosExtrasZoomingImageTransitionContext *v13;
  uint64_t v14;
  VideosExtrasBorderedImageView *v15;
  id v16;
  VideosExtrasZoomingImageTransitionContext *v17;
  id v18;
  VideosExtrasZoomingImageTransitionContext *v19;
  void *v20;
  id v21;
  id v22;
  VideosExtrasZoomingImageTransitionContext *v23;
  id v24;
  VideosExtrasZoomingImageTransitionContext *v25;
  VideosExtrasBorderedImageView *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  VideosExtrasZoomingImageTransitionContext *v35;
  id v36;
  VideosExtrasZoomingImageTransitionContext *v37;
  VideosExtrasBorderedImageView *v38;
  _QWORD aBlock[4];
  VideosExtrasBorderedImageView *v40;
  id v41;
  VideosExtrasZoomingImageTransitionContext *v42;
  id v43;
  VideosExtrasZoomingImageTransitionContext *v44;
  BOOL v45;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v5, "addSubview:", v7);
  v30 = v7;
  objc_msgSend(v7, "layoutIfNeeded");
  v8 = -[VideosExtrasZoomingImageTransitionController itemIndex](self, "itemIndex");
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(VideosExtrasBorderedImageView);
  v31 = v5;
  objc_msgSend(v5, "addSubview:", v10);
  -[VideosExtrasZoomingImageTransitionController setZoomingImageView:](self, "setZoomingImageView:", v10);
  v11 = -[VideosExtrasZoomingImageTransitionController isInteractive](self, "isInteractive");
  v12 = -[VideosExtrasZoomingImageTransitionContext initWithZoomingImageView:itemIndex:appearState:isInteractive:]([VideosExtrasZoomingImageTransitionContext alloc], "initWithZoomingImageView:itemIndex:appearState:isInteractive:", v10, v8, 1, v11);
  v13 = -[VideosExtrasZoomingImageTransitionContext initWithZoomingImageView:itemIndex:appearState:isInteractive:]([VideosExtrasZoomingImageTransitionContext alloc], "initWithZoomingImageView:itemIndex:appearState:isInteractive:", v10, v8, 0, v11);
  -[VideosExtrasBorderedImageView setShouldSkipImageWhenReplicatingState:](v10, "setShouldSkipImageWhenReplicatingState:", 0);
  -[VideosExtrasBorderedImageView setShouldUseTransformWhenReplicatingState:](v10, "setShouldUseTransformWhenReplicatingState:", 0);
  objc_msgSend(v9, "prepareZoomingImageTransitionWithContext:", v12);
  objc_msgSend(v6, "prepareZoomingImageTransitionWithContext:", v13);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E9F9B978;
  v15 = v10;
  v40 = v15;
  v45 = v11;
  v16 = v9;
  v41 = v16;
  v17 = v12;
  v42 = v17;
  v18 = v6;
  v43 = v18;
  v19 = v13;
  v44 = v19;
  v20 = _Block_copy(aBlock);
  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke_2;
  v32[3] = &unk_1E9F9B9A0;
  v21 = v4;
  v33 = v21;
  v22 = v16;
  v34 = v22;
  v23 = v17;
  v35 = v23;
  v24 = v18;
  v36 = v24;
  v25 = v19;
  v37 = v25;
  v26 = v15;
  v38 = v26;
  v27 = _Block_copy(v32);
  -[VideosExtrasZoomingImageTransitionController transitionDuration:](self, "transitionDuration:", v21);
  v29 = v28;
  if (-[VideosExtrasZoomingImageTransitionController shouldUseSpringAnimation](self, "shouldUseSpringAnimation"))
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v20, v27, v29, 0.0, 0.6, 0.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v20, v27, v29, 0.0);

}

uint64_t __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setShouldSkipImageWhenReplicatingState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setShouldUseTransformWhenReplicatingState:", 1);
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "setShouldDeferSettingTransform:", 1);
  objc_msgSend(*(id *)(a1 + 40), "performZoomingImageTransitionWithContext:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "performZoomingImageTransitionWithContext:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setShouldSkipImageWhenReplicatingState:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "setShouldUseTransformWhenReplicatingState:", 0);
  if (*(_BYTE *)(a1 + 72))
    return objc_msgSend(*(id *)(a1 + 32), "setShouldDeferSettingTransform:", 0);
  return result;
}

uint64_t __66__VideosExtrasZoomingImageTransitionController_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1;
  objc_msgSend(*(id *)(a1 + 40), "finalizeZoomingImageTransitionWithContext:transitionFinished:", *(_QWORD *)(a1 + 48), v2);
  objc_msgSend(*(id *)(a1 + 56), "finalizeZoomingImageTransitionWithContext:transitionFinished:", *(_QWORD *)(a1 + 64), v2);
  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v2);
}

- (void)prepareInteractiveTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  -[VideosExtrasZoomingImageTransitionController setInitialPinchCenter:](self, "setInitialPinchCenter:");

  objc_msgSend(v4, "scale");
  v8 = v7;

  v9 = 1.0;
  if (v8 > 0.00000011920929)
    v9 = v8;
  -[VideosExtrasZoomingImageTransitionController setInitialPinchScale:](self, "setInitialPinchScale:", v9);
}

- (void)updateInteractiveTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
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
  void *v19;
  double v20;
  CGAffineTransform v21;
  CGAffineTransform t1;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v4 = a3;
  objc_msgSend(v4, "scale");
  v6 = v5;
  -[VideosExtrasZoomingImageTransitionController initialPinchScale](self, "initialPinchScale");
  v8 = v6 / v7;
  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  -[VideosExtrasZoomingImageTransitionController initialPinchCenter](self, "initialPinchCenter");
  v16 = v15;
  v18 = v17;
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeScale(&v25, v8, v8);
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, v12 - v16, v14 - v18);
  t1 = v25;
  memset(&v23, 0, sizeof(v23));
  v21 = v24;
  CGAffineTransformConcat(&v23, &t1, &v21);
  -[VideosExtrasZoomingImageTransitionController zoomingImageView](self, "zoomingImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  t1 = v23;
  objc_msgSend(v19, "setTransform:", &t1);

  -[VideosExtrasZoomingImageTransitionController _destinationScale](self, "_destinationScale");
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  if (v20 < 0.01)
    v20 = 0.01;
  -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](self, "updateInteractiveTransition:", fmin(v20, 0.99));
}

- (void)completeInteractiveTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  __int128 *v21;
  __int128 *v22;
  __int128 v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  int v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "velocity");
  v7 = v6;

  if (v5 == 4)
  {
    -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
    v9 = v8;
LABEL_4:
    v13 = 1;
    goto LABEL_6;
  }
  -[VideosExtrasZoomingImageTransitionController _destinationScale](self, "_destinationScale");
  v11 = v7 * (v10 + -1.0);
  -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
  v9 = v12;
  if (v11 < 0.0)
    goto LABEL_4;
  v13 = 0;
  v9 = 1.0 - v12;
LABEL_6:
  -[UIPercentDrivenInteractiveTransition duration](self, "duration");
  v15 = v9 * v14;
  -[VideosExtrasZoomingImageTransitionController zoomingImageView](self, "zoomingImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "speed");
  v20 = v19;
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  if (v16)
    objc_msgSend(v16, "deferredTransform");
  v21 = (__int128 *)MEMORY[0x1E0C9BAA8];
  v22 = &v44;
  if (v13)
    v22 = (__int128 *)MEMORY[0x1E0C9BAA8];
  v23 = v22[1];
  v41 = *v22;
  v42 = v23;
  v39 = v45;
  v40 = v46;
  v43 = v22[2];
  v37[0] = v41;
  v37[1] = v23;
  v37[2] = v43;
  v38 = v44;
  -[VideosExtrasZoomingImageTransitionController _desiredSpeedForNonInteractiveAnimationWithDuration:deferredTransform:finalTransform:](self, "_desiredSpeedForNonInteractiveAnimationWithDuration:deferredTransform:finalTransform:", &v38, v37, v15);
  objc_msgSend(v18, "setSpeed:");
  v24 = (void *)MEMORY[0x1E0DC3F10];
  v25 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke;
  v32[3] = &unk_1E9F9B9C8;
  v26 = v16;
  v34 = v41;
  v35 = v42;
  v33 = v26;
  v36 = v43;
  v29[0] = v25;
  v29[1] = 3221225472;
  v29[2] = __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke_2;
  v29[3] = &unk_1E9F9B9F0;
  v30 = v18;
  v31 = v20;
  v27 = v18;
  objc_msgSend(v24, "animateWithDuration:delay:options:animations:completion:", 0, v32, v29, v15, 0.0);
  v28 = v21[1];
  v38 = *v21;
  v39 = v28;
  v40 = v21[2];
  objc_msgSend(v26, "setDeferredTransform:", &v38);
  if (v13)
    -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](self, "cancelInteractiveTransition");
  else
    -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](self, "finishInteractiveTransition");

}

uint64_t __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __104__VideosExtrasZoomingImageTransitionController_completeInteractiveTransitionWithPinchGestureRecognizer___block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setSpeed:", a2);
}

- (float)_desiredSpeedForNonInteractiveAnimationWithDuration:(double)a3 deferredTransform:(CGAffineTransform *)a4 finalTransform:(CGAffineTransform *)a5
{
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat v16;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[3];
  _QWORD v31[9];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v31[8] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasZoomingImageTransitionController zoomingImageView](self, "zoomingImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  *(CGFloat *)v31 = MinX;
  v31[1] = CGRectGetMinY(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  *(CGFloat *)&v31[2] = MaxX;
  v31[3] = CGRectGetMinY(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v16 = CGRectGetMaxX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  *(CGFloat *)&v31[4] = v16;
  v31[5] = CGRectGetMaxY(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v17 = CGRectGetMinX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  *(CGFloat *)&v31[6] = v17;
  v31[7] = CGRectGetMaxY(v39);
  if (v9)
    objc_msgSend(v9, "transform");
  else
    memset(v30, 0, sizeof(v30));
  v18 = *(_OWORD *)&a5->c;
  v27 = *(_OWORD *)&a5->a;
  v28 = v18;
  v29 = *(_OWORD *)&a5->tx;
  -[VideosExtrasZoomingImageTransitionController _maximumDistanceTravelledForPoints:count:currentTransform:finalTransform:](self, "_maximumDistanceTravelledForPoints:count:currentTransform:finalTransform:", v31, 4, v30, &v27);
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v27 = *MEMORY[0x1E0C9BAA8];
  v28 = v19;
  v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v20 = *(_OWORD *)&a4->c;
  v26[0] = *(_OWORD *)&a4->a;
  v26[1] = v20;
  v26[2] = *(_OWORD *)&a4->tx;
  -[VideosExtrasZoomingImageTransitionController _maximumDistanceTravelledForPoints:count:currentTransform:finalTransform:](self, "_maximumDistanceTravelledForPoints:count:currentTransform:finalTransform:", v31, 4, &v27, v26);
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  v22 = v21;
  -[UIPercentDrivenInteractiveTransition duration](self, "duration");
  v24 = v23;

  return a3 / (v24 * fmin(v22, 1.0));
}

- (double)_destinationScale
{
  void *v2;
  void *v3;
  double v4;

  -[VideosExtrasZoomingImageTransitionController zoomingImageView](self, "zoomingImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "deferredTransform");
    v4 = (0.0 + 0.0) * 0.5;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (double)_maximumDistanceTravelledForPoints:(CGPoint *)a3 count:(unint64_t)a4 currentTransform:(CGAffineTransform *)a5 finalTransform:(CGAffineTransform *)a6
{
  CGFloat *p_y;
  double result;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;

  if (!a4)
    return 2.22507386e-308;
  p_y = &a3->y;
  result = 2.22507386e-308;
  do
  {
    v8 = *(p_y - 1);
    v9 = a6->tx + *p_y * a6->c + a6->a * v8 - (a5->tx + *p_y * a5->c + a5->a * v8);
    v10 = a6->ty + *p_y * a6->d + a6->b * v8 - (a5->ty + *p_y * a5->d + a5->b * v8);
    v11 = sqrt(v10 * v10 + v9 * v9);
    if (result < v11)
      result = v11;
    p_y += 2;
    --a4;
  }
  while (a4);
  return result;
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)shouldUseSpringAnimation
{
  return self->_shouldUseSpringAnimation;
}

- (void)setShouldUseSpringAnimation:(BOOL)a3
{
  self->_shouldUseSpringAnimation = a3;
}

- (CGPoint)initialPinchCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialPinchCenter.x;
  y = self->_initialPinchCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialPinchCenter:(CGPoint)a3
{
  self->_initialPinchCenter = a3;
}

- (double)initialPinchScale
{
  return self->_initialPinchScale;
}

- (void)setInitialPinchScale:(double)a3
{
  self->_initialPinchScale = a3;
}

- (VideosExtrasBorderedImageView)zoomingImageView
{
  return self->_zoomingImageView;
}

- (void)setZoomingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_zoomingImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingImageView, 0);
}

@end
