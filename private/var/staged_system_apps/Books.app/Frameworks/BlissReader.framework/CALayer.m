@implementation CALayer

- (void)addMomentumTiltWithVelocity:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CABasicAnimation *v12;
  CABasicAnimation *v13;
  id v14;

  y = a3.y;
  x = a3.x;
  -[CALayer removeMomentumTiltAnimation](self, "removeMomentumTiltAnimation");
  v6 = TSDPointLength(-[CALayer addPerspectiveProjection](self, "addPerspectiveProjection"), x, y);
  v7 = TSDNormalizePoint(x, y);
  v9 = v8;
  v10 = 1.0;
  if (v6 < 25.0)
    v10 = v6 / 25.0;
  v11 = (v10 + -2.0) * v10 * -0.698131701;
  v12 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.x"));
  -[CABasicAnimation setFromValue:](v12, "setFromValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -(v9 * v11)));
  -[CABasicAnimation setToValue:](v12, "setToValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  -[CABasicAnimation setDuration:](v12, "setDuration:", 0.5);
  -[CABasicAnimation setTimingFunction:](v12, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v13 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  -[CABasicAnimation setFromValue:](v13, "setFromValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 * v11));
  -[CABasicAnimation setToValue:](v13, "setToValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  -[CABasicAnimation setDuration:](v13, "setDuration:", 0.5);
  -[CABasicAnimation setTimingFunction:](v13, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v14 = objc_alloc_init((Class)CAAnimationGroup);
  objc_msgSend(v14, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v13, 0));
  objc_msgSend(v14, "setDuration:", 0.5);
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v14, CFSTR("kTHWFreeTransformControllerMomentumTiltAnimationKey"));
}

- (void)removeMomentumTiltAnimation
{
  -[CALayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("kTHWFreeTransformControllerMomentumTiltAnimationKey"));
}

- (void)copyAnimationsFromLayer:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v5 = objc_msgSend(a3, "animationKeys");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", objc_msgSend(objc_msgSend(a3, "animationForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9)), "copy"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)addPressAnimationFromPoint:(CGPoint)a3 scale:(double)a4
{
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  double width;
  double height;
  double v12;
  double v13;
  CABasicAnimation *v14;
  NSValue *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __n128 v20;
  __n128 v21;
  double v22;
  double v23;
  double v24;
  CABasicAnimation *v25;
  NSValue *v26;
  CABasicAnimation *v27;
  float v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  -[CALayer removeRecoilAnimation](self, "removeRecoilAnimation");
  -[CALayer removeRelaxAnimation](self, "removeRelaxAnimation");
  -[CALayer removePressAnimation](self, "removePressAnimation");
  -[CALayer frame](self, "frame");
  v8 = v31.origin.x;
  v9 = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  v12 = (x - CGRectGetMinX(v31)) / v31.size.width;
  v32.origin.x = v8;
  v32.origin.y = v9;
  v32.size.width = width;
  v32.size.height = height;
  v13 = (y - CGRectGetMinY(v32)) / height;
  v14 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("anchorPoint"));
  v15 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v12, v13);
  -[CABasicAnimation setToValue:](v14, "setToValue:", v15);
  -[CABasicAnimation setFromValue:](v14, "setFromValue:", v15);
  -[CABasicAnimation setDuration:](v14, "setDuration:", 1.0);
  -[CALayer anchorPoint](self, "anchorPoint");
  v17 = v16;
  v19 = v18;
  v20.n128_f64[0] = v12;
  v21.n128_f64[0] = v13;
  v22 = width * TSDSubtractPoints(v20, v21, v17, v19);
  v24 = height * v23;
  v25 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  v26 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v22, v24);
  -[CABasicAnimation setToValue:](v25, "setToValue:", v26);
  -[CABasicAnimation setFromValue:](v25, "setFromValue:", v26);
  -[CABasicAnimation setDuration:](v25, "setDuration:", 0.1);
  -[CABasicAnimation setAdditive:](v25, "setAdditive:", 1);
  v27 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(-[CALayer valueForKeyPath:](self, "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
  v29 = v28 * a4;
  *(float *)&v29 = v29;
  -[CABasicAnimation setToValue:](v27, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29));
  -[CABasicAnimation setDuration:](v27, "setDuration:", 0.1);
  v30 = objc_alloc_init((Class)CAAnimationGroup);
  objc_msgSend(v30, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v25, v27, 0));
  objc_msgSend(v30, "setDuration:", 0.1);
  objc_msgSend(v30, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v30, "setRemovedOnCompletion:", 0);
  objc_msgSend(v30, "setFillMode:", kCAFillModeForwards);
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v30, CFSTR("kTHPressAnimationKey"));
}

