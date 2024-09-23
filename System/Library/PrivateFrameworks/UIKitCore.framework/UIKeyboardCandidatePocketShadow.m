@implementation UIKeyboardCandidatePocketShadow

+ (double)widthWithShadow:(BOOL)a3
{
  double v3;
  void *v5;
  double v6;

  v3 = 1.0;
  if (a3)
  {
    v3 = 1.5;
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(a1, "leftShadowImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      v3 = v6;

    }
  }
  return v3;
}

+ (id)leftShadowImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)leftShadowImage_image;
  if (!leftShadowImage_image)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("kb-candidate-bar-up-arrow-left-shadow.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)leftShadowImage_image;
    leftShadowImage_image = v3;

    v2 = (void *)leftShadowImage_image;
  }
  return v2;
}

- (void)setDrawsShadow:(BOOL)a3
{
  if (self->_drawsShadow != a3)
  {
    self->_drawsShadow = a3;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIKeyboardCandidatePocketShadow)initWithFrame:(CGRect)a3
{
  UIKeyboardCandidatePocketShadow *v3;
  UIKeyboardCandidatePocketShadow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardCandidatePocketShadow;
  v3 = -[UICollectionReusableView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UIKeyboardCandidatePocketShadow setDrawsShadow:](v4, "setDrawsShadow:", 1);
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  _QWORD *ContextStack;
  CGContext *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGImage *v14;
  void *v15;
  int v16;
  char v17;
  int v18;
  void *v19;
  id v20;
  CGColor *v21;
  void *v22;
  id v23;
  CGColor *v24;
  void *v25;
  id v26;
  CGColor *v27;
  char v28;
  void *v29;
  id v30;
  CGColor *v31;
  id v32;
  CGImage *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat MinY;
  CGFloat Height;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  objc_super v47;
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
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v47.receiver = self;
  v47.super_class = (Class)UIKeyboardCandidatePocketShadow;
  -[UIView drawRect:](&v47, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v5 = 0;
  else
    v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v5);
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (-[UIKeyboardCandidatePocketShadow shadowFadesToBottom](self, "shadowFadesToBottom"))
  {
    v14 = UIKBCreateFadeClipImage(0, 0, v7, v9, v11, v13, v7, v13 * 0.75, v11, v13 * 0.25, 1.0);
    v48.origin.x = v7;
    v48.origin.y = v9;
    v48.size.width = v11;
    v48.size.height = v13;
    CGContextClipToMask(v5, v48, v14);
    v49.origin.x = v7;
    v49.origin.y = v9;
    v49.size.width = v11;
    v49.size.height = v13;
    CGContextClipToMask(v5, v49, v14);
    CGImageRelease(v14);
  }
  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "whiteText");

  if (!-[UIKeyboardCandidatePocketShadow drawsShadow](self, "drawsShadow"))
  {
    if (-[UIKeyboardCandidatePocketShadow showsInDarkBackground](self, "showsInDarkBackground")
      || ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 ? (v28 = v16) : (v28 = 0), (v28 & 1) != 0))
    {
      +[UIColor grayColor](UIColor, "grayColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "colorWithAlphaComponent:", 0.3);
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = (CGColor *)objc_msgSend(v30, "CGColor");

    }
    else
    {
      v31 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha11"));
    }
    v62.origin.x = v7;
    v62.origin.y = v9;
    v62.size.width = v11;
    v62.size.height = v13;
    v40 = CGRectGetMaxX(v62) + -1.0;
    v63.origin.x = v7;
    v63.origin.y = v9;
    v63.size.width = v11;
    v63.size.height = v13;
    MinY = CGRectGetMinY(v63);
    v64.origin.x = v7;
    v64.origin.y = v9;
    v64.size.width = v11;
    v64.size.height = v13;
    Height = CGRectGetHeight(v64);
    CGContextSetFillColorWithColor(v5, v31);
    v43 = 1.0;
    goto LABEL_27;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v17 = v16;
  else
    v17 = 1;
  if ((v17 & 1) != 0)
  {
    CGContextSetAlpha(v5, 0.7);
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v18 = v16;
    else
      v18 = 0;
    if (v18 == 1)
    {
      +[UIColor grayColor](UIColor, "grayColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "colorWithAlphaComponent:", 0.05);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = (CGColor *)objc_msgSend(v20, "CGColor");

      +[UIColor grayColor](UIColor, "grayColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "colorWithAlphaComponent:", 0.11);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = (CGColor *)objc_msgSend(v23, "CGColor");

      +[UIColor grayColor](UIColor, "grayColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "colorWithAlphaComponent:", 0.31);
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = (CGColor *)objc_msgSend(v26, "CGColor");

    }
    else
    {
      v21 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha5"));
      v24 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha11"));
      v27 = (CGColor *)UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha31"));
    }
    v51.origin.x = v7;
    v51.origin.y = v9;
    v51.size.width = v11;
    v51.size.height = v13;
    v34 = CGRectGetMaxX(v51) + -1.5;
    v52.origin.x = v7;
    v52.origin.y = v9;
    v52.size.width = v11;
    v52.size.height = v13;
    v35 = CGRectGetMinY(v52);
    v53.origin.x = v7;
    v53.origin.y = v9;
    v53.size.width = v11;
    v53.size.height = v13;
    v36 = CGRectGetHeight(v53);
    CGContextSetFillColorWithColor(v5, v21);
    v54.size.width = 0.5;
    v54.origin.x = v34;
    v54.origin.y = v35;
    v54.size.height = v36;
    CGContextFillRect(v5, v54);
    v55.origin.x = v7;
    v55.origin.y = v9;
    v55.size.width = v11;
    v55.size.height = v13;
    v37 = CGRectGetMaxX(v55) + -1.0;
    v56.origin.x = v7;
    v56.origin.y = v9;
    v56.size.width = v11;
    v56.size.height = v13;
    v38 = CGRectGetMinY(v56);
    v57.origin.x = v7;
    v57.origin.y = v9;
    v57.size.width = v11;
    v57.size.height = v13;
    v39 = CGRectGetHeight(v57);
    CGContextSetFillColorWithColor(v5, v24);
    v58.size.width = 0.5;
    v58.origin.x = v37;
    v58.origin.y = v38;
    v58.size.height = v39;
    CGContextFillRect(v5, v58);
    v59.origin.x = v7;
    v59.origin.y = v9;
    v59.size.width = v11;
    v59.size.height = v13;
    v40 = CGRectGetMaxX(v59) + -0.5;
    v60.origin.x = v7;
    v60.origin.y = v9;
    v60.size.width = v11;
    v60.size.height = v13;
    MinY = CGRectGetMinY(v60);
    v61.origin.x = v7;
    v61.origin.y = v9;
    v61.size.width = v11;
    v61.size.height = v13;
    Height = CGRectGetHeight(v61);
    CGContextSetFillColorWithColor(v5, v27);
    v43 = 0.5;
LABEL_27:
    v44 = v40;
    v45 = MinY;
    v46 = Height;
    CGContextFillRect(v5, *(CGRect *)(&v43 - 2));
    goto LABEL_28;
  }
  objc_msgSend((id)objc_opt_class(), "leftShadowImage");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v33 = (CGImage *)objc_msgSend(v32, "CGImage");
  v50.origin.x = v7;
  v50.origin.y = v9;
  v50.size.width = v11;
  v50.size.height = v13;
  CGContextDrawImage(v5, v50, v33);

LABEL_28:
  CGContextRestoreGState(v5);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIKeyboardCandidatePocketShadow setDrawsShadow:](self, "setDrawsShadow:", objc_msgSend(v4, "drawsShadow"));

}

- (BOOL)shadowFadesToBottom
{
  return self->_shadowFadesToBottom;
}

- (void)setShadowFadesToBottom:(BOOL)a3
{
  self->_shadowFadesToBottom = a3;
}

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (BOOL)showsInDarkBackground
{
  return self->_showsInDarkBackground;
}

- (void)setShowsInDarkBackground:(BOOL)a3
{
  self->_showsInDarkBackground = a3;
}

@end
