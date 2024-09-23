@implementation SKUICompressedImage

- (id)description
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUICompressedImage description].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = -[SKUICompressedImage cornerType](self, "cornerType");
  v12 = CFSTR("SKUICornerTypeArc");
  if (v11 != 1)
    v12 = 0;
  if (v11)
    v13 = v12;
  else
    v13 = CFSTR("SKUICornerTypeContinuous");
  v14 = (void *)MEMORY[0x1E0CB3940];
  v23.receiver = self;
  v23.super_class = (Class)SKUICompressedImage;
  -[SKUICompressedImage description](&v23, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICompressedImage cornerRadius](self, "cornerRadius");
  v17 = v16;
  -[SKUICompressedImage borderWidth](self, "borderWidth");
  v19 = v18;
  -[SKUICompressedImage borderColor](self, "borderColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: {%@, %f}; {%f, %@};"), v15, v13, v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (int64_t)cornerType
{
  return self->_cornerType;
}

- (void)setCornerType:(int64_t)a3
{
  self->_cornerType = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (void)description
{
  OUTLINED_FUNCTION_1();
}

@end
