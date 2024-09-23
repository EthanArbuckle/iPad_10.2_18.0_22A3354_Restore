@implementation CRLPulseAnimationController

- (CRLPulseAnimationController)initWithDelegate:(id)a3
{
  id v5;
  CRLPulseAnimationController *v6;
  CRLPulseAnimationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLPulseAnimationController;
  v6 = -[CRLPulseAnimationController init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_duration = 0.1;
    v7->_pulseOffset = 6.0;
  }

  return v7;
}

- (void)reset
{
  CRLPulseAnimationControllerProtocol *delegate;
  objc_super v4;

  delegate = self->_delegate;
  self->_delegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLPulseAnimationController;
  -[CRLHighlightController reset](&v4, "reset");
}

- (void)disconnect
{
  CRLPulseAnimationControllerProtocol *delegate;

  delegate = self->_delegate;
  self->_delegate = 0;

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (self->_pulsating)
  {
    v7 = v5;
    self->_pulsating = 0;
    if (self->_autohide)
    {
      -[CRLHighlightController hide](self, "hide");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHighlightController layer](self, "layer"));
      objc_msgSend(v6, "removeAllAnimations");

      -[CRLHighlightController setImage:](self, "setImage:", 0);
    }
    -[CRLPulseAnimationControllerProtocol pulseAnimationDidStopForPulse:](self->_delegate, "pulseAnimationDidStopForPulse:", self);
    v5 = v7;
  }

}

- (void)stop
{
  _BOOL4 pulsating;
  void *v4;

  pulsating = self->_pulsating;
  self->_pulsating = 0;
  -[CRLHighlightController hide](self, "hide");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHighlightController layer](self, "layer"));
  objc_msgSend(v4, "removeAllAnimations");

  -[CRLHighlightController setImage:](self, "setImage:", 0);
  if (pulsating)
    -[CRLPulseAnimationControllerProtocol pulseAnimationDidStopForPulse:](self->_delegate, "pulseAnimationDidStopForPulse:", self);
}

- (BOOL)drawRoundedRect
{
  return 1;
}

- (unint64_t)pulseAnimationStyle
{
  if ((objc_opt_respondsToSelector(self->_delegate, "pulseAnimationStyle:") & 1) != 0)
    return (unint64_t)-[CRLPulseAnimationControllerProtocol pulseAnimationStyle:](self->_delegate, "pulseAnimationStyle:", self);
  else
    return 0;
}

