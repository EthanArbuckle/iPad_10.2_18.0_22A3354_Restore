@implementation SKUIResponseView

- (SKUIResponseView)initWithFrame:(CGRect)a3
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
  SKUIResponseView *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIImageView *replyImageView;
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
        -[SKUIResponseView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIResponseView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageNamed:inBundle:", CFSTR("Reply"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
    replyImageView = v16->_replyImageView;
    v16->_replyImageView = (UIImageView *)v20;

    -[SKUIResponseView addSubview:](v16, "addSubview:", v16->_replyImageView);
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
        +[SKUIResponseView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIResponseView preferredSizeForViewElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
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
        +[SKUIResponseView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__SKUIResponseView_requestLayoutForViewElement_width_context___block_invoke;
  v19[3] = &unk_1E73A7AD8;
  v21 = a4;
  v20 = v9;
  v22 = a1;
  v18 = v9;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v19);

}

void __62__SKUIResponseView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "elementType");
  if (v3 == 138)
  {
    v6 = objc_msgSend(v10, "labelViewStyle");
    if (v6 == 4)
    {
      objc_msgSend(*(id *)(a1 + 48), "_attributedStringForSubtitleLabel:context:", v10, *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "labelLayoutCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestLayoutForLabel:attributedString:width:", v10, v8, (uint64_t)(*(double *)(a1 + 40) + -17.5));

    }
    else
    {
      v4 = v6 == 1;
      v5 = v10;
      if (!v4)
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "editorialLayoutForLabelElement:width:", v10, *(double *)(a1 + 40) + -17.5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enqueueLayoutRequests");

    }
  }
  else
  {
    v4 = v3 == 105;
    v5 = v10;
    if (!v4)
      goto LABEL_11;
    +[SKUIReviewListTitleView requestLayoutForViewElement:width:context:](SKUIReviewListTitleView, "requestLayoutForViewElement:width:context:", v10, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  }
  v5 = v10;
LABEL_11:

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
  _QWORD *v25;
  _QWORD *v26;
  double v27;
  _QWORD v28[4];
  _QWORD v29[4];
  uint64_t v30;
  double *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIResponseView sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x3010000000;
  v33 = &unk_1BBF15257;
  v34 = *MEMORY[0x1E0C9D820];
  *(double *)&v34 = a3;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__SKUIResponseView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v22[3] = &unk_1E73A54C0;
  v27 = a3;
  v17 = v8;
  v23 = v17;
  v24 = &v30;
  v25 = v29;
  v26 = v28;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v22);
  v18 = v31[4];
  v19 = v31[5];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);

  v20 = v18;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

void __58__SKUIResponseView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "elementType") == 105)
  {
    +[SKUIReviewListTitleView sizeThatFitsWidth:viewElement:context:](SKUIReviewListTitleView, "sizeThatFitsWidth:viewElement:context:", v9, *(_QWORD *)(a1 + 32), *(double *)(a1 + 64));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v3
                                                                + 3.0
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v9, *(double *)(a1 + 64) + -17.5);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
    objc_msgSend(*(id *)(a1 + 32), "textPropertiesForViewElement:width:", v9, *(double *)(a1 + 64) + -17.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 1)
    {
      objc_msgSend(v5, "desiredOffsetTop");
      *(float *)&v7 = v7 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 40)
                                                                  + fmax(roundf(*(float *)&v7), 0.0);
    }
    objc_msgSend(v6, "baselineOffsetFromBottom");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  double v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E73A1230;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v12);

}

void __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "allViewTextProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAllViewTextProperties:", v4);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_1E73A4898;
  v10 = v3;
  v13 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v9);

}

void __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "elementType");
  if (v3 == 138)
  {
    v6 = objc_msgSend(v8, "labelViewStyle");
    if (v6 == 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v8, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56) + -17.5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setSubtitleView:", v5);
    }
    else
    {
      v4 = v8;
      if (v6 != 1)
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 32), "addTextViewWithElement:width:context:", v8, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56) + -17.5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setDescriptionView:", v5);
    }
  }
  else
  {
    v4 = v8;
    if (v3 != 105)
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "addReviewListTitleViewWithViewElement:width:context:", v8, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v8;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "textPropertiesForViewElement:width:", v8, *(double *)(a1 + 56) + -17.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTextProperties:forView:", v7, v5);

    v4 = v8;
  }
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[8];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  CGSize result;

  width = a3.width;
  -[SKUIResponseView contentInset](self, "contentInset", a3.width, a3.height);
  v6 = v5;
  v9 = width - (v7 + 17.5) - v8;
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = v6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__SKUIResponseView_sizeThatFits___block_invoke;
  v14[3] = &unk_1E73A9138;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = v19;
  *(double *)&v14[7] = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __33__SKUIResponseView_sizeThatFits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allViewTextProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    objc_msgSend(v6, "desiredOffsetTop");
    *(float *)&v8 = v8 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v7 = v7 + fmax(roundf(*(float *)&v8), 0.0);
  }
  objc_msgSend(v20, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  v11 = v10;
  if (v9 >= *(double *)(a1 + 56))
    v12 = *(double *)(a1 + 56);
  else
    v12 = v9;
  v13 = 0;
  v14 = v7;
  v21 = CGRectIntegral(*(CGRect *)(&v11 - 3));
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  objc_msgSend(v6, "baselineOffsetFromBottom");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v22);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 3.0;

}

