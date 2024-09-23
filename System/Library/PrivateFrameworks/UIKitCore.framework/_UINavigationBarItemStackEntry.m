@implementation _UINavigationBarItemStackEntry

- (_UINavigationBarLayout)normalLayout
{
  return self->_normalLayout;
}

- (BOOL)isSearchActive
{
  return self->_searchActive;
}

- (_UINavigationBarLayout)activeLayout
{
  uint64_t v2;

  v2 = 32;
  if (!self->_searchActive)
    v2 = 24;
  return (_UINavigationBarLayout *)*(id *)((char *)&self->super.isa + v2);
}

- (_UINavigationBarLayout)searchLayout
{
  return self->_searchLayout;
}

- (void)setNormalLayout:(id)a3
{
  objc_storeStrong((id *)&self->_normalLayout, a3);
}

- (UINavigationItem)item
{
  return self->_item;
}

- (_UINavigationBarLayout)inactiveLayout
{
  uint64_t v2;

  v2 = 24;
  if (!self->_searchActive)
    v2 = 32;
  return (_UINavigationBarLayout *)*(id *)((char *)&self->super.isa + v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchLayout, 0);
  objc_storeStrong((id *)&self->_normalLayout, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)setSearchActive:(BOOL)a3
{
  self->_searchActive = a3;
}

+ (id)newEntryForItem:(id)a3
{
  objc_msgSend(a1, "entryForItem:replaceExistingWithNew:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  _UINavigationBarItemStackEntry *v3;
  objc_super v4;

  -[UINavigationItem _stackEntry](self->_item, "_stackEntry");
  v3 = (_UINavigationBarItemStackEntry *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[UINavigationItem _setStackEntry:](self->_item, "_setStackEntry:", 0);
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarItemStackEntry;
  -[_UINavigationBarItemStackEntry dealloc](&v4, sel_dealloc);
}

+ (id)entryForItem:(id)a3 replaceExistingWithNew:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "_stackEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || v4)
  {
    v8 = objc_opt_new();

    objc_storeStrong((id *)(v8 + 16), a3);
    *(_BYTE *)(v8 + 8) = 0;
    objc_msgSend(v6, "_setStackEntry:", v8);
    v7 = (void *)v8;
  }

  return v7;
}

- (void)setSearchLayout:(id)a3
{
  objc_storeStrong((id *)&self->_searchLayout, a3);
}

- (void)updateStateFromCounterpart:(id)a3
{
  _UINavigationBarItemStackEntry *v4;
  UINavigationItem *v5;
  UINavigationItem *item;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  _UINavigationBarItemStackEntry *v12;
  __int16 v13;
  _UINavigationBarItemStackEntry *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (_UINavigationBarItemStackEntry *)a3;
  -[_UINavigationBarItemStackEntry item](v4, "item");
  v5 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();
  item = self->_item;

  if (os_variant_has_internal_diagnostics())
  {
    if (v5 != item)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v11 = 138412546;
        v12 = self;
        v13 = 2112;
        v14 = v4;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "%@: Ignoring unexpected nonmatching counterpart: %@\nThis is an internal UIKit bug.", (uint8_t *)&v11, 0x16u);
      }
      goto LABEL_7;
    }
  }
  else if (v5 != item)
  {
    v9 = updateStateFromCounterpart____s_category;
    if (!updateStateFromCounterpart____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&updateStateFromCounterpart____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%@: Ignoring unexpected nonmatching counterpart: %@\nThis is an internal UIKit bug.", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_8;
  }
  if (v4 != self)
  {
    if (-[_UINavigationBarItemStackEntry isSearchActive](v4, "isSearchActive"))
    {
      self->_searchActive = 1;
      goto LABEL_8;
    }
    -[_UINavigationBarItemStackEntry item](v4, "item");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject _searchControllerIfAllowed](v7, "_searchControllerIfAllowed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_searchActive = objc_msgSend(v8, "isActive");

LABEL_7:
  }
LABEL_8:

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarItemStackEntry;
  -[_UINavigationBarItemStackEntry description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_searchActive)
    v5 = CFSTR(" normalLayout=%p searchLayout[active]=%p");
  else
    v5 = CFSTR(" normalLayout[active]=%p searchLayout=%p");
  objc_msgSend(v4, "appendFormat:", v5, self->_normalLayout, self->_searchLayout);
  objc_msgSend(v4, "appendFormat:", CFSTR(" item=%@"), self->_item);
  return v4;
}

@end
