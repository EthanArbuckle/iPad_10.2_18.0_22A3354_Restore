@implementation UIKeyboardCandidateViewImageRenderer

- (UIKeyboardCandidateViewImageRenderer)init
{
  UIKeyboardCandidateViewImageRenderer *v2;
  NSCache *v3;
  NSCache *imageCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardCandidateViewImageRenderer;
  v2 = -[UIKeyboardCandidateViewImageRenderer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

  }
  return v2;
}

+ (id)sharedImageRenderer
{
  if (_MergedGlobals_1104 != -1)
    dispatch_once(&_MergedGlobals_1104, &__block_literal_global_302);
  return (id)qword_1ECD7E9C8;
}

void __59__UIKeyboardCandidateViewImageRenderer_sharedImageRenderer__block_invoke()
{
  UIKeyboardCandidateViewImageRenderer *v0;
  void *v1;

  v0 = objc_alloc_init(UIKeyboardCandidateViewImageRenderer);
  v1 = (void *)qword_1ECD7E9C8;
  qword_1ECD7E9C8 = (uint64_t)v0;

}

- (id)highlightedBarCellBackgroundImageWithColor:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  UIKeyboardCandidateViewImageRenderer *v29;
  id v30;
  uint64_t *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  UIEdgeInsets v42;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = 257 * objc_msgSend(v9, "hash");
  -[UIKeyboardCandidateViewImageRenderer viewForTraitCollection](self, "viewForTraitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash") + v11;
  v42.top = top;
  v42.left = left;
  v42.bottom = bottom;
  v42.right = right;
  NSStringFromUIEdgeInsets(v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("HBCB_%lld_%@"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__117;
  v40 = __Block_byref_object_dispose__117;
  -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v16);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  v18 = (void *)v37[5];
  if (v18)
  {
    v19 = v18;
  }
  else
  {
    -[UIKeyboardCandidateViewImageRenderer viewForTraitCollection](self, "viewForTraitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      +[UITraitCollection _fallbackTraitCollection]();
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    objc_msgSend(v24, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", 1, 0x1E1A99588);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __90__UIKeyboardCandidateViewImageRenderer_highlightedBarCellBackgroundImageWithColor_insets___block_invoke;
    v27[3] = &unk_1E16CCA40;
    v32 = top;
    v33 = left;
    v34 = bottom;
    v35 = right;
    v31 = &v36;
    v28 = v9;
    v29 = self;
    v30 = v16;
    +[UITraitCollection _performWithCurrentTraitCollection:usingBlock:]((uint64_t)UITraitCollection, (uint64_t)v25, (uint64_t)v27);
    v19 = (id)v37[5];

  }
  _Block_object_dispose(&v36, 8);

  return v19;
}

void __90__UIKeyboardCandidateViewImageRenderer_highlightedBarCellBackgroundImageWithColor_insets___block_invoke(uint64_t a1)
{
  double v8;
  _QWORD *ContextStack;
  CGContext *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18[2];
  id v19;

  __asm
  {
    FMOV            V0.2D, #10.0
    FMOV            V1.2D, #1.0
  }
  *(float64x2_t *)v18 = vaddq_f64(vaddq_f64(vaddq_f64(*(float64x2_t *)(a1 + 64), _Q0), *(float64x2_t *)(a1 + 80)), _Q1);
  v8 = UIKBScale();
  _UIGraphicsBeginImageContextWithOptions(0, 0, *(CGFloat *)&v18[1], *(CGFloat *)v18, v8);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v10 = 0;
  else
    v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSetFillColorWithColor(v10, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, *(double *)(a1 + 72), *(double *)(a1 + 64), 11.0, 11.0, 5.0, 5.0);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(v10, (CGPathRef)objc_msgSend(v19, "CGPath"));
  CGContextFillPath(v10);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  UIGraphicsEndImageContext();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "resizableImageWithCapInsets:resizingMode:", 1, *(double *)(a1 + 64) + 5.0, *(double *)(a1 + 72) + 5.0, *(double *)(a1 + 80) + 5.0, *(double *)(a1 + 88) + 5.0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(a1 + 40), "imageCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));

}

- (id)separatorImageWithColor:(id)a3 height:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _QWORD *ContextStack;
  CGContext *v16;
  void *v17;
  id v18;
  CGRect v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = 257 * objc_msgSend(v6, "hash");
  -[UIKeyboardCandidateViewImageRenderer viewForTraitCollection](self, "viewForTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SI_%lld_%g"), objc_msgSend(v10, "hash") + v8, *(_QWORD *)&a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = UIKBScale();
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0, a4, v14);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v16 = 0;
    else
      v16 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSetFillColorWithColor(v16, (CGColorRef)objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = 1.0;
    v20.size.height = a4;
    CGContextFillRect(v16, v20);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v13, v11);

  }
  v18 = v13;

  return v18;
}

