@implementation SKUIScreenshotDataConsumer

+ (id)consumer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIScreenshotDataConsumer consumer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___SKUIScreenshotDataConsumer;
  objc_msgSendSuper2(&v12, sel_consumer);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)consumerWithScreenshotSize:(CGSize)a3
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
  void *v14;
  void *v15;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUIScreenshotDataConsumer consumerWithScreenshotSize:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  objc_msgSend(a1, "consumer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImageSize:", width, height);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderColor:", v15);

  objc_msgSend(v14, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);
  return v14;
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 forcesPortrait;
  _BOOL4 v17;
  double v18;
  double v19;
  void *v20;
  objc_super v22;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIScreenshotDataConsumer imageForColor:size:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  forcesPortrait = self->_forcesPortrait;
  v17 = width > height;
  if (forcesPortrait && v17)
    v18 = height;
  else
    v18 = width;
  if (forcesPortrait && v17)
    v19 = width;
  else
    v19 = height;
  v22.receiver = self;
  v22.super_class = (Class)SKUIScreenshotDataConsumer;
  -[SKUIStyledImageDataConsumer imageForColor:size:](&v22, sel_imageForColor_size_, v7, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)imageForImage:(id)a3
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
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIScreenshotDataConsumer imageForImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_forcesPortrait)
  {
    objc_msgSend(v4, "size");
    v14 = v13;
    objc_msgSend(v4, "size");
    if (v14 > v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0DC3870]);
      v17 = objc_retainAutorelease(v4);
      v18 = objc_msgSend(v17, "CGImage");
      objc_msgSend(v17, "scale");
      v4 = (id)objc_msgSend(v16, "initWithCGImage:scale:orientation:", v18, 2);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIScreenshotDataConsumer;
  -[SKUIStyledImageDataConsumer imageForImage:](&v21, sel_imageForImage_, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)forcesPortrait
{
  return self->_forcesPortrait;
}

- (void)setForcesPortrait:(BOOL)a3
{
  self->_forcesPortrait = a3;
}

+ (void)consumer
{
  OUTLINED_FUNCTION_1();
}

+ (void)consumerWithScreenshotSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)imageForColor:(uint64_t)a3 size:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
