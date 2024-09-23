@implementation SKUIIndexBarEntry

+ (id)entryWithAttributedString:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIAttributedStringIndexBarEntry *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIIndexBarEntry entryWithAttributedString:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = -[SKUIAttributedStringIndexBarEntry initWithAttributedString:]([SKUIAttributedStringIndexBarEntry alloc], "initWithAttributedString:", v3);

  return v12;
}

+ (id)entryWithImage:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIImageIndexBarEntry *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIIndexBarEntry entryWithImage:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = -[SKUIImageIndexBarEntry initWithImage:]([SKUIImageIndexBarEntry alloc], "initWithImage:", v3);

  return v12;
}

+ (id)placeholderEntryWithSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIIndexBarEntry placeholderEntryWithSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return -[SKUIPlaceholderIndexBarEntry initWithPlaceholderSize:]([SKUIPlaceholderIndexBarEntry alloc], "initWithPlaceholderSize:", width, height);
}

+ (id)systemCombinedEntry
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIIndexBarEntry systemCombinedEntry].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return objc_alloc_init(SKUISystemCombinedIndexBarEntry);
}

- (unint64_t)hash
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIIndexBarEntry hash].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return (self->_entryType ^ self->_visibilityPriority) + 52314;
}

- (BOOL)isEqual:(id)a3
{
  SKUIIndexBarEntry *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v4 = (SKUIIndexBarEntry *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIIndexBarEntry isEqual:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    v13 = (objc_opt_isKindOfClass() & 1) != 0
       && v4->_visibilityPriority == self->_visibilityPriority
       && v4->_entryType == self->_entryType;
  }

  return v13;
}

- (CGSize)contentSize
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double width;
  double height;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIIndexBarEntry contentSize].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if (self->_hasValidContentSize)
  {
    width = self->_contentSize.width;
    height = self->_contentSize.height;
  }
  else
  {
    -[SKUIIndexBarEntry _calculatedContentSize](self, "_calculatedContentSize");
    self->_contentSize.width = width;
    self->_contentSize.height = height;
    self->_hasValidContentSize = 1;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (NSAttributedString)entryAttributedString
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIIndexBarEntry entryAttributedString].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (UIImage)entryImage
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIIndexBarEntry entryImage].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (void)setTintColor:(id)a3
{
  UIColor *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIColor *tintColor;

  v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIIndexBarEntry setTintColor:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  tintColor = self->_tintColor;
  if (tintColor != v5 && (-[UIColor isEqual:](tintColor, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    -[SKUIIndexBarEntry _tintColorDidChange](self, "_tintColorDidChange");
  }

}

- (CGSize)size
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIIndexBarEntry size].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIIndexBarEntry contentSize](self, "contentSize");
  v12 = v11 + self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  v14 = v13 + self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom;
  result.height = v14;
  result.width = v12;
  return result;
}

- (UIColor)tintColor
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIColor *tintColor;
  UIColor *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIIndexBarEntry tintColor].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  tintColor = self->_tintColor;
  if (tintColor)
  {
    v12 = tintColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (CGSize)_calculatedContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_drawInRect:(CGRect)a3
{
  -[SKUIIndexBarEntry _drawContentInRect:](self, "_drawContentInRect:", a3.origin.x + self->_contentEdgeInsets.left, a3.origin.y + self->_contentEdgeInsets.top, a3.size.width - (self->_contentEdgeInsets.left + self->_contentEdgeInsets.right), a3.size.height - (self->_contentEdgeInsets.top + self->_contentEdgeInsets.bottom));
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (int64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(int64_t)a3
{
  self->_entryType = a3;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void)setVisibilityPriority:(int64_t)a3
{
  self->_visibilityPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

+ (void)entryWithAttributedString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)entryWithImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)placeholderEntryWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)systemCombinedEntry
{
  OUTLINED_FUNCTION_1();
}

- (void)hash
{
  OUTLINED_FUNCTION_1();
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)contentSize
{
  OUTLINED_FUNCTION_1();
}

- (void)entryAttributedString
{
  OUTLINED_FUNCTION_1();
}

- (void)entryImage
{
  OUTLINED_FUNCTION_1();
}

- (void)setTintColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)size
{
  OUTLINED_FUNCTION_1();
}

- (void)tintColor
{
  OUTLINED_FUNCTION_1();
}

@end
