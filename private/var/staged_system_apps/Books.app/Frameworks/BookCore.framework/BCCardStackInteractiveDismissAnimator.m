@implementation BCCardStackInteractiveDismissAnimator

- (BCCardStackInteractiveDismissAnimator)init
{
  BCCardStackInteractiveDismissAnimator *v2;
  BCCardStackInteractiveDismissAnimator *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *txForCardIndex;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCCardStackInteractiveDismissAnimator;
  v2 = -[BCCardStackInteractiveDismissAnimator init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_distanceToCoverSource = NAN;
    v2->_dismissState = 0;
    v2->_finalAnimationType = 2;
    v4 = objc_opt_new(NSMutableDictionary);
    txForCardIndex = v3->_txForCardIndex;
    v3->_txForCardIndex = v4;

  }
  return v3;
}

- (id)_bounceBackSpringWithVelocity:(double)a3
{
  return objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 200.0, 28.0, a3, 0.0);
}

- (double)_minBackgroundViewAlpha
{
  void *v2;
  void *v3;
  unsigned int v4;
  double result;
  double v6;

  v6 = 0.0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator backgroundView](self, "backgroundView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColor"));
  v4 = objc_msgSend(v3, "getWhite:alpha:", 0, &v6);

  if (!v4)
    return 0.15;
  result = 0.15 / v6;
  if (fabs(v6) < 2.22044605e-16)
    return 0.15;
  return result;
}

- (void)setupAnimatorsForCancellation:(BOOL)a3 velocity:(double)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  BOOL v25;
  _QWORD v26[5];
  BOOL v27;
  _QWORD v28[5];
  id v29;
  BOOL v30;
  _OWORD v31[3];
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[2];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator txForCardIndex](self, "txForCardIndex"));
  v8 = objc_alloc((Class)UIViewPropertyAnimator);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator _bounceBackSpringWithVelocity:](self, "_bounceBackSpringWithVelocity:", a4));
  v10 = objc_msgSend(v8, "initWithDuration:timingParameters:", v9, 0.0);

  if (!a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator displayedCardViewControllers](self, "displayedCardViewControllers"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_37018;
    v32[3] = &unk_28CFC8;
    v33 = v7;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v32);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator titleLabel](self, "titleLabel"));
    v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v31[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v31[1] = v13;
    v31[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v12, "setTransform:", v31);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator backgroundView](self, "backgroundView"));
    objc_msgSend(v14, "setAlpha:", 1.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator titleLabel](self, "titleLabel"));
    objc_msgSend(v15, "setAlpha:", 1.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator leftArrowButton](self, "leftArrowButton"));
    objc_msgSend(v16, "setAlpha:", 1.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator rightArrowButton](self, "rightArrowButton"));
    objc_msgSend(v17, "setAlpha:", 1.0);

  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_37110;
  v28[3] = &unk_28BDD0;
  v30 = a3;
  v28[4] = self;
  v18 = v7;
  v29 = v18;
  objc_msgSend(v10, "addAnimations:", v28);
  if (-[BCCardStackInteractiveDismissAnimator shouldRetainBackgroundAndTitleState](self, "shouldRetainBackgroundAndTitleState"))
  {
    goto LABEL_6;
  }
  objc_msgSend(v10, "duration");
  v20 = v19;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_37288;
  v26[3] = &unk_28D018;
  v26[4] = self;
  v27 = a3;
  objc_msgSend(v10, "addAnimations:", v26);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_374F4;
  v24[3] = &unk_28D040;
  v25 = a3;
  v24[4] = self;
  *(double *)&v24[5] = v20;
  v21 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:curve:animations:", 3, v24, v20);
  if (!v21)
  {
LABEL_6:
    v34 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    -[BCViewPropertyAnimatorGroup setAnimators:](self, "setAnimators:", v22);
  }
  else
  {
    v22 = v21;
    v35[0] = v10;
    v35[1] = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
    -[BCViewPropertyAnimatorGroup setAnimators:](self, "setAnimators:", v23);

  }
}

- (void)setupForInteractiveDismiss
{
  -[BCCardStackInteractiveDismissAnimator setDismissState:](self, "setDismissState:", 1);
  -[BCCardStackInteractiveDismissAnimator setupAnimatorsForCancellation:velocity:](self, "setupAnimatorsForCancellation:velocity:", 0, 0.0);
  -[BCViewPropertyAnimatorGroup pauseAnimation](self, "pauseAnimation");
}

