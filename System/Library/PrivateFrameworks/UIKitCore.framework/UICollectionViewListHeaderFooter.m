@implementation UICollectionViewListHeaderFooter

id __80___UICollectionViewListHeaderFooter__defaultBackgroundViewConfigurationProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2 == 3)
      +[_UIBackgroundViewConfiguration defaultOutlineParentCellConfigurationForState:](_UIBackgroundViewConfiguration, "defaultOutlineParentCellConfigurationForState:", a2);
    else
      +[_UIBackgroundViewConfiguration defaultPlainListHeaderFooterConfigurationForState:](_UIBackgroundViewConfiguration, "defaultPlainListHeaderFooterConfigurationForState:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:](_UIBackgroundViewConfiguration, "defaultGroupedListHeaderFooterConfigurationForState:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void __71___UICollectionViewListHeaderFooter__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_defaultBackgroundViewConfigurationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfigurationProvider:", v2);

}

uint64_t __58___UICollectionViewListHeaderFooter__resetBackgroundColor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);
}

uint64_t __70___UICollectionViewListHeaderFooter__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfigurationProvider:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfiguration:", 0);
}

void __119___UICollectionViewListHeaderFooter_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_14;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_14)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_14);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Warning once only: Detected a case where constraints ambiguously suggest a size of zero for a _UICollectionViewListHeaderFooter's content view. We're considering the collapse unintentional and using standard size instead. Header/footer: %@", (uint8_t *)&v5, 0xCu);
  }
}

@end