- (void)removePressAnimation
{
  -[CALayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("kTHPressAnimationKey"));
}

- (void)addButtonShadow
{
  double v3;
  double v4;

  -[CALayer setShadowColor:](self, "setShadowColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"));
  -[CALayer setShadowOffset:](self, "setShadowOffset:", 0.0, 0.0);
  LODWORD(v3) = 1.0;
  -[CALayer setShadowOpacity:](self, "setShadowOpacity:", v3);
  -[CALayer setShadowRadius:](self, "setShadowRadius:", 0.0);
  LODWORD(v4) = *(_DWORD *)"ff&?";
  -[CALayer setOpacity:](self, "setOpacity:", v4);
}

- (void)removeButtonShadow
{
  double v3;

  -[CALayer setShadowColor:](self, "setShadowColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
  LODWORD(v3) = 1.0;
  -[CALayer setOpacity:](self, "setOpacity:", v3);
}

- (id)p_recoilAnimationFromPoint:(CGPoint)a3 scale:(double)a4 duration:(double)a5 hardRebound:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  float v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double width;
  double height;
  double v19;
  double v20;
  CABasicAnimation *v21;
  NSValue *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __n128 v27;
  __n128 v28;
  double v29;
  double v30;
  double v31;
  CABasicAnimation *v32;
  NSValue *v33;
  CABasicAnimation *v34;
  double v35;
  double v36;
  CAMediaTimingFunctionName v37;
  CAMediaTimingFunctionName v38;
  CABasicAnimation *v39;
  CABasicAnimation *v40;
  id v41;
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect v48;

  v6 = a6;
  y = a3.y;
  x = a3.x;
  objc_msgSend(-[CALayer valueForKeyPath:](self, "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
  v13 = v12;
  v14 = v12 - a4;
  v45 = v13 + v14 * 0.5;
  v46 = v13 + v14 * -0.4;
  v44 = v13 + v14 * -0.3;
  -[CALayer frame](self, "frame");
  v15 = v47.origin.x;
  v16 = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  v19 = (x - CGRectGetMinX(v47)) / v47.size.width;
  v48.origin.x = v15;
  v48.origin.y = v16;
  v48.size.width = width;
  v48.size.height = height;
  v20 = (y - CGRectGetMinY(v48)) / height;
  v21 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("anchorPoint"));
  v22 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, v20);
  -[CABasicAnimation setToValue:](v21, "setToValue:", v22);
  -[CABasicAnimation setFromValue:](v21, "setFromValue:", v22);
  -[CABasicAnimation setDuration:](v21, "setDuration:", 1.0);
  -[CALayer anchorPoint](self, "anchorPoint");
  v24 = v23;
  v26 = v25;
  v27.n128_f64[0] = v19;
  v28.n128_f64[0] = v20;
  v29 = width * TSDSubtractPoints(v27, v28, v24, v26);
  v31 = height * v30;
  v32 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  v33 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v29, v31);
  -[CABasicAnimation setToValue:](v32, "setToValue:", v33);
  -[CABasicAnimation setFromValue:](v32, "setFromValue:", v33);
  -[CABasicAnimation setDuration:](v32, "setDuration:", a5);
  -[CABasicAnimation setAdditive:](v32, "setAdditive:", 1);
  v34 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  -[CABasicAnimation setFromValue:](v34, "setFromValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  if (v6)
    v35 = v46;
  else
    v35 = v44;
  if (v6)
    v36 = v13;
  else
    v36 = v45;
  if (v6)
    v37 = kCAMediaTimingFunctionLinear;
  else
    v37 = kCAMediaTimingFunctionEaseOut;
  if (v6)
    v38 = kCAMediaTimingFunctionEaseOut;
  else
    v38 = kCAMediaTimingFunctionEaseInEaseOut;
  -[CABasicAnimation setToValue:](v34, "setToValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36));
  -[CABasicAnimation setTimingFunction:](v34, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v37));
  -[CABasicAnimation setDuration:](v34, "setDuration:", a5 * 0.5);
  v39 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  -[CABasicAnimation setFromValue:](v39, "setFromValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36));
  -[CABasicAnimation setToValue:](v39, "setToValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v35));
  -[CABasicAnimation setTimingFunction:](v39, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v38));
  -[CABasicAnimation setBeginTime:](v39, "setBeginTime:", a5 * 0.5);
  -[CABasicAnimation setDuration:](v39, "setDuration:", a5 * 0.3);
  v40 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  -[CABasicAnimation setFromValue:](v40, "setFromValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v35));
  -[CABasicAnimation setToValue:](v40, "setToValue:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
  -[CABasicAnimation setTimingFunction:](v40, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  -[CABasicAnimation setBeginTime:](v40, "setBeginTime:", a5 * 0.8);
  -[CABasicAnimation setDuration:](v40, "setDuration:", a5 * 0.2);
  v41 = objc_alloc_init((Class)CAAnimationGroup);
  objc_msgSend(v41, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v21, v32, v34, v39, v40, 0));
  objc_msgSend(v41, "setDuration:", a5);
  objc_msgSend(v41, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v41, "setFillMode:", kCAFillModeForwards);
  return v41;
}

- (void)addRecoilAnimationFromPoint:(CGPoint)a3 hardRebound:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  float v8;
  float v9;
  float v10;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[CALayer removeRecoilAnimation](self, "removeRecoilAnimation");
  objc_msgSend(-[CALayer valueForKeyPath:](self, "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
  v9 = v8;
  if (-[CALayer animationForKey:](self, "animationForKey:", CFSTR("kTHPressAnimationKey")))
  {
    objc_msgSend(-[CALayer valueForKeyPath:](-[CALayer presentationLayer](self, "presentationLayer"), "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
    v9 = v10;
    -[CALayer removePressAnimation](self, "removePressAnimation");
  }
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", -[CALayer p_recoilAnimationFromPoint:scale:duration:hardRebound:](self, "p_recoilAnimationFromPoint:scale:duration:hardRebound:", v4, x, y, v9, 0.2), CFSTR("kTHRecoilAnimationKey"));
}

- (void)removeRecoilAnimation
{
  -[CALayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("kTHRecoilAnimationKey"));
}

- (void)addRelaxAnimationFromPoint:(CGPoint)a3
{
  double y;
  double x;
  float v6;
  float v7;
  float v8;
  CGFloat v9;
  CGFloat v10;
  double width;
  double height;
  double v13;
  double v14;
  CABasicAnimation *v15;
  NSValue *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __n128 v21;
  __n128 v22;
  double v23;
  double v24;
  double v25;
  CABasicAnimation *v26;
  NSValue *v27;
  CABasicAnimation *v28;
  double v29;
  double v30;
  id v31;
  CGRect v32;
  CGRect v33;

  y = a3.y;
  x = a3.x;
  -[CALayer removeRelaxAnimation](self, "removeRelaxAnimation");
  objc_msgSend(-[CALayer valueForKeyPath:](self, "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
  v7 = v6;
  if (-[CALayer animationForKey:](self, "animationForKey:", CFSTR("kTHPressAnimationKey")))
  {
    objc_msgSend(-[CALayer valueForKeyPath:](-[CALayer presentationLayer](self, "presentationLayer"), "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
    v7 = v8;
    -[CALayer removePressAnimation](self, "removePressAnimation");
  }
  -[CALayer frame](self, "frame");
  v9 = v32.origin.x;
  v10 = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  v13 = (x - CGRectGetMinX(v32)) / v32.size.width;
  v33.origin.x = v9;
  v33.origin.y = v10;
  v33.size.width = width;
  v33.size.height = height;
  v14 = (y - CGRectGetMinY(v33)) / height;
  v15 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("anchorPoint"));
  v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, v14);
  -[CABasicAnimation setToValue:](v15, "setToValue:", v16);
  -[CABasicAnimation setFromValue:](v15, "setFromValue:", v16);
  -[CABasicAnimation setDuration:](v15, "setDuration:", 1.0);
  -[CALayer anchorPoint](self, "anchorPoint");
  v18 = v17;
  v20 = v19;
  v21.n128_f64[0] = v13;
  v22.n128_f64[0] = v14;
  v23 = width * TSDSubtractPoints(v21, v22, v18, v20);
  v25 = height * v24;
  v26 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  v27 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v23, v25);
  -[CABasicAnimation setToValue:](v26, "setToValue:", v27);
  -[CABasicAnimation setFromValue:](v26, "setFromValue:", v27);
  -[CABasicAnimation setDuration:](v26, "setDuration:", 0.1);
  -[CABasicAnimation setAdditive:](v26, "setAdditive:", 1);
  v28 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  *(float *)&v29 = v7;
  -[CABasicAnimation setFromValue:](v28, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29));
  v30 = v7 / fabs(v7);
  *(float *)&v30 = v30;
  -[CABasicAnimation setToValue:](v28, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30));
  -[CABasicAnimation setDuration:](v28, "setDuration:", 0.1);
  v31 = objc_alloc_init((Class)CAAnimationGroup);
  objc_msgSend(v31, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v15, v26, v28, 0));
  objc_msgSend(v31, "setDuration:", 0.1);
  objc_msgSend(v31, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v31, "setFillMode:", kCAFillModeForwards);
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v31, CFSTR("kTHRelaxAnimationKey"));
}

- (void)removeRelaxAnimation
{
  -[CALayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("kTHRelaxAnimationKey"));
}

- (void)setFadeMaskWithTopHeight:(double)a3 bottomHeight:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSNumber *v12;
  double v13;
  NSNumber *v14;
  double v15;
  NSNumber *v16;
  double v17;
  id v18;

  v18 = objc_alloc_init((Class)CAGradientLayer);
  -[CALayer frame](self, "frame");
  objc_msgSend(v18, "setFrame:");
  objc_msgSend(v18, "setColors:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"), objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"), objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"), objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"), 0));
  -[CALayer bounds](self, "bounds");
  v8 = a3 / v7;
  -[CALayer bounds](self, "bounds");
  v10 = a4 / v9;
  LODWORD(v11) = 0;
  v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11);
  *(float *)&v13 = v8;
  v14 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13);
  v15 = 1.0 - v10;
  *(float *)&v15 = 1.0 - v10;
  v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15);
  LODWORD(v17) = 1.0;
  objc_msgSend(v18, "setLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v14, v16, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17), 0));
  -[CALayer setMask:](self, "setMask:", v18);

}

