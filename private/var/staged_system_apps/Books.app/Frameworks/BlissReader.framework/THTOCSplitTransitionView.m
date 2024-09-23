@implementation THTOCSplitTransitionView

- (void)dealloc
{
  objc_super v3;

  self->_splitAnimationView = 0;
  self->_scaleAnimationView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCSplitTransitionView;
  -[THTransitionView dealloc](&v3, "dealloc");
}

- (double)slideAnimationScalar
{
  return 0.75;
}

- (double)slideAnimationDuration
{
  double animationDuration;
  double v3;

  animationDuration = self->_animationDuration;
  -[THTOCSplitTransitionView slideAnimationScalar](self, "slideAnimationScalar");
  return animationDuration * v3;
}

- (CGPoint)_splitReplicatorLayerPositionForOpen:(BOOL)a3
{
  double x;
  double y;
  double splitPositionY;
  double scale;
  double v7;
  double v8;
  CGPoint result;

  x = self->_splitLayerOriginalPosition.x;
  y = self->_splitLayerOriginalPosition.y;
  if (self->_isInteractive)
  {
    splitPositionY = self->_splitPositionY;
    scale = self->_scale;
    v7 = splitPositionY - splitPositionY * scale;
    v8 = splitPositionY * scale;
    if (a3)
      v8 = v7;
    goto LABEL_7;
  }
  if (a3)
  {
    v8 = self->_splitPositionY;
LABEL_7:
    y = y - v8;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (CATransform3D)_splitInstanceTransformForOpen:(SEL)a3
{
  _BOOL4 v4;
  double v7;
  double scale;
  double v9;

  v4 = a4;
  -[CAReplicatorLayer bounds](self->_splitReplicatorLayer, "bounds");
  if (self->_isInteractive)
  {
    scale = self->_scale;
    if (v4)
      v9 = v7 - v7 * scale;
    else
      v9 = v7 * scale;
  }
  else if (v4)
  {
    v9 = v7;
  }
  else
  {
    v9 = 0.0001;
  }
  return CATransform3DMakeTranslation(retstr, 0.0, v9, 0.0);
}

- (CGPoint)_shadowLayerPositionForOpen:(BOOL)a3 top:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat x;
  double y;
  double v8;
  double scale;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v4 = a3;
  x = self->_splitLayerOriginalPosition.x;
  y = self->_splitLayerOriginalPosition.y;
  if (a4)
  {
    -[CALayer bounds](self->_topShadowLayer, "bounds");
    if (self->_isInteractive)
    {
      scale = self->_scale;
      if (v4)
        scale = 1.0 - scale;
      v10 = v8 * scale;
    }
    else
    {
      v10 = 0.0;
      if (v4)
        v10 = v8;
    }
    v15 = y - v10;
  }
  else
  {
    v11 = y + self->_splitPositionY;
    -[CALayer bounds](self->_bottomShadowLayer, "bounds");
    if (self->_isInteractive)
    {
      v13 = self->_scale;
      if (v4)
        v13 = 1.0 - v13;
      v14 = v12 * v13;
    }
    else
    {
      v14 = -0.0;
      if (v4)
        v14 = v12;
    }
    v15 = v11 + v14;
  }
  v16 = x;
  result.y = v15;
  result.x = v16;
  return result;
}

- (void)_setupSplitAnimationLayers
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat splitPositionY;
  CGSize size;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CALayer *v16;
  double y;
  double v18;
  CALayer *v19;
  double v20;
  id v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CAReplicatorLayer *v26;
  CAReplicatorLayer *splitReplicatorLayer;
  CALayer *v28;
  CALayer *v29;
  CALayer *v30;
  CALayer *maskLayer;
  CATransform3D v32;
  CATransform3D v33;
  _OWORD v34[16];
  CGRect remainder;
  CGRect slice;

  -[CALayer bounds](-[UIView layer](self->_splitAnimationView, "layer"), "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  splitPositionY = self->_splitPositionY;
  if (splitPositionY >= 0.0 && splitPositionY <= 0.0)
  {
    splitPositionY = CGRectGetMidY(*(CGRect *)&v3);
    self->_splitPositionY = splitPositionY;
  }
  size = CGRectNull.size;
  slice.origin = CGRectNull.origin;
  slice.size = size;
  remainder.origin = slice.origin;
  remainder.size = size;
  v13 = v7;
  size.width = v8;
  v14 = v9;
  v15 = v10;
  CGRectDivide(*(CGRect *)((char *)&size - 8), &slice, &remainder, splitPositionY, CGRectMinYEdge);
  v16 = +[CALayer layer](CALayer, "layer");
  self->_bottomShadowLayer = v16;
  -[CALayer setName:](v16, "setName:", CFSTR("_bottomShadowLayer"));
  y = CGPointZero.y;
  -[CALayer setAnchorPoint:](self->_bottomShadowLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_bottomShadowLayer, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  -[CALayer setOpaque:](self->_bottomShadowLayer, "setOpaque:", 0);
  -[CALayer bounds](self->_bottomShadowLayer, "bounds");
  -[CALayer setShadowPath:](self->_bottomShadowLayer, "setShadowPath:", -[UIBezierPath CGPath](+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"), "CGPath"));
  -[CALayer setShadowOffset:](self->_bottomShadowLayer, "setShadowOffset:", 0.0, -5.0);
  -[CALayer setShadowRadius:](self->_bottomShadowLayer, "setShadowRadius:", 15.0);
  LODWORD(v18) = 0.5;
  -[CALayer setShadowOpacity:](self->_bottomShadowLayer, "setShadowOpacity:", v18);
  objc_msgSend(-[THTOCSplitTransitionView layer](self, "layer"), "addSublayer:", self->_bottomShadowLayer);
  v19 = +[CALayer layer](CALayer, "layer");
  self->_topShadowLayer = v19;
  -[CALayer setName:](v19, "setName:", CFSTR("_topShadowLayer"));
  -[CALayer setAnchorPoint:](self->_topShadowLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_topShadowLayer, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[CALayer setOpaque:](self->_topShadowLayer, "setOpaque:", 0);
  -[CALayer bounds](self->_topShadowLayer, "bounds");
  -[CALayer setShadowPath:](self->_topShadowLayer, "setShadowPath:", -[UIBezierPath CGPath](+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"), "CGPath"));
  -[CALayer setShadowOffset:](self->_topShadowLayer, "setShadowOffset:", 0.0, 5.0);
  -[CALayer setShadowRadius:](self->_topShadowLayer, "setShadowRadius:", 15.0);
  LODWORD(v20) = 0.5;
  -[CALayer setShadowOpacity:](self->_topShadowLayer, "setShadowOpacity:", v20);
  objc_msgSend(-[THTOCSplitTransitionView layer](self, "layer"), "addSublayer:", self->_topShadowLayer);
  v21 = -[THTOCSplitTransitionView layer](self, "layer");
  -[CALayer bounds](-[UIView layer](self->_splitAnimationView, "layer"), "bounds");
  objc_msgSend(v21, "convertPoint:fromLayer:", -[UIView layer](self->_splitAnimationView, "layer"), v22, v23);
  self->_splitLayerOriginalPosition.x = v24;
  self->_splitLayerOriginalPosition.y = v25;
  v26 = (CAReplicatorLayer *)+[CAReplicatorLayer layer](CAReplicatorLayer, "layer");
  self->_splitReplicatorLayer = v26;
  -[CAReplicatorLayer setName:](v26, "setName:", CFSTR("_splitReplicatorLayer"));
  -[CAReplicatorLayer setInstanceCount:](self->_splitReplicatorLayer, "setInstanceCount:", 2);
  -[CAReplicatorLayer setInstanceDelay:](self->_splitReplicatorLayer, "setInstanceDelay:", self->_animationDuration + 100.0);
  -[CAReplicatorLayer setAnchorPoint:](self->_splitReplicatorLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer bounds](-[UIView layer](self->_splitAnimationView, "layer"), "bounds");
  -[CAReplicatorLayer setBounds:](self->_splitReplicatorLayer, "setBounds:");
  -[THTOCSplitTransitionView _splitReplicatorLayerPositionForOpen:](self, "_splitReplicatorLayerPositionForOpen:", self->_isReverse);
  -[CAReplicatorLayer setPosition:](self->_splitReplicatorLayer, "setPosition:");
  -[CAReplicatorLayer setPreservesDepth:](self->_splitReplicatorLayer, "setPreservesDepth:", 1);
  -[THTOCSplitTransitionView _splitInstanceTransformForOpen:](self, "_splitInstanceTransformForOpen:", self->_isReverse);
  splitReplicatorLayer = self->_splitReplicatorLayer;
  v34[4] = v34[12];
  v34[5] = v34[13];
  v34[6] = v34[14];
  v34[7] = v34[15];
  v34[0] = v34[8];
  v34[1] = v34[9];
  v34[2] = v34[10];
  v34[3] = v34[11];
  -[CAReplicatorLayer setInstanceTransform:](splitReplicatorLayer, "setInstanceTransform:", v34);
  v28 = +[CALayer layer](CALayer, "layer");
  self->_hostLayer = v28;
  -[CALayer setName:](v28, "setName:", CFSTR("_hostLayer"));
  -[CAReplicatorLayer bounds](self->_splitReplicatorLayer, "bounds");
  -[CALayer setFrame:](self->_hostLayer, "setFrame:");
  v29 = +[CALayer layer](CALayer, "layer");
  self->_shadowedLayer = v29;
  -[CALayer setName:](v29, "setName:", CFSTR("_shadowedLayer"));
  -[CALayer setAnchorPoint:](self->_shadowedLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_shadowedLayer, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  -[CALayer setOpaque:](self->_shadowedLayer, "setOpaque:", 0);
  v30 = +[CALayer layer](CALayer, "layer");
  self->_maskLayer = v30;
  -[CALayer setName:](v30, "setName:", CFSTR("_maskLayer"));
  -[CALayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer bounds](self->_shadowedLayer, "bounds");
  -[CALayer setFrame:](self->_maskLayer, "setFrame:");
  CATransform3DMakeTranslation(&v33, 0.0, -self->_splitPositionY, 0.0);
  maskLayer = self->_maskLayer;
  v32 = v33;
  -[CALayer setSublayerTransform:](maskLayer, "setSublayerTransform:", &v32);
  -[CALayer setOpaque:](self->_maskLayer, "setOpaque:", 1);
  -[CALayer setMasksToBounds:](self->_maskLayer, "setMasksToBounds:", 1);
  -[CALayer addSublayer:](self->_maskLayer, "addSublayer:", -[UIView layer](self->_splitAnimationView, "layer"));
  -[CALayer addSublayer:](self->_shadowedLayer, "addSublayer:", self->_maskLayer);
  -[CALayer addSublayer:](self->_hostLayer, "addSublayer:", self->_shadowedLayer);
  -[CAReplicatorLayer addSublayer:](self->_splitReplicatorLayer, "addSublayer:", self->_hostLayer);
  objc_msgSend(-[THTOCSplitTransitionView layer](self, "layer"), "addSublayer:", self->_splitReplicatorLayer);
}

- (void)_adjustSplitReplicatorLayers:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CALayer *maskLayer;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THTOCSplitTransitionView _setupQuickAnimationToLayer:withKeyPath:toValue:](self, "_setupQuickAnimationToLayer:withKeyPath:toValue:", self->_shadowedLayer, CFSTR("position"), +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y));
  -[THTOCSplitTransitionView _setupQuickAnimationToLayer:withKeyPath:toValue:](self, "_setupQuickAnimationToLayer:withKeyPath:toValue:", self->_shadowedLayer, CFSTR("bounds"), +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
  -[THTOCSplitTransitionView _setupQuickAnimationToLayer:withKeyPath:toValue:](self, "_setupQuickAnimationToLayer:withKeyPath:toValue:", self->_maskLayer, CFSTR("bounds"), +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
  maskLayer = self->_maskLayer;
  v9 = *(_OWORD *)&CATransform3DIdentity.m33;
  v13[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v13[5] = v9;
  v10 = *(_OWORD *)&CATransform3DIdentity.m43;
  v13[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v13[7] = v10;
  v11 = *(_OWORD *)&CATransform3DIdentity.m13;
  v13[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v13[1] = v11;
  v12 = *(_OWORD *)&CATransform3DIdentity.m23;
  v13[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v13[3] = v12;
  -[THTOCSplitTransitionView _setupQuickAnimationToLayer:withKeyPath:toValue:](self, "_setupQuickAnimationToLayer:withKeyPath:toValue:", maskLayer, CFSTR("sublayerTransform"), +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v13));
}

- (CATransform3D)_scaleInstanceTransformForOpen:(SEL)a3
{
  double v4;
  double v5;
  double v6;

  if (self->_isInteractive)
  {
    if (a4)
    {
      v4 = 0.999899983;
      v5 = -0.0598999858;
    }
    else
    {
      v4 = 0.939999998;
      v5 = 0.0598999858;
    }
    v6 = v4 + self->_scale * v5;
  }
  else
  {
    v6 = 0.939999998;
    if (a4)
      v6 = 0.999899983;
  }
  return CATransform3DMakeScale(retstr, v6, v6, 1.0);
}

- (double)_scaleInstanceAlphaOffsetForOpen:(BOOL)a3
{
  double scale;

  if (self->_isInteractive)
  {
    scale = self->_scale;
    if (!a3)
      scale = scale + -1.0;
  }
  else
  {
    scale = -1.0;
    if (a3)
      scale = 0.0;
  }
  return TSUClamp(scale, -0.300000012, 0.300000012);
}

- (void)_setupScaleAnimationLayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CALayer *v11;
  CAReplicatorLayer *v12;
  CAReplicatorLayer *scaleReplicatorLayer;
  double v14;
  _OWORD v15[16];

  -[THTOCSplitTransitionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = +[CALayer layer](CALayer, "layer");
  self->_blackBackgroundLayer = v11;
  -[CALayer setName:](v11, "setName:", CFSTR("_blackBackgroundLayer"));
  -[CALayer setFrame:](self->_blackBackgroundLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setBackgroundColor:](self->_blackBackgroundLayer, "setBackgroundColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
  -[CALayer setOpaque:](self->_blackBackgroundLayer, "setOpaque:", 1);
  objc_msgSend(-[THTOCSplitTransitionView layer](self, "layer"), "insertSublayer:below:", self->_blackBackgroundLayer, self->_bottomShadowLayer);
  v12 = (CAReplicatorLayer *)+[CAReplicatorLayer layer](CAReplicatorLayer, "layer");
  self->_scaleReplicatorLayer = v12;
  -[CAReplicatorLayer setName:](v12, "setName:", CFSTR("_scaleReplicatorLayer"));
  -[CAReplicatorLayer setFrame:](self->_scaleReplicatorLayer, "setFrame:", v4, v6, v8, v10);
  -[CAReplicatorLayer setInstanceCount:](self->_scaleReplicatorLayer, "setInstanceCount:", 2);
  -[CAReplicatorLayer setInstanceDelay:](self->_scaleReplicatorLayer, "setInstanceDelay:", self->_animationDuration + 100.0);
  -[CAReplicatorLayer setPreservesDepth:](self->_scaleReplicatorLayer, "setPreservesDepth:", 1);
  -[THTOCSplitTransitionView _scaleInstanceTransformForOpen:](self, "_scaleInstanceTransformForOpen:", self->_isReverse);
  scaleReplicatorLayer = self->_scaleReplicatorLayer;
  v15[4] = v15[12];
  v15[5] = v15[13];
  v15[6] = v15[14];
  v15[7] = v15[15];
  v15[0] = v15[8];
  v15[1] = v15[9];
  v15[2] = v15[10];
  v15[3] = v15[11];
  -[CAReplicatorLayer setInstanceTransform:](scaleReplicatorLayer, "setInstanceTransform:", v15);
  -[THTOCSplitTransitionView _scaleInstanceAlphaOffsetForOpen:](self, "_scaleInstanceAlphaOffsetForOpen:", self->_isReverse);
  *(float *)&v14 = v14;
  -[CAReplicatorLayer setInstanceAlphaOffset:](self->_scaleReplicatorLayer, "setInstanceAlphaOffset:", v14);
  -[CAReplicatorLayer addSublayer:](self->_scaleReplicatorLayer, "addSublayer:", -[UIView layer](self->_scaleAnimationView, "layer"));
  -[CALayer addSublayer:](self->_blackBackgroundLayer, "addSublayer:", self->_scaleReplicatorLayer);
}

- (void)_adjustScaleReplicatorLayers:(CGRect)a3
{
  CALayer *v4;
  double v5;

  v4 = -[UIView layer](self->_scaleAnimationView, "layer", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  LODWORD(v5) = 0;
  -[THTOCSplitTransitionView _setupQuickAnimationToLayer:withKeyPath:toValue:](self, "_setupQuickAnimationToLayer:withKeyPath:toValue:", v4, CFSTR("opacity"), +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
}

- (void)_setupLayers
{
  int *v3;
  int *v4;
  double Width;
  double splitPositionY;
  CGRect v7;

  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (!self->_keepSplitAnimationView)
  {

    self->_splitAnimationView = 0;
  }
  if (!self->_keepScaleAnimationView)
  {

    self->_scaleAnimationView = 0;
  }
  if (!self->_splitAnimationView)
  {
    if (self->_isReverse)
      v3 = &OBJC_IVAR___THTransitionView__toViewController;
    else
      v3 = &OBJC_IVAR___THTransitionView__fromViewController;
    self->_splitAnimationView = (UIView *)objc_msgSend(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v3), "view"), "snapshotViewAfterScreenUpdates:", 1);
  }
  if (!self->_scaleAnimationView)
  {
    if (self->_isReverse)
      v4 = &OBJC_IVAR___THTransitionView__fromViewController;
    else
      v4 = &OBJC_IVAR___THTransitionView__toViewController;
    self->_scaleAnimationView = (UIView *)objc_msgSend(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v4), "view"), "snapshotViewAfterScreenUpdates:", 1);
  }
  -[THTOCSplitTransitionView _setupSplitAnimationLayers](self, "_setupSplitAnimationLayers");
  -[THTOCSplitTransitionView _setupScaleAnimationLayers](self, "_setupScaleAnimationLayers");
  -[THTOCSplitTransitionView frame](self, "frame");
  Width = CGRectGetWidth(v7);
  splitPositionY = self->_splitPositionY;
  -[THTOCSplitTransitionView _adjustSplitReplicatorLayers:](self, "_adjustSplitReplicatorLayers:", 0.0, 0.0, Width, splitPositionY);
  -[THTOCSplitTransitionView _adjustScaleReplicatorLayers:](self, "_adjustScaleReplicatorLayers:", 0.0, 0.0, Width, splitPositionY);
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
}

- (void)_animate
{
  const CAMediaTimingFunctionName *v3;
  CAReplicatorLayer *splitReplicatorLayer;
  double v5;
  double v6;
  CAReplicatorLayer *scaleReplicatorLayer;
  double v8;
  _OWORD v9[16];
  _QWORD v10[33];
  _QWORD v11[5];

  -[THTransitionViewDelegate transitionWillFinish:](-[THTransitionView delegate](self, "delegate"), "transitionWillFinish:", self);
  +[CATransaction begin](CATransaction, "begin");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_F9618;
  v11[3] = &unk_426DD0;
  v11[4] = self;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v11);
  -[THTOCSplitTransitionView slideAnimationDuration](self, "slideAnimationDuration");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
  if (self->_isFinishingInteractive)
    v3 = &kCAMediaTimingFunctionLinear;
  else
    v3 = &kCAMediaTimingFunctionEaseIn;
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", *v3));
  -[THTOCSplitTransitionView _splitReplicatorLayerPositionForOpen:](self, "_splitReplicatorLayerPositionForOpen:", !self->_isReverse);
  -[CAReplicatorLayer setPosition:](self->_splitReplicatorLayer, "setPosition:");
  -[THTOCSplitTransitionView _splitInstanceTransformForOpen:](self, "_splitInstanceTransformForOpen:", !self->_isReverse);
  splitReplicatorLayer = self->_splitReplicatorLayer;
  *(_OWORD *)&v10[8] = *(_OWORD *)&v10[25];
  *(_OWORD *)&v10[10] = *(_OWORD *)&v10[27];
  *(_OWORD *)&v10[12] = *(_OWORD *)&v10[29];
  *(_OWORD *)&v10[14] = *(_OWORD *)&v10[31];
  *(_OWORD *)v10 = *(_OWORD *)&v10[17];
  *(_OWORD *)&v10[2] = *(_OWORD *)&v10[19];
  *(_OWORD *)&v10[4] = *(_OWORD *)&v10[21];
  *(_OWORD *)&v10[6] = *(_OWORD *)&v10[23];
  -[CAReplicatorLayer setInstanceTransform:](splitReplicatorLayer, "setInstanceTransform:", v10);
  -[THTOCSplitTransitionView _shadowLayerPositionForOpen:top:](self, "_shadowLayerPositionForOpen:top:", !self->_isReverse, 1);
  -[CALayer setPosition:](self->_topShadowLayer, "setPosition:");
  LODWORD(v5) = 0;
  -[CALayer setOpacity:](self->_topShadowLayer, "setOpacity:", v5);
  -[THTOCSplitTransitionView _shadowLayerPositionForOpen:top:](self, "_shadowLayerPositionForOpen:top:", !self->_isReverse, 0);
  -[CALayer setPosition:](self->_bottomShadowLayer, "setPosition:");
  LODWORD(v6) = 0;
  -[CALayer setOpacity:](self->_bottomShadowLayer, "setOpacity:", v6);
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", self->_animationDuration);
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  -[THTOCSplitTransitionView _scaleInstanceTransformForOpen:](self, "_scaleInstanceTransformForOpen:", !self->_isReverse);
  scaleReplicatorLayer = self->_scaleReplicatorLayer;
  v9[4] = v9[12];
  v9[5] = v9[13];
  v9[6] = v9[14];
  v9[7] = v9[15];
  v9[0] = v9[8];
  v9[1] = v9[9];
  v9[2] = v9[10];
  v9[3] = v9[11];
  -[CAReplicatorLayer setInstanceTransform:](scaleReplicatorLayer, "setInstanceTransform:", v9);
  -[THTOCSplitTransitionView _scaleInstanceAlphaOffsetForOpen:](self, "_scaleInstanceAlphaOffsetForOpen:", !self->_isReverse);
  *(float *)&v8 = v8;
  -[CAReplicatorLayer setInstanceAlphaOffset:](self->_scaleReplicatorLayer, "setInstanceAlphaOffset:", v8);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)_animateInteractive
{
  CAReplicatorLayer *splitReplicatorLayer;
  CAReplicatorLayer *scaleReplicatorLayer;
  double v5;
  _OWORD v6[16];
  _OWORD v7[16];

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[THTOCSplitTransitionView _splitReplicatorLayerPositionForOpen:](self, "_splitReplicatorLayerPositionForOpen:", !self->_isReverse);
  -[CAReplicatorLayer setPosition:](self->_splitReplicatorLayer, "setPosition:");
  -[THTOCSplitTransitionView _splitInstanceTransformForOpen:](self, "_splitInstanceTransformForOpen:", !self->_isReverse);
  splitReplicatorLayer = self->_splitReplicatorLayer;
  v7[4] = v7[12];
  v7[5] = v7[13];
  v7[6] = v7[14];
  v7[7] = v7[15];
  v7[0] = v7[8];
  v7[1] = v7[9];
  v7[2] = v7[10];
  v7[3] = v7[11];
  -[CAReplicatorLayer setInstanceTransform:](splitReplicatorLayer, "setInstanceTransform:", v7);
  -[THTOCSplitTransitionView _shadowLayerPositionForOpen:top:](self, "_shadowLayerPositionForOpen:top:", !self->_isReverse, 1);
  -[CALayer setPosition:](self->_topShadowLayer, "setPosition:");
  -[THTOCSplitTransitionView _shadowLayerPositionForOpen:top:](self, "_shadowLayerPositionForOpen:top:", !self->_isReverse, 0);
  -[CALayer setPosition:](self->_bottomShadowLayer, "setPosition:");
  -[THTOCSplitTransitionView _scaleInstanceTransformForOpen:](self, "_scaleInstanceTransformForOpen:", !self->_isReverse);
  scaleReplicatorLayer = self->_scaleReplicatorLayer;
  v6[4] = v6[12];
  v6[5] = v6[13];
  v6[6] = v6[14];
  v6[7] = v6[15];
  v6[0] = v6[8];
  v6[1] = v6[9];
  v6[2] = v6[10];
  v6[3] = v6[11];
  -[CAReplicatorLayer setInstanceTransform:](scaleReplicatorLayer, "setInstanceTransform:", v6);
  -[THTOCSplitTransitionView _scaleInstanceAlphaOffsetForOpen:](self, "_scaleInstanceAlphaOffsetForOpen:", !self->_isReverse);
  *(float *)&v5 = v5;
  -[CAReplicatorLayer setInstanceAlphaOffset:](self->_scaleReplicatorLayer, "setInstanceAlphaOffset:", v5);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)_setupAnimation
{
  const char *v2;
  double animationDelay;

  if (self->_isInteractive)
  {
    v2 = "_animateInteractive";
    animationDelay = 0.0;
  }
  else
  {
    v2 = "_animate";
    animationDelay = self->_animationDelay;
  }
  -[THTOCSplitTransitionView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", v2, 0, animationDelay);
}

- (void)beginTransition
{
  objc_super v3;

  -[THTOCSplitTransitionView _setupLayers](self, "_setupLayers");
  -[THTOCSplitTransitionView _setupAnimation](self, "_setupAnimation");
  v3.receiver = self;
  v3.super_class = (Class)THTOCSplitTransitionView;
  -[THTransitionView beginTransition](&v3, "beginTransition");
}

- (void)beginInteractiveTransition
{
  self->_isInteractive = 1;
  self->_scale = 0.0;
  -[THTOCSplitTransitionView beginTransition](self, "beginTransition");
}

- (void)finishInteractiveTransition
{
  self->_isInteractive = 0;
  self->_isFinishingInteractive = 1;
  -[THTOCSplitTransitionView _setupAnimation](self, "_setupAnimation");
}

- (void)reverseInteractiveTransition
{
  self->_wasReversed = 1;
  self->_isReverse ^= 1u;
  -[THTOCSplitTransitionView finishInteractiveTransition](self, "finishInteractiveTransition");
}

- (void)_animationDidStop
{
  +[CATransaction begin](CATransaction, "begin");
  -[CAReplicatorLayer removeFromSuperlayer](self->_splitReplicatorLayer, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](-[UIView layer](self->_scaleAnimationView, "layer"), "removeFromSuperlayer");
  -[THTransitionView transitionDidFinish](self, "transitionDidFinish");
  +[CATransaction commit](CATransaction, "commit");

  self->_splitAnimationView = 0;
  self->_scaleAnimationView = 0;
}

- (void)_setupQuickAnimationToLayer:(id)a3 withKeyPath:(id)a4 toValue:(id)a5
{
  CABasicAnimation *v8;

  v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", a4);
  -[CABasicAnimation setDuration:](v8, "setDuration:", 0.00100000005);
  -[CABasicAnimation setBeginTime:](v8, "setBeginTime:", 0.0);
  -[CABasicAnimation setBeginTimeMode:](v8, "setBeginTimeMode:", kCAAnimationRelative);
  -[CABasicAnimation setFillMode:](v8, "setFillMode:", kCAFillModeBoth);
  -[CABasicAnimation setRemovedOnCompletion:](v8, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setToValue:](v8, "setToValue:", a5);
  objc_msgSend(a3, "addAnimation:forKey:", v8, a4);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  -[THTOCSplitTransitionView _animateInteractive](self, "_animateInteractive");
}

- (double)splitPositionY
{
  return self->_splitPositionY;
}

- (void)setSplitPositionY:(double)a3
{
  self->_splitPositionY = a3;
}

- (double)animationDelay
{
  return self->_animationDelay;
}

- (void)setAnimationDelay:(double)a3
{
  self->_animationDelay = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (BOOL)isReverse
{
  return self->_isReverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_isReverse = a3;
}

- (BOOL)wasReversed
{
  return self->_wasReversed;
}

- (UIView)splitAnimationView
{
  return self->_splitAnimationView;
}

- (void)setSplitAnimationView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (UIView)scaleAnimationView
{
  return self->_scaleAnimationView;
}

- (void)setScaleAnimationView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (BOOL)keepScaleAnimationView
{
  return self->_keepScaleAnimationView;
}

- (void)setKeepScaleAnimationView:(BOOL)a3
{
  self->_keepScaleAnimationView = a3;
}

- (BOOL)keepSplitAnimationView
{
  return self->_keepSplitAnimationView;
}

- (void)setKeepSplitAnimationView:(BOOL)a3
{
  self->_keepSplitAnimationView = a3;
}

@end
