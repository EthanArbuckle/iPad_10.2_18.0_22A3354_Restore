@implementation SKUIPlaceholderIndexBarEntry

- (SKUIPlaceholderIndexBarEntry)initWithPlaceholderSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIPlaceholderIndexBarEntry *v14;
  SKUIPlaceholderIndexBarEntry *v15;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIPlaceholderIndexBarEntry initWithPlaceholderSize:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIPlaceholderIndexBarEntry;
  v14 = -[SKUIPlaceholderIndexBarEntry init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_placeholderSize.width = width;
    v14->_placeholderSize.height = height;
    -[SKUIIndexBarEntry setEntryType:](v14, "setEntryType:", 4);
  }
  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_placeholderSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p placeholderSize:%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIPlaceholderIndexBarEntry;
  return -[SKUIIndexBarEntry hash](&v3, sel_hash) ^ (unint64_t)(self->_placeholderSize.width * 1000.0) ^ (unint64_t)(self->_placeholderSize.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  SKUIPlaceholderIndexBarEntry *v4;
  BOOL v5;
  objc_super v7;

  v4 = (SKUIPlaceholderIndexBarEntry *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)SKUIPlaceholderIndexBarEntry,
          -[SKUIIndexBarEntry isEqual:](&v7, sel_isEqual_, v4))
      && v4->_placeholderSize.height == self->_placeholderSize.height
      && v4->_placeholderSize.width == self->_placeholderSize.width;
  }

  return v5;
}

- (CGSize)_calculatedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_placeholderSize.width;
  height = self->_placeholderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)placeholderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_placeholderSize.width;
  height = self->_placeholderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)initWithPlaceholderSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
