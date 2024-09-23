@implementation SUTableCellContentView

- (void)dealloc
{
  objc_super v3;

  self->_clipPath = 0;
  if ((SUTableCellContentView *)-[SUCellConfiguration view](self->_configuration, "view") == self)
    -[SUCellConfiguration setView:](self->_configuration, "setView:", 0);

  self->_configuration = 0;
  self->_overlayView = 0;

  self->_subviews = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableCellContentView;
  -[SUTableCellContentView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
  id v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v44;
  double v45;
  CGContext *c;
  uint64_t v47;
  uint64_t v48;
  double v49[3];
  id v50;
  _QWORD v51[3];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x24BDAC8D0];
  -[SUTableCellContentView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[SUCellConfiguration setLayoutSize:](self->_configuration, "setLayoutSize:", v6, v7);
  v8 = -[SUTableCellContentView isHighlighted](self, "isHighlighted") & 0xFFFFFFF9 | (2 * (*((_BYTE *)self + 440) & 1)) & 0xFB | (4 * (*((_BYTE *)self + 464) & 1));
  if (self->_clipCorners)
  {
    c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c);
    objc_msgSend(-[SUTableCellContentView _clipPath](self, "_clipPath"), "clip");
    if ((*((_BYTE *)self + 464) & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  c = 0;
  if ((*((_BYTE *)self + 464) & 1) == 0)
LABEL_3:
    -[SUCellConfiguration drawBackgroundWithModifiers:](self->_configuration, "drawBackgroundWithModifiers:", v8);
LABEL_4:
  -[SUCellConfiguration drawWithModifiers:](self->_configuration, "drawWithModifiers:", v8);
  if ((*((_BYTE *)self + 464) & 1) == 0)
  {
    v9 = -[SUCellConfiguration numberOfLabels](self->_configuration, "numberOfLabels");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v48 = *MEMORY[0x24BDF65F8];
      v47 = *MEMORY[0x24BDF6628];
      v12 = *MEMORY[0x24BDF6600];
      do
      {
        v13 = -[SUCellConfiguration stringForLabelAtIndex:](self->_configuration, "stringForLabelAtIndex:", v11);
        if (objc_msgSend(v13, "length"))
        {
          -[SUCellConfiguration frameForLabelAtIndex:](self->_configuration, "frameForLabelAtIndex:", v11);
          v18 = v17;
          if (v15 > 0.00000011920929)
          {
            v19 = v14;
            v20 = v15;
            v21 = v16;
            v22 = -[SUCellConfiguration fontForLabelAtIndex:](self->_configuration, "fontForLabelAtIndex:", v11);
            v23 = -[SUCellConfiguration textAlignmentForLabelAtIndex:](self->_configuration, "textAlignmentForLabelAtIndex:", v11);
            v24 = v5 + v18;
            v50 = 0;
            *(_OWORD *)v49 = *MEMORY[0x24BDBF148];
            if (-[SUCellConfiguration getShadowColor:offset:forLabelAtIndex:withModifiers:](self->_configuration, "getShadowColor:offset:forLabelAtIndex:withModifiers:", &v50, v49, v11, v8))
            {
              v25 = v24 + v49[0];
              v26 = v19 + v49[1];
              objc_msgSend(v50, "set");
              objc_msgSend(v13, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", v22, 4, v23, v25, v26, v20, v21);
              v24 = v25 - v49[0];
              v19 = v26 - v49[1];
            }
            v27 = objc_alloc_init(MEMORY[0x24BDF6748]);
            objc_msgSend(v27, "setLineBreakMode:", 4);
            objc_msgSend(v27, "setAlignment:", v23);
            v51[0] = v48;
            v51[1] = v47;
            v52[0] = v22;
            v52[1] = v27;
            v51[2] = v12;
            v52[2] = -[SUCellConfiguration colorForLabelAtIndex:withModifiers:](self->_configuration, "colorForLabelAtIndex:withModifiers:", v11, v8);
            objc_msgSend(v13, "drawInRect:withAttributes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 3), v24, v19, v20, v21 + 5.0);

          }
        }
        ++v11;
      }
      while (v10 != v11);
    }
    v28 = *((_BYTE *)self + 440);
    v29 = -[SUCellConfiguration numberOfImages](self->_configuration, "numberOfImages");
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *MEMORY[0x24BDBF148];
      v33 = *(double *)(MEMORY[0x24BDBF148] + 8);
      if ((v28 & 1) != 0)
        v34 = 0.330000013;
      else
        v34 = 1.0;
      do
      {
        v35 = -[SUCellConfiguration imageAtIndex:withModifiers:](self->_configuration, "imageAtIndex:withModifiers:", v31, v8);
        if (v35)
        {
          v36 = v35;
          -[SUCellConfiguration frameForImageAtIndex:](self->_configuration, "frameForImageAtIndex:", v31);
          v40 = v39;
          v42 = v41;
          if (v37 == v32 && v38 == v33)
          {
            objc_msgSend(v36, "size");
            v37 = v44;
            v38 = v45;
          }
          objc_msgSend(v36, "drawInRect:blendMode:alpha:", 0, v40, v42, v37, v38, v34);
        }
        ++v31;
      }
      while (v30 != v31);
    }
  }
  if (c)
    CGContextRestoreGState(c);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  NSMutableArray *subviews;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)self + 464) & 1) != 0)
  {
    -[SUTableCellContentView bounds](self, "bounds");
    v4 = v3;
    -[SUCellConfiguration setLayoutSize:](self->_configuration, "setLayoutSize:", v5, v6);
    v7 = -[SUCellConfiguration numberOfImages](self->_configuration, "numberOfImages");
    v8 = -[SUCellConfiguration numberOfLabels](self->_configuration, "numberOfLabels");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    subviews = self->_subviews;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subviews, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      v13 = *MEMORY[0x24BDBF090];
      v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(subviews);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "tag");
          if (v19 < 51000)
          {
            v24 = v19 < 50000 || v19 - 50000 >= v8;
            v20 = v14;
            v21 = v15;
            v22 = v16;
            v23 = v13;
            if (!v24)
              -[SUCellConfiguration frameForLabelAtIndex:](self->_configuration, "frameForLabelAtIndex:", v13, v14, v15, v16);
          }
          else
          {
            v20 = v14;
            v21 = v15;
            v22 = v16;
            v23 = v13;
            if (v19 - 51000 < v7)
              -[SUCellConfiguration frameForImageAtIndex:](self->_configuration, "frameForImageAtIndex:", v13, v14, v15, v16);
          }
          objc_msgSend(v18, "setFrame:", v4 + v23, v20, v21, v22);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subviews, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SUTableCellContentView;
  -[SUTableCellContentView layoutSubviews](&v25, sel_layoutSubviews);
}

