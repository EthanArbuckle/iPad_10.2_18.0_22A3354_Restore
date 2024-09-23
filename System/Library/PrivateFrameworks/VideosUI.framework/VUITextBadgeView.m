@implementation VUITextBadgeView

- (VUITextBadgeView)initWithFrame:(CGRect)a3
{
  VUITextBadgeView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUITextBadgeView;
  v3 = -[VUITextBadgeView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextBadgeView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[VUITextBadgeView setContentMode:](v3, "setContentMode:", 3);
    -[VUITextBadgeView setClearsContextBeforeDrawing:](v3, "setClearsContextBeforeDrawing:", 1);
  }
  return v3;
}

+ (id)badgeWithLayout:(id)a3 existing:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  objc_msgSend(v7, "reset");
  objc_msgSend(v8, "_configureWithLayout:", v6);

  return v8;
}

- (void)_configureWithLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[VUITextBadgeView setBadgeKind:](self, "setBadgeKind:", objc_msgSend(v4, "badgeKind"));
  objc_msgSend(v4, "padding");
  -[VUITextBadgeView setPadding:](self, "setPadding:");
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextBadgeView setTintColor:](self, "setTintColor:", v5);

  -[VUITextBadgeView setIsUppercased:](self, "setIsUppercased:", objc_msgSend(v4, "isUppercased"));
  -[VUITextBadgeView setBlendMode:](self, "setBlendMode:", objc_msgSend(v4, "blendMode"));
  objc_msgSend(v4, "minHeight");
  -[VUITextBadgeView setMinHeight:](self, "setMinHeight:");
  objc_msgSend(v4, "layerCornerRadius");
  -[VUITextBadgeView setLayerCornerRadius:](self, "setLayerCornerRadius:");
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextBadgeView setBackgroundColor:](self, "setBackgroundColor:", v6);

  objc_msgSend(v4, "gradientBgColors");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[VUITextBadgeView setGradientBgColors:](self, "setGradientBgColors:", v7);
}

- (void)setImageView:(id)a3
{
  UIView **p_imageView;
  void *v6;
  uint64_t v7;
  void *v8;
  UIView *v9;

  p_imageView = &self->_imageView;
  v9 = (UIView *)a3;
  if (*p_imageView != v9)
  {
    objc_storeStrong((id *)&self->_imageView, a3);
    -[VUITextBadgeView vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x1E0DC6B58];
      objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC6B58], 0);

      if (*p_imageView)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__imageLoaded, v7, *p_imageView);

      }
    }
  }

}