- (id)pocketShadowImageForDarkKeyboard:(BOOL)a3 fadesToBottom:(BOOL)a4 drawShadow:(BOOL)a5 topPadding:(double)a6 bottomPadding:(double)a7 height:(double)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v13;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  _QWORD *ContextStack;
  CGContext *v24;
  double v25;
  CGImage *v26;
  void *v27;
  id v28;
  CGColor *v29;
  void *v30;
  id v31;
  CGColor *v32;
  void *v33;
  id v34;
  CGColor *v35;
  void *v36;
  id v37;
  CGColor *v38;
  CGFloat v39;
  CGFloat MinY;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  id v46;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v8 = a5;
  v9 = a4;
  v13 = a3;
  if (a4)
    v15 = 2;
  else
    v15 = 0;
  v16 = v15 | a3;
  if (a5)
    v17 = 4;
  else
    v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PSI_%d_%g_%g_%g"), v16 | v17, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = 1.0;
    if (v8)
    {
      v21 = 2.0;
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        if (UIKBScale() == 3.0)
          v21 = 2.0;
        else
          v21 = 1.5;
      }
    }
    v22 = UIKBScale();
    _UIGraphicsBeginImageContextWithOptions(0, 0, v21, a8, v22);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v24 = 0;
    else
      v24 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    v25 = a8 - a6 - a7;
    if (v9)
    {
      v26 = UIKBCreateFadeClipImage(0, 0, 0.0, a6, v21, a8, 0.0, v25 * 0.75 + a6, v21, v25 * 0.25, 1.0);
      v48.origin.x = 0.0;
      v48.origin.y = a6;
      v48.size.width = v21;
      v48.size.height = a8;
      CGContextClipToMask(v24, v48, v26);
      v49.origin.x = 0.0;
      v49.origin.y = a6;
      v49.size.width = v21;
      v49.size.height = a8;
      CGContextClipToMask(v24, v49, v26);
      CGImageRelease(v26);
    }
    if (v8)
    {
      CGContextSetAlpha(v24, 0.7);
      if (v13)
      {
        +[UIColor grayColor](UIColor, "grayColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "colorWithAlphaComponent:", 0.05);
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29 = (CGColor *)objc_msgSend(v28, "CGColor");

        +[UIColor grayColor](UIColor, "grayColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "colorWithAlphaComponent:", 0.11);
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v32 = (CGColor *)objc_msgSend(v31, "CGColor");

        +[UIColor grayColor](UIColor, "grayColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "colorWithAlphaComponent:", 0.31);
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = (CGColor *)objc_msgSend(v34, "CGColor");

      }
      else
      {
        v29 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha5"));
        v32 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha11"));
        v35 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha31"));
      }
      v50.origin.x = 0.0;
      v50.origin.y = a6;
      v50.size.width = v21;
      v50.size.height = a8;
      v39 = CGRectGetMaxX(v50) - v21;
      v51.origin.x = 0.0;
      v51.origin.y = a6;
      v51.size.width = v21;
      v51.size.height = a8;
      MinY = CGRectGetMinY(v51);
      CGContextSetFillColorWithColor(v24, v29);
      v52.origin.x = v39;
      v52.origin.y = MinY;
      v52.size.width = v21 / 3.0;
      v52.size.height = v25;
      CGContextFillRect(v24, v52);
      v53.origin.x = 0.0;
      v53.origin.y = a6;
      v53.size.width = v21;
      v53.size.height = a8;
      v41 = CGRectGetMaxX(v53) - (v21 + v21) / 3.0;
      v54.origin.x = 0.0;
      v54.origin.y = a6;
      v54.size.width = v21;
      v54.size.height = a8;
      v42 = CGRectGetMinY(v54);
      CGContextSetFillColorWithColor(v24, v32);
      v55.origin.x = v41;
      v55.origin.y = v42;
      v55.size.width = v21 / 3.0;
      v55.size.height = v25;
      CGContextFillRect(v24, v55);
      v56.origin.x = 0.0;
      v56.origin.y = a6;
      v56.size.width = v21;
      v56.size.height = a8;
      v43 = CGRectGetMaxX(v56) - v21 / 3.0;
      v57.origin.x = 0.0;
      v57.origin.y = a6;
      v57.size.width = v21;
      v57.size.height = a8;
      v44 = CGRectGetMinY(v57);
      CGContextSetFillColorWithColor(v24, v35);
      v21 = v21 / 3.0;
    }
    else
    {
      if (v13)
      {
        +[UIColor grayColor](UIColor, "grayColor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "colorWithAlphaComponent:", 0.3);
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v38 = (CGColor *)objc_msgSend(v37, "CGColor");

      }
      else
      {
        v38 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha11"));
      }
      v43 = 0.0;
      v58.origin.x = 0.0;
      v58.origin.y = a6;
      v58.size.width = v21;
      v58.size.height = a8;
      v44 = CGRectGetMinY(v58);
      CGContextSetFillColorWithColor(v24, v38);
    }
    v59.origin.x = v43;
    v59.origin.y = v44;
    v59.size.width = v21;
    v59.size.height = v25;
    CGContextFillRect(v24, v59);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKey:", v20, v18);

  }
  v46 = v20;

  return v46;
}

- (id)handwritingCellBackgroundImageForDarkKeyboard:(BOOL)a3 highlighted:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  UIKBRenderFactory_Candidates *v14;
  void *v15;
  UIKBRenderFactory_Candidates *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a4;
  v5 = a3;
  if (a4)
    v7 = 2;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HWRCB_%d"), v7 | a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    if (v5)
      v12 = 1;
    else
      v12 = 2;
    +[UIKBRenderConfig configForAppearance:inputMode:traitEnvironment:](UIKBRenderConfig, "configForAppearance:inputMode:traitEnvironment:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [UIKBRenderFactory_Candidates alloc];
    +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[UIKBRenderFactory_Candidates initWithRenderingContext:](v14, "initWithRenderingContext:", v15);

    -[UIKBRenderFactory_Candidates traitsForHWRCellSize:highlighted:](v16, "traitsForHWRCellSize:highlighted:", v4, 2.0, 42.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = UIKBScale();
    +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 3, UIKeyboardGetCurrentIdiom(), 2.0, 42.0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisableInternalCaching:", 1);
    objc_msgSend(v19, "renderBackgroundTraits:", v17);
    objc_msgSend(v19, "renderedImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 0.0, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v21, v8);

    v11 = v21;
  }

  return v11;
}

- (id)extensionMaskImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EXTM"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIKeyboardCandidateViewImageRenderer drawGradientImage:startPoint:endPoint:applyScale:](self, "drawGradientImage:startPoint:endPoint:applyScale:", 0, 0.0, 0.0, 1.0, 80.0, 0.0, 0.0, 0.0, 80.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v3);

  }
  v7 = v5;

  return v7;
}

- (id)edgeMaskImageForRightSide:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = CFSTR("Left");
  if (a3)
    v5 = CFSTR("Right");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SEP-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (v3)
      v9 = 20.0;
    else
      v9 = 0.0;
    if (v3)
      v10 = 0.0;
    else
      v10 = 20.0;
    -[UIKeyboardCandidateViewImageRenderer drawGradientImage:startPoint:endPoint:applyScale:](self, "drawGradientImage:startPoint:endPoint:applyScale:", 1, 0.0, 0.0, 20.0, 1.0, v9, 0.0, v10, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewImageRenderer imageCache](self, "imageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v6);

  }
  v12 = v8;

  return v12;
}

