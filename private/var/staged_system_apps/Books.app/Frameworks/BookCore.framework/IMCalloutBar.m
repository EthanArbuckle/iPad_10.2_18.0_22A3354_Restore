@implementation IMCalloutBar

- (IMCalloutBar)initWithFrame:(CGRect)a3
{
  IMCalloutBar *v3;
  void *v4;
  id v5;
  _UIBackdropView *v6;
  _UIBackdropView *backgroundView;
  void *v8;
  void *v9;
  _UIBackdropView *v10;
  _UIBackdropView *separatorBackgroundView;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *blurMaskView;
  UIImageView *v16;
  UIImageView *tintMaskView;
  UIImageView *v18;
  UIImageView *separatorMaskView;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IMCalloutBar;
  v3 = -[IMCalloutBar initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[IMCalloutBar setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc((Class)_UIBackdropView);
    -[IMCalloutBar bounds](v3, "bounds");
    v6 = (_UIBackdropView *)objc_msgSend(v5, "initWithFrame:privateStyle:", 2050);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView layer](v3->_backgroundView, "layer"));
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView layer](v3->_backgroundView, "layer"));
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    if ((objc_opt_respondsToSelector(v3->_backgroundView, "setDisablesOccludedBackdropBlurs:") & 1) != 0)
      -[_UIBackdropView performSelector:withObject:](v3->_backgroundView, "performSelector:withObject:", "setDisablesOccludedBackdropBlurs:", 0);
    -[IMCalloutBar bounds](v3, "bounds");
    -[_UIBackdropView setFrame:](v3->_backgroundView, "setFrame:");
    -[_UIBackdropView setAutoresizingMask:](v3->_backgroundView, "setAutoresizingMask:", 18);
    -[IMCalloutBar addSubview:](v3, "addSubview:", v3->_backgroundView);
    v10 = (_UIBackdropView *)objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithPrivateStyle:", 2020);
    separatorBackgroundView = v3->_separatorBackgroundView;
    v3->_separatorBackgroundView = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView layer](v3->_separatorBackgroundView, "layer"));
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView layer](v3->_separatorBackgroundView, "layer"));
    objc_msgSend(v13, "setAllowsGroupBlending:", 0);

    -[IMCalloutBar bounds](v3, "bounds");
    -[_UIBackdropView setFrame:](v3->_separatorBackgroundView, "setFrame:");
    -[_UIBackdropView setAutoresizingMask:](v3->_separatorBackgroundView, "setAutoresizingMask:", 18);
    -[IMCalloutBar addSubview:](v3, "addSubview:", v3->_separatorBackgroundView);
    v14 = -[IMCalloutBar newMaskView:](v3, "newMaskView:", 4);
    blurMaskView = v3->_blurMaskView;
    v3->_blurMaskView = v14;

    v16 = -[IMCalloutBar newMaskView:](v3, "newMaskView:", 3);
    tintMaskView = v3->_tintMaskView;
    v3->_tintMaskView = v16;

    v18 = -[IMCalloutBar newMaskView:](v3, "newMaskView:", 7);
    separatorMaskView = v3->_separatorMaskView;
    v3->_separatorMaskView = v18;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[IMCalloutBar setControls:](self, "setControls:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMCalloutBar;
  -[IMCalloutBar dealloc](&v3, "dealloc");
}

- (id)newMaskView:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)UIImageView);
  objc_msgSend(v4, "_setBackdropMaskViewFlags:", a3);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  return v4;
}

- (void)setBlurDisabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForPrivateStyle:graphicsQuality:", 2050, 10));
    -[_UIBackdropView transitionToSettings:](self->_backgroundView, "transitionToSettings:", v4);
    v5 = objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForPrivateStyle:graphicsQuality:", 2020, 10));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", 2050));
    -[_UIBackdropView transitionToSettings:](self->_backgroundView, "transitionToSettings:", v4);
    v5 = objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", 2020));
  }
  v6 = (id)v5;

  -[_UIBackdropView transitionToSettings:](self->_separatorBackgroundView, "transitionToSettings:", v6);
}

