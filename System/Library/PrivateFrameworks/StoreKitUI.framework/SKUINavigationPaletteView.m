@implementation SKUINavigationPaletteView

- (SKUINavigationPaletteView)initWithFrame:(CGRect)a3
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
  SKUINavigationPaletteView *v16;
  NSMutableArray *v17;
  NSMutableArray *segmentedControls;
  NSMutableArray *v19;
  NSMutableArray *stretchViews;
  uint64_t v21;
  NSMapTable *viewElementViews;
  uint64_t v23;
  NSMapTable *viewSpacings;
  objc_super v26;

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
        -[SKUINavigationPaletteView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUINavigationPaletteView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    segmentedControls = v16->_segmentedControls;
    v16->_segmentedControls = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stretchViews = v16->_stretchViews;
    v16->_stretchViews = v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    viewElementViews = v16->_viewElementViews;
    v16->_viewElementViews = (NSMapTable *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    viewSpacings = v16->_viewSpacings;
    v16->_viewSpacings = (NSMapTable *)v23;

  }
  return v16;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    -[SKUINavigationPaletteView setNeedsLayout](self, "setNeedsLayout");
  }
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
        +[SKUINavigationPaletteView prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__SKUINavigationPaletteView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v20[3] = &unk_1E73A1208;
  v23 = a4;
  v17 = v8;
  v21 = v17;
  v22 = &v24;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v20);
  v18 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __76__SKUINavigationPaletteView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 62)
    v4 = +[SKUIHorizontalListScrollView prefetchResourcesForViewElement:reason:context:](SKUIHorizontalListScrollView, "prefetchResourcesForViewElement:reason:context:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", v3, *(_QWORD *)(a1 + 48));
  v5 = v4;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = 1;
  else
    v7 = v5;
  *(_BYTE *)(v6 + 24) = v7;
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
        +[SKUINavigationPaletteView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
  id v24;
  double v25;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUINavigationPaletteView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__SKUINavigationPaletteView_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E73A2CA0;
  v23 = v18;
  v24 = a1;
  v22 = v8;
  v25 = a4;
  v19 = v18;
  v20 = v8;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v21);

}

void __71__SKUINavigationPaletteView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  __objc2_class *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "elementType");
  if (v3 > 61)
  {
    if (v3 != 62)
    {
      if (v3 == 138)
      {
        objc_msgSend(*(id *)(a1 + 48), "_attributedStringForLabel:context:", v7, *(_QWORD *)(a1 + 32));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "requestLayoutForLabel:attributedString:width:", v7, v6, (uint64_t)*(double *)(a1 + 56));
        goto LABEL_13;
      }
      v4 = v7;
      if (v3 != 141)
        goto LABEL_15;
LABEL_9:
      objc_msgSend(*(id *)(a1 + 48), "_attributedStringForButton:context:", v7, *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "requestLayoutForButton:attributedString:width:", v7, v6, (uint64_t)*(double *)(a1 + 56));
LABEL_13:

      goto LABEL_14;
    }
    v5 = SKUIHorizontalListScrollView;
LABEL_11:
    -[__objc2_class requestLayoutForViewElement:width:context:](v5, "requestLayoutForViewElement:width:context:", v7, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
LABEL_14:
    v4 = v7;
    goto LABEL_15;
  }
  v4 = v7;
  if (v3 == 12)
    goto LABEL_9;
  if (v3 == 40)
  {
    v5 = SKUIFilterBarView;
    goto LABEL_11;
  }
LABEL_15:

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
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  id v26;
  double v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  void *v31;
  double v32;
  uint64_t v33;
  CGSize result;

  v8 = a4;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUINavigationPaletteView sizeThatFitsWidth:viewElement:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x3010000000;
  v31 = &unk_1BBF15257;
  v32 = a3;
  v33 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__SKUINavigationPaletteView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v23[3] = &unk_1E73A3700;
  v26 = a1;
  v27 = a3;
  v18 = v9;
  v24 = v18;
  v25 = &v28;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v23);
  v19 = v29[4];
  v20 = v29[5];

  _Block_object_dispose(&v28, 8);
  v21 = v19;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

