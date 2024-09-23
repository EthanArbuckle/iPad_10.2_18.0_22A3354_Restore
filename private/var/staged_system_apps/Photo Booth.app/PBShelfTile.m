@implementation PBShelfTile

+ (id)imageFormat
{
  return objc_msgSend(+[PLFormatChooser defaultFormatChooser](PLFormatChooser, "defaultFormatChooser"), "indexSheetUnbakedFormat");
}

+ (double)borderWidth
{
  return 4.0;
}

+ (id)selectionBadgeImage
{
  return +[UIImage pu_PhotosUIImageNamed:](UIImage, "pu_PhotosUIImageNamed:", CFSTR("BlueCheckSelected.png"));
}

- (PBShelfTile)initWithFrame:(CGRect)a3
{
  PBShelfTile *v3;
  id v4;
  UIImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBShelfTile;
  v3 = -[PBShelfTile initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PBShelfTile initializeState](v3, "initializeState");
  v4 = objc_alloc((Class)UIImageView);
  -[PBShelfTile bounds](v3, "bounds");
  v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
  v3->_imageView = v5;
  -[UIImageView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
  -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
  -[UIImageView setOpaque:](v3->_imageView, "setOpaque:", 1);
  objc_msgSend(-[UIImageView layer](v3->_imageView, "layer"), "setBorderColor:", -[UIColor CGColor](+[UIColor systemBlueColor](UIColor, "systemBlueColor"), "CGColor"));
  -[PBShelfTile addSubview:](v3, "addSubview:", v3->_imageView);

  -[PBShelfTile setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
  return v3;
}

- (void)initializeState
{
  *((_BYTE *)self + 104) |= 2u;
  *((_BYTE *)self + 104) &= ~4u;
  *((_BYTE *)self + 104) &= ~8u;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBShelfTile;
  -[PBShelfTile dealloc](&v3, "dealloc");
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v3;

  if ((*((_BYTE *)self + 104) & 0x20) != 0)
  {
    -[UIView setCenter:](self->_printingView, "setCenter:", a3.x, a3.y);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)PBShelfTile;
    -[PBShelfTile setCenter:](&v3, "setCenter:", a3.x, a3.y);
  }
}

- (CGPoint)center
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  if ((*((_BYTE *)self + 104) & 0x20) != 0)
  {
    -[UIView center](self->_printingView, "center");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PBShelfTile;
    -[PBShelfTile center](&v4, "center");
  }
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  unsigned int v5;
  BOOL result;
  uint64_t v7;

  objc_msgSend(a3, "locationInView:", self, a4);
  v5 = -[PBShelfTile cornerAtPoint:](self, "cornerAtPoint:");
  result = 1;
  if (v5 != -1)
  {
    v7 = 1 << (v5 + 24);
    if (-[PBShelfTile _hasActionsForControlEvent:](self, "_hasActionsForControlEvent:", v7))
    {
      -[PBShelfTile sendActionsForControlEvents:](self, "sendActionsForControlEvents:", v7);
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  unsigned int v7;
  objc_super v8;

  objc_msgSend(a3, "locationInView:", self);
  v7 = -[PBShelfTile cornerAtPoint:](self, "cornerAtPoint:");
  if (v7 == -1)
  {
    v8.receiver = self;
    v8.super_class = (Class)PBShelfTile;
    -[PBShelfTile endTrackingWithTouch:withEvent:](&v8, "endTrackingWithTouch:withEvent:", a3, a4);
  }
  else
  {
    -[PBShelfTile sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 251658241 << v7);
  }
}

- (int)cornerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  UIImageView **cornerViews;
  UIImageView *v8;

  y = a3.y;
  x = a3.x;
  v6 = 0;
  cornerViews = self->_cornerViews;
  while (1)
  {
    v8 = cornerViews[v6];
    if (v8)
    {
      -[UIImageView convertPoint:fromView:](cornerViews[v6], "convertPoint:fromView:", self, x, y);
      if ((-[UIImageView pointInside:withEvent:](v8, "pointInside:withEvent:", 0) & 1) != 0)
        break;
    }
    if (++v6 == 4)
    {
      LODWORD(v6) = -1;
      return v6;
    }
  }
  return v6;
}

- (BOOL)_hasActionsForControlEvent:(unint64_t)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[PBShelfTile allTargets](self, "allTargets");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v12.receiver = self;
        v12.super_class = (Class)PBShelfTile;
        if (-[PBShelfTile actionsForTarget:forControlEvent:](&v12, "actionsForTarget:forControlEvent:", v10, a3))
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return (char)v6;
}

