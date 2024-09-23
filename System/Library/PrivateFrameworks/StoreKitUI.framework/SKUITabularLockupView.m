@implementation SKUITabularLockupView

- (SKUITabularLockupView)initWithFrame:(CGRect)a3
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
  SKUITabularLockupView *v16;
  uint64_t v17;
  NSMapTable *viewElementViews;
  objc_super v20;

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
        -[SKUITabularLockupView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUITabularLockupView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElementViews = v16->_viewElementViews;
    v16->_viewElementViews = (NSMapTable *)v17;

  }
  return v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUITabularLockupView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
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
        +[SKUITabularLockupView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
  SKUITabularLockupLayout *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUITabularLockupView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = -[SKUITabularLockupLayout initWithLockup:context:]([SKUITabularLockupLayout alloc], "initWithLockup:context:", v8, v9);
  -[SKUITabularLockupLayout sizeColumnsToFitWidth:context:](v18, "sizeColumnsToFitWidth:context:", v9, a4);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SKUITabularLockupLayout columns](v18, "columns", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v24, "size");
        v26 = v25;
        objc_msgSend(v24, "childViewElements");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v27, v9, v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v21);
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUITabularLockupView sizeThatFitsWidth:viewElement:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  NSMapTable *viewElementViews;
  id v10;
  SKUITabularLockupLayout *v11;
  SKUITabularLockupLayout *layout;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  viewElementViews = self->_viewElementViews;
  v10 = a3;
  -[NSMapTable removeAllObjects](viewElementViews, "removeAllObjects");
  v11 = -[SKUITabularLockupLayout initWithLockup:context:]([SKUITabularLockupLayout alloc], "initWithLockup:context:", v10, v8);

  layout = self->_layout;
  self->_layout = v11;

  -[SKUITabularLockupLayout sizeColumnsToFitWidth:context:](self->_layout, "sizeColumnsToFitWidth:context:", v8, a4);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_1E73A9110;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v14);

}

void __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v6[3] = &unk_1E73A90E8;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __61__SKUITabularLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "size");
  v5 = v4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "childViewElements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "elementType") == 138)
        {
          v12 = *(void **)(a1 + 32);
          v13 = v11;
          objc_msgSend(*(id *)(a1 + 40), "addLabelViewWithElement:width:context:", v13, *(_QWORD *)(a1 + 32), (double)objc_msgSend(v12, "maxWidthForElement:withDefaultWidth:", v13, (uint64_t)v5));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "setObject:forKey:", v14, v13);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
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
  v12.super_class = (Class)SKUITabularLockupView;
  -[SKUITabularLockupView layoutSubviews](&v12, sel_layoutSubviews);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[SKUITabularLockupLayout columns](self->_layout, "columns", 0);
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
        -[SKUITabularLockupView _layoutSubviewsForColumn:](self, "_layoutSubviewsForColumn:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUITabularLockupView _attributedStringForLabel:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  +[SKUITabularLockupLayout fontForLabelViewElement:context:](SKUITabularLockupLayout, "fontForLabelViewElement:context:", v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithStyle(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributedStringWithDefaultFont:foregroundColor:style:", v15, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5
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
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUITabularLockupView _requestLayoutForViewElements:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v8, "labelLayoutCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v23, "elementType") == 138)
        {
          v24 = v23;
          v25 = objc_msgSend(v8, "maxWidthForElement:withDefaultWidth:", v24, (uint64_t)a4);
          objc_msgSend(a1, "_attributedStringForLabel:context:", v24, v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "requestLayoutForLabel:attributedString:width:", v24, v26, v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v20);
  }

}

- (void)_layoutSubviewsForColumn:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double Width;
  double Height;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat rect;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "identifier");
  -[SKUITabularLockupView bounds](self, "bounds");
  v30 = v7;
  v31 = v6;
  v28 = v9;
  v29 = v8;
  -[SKUITabularLockupView bounds](self, "bounds");
  -[SKUITabularLockupView _sizeViewsForColumn:toFitWidth:](self, "_sizeViewsForColumn:toFitWidth:", v4, CGRectGetWidth(v39));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v4, "childViewElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        rect = v18;
        switch(v5)
        {
          case 2:
            v42.origin.y = v30;
            v42.origin.x = v31;
            v42.size.height = v28;
            v42.size.width = v29;
            Width = CGRectGetWidth(v42);
            v43.origin.x = v17;
            v43.origin.y = v19;
            v43.size.width = v21;
            v43.size.height = v23;
            v17 = Width - CGRectGetWidth(v43);
            break;
          case 1:
            v40.origin.y = v30;
            v40.origin.x = v31;
            v40.size.height = v28;
            v40.size.width = v29;
            v24 = CGRectGetWidth(v40);
            v41.origin.x = v17;
            v41.origin.y = v19;
            v41.size.width = v21;
            v41.size.height = v23;
            v17 = floor((v24 - CGRectGetWidth(v41)) * 0.5);
            break;
          case 0:
            v17 = 0.0;
            break;
        }
        v44.origin.x = v31;
        v44.origin.y = v30;
        v44.size.width = v29;
        v44.size.height = v28;
        Height = CGRectGetHeight(v44);
        v45.origin.x = v17;
        v45.origin.y = rect;
        v45.size.width = v21;
        v45.size.height = v23;
        v27 = CGRectGetHeight(v45);
        SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v17, floor((Height - v27) * 0.5), v21, v23, v31, v30, v29, v28);
        objc_msgSend(v15, "setFrame:");

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v12);
  }

}

- (CGSize)_sizeViewsForColumn:(id)a3 toFitWidth:(double)a4
{
  id v6;
  void *v7;
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

  v6 = a3;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x3010000000;
  v16 = &unk_1BBF15257;
  v17 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v6, "childViewElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__SKUITabularLockupView__sizeViewsForColumn_toFitWidth___block_invoke;
  v12[3] = &unk_1E73A3110;
  *(double *)&v12[6] = a4;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  v8 = v14[4];
  v9 = v14[5];

  _Block_object_dispose(&v13, 8);
  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __56__SKUITabularLockupView__sizeViewsForColumn_toFitWidth___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double width;
  double height;
  uint64_t v13;
  double v14;
  id v15;
  CGRect v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "objectForKey:", a2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v15, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  v7 = v6;
  if (v5 >= *(double *)(a1 + 48))
    v8 = *(double *)(a1 + 48);
  else
    v8 = v5;
  v9 = v3;
  v10 = v4;
  v16 = CGRectIntegral(*(CGRect *)(&v7 - 3));
  width = v16.size.width;
  height = v16.size.height;
  objc_msgSend(v15, "setFrame:", v16.origin.x, v16.origin.y);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = height
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(double *)(v13 + 32);
  if (v14 < width)
    v14 = width;
  *(double *)(v13 + 32) = v14;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_layout, 0);
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

+ (void)_attributedStringForLabel:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)_requestLayoutForViewElements:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
