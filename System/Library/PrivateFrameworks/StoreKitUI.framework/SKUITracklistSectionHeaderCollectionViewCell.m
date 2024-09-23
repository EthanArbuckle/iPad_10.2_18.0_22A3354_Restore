@implementation SKUITracklistSectionHeaderCollectionViewCell

- (SKUITracklistSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUITracklistSectionHeaderCollectionViewCell *v16;
  UIView *v17;
  UIView *separatorView;
  UIView *v19;
  void *v20;
  void *v21;
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
        -[SKUITracklistSectionHeaderCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUITracklistSectionHeaderCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v16->_separatorView;
    v16->_separatorView = v17;

    v19 = v16->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[SKUITracklistSectionHeaderCollectionViewCell contentView](v16, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v16->_separatorView);

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
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUITracklistSectionHeaderCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "button");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = objc_msgSend(v8, "prefetchResourcesForViewElement:reason:", v17, a4);
  else
    v18 = 0;
  objc_msgSend(v7, "titleLabels");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v18 |= objc_msgSend(v8, "prefetchResourcesForViewElement:reason:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), a4);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v21);
  }

  return v18 & 1;
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
        +[SKUITracklistSectionHeaderCollectionViewCell preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUITracklistSectionHeaderCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v9, "aggregateValueForKey:", 0x1E73B05F0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titlesWidthForWidth:columnData:", v18, a4);
  v20 = v19;
  v35 = v8;
  objc_msgSend(v8, "titleLabels");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelLayoutCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        SKUITracklistAttributedStringForLabel(0, v28, v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "requestLayoutForLabel:attributedString:width:", v28, v29, (uint64_t)v20);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v25);
  }

  objc_msgSend(v35, "button");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "elementType");
  if (v31 == 141 || v31 == 12)
  {
    SKUITracklistAttributedStringForButton(0, v30, v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "columnForIdentifier:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "width");
    objc_msgSend(v22, "requestLayoutForButton:attributedString:width:", v30, v32, (uint64_t)v34);

  }
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
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGSize result;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUITracklistSectionHeaderCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "titleLabels");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aggregateValueForKey:", 0x1E73B05F0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titlesWidthForWidth:columnData:", v19, a3);
  v21 = v20;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = v18;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    v26 = 0.0;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v9, "sizeForViewElement:width:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v21, (_QWORD)v32);
        v26 = v26 + v28;
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v24);
  }
  else
  {
    v26 = 0.0;
  }

  if (v26 <= 32.0)
    v29 = 44.0;
  else
    v29 = v26 + 20.0;

  v30 = a3;
  v31 = v29;
  result.height = v31;
  result.width = v30;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  UIControl *button;
  SKUIButtonViewElement *buttonViewElement;
  SKUIBuyButtonDescriptor *buyButtonDescriptor;
  SKUITracklistColumnData *v13;
  SKUITracklistColumnData *columnData;
  NSMutableArray *v15;
  NSMutableArray *labels;
  void *v17;
  void *v18;
  void *v19;
  UIView *separatorView;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  double v27;

  v8 = a3;
  v9 = a5;
  button = self->_button;
  self->_button = 0;

  buttonViewElement = self->_buttonViewElement;
  self->_buttonViewElement = 0;

  buyButtonDescriptor = self->_buyButtonDescriptor;
  self->_buyButtonDescriptor = 0;

  objc_msgSend(v9, "aggregateValueForKey:", 0x1E73B05F0);
  v13 = (SKUITracklistColumnData *)objc_claimAutoreleasedReturnValue();
  columnData = self->_columnData;
  self->_columnData = v13;

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  labels = self->_labels;
  self->_labels = v15;

  objc_msgSend(v8, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ikBorderColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "color");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  separatorView = self->_separatorView;
  if (v19)
  {
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v21);

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__SKUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v24[3] = &unk_1E73A1230;
  v27 = a4;
  v24[4] = self;
  v25 = v8;
  v26 = v9;
  v22 = v9;
  v23 = v8;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v24);

}

