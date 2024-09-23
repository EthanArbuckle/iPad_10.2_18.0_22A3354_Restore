@implementation SiriSharedUIExpandablePlatterPanGestureRecognizer

- (SiriSharedUIExpandablePlatterPanGestureRecognizer)initWithExpansionDelegate:(id)a3
{
  id v4;
  SiriSharedUIExpandablePlatterPanGestureRecognizer *v5;
  SiriSharedUIExpandablePlatterPanGestureRecognizer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUIExpandablePlatterPanGestureRecognizer;
  v5 = -[SiriSharedUIExpandablePlatterPanGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, self, sel_panGestureRecognizerDidPan_);
  v6 = v5;
  if (v5)
  {
    -[SiriSharedUIExpandablePlatterPanGestureRecognizer setDelegate:](v5, "setDelegate:", v5);
    objc_storeWeak((id *)&v6->_expansionDelegate, v4);
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  return v5 & isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (void)panGestureRecognizerDidPan:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Height;
  double scrollViewContentHeight;
  uint64_t v25;
  double v26;
  BOOL v27;
  double collapsedHeight;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v41 = a3;
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "translationInView:", v4);
  v6 = v5;

  -[SiriSharedUIExpandablePlatterPanGestureRecognizer view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = objc_msgSend(v41, "state");
  -[SiriSharedUIExpandablePlatterPanGestureRecognizer view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "velocityInView:", v17);
  v19 = v18;
  v21 = v20;

  if (v16 == 3)
  {
    -[SiriSharedUIExpandablePlatterPanGestureRecognizer projectedTranslationWithVelocity:decelerationRate:](self, "projectedTranslationWithVelocity:decelerationRate:", v21, SiriSharedUIScrollViewDecelerationRateNormal());
    v6 = v6 + v22;
  }
  v39 = v9;
  v42.origin.x = v9;
  v42.origin.y = v11;
  v42.size.width = v13;
  v42.size.height = v15;
  Height = CGRectGetHeight(v42);
  if (self->_allowExpandedState)
  {
    if (self->_expandedHeight >= self->_scrollViewContentHeight)
      scrollViewContentHeight = self->_scrollViewContentHeight;
    else
      scrollViewContentHeight = self->_expandedHeight;
    v25 = 3;
  }
  else
  {
    scrollViewContentHeight = self->_initialHeight;
    v25 = 1;
  }
  if (objc_msgSend(v41, "state", *(_QWORD *)&v39) == 1)
  {
    if (fabs(v19) > fabs(v21))
    {
      -[SiriSharedUIExpandablePlatterPanGestureRecognizer setState:](self, "setState:", 4);
      goto LABEL_33;
    }
    -[SiriSharedUIExpandablePlatterPanGestureRecognizer expansionDelegate](self, "expansionDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "expandablePlatterGestureDidBeginWithRecognizer:", self);
  }
  else
  {
    if (objc_msgSend(v41, "state") != 2)
      goto LABEL_21;
    v26 = Height - v6;
    v27 = Height - v6 <= scrollViewContentHeight;
    collapsedHeight = scrollViewContentHeight;
    if (v27)
    {
      if (v26 < self->_collapsedHeight)
        collapsedHeight = self->_collapsedHeight;
      else
        collapsedHeight = v26;
    }
    -[SiriSharedUIExpandablePlatterPanGestureRecognizer view](self, "view", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTranslation:inView:", v29, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    -[SiriSharedUIExpandablePlatterPanGestureRecognizer expansionDelegate](self, "expansionDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "expandablePlatterGesture:trackingGestureDidUpdateHeight:", self, collapsedHeight);
  }

LABEL_21:
  v31 = objc_msgSend(v41, "state") == 3;
  v32 = v41;
  if (v31)
  {
    v43.origin.x = v40;
    v43.origin.y = v11;
    v43.size.width = v13;
    v43.size.height = v15;
    v33 = CGRectGetHeight(v43);
    if (v21 < 0.0 || v33 / scrollViewContentHeight >= 0.5 && v21 == 0.0)
    {
      v44.origin.x = v40;
      v44.origin.y = v11;
      v44.size.width = v13;
      v44.size.height = v15;
      v34 = CGRectGetHeight(v44);
      v35 = self->_collapsedHeight;
      if (v34 > v35)
        goto LABEL_30;
    }
    else
    {
      v35 = self->_collapsedHeight;
    }
    v25 = 2;
    scrollViewContentHeight = v35;
LABEL_30:
    -[SiriSharedUIExpandablePlatterPanGestureRecognizer expansionDelegate](self, "expansionDelegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "expandablePlatterGesture:didCompleteTransitionToStyle:phaseHeight:", self, v25, scrollViewContentHeight);

    -[SiriSharedUIExpandablePlatterPanGestureRecognizer expansionDelegate](self, "expansionDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "expandablePlatterGestureDidEndWithRecognizer:", self);

    v32 = v41;
  }
  if (objc_msgSend(v32, "state") == 4)
  {
    -[SiriSharedUIExpandablePlatterPanGestureRecognizer expansionDelegate](self, "expansionDelegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "expandablePlatterGestureDidEndWithRecognizer:", self);

  }
LABEL_33:

}

- (double)projectedTranslationWithVelocity:(double)a3 decelerationRate:(double)a4
{
  return a3 / 5000.0 * a4 / (1.0 - a4);
}

- (double)collapsedHeight
{
  return self->_collapsedHeight;
}

- (void)setCollapsedHeight:(double)a3
{
  self->_collapsedHeight = a3;
}

- (double)initialHeight
{
  return self->_initialHeight;
}

- (void)setInitialHeight:(double)a3
{
  self->_initialHeight = a3;
}

- (double)scrollViewContentHeight
{
  return self->_scrollViewContentHeight;
}

- (void)setScrollViewContentHeight:(double)a3
{
  self->_scrollViewContentHeight = a3;
}

- (double)expandedHeight
{
  return self->_expandedHeight;
}

- (void)setExpandedHeight:(double)a3
{
  self->_expandedHeight = a3;
}

- (BOOL)allowExpandedState
{
  return self->_allowExpandedState;
}

- (void)setAllowExpandedState:(BOOL)a3
{
  self->_allowExpandedState = a3;
}

- (SiriSharedUIExpandablePlatterPanGestureRecognizerDelegate)expansionDelegate
{
  return (SiriSharedUIExpandablePlatterPanGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_expansionDelegate);
}

- (void)setExpansionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_expansionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expansionDelegate);
}

@end
