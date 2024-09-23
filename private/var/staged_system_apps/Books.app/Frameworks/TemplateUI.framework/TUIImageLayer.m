@implementation TUIImageLayer

- (void)updateBoundsAndContent:(BOOL)a3
{
  _BOOL4 v3;
  CGSize *p_contentSize;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  _OWORD v25[8];
  CGAffineTransform m;
  CATransform3D v27;
  CGAffineTransform v28;

  v3 = a3;
  p_contentSize = &self->_contentSize;
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  -[TUIImageLayer bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIAnimationState currentState](_TUIAnimationState, "currentState"));
  v13 = objc_msgSend(v12, "shouldCaptureCALayerAnimations");
  if (width == v9 && height == v11)
  {
    if (v3)
      -[TUIImageLayer updateContentAllowCrossfade:](self, "updateContentAllowCrossfade:", v13);
  }
  else
  {
    p_contentSize->width = v9;
    p_contentSize->height = v11;
    if ((_DWORD)v13)
    {
      v15 = width / v9;
      v16 = 1.0;
      if (v9 <= 0.0)
        v15 = 1.0;
      memset(&v28.c, 0, 32);
      if (v11 > 0.0)
        v16 = height / v11;
      *(_OWORD *)&v28.a = 0uLL;
      CGAffineTransformMakeScale(&v28, v15, v16);
      -[TUIImageLayer updateContentAllowCrossfade:](self, "updateContentAllowCrossfade:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "animationForKeyPath:", CFSTR("transform")));
      m = v28;
      CATransform3DMakeAffineTransform(&v27, &m);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v27));
      objc_msgSend(v17, "setFromValue:", v18);

      v19 = *(_OWORD *)&CATransform3DIdentity.m33;
      v25[4] = *(_OWORD *)&CATransform3DIdentity.m31;
      v25[5] = v19;
      v20 = *(_OWORD *)&CATransform3DIdentity.m43;
      v25[6] = *(_OWORD *)&CATransform3DIdentity.m41;
      v25[7] = v20;
      v21 = *(_OWORD *)&CATransform3DIdentity.m13;
      v25[0] = *(_OWORD *)&CATransform3DIdentity.m11;
      v25[1] = v21;
      v22 = *(_OWORD *)&CATransform3DIdentity.m23;
      v25[2] = *(_OWORD *)&CATransform3DIdentity.m21;
      v25[3] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", v25));
      objc_msgSend(v17, "setToValue:", v23);

      objc_msgSend(v17, "setRemovedOnCompletion:", 1);
      objc_msgSend(v17, "setAdditive:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer tui_uniqueAnimationKeyWithPrefix:](self->_wrapperLayer, "tui_uniqueAnimationKeyWithPrefix:", CFSTR("transform")));
      -[CALayer addAnimation:forKey:](self->_wrapperLayer, "addAnimation:forKey:", v17, v24);

    }
    else
    {
      -[TUIImageLayer updateContentAllowCrossfade:](self, "updateContentAllowCrossfade:");
    }
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CALayer setBounds:](self->_wrapperLayer, "setBounds:", CGPointZero.x, CGPointZero.y, p_contentSize->width, p_contentSize->height);
    +[CATransaction commit](CATransaction, "commit");
    -[CALayer setPosition:](self->_wrapperLayer, "setPosition:", p_contentSize->width * 0.5, p_contentSize->height * 0.5);
  }

}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL4 v3;
  char flags;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TUIImageLayer;
  -[TUIImageLayer layerDidBecomeVisible:](&v6, "layerDidBecomeVisible:");
  flags = (char)self->_flags;
  if (v3)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      -[TUIImageResource addNonVolatileInterest](self->_resource, "addNonVolatileInterest");
      flags = (char)self->_flags;
    }
    *(_BYTE *)&self->_flags = flags | 1;
    -[TUIImageLayer updateContentAllowCrossfade:](self, "updateContentAllowCrossfade:", 0);
  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      -[TUIImageResource removeNonVolatileInterest](self->_resource, "removeNonVolatileInterest");
      flags = (char)self->_flags;
    }
    *(_BYTE *)&self->_flags = flags & 0xFE;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CALayer setContents:](self->_contentLayer, "setContents:", 0);
    -[TUIImageLayer setBackgroundColor:](self, "setBackgroundColor:", -[UIColor CGColor](self->_fallbackColor, "CGColor"));
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)configWithContentsScale:(double)a3 resource:(id)a4 load:(unint64_t)a5 cornerRadius:(double)a6 cornerCurve:(id)a7 fallbackColor:(id)a8 contentsGravity:(id)a9 crossfadesContents:(BOOL)a10 opacity:(double)a11
{
  TUIImageResource *v19;
  id v20;
  CALayer *v21;
  CALayer *wrapperLayer;
  void *v23;
  CALayer *v24;
  CALayer *contentLayer;
  void *v26;
  uint64_t v27;
  double v28;
  TUIImageResource **p_resource;
  TUIImageResource *resource;
  TUIImageResource *v31;
  id v32;
  _BOOL4 v33;
  id v35;
  id v36;
  CALayer *v37;
  CALayer *v38;

  v33 = a10;
  v19 = (TUIImageResource *)a4;
  v36 = a7;
  v35 = a8;
  v20 = a9;
  if (!self->_contentLayer)
  {
    v21 = (CALayer *)objc_claimAutoreleasedReturnValue(+[_TUIImplicitAnimationLayer layer](_TUIImplicitAnimationLayer, "layer"));
    wrapperLayer = self->_wrapperLayer;
    self->_wrapperLayer = v21;

    v38 = self->_wrapperLayer;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
    -[TUIImageLayer setSublayers:](self, "setSublayers:", v23);

    v24 = (CALayer *)objc_claimAutoreleasedReturnValue(+[_TUIImplicitAnimationLayer layer](_TUIImplicitAnimationLayer, "layer"));
    contentLayer = self->_contentLayer;
    self->_contentLayer = v24;

    v37 = self->_contentLayer;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
    -[CALayer setSublayers:](self->_wrapperLayer, "setSublayers:", v26);

  }
  objc_storeStrong((id *)&self->_fallbackColor, a8);
  -[CALayer setCornerRadius:](self->_contentLayer, "setCornerRadius:", a6);
  -[CALayer setCornerCurve:](self->_contentLayer, "setCornerCurve:", v36);
  if (a6 <= 0.0)
    v27 = objc_msgSend(v20, "isEqualToString:", kCAGravityResize) ^ 1;
  else
    v27 = 1;
  -[CALayer setMasksToBounds:](self->_contentLayer, "setMasksToBounds:", v27);
  -[CALayer setContentsGravity:](self->_contentLayer, "setContentsGravity:", v20);
  -[TUIImageLayer setRasterizationScale:](self, "setRasterizationScale:", a3);
  -[TUIImageLayer setContentsScale:](self, "setContentsScale:", a3);
  *(float *)&v28 = a11;
  -[TUIImageLayer setOpacity:](self, "setOpacity:", v28);
  -[TUIImageLayer setBackgroundColor:](self, "setBackgroundColor:", -[UIColor CGColor](self->_fallbackColor, "CGColor"));
  -[TUIImageLayer setCornerRadius:](self, "setCornerRadius:", a6);
  p_resource = &self->_resource;
  resource = self->_resource;
  if (resource != v19)
  {
    v31 = resource;
    objc_storeStrong((id *)&self->_resource, a4);
    -[TUIImageResource addObserver:](*p_resource, "addObserver:", self);
    -[TUIImageResource addInterest](*p_resource, "addInterest");
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      -[TUIImageResource addNonVolatileInterest](*p_resource, "addNonVolatileInterest");
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        -[TUIImageResource removeNonVolatileInterest](v31, "removeNonVolatileInterest");
    }
    -[TUIImageResource removeInterest](v31, "removeInterest");
    -[TUIImageResource removeObserver:](v31, "removeObserver:", self);

  }
  -[TUIImageLayer updateBoundsAndContent:](self, "updateBoundsAndContent:", resource != v19);
  if (a5 == 1)
    v32 = -[TUIImageResource loadImage](*p_resource, "loadImage");
  -[TUIImageLayer setCrossfadesContents:](self, "setCrossfadesContents:", v33);

}