void __84__SKUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_titlesWidthForWidth:columnData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 848), *(double *)(a1 + 56));
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "elementType") & 0xFFFFFFFFFFFFFF7FLL) == 0xD)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "columnForIdentifier:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "width");
    objc_msgSend(v3, "addButtonWithElement:width:context:", v6, *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__cancelConfirmationAction_, 0x10000);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 0x20000);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__showConfirmationAction_, 0x40000);
    objc_msgSend(v8, "setItemOfferDelegate:", *(_QWORD *)(a1 + 32));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 824);
    *(_QWORD *)(v9 + 824) = v8;
    v11 = v8;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 832), v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "buyButtonDescriptor");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 840);
    *(_QWORD *)(v13 + 840) = v12;

  }
  objc_msgSend(*(id *)(a1 + 40), "titleLabels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v3, "addLabelViewWithElement:width:context:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19), *(_QWORD *)(a1 + 48), v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _BOOL4 v10;
  UIControl *button;
  SKUIBuyButtonDescriptor *buyButtonDescriptor;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[SKUIBuyButtonDescriptor canPersonalizeUsingItemState:](self->_buyButtonDescriptor, "canPersonalizeUsingItemState:", v8);
  if (v10)
  {
    button = self->_button;
    buyButtonDescriptor = self->_buyButtonDescriptor;
    objc_msgSend(v9, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:](button, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", buyButtonDescriptor, v8, v13, v5);

  }
  return v10;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  uint64_t i;
  void *v22;
  CGFloat v23;
  double height;
  double v25;
  double v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  double MaxY;
  uint64_t v32;
  uint64_t j;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  UIControl *button;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v61 = *MEMORY[0x1E0C80C00];
  v58.receiver = self;
  v58.super_class = (Class)SKUITracklistSectionHeaderCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v58, sel_layoutSubviews);
  -[SKUITracklistSectionHeaderCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_opt_class();
  -[SKUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  v10 = v5 - v9;
  -[SKUITracklistColumnData rightEdgeInset](self->_columnData, "rightEdgeInset");
  objc_msgSend(v8, "_titlesWidthForWidth:columnData:", self->_columnData, v10 - v11);
  v13 = v12;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = self->_labels;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v55;
    v18 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v20 = 0.0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v55 != v17)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v22, "sizeThatFits:", v13, 1.79769313e308);
        v62.size.height = v23;
        v62.origin.x = v18;
        v62.origin.y = v19;
        v62.size.width = v13;
        v63 = CGRectIntegral(v62);
        height = v63.size.height;
        objc_msgSend(v22, "setFrame:", v63.origin.x, v63.origin.y, v63.size.width);
        v20 = v20 + height;
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v16);
  }
  else
  {
    v20 = 0.0;
  }

  -[SKUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  v26 = v25;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v27 = self->_labels;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v28)
  {
    v29 = v28;
    v30 = (v7 - v20) * 0.5;
    MaxY = floorf(v30);
    v32 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v27);
        v34 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v34, "frame", (_QWORD)v50);
        v36 = v35;
        v38 = v37;
        objc_msgSend(v34, "setFrame:", v26, MaxY);
        v64.origin.x = v26;
        v64.origin.y = MaxY;
        v64.size.width = v36;
        v64.size.height = v38;
        MaxY = CGRectGetMaxY(v64);
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v29);
  }

  button = self->_button;
  if (button)
  {
    -[UIControl sizeThatFits:](button, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v41 = v40;
    v43 = v42;
    -[SKUITracklistColumnData rightEdgeInset](self->_columnData, "rightEdgeInset");
    v45 = (v7 - v43) * 0.5;
    -[UIControl setFrame:](self->_button, "setFrame:", v5 - v44 - v41, floorf(v45), v41, v43);
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", (_QWORD)v50);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "scale");
  v48 = 1.0 / v47;

  -[SKUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  -[UIView setFrame:](self->_separatorView, "setFrame:", v49, v7 - v48, v5 - v49, v48);
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;

  v15 = a3;
  objc_msgSend(v15, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v12 = v11;
  v14 = v13;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  objc_msgSend(v15, "setFrame:", CGRectGetMaxX(v16) - v12, v6, v12, v14);

}

- (void)_buttonAction:(id)a3
{
  void *v4;
  char v5;
  SKUIButtonViewElement *buttonViewElement;
  void *v7;
  id v8;

  SKUICollectionViewForView(self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  buttonViewElement = self->_buttonViewElement;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v8, "indexPathForCell:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v8, buttonViewElement, 0, v7);

  }
  else
  {
    -[SKUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_buttonViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }

}

- (void)_cancelConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_showConfirmationAction:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", v4);

  objc_msgSend(v4, "setShowingConfirmation:animated:", 1, 1);
}

+ (double)_titlesWidthForWidth:(double)a3 columnData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v5 = a4;
  objc_msgSend(v5, "columnForIdentifier:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "width");
    v9 = a3 - v8;
    objc_msgSend(v5, "interColumnSpacing");
    a3 = v9 - v10;
  }

  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong((id *)&self->_buttonViewElement, 0);
  objc_storeStrong((id *)&self->_button, 0);
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
