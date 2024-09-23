@implementation UICollectionLayoutListConfiguration

- (void)setSeparatorConfiguration:(UIListSeparatorConfiguration *)separatorConfiguration
{
  UIListSeparatorConfiguration *v4;
  UIListSeparatorConfiguration *v5;
  id v6;

  if (!separatorConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Setting a nil separatorConfiguration is not supported"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v4 = (UIListSeparatorConfiguration *)-[UIListSeparatorConfiguration copy](separatorConfiguration, "copy");
  v5 = self->_separatorConfiguration;
  self->_separatorConfiguration = v4;

}

- (UIListSeparatorConfiguration)separatorConfiguration
{
  return (UIListSeparatorConfiguration *)(id)-[UIListSeparatorConfiguration copy](self->_separatorConfiguration, "copy");
}

- (void)_setWillBeginSwipingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)_setDidEndSwipingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)_spiConfiguration
{
  void *v3;
  int64_t appearance;
  id v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "set_apiVersion:", 1);
  objc_msgSend(v3, "set_headerElementKind:", CFSTR("UICollectionElementKindSectionHeader"));
  objc_msgSend(v3, "set_footerElementKind:", CFSTR("UICollectionElementKindSectionFooter"));
  if ((unint64_t)(self->_appearance - 1) >= 4)
    appearance = 0;
  else
    appearance = self->_appearance;
  objc_msgSend(v3, "setAppearanceStyle:", appearance);
  objc_msgSend(v3, "setSeparatorStyle:", self->_showsSeparators);
  v5 = -[UIListSeparatorConfiguration __copyWithSubclass:inZone:](self->_separatorConfiguration, "__copyWithSubclass:inZone:", objc_opt_class(), 0);
  objc_msgSend(v3, "_setSeparatorConfiguration:", v5);

  v6 = (void *)objc_msgSend(self->_itemSeparatorHandler, "copy");
  objc_msgSend(v3, "_setItemSeparatorHandler:", v6);

  objc_msgSend(v3, "set_backgroundColor:", self->_backgroundColor);
  objc_msgSend(v3, "setLeadingSwipeActionsConfigurationProvider:", self->_leadingSwipeActionsConfigurationProvider);
  objc_msgSend(v3, "setTrailingSwipeActionsConfigurationProvider:", self->_trailingSwipeActionsConfigurationProvider);
  objc_msgSend(v3, "setWillBeginSwipingHandler:", self->_willBeginSwipingHandler);
  objc_msgSend(v3, "setDidEndSwipingHandler:", self->_didEndSwipingHandler);
  if (self->_headerMode == 1)
    v7 = 1.79769313e308;
  else
    v7 = -1000.0;
  objc_msgSend(v3, "setSectionHeaderHeight:", v7);
  if (self->_footerMode == 1)
    v8 = 1.79769313e308;
  else
    v8 = -1000.0;
  objc_msgSend(v3, "setSectionFooterHeight:", v8);
  objc_msgSend(v3, "setStylesFirstItemAsHeader:", self->_headerMode == 2);
  objc_msgSend(v3, "setHeaderTopPadding:", self->_headerTopPadding);
  objc_msgSend(v3, "setCornerRadius:", self->_cornerRadius);
  objc_msgSend(v3, "setSectionHeaderHugsContent:", self->_contentHuggingElements & 1);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAppearance:", self->_appearance);
  v5 = v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = self->_showsSeparators;
    v6 = -[UIListSeparatorConfiguration copy](self->_separatorConfiguration, "copy");
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = objc_msgSend(self->_itemSeparatorHandler, "copy");
    v9 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v8;

    objc_storeStrong((id *)(v5 + 64), self->_backgroundColor);
    v10 = objc_msgSend(self->_leadingSwipeActionsConfigurationProvider, "copy");
    v11 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v10;

    v12 = objc_msgSend(self->_trailingSwipeActionsConfigurationProvider, "copy");
    v13 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v12;

    v14 = objc_msgSend(self->_willBeginSwipingHandler, "copy");
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    v16 = objc_msgSend(self->_didEndSwipingHandler, "copy");
    v17 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v16;

    *(_QWORD *)(v5 + 88) = self->_headerMode;
    *(_QWORD *)(v5 + 96) = self->_footerMode;
    *(double *)(v5 + 104) = self->_headerTopPadding;
    *(double *)(v5 + 24) = self->_cornerRadius;
    *(_QWORD *)(v5 + 112) = self->_contentHuggingElements;
  }
  return (id)v5;
}

- (void)setTrailingSwipeActionsConfigurationProvider:(UICollectionLayoutListSwipeActionsConfigurationProvider)trailingSwipeActionsConfigurationProvider
{
  objc_setProperty_nonatomic_copy(self, a2, trailingSwipeActionsConfigurationProvider, 80);
}