- (void)animatePrinting:(id)a3
{
  _QWORD v5[10];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  self->_printAnimationDelegate = 0;
  if ((objc_opt_respondsToSelector(a3, "tileDidFinishPrintAnimation:") & 1) != 0)
  {
    self->_printAnimationDelegate = a3;
  }
  else if (a3)
  {
    NSLog(CFSTR("Print completion delegate must implement -tileDidFinishPrintAnimation:."));
  }
  -[PBShelfTile _prepareForPrintAnimation](self, "_prepareForPrintAnimation");
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000123E4;
  v11[3] = &unk_100034A48;
  v11[4] = self;
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001255C;
  v10[3] = &unk_100034A70;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012574;
  v9[3] = &unk_100034A48;
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000126AC;
  v8[3] = &unk_100034A70;
  v8[4] = self;
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000126EC;
  v7[3] = &unk_100034A48;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000127C0;
  v6[3] = &unk_100034A70;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000127D8;
  v5[3] = &unk_100034DF8;
  v5[4] = v11;
  v5[5] = v10;
  v5[6] = v9;
  v5[7] = v8;
  v5[8] = v7;
  v5[9] = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v5, &stru_100034E38, 2.77, 0.0);
}

- (void)_prepareForPrintAnimation
{
  id v3;
  UIView *v4;
  double MaxY;
  CGFloat MinY;
  __int128 v7;
  CALayer *v8;
  double v9;
  CALayer *v10;
  double v11;
  CALayer *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;

  if ((*((_BYTE *)self + 104) & 0x20) == 0)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v3 = objc_alloc((Class)UIView);
    -[PBShelfTile frame](self, "frame");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    self->_printingView = v4;
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(-[PBShelfTile superview](self, "superview"), "insertSubview:aboveSubview:", self->_printingView, self);

    -[PBShelfTile frame](self, "frame");
    MaxY = CGRectGetMaxY(v15);
    objc_msgSend(-[PBShelfTile superview](self, "superview"), "bounds");
    MinY = CGRectGetMinY(v16);
    v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v13.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v13.c = v7;
    *(_OWORD *)&v13.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformTranslate(&v14, &v13, 0.0, -(MaxY - MinY));
    -[PBShelfTile setTransform:](self, "setTransform:", &v14);
    -[UIView addSubview:](self->_printingView, "addSubview:", self);
    -[CALayer removeFromSuperlayer](self->_printerSlotLayer, "removeFromSuperlayer");
    v8 = +[CALayer layer](CALayer, "layer");
    self->_printerSlotLayer = v8;
    -[CALayer setContentsGravity:](v8, "setContentsGravity:", kCAGravityBottom);
    LODWORD(v9) = 0;
    -[CALayer setOpacity:](self->_printerSlotLayer, "setOpacity:", v9);
    -[CALayer removeFromSuperlayer](self->_slotShadowLayer, "removeFromSuperlayer");
    v10 = +[CALayer layer](CALayer, "layer");
    self->_slotShadowLayer = v10;
    -[CALayer setContentsGravity:](v10, "setContentsGravity:", kCAGravityBottom);
    LODWORD(v11) = 0;
    -[CALayer setOpacity:](self->_slotShadowLayer, "setOpacity:", v11);
    v12 = -[UIView layer](self->_printingView, "layer");
    -[CALayer addSublayer:](v12, "addSublayer:", self->_printerSlotLayer);
    -[CALayer addSublayer:](v12, "addSublayer:", self->_slotShadowLayer);
    -[PBShelfTile _updatePrintAnimationLayout](self, "_updatePrintAnimationLayout");
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)_updatePrintAnimationLayout
{
  const __CFString *v3;
  const __CFString *v4;
  double v5;
  double v6;
  UIImage *v7;
  UIImage *v8;
  double Center;
  double v10;
  double v11;
  CALayer *printerSlotLayer;
  CALayer *slotShadowLayer;

  if ((*((_BYTE *)self + 104) & 1) != 0)
    v3 = CFSTR("PBStripSlot-Landscape");
  else
    v3 = CFSTR("PBStripSlot-Portrait");
  if ((*((_BYTE *)self + 104) & 1) != 0)
    v4 = CFSTR("PBStripSlotShadow-Landscape");
  else
    v4 = CFSTR("PBStripSlotShadow-Portrait");
  if ((*((_BYTE *)self + 104) & 1) != 0)
    v5 = 110.0;
  else
    v5 = 120.0;
  if ((*((_BYTE *)self + 104) & 1) != 0)
    v6 = 108.0;
  else
    v6 = 118.0;
  v7 = +[UIImage imageNamed:](UIImage, "imageNamed:", v3);
  v8 = +[UIImage imageNamed:](UIImage, "imageNamed:", v4);
  Center = UIRectGetCenter(0.0, 0.0, v5, v6);
  v11 = v10;
  -[UIView setBounds:](self->_printingView, "setBounds:", 0.0, 0.0, v5, v6);
  -[PBShelfTile setCenter:](self, "setCenter:", Center, v11);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CALayer setBounds:](self->_printerSlotLayer, "setBounds:", 0.0, 0.0, v5, v6);
  -[CALayer setPosition:](self->_printerSlotLayer, "setPosition:", Center, v11);
  -[CALayer setContents:](self->_printerSlotLayer, "setContents:", -[UIImage CGImage](v7, "CGImage"));
  printerSlotLayer = self->_printerSlotLayer;
  -[UIImage scale](v7, "scale");
  -[CALayer setContentsScale:](printerSlotLayer, "setContentsScale:");
  -[CALayer setBounds:](self->_slotShadowLayer, "setBounds:", 0.0, 0.0, v5, v6);
  -[CALayer setPosition:](self->_slotShadowLayer, "setPosition:", Center, v11);
  -[CALayer setContents:](self->_slotShadowLayer, "setContents:", -[UIImage CGImage](v8, "CGImage"));
  slotShadowLayer = self->_slotShadowLayer;
  -[UIImage scale](v8, "scale");
  -[CALayer setContentsScale:](slotShadowLayer, "setContentsScale:");
  +[CATransaction commit](CATransaction, "commit");
}