- (void)setHighlighted:(BOOL)a3 forControl:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MaxX;
  double MinX;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
  v8 = (char *)objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      -[IMCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v8);
      v10 = v9;
      v25 = v11;
      v26 = v9;
      v12 = v11;
      v14 = v13;
      v27 = v15;
      -[IMCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v8 - 1);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      MaxX = CGRectGetMaxX(v28);
      v29.origin.x = v10;
      v29.origin.y = v12;
      v29.size.width = v14;
      v29.size.height = v27;
      MinX = CGRectGetMinX(v29);
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      v22 = MinX - CGRectGetMaxX(v30);
      v31.origin.y = v25;
      v31.origin.x = v26;
      v31.size.width = v14;
      v31.size.height = v27;
      v23 = CGRectGetHeight(v31);
      v24 = 0.0;
    }
    else
    {
      MaxX = CGRectZero.origin.x;
      v24 = CGRectZero.origin.y;
      v22 = CGRectZero.size.width;
      v23 = CGRectZero.size.height;
    }
    v32.origin.x = MaxX;
    v32.origin.y = v24;
    v32.size.width = v22;
    v32.size.height = v23;
    if (!CGRectEqualToRect(v32, self->_highlightRect))
    {
      self->_highlightRect.origin.x = MaxX;
      self->_highlightRect.origin.y = v24;
      self->_highlightRect.size.width = v22;
      self->_highlightRect.size.height = v23;
      -[IMCalloutBar setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double Width;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  id v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  UIImage *ImageFromCurrentImageContext;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  unint64_t v49;
  void *v50;
  char *v51;
  UIImage *v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double y;
  void *v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  UIImage *v65;
  void *v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  void *v73;
  char *v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  CGFloat v79;
  CGFloat v80;
  UIImage *v81;
  void *v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  void *v89;
  void *v90;
  char *v91;
  unint64_t v92;
  void *v93;
  char *v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  UIImage *v98;
  void *v99;
  objc_super v100;
  CGSize v101;
  CGSize v102;
  CGSize v103;
  CGSize v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  v100.receiver = self;
  v100.super_class = (Class)IMCalloutBar;
  -[IMCalloutBar layoutSubviews](&v100, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
  -[IMCalloutBar sizeThatFitsControls:](self, "sizeThatFitsControls:", v3);
  v5 = v4;

  -[IMCalloutBar bounds](self, "bounds");
  Width = CGRectGetWidth(v105);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v12 = (Width - v5) / (double)(unint64_t)(2 * (_QWORD)v8) + 6.0;
    v13 = v12;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v11));

      objc_msgSend(v15, "frame");
      v17 = v16;
      v18 = round(v13);
      if (-[IMCalloutBar up](self, "up"))
        v19 = 14.0;
      else
        v19 = 0.0;
      objc_msgSend(v15, "setFrame:", v18, v19, v17, 38.0);
      v106.origin.x = v18;
      v106.origin.y = v19;
      v106.size.width = v17;
      v106.size.height = 38.0;
      v20 = CGRectGetWidth(v106);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v21, "scale");
      v13 = v13 + v20 + 1.0 / v22 + v12 * 2.0;

      ++v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
      v24 = objc_msgSend(v23, "count");

    }
    while ((unint64_t)v24 > v11);
  }
  -[IMCalloutBar bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = 0.0;
  v101.width = v29;
  v101.height = v31;
  UIGraphicsBeginImageContextWithOptions(v101, 0, 0.0);
  if (-[IMCalloutBar up](self, "up"))
    v33 = 14.0;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v34, "set");

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, v33, v30, 38.0, 8.0));
  objc_msgSend(v35, "fill");

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v36, "set");

  if (-[IMCalloutBar up](self, "up"))
    v37 = 5.0;
  else
    v37 = 38.0;
  -[IMCalloutBar arrowX](self, "arrowX");
  v39 = v38;
  v107.origin.x = v26;
  v107.origin.y = v28;
  v107.size.width = v30;
  v107.size.height = v32;
  v40 = CGRectGetWidth(v107) + -17.0;
  if (v39 < v40)
    v40 = v39;
  v41 = fmax(v40, 17.0);
  v42 = round(v41 + -9.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  if (-[IMCalloutBar up](self, "up"))
  {
    objc_msgSend(v43, "moveToPoint:", v41, v37);
    v37 = v37 + 9.0;
  }
  else
  {
    objc_msgSend(v43, "moveToPoint:", v41, v37 + 9.0);
  }
  objc_msgSend(v43, "addLineToPoint:", v42, v37);
  objc_msgSend(v43, "addLineToPoint:", v42 + 18.0, v37);
  objc_msgSend(v43, "closePath");
  objc_msgSend(v43, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v45 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v46, "set");

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
  v48 = (char *)objc_msgSend(v47, "count");

  if (v48 != (_BYTE *)&dword_0 + 1)
  {
    v49 = 0;
    do
    {
      -[IMCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v49);
      UIRectFillUsingBlendMode(v108, kCGBlendModeCopy);
      ++v49;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
      v51 = (char *)objc_msgSend(v50, "count") - 1;

    }
    while (v49 < (unint64_t)v51);
  }
  v52 = UIGraphicsGetImageFromCurrentImageContext();
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  UIGraphicsEndImageContext();
  objc_msgSend(v53, "size");
  v55 = v54;
  v57 = v56;
  objc_msgSend(v53, "scale");
  v59 = v58;
  v102.width = v55;
  v102.height = v57;
  UIGraphicsBeginImageContextWithOptions(v102, 0, v59);
  y = CGPointZero.y;
  objc_msgSend(v53, "drawAtPoint:blendMode:alpha:", 17, CGPointZero.x, y, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v61, "set");

  objc_msgSend(v53, "size");
  v63 = v62;
  objc_msgSend(v53, "size");
  v109.size.height = v64;
  v109.origin.x = 0.0;
  v109.origin.y = 0.0;
  v109.size.width = v63;
  UIRectFillUsingBlendMode(v109, kCGBlendModeSourceOut);
  v65 = UIGraphicsGetImageFromCurrentImageContext();
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  -[UIImageView setImage:](self->_blurMaskView, "setImage:", v66);

  -[UIImageView sizeToFit](self->_blurMaskView, "sizeToFit");
  UIGraphicsEndImageContext();
  -[_UIBackdropView updateMaskViewsForView:](self->_backgroundView, "updateMaskViewsForView:", self->_blurMaskView);
  objc_msgSend(v53, "size");
  v68 = v67;
  v70 = v69;
  objc_msgSend(v53, "scale");
  v72 = v71;
  v103.width = v68;
  v103.height = v70;
  UIGraphicsBeginImageContextWithOptions(v103, 0, v72);
  objc_msgSend(v53, "drawAtPoint:blendMode:alpha:", 17, CGPointZero.x, y, 1.0);
  if (!CGRectIsEmpty(self->_highlightRect))
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v74 = (char *)objc_msgSend(v73, "_graphicsQuality");

    v75 = 0.75;
    if (v74 != (_BYTE *)&dword_8 + 2)
      v75 = 0.4;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, v75));
    objc_msgSend(v76, "set");

    UIRectFillUsingBlendMode(self->_highlightRect, kCGBlendModeSourceIn);
  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v77, "set");

  objc_msgSend(v53, "size");
  v79 = v78;
  objc_msgSend(v53, "size");
  v110.size.height = v80;
  v110.origin.x = 0.0;
  v110.origin.y = 0.0;
  v110.size.width = v79;
  UIRectFillUsingBlendMode(v110, kCGBlendModeSourceOut);
  v81 = UIGraphicsGetImageFromCurrentImageContext();
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  -[UIImageView setImage:](self->_tintMaskView, "setImage:", v82);

  -[UIImageView sizeToFit](self->_tintMaskView, "sizeToFit");
  UIGraphicsEndImageContext();
  -[_UIBackdropView updateMaskViewsForView:](self->_backgroundView, "updateMaskViewsForView:", self->_tintMaskView);
  objc_msgSend(v53, "size");
  v84 = v83;
  v86 = v85;
  objc_msgSend(v53, "scale");
  v88 = v87;
  v104.width = v84;
  v104.height = v86;
  UIGraphicsBeginImageContextWithOptions(v104, 0, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v89, "set");

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
  v91 = (char *)objc_msgSend(v90, "count");

  if (v91 != (_BYTE *)&dword_0 + 1)
  {
    v92 = 0;
    do
    {
      -[IMCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v92);
      UIRectFillUsingBlendMode(v111, kCGBlendModeCopy);
      ++v92;
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
      v94 = (char *)objc_msgSend(v93, "count") - 1;

    }
    while (v92 < (unint64_t)v94);
  }
  objc_msgSend(v45, "drawAtPoint:blendMode:alpha:", 22, CGPointZero.x, y, 1.0);
  objc_msgSend(v53, "size");
  v96 = v95;
  objc_msgSend(v53, "size");
  v112.size.height = v97;
  v112.origin.x = 0.0;
  v112.origin.y = 0.0;
  v112.size.width = v96;
  UIRectFillUsingBlendMode(v112, kCGBlendModeSourceOut);
  v98 = UIGraphicsGetImageFromCurrentImageContext();
  v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
  -[UIImageView setImage:](self->_separatorMaskView, "setImage:", v99);

  -[UIImageView sizeToFit](self->_separatorMaskView, "sizeToFit");
  UIGraphicsEndImageContext();
  -[_UIBackdropView updateMaskViewsForView:](self->_separatorBackgroundView, "updateMaskViewsForView:", self->_separatorMaskView);

}

