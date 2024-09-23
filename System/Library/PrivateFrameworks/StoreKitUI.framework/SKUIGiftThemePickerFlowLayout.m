@implementation SKUIGiftThemePickerFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double currentPage;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftThemePickerFlowLayout targetContentOffsetForProposedContentOffset:].cold.1();
  }
  currentPage = (double)self->_currentPage;
  -[SKUIGiftThemePickerFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6 * currentPage;

  v8 = 0.0;
  v9 = v7;
  result.y = v8;
  result.x = v9;
  return result;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (void)targetContentOffsetForProposedContentOffset:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftThemePickerFlowLayout targetContentOffsetForProposedContentOffset:]";
}

@end