- (void)startAnimatingStandardPulse
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  float v8;
  float v9;
  double pulseOffset;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CATransform3D v36;
  CATransform3D v37;
  CATransform3D v38;
  _QWORD v39[2];
  _QWORD v40[3];
  CGRect v41;
  CGRect v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHighlightController layer](self, "layer"));
  objc_msgSend(v3, "removeAllAnimations");

  if (-[CRLHighlightController path](self, "path"))
  {
    -[CRLHighlightController rectToAnimate](self, "rectToAnimate");
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    v8 = CGRectGetWidth(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v9 = CGRectGetHeight(v42);
    pulseOffset = self->_pulseOffset;
    v11 = pulseOffset + v8;
    v12 = (pulseOffset + v9) / v9;
    if (v11 / v8 < v12)
      v12 = v11 / v8;
    v13 = sub_1003C65EC(v12, 1.0, 1.1);
    self->_pulsating = 1;
    *(float *)&v13 = v13;
    v14 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&v38.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&v38.m33 = v14;
    v34 = *(_OWORD *)&v38.m31;
    v35 = v14;
    v15 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v38.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v38.m43 = v15;
    v32 = *(_OWORD *)&v38.m41;
    v33 = v15;
    v16 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v38.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v38.m13 = v16;
    v30 = *(_OWORD *)&v38.m11;
    v31 = v16;
    v17 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v38.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&v38.m23 = v17;
    v28 = *(_OWORD *)&v38.m21;
    v29 = v17;
    v18 = *(float *)&v13;
    *(_OWORD *)&v37.m31 = *(_OWORD *)&v38.m31;
    *(_OWORD *)&v37.m33 = v14;
    *(_OWORD *)&v37.m41 = *(_OWORD *)&v38.m41;
    *(_OWORD *)&v37.m43 = v15;
    *(_OWORD *)&v37.m11 = *(_OWORD *)&v38.m11;
    *(_OWORD *)&v37.m13 = v16;
    *(_OWORD *)&v37.m21 = *(_OWORD *)&v38.m21;
    *(_OWORD *)&v37.m23 = v17;
    CATransform3DTranslate(&v38, &v37, -(x * *(float *)&v13 - x), -(y * *(float *)&v13 - y), 0.0);
    v36 = v38;
    CATransform3DTranslate(&v37, &v36, -(width - width * v18) * -0.5, -(height - height * v18) * -0.5, 0.0);
    v38 = v37;
    v36 = v37;
    CATransform3DScale(&v37, &v36, v18, v18, 1.0);
    v38 = v37;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform")));
    objc_msgSend(v19, "setKeyTimes:", &off_1012CB950);
    *(_OWORD *)&v37.m31 = v34;
    *(_OWORD *)&v37.m33 = v35;
    *(_OWORD *)&v37.m41 = v32;
    *(_OWORD *)&v37.m43 = v33;
    *(_OWORD *)&v37.m11 = v30;
    *(_OWORD *)&v37.m13 = v31;
    *(_OWORD *)&v37.m21 = v28;
    *(_OWORD *)&v37.m23 = v29;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v37));
    v40[0] = v20;
    v37 = v38;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v37));
    v40[1] = v21;
    *(_OWORD *)&v37.m31 = v34;
    *(_OWORD *)&v37.m33 = v35;
    *(_OWORD *)&v37.m41 = v32;
    *(_OWORD *)&v37.m43 = v33;
    *(_OWORD *)&v37.m11 = v30;
    *(_OWORD *)&v37.m13 = v31;
    *(_OWORD *)&v37.m21 = v28;
    *(_OWORD *)&v37.m23 = v29;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v37));
    v40[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3));
    objc_msgSend(v19, "setValues:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
    v39[0] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
    v39[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
    objc_msgSend(v19, "setTimingFunctions:", v26);

    objc_msgSend(v19, "setDuration:", self->_duration);
    objc_msgSend(v19, "setDelegate:", self);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHighlightController layerToAnimate](self, "layerToAnimate"));
    objc_msgSend(v27, "addAnimation:forKey:", v19, CFSTR("PulseAnimation"));

  }
  else
  {
    -[CRLPulseAnimationControllerProtocol pulseAnimationDidStopForPulse:](self->_delegate, "pulseAnimationDidStopForPulse:", self);
  }
}

- (void)startAnimatingStandardThreePhasePulse
{
  self->_duration = 1.5;
  -[CRLPulseAnimationController startAnimatingStandardPulse](self, "startAnimatingStandardPulse");
}

- (void)startAnimating
{
  unint64_t v3;

  v3 = -[CRLPulseAnimationController pulseAnimationStyle](self, "pulseAnimationStyle");
  if (v3 == 1)
  {
    -[CRLPulseAnimationController startAnimatingStandardThreePhasePulse](self, "startAnimatingStandardThreePhasePulse");
  }
  else if (!v3)
  {
    -[CRLPulseAnimationController startAnimatingStandardPulse](self, "startAnimatingStandardPulse");
  }
}

- (BOOL)pulsating
{
  return self->_pulsating;
}

- (void)setPulsating:(BOOL)a3
{
  self->_pulsating = a3;
}

- (BOOL)autohide
{
  return self->_autohide;
}

- (void)setAutohide:(BOOL)a3
{
  self->_autohide = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)pulseOffset
{
  return self->_pulseOffset;
}

- (void)setPulseOffset:(double)a3
{
  self->_pulseOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