- (CGRect)dividerLineRectForControl:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double MinX;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = v6;

  if (a3 < 0)
  {
    v15 = 0.0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
    v9 = (char *)objc_msgSend(v8, "count") - 1;

    if ((unint64_t)v9 <= a3)
    {
      -[IMCalloutBar bounds](self, "bounds");
      v15 = v16;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", a3));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", a3 + 1));

      objc_msgSend(v13, "frame");
      MinX = CGRectGetMinX(v21);
      objc_msgSend(v11, "frame");
      v15 = round((MinX + CGRectGetMaxX(v22) + -1.0) * 0.5);

    }
  }
  v17 = 1.0 / v7;
  v18 = 52.0;
  v19 = v15;
  v20 = 0.0;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutBar controls](self, "controls", a3.width, a3.height));
  -[IMCalloutBar sizeThatFitsControls:](self, "sizeThatFitsControls:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setControls:(id)a3
{
  NSArray *v5;
  NSArray **p_controls;
  NSArray *controls;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  uint64_t v21;
  id v22;
  _BYTE *v23;
  uint64_t v24;
  NSArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v5 = (NSArray *)a3;
  p_controls = &self->_controls;
  controls = self->_controls;
  if (controls != v5)
  {
    v25 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = controls;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "removeFromSuperview");
          v14 = objc_opt_class(IMCalloutButton);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            objc_msgSend(v13, "setBar:", 0);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_controls, a3);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = *p_controls;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
          v21 = objc_opt_class(IMCalloutButton);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          {
            v22 = v20;
            objc_msgSend(v22, "setBar:", self);
            v23 = -[NSArray indexOfObject:](*p_controls, "indexOfObject:", v22);
            if (v23)
            {
              if (v23 == (char *)-[NSArray count](*p_controls, "count") - 1)
                v24 = 2;
              else
                v24 = 1;
            }
            else
            {
              v24 = 0;
            }
            objc_msgSend(v22, "setPosition:", v24);

          }
          -[IMCalloutBar addSubview:](self, "addSubview:", v20);
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v17);
    }

    -[IMCalloutBar setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v25;
  }

}

- (CGSize)sizeThatFitsControls:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  id v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  CGSize result;
  CGRect v18;

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 12.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "frame");
        v7 = v7 + CGRectGetWidth(v18);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 12.0;
  }
  v9 = objc_msgSend(v3, "count");

  v10 = v7 + (double)((unint64_t)v9 - 1) * 13.0;
  v11 = 52.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)arrowX
{
  return self->_arrowX;
}

- (void)setArrowX:(double)a3
{
  self->_arrowX = a3;
}

- (BOOL)up
{
  return self->_up;
}

- (void)setUp:(BOOL)a3
{
  self->_up = a3;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorMaskView, 0);
  objc_storeStrong((id *)&self->_tintMaskView, 0);
  objc_storeStrong((id *)&self->_blurMaskView, 0);
  objc_storeStrong((id *)&self->_separatorBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_controls, 0);
}

@end