uint64_t __67__SKUINavigationPaletteView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;
  double v6;

  result = objc_msgSend(*(id *)(a1 + 48), "_sizeForViewElement:width:context:", a2, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(double *)(v5 + 40);
  if (v6 < v4)
    v6 = v4;
  *(double *)(v5 + 40) = v6;
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
  SKUINavigationPaletteView *v15;
  double v16;

  v8 = a3;
  v9 = a5;
  -[NSHashTable removeAllObjects](self->_artworkRelatedChildViewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_segmentedControls, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_stretchViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewSpacings, "removeAllObjects");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SKUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E73A1230;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __65__SKUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[4];

  v3 = a2;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SKUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_1E73A3728;
  v5 = v3;
  v9 = v5;
  v13 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v6;
  v11 = v7;
  v12 = v14;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v8);

  _Block_object_dispose(v14, 8);
}

void __65__SKUINavigationPaletteView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  SKUISegmentedControlViewElementController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v28 = a2;
  v3 = objc_msgSend(v28, "elementType");
  if (v3 > 61)
  {
    if (v3 > 137)
    {
      if (v3 == 138)
      {
        objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v28, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
        v4 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 488), "addObject:", v4);
        goto LABEL_22;
      }
      if (v3 != 141)
      {
LABEL_12:
        v9 = 0;
        v8 = 0;
        v4 = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        goto LABEL_37;
      }
LABEL_15:
      objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v28, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
      LODWORD(v12) = -1097229926;
      objc_msgSend(v11, "setCharge:", v12);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(double *)(v13 + 24);
      *(_QWORD *)(v13 + 24) = 0x4022000000000000;
      v4 = v11;
      if (objc_msgSend(v28, "elementType") == 50)
        v8 = v4;
      else
        v8 = 0;

      v9 = 0;
      goto LABEL_23;
    }
    if (v3 == 62)
    {
      objc_msgSend(*(id *)(a1 + 32), "addReusableViewWithReuseIdentifier:", 0x1E73B6C50);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadWithViewElement:width:context:", v28, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
      v10 = 0.0;
      objc_msgSend(v14, "setContentInset:", 0.0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), 0.0, *(double *)(*(_QWORD *)(a1 + 48) + 464));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 488), "addObject:", v14);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      v4 = v14;
      v8 = v4;
      v9 = v4;
    }
    else
    {
      if (v3 != 109)
        goto LABEL_12;
      v5 = -[SKUISegmentedControlViewElementController initWithViewElement:]([SKUISegmentedControlViewElementController alloc], "initWithViewElement:", v28);
      objc_msgSend(*(id *)(a1 + 40), "clientContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISegmentedControlViewElementController setClientContext:](v5, "setClientContext:", v6);

      objc_msgSend(*(id *)(a1 + 40), "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISegmentedControlViewElementController setParentViewController:](v5, "setParentViewController:", v7);

      -[SKUISegmentedControlViewElementController segmentedControlView](v5, "segmentedControlView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addView:", v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 480), "addObject:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 488), "addObject:", v4);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

      v8 = 0;
      v9 = 0;
      v10 = 0.0;
    }
  }
  else
  {
    if (v3 <= 39)
    {
      if (v3 != 12)
      {
        if (v3 == 32)
        {
          objc_msgSend(*(id *)(a1 + 32), "addDividerWithElement:context:", v28, *(_QWORD *)(a1 + 40));
          v4 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setDividerOrientation:", 1);
          objc_msgSend(v4, "setDividerSize:", 16.0);
LABEL_22:
          v8 = 0;
          v9 = 0;
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v10 = *(double *)(v16 + 24);
          *(_QWORD *)(v16 + 24) = 0x4022000000000000;
          goto LABEL_23;
        }
        goto LABEL_12;
      }
      goto LABEL_15;
    }
    if (v3 != 40)
    {
      if (v3 != 50)
        goto LABEL_12;
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 32), "addReusableViewWithReuseIdentifier:", 0x1E73B6BF0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadWithViewElement:width:context:", v28, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
    v10 = 0.0;
    objc_msgSend(v15, "setContentInset:", 0.0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), 0.0, *(double *)(*(_QWORD *)(a1 + 48) + 464));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 488), "addObject:", v15);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v4 = v15;
    v9 = 0;
    v8 = v4;
  }