- (id)accessibilityLabel
{
  void *attributedTitle;

  attributedTitle = self->_attributedTitle;
  if (attributedTitle)
  {
    objc_msgSend(attributedTitle, "string");
    attributedTitle = (void *)objc_claimAutoreleasedReturnValue();
  }
  return attributedTitle;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setBadgeKind:(unint64_t)a3
{
  if (self->_badgeKind != a3)
  {
    self->_badgeKind = a3;
    -[VUITextBadgeView setClipsToBounds:](self, "setClipsToBounds:", 1);
    -[VUITextBadgeView vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
  }
}

- (void)setLayerCornerRadius:(double)a3
{
  void *v5;

  if (self->_layerCornerRadius != a3)
  {
    -[VUITextBadgeView setVuiClipsToBounds:](self, "setVuiClipsToBounds:", 1);
    self->_layerCornerRadius = a3;
    -[VUITextBadgeView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", self->_layerCornerRadius);

    -[VUITextBadgeView vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
  }
}

- (void)setAttributedTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedTitle;

  if (self->_attributedTitle != a3)
  {
    v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;

    -[VUITextBadgeView vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
  }
}

- (void)setRentalExpirationLabel:(id)a3
{
  VUIRentalExpirationLabel *v5;
  VUIRentalExpirationLabel **p_rentalExpirationLabel;
  void *v7;
  VUIRentalExpirationLabel *v8;

  v5 = (VUIRentalExpirationLabel *)a3;
  p_rentalExpirationLabel = &self->_rentalExpirationLabel;
  if (self->_rentalExpirationLabel != v5)
  {
    v8 = v5;
    -[VUILabel vuiAttributedText](v5, "vuiAttributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextBadgeView setAttributedTitle:](self, "setAttributedTitle:", v7);

    -[VUIRentalExpirationLabel setDelegate:](v8, "setDelegate:", self);
    -[VUIRentalExpirationLabel invalidateTimer](*p_rentalExpirationLabel, "invalidateTimer");
    -[VUITextBadgeView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v8, *p_rentalExpirationLabel);
    objc_storeStrong((id *)&self->_rentalExpirationLabel, a3);
    -[VUITextBadgeView vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
    -[VUITextBadgeView setClipsToBounds:](self, "setClipsToBounds:", 1);
    -[VUITextBadgeView layoutIfNeeded](self, "layoutIfNeeded");
    v5 = v8;
  }

}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "vuiAttributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextBadgeView setAttributedTitle:](self, "setAttributedTitle:", v4);

  -[VUITextBadgeView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textBadgeViewContentsUpdated:", self);

}

- (void)reset
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[VUITextBadgeView _invalidateTimer](self, "_invalidateTimer");
  -[VUITextBadgeView setAttributedTitle:](self, "setAttributedTitle:", 0);
  -[VUITextBadgeView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUITextBadgeView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", 0);

  }
  -[VUITextBadgeView setLayerCornerRadius:](self, "setLayerCornerRadius:", 0.0);
  -[VUITextBadgeView setRentalExpirationLabel:](self, "setRentalExpirationLabel:", 0);
  -[VUITextBadgeView _setBackgroundImageForMaterialRendering:](self, "_setBackgroundImageForMaterialRendering:", 0);
  -[VUITextBadgeView _cancelPendingOperation](self, "_cancelPendingOperation");
}

- (void)dealloc
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v6;

  -[VUITextBadgeView _invalidateTimer](self, "_invalidateTimer");
  -[VUITextBadgeView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC6B58], 0);

  }
  -[VUITextBadgeView _cancelPendingOperation](self, "_cancelPendingOperation");
  v6.receiver = self;
  v6.super_class = (Class)VUITextBadgeView;
  -[VUITextBadgeView dealloc](&v6, sel_dealloc);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  CGSize result;

  if (a4)
  {
    -[VUITextBadgeView sizeThatFits:](self, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double height;
  double v6;
  double v7;
  UIView *imageView;
  double minHeight;
  CGSize result;

  if (self->_attributedTitle)
  {
    -[VUITextBadgeView _textSize](self, "_textSize", a3.width, a3.height);
    height = v4;
    VUIRoundValue();
    v7 = v6 + 0.0;
  }
  else
  {
    height = 0.0;
    v7 = 0.0;
  }
  imageView = self->_imageView;
  if (imageView)
  {
    if (v7 > 0.0)
      v7 = v7 + 4.0;
    v7 = v7 + self->_glyphSize.width;
    if (self->_glyphSize.height >= height)
      height = self->_glyphSize.height;
  }
  if (v7 > 0.0)
    v7 = v7 + self->_padding.left + self->_padding.right;
  if (height > 0.0)
    height = height + self->_padding.top + self->_padding.bottom;
  minHeight = self->_minHeight;
  if (height >= minHeight || minHeight <= 0.0)
    minHeight = height;
  if (imageView && !self->_attributedTitle)
    v7 = minHeight;
  result.height = minHeight;
  result.width = v7;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  CGContext *CurrentContext;
  void *v7;
  void *v8;
  unint64_t badgeKind;
  void *v10;
  void *v11;
  CGColorSpace *DeviceRGB;
  id v13;
  id v14;
  const __CFArray *v15;
  CGGradientRef v16;
  CGGradient *v17;
  CGFloat MaxX;
  void *v19;
  void *v20;
  void *v21;
  UIEdgeInsets *p_padding;
  double left;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  UIView **p_imageView;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  _QWORD v40[2];
  CGFloat locations[3];
  uint64_t v42;
  CGPoint v43;
  CGPoint v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  v42 = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  +[VUIBezierPath bezierPathWithRect:](VUIBezierPath, "bezierPathWithRect:", 0.0, 0.0, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_backgroundImage)
  {
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v7, "vuiCGPath"));
    CGContextClip(CurrentContext);
    -[UIImage drawAtPoint:](self->_backgroundImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  badgeKind = self->_badgeKind;
  if (badgeKind == 1)
  {
    -[VUITextBadgeView backgroundColor](self, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "set");

    objc_msgSend(v8, "setLineWidth:", self->_strokeSize);
    objc_msgSend(v8, "stroke");
    goto LABEL_14;
  }
  if (badgeKind == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v21 = v20;
    objc_msgSend(v20, "set");

    objc_msgSend(v8, "fill");
    goto LABEL_14;
  }
  if (badgeKind != 2)
    goto LABEL_14;
  if (!-[NSArray count](self->_gradientBgColors, "count"))
  {
    -[VUITextBadgeView backgroundColor](self, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[NSArray objectAtIndexedSubscript:](self->_gradientBgColors, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_gradientBgColors, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)locations = xmmword_1DA1C23E0;
  v13 = objc_retainAutorelease(v10);
  v40[0] = objc_msgSend(v13, "CGColor");
  v14 = objc_retainAutorelease(v11);
  v40[1] = objc_msgSend(v14, "CGColor", v40[0]);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v16 = CGGradientCreateWithColors(DeviceRGB, v15, locations);
  if (v16)
  {
    v17 = v16;
    v45.origin.x = 0.0;
    v45.origin.y = 0.0;
    v45.size.width = width;
    v45.size.height = height;
    MaxX = CGRectGetMaxX(v45);
    CGContextSaveGState(CurrentContext);
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v8, "vuiCGPath"));
    CGContextClip(CurrentContext);
    v43.x = 0.0;
    v43.y = 0.0;
    v44.y = 0.0;
    v44.x = MaxX;
    CGContextDrawLinearGradient(CurrentContext, v17, v43, v44, 3u);
    CGContextRestoreGState(CurrentContext);
    CGGradientRelease(v17);
  }
  CFRelease(DeviceRGB);

LABEL_14:
  p_padding = &self->_padding;
  left = self->_padding.left;
  -[VUITextBadgeView imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUITextBadgeView imageView](self, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "image");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    p_imageView = &self->_imageView;
    if (self->_imageView && v27)
    {
      if (self->_tintColor)
      {
        objc_msgSend(v27, "vui_imageWithColor:");
        v29 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v29;
      }
      v30 = self->_glyphSize.width;
      v31 = self->_glyphSize.height;
      if (!self->_attributedTitle)
        left = (width - v30) * 0.5;
      VUIRoundValue();
      objc_msgSend(v27, "drawInRect:", left, v32, v30, v31);
      left = v30 + 4.0 + left;
    }
  }
  else
  {
    v27 = 0;
    p_imageView = &self->_imageView;
  }
  if (self->_attributedTitle)
  {
    CGContextSetBlendMode(CurrentContext, (CGBlendMode)self->_blendMode);
    v33 = (void *)-[NSAttributedString mutableCopy](self->_attributedTitle, "mutableCopy");
    v34 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    v35 = v34;
    if (*p_imageView)
    {
      width = width - left - p_padding->right;
    }
    else
    {
      objc_msgSend(v34, "setAlignment:", 1);
      left = 0.0;
    }
    objc_msgSend(v33, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v35, 0, objc_msgSend(v33, "length"));
    objc_msgSend(v33, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "capHeight");
    VUIRoundValue();
    v38 = v37 + p_padding->top;
    VUIRoundValue();
    objc_msgSend(v33, "drawWithRect:options:context:", 32, 0, left, v38, width, v39);

  }
  CGContextRestoreGState(CurrentContext);

}

- (void)_invalidateTimer
{
  NSTimer *expiryUpdateTimer;

  -[NSTimer invalidate](self->_expiryUpdateTimer, "invalidate");
  expiryUpdateTimer = self->_expiryUpdateTimer;
  self->_expiryUpdateTimer = 0;

}

- (CGSize)_textSize
{
  NSAttributedString *attributedTitle;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  attributedTitle = self->_attributedTitle;
  if (attributedTitle)
  {
    if (self->_imageView)
      v4 = 3;
    else
      v4 = 11;
    -[NSAttributedString boundingRectWithSize:options:context:](attributedTitle, "boundingRectWithSize:options:context:", v4, 0, 1.79769313e308, 1.79769313e308);
    -[NSAttributedString attribute:atIndex:effectiveRange:](self->_attributedTitle, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_isUppercased)
    {
      objc_msgSend(v5, "capHeight");
    }
    else
    {
      -[NSAttributedString boundingRectWithSize:options:context:](self->_attributedTitle, "boundingRectWithSize:options:context:", 3, 0, 1.79769313e308, 1.79769313e308);
      objc_msgSend(v6, "ascender");
      objc_msgSend(v6, "capHeight");
      objc_msgSend(v6, "descender");
    }
    VUIRoundValue();
    v7 = v9;
    VUIRoundValue();
    v8 = v10;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v11 = v7;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_imageLoaded
{
  -[VUITextBadgeView vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
  -[VUITextBadgeView forceDisplayIfNeeded](self, "forceDisplayIfNeeded");
}

- (void)_setBackgroundImageForMaterialRendering:(id)a3
{
  -[VUITextBadgeView setBackgroundImageForMaterialRendering:imageSize:overlayViewFrame:](self, "setBackgroundImageForMaterialRendering:imageSize:overlayViewFrame:", a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setBackgroundImageForMaterialRendering:(id)a3 imageSize:(CGSize)a4 overlayViewFrame:(CGRect)a5 operationQueue:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  id v15;
  UIImage *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.height;
  v12 = a4.width;
  v16 = (UIImage *)a3;
  v15 = a6;
  objc_storeStrong((id *)&self->_operationQueue, a6);
  if (self->_backgroundImageForMaterialRendering != v16)
  {
    self->_backgroundImageForMaterialRenderingHasChanged = 1;
    objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, a3);
    -[VUITextBadgeView _updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:](self, "_updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:", 0, v12, v11, x, y, width, height);
  }

}

- (void)setBackgroundImageForMaterialRendering:(id)a3 imageSize:(CGSize)a4 overlayViewFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  UIImage *v13;
  UIImage *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v13 = (UIImage *)a3;
  if (self->_backgroundImageForMaterialRendering != v13)
  {
    self->_backgroundImageForMaterialRenderingHasChanged = 1;
    v14 = v13;
    objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, a3);
    -[VUITextBadgeView _updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:](self, "_updateBackgroundMaterialImagesWithBackgroundImageSize:performSynchronously:overlayViewFrame:", 0, v10, v9, x, y, width, height);
    v13 = v14;
  }

}

- (void)_updateBackgroundMaterialImagesWithBackgroundImageSize:(CGSize)a3 performSynchronously:(BOOL)a4 overlayViewFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v9;
  double v10;
  double v11;
  VUIOverlayBackgroundMaterialImagesOperation *v13;
  id v14;
  VUIOverlayWithMaterialRendering *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  VUIOverlayWithMaterialRendering *v20;
  void *v21;
  VUIOverlayBackgroundMaterialImagesOperation *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  VUIOverlayBackgroundMaterialImagesOperation *v33;
  id v34;
  id location;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_backgroundImageForMaterialRendering)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v9 = a4;
    v10 = a3.height;
    v11 = a3.width;
    -[VUITextBadgeView _cancelPendingOperation](self, "_cancelPendingOperation");
    v13 = -[VUIOverlayBackgroundMaterialImagesOperation initWithSourceBackgroundImage:]([VUIOverlayBackgroundMaterialImagesOperation alloc], "initWithSourceBackgroundImage:", self->_backgroundImageForMaterialRendering);
    -[VUIOverlayBackgroundMaterialImagesOperation setResizedBackgroundImageSize:](v13, "setResizedBackgroundImageSize:", v11, v10);
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[VUITextBadgeView _textBadgeBackgroundImageNeedsUpdating](self, "_textBadgeBackgroundImageNeedsUpdating"))
    {
      v15 = [VUIOverlayWithMaterialRendering alloc];
      -[VUITextBadgeView frame](self, "frame");
      v20 = -[VUIOverlayWithMaterialRendering initWithIdentifier:rect:croppedRect:](v15, "initWithIdentifier:rect:croppedRect:", CFSTR("textBadge"), x, y, width, height, v16, v17, v18, v19);
      objc_msgSend(v14, "addObject:", v20);

    }
    -[VUIOverlayBackgroundMaterialImagesOperation setOverlayMaterialRequests:](v13, "setOverlayMaterialRequests:", v14);
    if (v9)
    {
      -[VUIOverlayBackgroundMaterialImagesOperation start](v13, "start");
      -[VUITextBadgeView _updateBackgroundImagesWithCompletedOperation:](self, "_updateBackgroundImagesWithCompletedOperation:", v13);
    }
    else
    {
      objc_initWeak(&location, self);
      v21 = (void *)MEMORY[0x1E0CB34C8];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __113__VUITextBadgeView__updateBackgroundMaterialImagesWithBackgroundImageSize_performSynchronously_overlayViewFrame___block_invoke;
      v32[3] = &unk_1E9F9A938;
      objc_copyWeak(&v34, &location);
      v22 = v13;
      v33 = v22;
      objc_msgSend(v21, "blockOperationWithBlock:", v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addDependency:", v22);
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addOperation:", v23);

      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v22);
      objc_storeStrong((id *)&self->_pendingOperation, v13);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = objc_msgSend(&unk_1EA0BBA90, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v29 != v26)
              objc_enumerationMutation(&unk_1EA0BBA90);
            -[NSOperation addObserver:forKeyPath:options:context:](self->_pendingOperation, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 3, VUITextBadgeViewPendingOperationContext);
          }
          v25 = objc_msgSend(&unk_1EA0BBA90, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v25);
      }

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }

  }
}

