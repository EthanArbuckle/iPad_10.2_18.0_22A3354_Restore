@implementation SKUIRowViewElementPageSection

- (SKUIRowViewElementPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIRowViewElementPageSection *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIRowViewElementPageSection initWithPageComponent:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIRowViewElementPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIRowViewElementPageSection;
  -[SKUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (UIEdgeInsets)sectionContentInset
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  UIEdgeInsets result;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("modern"));

  if (!v6)
    goto LABEL_4;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForStyle:", *MEMORY[0x1E0D3A5A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "edgeInsetsValue");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = v12;
    v20 = v14;
    v21 = v16;
    v22 = v18;
  }
  else
  {
LABEL_4:
    v23.receiver = self;
    v23.super_class = (Class)SKUIRowViewElementPageSection;
    -[SKUIStorePageSection sectionContentInset](&v23, sel_sectionContentInset);
  }
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v9);

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "columns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "item");

  objc_msgSend(v12, "objectAtIndex:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addItemViewElement:", v14);
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIRowViewElementPageSection _firstChildForColumn:](self, "_firstChildForColumn:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ikBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v12;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SKUIRowViewElementPageSection;
    -[SKUIStorePageSection backgroundColorForIndexPath:](&v16, sel_backgroundColorForIndexPath_, v4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
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
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIRowViewElementPageSection _firstChildForColumn:](self, "_firstChildForColumn:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRowViewElementPageSection _reuseIdentifierForViewElement:](self, "_reuseIdentifierForViewElement:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIRowViewElementPageSection _contentInsetForIndexPath:](self, "_contentInsetForIndexPath:", v4);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v13, "setContentInset:", v15, v17, v19, v21);
  -[SKUIRowViewElementPageSection _interiorColumnSpacing](self, "_interiorColumnSpacing");
  v23 = v22;
  -[SKUIRowViewElementPageSection _singleColumnWidth](self, "_singleColumnWidth");
  v25 = v24;
  v26 = objc_msgSend(v8, "columnSpan");
  v27 = v23 * (double)(v26 - 1) + (double)v26 * v25;
  v28 = floorf(v27);
  objc_msgSend(v9, "style");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "visibility");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v30, "isEqualToString:", CFSTR("hidden"));

  if ((_DWORD)v12)
    v31 = 0;
  else
    v31 = v9;
  objc_msgSend(v13, "reloadWithViewElement:width:context:", v31, self->_cellLayoutContext, v28);

  return v13;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[7];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  CGSize result;

  v4 = a3;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x3010000000;
  v16 = &unk_1BBF15257;
  v17 = *MEMORY[0x1E0C9D820];
  v5 = objc_msgSend(v4, "item");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__SKUIRowViewElementPageSection_cellSizeForIndexPath___block_invoke;
  v12[3] = &unk_1E73A7358;
  v12[5] = &v13;
  v12[6] = v5;
  v12[4] = self;
  -[SKUIRowViewElementPageSection _enumerateViewElementsUsingBlock:](self, "_enumerateViewElementsUsingBlock:", v12);
  -[SKUIRowViewElementPageSection _contentInsetForIndexPath:](self, "_contentInsetForIndexPath:", v4);
  v8 = v14[5];
  v9 = v6 + v7 + v14[4];
  v14[4] = v9;
  _Block_object_dispose(&v13, 8);

  v10 = v9;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

