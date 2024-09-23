@implementation BKLoupeView

- (BKLoupeView)initWithTargetView:(id)a3
{
  id v4;
  BKLoupeView *v5;
  BKLoupeView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLoupeView;
  v5 = -[BKLoupeView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_targetView, v4);
    -[BKLoupeView setOpaque:](v6, "setOpaque:", 0);
    -[BKLoupeView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
  }

  return v6;
}

- (id)p_kitImageWithName:(id)a3
{
  return +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", a3);
}

- (UIImage)loupeMask
{
  UIImage **p_loupeMask;
  id WeakRetained;
  const __CFString *v5;
  void *v6;
  void *v7;

  p_loupeMask = &self->_loupeMask;
  WeakRetained = objc_loadWeakRetained((id *)&self->_loupeMask);

  if (!WeakRetained)
  {
    if (self->_isVertical)
      v5 = CFSTR("Vertical");
    else
      v5 = CFSTR("Horizontal");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RangedMagnifierMask_%@_Normal"), v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView p_kitImageWithName:](self, "p_kitImageWithName:", v6));
    objc_storeWeak((id *)p_loupeMask, v7);

  }
  return (UIImage *)objc_loadWeakRetained((id *)p_loupeMask);
}

- (UIImage)loupeSheen
{
  UIImage **p_loupeSheen;
  id WeakRetained;
  const __CFString *v5;
  void *v6;
  void *v7;

  p_loupeSheen = &self->_loupeSheen;
  WeakRetained = objc_loadWeakRetained((id *)&self->_loupeSheen);

  if (!WeakRetained)
  {
    if (self->_isVertical)
      v5 = CFSTR("Vertical");
    else
      v5 = CFSTR("Horizontal");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RangedMagnifierGlass_%@_Normal"), v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView p_kitImageWithName:](self, "p_kitImageWithName:", v6));
    objc_storeWeak((id *)p_loupeSheen, v7);

  }
  return (UIImage *)objc_loadWeakRetained((id *)p_loupeSheen);
}

- (void)setIsVertical:(BOOL)a3
{
  if (self->_isVertical != a3)
  {
    -[BKLoupeView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isVertical"));
    self->_isVertical = a3;
    -[BKLoupeView resetImages](self, "resetImages");
    -[BKLoupeView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isVertical"));
  }
}

- (void)resetImages
{
  objc_storeWeak((id *)&self->_loupeMask, 0);
  objc_storeWeak((id *)&self->_loupeSheen, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BKLoupeView resetImages](self, "resetImages");
  v3.receiver = self;
  v3.super_class = (Class)BKLoupeView;
  -[BKLoupeView dealloc](&v3, "dealloc");
}

- (double)loupeWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView loupeMask](self, "loupeMask"));
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

- (double)loupeHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView loupeMask](self, "loupeMask"));
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

- (void)dismissAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.0;
  if (a3)
    v3 = 0.25;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_FAA84;
  v4[3] = &unk_1BEA38;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, v3);
}

