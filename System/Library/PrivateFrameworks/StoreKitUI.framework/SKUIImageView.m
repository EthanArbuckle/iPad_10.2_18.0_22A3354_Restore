@implementation SKUIImageView

+ (Class)layerClass
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        +[SKUIImageView layerClass].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (UITapGestureRecognizer)tapRecognizer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UITapGestureRecognizer *tapRecognizer;
  UITapGestureRecognizer *v12;
  UITapGestureRecognizer *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIImageView tapRecognizer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  tapRecognizer = self->_tapRecognizer;
  if (!tapRecognizer)
  {
    v12 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
    v13 = self->_tapRecognizer;
    self->_tapRecognizer = v12;

    -[SKUIImageView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    tapRecognizer = self->_tapRecognizer;
  }
  return tapRecognizer;
}

- (void)setImage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  double matched;
  id v21;
  objc_super v22;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIImageView setImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIImageView;
  -[SKUIImageView setImage:](&v22, sel_setImage_, v4);
  if (v4)
    -[SKUIImageView setPlaceholder:](self, "setPlaceholder:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v4;
    objc_msgSend(v13, "cornerRadius");
    v15 = fabs(v14);
    if (v15 < 2.22044605e-16)
    {
      -[SKUIImageView _setCornerRadius:](self, "_setCornerRadius:", 0.0);
      v17 = 0.0;
    }
    else
    {
      v16 = objc_msgSend(v13, "cornerType");
      if (v16 == 1)
      {
        objc_msgSend(v13, "cornerRadius");
        -[SKUIImageView _setCornerRadius:](self, "_setCornerRadius:");
        goto LABEL_15;
      }
      if (v16)
      {
LABEL_15:
        -[SKUIImageView setClipsToBounds:](self, "setClipsToBounds:", v15 >= 2.22044605e-16);
        -[SKUIImageView layer](self, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "borderWidth");
        matched = SKUIGraphicsMatchViewBorderToStroke(self, v19);
        objc_msgSend(v18, "setBorderWidth:");
        objc_msgSend(v13, "borderColor");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v18, "setBorderColor:", objc_msgSend(v21, "CGColor"));

        objc_msgSend(v18, "setAllowsEdgeAntialiasing:", fabs(matched) >= 2.22044605e-16);
        goto LABEL_16;
      }
      objc_msgSend(v13, "cornerRadius");
    }
    -[SKUIImageView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v17);
    goto LABEL_15;
  }
  -[SKUIImageView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 0.0);
  -[SKUIImageView _setCornerRadius:](self, "_setCornerRadius:", 0.0);
  -[SKUIImageView setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[SKUIImageView layer](self, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", 0.0);
  objc_msgSend(v13, "setBorderColor:", 0);
  objc_msgSend(v13, "setAllowsEdgeAntialiasing:", 0);
LABEL_16:

}

- (void)setPlaceholder:(id)a3
{
  SKUIImagePlaceholder *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  id v18;

  v5 = (SKUIImagePlaceholder *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIImageView setPlaceholder:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_placeholder != v5)
  {
    objc_storeStrong((id *)&self->_placeholder, a3);
    -[SKUIImageView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SKUIImagePlaceholder borderColor](v5, "borderColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

      -[SKUIImagePlaceholder borderWidth](v5, "borderWidth");
      objc_msgSend(v14, "setLineWidth:", SKUIGraphicsMatchViewBorderToStroke(self, v16));
      -[SKUIImagePlaceholder cornerPathBlock](v5, "cornerPathBlock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[SKUIImageView setCornerPathBlock:](self, "setCornerPathBlock:", v17);
        self->_lastLayoutSize = (CGSize)*MEMORY[0x1E0C9D820];
        -[SKUIImageView setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        -[SKUIImageView setCornerPathBlock:](self, "setCornerPathBlock:", 0);
        objc_msgSend(v14, "setPath:", 0);
      }
      -[SKUIImagePlaceholder backgroundColor](v5, "backgroundColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "setFillColor:", objc_msgSend(v18, "CGColor"));

    }
    else
    {
      -[SKUIImageView setCornerPathBlock:](self, "setCornerPathBlock:", 0);
      objc_msgSend(v14, "setStrokeColor:", 0);
      objc_msgSend(v14, "setLineWidth:", 0.0);
      objc_msgSend(v14, "setPath:", 0);
      objc_msgSend(v14, "setFillColor:", 0);
    }

  }
}

- (void)setContents:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  id v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIImageView setContents:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SKUIImageView setImage:](self, "setImage:", v4);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[SKUIImageView setImage:](self, "setImage:", 0);
    if ((isKindOfClass & 1) != 0)
      v14 = v4;
    else
      v14 = 0;
    -[SKUIImageView setPlaceholder:](self, "setPlaceholder:", v14);
  }

}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIImageView sizeThatFits:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = self->_imageSize.width;
  v15 = self->_imageSize.height;
  v16 = *MEMORY[0x1E0C9D820];
  v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v14 == *MEMORY[0x1E0C9D820] && v15 == v17)
  {
    -[SKUIImageView image](self, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v14 = v20;
    v15 = v21;

  }
  if (width >= v14)
    v22 = v14;
  else
    v22 = width;
  if (height == v17 && width == v16)
    v22 = v14;
  v24 = v15;
  result.height = v24;
  result.width = v22;
  return result;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (SKUIImagePlaceholder)placeholder
{
  return self->_placeholder;
}

- (id)cornerPathBlock
{
  return self->_cornerPathBlock;
}

- (void)setCornerPathBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cornerPathBlock, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

+ (void)layerClass
{
  OUTLINED_FUNCTION_1();
}

- (void)tapRecognizer
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPlaceholder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContents:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