LABEL_23:
  if (v4)
  {
    if (v10 > 0.00000011920929)
    {
      v17 = *(void **)(*(_QWORD *)(a1 + 48) + 512);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v18, v4);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 504), "setObject:forKey:", v28, v4);
  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
      if (!v20)
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
        v22 = *(_QWORD *)(a1 + 48);
        v23 = *(void **)(v22 + 472);
        *(_QWORD *)(v22 + 472) = v21;

        v20 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
      }
      objc_msgSend(v20, "setObject:forKey:", v19, v8);
    }

  }
  if (v9)
  {
    v24 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
    if (!v24)
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
      v26 = *(_QWORD *)(a1 + 48);
      v27 = *(void **)(v26 + 432);
      *(_QWORD *)(v26 + 432) = v25;

      v24 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
    }
    objc_msgSend(v24, "addObject:", v9);
  }
LABEL_37:

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
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
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  id v26;
  id v27;
  NSMapTable *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v8 = a4;
  v9 = a5;
  v26 = v8;
  v10 = objc_msgSend(v8, "requestIdentifier");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v22 = v8;
            v21 = v27;
            objc_msgSend(v15, "setImage:forArtworkRequest:context:", v27, v8, v9);
          }
          else
          {
            objc_opt_class();
            v22 = v8;
            v21 = v27;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "imageView");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setImage:", v27);

            }
            else
            {
              objc_msgSend(v15, "setImage:", v27);
            }
          }

          goto LABEL_23;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_artworkRelatedChildViewElementViews;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v30;
    v22 = v26;
    v21 = v27;
LABEL_12:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v20)
        objc_enumerationMutation(obj);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "setImage:forArtworkRequest:context:", v27, v26, v9) & 1) != 0)
        break;
      if (v19 == ++v23)
      {
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
          goto LABEL_12;
        goto LABEL_24;
      }
    }
LABEL_23:
    LOBYTE(v19) = 1;
  }
  else
  {
    v22 = v8;
    v21 = v27;
  }
LABEL_24:

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
  void *v14;
  NSMapTable *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_viewElementViews;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itmlID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = v9;
LABEL_13:
          v14 = v13;

          goto LABEL_14;
        }
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF4000F8))
        {
          objc_msgSend(v9, "viewForElementIdentifier:", v4);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (v13)
            goto LABEL_13;
        }

      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double left;
  double v14;
  NSMutableArray *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSMutableArray *segmentedControls;
  float v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[12];
  _QWORD v39[4];
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[11];
  uint64_t v46;
  double *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[SKUINavigationPaletteView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = (double *)&v46;
  v48 = 0x2020000000;
  v49 = 0;
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __43__SKUINavigationPaletteView_layoutSubviews__block_invoke;
  v45[3] = &unk_1E73A3750;
  v45[7] = v4;
  v45[8] = v6;
  *(double *)&v45[9] = v8;
  *(double *)&v45[10] = v10;
  v45[4] = self;
  v45[5] = &v50;
  v45[6] = &v46;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v45);
  v35 = v6;
  v36 = v4;
  v12 = -[NSMutableArray count](self->_stretchViews, "count");
  left = self->_contentInset.left;
  v14 = v47[3];
  v37 = objc_msgSend(v11, "count");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = self->_stretchViews;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v16)
  {
    v17 = left + v14;
    v18 = *(_QWORD *)v42;
    v19 = (double)v12;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v21, "frame");
        v23 = v22;
        v25 = v24;
        if (objc_msgSend(v11, "indexOfObjectIdenticalTo:", v21) == v37 - 1
          && (segmentedControls = self->_segmentedControls,
              v40[0] = MEMORY[0x1E0C809B0],
              v40[1] = 3221225472,
              v40[2] = __43__SKUINavigationPaletteView_layoutSubviews__block_invoke_2,
              v40[3] = &unk_1E73A3778,
              v40[4] = v21,
              -[NSMutableArray indexOfObjectPassingTest:](segmentedControls, "indexOfObjectPassingTest:", v40) == 0x7FFFFFFFFFFFFFFFLL))
        {
          v27 = v8 - v17;
          objc_msgSend(v21, "sizeThatFits:", floorf(v27), v10);
        }
        else
        {
          v30 = (v8 - self->_contentInset.left - self->_contentInset.right - v47[3]) / v19;
          objc_msgSend(v21, "sizeThatFits:", floorf(v30), v10);
        }
        v31 = v28;
        v32 = v29;
        objc_msgSend(v21, "setFrame:", v23, v25, v28, v29);
        v33 = v51[3];
        if (v33 < v32)
          v33 = v32;
        v51[3] = v33;
        v17 = v17 + v31;
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v16);
  }

  v39[0] = 0;
  v39[1] = v39;
  v34 = self->_contentInset.left;
  v39[2] = 0x2020000000;
  *(CGFloat *)&v39[3] = v34;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __43__SKUINavigationPaletteView_layoutSubviews__block_invoke_3;
  v38[3] = &unk_1E73A37A0;
  v38[4] = self;
  v38[5] = v39;
  v38[8] = v36;
  v38[9] = v35;
  *(double *)&v38[10] = v8;
  *(double *)&v38[11] = v10;
  v38[6] = &v50;
  v38[7] = v37;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v38);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
}