- (void)translateToSuperlayer:(id)a3
{
  CALayer *v5;

  v5 = -[CALayer superlayer](self, "superlayer");
  -[CALayer position](self, "position");
  -[CALayer convertPoint:toLayer:](v5, "convertPoint:toLayer:", a3);
  -[CALayer setPosition:](self, "setPosition:");
  objc_msgSend(a3, "addSublayer:", self);
}

- (void)translateToSuperlayer:(id)a3 below:(id)a4
{
  CALayer *v7;

  v7 = -[CALayer superlayer](self, "superlayer");
  -[CALayer position](self, "position");
  -[CALayer convertPoint:toLayer:](v7, "convertPoint:toLayer:", a3);
  -[CALayer setPosition:](self, "setPosition:");
  objc_msgSend(a3, "insertSublayer:below:", self, a4);
}

- (CGPath)tracedShadowPathWithScale:(double)a3
{
  double v5;
  double v6;
  CGContext *v7;
  CGContext *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGImageRef Image;
  CGImage *v18;
  TSDBezierPath *v19;

  -[CALayer bounds](self, "bounds");
  TSDMultiplySizeScalar(v5, v6, a3);
  v7 = (CGContext *)TSDBitmapContextCreate(TSDBitmapContextOptionsCommonFlipped);
  if (!v7)
    goto LABEL_8;
  v8 = v7;
  CGContextScaleCTM(v7, a3, a3);
  v10 = objc_opt_class(UIScrollView, v9);
  *(_QWORD *)&v12 = TSUDynamicCast(v10, -[CALayer delegate](self, "delegate")).n128_u64[0];
  if (v11)
  {
    v13 = v11;
    objc_msgSend(v11, "contentOffset", v12);
    v15 = -v14;
    objc_msgSend(v13, "contentOffset");
    CGContextTranslateCTM(v8, v15, -v16);
  }
  -[CALayer renderInContext:](self, "renderInContext:", v8, v12);
  Image = CGBitmapContextCreateImage(v8);
  if (!Image)
  {
    CGContextRelease(v8);
LABEL_8:
    v19 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize(v7));
    return (CGPath *)-[TSDBezierPath CGPath](v19, "CGPath");
  }
  v18 = Image;
  v19 = (TSDBezierPath *)+[TSDBezierPath tracedPathForImage:alphaThreshold:pointSpacing:](TSDBezierPath, "tracedPathForImage:alphaThreshold:pointSpacing:", Image, 0.5, 2.0);
  CGImageRelease(v18);
  CGContextRelease(v8);
  if (!v19)
    goto LABEL_8;
  return (CGPath *)-[TSDBezierPath CGPath](v19, "CGPath");
}