void __54__SKUIRowViewElementPageSection_cellSizeForIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  id v12;

  v7 = a2;
  if (*(_QWORD *)(a1 + 48) == a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a4;
  v12 = v7;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "_cellClassForViewElement:", v7);
  if (v8)
  {
    objc_msgSend(v8, "sizeThatFitsWidth:viewElement:context:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), a4);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(double *)(v10 + 40);
    if (v11 < v9)
      v11 = v9;
    *(double *)(v10 + 40) = v11;
  }

}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIRowViewElementPageSection _firstChildForColumn:](self, "_firstChildForColumn:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (v9)
  {
    if (objc_msgSend(v9, "isEnabled"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __72__SKUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
      v10[3] = &unk_1E73A3160;
      objc_copyWeak(&v12, &location);
      v11 = v9;
      objc_msgSend(v11, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v10);

      objc_destroyWeak(&v12);
    }
    else
    {
      objc_msgSend(v9, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x1E73B7150, 0x1E73B7170, 1, 0, 0, 0);
    }
  }
  objc_destroyWeak(&location);

}

void __72__SKUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;
  char v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SKUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E73A72B8;
  v7 = a2;
  v8 = a3;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __72__SKUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 48) || !*(_BYTE *)(a1 + 49))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "performDefaultActionForViewElement:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeMetricsImpressionSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v8);
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "columns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v4, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v12);
  v13.receiver = self;
  v13.super_class = (Class)SKUIRowViewElementPageSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v13, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  objc_super v12;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeMetricsImpressionSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endActiveImpressionForViewElement:", v8);
  objc_msgSend(v8, "columns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "item");
  if (v10 < objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endActiveImpressionForViewElement:", v11);
    v8 = (void *)v11;
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIRowViewElementPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v12, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[SKUIRowViewElementPageSection _requestLayoutForCells](self, "_requestLayoutForCells");
  v8.receiver = self;
  v8.super_class = (Class)SKUIRowViewElementPageSection;
  -[SKUIStorePageSection entityProvider:didInvalidateWithContext:](&v8, sel_entityProvider_didInvalidateWithContext_, v7, v6);

}

- (int64_t)numberOfCells
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  objc_super v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SKUIRowViewElementPageSection_prefetchResourcesWithReason___block_invoke;
  v6[3] = &unk_1E73A7380;
  v6[4] = self;
  v6[5] = a3;
  -[SKUIRowViewElementPageSection _enumerateViewElementsUsingBlock:](self, "_enumerateViewElementsUsingBlock:", v6);
  v5.receiver = self;
  v5.super_class = (Class)SKUIRowViewElementPageSection;
  -[SKUIStorePageSection prefetchResourcesWithReason:](&v5, sel_prefetchResourcesWithReason_, a3);
}

void __61__SKUIRowViewElementPageSection_prefetchResourcesWithReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)objc_msgSend(v3, "_cellClassForViewElement:", v4), "prefetchResourcesForViewElement:reason:context:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  float v23;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SKUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "updateWithItemState:context:animated:", v9, self->_cellLayoutContext, v5);
  if (v13)
  {
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "columns");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "item"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIRowViewElementPageSection _interiorColumnSpacing](self, "_interiorColumnSpacing");
    v19 = v18;
    -[SKUIRowViewElementPageSection _singleColumnWidth](self, "_singleColumnWidth");
    v21 = v20;
    v22 = objc_msgSend(v17, "columnSpan");
    v23 = v19 * (double)(v22 - 1) + (double)v22 * v21;
    objc_msgSend((id)objc_opt_class(), "requestLayoutForViewElement:width:context:", v17, self->_cellLayoutContext, floorf(v23));

  }
  return v13;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SKUIViewElementLayoutContext *v6;
  SKUIViewElementLayoutContext *v7;
  SKUIViewElementLayoutContext *cellLayoutContext;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BE850);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7C90);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B36D0);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BD8F0);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B6AF0);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BBD70);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7A90);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AA4B0);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B2830);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B49F0);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BB050);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AE590);
  v6 = self->_cellLayoutContext;
  v7 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  -[SKUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", MEMORY[0x1E0C9AAB0], 0x1E73B5C30);
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", objc_msgSend(v10, "elementType"));
  -[SKUIRowViewElementPageSection _requestLayoutForCells](self, "_requestLayoutForCells");
  v11.receiver = self;
  v11.super_class = (Class)SKUIRowViewElementPageSection;
  -[SKUIStorePageSection willAppearInContext:](&v11, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SKUIViewElementLayoutContext *cellLayoutContext;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  v8 = a4;
  -[SKUIViewElementLayoutContext setActivePageWidth:](cellLayoutContext, "setActivePageWidth:", width);
  -[SKUIRowViewElementPageSection _requestLayoutForCells](self, "_requestLayoutForCells");
  v9.receiver = self;
  v9.super_class = (Class)SKUIRowViewElementPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  SKUIRowViewElementPageSection *v18;
  int64_t v19;

  v6 = a3;
  v7 = a4;
  -[SKUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SKUIStorePageSection sectionIndex](self, "sectionIndex");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__SKUIRowViewElementPageSection_artworkRequest_didLoadImage___block_invoke;
  v14[3] = &unk_1E73A73A8;
  v18 = self;
  v19 = v10;
  v15 = v9;
  v16 = v7;
  v17 = v6;
  v11 = v6;
  v12 = v7;
  v13 = v9;
  -[SKUIRowViewElementPageSection _enumerateViewElementsUsingBlock:](self, "_enumerateViewElementsUsingBlock:", v14);

}

void __61__SKUIRowViewElementPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 64));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forArtworkRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 88));

}