void __113__VUITextBadgeView__updateBackgroundMaterialImagesWithBackgroundImageSize_performSynchronously_overlayViewFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateBackgroundImagesWithCompletedOperation:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_updateBackgroundImagesWithCompletedOperation:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "isCancelled");
  v5 = v10;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v10, "resizedSourceBackgroundImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, v6);
    objc_msgSend(v10, "overlayMaterialImageByIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("textBadge"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[VUITextBadgeView setBackgroundImage:](self, "setBackgroundImage:", v9);
        -[VUITextBadgeView _redrawTextBadgeWithDuration:](self, "_redrawTextBadgeWithDuration:", 0.2);
      }
      self->_backgroundImageForMaterialRenderingHasChanged = 0;

    }
    v5 = v10;
  }

}

- (void)_redrawTextBadgeWithDuration:(double)a3
{
  -[VUITextBadgeView _redrawView:withDuration:](self, "_redrawView:withDuration:", self, a3);
}

- (void)_redrawView:(id)a3 withDuration:(double)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_msgSend(v5, "setNeedsDisplay");
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__VUITextBadgeView__redrawView_withDuration___block_invoke;
  v8[3] = &unk_1E9F98DF0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v8, 0, a4);

}

uint64_t __45__VUITextBadgeView__redrawView_withDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "forceDisplayIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_cancelPendingOperation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSOperation *pendingOperation;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(&unk_1EA0BBAA8, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(&unk_1EA0BBAA8);
        -[NSOperation removeObserver:forKeyPath:](self->_pendingOperation, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1EA0BBAA8, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  -[NSOperation cancel](self->_pendingOperation, "cancel");
  pendingOperation = self->_pendingOperation;
  self->_pendingOperation = 0;

}