- (void)spi_setPreloadsCache:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector(self, "setPreloadsCache:", a3) & 1) != 0)
    -[CALayer setPreloadsCache:](self, "setPreloadsCache:", v3);
}

- (void)addCABasicOpacityAnimationToValue:(double)a3 duration:(double)a4 removedOnCompletion:(BOOL)a5
{
  _BOOL8 v5;
  CABasicAnimation *v9;
  double v10;

  v5 = a5;
  v9 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  *(float *)&v10 = a3;
  -[CABasicAnimation setToValue:](v9, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
  if (a4 > 0.0)
    -[CABasicAnimation setDuration:](v9, "setDuration:", a4);
  -[CABasicAnimation setRemovedOnCompletion:](v9, "setRemovedOnCompletion:", v5);
  -[CABasicAnimation setFillMode:](v9, "setFillMode:", kCAFillModeForwards);
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v9, CFSTR("opacity"));
}

- (void)th_accessibilityUndoInvertColorsIfNecessary
{
  _BOOL4 IsInvertColorsEnabled;
  id v4;
  id v5;
  CAFilter *v6;
  id v7;
  uint64_t v8;
  id v9;

  IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  v4 = -[CALayer _th_undoInvertColorsFilter](self, "_th_undoInvertColorsFilter");
  v5 = v4;
  if (IsInvertColorsEnabled)
  {
    if (v4)
      return;
    v6 = +[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorInvert);
    -[CAFilter setName:](v6, "setName:", CFSTR("kTHAXUndoInvertColorsFilter"));
    v7 = -[NSArray mutableCopy](-[CALayer filters](self, "filters"), "mutableCopy");
    if (!v7)
      v7 = (id)objc_opt_new(NSMutableArray, v8);
    v9 = v7;
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    if (!v4)
      return;
    v9 = -[NSArray mutableCopy](-[CALayer filters](self, "filters"), "mutableCopy");
    objc_msgSend(v9, "removeObject:", v5);
  }
  -[CALayer setFilters:](self, "setFilters:", v9);

}

- (id)_th_undoInvertColorsFilter
{
  return -[NSArray tsu_firstObjectPassingTest:](-[CALayer filters](self, "filters"), "tsu_firstObjectPassingTest:", &stru_428FB0);
}

@end
