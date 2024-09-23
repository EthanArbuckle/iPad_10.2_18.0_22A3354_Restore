@implementation SKUIStorePageSplit

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStorePageSplit copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v13, "setDividerColor:", self->_dividerColor);
  objc_msgSend(v13, "setNumberOfPageSections:", self->_numberOfPageSections);
  objc_msgSend(v13, "setPageComponents:", self->_pageComponents);
  objc_msgSend(v13, "setSectionContext:", self->_sectionContext);
  objc_msgSend(v13, "setWidthFraction:", self->_widthFraction);
  return v13;
}

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
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIStorePageSplit description].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePageSplit;
  -[SKUIStorePageSplit description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: Count: %ld, Context: %@"), v12, self->_numberOfPageSections, self->_sectionContext);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (void)setDividerColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)numberOfPageSections
{
  return self->_numberOfPageSections;
}

- (void)setNumberOfPageSections:(int64_t)a3
{
  self->_numberOfPageSections = a3;
}

- (NSArray)pageComponents
{
  return self->_pageComponents;
}

- (void)setPageComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SKUIStorePageSectionContext)sectionContext
{
  return self->_sectionContext;
}

- (void)setSectionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sectionContext, a3);
}

- (double)widthFraction
{
  return self->_widthFraction;
}

- (void)setWidthFraction:(double)a3
{
  self->_widthFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionContext, 0);
  objc_storeStrong((id *)&self->_pageComponents, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)description
{
  OUTLINED_FUNCTION_1();
}

@end