void __43__SKUINavigationPaletteView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  id v16;

  v16 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "containsObject:") & 1) == 0)
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend(v16, "sizeThatFits:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    v8 = v7;
    v10 = v9;
    objc_msgSend(v16, "setFrame:", v5, v6, v7, v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(double *)(v11 + 24);
    if (v12 < v10)
      v12 = v10;
    *(double *)(v11 + 24) = v12;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
    if (a3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "objectForKey:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "floatValue");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + v15;
      }

    }
  }

}

BOOL __43__SKUINavigationPaletteView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "segmentedControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __43__SKUINavigationPaletteView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  double v18;
  float v19;
  double v20;
  double v21;
  double v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v27;
  CGRect v28;
  CGRect v29;

  v27 = a2;
  objc_msgSend(v27, "frame");
  v6 = v5;
  v8 = v7;
  if (a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "objectForKey:", v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v9, "floatValue");
    v12 = v10 + v11;

  }
  else
  {
    v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  if (*(_QWORD *)(a1 + 56) - 1 == a3
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "containsObject:", v27))
  {
    v13 = (*(double *)(a1 + 80) - v6) * 0.5;
    v14 = floorf(v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(double *)(v15 + 24) >= v14)
      v12 = *(double *)(v15 + 24);
    else
      v12 = v14;
  }
  v16 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v16 + 496))
  {
    v17 = (*(double *)(a1 + 88) - v8) * 0.5;
    v18 = ceilf(v17);
  }
  else
  {
    v19 = (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v8) * 0.5;
    v18 = *(double *)(v16 + 440) + ceilf(v19);
  }
  v20 = v12;
  v21 = v6;
  v22 = v8;
  v28 = CGRectIntegral(*(CGRect *)(&v18 - 1));
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  objc_msgSend(v27, "setFrame:");
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxX(v29);

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
    SKUIFontPreferredFontForTextStyle(5);
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
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "elementType");
  if (v9 == 109)
  {
    v13 = *MEMORY[0x1E0C9D820];
    v10 = objc_alloc_init(MEMORY[0x1E0DC3C58]);
    objc_msgSend(v10, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v11 = v14;
    goto LABEL_6;
  }
  if (v9 == 62)
  {
    +[SKUIHorizontalListScrollView sizeThatFitsWidth:viewElement:context:](SKUIHorizontalListScrollView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a4);
LABEL_9:
    v13 = v15;
    v11 = v16;
    goto LABEL_10;
  }
  if (v9 != 32)
  {
    objc_msgSend(v8, "sizeForViewElement:width:", v7, a4);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v11 = 16.0;
  v13 = 1.0 / v12;
LABEL_6:

LABEL_10:
  v17 = v13;
  v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewSpacings, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_stretchViews, 0);
  objc_storeStrong((id *)&self->_segmentedControls, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
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