- (void)updateDismissFractionCompleteWithCardOffset:(double)a3
{
  double v5;

  -[BCCardStackInteractiveDismissAnimator maxSlideDistance](self, "maxSlideDistance");
  -[BCViewPropertyAnimatorGroup setFractionComplete:](self, "setFractionComplete:", a3 / v5);
}

- (void)animateDismissCancellationWithVelocity:(double)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  -[BCCardStackInteractiveDismissAnimator setDismissState:](self, "setDismissState:", 2);
  -[BCViewPropertyAnimatorGroup stopAnimation:](self, "stopAnimation:", 1);
  -[BCCardStackInteractiveDismissAnimator setupAnimatorsForCancellation:velocity:](self, "setupAnimatorsForCancellation:velocity:", 1, a3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_37908;
  v8[3] = &unk_28D068;
  v9 = v6;
  v7 = v6;
  -[BCViewPropertyAnimatorGroup addCompletion:](self, "addCompletion:", v8);
  -[BCViewPropertyAnimatorGroup startAnimation](self, "startAnimation");

}

- (double)pauseDismissCancellationAndReset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v12;

  -[BCCardStackInteractiveDismissAnimator setDismissState:](self, "setDismissState:", 1);
  -[BCViewPropertyAnimatorGroup stopAnimation:](self, "stopAnimation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackInteractiveDismissAnimator displayedCardViewControllers](self, "displayedCardViewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BCCardStackInteractiveDismissAnimator focusedIndex](self, "focusedIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "transform");
    v8 = v12;
  }
  else
  {
    v8 = 0.0;
  }

  -[BCCardStackInteractiveDismissAnimator maxSlideDistance](self, "maxSlideDistance");
  v10 = v8 / v9;
  -[BCCardStackInteractiveDismissAnimator setupAnimatorsForCancellation:velocity:](self, "setupAnimatorsForCancellation:velocity:", 0, 0.0);
  -[BCViewPropertyAnimatorGroup pauseAnimation](self, "pauseAnimation");
  -[BCViewPropertyAnimatorGroup setFractionComplete:](self, "setFractionComplete:", v10);
  return v8;
}

- (NSDictionary)displayedCardViewControllers
{
  return self->_displayedCardViewControllers;
}

- (void)setDisplayedCardViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)focusedIndex
{
  return self->_focusedIndex;
}

- (void)setFocusedIndex:(int64_t)a3
{
  self->_focusedIndex = a3;
}

- (double)maxSlideDistance
{
  return self->_maxSlideDistance;
}

- (void)setMaxSlideDistance:(double)a3
{
  self->_maxSlideDistance = a3;
}

- (double)maxTitleSlideDistance
{
  return self->_maxTitleSlideDistance;
}

- (void)setMaxTitleSlideDistance:(double)a3
{
  self->_maxTitleSlideDistance = a3;
}

- (UIView)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)leftArrowButton
{
  return self->_leftArrowButton;
}

- (void)setLeftArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftArrowButton, a3);
}

- (UIView)rightArrowButton
{
  return self->_rightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightArrowButton, a3);
}

- (BOOL)shouldRetainBackgroundAndTitleState
{
  return self->_shouldRetainBackgroundAndTitleState;
}

- (void)setShouldRetainBackgroundAndTitleState:(BOOL)a3
{
  self->_shouldRetainBackgroundAndTitleState = a3;
}

- (double)distanceToCoverSource
{
  return self->_distanceToCoverSource;
}

- (void)setDistanceToCoverSource:(double)a3
{
  self->_distanceToCoverSource = a3;
}

- (int64_t)finalAnimationType
{
  return self->_finalAnimationType;
}

- (void)setFinalAnimationType:(int64_t)a3
{
  self->_finalAnimationType = a3;
}

- (unint64_t)dismissState
{
  return self->_dismissState;
}

- (void)setDismissState:(unint64_t)a3
{
  self->_dismissState = a3;
}

- (NSMutableDictionary)txForCardIndex
{
  return self->_txForCardIndex;
}

- (void)setTxForCardIndex:(id)a3
{
  objc_storeStrong((id *)&self->_txForCardIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txForCardIndex, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_displayedCardViewControllers, 0);
}

@end