- (void)reloadView
{
  if ((*((_BYTE *)self + 464) & 1) != 0)
    -[SUTableCellContentView _reloadSubviewsForConfiguration](self, "_reloadSubviewsForConfiguration");
  else
    -[SUTableCellContentView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)drawAsDisabled
{
  return *((_BYTE *)self + 440) & 1;
}

- (BOOL)highlightsOnlyContentView
{
  return (*((unsigned __int8 *)self + 440) >> 2) & 1;
}

- (BOOL)isDeleteConfirmationVisible
{
  return -[SUCellConfiguration isDeleteConfirmationVisible](self->_configuration, "isDeleteConfirmationVisible");
}

- (BOOL)isHighlighted
{
  return (*((unsigned __int8 *)self + 440) >> 1) & 1;
}

- (void)setClipCorners:(int)a3
{
  if (self->_clipCorners != a3)
  {
    self->_clipCorners = a3;

    self->_clipPath = 0;
    if ((*((_BYTE *)self + 464) & 1) == 0)
      -[SUTableCellContentView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setConfiguration:(id)a3
{
  SUCellConfiguration *configuration;
  SUCellConfiguration *v6;

  configuration = self->_configuration;
  if (configuration == a3)
  {
    if (!objc_msgSend(a3, "needsDisplay"))
      return;
  }
  else
  {
    if ((SUTableCellContentView *)-[SUCellConfiguration view](configuration, "view") == self)
      -[SUCellConfiguration setView:](self->_configuration, "setView:", 0);

    v6 = (SUCellConfiguration *)a3;
    self->_configuration = v6;
    -[SUCellConfiguration setView:](v6, "setView:", self);
    if (!-[SUCellConfiguration needsDisplay](self->_configuration, "needsDisplay"))
      goto LABEL_8;
  }
  -[SUCellConfiguration setNeedsDisplay:](self->_configuration, "setNeedsDisplay:", 0);
  -[SUCellConfiguration reloadData](self->_configuration, "reloadData");
LABEL_8:
  -[SUTableCellContentView reloadView](self, "reloadView");
}

- (void)setDeleteConfirmationVisisble:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SUCellConfiguration isDeleteConfirmationVisible](self->_configuration, "isDeleteConfirmationVisible") != a3)
  {
    -[SUCellConfiguration setIsDeleteConfirmationVisible:](self->_configuration, "setIsDeleteConfirmationVisible:", v3);
    -[SUTableCellContentView _reloadSubviewAlphasAnimated:](self, "_reloadSubviewAlphasAnimated:", 0);
  }
}

- (void)setDrawAsDisabled:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 440);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 440) = v3 & 0xFE | a3;
    if ((*((_BYTE *)self + 464) & 1) != 0)
      -[SUTableCellContentView _updateDisabledStyleForSubviews](self, "_updateDisabledStyleForSubviews");
    else
      -[SUTableCellContentView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUTableCellContentView frame](self, "frame");
  if (v9 != width || v8 != height)
  {
    if ((*((_BYTE *)self + 464) & 1) == 0)
      -[SUTableCellContentView setNeedsDisplay](self, "setNeedsDisplay");

    self->_clipPath = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUTableCellContentView;
  -[SUTableCellContentView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)setHighlightsOnlyContentView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 440) = *((_BYTE *)self + 440) & 0xFB | v3;
}

