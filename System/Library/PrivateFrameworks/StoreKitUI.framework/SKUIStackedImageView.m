@implementation SKUIStackedImageView

- (SKUIStackedImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIStackedImageView *v16;
  SKUIStackedImageView *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  MPUStackView *stackView;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIStackedImageView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIStackedImageView;
  v16 = -[SKUIStackedImageView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    v16->_stackDepth = 3;
    v18 = SKUIMPUFoundationFramework();
    v19 = SKUIWeakLinkedClassForString(CFSTR("MPUBorderedImageStackItemView"), v18);
    v20 = objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("MPUStackView"), v18));
    -[SKUIStackedImageView bounds](v17, "bounds");
    v21 = objc_msgSend(v20, "initWithFrame:itemClass:itemReuseIdentifier:", v19, CFSTR("0"));
    stackView = v17->_stackView;
    v17->_stackView = (MPUStackView *)v21;

    -[MPUStackView setDataSource:](v17->_stackView, "setDataSource:", v17);
    -[MPUStackView setForcesIntegralY:](v17->_stackView, "setForcesIntegralY:", 1);
    -[SKUIStackedImageView addSubview:](v17, "addSubview:", v17->_stackView);
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[MPUStackView setDataSource:](self->_stackView, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIStackedImageView;
  -[SKUIStackedImageView dealloc](&v3, sel_dealloc);
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  float v6;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_opt_class();
  if (v5)
  {
    objc_msgSend(v5, "_configurationForSize:", width, height, 0);
    v6 = 0.0 * (double)0;
  }
  else
  {
    v6 = 0.0;
  }
  return floorf(v6);
}

- (UIView)perspectiveTargetView
{
  return (UIView *)-[MPUStackView perspectiveTargetView](self->_stackView, "perspectiveTargetView");
}

- (void)setBorderDrawingCache:(id)a3
{
  MPUBorderDrawingCache *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (MPUBorderDrawingCache *)a3;
  if (self->_borderDrawingCache != v5)
  {
    objc_storeStrong((id *)&self->_borderDrawingCache, a3);
    -[MPUStackView items](self->_stackView, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setBorderDrawingCache:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIStackedImageView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SKUIStackedImageView;
    -[SKUIImageView setImage:](&v15, sel_setImage_, v4);
    -[MPUStackView items](self->_stackView, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setImage:", v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  int64_t v12;

  height = a3.height;
  width = a3.width;
  -[MPUStackView setBaseSize:](self->_stackView, "setBaseSize:");
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v6 = (void *)objc_opt_class();
  if (v6)
  {
    objc_msgSend(v6, "_configurationForSize:", width, height);
    v8 = *((double *)&v10 + 1);
    v7 = *(double *)&v10;
  }
  else
  {
    v12 = 0;
    v8 = 0.0;
    v7 = 0.0;
    v10 = 0u;
    v11 = 0u;
  }
  -[MPUStackView setMaximumRelativeOffsetStep:](self->_stackView, "setMaximumRelativeOffsetStep:", v7, v8);
  -[MPUStackView setSizeInsetStep:](self->_stackView, "setSizeInsetStep:", v11);
  if (self->_stackDepth != v12)
  {
    self->_stackDepth = v12;
    -[MPUStackView reloadData](self->_stackView, "reloadData");
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStackedImageView;
  -[SKUIImageView setImageSize:](&v9, sel_setImageSize_, width, height);
}

- (void)setPerspectiveTargetView:(id)a3
{
  -[MPUStackView setPerspectiveTargetView:](self->_stackView, "setPerspectiveTargetView:", a3);
}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[MPUStackView setVanishingPoint:](self->_stackView, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[MPUStackView updateForChangedDistanceFromVanishingPoint](self->_stackView, "updateForChangedDistanceFromVanishingPoint");
}

- (CGPoint)vanishingPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[MPUStackView vanishingPoint](self->_stackView, "vanishingPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUIStackedImageView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUIStackedImageView;
    -[SKUIStackedImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[SKUIStackedImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  -[SKUIStackedImageView center](self, "center");
  if (x != v7 || y != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)SKUIStackedImageView;
    -[SKUIStackedImageView setCenter:](&v9, sel_setCenter_, x, y);
    -[SKUIStackedImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v6;
  MPUStackView *stackView;
  objc_super v8;

  -[SKUIImageView imageSize](self, "imageSize");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[SKUIStackedImageView image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");

  }
  stackView = self->_stackView;
  -[SKUIStackedImageView bounds](self, "bounds");
  SKUIImageRectForBounds();
  -[MPUStackView setFrame:](stackView, "setFrame:");
  -[MPUStackView updateForChangedDistanceFromVanishingPoint](self->_stackView, "updateForChangedDistanceFromVanishingPoint");
  v8.receiver = self;
  v8.super_class = (Class)SKUIStackedImageView;
  -[SKUIImageView layoutSubviews](&v8, sel_layoutSubviews);
}

- (int64_t)numberOfItemsInStackView:(id)a3
{
  return self->_stackDepth;
}

- (void)stackView:(id)a3 applyAttributesToItem:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  MPUBorderConfiguration *borderConfiguration;
  uint64_t v11;
  MPUBorderConfiguration *v12;
  MPUBorderConfiguration *v13;
  MPUBorderConfiguration *v14;
  void *v15;
  MPUBorderConfiguration *v16;
  void *v17;
  MPUBorderConfiguration *v18;
  void *v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double v24;
  double v25;
  void *v26;
  CGAffineTransform v27;
  CGAffineTransform v28;

  v8 = a3;
  v9 = a4;
  borderConfiguration = self->_borderConfiguration;
  if (!borderConfiguration)
  {
    v11 = SKUIMPUFoundationFramework();
    v12 = (MPUBorderConfiguration *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("MPUBorderConfiguration"), v11));
    v13 = self->_borderConfiguration;
    self->_borderConfiguration = v12;

    if (stackView_applyAttributesToItem_atIndex__sOnce != -1)
      dispatch_once(&stackView_applyAttributesToItem_atIndex__sOnce, &__block_literal_global_17);
    v14 = self->_borderConfiguration;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUBorderConfiguration setDropShadowColor:](v14, "setDropShadowColor:", v15);

    -[MPUBorderConfiguration setDropShadowEdges:](self->_borderConfiguration, "setDropShadowEdges:", 11);
    -[MPUBorderConfiguration setDropShadowWidth:](self->_borderConfiguration, "setDropShadowWidth:", 1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale);
    v16 = self->_borderConfiguration;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUBorderConfiguration setBorderColor:](v16, "setBorderColor:", v17);

    -[MPUBorderConfiguration setBorderWidth:](self->_borderConfiguration, "setBorderWidth:", 1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale);
    v18 = self->_borderConfiguration;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUBorderConfiguration setFillColor:](v18, "setFillColor:", v19);

    borderConfiguration = self->_borderConfiguration;
  }
  if ((unint64_t)a5 >= 5)
    a5 = 5;
  -[MPUBorderConfiguration setFillAlpha:](borderConfiguration, "setFillAlpha:", stackView_applyAttributesToItem_atIndex__sItemOverlayCenterWhiteAlphas[a5]);
  -[MPUBorderConfiguration setBorderAlpha:](self->_borderConfiguration, "setBorderAlpha:", stackView_applyAttributesToItem_atIndex__sItemOverlayBorderWhiteAlphas[a5]);
  objc_msgSend(v9, "setBorderConfiguration:", self->_borderConfiguration);
  objc_msgSend(v9, "setImageAlpha:", stackView_applyAttributesToItem_atIndex__sItemImageAlphas[a5]);
  objc_msgSend(v9, "setImageContentsRect:", stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 1], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 2], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 3]);
  v20 = a5 - 1;
  v21 = *MEMORY[0x1E0C9BAA8];
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v28.c = v22;
  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v28.tx = v23;
  if (((0x15uLL >> a5) & 1) == 0 || v20 <= 1)
  {
    v24 = 1.0;
    if (((0x15uLL >> a5) & 1) != 0)
      v25 = 1.0;
    else
      v25 = -1.0;
    if (v20 < 2)
      v24 = -1.0;
    *(_OWORD *)&v27.a = v21;
    *(_OWORD *)&v27.c = v22;
    *(_OWORD *)&v27.tx = v23;
    CGAffineTransformScale(&v28, &v27, v25, v24);
  }
  v27 = v28;
  objc_msgSend(v9, "setImageTransform:", &v27);
  -[SKUIStackedImageView image](self, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v26);

}

