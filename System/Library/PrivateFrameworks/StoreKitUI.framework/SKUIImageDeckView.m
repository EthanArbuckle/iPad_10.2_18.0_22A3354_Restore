@implementation SKUIImageDeckView

- (SKUIImageDeckView)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIImageDeckView *v11;
  uint64_t v12;
  NSMapTable *viewElementViews;
  uint64_t v14;
  UIDynamicAnimator *animator;
  objc_super v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIImageDeckView init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIImageDeckView;
  v11 = -[SKUIImageDeckView init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElementViews = v11->_viewElementViews;
    v11->_viewElementViews = (NSMapTable *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3790]), "initWithReferenceView:", v11);
    animator = v11->_animator;
    v11->_animator = (UIDynamicAnimator *)v14;

  }
  return v11;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIImageDeckView prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__SKUIImageDeckView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v20[3] = &unk_1E73A1208;
  v17 = v8;
  v22 = &v24;
  v23 = a4;
  v21 = v17;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v20);
  v18 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __68__SKUIImageDeckView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "elementType") == 49)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    v4 = v9;
    objc_msgSend(v3, "colorWithWhite:alpha:", 0.0, 0.15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowColor:", v5);

    objc_msgSend(v4, "setShadowOffset:", 5.0, 0.0);
    objc_msgSend(v4, "setShadowRadius:", 7.0);

  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", v9, *(_QWORD *)(a1 + 48));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = 1;
  else
    v8 = v6;
  *(_BYTE *)(v7 + 24) = v8;

}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  CGSize result;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIImageDeckView preferredSizeForViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x3010000000;
  v26 = &unk_1BBF15257;
  v27 = *MEMORY[0x1E0C9D820];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__SKUIImageDeckView_preferredSizeForViewElement_context___block_invoke;
  v20[3] = &unk_1E73A1258;
  v15 = v6;
  v21 = v15;
  v22 = &v23;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v20);
  v16 = v24[4];
  v17 = v24[5];

  _Block_object_dispose(&v23, 8);
  v18 = v16;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

void __57__SKUIImageDeckView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  v4 = v11;
  if (v3 == 49)
  {
    objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v11);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(double *)(v7 + 40) >= v6)
      v6 = *(double *)(v7 + 40);
    *(double *)(v7 + 40) = v6;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(double *)(v8 + 32);
    if (v9 >= 0.00000011920929)
    {
      v10 = v5 / 3.0;
      v5 = v9 + floorf(v10);
    }
    *(double *)(v8 + 32) = v5;
    v4 = v11;
  }

}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIImageDeckView requestLayoutForViewElement:width:context:].cold.1();
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SKUIImageDeckView_requestLayoutForViewElement_width_context___block_invoke;
  v10[3] = &unk_1E73A3F28;
  v12 = a4;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v10);

}

void __63__SKUIImageDeckView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 49)
    +[SKUIAdornedImageView requestLayoutForViewElement:width:context:](SKUIAdornedImageView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  void *v28;
  double v29;
  uint64_t v30;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIImageDeckView sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x3010000000;
  v28 = &unk_1BBF15257;
  v30 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  v29 = a3;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __59__SKUIImageDeckView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v22[3] = &unk_1E73A1258;
  v17 = v8;
  v23 = v17;
  v24 = &v25;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v22);
  v18 = v26[4];
  v19 = v26[5];

  _Block_object_dispose(&v25, 8);
  v20 = v18;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

void __59__SKUIImageDeckView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  double v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 49)
  {
    objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v6);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(double *)(v4 + 40);
    if (v5 < v3)
      v5 = v3;
    *(double *)(v4 + 40) = v5;
  }

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SKUIImageDeckView *v18;
  id v19;

  v9 = a3;
  v10 = a5;
  objc_storeStrong((id *)&self->_imageDeckViewElement, a3);
  self->_fitWidth = a4;
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__SKUIImageDeckView_reloadWithViewElement_width_context___block_invoke;
  v15[3] = &unk_1E73A3F50;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v15);
  -[SKUIImageDeckView setImageViews:](self, "setImageViews:", v12);

}

void __57__SKUIImageDeckView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SKUIImageDeckView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_1E73A2DE8;
  v10 = v3;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v9);

}