- (CGPoint)loupePointForPoint:(CGPoint)a3
{
  double y;
  double x;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -[BKLoupeView isVertical](self, "isVertical");
  -[BKLoupeView loupeWidth](self, "loupeWidth");
  if (v6)
  {
    v8 = x - v7;
    -[BKLoupeView loupeHeight](self, "loupeHeight");
    v10 = y + v9 * -0.5;
    v11 = v8 + -18.0;
  }
  else
  {
    v11 = x - floor(v7 * 0.5);
    -[BKLoupeView loupeHeight](self, "loupeHeight");
    v10 = y - v12 + -18.0;
  }
  v13 = v11;
  result.y = v10;
  result.x = v13;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  id v30;
  CGImage *v31;
  CGFloat v32;
  unsigned int v33;
  char v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGContext *v40;
  double v41;
  id WeakRetained;
  void *v43;
  void *v44;
  double v45;
  id v46;
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView superview](self, "superview"));
  -[BKLoupeView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView targetView](self, "targetView"));
  objc_msgSend(v9, "convertRect:toView:", v18, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v45 = v23;
  v46 = v24;

  CGContextSaveGState(CurrentContext);
  -[BKLoupeView loupeWidth](self, "loupeWidth");
  v26 = v25;
  -[BKLoupeView loupeHeight](self, "loupeHeight");
  v28 = v27;
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  -[BKLoupeView loupeHeight](self, "loupeHeight");
  CGContextTranslateCTM(CurrentContext, 0.0, -v29);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKLoupeView loupeMask](self, "loupeMask")));
  v31 = (CGImage *)objc_msgSend(v30, "CGImage");
  v48.origin.x = 0.0;
  v48.origin.y = 0.0;
  v48.size.width = v26;
  v48.size.height = v28;
  CGContextClipToMask(CurrentContext, v48, v31);

  -[BKLoupeView loupeHeight](self, "loupeHeight");
  CGContextTranslateCTM(CurrentContext, 0.0, v32);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v33 = -[BKLoupeView shouldInvertContent](self, "shouldInvertContent");
  v34 = v33;
  if (v33)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView pageColor](self, "pageColor", *(_QWORD *)&v45));
    objc_msgSend(v35, "setFill");

    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    CGContextFillRect(CurrentContext, v49);
  }
  CGContextSaveGState(CurrentContext);
  CGContextScaleCTM(CurrentContext, 1.2, 1.2);
  v36 = -v20;
  if (-[BKLoupeView isVertical](self, "isVertical"))
  {
    -[BKLoupeView loupeWidth](self, "loupeWidth");
    v38 = v36 - v37 + 18.0 + -10.0;
    v39 = -v22;
    v40 = CurrentContext;
  }
  else
  {
    -[BKLoupeView loupeHeight](self, "loupeHeight");
    v39 = -v22 - v41 + 18.0 + -10.0;
    v40 = CurrentContext;
    v38 = v36;
  }
  CGContextTranslateCTM(v40, v38, v39);
  CGContextTranslateCTM(CurrentContext, v45 * -0.2 * 0.5, *(double *)&v46 * -0.2 * 0.5);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  CGContextFillRect(CurrentContext, v50);
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layer"));
  objc_msgSend(v43, "renderInContext:", CurrentContext);

  CGContextRestoreGState(CurrentContext);
  if ((v34 & 1) == 0 && !-[BKLoupeView shouldInvertContent](self, "shouldInvertContent"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView pageColor](self, "pageColor"));
    objc_msgSend(v44, "setFill");

    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    UIRectFillUsingBlendMode(v51, kCGBlendModeMultiply);
  }
  CGContextRestoreGState(CurrentContext);
  v47 = (id)objc_claimAutoreleasedReturnValue(-[BKLoupeView loupeSheen](self, "loupeSheen"));
  objc_msgSend(v47, "drawInRect:", x, y, width, height);

}

- (void)presentAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  double v23;
  double v24;
  _QWORD v25[7];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[BKLoupeView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView superview](self, "superview"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView targetView](self, "targetView"));
  objc_msgSend(v12, "convertPoint:fromView:", v13, x, y);
  -[BKLoupeView loupePointForPoint:](self, "loupePointForPoint:");
  v15 = v14;
  v17 = v16;

  -[BKLoupeView loupeWidth](self, "loupeWidth");
  v19 = v15 + floor(v18 * 0.5);
  -[BKLoupeView loupeHeight](self, "loupeHeight");
  v21 = v20;
  v22 = -[BKLoupeView isVertical](self, "isVertical");
  v23 = fmax(v19, 0.0);
  if (!v22)
    v23 = v19;
  -[BKLoupeView setFrame:](self, "setFrame:", v23, v17 + v21, v9, v11);
  -[BKLoupeView setNeedsDisplay](self, "setNeedsDisplay");
  v25[1] = 3221225472;
  v24 = 0.25;
  v25[0] = _NSConcreteStackBlock;
  if (!v4)
    v24 = 0.0;
  v25[2] = sub_FB014;
  v25[3] = &unk_1BEA60;
  v25[4] = self;
  *(double *)&v25[5] = x;
  *(double *)&v25[6] = y;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v25, v24);
}

- (void)moveToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  double v17;

  y = a3.y;
  x = a3.x;
  -[BKLoupeView frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView superview](self, "superview"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLoupeView targetView](self, "targetView"));
  objc_msgSend(v10, "convertPoint:fromView:", v11, x, y);
  -[BKLoupeView loupePointForPoint:](self, "loupePointForPoint:");
  v13 = v12;
  v15 = v14;

  v16 = -[BKLoupeView isVertical](self, "isVertical");
  v17 = fmax(v13, 0.0);
  if (v16)
    v13 = v17;
  -[BKLoupeView setNeedsDisplay](self, "setNeedsDisplay");
  -[BKLoupeView setFrame:](self, "setFrame:", v13, v15, v7, v9);
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (UIColor)pageColor
{
  return self->_pageColor;
}

- (void)setPageColor:(id)a3
{
  objc_storeStrong((id *)&self->_pageColor, a3);
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_loupeSheen);
  objc_destroyWeak((id *)&self->_loupeMask);
  objc_storeStrong((id *)&self->_pageColor, 0);
  objc_destroyWeak((id *)&self->_targetView);
}

@end