- (void)animationDidStart:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("animationID")), "unsignedIntegerValue") == (id)1)
    *((_BYTE *)self + 104) |= 0x20u;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  __int128 v5;
  _OWORD v6[3];

  if (objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("animationID"), a4), "unsignedIntegerValue") == (id)1)
  {
    *((_BYTE *)self + 104) &= ~0x20u;
    -[UIView center](self->_printingView, "center");
    -[PBShelfTile setCenter:](self, "setCenter:");
    -[UIView insertSubview:belowSubview:](-[UIView superview](self->_printingView, "superview"), "insertSubview:belowSubview:", self, self->_printingView);
    -[UIView removeFromSuperview](self->_printingView, "removeFromSuperview");
    self->_printingView = 0;
    self->_printerSlotLayer = 0;
    self->_slotShadowLayer = 0;
    v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v6[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v6[1] = v5;
    v6[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[PBShelfTile setTransform:](self, "setTransform:", v6);
  }
}

- (void)setIconFromAsset:(id)a3 maxIconSizeInPixels:(CGSize)a4
{
  double height;
  double width;
  id v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v8 = objc_msgSend(a3, "pl_managedAsset");
  if (v8 && (v9 = v8, objc_msgSend(v8, "isInFlight")))
  {
    v10 = objc_msgSend(v9, "inflightImage");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v10 = -[PHImageManager synchronousImageForAsset:targetSize:contentMode:options:](+[PHImageManager defaultManager](PHImageManager, "defaultManager"), "synchronousImageForAsset:targetSize:contentMode:options:", v6, 1, 0, width, height);
  }
  v6 = v10;
LABEL_7:
  if (objc_msgSend(v6, "imageOrientation"))
  {
    v11 = objc_alloc((Class)UIImage);
    v12 = objc_msgSend(v6, "CGImage");
    objc_msgSend(v6, "scale");
    v6 = objc_msgSend(v11, "initWithCGImage:scale:orientation:", v12, 0);
  }
  -[UIImageView setImage:](self->_imageView, "setImage:", v6);
}

- (id)icon
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setShowsBadge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 104) = *((_BYTE *)self + 104) & 0xFD | v3;
  -[UIImageView setHidden:](self->_cornerViews[3], "setHidden:", !a3);
}