void __57__SKUIImageDeckView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  v4 = v11;
  if (v3 == 49)
  {
    objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v11, *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v5, "setUserInteractionEnabled:", 0);
    v4 = v11;
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 456), "setObject:forKey:", v11, v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 456), "setObject:forKey:", v5, v11);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
      objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        if (!v7)
        {
          v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
          v9 = *(_QWORD *)(a1 + 48);
          v10 = *(void **)(v9 + 472);
          *(_QWORD *)(v9 + 472) = v8;

          v7 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        }
        objc_msgSend(v7, "setObject:forKey:", v6, v5);
      }

      v4 = v11;
    }
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIImageDeckView _layoutImages](self, "_layoutImages");
    -[SKUIImageDeckView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageViews:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_imageViews, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_imageViews, a3);
    -[SKUIImageDeckView _layoutImages](self, "_layoutImages");
    -[SKUIImageDeckView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v20;
  id v21;
  NSMapTable *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v8 = a5;
  v9 = objc_msgSend(a4, "requestIdentifier");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v20 = 0;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "requestIdentifierForResourceCacheKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && objc_msgSend(v16, "unsignedIntegerValue") == v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "imageView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setImage:", v21);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v14, "setImage:cacheKey:context:", v21, v15, v8);
            else
              objc_msgSend(v14, "setImage:", v21);
          }
          v20 = 1;
        }

      }
      v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }
  else
  {
    v20 = 0;
  }

  return v20 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__80;
  v19 = __Block_byref_object_dispose__80;
  v20 = 0;
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElement flattenedChildren](self->_imageDeckViewElement, "flattenedChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__SKUIImageDeckView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_1E73A30E8;
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __46__SKUIImageDeckView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "itmlID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    *a4 = 1;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double *v3;
  double fitWidth;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGSize result;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (double *)MEMORY[0x1E0C9D820];
  fitWidth = self->_fitWidth;
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SKUIImageDeckView imageViews](self, "imageViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *v3;
    v11 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "sizeThatFits:", v10, v5);
        if (v11 < v13)
          v11 = v13;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v11 = v5;
  }

  v14 = fitWidth;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SKUIImageDeckView;
  -[SKUIImageDeckView layoutSubviews](&v12, sel_layoutSubviews);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[SKUIImageDeckView imageViews](self, "imageViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SKUIImageDeckView sendSubviewToBack:](self, "sendSubviewToBack:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)_layoutImages
{
  void *v3;
  uint64_t v4;
  double *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  double v12;
  double fitWidth;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t j;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t k;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  float v50;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;
  CGRect v69;
  CGRect v70;

  v68 = *MEMORY[0x1E0C80C00];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[SKUIImageDeckView imageViews](self, "imageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  v52 = 0.0;
  v5 = (double *)MEMORY[0x1E0C9D820];
  v6 = 0.0;
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v62;
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v62 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "sizeThatFits:", v9, v10);
        v6 = v6 + v12;
      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v7);
  }

  fitWidth = self->_fitWidth;
  -[SKUIImageDeckView contentInset](self, "contentInset");
  v15 = v14;
  -[SKUIImageDeckView contentInset](self, "contentInset");
  v17 = v16;
  -[SKUIImageDeckView imageViews](self, "imageViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 >= 2)
  {
    -[SKUIImageDeckView imageViews](self, "imageViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (v6 - (fitWidth - (v15 + v17))) / (double)(unint64_t)(objc_msgSend(v20, "count") - 1);

  }
  -[SKUIImageDeckView contentInset](self, "contentInset");
  v22 = v21;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[SKUIImageDeckView imageViews](self, "imageViews");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v58;
    v28 = *v5;
    v27 = v5[1];
    v29 = 0.0;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "sizeThatFits:", v28, v27);
        if (v29 < v31)
          v29 = v31;
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v25);
  }
  else
  {
    v29 = 0.0;
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[SKUIImageDeckView imageViews](self, "imageViews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v54;
    v36 = v5[1];
    v51 = *v5;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
        objc_msgSend(v38, "frame", *(_QWORD *)&v51);
        v40 = v39;
        v42 = v41;
        objc_msgSend(v38, "sizeThatFits:", v51, v36);
        v44 = v43;
        v46 = v45;
        -[SKUIImageDeckView contentInset](self, "contentInset");
        v48 = v47;
        v69.origin.x = v40;
        v69.origin.y = v42;
        v69.size.width = v44;
        v69.size.height = v46;
        v49 = v48 + v29 - CGRectGetHeight(v69);
        objc_msgSend(v38, "setFrame:", v22, v49, v44, v46);
        -[SKUIImageDeckView sendSubviewToBack:](self, "sendSubviewToBack:", v38);
        v70.origin.x = v22;
        v70.origin.y = v49;
        v70.size.width = v44;
        v70.size.height = v46;
        v50 = v22 + CGRectGetWidth(v70) - v52;
        v22 = floorf(v50);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v34);
  }

}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImageView, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_imageDeckViewElement, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:width:context:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIImageDeckView requestLayoutForViewElement:width:context:]";
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