void __64__SKUIStackedImageView_stackView_applyAttributesToItem_atIndex___block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  stackView_applyAttributesToItem_atIndex__sScreenScale = v0;

}

- (void)stackView:(id)a3 didCreateItem:(id)a4
{
  objc_msgSend(a4, "setBorderDrawingCache:", self->_borderDrawingCache);
}

+ (SKUIStackedImageConfiguration)_configurationForSize:(SEL)a3
{
  double height;
  double width;
  SKUIStackedImageConfiguration *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;

  height = a4.height;
  width = a4.width;
  result = (SKUIStackedImageConfiguration *)os_variant_has_internal_content();
  if ((_DWORD)result)
  {
    result = (SKUIStackedImageConfiguration *)_os_feature_enabled_impl();
    if ((_DWORD)result)
    {
      result = (SKUIStackedImageConfiguration *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if ((_DWORD)result)
        +[SKUIStackedImageView _configurationForSize:].cold.1((uint64_t)result, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 3;
  if (height >= width)
    v15 = width;
  else
    v15 = height;
  if (v15 < 50.0)
  {
    *(_OWORD *)&retstr->var0.vertical = xmmword_1BBED17B0;
    retstr->var1.height = 1.0;
    return result;
  }
  if (v15 < 80.0)
  {
    __asm { FMOV            V1.2D, #2.0 }
    retstr->var0 = (UIOffset)xmmword_1BBED17A0;
    retstr->var1 = _Q1;
    retstr->var2 = 4;
    return result;
  }
  if (v15 >= 100.0)
  {
    if (v15 >= 120.0)
    {
      if (v15 >= 160.0)
        __asm { FMOV            V0.2D, #9.0 }
      else
        __asm { FMOV            V0.2D, #6.0 }
      __asm { FMOV            V1.2D, #3.0 }
      goto LABEL_21;
    }
    __asm { FMOV            V0.2D, #4.0 }
  }
  else
  {
    __asm { FMOV            V0.2D, #3.0 }
  }
  __asm { FMOV            V1.2D, #2.0 }
LABEL_21:
  retstr->var0 = _Q0;
  retstr->var1 = _Q1;
  return result;
}

- (MPUBorderDrawingCache)borderDrawingCache
{
  return self->_borderDrawingCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderDrawingCache, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_borderConfiguration, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_configurationForSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
