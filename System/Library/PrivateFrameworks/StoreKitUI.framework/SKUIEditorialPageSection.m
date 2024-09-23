@implementation SKUIEditorialPageSection

- (SKUIEditorialPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIEditorialPageSection *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIEditorialPageSection initWithPageComponent:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIEditorialPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, v4);

  return v5;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v6);

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  SKUIEditorialLayout *editorialLayout;
  SKUIColorScheme *colorScheme;
  objc_super v8;

  editorialLayout = self->_editorialLayout;
  self->_editorialLayout = 0;

  colorScheme = self->_colorScheme;
  self->_colorScheme = 0;

  self->_hasValidColorScheme = 0;
  v8.receiver = self;
  v8.super_class = (Class)SKUIEditorialPageSection;
  return -[SKUIStorePageSection applyUpdateType:](&v8, sel_applyUpdateType_, a3);
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B32F0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEditorialPageSection _colorScheme](self, "_colorScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColoringWithColorScheme:", v9);

  objc_msgSend(v8, "resetContentInset");
  if (!-[SKUIStorePageSection isTopSection](self, "isTopSection"))
  {
    objc_msgSend(v8, "contentInset");
    -[SKUIStorePageSection context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "horizontalPadding");
    v12 = v11;

    -[SKUIStorePageSection context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "horizontalPadding");
    v15 = v14;

    objc_msgSend(v8, "setContentInset:", 0.0, v15, 0.0, v12);
  }
  -[SKUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyEditorialLayout:withOrientation:expanded:", v16, 0, self->_isExpanded);

  objc_msgSend(v8, "textBoxView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMoreButtonTitle:", v21);

  if (self->_isExpanded)
  {
    v22 = 0;
  }
  else
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "maximumBodyLines");

  }
  objc_msgSend(v17, "setNumberOfVisibleLines:", v22);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  CGSize result;

  -[SKUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  -[SKUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutHeightForOrientation:expanded:", 0, self->_isExpanded);
  v9 = v8;
  objc_msgSend(v7, "bodyTextLayoutForOrientation:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleTextLayoutForOrientation:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
    v9 = v9 + 17.0;

  v13 = v6;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bodyTextLayoutForOrientation:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_isExpanded && objc_msgSend(v7, "requiresTruncation"))
  {
    self->_isExpanded = 1;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadItemsAtIndexPaths:", v9);

  }
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SKUIEditorialPageSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SKUIEditorialPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[SKUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v11)
  {
    objc_msgSend(v11, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applyEditorialLayout:withOrientation:expanded:", v10, 0, self->_isExpanded);

    v8 = v11;
  }

}

- (void)willAppearInContext:(id)a3
{
  id v4;
  SKUIColorScheme *colorScheme;
  void *v6;
  void *v7;
  void *v8;
  SKUIEditorialLayout *editorialLayout;
  void *v10;
  SKUIViewElementLayoutContext *v11;
  SKUIViewElementLayoutContext *v12;
  SKUIViewElementLayoutContext *layoutContext;
  objc_super v14;

  v4 = a3;
  colorScheme = self->_colorScheme;
  self->_colorScheme = 0;

  self->_hasValidColorScheme = 0;
  objc_msgSend(v4, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B32F0);

  objc_msgSend(v4, "textLayoutCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEditorialLayout layoutCache](self->_editorialLayout, "layoutCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    editorialLayout = self->_editorialLayout;
    self->_editorialLayout = 0;

  }
  -[SKUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueLayoutRequests");

  v11 = self->_layoutContext;
  v12 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v11);
  layoutContext = self->_layoutContext;
  self->_layoutContext = v12;

  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v14, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SKUIEditorialLayout *editorialLayout;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  editorialLayout = self->_editorialLayout;
  self->_editorialLayout = 0;
  v8 = a4;

  -[SKUIEditorialPageSection _editorialLayout](self, "_editorialLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueLayoutRequests");

  v10.receiver = self;
  v10.super_class = (Class)SKUIEditorialPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v10, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (id)_colorScheme
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIColorScheme *v8;
  SKUIColorScheme *colorScheme;
  void *v10;
  SKUIColorScheme *v11;
  SKUIColorScheme *v12;

  if (!self->_hasValidColorScheme)
  {
    self->_hasValidColorScheme = 1;
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIViewElementLayoutContext tintColor](self->_layoutContext, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementPlainColorWithStyle(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(SKUIColorScheme);
      colorScheme = self->_colorScheme;
      self->_colorScheme = v8;

      -[SKUIColorScheme setPrimaryTextColor:](self->_colorScheme, "setPrimaryTextColor:", v7);
    }
    else
    {
      -[SKUIStorePageSection context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorScheme");
      v11 = (SKUIColorScheme *)objc_claimAutoreleasedReturnValue();
      v12 = self->_colorScheme;
      self->_colorScheme = v11;

    }
  }
  return self->_colorScheme;
}

- (id)_editorialLayout
{
  SKUIEditorialLayout *editorialLayout;
  void *v4;
  SKUIEditorialLayout *v5;
  void *v6;
  void *v7;
  void *v8;
  SKUIEditorialLayout *v9;
  SKUIEditorialLayout *v10;
  SKUIEditorialLayout *v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  editorialLayout = self->_editorialLayout;
  if (!editorialLayout)
  {
    -[SKUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SKUIEditorialLayout alloc];
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLayoutCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SKUIEditorialLayout initWithEditorial:layoutCache:](v5, "initWithEditorial:layoutCache:", v6, v8);
    v10 = self->_editorialLayout;
    self->_editorialLayout = v9;

    v11 = self->_editorialLayout;
    objc_msgSend(v4, "activePageWidth");
    v13 = v12;
    -[SKUIStorePageSection context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "horizontalPadding");
    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v11, "setLayoutWidth:forOrientation:", 0, v13 + v15 * -2.0);

    editorialLayout = self->_editorialLayout;
  }
  return editorialLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_editorialLayout, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorialPageSection initWithPageComponent:]";
}

@end
