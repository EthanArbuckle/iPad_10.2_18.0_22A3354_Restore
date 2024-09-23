@implementation SKUIHorizontalListScrollView

- (SKUIHorizontalListScrollView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIHorizontalListScrollView *v16;
  uint64_t v17;
  NSMapTable *viewElementViews;
  id v19;
  uint64_t v20;
  UIScrollView *scrollView;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIHorizontalListScrollView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIHorizontalListScrollView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    viewElementViews = v16->_viewElementViews;
    v16->_viewElementViews = (NSMapTable *)v17;

    v19 = objc_alloc(MEMORY[0x1E0DC3C28]);
    -[SKUIHorizontalListScrollView bounds](v16, "bounds");
    v20 = objc_msgSend(v19, "initWithFrame:");
    scrollView = v16->_scrollView;
    v16->_scrollView = (UIScrollView *)v20;

    -[UIScrollView setAlwaysBounceHorizontal:](v16->_scrollView, "setAlwaysBounceHorizontal:", 0);
    -[UIScrollView setAlwaysBounceVertical:](v16->_scrollView, "setAlwaysBounceVertical:", 0);
    -[UIScrollView setScrollsToTop:](v16->_scrollView, "setScrollsToTop:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v16->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v16->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[SKUIHorizontalListScrollView addSubview:](v16, "addSubview:", v16->_scrollView);
  }
  return v16;
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
        +[SKUIHorizontalListScrollView prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__SKUIHorizontalListScrollView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __79__SKUIHorizontalListScrollView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", a2, *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = 1;
  else
    v5 = result;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIHorizontalListScrollView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  double v24;
  id v25;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUIHorizontalListScrollView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__SKUIHorizontalListScrollView_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E73A2CA0;
  v24 = a4;
  v25 = a1;
  v22 = v18;
  v23 = v8;
  v19 = v8;
  v20 = v18;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v21);

}

void __74__SKUIHorizontalListScrollView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "elementType");
  if (v3 <= 137)
  {
    if (v3 == 8)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForBadge:width:", v6, (uint64_t)*(double *)(a1 + 48));
      goto LABEL_12;
    }
    v4 = v6;
    if (v3 != 12)
      goto LABEL_13;
    goto LABEL_8;
  }
  if (v3 == 138)
  {
    objc_msgSend(*(id *)(a1 + 56), "_attributedStringForLabel:context:", v6, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestLayoutForLabel:attributedString:width:", v6, v5, (uint64_t)*(double *)(a1 + 48));
    goto LABEL_10;
  }
  v4 = v6;
  if (v3 == 141)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 56), "_attributedStringForButton:context:", v6, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestLayoutForButton:attributedString:width:", v6, v5, (uint64_t)*(double *)(a1 + 48));
LABEL_10:

    goto LABEL_12;
  }
  if (v3 == 144)
  {
    +[SKUITomatoRatingView requestLayoutForViewElement:width:context:](SKUITomatoRatingView, "requestLayoutForViewElement:width:context:", v6, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
LABEL_12:
    v4 = v6;
  }
LABEL_13:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  double *v20;
  BOOL v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  double v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  CGSize result;

  v8 = a4;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUIHorizontalListScrollView sizeThatFitsWidth:viewElement:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x3010000000;
  v40 = &unk_1BBF15257;
  v41 = *MEMORY[0x1E0C9D820];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__SKUIHorizontalListScrollView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v27[3] = &unk_1E73A67A0;
  v31 = a1;
  v32 = a3;
  v18 = v9;
  v28 = v18;
  v29 = &v37;
  v30 = &v33;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v27);
  v19 = v34[3];
  v20 = v38;
  v21 = v19 <= 1;
  v22 = v19 - 1;
  if (v21)
  {
    v23 = v38[4];
  }
  else
  {
    v23 = v38[4] + (float)((float)v22 * 18.0);
    v38[4] = v23;
  }
  v24 = v20[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  v25 = v23;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

double __70__SKUIHorizontalListScrollView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double result;

  objc_msgSend(*(id *)(a1 + 56), "_sizeForViewElement:width:context:", a2, *(_QWORD *)(a1 + 32), *(double *)(a1 + 64));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v5 + 40) >= v4)
    v4 = *(double *)(v5 + 40);
  *(double *)(v5 + 40) = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v3 + *(double *)(v6 + 32);
  *(double *)(v6 + 32) = result;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SKUIHorizontalListScrollView *v15;
  double v16;

  v8 = a3;
  v9 = a5;
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__SKUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E73A1230;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __68__SKUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SKUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_1E73A4898;
  v9 = v3;
  v12 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v8);

}

