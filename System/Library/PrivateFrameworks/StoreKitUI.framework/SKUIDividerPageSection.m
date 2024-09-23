@implementation SKUIDividerPageSection

- (SKUIDividerPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIDividerPageSection *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDividerPageSection initWithPageComponent:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIDividerPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIDividerPageSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
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

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ikBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIDividerPageSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v13, sel_backgroundColorForIndexPath_, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dividerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activePageWidth");
  v10 = v9;
  objc_msgSend(v8, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v5, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v7)
    {
      objc_msgSend(v15, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73ACA30, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "reloadWithViewElement:width:context:", 0, self->_layoutContext, v10);
      objc_msgSend(v13, "setDividerTitle:", v7);
      objc_msgSend(v5, "colorScheme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setColoringWithColorScheme:", v17);

      v14 = 15.0;
      goto LABEL_5;
    }
    objc_msgSend(v15, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73BCD10, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "reloadWithViewElement:width:context:", v8, self->_layoutContext, v10);
    if (!v8)
    {
      objc_msgSend(v5, "colorScheme");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setColoringWithColorScheme:", v22);
      v23 = 15.0;
LABEL_16:

      objc_msgSend(v13, "setLeftEdgeInset:", v23);
      objc_msgSend(v13, "setRightEdgeInset:", 0.0);
      objc_msgSend(v13, "setVerticalAlignment:", 0);
      goto LABEL_6;
    }
    if (objc_msgSend(v8, "dividerType") == 2)
    {
      objc_msgSend(v13, "setDividerType:", 2);
      +[SKUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:](SKUIPageTitledDividerCollectionViewCell, "viewElementInsetDividerHeight:", v8);
      objc_msgSend(v13, "setDividerHeight:");
      objc_msgSend(v8, "style");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ikColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "color");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setInsetColor:", v21);

    }
    else
    {
      if (objc_msgSend(v8, "dividerType") != 1)
      {
        objc_msgSend(v13, "setDividerType:", 0);
        v23 = 15.0;
        goto LABEL_15;
      }
      objc_msgSend(v13, "setDividerType:", 1);
    }
    v23 = 0.0;
LABEL_15:
    objc_msgSend(v8, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setColoringWithStyle:", v22);
    goto LABEL_16;
  }
  objc_msgSend(v5, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73ACA30, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "reloadWithViewElement:width:context:", v8, self->_layoutContext, v10);
  v14 = 0.0;
LABEL_5:
  objc_msgSend(v13, "setTopEdgeInset:", v14);
LABEL_6:

  return v13;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  SKUIViewElementLayoutContext *layoutContext;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[SKUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[SKUIPageTitledDividerCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIPageTitledDividerCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", v8, self->_layoutContext, v6);
    v10 = v9;
  }
  else
  {
    objc_msgSend(v7, "dividerTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    layoutContext = self->_layoutContext;
    if (v11)
    {
      +[SKUIPageTitledDividerCollectionViewCell sizeThatFitsWidth:dividerTitle:context:](SKUIPageTitledDividerCollectionViewCell, "sizeThatFitsWidth:dividerTitle:context:", v11, layoutContext, v6);
      if (v13 >= 47.0)
        v10 = v13;
      else
        v10 = 47.0;
    }
    else
    {
      +[SKUIPageDividerCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIPageDividerCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", 0, layoutContext, v6);
      v10 = v14;
    }

  }
  v15 = v6;
  v16 = ceil(v10);
  result.height = v16;
  result.width = v15;
  return result;
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
  v9.super_class = (Class)SKUIDividerPageSection;
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
  v9.super_class = (Class)SKUIDividerPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (int64_t)numberOfCells
{
  return 1;
}

- (UIEdgeInsets)sectionContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  SKUIDividerPageSection *v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __69__SKUIDividerPageSection_updateCellWithIndexPath_itemState_animated___block_invoke;
  v16 = &unk_1E73A4D20;
  v10 = v9;
  v17 = v10;
  v18 = self;
  v20 = a5;
  v19 = &v21;
  -[SKUIDividerPageSection _enumerateVisibleCellsUsingBlock:](self, "_enumerateVisibleCellsUsingBlock:", &v13);
  if (*((_BYTE *)v22 + 24))
  {
    -[SKUIDividerPageSection _requestCellLayout](self, "_requestCellLayout", v13, v14, v15, v16);
    v11 = *((_BYTE *)v22 + 24) != 0;
  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __69__SKUIDividerPageSection_updateCellWithIndexPath_itemState_animated___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  uint64_t v4;
  char v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF4000F8))
  {
    v3 = objc_msgSend(v6, "updateWithItemState:context:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), *(unsigned __int8 *)(a1 + 56));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v4 + 24))
      v5 = 1;
    else
      v5 = v3;
    *(_BYTE *)(v4 + 24) = v5;
  }

}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SKUIViewElementLayoutContext *v6;
  SKUIViewElementLayoutContext *v7;
  SKUIViewElementLayoutContext *layoutContext;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BCD10);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73ACA30);
  v6 = self->_layoutContext;
  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](v6, "setArtworkRequestDelegate:", 0);
  v7 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  layoutContext = self->_layoutContext;
  self->_layoutContext = v7;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", self);
  -[SKUIDividerPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SKUIDividerPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v9, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SKUIViewElementLayoutContext *layoutContext;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  layoutContext = self->_layoutContext;
  v8 = a4;
  -[SKUIViewElementLayoutContext invalidateAllEditorialLayouts](layoutContext, "invalidateAllEditorialLayouts");
  -[SKUIViewElementLayoutContext setActivePageWidth:](self->_layoutContext, "setActivePageWidth:", width);
  -[SKUIDividerPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SKUIDividerPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SKUIDividerPageSection *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SKUIDividerPageSection_artworkRequest_didLoadImage___block_invoke;
  v10[3] = &unk_1E73A4D48;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  -[SKUIDividerPageSection _enumerateVisibleCellsUsingBlock:](self, "_enumerateVisibleCellsUsingBlock:", v10);

}

void __54__SKUIDividerPageSection_artworkRequest_didLoadImage___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF4000F8))
    objc_msgSend(v3, "setImage:forArtworkRequest:context:", a1[4], a1[5], *(_QWORD *)(a1[6] + 88));

}

- (void)_enumerateVisibleCellsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int64_t v14;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "visibleCells");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__SKUIDividerPageSection__enumerateVisibleCellsUsingBlock___block_invoke;
  v11[3] = &unk_1E73A4D70;
  v13 = v4;
  v14 = v7;
  v12 = v6;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __59__SKUIDividerPageSection__enumerateVisibleCellsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "section") == *(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_requestCellLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  v7 = v8;
  if (v8)
  {
    +[SKUIPageTitledDividerCollectionViewCell requestLayoutForViewElement:width:context:](SKUIPageTitledDividerCollectionViewCell, "requestLayoutForViewElement:width:context:", v8, self->_layoutContext, v6);
    v7 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDividerPageSection initWithPageComponent:]";
}

@end