- (BOOL)showsBadge
{
  return (*((unsigned __int8 *)self + 104) >> 1) & 1;
}

- (void)setShowsShadow:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  char v7;
  char v8;
  double v9;
  CGPath *Mutable;
  CGRect v11;

  if (((((*((_BYTE *)self + 104) & 4) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    v5 = -[PBShelfTile layer](self, "layer");
    v6 = v5;
    v7 = *((_BYTE *)self + 104);
    if ((v7 & 4) != 0)
    {
      objc_msgSend(v5, "setShadowPath:", 0);
      v7 = *((_BYTE *)self + 104);
    }
    if (v3)
      v8 = 4;
    else
      v8 = 0;
    *((_BYTE *)self + 104) = v7 & 0xFB | v8;
    if (v3)
    {
      objc_msgSend(v6, "setShadowColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
      objc_msgSend(v6, "setShadowOffset:", 0.0, 4.0);
      LODWORD(v9) = 1060320051;
      objc_msgSend(v6, "setShadowOpacity:", v9);
      objc_msgSend(v6, "setShadowRadius:", 4.0);
      Mutable = CGPathCreateMutable();
      objc_msgSend(v6, "bounds");
      CGPathAddRect(Mutable, 0, v11);
      objc_msgSend(v6, "setShadowPath:", Mutable);
      CGPathRelease(Mutable);
    }
  }
}

- (BOOL)showsShadow
{
  return (*((unsigned __int8 *)self + 104) >> 2) & 1;
}

- (void)setSmallSize:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 104);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 104) = v3 & 0xFE | a3;
    if ((*((_BYTE *)self + 104) & 0x20) != 0)
      -[PBShelfTile _updatePrintAnimationLayout](self, "_updatePrintAnimationLayout");
  }
}

- (BOOL)isSmallSize
{
  return *((_BYTE *)self + 104) & 1;
}