void __68__SKUIHorizontalListScrollView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v3 = objc_msgSend(v14, "elementType");
  v4 = 0;
  if (v3 > 49)
  {
    if (v3 > 140)
    {
      if (v3 != 141)
      {
        if (v3 != 144)
          goto LABEL_27;
        objc_msgSend(*(id *)(a1 + 32), "addTomatoRatingViewWithViewElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v4 = (id)v5;
        goto LABEL_14;
      }
    }
    else if (v3 != 50)
    {
      if (v3 != 138)
        goto LABEL_27;
      objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  if (v3 != 8)
  {
    if (v3 != 12)
    {
      if (v3 != 32)
        goto LABEL_27;
      objc_msgSend(*(id *)(a1 + 32), "addDividerWithElement:context:", v14, *(_QWORD *)(a1 + 40));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDividerOrientation:", 1);
      objc_msgSend(v4, "setDividerSize:", 16.0);
LABEL_14:
      v6 = 0;
      if (!v4)
        goto LABEL_21;
LABEL_20:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "setObject:forKey:", v14, v4);
      goto LABEL_21;
    }
LABEL_16:
    objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
    LODWORD(v8) = -1097229926;
    objc_msgSend(v7, "setCharge:", v8);
    v4 = v7;
    if (objc_msgSend(v14, "elementType") == 50)
      v6 = v4;
    else
      v6 = 0;

    if (v4)
      goto LABEL_20;
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "addBadgeViewWithElement:width:context:", v14, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v6)
    goto LABEL_20;
LABEL_21:
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 48) + 448);
      if (!v10)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
        v12 = *(_QWORD *)(a1 + 48);
        v13 = *(void **)(v12 + 448);
        *(_QWORD *)(v12 + 448) = v11;

        v10 = *(void **)(*(_QWORD *)(a1 + 48) + 448);
      }
      objc_msgSend(v10, "setObject:forKey:", v9, v6);
    }

  }
LABEL_27:

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v22;
  NSMapTable *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "requestIdentifier");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v22 = v8;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "imageView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v22;
            objc_msgSend(v20, "setImage:", v22);

          }
          else
          {
            v8 = v22;
            objc_msgSend(v15, "setImage:", v22);
          }

          v19 = 1;
          goto LABEL_16;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
    v19 = 0;
    v8 = v22;
  }
  else
  {
    v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSMapTable *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_viewElementViews;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itmlID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = v9;

          goto LABEL_11;
        }

      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double MaxX;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;

  v25 = *MEMORY[0x1E0C80C00];
  -[SKUIHorizontalListScrollView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "sizeThatFits:", 1.79769313e308, v6);
        v15 = v14;
        v17 = v16;
        *(float *)&v14 = (v6 - v16) * 0.5;
        v18 = floorf(*(float *)&v14);
        objc_msgSend(v13, "setFrame:", v11, v18, v15, v16);
        v26.origin.x = v11;
        v26.origin.y = v18;
        v26.size.width = v15;
        v26.size.height = v17;
        MaxX = CGRectGetMaxX(v26);
        v27.origin.x = v11;
        v27.origin.y = v18;
        v27.size.width = v15;
        v27.size.height = v17;
        v11 = CGRectGetMaxX(v27) + 18.0;
        -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    MaxX = 0.0;
  }
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", MaxX, v6);
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", MaxX > v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "sizeThatFits:", width, height);
        if (v6 < v14)
          v6 = v14;
        v7 = v7 + v13;
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    v7 = v7 + (float)((float)(unint64_t)(objc_msgSend(v8, "count") - 1) * 18.0);
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  if (v7 + v15 < width)
    width = v7 + v15;

  v16 = width;
  v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_buttonAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", 0x1E73AEE10, self);
  -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonTitleStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "_attributedStringForText:style:context:", v8, v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_attributedStringForText:style:context:", v8, v11, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_attributedStringForText:style:context:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  SKUIViewElementFontWithStyle(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    SKUIFontForTextStyle(5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "attributedStringWithDefaultFont:foregroundColor:style:", v10, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "elementType") == 32)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v10 = 16.0;
    v12 = 1.0 / v11;

  }
  else
  {
    objc_msgSend(v8, "sizeForViewElement:width:", v7, a4);
    v12 = v13;
    v10 = v14;
  }

  v15 = v12;
  v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
