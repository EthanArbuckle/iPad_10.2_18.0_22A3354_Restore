@implementation SKUITracklistHeaderCollectionViewCell

- (SKUITracklistHeaderCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUITracklistHeaderCollectionViewCell *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *columnViews;
  UIView *v19;
  UIView *bottomSeparatorView;
  UIView *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *topSeparatorView;
  UIView *v26;
  void *v27;
  void *v28;
  objc_super v30;

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
        -[SKUITracklistHeaderCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SKUITracklistHeaderCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    columnViews = v16->_columnViews;
    v16->_columnViews = v17;

    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    bottomSeparatorView = v16->_bottomSeparatorView;
    v16->_bottomSeparatorView = v19;

    v21 = v16->_bottomSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SKUITracklistHeaderCollectionViewCell contentView](v16, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v16->_bottomSeparatorView);

    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topSeparatorView = v16->_topSeparatorView;
    v16->_topSeparatorView = v24;

    v26 = v16->_topSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[SKUITracklistHeaderCollectionViewCell contentView](v16, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v16->_topSeparatorView);

  }
  return v16;
}

+ (CGSize)sizeForHeaderTitleLabel:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUITracklistHeaderCollectionViewCell sizeForHeaderTitleLabel:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(a1, "_attributedStringForLabel:context:", v4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
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
        +[SKUITracklistHeaderCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUITracklistHeaderCollectionViewCell preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v7 = a5;
  v8 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUITracklistHeaderCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "aggregateValueForKey:", 0x1E73B05F0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__SKUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E73A9190;
  v23 = v18;
  v24 = a1;
  v22 = v7;
  v19 = v18;
  v20 = v7;
  objc_msgSend(v17, "enumerateColumnsForHeader:usingBlock:", v8, v21);

}

void __83__SKUITracklistHeaderCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v5 = (void *)a1[6];
  v6 = a1[4];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "_attributedStringForLabel:context:", v7, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[5];
  objc_msgSend(v8, "width");
  v11 = v10;

  objc_msgSend(v9, "requestLayoutForLabel:attributedString:width:", v7, v12, (uint64_t)v11);
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
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  void *v30;
  double v31;
  uint64_t v32;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUITracklistHeaderCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x3010000000;
  v30 = &unk_1BBF15257;
  v32 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  v31 = a3;
  objc_msgSend(v8, "aggregateValueForKey:", 0x1E73B05F0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__SKUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v24[3] = &unk_1E73A91B8;
  v19 = v18;
  v25 = v19;
  v26 = &v27;
  objc_msgSend(v17, "enumerateColumnsForHeader:usingBlock:", v7, v24);
  v20 = v28[4];
  v21 = v28[5] + 6.0;
  v28[5] = v21;

  _Block_object_dispose(&v27, 8);
  v22 = v20;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

void __79__SKUITracklistHeaderCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "width");
  objc_msgSend(v5, "estimatedSizeForLabel:width:", v6);
  v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(double *)(v9 + 40);
  if (v10 < v8)
    v10 = v8;
  *(double *)(v9 + 40) = v10;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  SKUITracklistColumnData *v9;
  SKUITracklistColumnData *columnData;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "aggregateValueForKey:", 0x1E73B05F0);
  v9 = (SKUITracklistColumnData *)objc_claimAutoreleasedReturnValue();
  columnData = self->_columnData;
  self->_columnData = v9;

  -[NSMutableDictionary removeAllObjects](self->_columnViews, "removeAllObjects");
  objc_msgSend(v7, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ikBorderColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  -[UIView setBackgroundColor:](self->_bottomSeparatorView, "setBackgroundColor:", v14);
  -[UIView setBackgroundColor:](self->_topSeparatorView, "setBackgroundColor:", v15);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v18[3] = &unk_1E73A00B8;
  v18[4] = self;
  v19 = v7;
  v20 = v8;
  v16 = v8;
  v17 = v7;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v18);

}

void __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 832);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_1E73A91E0;
  v10 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v5, "enumerateColumnsForHeader:usingBlock:", v4, v9);

}

void __77__SKUITracklistHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v7 = (objc_class *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  v9 = a2;
  v14 = (id)objc_msgSend([v7 alloc], "initWithUnsignedInteger:", a4);
  v10 = (void *)a1[4];
  objc_msgSend(v9, "width");
  v12 = v11;

  objc_msgSend(v10, "addLabelViewWithElement:width:context:", v8, a1[5], v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1[6] + 840), "setObject:forKey:", v13, v14);
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
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _QWORD v21[11];
  BOOL v22;
  _QWORD v23[3];
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SKUITracklistHeaderCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v25, sel_layoutSubviews);
  -[SKUITracklistHeaderCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SKUITracklistColumnData interColumnSpacing](self->_columnData, "interColumnSpacing");
  v13 = v12;
  -[SKUITracklistHeaderCollectionViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection");

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  -[SKUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  v24 = v16;
  -[SKUITracklistColumnData columns](self->_columnData, "columns");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__SKUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke;
  v21[3] = &unk_1E73A9208;
  v21[6] = v5;
  v21[7] = v7;
  *(double *)&v21[8] = v9;
  *(double *)&v21[9] = v11;
  v21[4] = self;
  v21[5] = v23;
  v22 = v15 == 1;
  v21[10] = v13;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v21);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = 1.0 / v19;

  -[UIView setFrame:](self->_bottomSeparatorView, "setFrame:", 0.0, v11 - v20, v9, v20);
  -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, v9, v20);
  _Block_object_dispose(v23, 8);
}

void __55__SKUITracklistHeaderCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "width");
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", v7, *(double *)(a1 + 72));
    v10 = v9;
    v12 = v11;
    *(float *)&v9 = (*(double *)(a1 + 72) - v11) * 0.5;
    v13 = floorf(*(float *)&v9);
    switch(objc_msgSend(v20, "headerAlignment"))
    {
      case 0:
      case 3:
      case 4:
        v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        break;
      case 1:
        v15 = (v8 - v10) * 0.5 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        goto LABEL_7;
      case 2:
        v15 = v8 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) - v10;
LABEL_7:
        v16 = v15;
        v14 = floorf(v16);
        break;
      default:
        v14 = *MEMORY[0x1E0C9D648];
        break;
    }
    v17 = v13;
    if (*(_BYTE *)(a1 + 88))
    {
      v14 = CGRectWithFlippedOriginRelativeToBoundingRect(v14, v17, v10, v12, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
      v10 = v18;
      v12 = v19;
    }
    objc_msgSend(v6, "setFrame:", v14, v17, v10, v12);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8
                                                              + *(double *)(a1 + 80)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SKUIUserInterfaceIdiom(v9);

    v11 = 10.0;
    if (v10 == 1)
      v11 = 11.0;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v13, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeForHeaderTitleLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
