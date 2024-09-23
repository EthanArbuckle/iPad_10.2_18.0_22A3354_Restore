@implementation BKCrossFadeZoomTransition

+ (id)transition
{
  return objc_alloc_init((Class)a1);
}

- (BKCrossFadeZoomTransition)init
{
  BKCrossFadeZoomTransition *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKCrossFadeZoomTransition;
  result = -[BKCrossFadeZoomTransition init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->_zoomControlPoint1.y = xmmword_10070CB70;
    result->_zoomControlPoint2.y = 1.0;
    *(_OWORD *)&result->_fadeDuration = xmmword_10070CB80;
    *(_OWORD *)&result->_zoomFactor = xmmword_10070CB90;
    *(_OWORD *)&result->_fadeControlPoint1.y = xmmword_10070CBA0;
    *(_OWORD *)&result->_fadeControlPoint2.y = xmmword_10070CBB0;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  double v4;
  double v5;
  double result;

  -[BKCrossFadeZoomTransition zoomDuration](self, "zoomDuration", a3);
  v5 = v4;
  -[BKCrossFadeZoomTransition fadeDuration](self, "fadeDuration");
  if (v5 >= result)
    return v5;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
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
  id v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  BKCrossFadeZoomTransition *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  _OWORD v54[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "view"));
  objc_msgSend(v5, "insertSubview:belowSubview:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);

  objc_msgSend(v6, "frame");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v6, "alpha");
  v10 = v9;
  v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v54[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v54[1] = v11;
  v54[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v6, "setTransform:", v54);
  v12 = objc_alloc_init((Class)BCViewPropertyAnimatorCounter);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10018CB04;
  v49[3] = &unk_1008EB4A8;
  v50 = v5;
  v13 = v6;
  v53 = v10;
  v51 = v13;
  v52 = v4;
  v14 = v4;
  v15 = v5;
  objc_msgSend(v12, "setAnimationDidEnd:", v49);
  v16 = objc_alloc((Class)UIViewPropertyAnimator);
  -[BKCrossFadeZoomTransition zoomDuration](self, "zoomDuration");
  v18 = v17;
  -[BKCrossFadeZoomTransition zoomControlPoint1](self, "zoomControlPoint1");
  v20 = v19;
  v22 = v21;
  -[BKCrossFadeZoomTransition zoomControlPoint2](self, "zoomControlPoint2");
  v24 = v23;
  v26 = v25;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10018CB88;
  v46[3] = &unk_1008E7338;
  v27 = v13;
  v47 = v27;
  v48 = self;
  v28 = objc_msgSend(v16, "initWithDuration:controlPoint1:controlPoint2:animations:", v46, v18, v20, v22, v24, v26);
  objc_msgSend(v12, "animate:", v28);
  v29 = objc_alloc((Class)UIViewPropertyAnimator);
  -[BKCrossFadeZoomTransition fadeDuration](self, "fadeDuration");
  v31 = v30;
  -[BKCrossFadeZoomTransition fadeControlPoint1](self, "fadeControlPoint1");
  v33 = v32;
  v35 = v34;
  -[BKCrossFadeZoomTransition fadeControlPoint2](self, "fadeControlPoint2");
  v37 = v36;
  v39 = v38;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10018CBF4;
  v44[3] = &unk_1008E72C0;
  v45 = v27;
  v40 = v27;
  v41 = objc_msgSend(v29, "initWithDuration:controlPoint1:controlPoint2:animations:", v44, v31, v33, v35, v37, v39);
  objc_msgSend(v12, "animate:", v41);

}

- (double)fadeDuration
{
  return self->_fadeDuration;
}

- (void)setFadeDuration:(double)a3
{
  self->_fadeDuration = a3;
}

- (double)zoomDuration
{
  return self->_zoomDuration;
}

- (void)setZoomDuration:(double)a3
{
  self->_zoomDuration = a3;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (CGPoint)fadeControlPoint1
{
  double x;
  double y;
  CGPoint result;

  x = self->_fadeControlPoint1.x;
  y = self->_fadeControlPoint1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFadeControlPoint1:(CGPoint)a3
{
  self->_fadeControlPoint1 = a3;
}

- (CGPoint)fadeControlPoint2
{
  double x;
  double y;
  CGPoint result;

  x = self->_fadeControlPoint2.x;
  y = self->_fadeControlPoint2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFadeControlPoint2:(CGPoint)a3
{
  self->_fadeControlPoint2 = a3;
}

- (CGPoint)zoomControlPoint1
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomControlPoint1.x;
  y = self->_zoomControlPoint1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setZoomControlPoint1:(CGPoint)a3
{
  self->_zoomControlPoint1 = a3;
}

- (CGPoint)zoomControlPoint2
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomControlPoint2.x;
  y = self->_zoomControlPoint2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setZoomControlPoint2:(CGPoint)a3
{
  self->_zoomControlPoint2 = a3;
}

@end
