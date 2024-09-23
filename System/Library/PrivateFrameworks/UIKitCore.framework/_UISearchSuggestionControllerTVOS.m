@implementation _UISearchSuggestionControllerTVOS

- (id)makeCollectionView
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "-makeCollectionView not implemented on this platform", buf, 2u);
    }

  }
  else
  {
    v2 = makeCollectionView___s_category;
    if (!makeCollectionView___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&makeCollectionView___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "-makeCollectionView not implemented on this platform", v6, 2u);
    }
  }
  return 0;
}

- (void)updateSearchString:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "-updateSearchString: not implemented on this platform", buf, 2u);
    }

  }
  else
  {
    v3 = updateSearchString____s_category;
    if (!updateSearchString____s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&updateSearchString____s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "-updateSearchString: not implemented on this platform", v6, 2u);
    }
  }
}

- (BOOL)shouldDisplayDefaultSuggestion
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "shouldDisplayDefaultSuggestion not supported on this platform", buf, 2u);
    }

  }
  else
  {
    v2 = shouldDisplayDefaultSuggestion___s_category;
    if (!shouldDisplayDefaultSuggestion___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&shouldDisplayDefaultSuggestion___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "shouldDisplayDefaultSuggestion not supported on this platform", v6, 2u);
    }
  }
  return 0;
}

- (void)setShouldDisplayDefaultSuggestion:(BOOL)a3
{
  self->_shouldDisplayDefaultSuggestion = a3;
}

- (BOOL)showSearchSuggestionPreview
{
  return self->_showSearchSuggestionPreview;
}

- (void)setShowSearchSuggestionPreview:(BOOL)a3
{
  self->_showSearchSuggestionPreview = a3;
}

- (NSString)searchSuggestionsTitle
{
  return self->_searchSuggestionsTitle;
}

- (void)setSearchSuggestionsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestionsTitle, 0);
}

@end