- (void)setLeadingSwipeActionsConfigurationProvider:(UICollectionLayoutListSwipeActionsConfigurationProvider)leadingSwipeActionsConfigurationProvider
{
  objc_setProperty_nonatomic_copy(self, a2, leadingSwipeActionsConfigurationProvider, 72);
}

- (void)setItemSeparatorHandler:(UICollectionLayoutListItemSeparatorHandler)itemSeparatorHandler
{
  objc_setProperty_nonatomic_copy(self, a2, itemSeparatorHandler, 56);
}

- (void)setHeaderMode:(UICollectionLayoutListHeaderMode)headerMode
{
  self->_headerMode = headerMode;
}

- (void)setFooterMode:(UICollectionLayoutListFooterMode)footerMode
{
  self->_footerMode = footerMode;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  objc_storeStrong((id *)&self->_backgroundColor, backgroundColor);
}

- (UICollectionLayoutListConfiguration)initWithAppearance:(UICollectionLayoutListAppearance)appearance
{
  UICollectionLayoutListConfiguration *v4;
  void *v5;
  UIListSeparatorConfiguration *v6;
  UIListSeparatorConfiguration *separatorConfiguration;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionLayoutListConfiguration;
  v4 = -[UICollectionLayoutListConfiguration init](&v11, sel_init);
  if (v4)
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_appearance = appearance;
    v6 = -[UIListSeparatorConfiguration initWithListAppearance:]([UIListSeparatorConfiguration alloc], "initWithListAppearance:", appearance);
    separatorConfiguration = v4->_separatorConfiguration;
    v4->_separatorConfiguration = v6;

    if (dyld_program_sdk_at_least())
    {
      if ((unint64_t)(appearance - 1) > 2)
        v8 = 0;
      else
        v8 = qword_18667AE30[appearance - 1];
      _UITableConstantsForTraitCollection(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_showsSeparators = objc_msgSend(v9, "defaultSeparatorStyleForTableViewStyle:", v8) != 0;

    }
    else
    {
      v4->_showsSeparators = 1;
    }
    v4->_headerTopPadding = 1.79769313e308;
    v4->_cornerRadius = 1.79769313e308;

  }
  return v4;
}

- (void)setShowsSeparators:(BOOL)showsSeparators
{
  self->_showsSeparators = showsSeparators;
}

- (void)setHeaderTopPadding:(CGFloat)headerTopPadding
{
  if (headerTopPadding < 0.0)
    headerTopPadding = 1.79769313e308;
  self->_headerTopPadding = headerTopPadding;
}

- (BOOL)_sectionHeaderHugsContent
{
  return self->_contentHuggingElements == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trailingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_leadingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong(&self->_itemSeparatorHandler, 0);
  objc_storeStrong(&self->_didEndSwipingHandler, 0);
  objc_storeStrong(&self->_willBeginSwipingHandler, 0);
  objc_storeStrong((id *)&self->_separatorConfiguration, 0);
}

- (UICollectionLayoutListHeaderMode)headerMode
{
  return self->_headerMode;
}

- (void)_setCornerRadius:(double)a3
{
  if (a3 < 0.0)
    a3 = 1.79769313e308;
  self->_cornerRadius = a3;
}

- (UICollectionLayoutListAppearance)appearance
{
  return self->_appearance;
}

- (UICollectionLayoutListConfiguration)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("init is unavailable on %@."), v6);

  return 0;
}

- (void)_setSectionHeaderHugsContent:(BOOL)a3
{
  self->_contentHuggingElements = a3;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (id)_willBeginSwipingHandler
{
  return self->_willBeginSwipingHandler;
}

- (id)_didEndSwipingHandler
{
  return self->_didEndSwipingHandler;
}

- (BOOL)showsSeparators
{
  return self->_showsSeparators;
}

- (UICollectionLayoutListItemSeparatorHandler)itemSeparatorHandler
{
  return self->_itemSeparatorHandler;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UICollectionLayoutListSwipeActionsConfigurationProvider)leadingSwipeActionsConfigurationProvider
{
  return self->_leadingSwipeActionsConfigurationProvider;
}

- (UICollectionLayoutListSwipeActionsConfigurationProvider)trailingSwipeActionsConfigurationProvider
{
  return self->_trailingSwipeActionsConfigurationProvider;
}

- (UICollectionLayoutListFooterMode)footerMode
{
  return self->_footerMode;
}

- (CGFloat)headerTopPadding
{
  return self->_headerTopPadding;
}

- (unint64_t)contentHuggingElements
{
  return self->_contentHuggingElements;
}

- (void)setContentHuggingElements:(unint64_t)a3
{
  self->_contentHuggingElements = a3;
}

@end