- (void)setHighlighted:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 440);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *((_BYTE *)self + 440) = v3 & 0xFD | v4;
    if ((*((_BYTE *)self + 464) & 1) == 0)
      -[SUTableCellContentView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setUsesSubviews:(BOOL)a3
{
  -[SUTableCellContentView setUsesSubviews:animated:](self, "setUsesSubviews:animated:", a3, 0);
}

- (void)setUsesSubviews:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopUsingSubviewLayout, 0);
  if (v5)
  {
    -[SUTableCellContentView _startUsingSubviewLayout](self, "_startUsingSubviewLayout");
  }
  else if (a4)
  {
    -[SUTableCellContentView setDeleteConfirmationVisisble:](self, "setDeleteConfirmationVisisble:", 0);
    -[SUTableCellContentView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stopUsingSubviewLayout, 0, 0.4);
  }
  else
  {
    -[SUTableCellContentView _stopUsingSubviewLayout](self, "_stopUsingSubviewLayout");
  }
}

- (BOOL)usesSubviews
{
  return *((_BYTE *)self + 464) & 1;
}

- (id)_clipPath
{
  id result;
  CGRect v4;
  CGRect v5;

  result = self->_clipPath;
  if (!result)
  {
    if (self->_clipCorners)
    {
      -[SUTableCellContentView bounds](self, "bounds");
      v5 = CGRectInset(v4, -0.25, -0.25);
      result = (id)objc_msgSend(MEMORY[0x24BDF6870], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", self->_clipCorners, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height, 10.0);
      self->_clipPath = (UIBezierPath *)result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_clippedImageForImage:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  UIImage *ImageFromCurrentImageContext;
  CGSize v15;

  if (!a3)
    return 0;
  -[SUTableCellContentView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  v12 = v11;
  v15.width = v10;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v12);
  objc_msgSend(-[SUTableCellContentView _clipPath](self, "_clipPath"), "clip");
  objc_msgSend(a3, "drawInRect:", v6, v8, v10, v10);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (void)_reloadSubviewAlphasAnimated:(BOOL)a3
{
  char v4;
  char v5;
  NSMutableArray *subviews;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  SUTableCellContentView *v18;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v19 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v4 = objc_opt_respondsToSelector();
  v18 = self;
  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0 || (v4 & 1) != 0)
  {
    v17 = -[SUCellConfiguration numberOfImages](self->_configuration, "numberOfImages");
    v16 = -[SUCellConfiguration numberOfLabels](self->_configuration, "numberOfLabels");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    subviews = self->_subviews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subviews, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(subviews);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "tag");
          if (v12 < 51000)
          {
            v13 = 1.0;
            if (v12 >= 50000 && (v5 & 1) != 0 && v12 - 50000 < v16)
            {
              -[SUCellConfiguration alphaForLabelAtIndex:fromAlpha:withModifiers:](v18->_configuration, "alphaForLabelAtIndex:fromAlpha:withModifiers:");
              goto LABEL_15;
            }
          }
          else
          {
            v13 = 1.0;
            if ((v4 & 1) != 0 && v12 - 51000 < v17)
            {
              -[SUCellConfiguration alphaForImageAtIndex:fromAlpha:withModifiers:](v18->_configuration, "alphaForImageAtIndex:fromAlpha:withModifiers:");
LABEL_15:
              v13 = v14;
            }
          }
          objc_msgSend(v11, "alpha");
          if (vabdd_f64(v15, v13) > 0.00000011920929)
          {
            objc_msgSend(v11, "setAlpha:", 1.0);
            if (v19)
            {
              objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", CFSTR("subviewAlphaAnimation"), 0);
              objc_msgSend(v11, "setAlpha:", v13);
              objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
            }
            else
            {
              objc_msgSend(v11, "setAlpha:", v13);
            }
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subviews, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }
  }
}

- (void)_reloadSubviewsForConfiguration
{
  uint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *Label;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  -[NSMutableArray makeObjectsPerformSelector:](self->_subviews, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  self->_subviews = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (2 * (*((_BYTE *)self + 440) & 1)) | 4;
  -[SUTableCellContentView bounds](self, "bounds");
  -[SUCellConfiguration setLayoutSize:](self->_configuration, "setLayoutSize:", v4, v5);
  v6 = -[SUCellConfiguration numberOfLabels](self->_configuration, "numberOfLabels");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      Label = __CreateLabel(self->_configuration, i, v3);
      if (Label)
      {
        v10 = Label;
        -[SUTableCellContentView addSubview:](self, "addSubview:", Label);
        -[NSMutableArray addObject:](self->_subviews, "addObject:", v10);

      }
    }
  }
  v11 = -[SUCellConfiguration numberOfImages](self->_configuration, "numberOfImages");
  if (v11)
  {
    v12 = v11;
    for (j = 0; j != v12; ++j)
    {
      v14 = -[SUCellConfiguration imageAtIndex:withModifiers:](self->_configuration, "imageAtIndex:withModifiers:", j, v3);
      v15 = -[SUCellConfiguration imageAtIndex:withModifiers:](self->_configuration, "imageAtIndex:withModifiers:", j, v3 | 1);
      if (self->_clipCorners)
      {
        v14 = -[SUTableCellContentView _clippedImageForImage:](self, "_clippedImageForImage:", v14);
        v15 = -[SUTableCellContentView _clippedImageForImage:](self, "_clippedImageForImage:", v15);
      }
      if (v14)
      {
        v16 = objc_alloc(MEMORY[0x24BDF6AE8]);
        -[SUCellConfiguration frameForImageAtIndex:](self->_configuration, "frameForImageAtIndex:", j);
        v17 = (void *)objc_msgSend(v16, "initWithFrame:");
        v18 = v17;
        if ((*((_BYTE *)self + 440) & 1) != 0)
          v19 = 0.330000013;
        else
          v19 = 1.0;
        objc_msgSend(v17, "setAlpha:", v19);
        if (v15 == v14)
          v20 = 0;
        else
          v20 = v15;
        objc_msgSend(v18, "setHighlightedImage:", v20);
        objc_msgSend(v18, "setImage:", v14);
        objc_msgSend(v18, "setTag:", j + 51000);
        objc_msgSend(v18, "setUserInteractionEnabled:", 0);
        -[SUTableCellContentView addSubview:](self, "addSubview:", v18);
        -[NSMutableArray addObject:](self->_subviews, "addObject:", v18);

      }
    }
  }
  -[SUTableCellContentView _reloadSubviewAlphasAnimated:](self, "_reloadSubviewAlphasAnimated:", 1);
  -[SUTableCellContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_removeSubviewsForConfiguration
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_subviews, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  self->_subviews = 0;
}

- (void)_startUsingSubviewLayout
{
  objc_class *v3;
  Method InstanceMethod;
  objc_method *v5;
  objc_class *v6;
  SUTableCellContentOverlayView *v7;
  UIView *v8;

  if ((*((_BYTE *)self + 464) & 1) == 0)
  {
    *((_BYTE *)self + 464) |= 1u;
    -[SUTableCellContentView _reloadSubviewsForConfiguration](self, "_reloadSubviewsForConfiguration");
    v3 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v3, sel_drawBackgroundWithModifiers_);
    if (InstanceMethod)
    {
      v5 = InstanceMethod;
      v6 = (objc_class *)objc_opt_class();
      if (v5 != class_getInstanceMethod(v6, sel_drawBackgroundWithModifiers_))
      {
        v7 = [SUTableCellContentOverlayView alloc];
        -[SUTableCellContentView bounds](self, "bounds");
        v8 = -[SUTableCellContentOverlayView initWithFrame:](v7, "initWithFrame:");
        self->_overlayView = v8;
        -[UIView setBackgroundColor:](v8, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
        -[UIView setConfiguration:](self->_overlayView, "setConfiguration:", self->_configuration);
        -[SUTableCellContentView addSubview:](self, "addSubview:", self->_overlayView);
      }
    }
    -[SUTableCellContentView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_stopUsingSubviewLayout
{
  if ((*((_BYTE *)self + 464) & 1) != 0)
  {
    *((_BYTE *)self + 464) &= ~1u;
    -[SUTableCellContentView _removeSubviewsForConfiguration](self, "_removeSubviewsForConfiguration");
    -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");

    self->_overlayView = 0;
    -[SUTableCellContentView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_updateDisabledStyleForSubviews
{
  char v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  double v13;

  v3 = *((_BYTE *)self + 440);
  v4 = -[SUCellConfiguration numberOfLabels](self->_configuration, "numberOfLabels");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 2 * (v3 & 1);
    do
    {
      if (objc_msgSend(-[SUCellConfiguration stringForLabelAtIndex:](self->_configuration, "stringForLabelAtIndex:", v6), "length"))
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subviews, "objectAtIndex:", v7++), "setTextColor:", -[SUCellConfiguration colorForLabelAtIndex:withModifiers:](self->_configuration, "colorForLabelAtIndex:withModifiers:", v6, v8));
      }
      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    v7 = 0;
  }
  v9 = -[SUCellConfiguration numberOfImages](self->_configuration, "numberOfImages");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      if (-[SUCellConfiguration imageAtIndex:withModifiers:](self->_configuration, "imageAtIndex:withModifiers:", i, 0))
      {
        v12 = (void *)-[NSMutableArray objectAtIndex:](self->_subviews, "objectAtIndex:", v7);
        if ((*((_BYTE *)self + 440) & 1) != 0)
          v13 = 0.330000013;
        else
          v13 = 0.0;
        objc_msgSend(v12, "setAlpha:", v13);
        ++v7;
      }
    }
  }
}

- (int)clipCorners
{
  return self->_clipCorners;
}

- (SUCellConfiguration)configuration
{
  return self->_configuration;
}

@end
