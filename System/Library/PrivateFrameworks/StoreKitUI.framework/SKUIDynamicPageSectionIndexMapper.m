@implementation SKUIDynamicPageSectionIndexMapper

- (void)dealloc
{
  _NSRange *sectionIndexToEntityRange;
  objc_super v4;

  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (sectionIndexToEntityRange)
  {
    free(sectionIndexToEntityRange);
    self->_sectionIndexToEntityRange = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIDynamicPageSectionIndexMapper;
  -[SKUIDynamicPageSectionIndexMapper dealloc](&v4, sel_dealloc);
}

- (int64_t)numberOfSections
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
        -[SKUIDynamicPageSectionIndexMapper numberOfSections].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  return self->_numberOfSections;
}

- (void)setEntityProvider:(id)a3
{
  SKUIEntityProviding *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (SKUIEntityProviding *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIDynamicPageSectionIndexMapper setEntityProvider:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_entityProvider != v5)
  {
    objc_storeStrong((id *)&self->_entityProvider, a3);
    *(_BYTE *)&self->_entityProviderFlags = *(_BYTE *)&self->_entityProviderFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    self->_numberOfSections = -1;
  }

}

- (int64_t)totalNumberOfEntities
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t numberOfSections;
  _NSRange *sectionIndexToEntityRange;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIDynamicPageSectionIndexMapper totalNumberOfEntities].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  numberOfSections = self->_numberOfSections;
  if (numberOfSections >= 1 && (sectionIndexToEntityRange = self->_sectionIndexToEntityRange) != 0)
    return sectionIndexToEntityRange[numberOfSections - 1].length
         + sectionIndexToEntityRange[numberOfSections - 1].location;
  else
    return 0;
}

- (id)entityIndexPathForGlobalIndex:(int64_t)a3
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
  uint64_t v15;
  uint64_t v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDynamicPageSectionIndexMapper entityIndexPathForGlobalIndex:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[SKUIDynamicPageSectionIndexMapper getItem:section:forGlobalIndex:](self, "getItem:section:forGlobalIndex:", &v16, &v15, a3))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)getItem:(unint64_t *)a3 section:(unint64_t *)a4 forGlobalIndex:(int64_t)a5
{
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t numberOfSections;
  BOOL v18;
  int64_t v19;
  _NSRange *sectionIndexToEntityRange;
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  _NSRange *v24;
  unint64_t location;
  unint64_t length;
  unint64_t v27;
  BOOL v28;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIDynamicPageSectionIndexMapper getItem:section:forGlobalIndex:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  -[SKUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  numberOfSections = self->_numberOfSections;
  v18 = numberOfSections < 1;
  v19 = numberOfSections - 1;
  if (v18)
    return 0;
  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (!sectionIndexToEntityRange)
    return 0;
  v21 = 0;
  while (1)
  {
    v22 = v19 + v21;
    if (v19 + v21 < 0 != __OFADD__(v19, v21))
      ++v22;
    v23 = v22 >> 1;
    v24 = &sectionIndexToEntityRange[v23];
    location = v24->location;
    length = v24->length;
    v28 = a5 >= v24->location;
    v27 = a5 - v24->location;
    v28 = !v28 || v27 >= length;
    if (!v28)
      break;
    if (a5 < location)
      v19 = v23 - 1;
    else
      v21 = v23 + 1;
    if (v19 < v21)
      return 0;
  }
  if (a3)
    *a3 = v27;
  if (a4)
    *a4 = v23;
  return 1;
}

- (int64_t)globalIndexForEntityIndexPath:(id)a3
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
  int64_t v13;
  int64_t v14;
  _NSRange *v15;
  NSUInteger location;
  NSUInteger length;
  unint64_t v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDynamicPageSectionIndexMapper globalIndexForEntityIndexPath:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_msgSend(v4, "section");
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 < self->_numberOfSections)
  {
    v15 = &self->_sectionIndexToEntityRange[v13];
    location = v15->location;
    length = v15->length;
    v18 = objc_msgSend(v4, "item");
    if (v18 < length)
      v14 = v18 + location;
  }

  return v14;
}

- (_NSRange)rangeForSectionAtIndex:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger length;
  int64_t numberOfSections;
  NSUInteger location;
  _NSRange *v16;
  _NSRange result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDynamicPageSectionIndexMapper rangeForSectionAtIndex:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIDynamicPageSectionIndexMapper _loadDataIfNeeded](self, "_loadDataIfNeeded");
  length = 0;
  numberOfSections = self->_numberOfSections;
  location = 0x7FFFFFFFFFFFFFFFLL;
  if (numberOfSections > a3 && (a3 & 0x8000000000000000) == 0 && numberOfSections >= 1)
  {
    v16 = &self->_sectionIndexToEntityRange[a3];
    location = v16->location;
    length = v16->length;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (void)reloadData
{
  self->_numberOfSections = -1;
}

- (void)_loadDataIfNeeded
{
  _NSRange *sectionIndexToEntityRange;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  _NSRange *v9;

  if (self->_numberOfSections < 0)
  {
    sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
    if (sectionIndexToEntityRange)
      free(sectionIndexToEntityRange);
    if ((*(_BYTE *)&self->_entityProviderFlags & 1) != 0)
    {
      v4 = -[SKUIEntityProviding numberOfSections](self->_entityProvider, "numberOfSections");
      self->_sectionIndexToEntityRange = (_NSRange *)malloc_type_calloc(v4, 0x10uLL, 0x1000040451B5BE8uLL);
      if (v4 < 1)
      {
LABEL_9:
        self->_numberOfSections = v4;
        return;
      }
    }
    else
    {
      v4 = 1;
      self->_sectionIndexToEntityRange = (_NSRange *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    }
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = -[SKUIEntityProviding numberOfEntitiesInSection:](self->_entityProvider, "numberOfEntitiesInSection:", v6);
      v9 = &self->_sectionIndexToEntityRange[v5];
      v9->location = v7;
      v9->length = v8;
      v7 += v8;
      ++v6;
      ++v5;
    }
    while (v4 != v6);
    goto LABEL_9;
  }
}

- (SKUIEntityProviding)entityProvider
{
  return self->_entityProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityProvider, 0);
}

- (void)numberOfSections
{
  OUTLINED_FUNCTION_1();
}

- (void)setEntityProvider:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)totalNumberOfEntities
{
  OUTLINED_FUNCTION_1();
}

- (void)entityIndexPathForGlobalIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)getItem:(uint64_t)a3 section:(uint64_t)a4 forGlobalIndex:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)globalIndexForEntityIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)rangeForSectionAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
