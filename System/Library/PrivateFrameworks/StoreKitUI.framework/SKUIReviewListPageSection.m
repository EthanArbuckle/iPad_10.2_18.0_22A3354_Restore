@implementation SKUIReviewListPageSection

- (SKUIReviewListPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUIReviewListPageSection *v5;
  uint64_t v6;
  NSMutableDictionary *contextActionsRegistration;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewListPageSection initWithPageComponent:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIReviewListPageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v9, sel_initWithPageComponent_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    contextActionsRegistration = v5->_contextActionsRegistration;
    v5->_contextActionsRegistration = (NSMutableDictionary *)v6;

  }
  return v5;
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
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "item");

  objc_msgSend(v12, "objectAtIndex:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addItemViewElement:", v14);
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
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
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  SKUIReviewListPageSection *v26;
  id v27;
  id v28;
  double v29;
  _QWORD v30[4];
  id v31;
  SKUIReviewListPageSection *v32;
  id v33;
  id v34;
  double v35;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[SKUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B4FB0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSeparatorStyle:", 5);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSeparatorColor:", v13);

  objc_msgSend(v6, "activePageWidth");
  v15 = v14 + -30.0;
  -[SKUIReviewListPageSection _contentInsetForReviewIndex:](self, "_contentInsetForReviewIndex:", v5);
  objc_msgSend(v12, "setContentInset:");
  objc_msgSend(v12, "reloadWithViewElement:width:context:", v10, self->_cellLayoutContext, v15);
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__SKUIReviewListPageSection_cellForIndexPath___block_invoke;
  v30[3] = &unk_1E73A66D0;
  v17 = v10;
  v35 = v15;
  v31 = v17;
  v32 = self;
  v18 = v6;
  v33 = v18;
  v19 = v4;
  v34 = v19;
  objc_msgSend(v12, "setDescriptionTapAction:", v30);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __46__SKUIReviewListPageSection_cellForIndexPath___block_invoke_2;
  v24[3] = &unk_1E73A66D0;
  v29 = v15;
  v25 = v17;
  v26 = self;
  v27 = v18;
  v28 = v19;
  v20 = v19;
  v21 = v18;
  v22 = v17;
  objc_msgSend(v12, "setResponseDescriptionTapAction:", v24);

  return v12;
}

void __46__SKUIReviewListPageSection_cellForIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "expandableLabelElementForWidth:context:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "expandEditorialForLabelElement:", v2);
    objc_msgSend(*(id *)(a1 + 48), "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadItemsAtIndexPaths:", v4);

  }
}

void __46__SKUIReviewListPageSection_cellForIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__60;
  v10 = __Block_byref_object_dispose__60;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__SKUIReviewListPageSection_cellForIndexPath___block_invoke_6;
  v5[3] = &unk_1E73A40C0;
  v5[6] = *(_QWORD *)(a1 + 64);
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = &v6;
  objc_msgSend(v2, "enumerateChildrenUsingBlock:", v5);
  if (v7[5])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "expandEditorialForLabelElement:");
    objc_msgSend(*(id *)(a1 + 48), "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadItemsAtIndexPaths:", v4);

  }
  _Block_object_dispose(&v6, 8);

}

void __46__SKUIReviewListPageSection_cellForIndexPath___block_invoke_6(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "elementType") == 102)
  {
    objc_msgSend(v8, "expandableLabelElementForWidth:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(double *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activePageWidth");
  v7 = v6;

  v8 = objc_msgSend(v4, "item");
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKUIReviewCollectionViewCell sizeThatFitsWidth:viewElement:context:](SKUIReviewCollectionViewCell, "sizeThatFitsWidth:viewElement:context:", v12, self->_cellLayoutContext, v7 + -30.0);
  v14 = v13 + 15.0;

  v15 = v7;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "item");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SKUIStorePageSection pageComponent](self, "pageComponent", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("highlight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v4, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "item");

  v11 = v8 - 1;
  if (v10 < 1 || v10 >= v11)
  {
    v13 = 5;
    if (!v10)
      v13 = 13;
    if (v10 == v11)
      v12 = v13 | 0x20;
    else
      v12 = v13;
  }
  else
  {
    v12 = 21;
  }
  objc_msgSend(v4, "setPosition:", v12);
  v14.receiver = self;
  v14.super_class = (Class)SKUIReviewListPageSection;
  -[SKUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v14, sel_collectionViewWillApplyLayoutAttributes_, v4);

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
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v4, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v12);
  v13.receiver = self;
  v13.super_class = (Class)SKUIReviewListPageSection;
  -[SKUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v13, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)registerContextActionsForCell:(id)a3 indexPath:(id)a4 viewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v9, "item"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "dialogTemplate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SKUIReviewListPageSection _contextActionRegistrationKeyWithCell:indexPath:](self, "_contextActionRegistrationKeyWithCell:indexPath:", v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __84__SKUIReviewListPageSection_registerContextActionsForCell_indexPath_viewController___block_invoke;
      v19[3] = &unk_1E73A66F8;
      v20 = v14;
      objc_msgSend(v10, "registerForPreviewingFromSourceView:handler:", v8, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewListPageSection contextActionsRegistration](self, "contextActionsRegistration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v16);

    }
  }

}

