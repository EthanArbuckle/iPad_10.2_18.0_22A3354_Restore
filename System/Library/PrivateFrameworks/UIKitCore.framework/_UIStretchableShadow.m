@implementation _UIStretchableShadow

+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4
{
  return (CGImage *)objc_msgSend(a1, "shadowWithRadius:cornerRadius:isContinuousCorner:white:", 0, a3, a4, 0.0);
}

+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4 white:(double)a5
{
  return (CGImage *)objc_msgSend(a1, "shadowWithRadius:cornerRadius:isContinuousCorner:white:", 0, a3, a4, a5);
}

+ (CGImage)shadowWithRadius:(double)a3 cornerRadius:(double)a4 isContinuousCorner:(BOOL)a5 white:(double)a6
{
  _BOOL8 v7;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  if (_MergedGlobals_955 != -1)
    dispatch_once(&_MergedGlobals_955, &__block_literal_global_46);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f-%f-%f"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7CC68, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a6, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_generateShadowWithRadius:cornerRadius:isContinuousCorner:color:", v7, v13, a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "CGImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD7CC68, "setObject:forKey:", v12, v11);

  }
  return (CGImage *)v12;
}

+ (id)_generateShadowWithRadius:(double)a3 cornerRadius:(double)a4 isContinuousCorner:(BOOL)a5 color:(id)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  CGColor *v12;
  _QWORD *ContextStack;
  CGContext *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  CGSize v20;
  CGRect v21;

  v8 = a3 + a3;
  v9 = a3 + a3 + a4 + a3 + a3 + a4;
  v11 = a3 + a3 + v9;
  v12 = (CGColor *)objc_msgSend(objc_retainAutorelease(a6), "CGColor");
  _UIGraphicsBeginImageContextWithOptions(0, 0, v8 + v8 + v9, v8 + v8 + v9, 1.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v14 = 0;
  else
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v10 = v8 + v8 + v9;
  v15 = (v10 - v9) * 0.5;
  v20.width = 0.0;
  v20.height = v11;
  CGContextSetShadowWithColor(v14, v20, v8, v12);
  CGContextSetFillColorWithColor(v14, v12);
  if (a4 <= 0.0)
  {
    v21.origin.x = (v10 - v9) * 0.5;
    v21.origin.y = -v9;
    v21.size.width = v9;
    v21.size.height = v9;
    CGContextFillRect(v14, v21);
  }
  else
  {
    v16 = -v9;
    if (a5)
      +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, v15, v16, v9, v9, a4, a4);
    else
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v15, v16, v9, v9, a4);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextAddPath(v14, (CGPathRef)objc_msgSend(v17, "CGPath"));
    CGContextFillPath(v14);

  }
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v18;
}

@end