- (Class)_cellClassForCardViewElement:(id)a3
{
  objc_msgSend(a3, "cardType");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (Class)_cellClassForLockupViewElement:(id)a3
{
  void *v3;

  if ((unint64_t)objc_msgSend(a3, "lockupViewType") <= 8)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (Class)_cellClassForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  objc_class *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  if (v5 > 49)
  {
    if (v5 != 66)
    {
LABEL_10:
      v6 = (objc_class *)objc_opt_class();
      goto LABEL_11;
    }
    v6 = -[SKUIRowViewElementPageSection _cellClassForLockupViewElement:](self, "_cellClassForLockupViewElement:", v4);
  }
  else
  {
    if (v5 <= 13 || v5 != 14)
      goto LABEL_10;
    v6 = -[SKUIRowViewElementPageSection _cellClassForCardViewElement:](self, "_cellClassForCardViewElement:", v4);
  }
LABEL_11:
  v7 = v6;

  return v7;
}

- (UIEdgeInsets)_contentInsetForIndexPath:(id)a3
{
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "columns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[SKUIRowViewElementPageSection _interiorColumnSpacing](self, "_interiorColumnSpacing");
  v12 = v11;
  v13 = objc_msgSend(v6, "item");

  v14 = v12 * 0.5;
  v15 = floorf(v14);
  if (v13)
    v16 = v15;
  else
    v16 = 15.0;
  if (v13 == v10 - 1)
    v17 = 15.0;
  else
    v17 = v15;
  v18 = v4;
  v19 = v5;
  result.right = v17;
  result.bottom = v19;
  result.left = v16;
  result.top = v18;
  return result;
}

- (void)_enumerateViewElementsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[SKUIRowViewElementPageSection _interiorColumnSpacing](self, "_interiorColumnSpacing");
  v6 = v5;
  -[SKUIRowViewElementPageSection _singleColumnWidth](self, "_singleColumnWidth");
  v8 = v7;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "columns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__SKUIRowViewElementPageSection__enumerateViewElementsUsingBlock___block_invoke;
  v13[3] = &unk_1E73A73D0;
  v15 = v6;
  v16 = v8;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

}

void __66__SKUIRowViewElementPageSection__enumerateViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  float v11;
  double v12;
  uint64_t v13;
  id v14;

  v7 = *(double *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  v9 = a2;
  v10 = objc_msgSend(v9, "columnSpan");
  v11 = v7 * (double)(v10 - 1) + (double)v10 * v8;
  v12 = floorf(v11);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_firstChildForColumn:", v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, double))(v13 + 16))(v13, v14, a3, a4, v12);
}