- (void)dealloc
{
  objc_super v3;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    -[TUIImageResource removeNonVolatileInterest](self->_resource, "removeNonVolatileInterest");
  -[TUIImageResource removeInterest](self->_resource, "removeInterest");
  -[TUIImageResource removeObserver:](self->_resource, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)TUIImageLayer;
  -[TUIImageLayer dealloc](&v3, "dealloc");
}

- (void)updateContentAllowCrossfade:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
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
  CGFloat y;
  double width;
  double height;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  CALayer *v32;
  CALayer *v33;
  CALayer *contentLayer;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  CGRect v44;
  CGRect v45;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResource imageContentWithOptions:](self->_resource, "imageContentWithOptions:", 1));
  v43 = v5;
  if (v5)
  {
    objc_msgSend(v5, "insets");
    v42 = v6;
    v8 = v7;
    v10 = v9;
    v41 = v11;
    objc_msgSend(v43, "intrinsicSize");
    v13 = v12;
    v39 = v8;
    v40 = v8 + v10;
    v15 = v14 - (v8 + v10);
    y = CGPointZero.y;
    width = self->_contentSize.width;
    height = self->_contentSize.height;
    v19 = 1.0;
    v20 = 1.0;
    if (v15 > 0.0)
    {
      v44.origin.x = CGPointZero.x;
      v44.origin.y = CGPointZero.y;
      v44.size.width = self->_contentSize.width;
      v44.size.height = self->_contentSize.height;
      v20 = CGRectGetWidth(v44) / v15;
    }
    v21 = v13 - (v42 + v41);
    if (v21 > 0.0)
    {
      v45.origin.x = CGPointZero.x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v19 = CGRectGetHeight(v45) / v21;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "image"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layerContents"));
    v24 = width + v40 * v20;
    v25 = height + (v42 + v41) * v19;

    v26 = 0.5;
    v27 = 0.5;
    if (v24 > 0.0)
      v27 = v39 * v20 / v24;
    if (v25 > 0.0)
      v26 = v42 * v19 / v25;
    v28 = CGPointZero.y;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer contents](self->_contentLayer, "contents"));
    if (v3)
    {
      v30 = -[TUIImageLayer crossfadesContents](self, "crossfadesContents");
      if (v29)
        v31 = v30;
      else
        v31 = 0;
      if (v31 == 1 && v23 && v29 != v23)
      {
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
        v32 = self->_contentLayer;
        -[CALayer removeFromSuperlayer](self->_contentLayer, "removeFromSuperlayer");
        v33 = (CALayer *)objc_claimAutoreleasedReturnValue(+[_TUIImplicitAnimationLayer layer](_TUIImplicitAnimationLayer, "layer"));
        contentLayer = self->_contentLayer;
        self->_contentLayer = v33;

        -[CALayer cornerRadius](v32, "cornerRadius");
        -[CALayer setCornerRadius:](self->_contentLayer, "setCornerRadius:");
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer cornerCurve](v32, "cornerCurve"));
        -[CALayer setCornerCurve:](self->_contentLayer, "setCornerCurve:", v35);

        -[CALayer setMasksToBounds:](self->_contentLayer, "setMasksToBounds:", -[CALayer masksToBounds](v32, "masksToBounds"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer contentsGravity](v32, "contentsGravity"));
        -[CALayer setContentsGravity:](self->_contentLayer, "setContentsGravity:", v36);

        -[CALayer setMasksToBounds:](self->_contentLayer, "setMasksToBounds:", -[CALayer masksToBounds](v32, "masksToBounds"));
        -[CALayer addSublayer:](self->_wrapperLayer, "addSublayer:", self->_contentLayer);
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
        objc_msgSend(v37, "setDuration:", 0.15);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
        objc_msgSend(v37, "setTimingFunction:", v38);

        objc_msgSend(v37, "setRemovedOnCompletion:", 1);
        -[CALayer addAnimation:forKey:](self->_wrapperLayer, "addAnimation:forKey:", v37, CFSTR("crossfade"));
        +[CATransaction commit](CATransaction, "commit");

      }
    }
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[TUIImageLayer setBackgroundColor:](self, "setBackgroundColor:", 0);
    -[CALayer setAnchorPoint:](self->_contentLayer, "setAnchorPoint:", v27, v26);
    -[CALayer setContents:](self->_contentLayer, "setContents:", v23);
    -[CALayer setBounds:](self->_contentLayer, "setBounds:", CGPointZero.x, v28, v24, v25);
    +[CATransaction commit](CATransaction, "commit");

  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CALayer setContents:](self->_contentLayer, "setContents:", 0);
    -[CALayer setBounds:](self->_contentLayer, "setBounds:", CGPointZero.x, CGPointZero.y, self->_contentSize.width, self->_contentSize.height);
    -[CALayer setAnchorPoint:](self->_contentLayer, "setAnchorPoint:", 0.5, 0.5);
    -[TUIImageLayer setBackgroundColor:](self, "setBackgroundColor:", -[UIColor CGColor](self->_fallbackColor, "CGColor"));
    +[CATransaction commit](CATransaction, "commit");
  }

}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  TUIImageLayer *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_167298;
  v5[3] = &unk_23F2B8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (TUIImageResource)resource
{
  return self->_resource;
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (BOOL)crossfadesContents
{
  return *((_BYTE *)&self->_flags + 1);
}

- (void)setCrossfadesContents:(BOOL)a3
{
  *((_BYTE *)&self->_flags + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_wrapperLayer, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end