- (void)setIcon:(id)a3 inCorner:(int)a4 offset:(CGSize)a5
{
  UIImageView **cornerViews;
  uint64_t v8;
  UIImageView *v9;
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat y;
  CGFloat v15;
  CGFloat v16;
  double MinX;
  double MinY;
  double v19;
  uint64_t v20;
  double v21;
  _BOOL8 v22;
  UIImageView *v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  cornerViews = self->_cornerViews;
  v8 = a4;
  v9 = self->_cornerViews[a4];
  if (a3)
  {
    if (v9)
    {
      -[UIImageView setImage:](v9, "setImage:", a3, a5.width, a5.height);
    }
    else
    {
      height = a5.height;
      width = a5.width;
      -[PBShelfTile bounds](self, "bounds");
      v25 = CGRectInset(v24, width, height);
      x = v25.origin.x;
      y = v25.origin.y;
      v15 = v25.size.width;
      v16 = v25.size.height;
      switch(a4)
      {
        case 0:
          MinX = CGRectGetMinX(v25);
          v26.origin.x = x;
          v26.origin.y = y;
          v26.size.width = v15;
          v26.size.height = v16;
          MinY = CGRectGetMinY(v26);
          v19 = 0.0;
          v20 = 36;
          v21 = 0.0;
          goto LABEL_10;
        case 1:
          MinX = CGRectGetMaxX(v25);
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = v15;
          v29.size.height = v16;
          MinY = CGRectGetMinY(v29);
          v21 = 0.0;
          v19 = 1.0;
          v20 = 33;
          goto LABEL_10;
        case 2:
          MinX = CGRectGetMinX(v25);
          v27.origin.x = x;
          v27.origin.y = y;
          v27.size.width = v15;
          v27.size.height = v16;
          MinY = CGRectGetMaxY(v27);
          v21 = 1.0;
          v19 = 0.0;
          v20 = 12;
          goto LABEL_10;
        case 3:
          MinX = CGRectGetMaxX(v25);
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = v15;
          v28.size.height = v16;
          MinY = CGRectGetMaxY(v28);
          v19 = 1.0;
          v20 = 9;
          v21 = 1.0;
LABEL_10:
          v22 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
          +[UIView beginAnimations:context:](UIView, "beginAnimations:context:", 0, 0);
          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
          v23 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", a3);
          objc_msgSend(-[UIImageView layer](v23, "layer"), "setAnchorPoint:", v19, v21);
          -[UIImageView setCenter:](v23, "setCenter:", MinX, MinY);
          -[UIImageView setAutoresizingMask:](v23, "setAutoresizingMask:", v20);
          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v22);
          +[UIView commitAnimations](UIView, "commitAnimations");
          -[PBShelfTile addSubview:](self, "addSubview:", v23);

          cornerViews[v8] = v23;
          break;
        default:
          return;
      }
    }
  }
  else
  {
    -[UIImageView removeFromSuperview](v9, "removeFromSuperview", a5.width, a5.height);
    cornerViews[v8] = 0;
  }
}

- (id)iconInCorner:(int)a3
{
  return -[UIImageView image](self->_cornerViews[a3], "image");
}

- (void)setSelected:(BOOL)a3
{
  char v3;
  _BOOL4 v4;
  char v6;

  v3 = *((_BYTE *)self + 104);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if ((*((_BYTE *)self + 104) & 8) != 0)
    {
      -[PBShelfTile setIcon:inCorner:offset:](self, "setIcon:inCorner:offset:", 0, 2, CGSizeZero.width, CGSizeZero.height);
      v3 = *((_BYTE *)self + 104);
    }
    if (v4)
      v6 = 8;
    else
      v6 = 0;
    *((_BYTE *)self + 104) = v3 & 0xF7 | v6;
    if (v4)
      -[PBShelfTile setIcon:inCorner:offset:](self, "setIcon:inCorner:offset:", objc_msgSend((id)objc_opt_class(self, a2), "selectionBadgeImage"), 2, 7.0, 7.0);
  }
}

- (BOOL)isSelected
{
  return (*((unsigned __int8 *)self + 104) >> 3) & 1;
}

- (void)_updateHighlight
{
  char v2;
  id v3;
  double v4;

  v2 = *((_BYTE *)self + 104);
  v3 = -[UIImageView layer](self->_imageView, "layer");
  v4 = 4.0;
  if ((v2 & 0x10) == 0)
    v4 = 0.0;
  objc_msgSend(v3, "setBorderWidth:", v4);
}

- (void)setReviewed:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 104);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *((_BYTE *)self + 104) = v3 & 0xEF | v4;
    -[PBShelfTile _updateHighlight](self, "_updateHighlight");
  }
}

- (BOOL)isReviewed
{
  return (*((unsigned __int8 *)self + 104) >> 4) & 1;
}

- (BOOL)isPrinting
{
  return (*((unsigned __int8 *)self + 104) >> 5) & 1;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