- (id)_firstChildForColumn:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__73;
  v11 = __Block_byref_object_dispose__73;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SKUIRowViewElementPageSection__firstChildForColumn___block_invoke;
  v6[3] = &unk_1E73A01D0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateChildrenUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__SKUIRowViewElementPageSection__firstChildForColumn___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (double)_interiorColumnSpacing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[SKUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activePageWidth");
  v9 = 20.0;
  if (v6 != 2)
  {
    if (v6 == 3)
    {
      if (v8 <= 1000.0)
      {
        if (v8 <= 700.0)
          v9 = 4.0;
        else
          v9 = 18.0;
      }
    }
    else if (v6 == 4)
    {
      objc_msgSend(v7, "clientContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = SKUIUserInterfaceIdiom(v10);

      if (v11 == 1)
        v9 = 18.0;
      else
        v9 = 4.0;
    }
    else
    {
      v9 = 0.0;
    }
  }

  return v9;
}

- (void)_requestLayoutForCells
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__SKUIRowViewElementPageSection__requestLayoutForCells__block_invoke;
  v2[3] = &unk_1E73A73F8;
  v2[4] = self;
  -[SKUIRowViewElementPageSection _enumerateViewElementsUsingBlock:](self, "_enumerateViewElementsUsingBlock:", v2);
}

void __55__SKUIRowViewElementPageSection__requestLayoutForCells__block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend((id)objc_msgSend(v5, "_cellClassForViewElement:", v6), "requestLayoutForViewElement:width:context:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), a3);

}

- (id)_reuseIdentifierForCardViewElement:(id)a3
{
  uint64_t v3;
  uint64_t *v4;

  v3 = objc_msgSend(a3, "cardType");
  v4 = &SKUICardViewElementCollectionViewCellReuseIdentifier;
  if (v3 == 3)
    v4 = &SKUIEditorialCardCellReuseIdentifier;
  return (id)*v4;
}

- (id)_reuseIdentifierForLockupViewElement:(id)a3
{
  unint64_t v3;
  id v4;

  v3 = objc_msgSend(a3, "lockupViewType");
  if (v3 <= 8)
    v4 = (id)*off_1E73A7460[v3];
  return v4;
}

- (id)_reuseIdentifierForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  if (v5 > 49)
  {
    if (v5 > 133)
    {
      if (v5 == 134)
      {
        v6 = CFSTR("SKUIStarHistogramCellReuseIdentifier");
        goto LABEL_24;
      }
      if (v5 == 141)
        goto LABEL_19;
      if (v5 != 152)
        goto LABEL_14;
LABEL_18:
      v6 = CFSTR("SKUIImageReuseIdentifier");
      goto LABEL_24;
    }
    if (v5 == 50)
      goto LABEL_19;
    if (v5 == 62)
    {
      v6 = CFSTR("SKUIHorizontalListReuseIdentifier");
      goto LABEL_24;
    }
    if (v5 != 66)
      goto LABEL_14;
    -[SKUIRowViewElementPageSection _reuseIdentifierForLockupViewElement:](self, "_reuseIdentifierForLockupViewElement:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 <= 13)
    {
      if ((unint64_t)(v5 - 12) >= 2)
      {
        if (v5 == 4)
        {
          v6 = CFSTR("SKUIActivityIndicatorReuseIdentifier");
LABEL_24:
          v7 = v6;
          goto LABEL_25;
        }
LABEL_14:
        v6 = CFSTR("SKUISpacerReuseIdentifier");
        goto LABEL_24;
      }
LABEL_19:
      v6 = CFSTR("SKUIButtonReuseIdentifier");
      goto LABEL_24;
    }
    if (v5 != 14)
    {
      if (v5 == 28)
      {
        v6 = CFSTR("SKUICounterReuseIdentifier");
        goto LABEL_24;
      }
      if (v5 != 49)
        goto LABEL_14;
      goto LABEL_18;
    }
    -[SKUIRowViewElementPageSection _reuseIdentifierForCardViewElement:](self, "_reuseIdentifierForCardViewElement:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_25:
  v8 = v7;

  return v8;
}

- (double)_singleColumnWidth
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "columnSpan", (_QWORD)v19);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  -[SKUIRowViewElementPageSection _interiorColumnSpacing](self, "_interiorColumnSpacing");
  v13 = v12;
  -[SKUIStorePageSection context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activePageWidth");
  v16 = v15;

  v17 = (v16 + -30.0 - v13 * (double)(v9 - 1)) / (double)v9;
  return floorf(v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRowViewElementPageSection initWithPageComponent:]";
}

@end