- (BOOL)_textBadgeBackgroundImageNeedsUpdating
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;

  if (!self->_backgroundImageForMaterialRendering)
    return 0;
  if (self->_backgroundImageForMaterialRenderingHasChanged)
    return 1;
  -[VUITextBadgeView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VUITextBadgeView backgroundImage](self, "backgroundImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend((id)objc_opt_class(), "_viewBackgroundImageNeedsUpdatingWithFrame:currentBackgroundImage:", v12, v5, v7, v9, v11);

  return v13;
}

+ (BOOL)_viewBackgroundImageNeedsUpdatingWithFrame:(CGRect)a3 currentBackgroundImage:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v8;
  BOOL v9;
  double v10;
  double v11;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectEqualToRect(v13, *MEMORY[0x1E0C9D648]))
  {
    v9 = 0;
  }
  else if (v8)
  {
    objc_msgSend(v8, "size");
    v9 = height != v11 || width != v10;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSOperation *pendingOperation;
  objc_super v7;

  if ((void *)VUITextBadgeViewPendingOperationContext == a6)
  {
    pendingOperation = self->_pendingOperation;
    self->_pendingOperation = 0;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VUITextBadgeView;
    -[VUITextBadgeView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (double)strokeSize
{
  return self->_strokeSize;
}

- (void)setStrokeSize:(double)a3
{
  self->_strokeSize = a3;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (UIView)imageView
{
  return self->_imageView;
}

- (VUIRentalExpirationLabel)rentalExpirationLabel
{
  return self->_rentalExpirationLabel;
}

- (VUITextBadgeViewDelegate)delegate
{
  return (VUITextBadgeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)backgroundImageForMaterialRendering
{
  return self->_backgroundImageForMaterialRendering;
}

- (void)setBackgroundImageForMaterialRendering:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, a3);
}

- (unint64_t)badgeKind
{
  return self->_badgeKind;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (NSArray)gradientBgColors
{
  return self->_gradientBgColors;
}

- (void)setGradientBgColors:(id)a3
{
  objc_storeStrong((id *)&self->_gradientBgColors, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)isUppercased
{
  return self->_isUppercased;
}

- (void)setIsUppercased:(BOOL)a3
{
  self->_isUppercased = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)layerCornerRadius
{
  return self->_layerCornerRadius;
}

- (CGSize)glyphSize
{
  double width;
  double height;
  CGSize result;

  width = self->_glyphSize.width;
  height = self->_glyphSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setGlyphSize:(CGSize)a3
{
  self->_glyphSize = a3;
}

- (NSTimer)expiryUpdateTimer
{
  return self->_expiryUpdateTimer;
}

- (void)setExpiryUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expiryUpdateTimer, a3);
}

- (NSOperation)pendingOperation
{
  return self->_pendingOperation;
}

- (void)setPendingOperation:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOperation, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (BOOL)backgroundImageForMaterialRenderingHasChanged
{
  return self->_backgroundImageForMaterialRenderingHasChanged;
}

- (void)setBackgroundImageForMaterialRenderingHasChanged:(BOOL)a3
{
  self->_backgroundImageForMaterialRenderingHasChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_pendingOperation, 0);
  objc_storeStrong((id *)&self->_expiryUpdateTimer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_gradientBgColors, 0);
  objc_storeStrong((id *)&self->_backgroundImageForMaterialRendering, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rentalExpirationLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end
