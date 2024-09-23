@implementation SKUIMenuPageSectionContext

- (id)sectionsForIndex:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *sections;
  void *v14;
  void *v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMenuPageSectionContext sectionsForIndex:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  sections = self->_sections;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sections, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setSections:(id)a3 forIndex:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *sections;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIMenuPageSectionContext setSections:forIndex:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  sections = self->_sections;
  if (!sections)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = self->_sections;
    self->_sections = v16;

    sections = self->_sections;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sections, "setObject:forKey:", v6, v18);

}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)sectionsForIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSections:(uint64_t)a3 forIndex:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