SKUIContextActionsConfiguration *__84__SKUIReviewListPageSection_registerContextActionsForCell_indexPath_viewController___block_invoke(uint64_t a1)
{
  SKUIContextActionsConfiguration *v2;
  void *v3;
  SKUIContextActionsConfiguration *v4;

  v2 = [SKUIContextActionsConfiguration alloc];
  objc_msgSend(*(id *)(a1 + 32), "dialogTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKUIContextActionsConfiguration initWithDialogTemplate:](v2, "initWithDialogTemplate:", v3);

  return v4;
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
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
  v9 = objc_msgSend(v4, "item");
  objc_msgSend(v8, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endActiveImpressionForViewElement:", v11);
    v8 = (void *)v11;
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIReviewListPageSection;
  -[SKUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v12, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)unregisterContextActionsForCell:(id)a3 indexPath:(id)a4 viewController:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  -[SKUIReviewListPageSection _contextActionRegistrationKeyWithCell:indexPath:](self, "_contextActionRegistrationKeyWithCell:indexPath:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewListPageSection contextActionsRegistration](self, "contextActionsRegistration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v12, "unregisterForPreviewing:", v10);
    -[SKUIReviewListPageSection contextActionsRegistration](self, "contextActionsRegistration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v8);

  }
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[SKUIReviewListPageSection _requestCellLayout](self, "_requestCellLayout");
  v8.receiver = self;
  v8.super_class = (Class)SKUIReviewListPageSection;
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
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v15, "item");
    -[SKUIStorePageSection pageComponent](self, "pageComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "activePageWidth");
    v13 = v12 + -30.0;
    -[SKUIReviewListPageSection _contentInsetForReviewIndex:](self, "_contentInsetForReviewIndex:", v8);
    objc_msgSend(v7, "setContentInset:");
    objc_msgSend(v11, "objectAtIndex:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadWithViewElement:width:context:", v14, self->_cellLayoutContext, v13);

  }
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
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B4FB0);
  v6 = self->_cellLayoutContext;
  v7 = -[SKUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SKUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", objc_msgSend(v10, "elementType"));
  -[SKUIReviewListPageSection _requestCellLayout](self, "_requestCellLayout");
  v11.receiver = self;
  v11.super_class = (Class)SKUIReviewListPageSection;
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
  -[SKUIViewElementLayoutContext invalidateAllEditorialLayouts](cellLayoutContext, "invalidateAllEditorialLayouts");
  -[SKUIViewElementLayoutContext setActivePageWidth:](self->_cellLayoutContext, "setActivePageWidth:", width);
  -[SKUIReviewListPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SKUIReviewListPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (id)_contextActionRegistrationKeyWithCell:(id)a3 indexPath:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = objc_msgSend(a3, "hash");
  v8 = objc_msgSend(v6, "hash");

  objc_msgSend(v5, "numberWithUnsignedInteger:", v8 + v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIEdgeInsets)_contentInsetForReviewIndex:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 15.0;
  if (!a3)
    v3 = 0.0;
  v4 = 15.0;
  v5 = 15.0;
  v6 = 15.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_requestCellLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activePageWidth");
  v8 = v7;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = v8 + -30.0;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v9);
        +[SKUIReviewCollectionViewCell requestLayoutForViewElement:width:context:](SKUIReviewCollectionViewCell, "requestLayoutForViewElement:width:context:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), self->_cellLayoutContext, v12, (_QWORD)v15);
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (NSMutableDictionary)contextActionsRegistration
{
  return self->_contextActionsRegistration;
}

- (void)setContextActionsRegistration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextActionsRegistration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIReviewListPageSection initWithPageComponent:]";
}

@end
