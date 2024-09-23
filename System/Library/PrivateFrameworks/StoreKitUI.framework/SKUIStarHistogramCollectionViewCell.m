@implementation SKUIStarHistogramCollectionViewCell

- (SKUIStarHistogramCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUIStarHistogramCollectionViewCell *v16;
  objc_super v18;

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
        -[SKUIStarHistogramCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIStarHistogramCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  if (v16)
    -[SKUIViewReuseCollectionViewCell registerClass:forViewWithReuseIdentifier:](v16, "registerClass:forViewWithReuseIdentifier:", objc_opt_class(), CFSTR("starBar"));
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
        +[SKUIStarHistogramCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUIStarHistogramCollectionViewCell preferredSizeForViewElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
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
  id v18;
  _QWORD v19[4];
  id v20;
  double v21;
  id v22;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUIStarHistogramCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__SKUIStarHistogramCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v19[3] = &unk_1E73A7AD8;
  v21 = a4;
  v20 = v9;
  v22 = a1;
  v18 = v9;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v19);

}

void __81__SKUIStarHistogramCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "elementType");
  if (v3 == 138)
  {
    objc_msgSend(*(id *)(a1 + 48), "_attributedStringForLabelViewElement:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "labelLayoutCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestLayoutForLabel:attributedString:width:", v6, v4, (uint64_t)*(double *)(a1 + 40));

  }
  else if (v3 == 135)
  {
    +[SKUIStarRatingViewElementView requestLayoutForViewElement:width:context:](SKUIStarRatingViewElementView, "requestLayoutForViewElement:width:context:", v6, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  }

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
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  double v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  void *v32;
  double v33;
  uint64_t v34;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIStarHistogramCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x3010000000;
  v32 = &unk_1BBF15257;
  v34 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  v33 = a3;
  objc_msgSend(v8, "labelLayoutCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77__SKUIStarHistogramCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v24[3] = &unk_1E73A7B00;
  v27 = &v29;
  v18 = v8;
  v25 = v18;
  v28 = a3;
  v19 = v17;
  v26 = v19;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v24);
  v20 = v30[4];
  v21 = v30[5];

  _Block_object_dispose(&v29, 8);
  v22 = v20;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

void __77__SKUIStarHistogramCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType");
  switch(v3)
  {
    case 138:
      objc_msgSend(*(id *)(a1 + 40), "estimatedSizeForLabel:width:", v11, *(double *)(a1 + 56));
LABEL_7:
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(double *)(v9 + 40);
      v5 = (double *)(v9 + 40);
      v8 = v10;
      goto LABEL_8;
    case 135:
      objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v11, *(double *)(a1 + 56));
      goto LABEL_7;
    case 133:
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(double *)(v4 + 40);
      v5 = (double *)(v4 + 40);
      v7 = v6;
      v8 = 14.0;
LABEL_8:
      *v5 = v7 + v8;
      break;
  }

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
  double v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E73A4098;
  v15 = a4;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v6[3] = &unk_1E73A7B28;
  v7 = v3;
  v9 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v6);

}

void __75__SKUIStarHistogramCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  id v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "elementType");
  if (v3 == 138)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v10, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  }
  else
  {
    if (v3 == 135)
    {
      objc_msgSend(*(id *)(a1 + 32), "addStarRatingViewWithViewElement:width:context:", v10, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setElementSpacing:", 10);
    }
    else
    {
      v4 = v3 == 133;
      v5 = v10;
      if (!v4)
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 32), "addReusableViewWithReuseIdentifier:", CFSTR("starBar"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "style");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setColoringUsingStyle:", v7);

      objc_msgSend(v6, "setNumberOfStars:", objc_msgSend(v10, "numberOfStars"));
      objc_msgSend(v10, "value");
      objc_msgSend(v6, "setValue:", v8);
    }

  }
  v5 = v10;
LABEL_10:

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
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int ShouldReverseLayoutDirection;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double Width;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat x;
  CGFloat y;
  CGFloat v35;
  CGFloat height;
  CGFloat v37;
  CGFloat v38;
  double rect;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v46 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)SKUIStarHistogramCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v44, sel_layoutSubviews);
  -[SKUIStarHistogramCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v37 = v5;
  v38 = v4;
  rect = v6;
  v8 = v7;

  -[SKUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  MaxY = v9;
  v12 = v11;
  v14 = v13;
  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    v21 = rect - v12 - v14;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v23, "sizeThatFits:", v21, 1.79769313e308);
        v25 = v24;
        v27 = v26;
        v28 = v12;
        if (ShouldReverseLayoutDirection)
        {
          v47.origin.y = v37;
          v47.origin.x = v38;
          v47.size.width = rect;
          v47.size.height = v8;
          Width = CGRectGetWidth(v47);
          v48.origin.x = 0.0;
          v48.origin.y = MaxY;
          v48.size.width = v25;
          v48.size.height = v27;
          v28 = Width - CGRectGetWidth(v48) - v12;
        }
        v30 = MaxY;
        v31 = v25;
        v32 = v27;
        v49 = CGRectIntegral(*(CGRect *)&v28);
        x = v49.origin.x;
        y = v49.origin.y;
        v35 = v49.size.width;
        height = v49.size.height;
        objc_msgSend(v23, "setFrame:");
        v50.origin.x = x;
        v50.origin.y = y;
        v50.size.width = v35;
        v50.size.height = height;
        MaxY = CGRectGetMaxY(v50);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v19);
  }

}

+ (id)_attributedStringForLabelViewElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringWithDefaultFont:foregroundColor:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