- (id)drawGradientImage:(CGRect)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 applyScale:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat x;
  CGFloat y;
  CGFloat v9;
  double height;
  double width;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGColor *v15;
  CGColorRef v16;
  CGContext *v17;
  const __CFArray *v18;
  CGGradient *v19;
  CGImage *Image;
  double v21;
  void *v22;
  CGFloat endPoint;
  CGAffineTransform transform;
  CGFloat v26[2];
  __int128 v27;
  CGFloat components[2];
  __int128 v29;
  uint64_t v30;
  CGPoint v31;
  CGPoint v32;
  CGRect v33;

  v6 = a6;
  endPoint = a5.y;
  x = a5.x;
  y = a4.y;
  v9 = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  if (!drawGradientImage_startPoint_endPoint_applyScale__colorspace)
    drawGradientImage_startPoint_endPoint_applyScale__colorspace = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D988]);
  v14 = UIKBScale();
  *(_OWORD *)components = 0u;
  v29 = 0u;
  v15 = CGColorCreate((CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, components);
  *(_OWORD *)v26 = xmmword_18667F4D0;
  v27 = unk_18667F4E0;
  v16 = CGColorCreate((CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, v26);
  v17 = CGBitmapContextCreate(0, (unint64_t)(width * v14), (unint64_t)(height * v14), 8uLL, 4 * (unint64_t)(width * v14), (CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, 2u);
  CGAffineTransformMakeScale(&transform, v14, v14);
  CGContextConcatCTM(v17, &transform);
  CGContextSetFillColorWithColor(v17, v15);
  v33.origin.x = v13;
  v33.origin.y = v12;
  v33.size.width = width;
  v33.size.height = height;
  CGContextFillRect(v17, v33);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v15, v16, 0);
  v18 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  v19 = CGGradientCreateWithColors((CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, v18, 0);
  v31.x = v9;
  v31.y = y;
  v32.x = x;
  v32.y = endPoint;
  CGContextDrawLinearGradient(v17, v19, v31, v32, 0);
  CGGradientRelease(v19);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  v21 = 1.0;
  if (v6)
    v21 = v14;
  +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);

  return v22;
}

- (UIView)viewForTraitCollection
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewForTraitCollection);
}

- (void)setViewForTraitCollection:(id)a3
{
  objc_storeWeak((id *)&self->_viewForTraitCollection, a3);
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_destroyWeak((id *)&self->_viewForTraitCollection);
}

@end