- (void)layoutSubviews
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  _QWORD v25[16];
  char v26;
  _QWORD v27[4];
  _QWORD v28[4];
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SKUIResponseView;
  -[SKUIResponseView layoutSubviews](&v29, sel_layoutSubviews);
  v3 = storeShouldReverseLayoutDirection() ^ 1;
  -[SKUIResponseView bounds](self, "bounds");
  v24 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIResponseView contentInset](self, "contentInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17 + 17.5;
  v19 = v8 - (v17 + 17.5) - v15;
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  *(double *)&v27[3] = v12;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __34__SKUIResponseView_layoutSubviews__block_invoke;
  v25[3] = &unk_1E73A54E8;
  v25[4] = self;
  v25[5] = v27;
  v25[6] = v28;
  v26 = v3;
  *(double *)&v25[7] = v19;
  *(double *)&v25[8] = v12;
  *(double *)&v25[9] = v18;
  v25[10] = v14;
  *(double *)&v25[11] = v16;
  v25[12] = v24;
  v25[13] = v6;
  *(double *)&v25[14] = v8;
  v25[15] = v10;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v25);
  -[SKUIResponseView replyImageView](self, "replyImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v21, "setFrame:", 0.0, v12, v22, v23);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);

}

void __34__SKUIResponseView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Width;
  double v21;
  double v22;
  double v23;
  CGFloat x;
  CGFloat y;
  CGFloat v26;
  CGFloat height;
  uint64_t v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v29 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allViewTextProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    objc_msgSend(v6, "desiredOffsetTop");
    *(float *)&v8 = v8 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v7 = v7 + fmax(roundf(*(float *)&v8), 0.0);
  }
  objc_msgSend(*(id *)(a1 + 32), "subtitleView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v29)
  {
    v7 = v7 + -2.0;
    objc_msgSend(*(id *)(a1 + 32), "subtitleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingSize");
    v11 = v16;
    v18 = v17;

    v13 = v18 + 2.0;
  }
  else
  {
    objc_msgSend(v29, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
    v11 = v10;
    v13 = v12;
  }
  if (v11 >= *(double *)(a1 + 56))
    v11 = *(double *)(a1 + 56);
  if (*(_BYTE *)(a1 + 128))
  {
    v19 = *(double *)(a1 + 72);
  }
  else
  {
    Width = CGRectGetWidth(*(CGRect *)(a1 + 96));
    v30.origin.x = 0.0;
    v30.origin.y = v7;
    v30.size.width = v11;
    v30.size.height = v13;
    v19 = Width - CGRectGetWidth(v30) - *(double *)(a1 + 72);
  }
  v21 = v7;
  v22 = v11;
  v23 = v13;
  v31 = CGRectIntegral(*(CGRect *)&v19);
  x = v31.origin.x;
  y = v31.origin.y;
  v26 = v31.size.width;
  height = v31.size.height;
  objc_msgSend(v29, "setFrame:");
  objc_msgSend(v6, "baselineOffsetFromBottom");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v28;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = v26;
  v32.size.height = height;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 3.0;

}

+ (id)_attributedStringForSubtitleLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SKUIFontPreferredFontForTextStyle(21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (SKUITextBoxView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (SKUIAttributedStringView)subtitleView
{
  return self->_subtitleView;
}

- (void)setSubtitleView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleView, a3);
}

- (UIImageView)replyImageView
{
  return self->_replyImageView;
}

- (void)setReplyImageView:(id)a3
{
  objc_storeStrong((id *)&self->_replyImageView, a3);
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

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (NSMapTable)allViewTextProperties
{
  return self->_allViewTextProperties;
}

- (void)setAllViewTextProperties:(id)a3
{
  objc_storeStrong((id *)&self->_allViewTextProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allViewTextProperties, 0);
  objc_storeStrong((id *)&self->_replyImageView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
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
