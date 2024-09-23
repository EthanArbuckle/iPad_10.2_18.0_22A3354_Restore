@implementation SKUISectionHeaderView

- (SKUISectionHeaderView)initWithFrame:(CGRect)a3
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
  SKUISectionHeaderView *v16;
  uint64_t v17;
  NSMapTable *views;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUISectionHeaderView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUISectionHeaderView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    views = v16->_views;
    v16->_views = (NSMapTable *)v17;

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
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        +[SKUISectionHeaderView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUISectionHeaderView preferredSizeForViewElement:context:].cold.1();
  }
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
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
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  float v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUISectionHeaderView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v9, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "button");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v8;
  objc_msgSend(v8, "titleLabels");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(a1, "_attributedStringForLabel:context:", v24, v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "requestLayoutForLabel:attributedString:width:", v24, v25, (uint64_t)a4);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v21);
  }
  if (v36)
  {
    v26 = a4 * 0.3;
    v27 = vcvtps_s32_f32(v26);
    objc_msgSend(v36, "style");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "elementAlignment") == 1)
    {
      v29 = objc_msgSend(v19, "count");

      if (!v29)
      {
        objc_msgSend(v37, "style");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "elementPadding");
        v32 = v31;
        v34 = v33;

        v27 = (uint64_t)(a4 - (v34 + v32));
      }
    }
    else
    {

    }
    objc_msgSend(a1, "_attributedStringForButton:context:", v36, v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestLayoutForButton:attributedString:width:", v36, v35, v27);

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
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t j;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t k;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;
  CGSize result;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUISectionHeaderView sizeThatFitsWidth:viewElement:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "button");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = a3 * 0.3;
    objc_msgSend(a1, "_sizeForViewElement:width:context:", v18, v9, (double)(uint64_t)vcvtps_s32_f32(v19));
    v21 = v20;
    v23 = v22 + 10.0;
  }
  else
  {
    v23 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v8, "titleLabels");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a3 <= 600.0)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v40 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v59;
      v30 = 0.0;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v59 != v42)
            objc_enumerationMutation(v25);
          objc_msgSend(a1, "_sizeForViewElement:width:context:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i), v9, a3);
          v30 = v30 + v44;
        }
        v41 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v41);
    }
    else
    {
      v30 = 0.0;
    }
  }
  else
  {
    v47 = v24;
    v48 = v18;
    v49 = v8;
    objc_msgSend(a1, "_linesForViewElement:width:buttonSize:context:", v8, v9, a3, v23, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v55;
      v30 = 0.0;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v55 != v29)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v33 = v32;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v51;
            v37 = 0.0;
            do
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v51 != v36)
                  objc_enumerationMutation(v33);
                objc_msgSend(a1, "_sizeForViewElement:width:context:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k), v9, a3);
                if (v37 < v39)
                  v37 = v39;
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
            }
            while (v35);
          }
          else
          {
            v37 = 0.0;
          }

          v30 = v30 + v37;
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      }
      while (v28);
    }
    else
    {
      v30 = 0.0;
    }

    v18 = v48;
    v8 = v49;
    v25 = v47;
  }
  if (v30 >= v21)
    v21 = v30;

  v45 = a3;
  v46 = v21;
  result.height = v46;
  result.width = v45;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  id v14;
  NSArray *v15;
  NSArray *lines;
  _QWORD v17[4];
  id v18;
  SKUISectionHeaderView *v19;
  id v20;
  uint64_t *v21;
  double v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;

  v9 = a3;
  v10 = a5;
  objc_storeStrong((id *)&self->_header, a3);
  objc_msgSend((id)objc_opt_class(), "sizeThatFitsWidth:viewElement:context:", v9, v10, a4);
  self->_lastFitSize.width = v11;
  self->_lastFitSize.height = v12;
  -[NSMapTable removeAllObjects](self->_views, "removeAllObjects");
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x3010000000;
  v26 = &unk_1BBF15257;
  v27 = *MEMORY[0x1E0C9D820];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__SKUISectionHeaderView_reloadWithViewElement_width_context___block_invoke;
  v17[3] = &unk_1E73A21B0;
  v13 = v9;
  v22 = a4;
  v18 = v13;
  v19 = self;
  v14 = v10;
  v20 = v14;
  v21 = &v23;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v17);
  if (a4 <= 600.0)
  {
    lines = self->_lines;
    self->_lines = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_linesForViewElement:width:buttonSize:context:", self->_header, v14, a4, v24[4], v24[5]);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    lines = self->_lines;
    self->_lines = v15;
  }

  _Block_object_dispose(&v23, 8);
}

void __61__SKUISectionHeaderView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  v6 = *(double *)(a1 + 64) * 0.3;
  v7 = vcvtps_s32_f32(v6);
  objc_msgSend(v4, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "elementAlignment") != 1)
  {

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 488), "titleLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elementPadding");
  v13 = v12;
  v15 = v14;

  v7 = (uint64_t)(*(double *)(a1 + 64) - (v13 + v15));
  v16 = 1;
LABEL_7:
  objc_msgSend(v3, "addButtonWithElement:width:context:", v5, *(_QWORD *)(a1 + 48), (double)v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__buttonAction_, 64);
  LODWORD(v18) = -0.5;
  objc_msgSend(v17, "setCharge:", v18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "setObject:forKey:", v17, v5);
  objc_msgSend(v17, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v19 + 32) = v20;
  *(_QWORD *)(v19 + 40) = v21;
  if ((v16 & 1) == 0)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 32)
                                                                + 10.0;

LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "titleLabels");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v3, "addLabelViewWithElement:width:context:", v27, *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "setObject:forKey:", v28, v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
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
    -[SKUISectionHeaderView setNeedsLayout](self, "setNeedsLayout");
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
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double top;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat y;
  double x;
  CGFloat height;
  double width;
  double v34;
  uint64_t v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  CGFloat v39;
  NSArray *lines;
  CGFloat v41;
  char v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  _QWORD v53[5];
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  _QWORD v65[5];
  id v66;
  uint64_t *v67;
  uint64_t *v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  CGFloat v80;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  uint64_t v84;
  CGRect v85;
  CGRect v86;

  -[SKUISectionHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIHeaderViewElement button](self->_header, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "elementAlignment") == 1)
  {
    -[SKUIHeaderViewElement titleLabels](self->_header, "titleLabels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") == 0;

  }
  else
  {
    v14 = 0;
  }

  v52 = v4;
  if (v11)
  {
    -[NSMapTable objectForKey:](self->_views, "objectForKey:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v17 = v16;
    v19 = v18;
    if (v14)
    {
      objc_msgSend(v11, "style");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "elementPadding");
      v22 = v21;
      v24 = v23;

      v25 = v24 + self->_contentInset.left;
      top = v22 + self->_contentInset.top;
    }
    else
    {
      v85.origin.x = v4;
      v85.origin.y = v6;
      v85.size.width = v8;
      v85.size.height = v10;
      v25 = CGRectGetMaxX(v85) - self->_contentInset.right - v17;
      top = self->_contentInset.top;
    }
    v34 = v17;
    v35 = v19;
    v86 = CGRectIntegral(*(CGRect *)&v25);
    x = v86.origin.x;
    y = v86.origin.y;
    width = v86.size.width;
    height = v86.size.height;
    v36 = v4;
    v27 = v6;
    v37 = v6;
    v28 = v8;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v86.origin.x, v86.origin.y, v86.size.width, v86.size.height, v36, v37, v8, v10);
    objc_msgSend(v15, "setFrame:");
    v29 = v10;
    if (!v14)
    {
      x = x + -10.0;
      width = width + 10.0;
    }
  }
  else
  {
    v27 = v6;
    v28 = v8;
    v29 = v10;
    v15 = 0;
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v81 = 0;
  v82 = (double *)&v81;
  v83 = 0x2020000000;
  v84 = 0;
  -[SKUIHeaderViewElement titleLabels](self->_header, "titleLabels");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lastFitSize.width <= 600.0)
  {
    v77 = 0;
    v78 = &v77;
    v41 = self->_contentInset.top;
    v79 = 0x2020000000;
    v80 = v41;
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __39__SKUISectionHeaderView_layoutSubviews__block_invoke;
    v65[3] = &unk_1E73A21D8;
    v65[4] = self;
    v67 = &v77;
    v69 = v52;
    v70 = v27;
    v71 = v28;
    v72 = v29;
    v73 = x;
    v74 = y;
    v75 = width;
    v76 = height;
    v66 = v11;
    v68 = &v81;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v65);

    _Block_object_dispose(&v77, 8);
  }
  else
  {
    v39 = self->_contentInset.top;
    v77 = 0;
    v78 = &v77;
    lines = self->_lines;
    v79 = 0x2020000000;
    v80 = v39;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __39__SKUISectionHeaderView_layoutSubviews__block_invoke_2;
    v53[3] = &unk_1E73A2200;
    v53[4] = self;
    v57 = v52;
    v58 = v27;
    v59 = v28;
    v60 = v29;
    v54 = v11;
    v55 = &v77;
    v61 = x;
    v62 = y;
    v63 = width;
    v64 = height;
    v56 = &v81;
    -[NSArray enumerateObjectsUsingBlock:](lines, "enumerateObjectsUsingBlock:", v53);

    _Block_object_dispose(&v77, 8);
  }
  if (v15)
    v42 = v14;
  else
    v42 = 1;
  if ((v42 & 1) == 0)
  {
    objc_msgSend(v15, "frame");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v49 = self->_contentInset.top;
    v50 = v82[3];
    objc_msgSend(v15, "baselineOffset");
    *(float *)&v51 = v49 + v50 - v51;
    objc_msgSend(v15, "setFrame:", v44, roundf(*(float *)&v51), v46, v48);
  }

  _Block_object_dispose(&v81, 8);
}

void __39__SKUISectionHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  double v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v26;
  double v27;
  float v28;
  double v29;
  float v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v8 = v7;
  v9 = v6;
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v11 = *(double *)(*(_QWORD *)(a1 + 32) + 440);
  v12 = *(double *)(a1 + 80) - *(double *)(*(_QWORD *)(a1 + 32) + 456);
  v13 = v12 - v11;
  if (*(_QWORD *)(a1 + 40))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v15 = v12 - v11;
    v16 = v6;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 96), *(CGRect *)&v11))
      v12 = *(double *)(a1 + 96);
  }
  v17 = *(double *)(*(_QWORD *)(a1 + 32) + 440);
  v18 = v12 - v17;
  if (v8 >= v12 - v17)
    v8 = v12 - v17;
  objc_msgSend(v31, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = SKUIViewElementAlignmentForStyle(v19);

  if (v20 > 5)
  {
    v21 = *MEMORY[0x1E0C9D648];
  }
  else if (((1 << v20) & 0x33) != 0)
  {
    v21 = *(double *)(*(_QWORD *)(a1 + 32) + 440);
  }
  else if (v20 == 2)
  {
    v27 = *(double *)(*(_QWORD *)(a1 + 32) + 440);
    v28 = (v13 - v8) * 0.5;
    v29 = floorf(v28);
    v21 = v27 + v29;
    if (*(_QWORD *)(a1 + 40))
    {
      v35.origin.x = v27 + v29;
      v35.origin.y = v10;
      v35.size.width = v8;
      v35.size.height = v9;
      if (CGRectIntersectsRect(v35, *(CGRect *)(a1 + 96)))
      {
        v30 = (v18 - v8) * 0.5;
        v21 = *(double *)(*(_QWORD *)(a1 + 32) + 440) + floorf(v30);
      }
    }
  }
  else
  {
    v21 = v12 - v8;
  }
  v32.origin.x = v21;
  v32.origin.y = v10;
  v32.size.width = v8;
  v32.size.height = v9;
  v33 = CGRectIntegral(v32);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v33.origin.x, v33.origin.y, v33.size.width, v33.size.height, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
  objc_msgSend(v5, "setFrame:");
  if (!a3)
  {
    objc_msgSend(v5, "baselineOffset");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v26;
  }
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGRectGetMaxY(v34);

}

void __39__SKUISectionHeaderView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  double height;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(double *)(*(_QWORD *)(a1 + 32) + 440);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v14 = 0.0;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sizeThatFits:", v12, v13);
        v47.size.width = v18;
        v47.size.height = v19;
        v47.origin.x = v10;
        v47.origin.y = v11;
        v48 = CGRectIntegral(v47);
        height = v48.size.height;
        objc_msgSend(v17, "setFrame:", v48.origin.x, v48.origin.y, v48.size.width);
        objc_msgSend(v17, "baselineOffset");
        if (v14 < v21)
          v14 = v21;
        if (v15 < height)
          v15 = height;

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v8);
  }
  else
  {
    v14 = 0.0;
    v15 = 0.0;
  }
  v22 = *(double *)(a1 + 80) - *(double *)(*(_QWORD *)(a1 + 32) + 456);
  if (*(_QWORD *)(a1 + 40))
  {
    v50.origin.x = *(CGFloat *)(*(_QWORD *)(a1 + 32) + 440);
    v50.size.width = v22 - v50.origin.x;
    v50.origin.y = *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v50.size.height = v15;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 96), v50))
      v22 = *(double *)(a1 + 96);
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), (_QWORD)v36);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "frame");
        v30 = v29;
        v32 = v31;
        v33 = v14 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        objc_msgSend(v28, "baselineOffset");
        *(float *)&v34 = v33 - v34;
        v35 = roundf(*(float *)&v34);
        if (v30 >= v22 - v6)
          v30 = v22 - v6;
        SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v6, v35, v30, v32, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
        objc_msgSend(v28, "setFrame:");
        v49.origin.x = v6;
        v49.origin.y = v35;
        v49.size.width = v30;
        v49.size.height = v32;
        v6 = CGRectGetMaxX(v49) + 10.0;

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v25);
  }

  if (!a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v15
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_lastFitSize.width;
  height = self->_lastFitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_buttonAction:(id)a3
{
  id v4;
  uint64_t v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  SKUISectionHeaderView *v16;
  NSMapTable *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = 496;
  v6 = self->_views;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v21 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      v22 = v8;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v5), "objectForKey:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          SKUICollectionViewCellForView(self);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          SKUICollectionViewForView(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "indexPathForCell:", v13);
            v16 = self;
            v17 = v6;
            v18 = v5;
            v19 = v4;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v14, v11, 0, v20);

            v4 = v19;
            v5 = v18;
            v6 = v17;
            self = v16;
            v9 = v21;
          }
          else
          {
            objc_msgSend(v11, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
          }

          v8 = v22;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SKUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AA0], 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringWithDefaultFont:foregroundColor:style:", v11, v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aggregateValueForKey:", CFSTR("SKUISectionHeaderStyleKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  SKUIViewElementFontWithStyle(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithStyle(v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v5, "labelViewStyle");
  if (v13 > 5)
    goto LABEL_17;
  if (((1 << v13) & 0x1B) == 0)
  {
    if (!v10)
    {
      if (v9 != 1)
      {
        SKUIFontPreferredFontForTextStyle(1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_17;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A98], 2, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v16, 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v12)
      goto LABEL_17;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v12 = (void *)v17;
    goto LABEL_17;
  }
  if (v10)
  {
    if (!v12)
      goto LABEL_5;
  }
  else
  {
    if (v9 != 1)
    {
      SKUIFontPreferredFontForTextStyle(21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_17;
LABEL_5:
      if (v9 != 1)
      {
        v14 = (void *)MEMORY[0x1E0DC3658];
        v15 = 0.6;
LABEL_15:
        objc_msgSend(v14, "colorWithWhite:alpha:", 0.0, v15);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
LABEL_14:
      v14 = (void *)MEMORY[0x1E0DC3658];
      v15 = 0.8;
      goto LABEL_15;
    }
    SKUIFontPreferredFontForTextStyle(8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_14;
  }
LABEL_17:
  v18 = SKUIViewElementAlignmentForStyle(v7);
  v19 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v18);
  objc_msgSend(v5, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v10, v12, v19, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_linesForViewElement:(id)a3 width:(double)a4 buttonSize:(CGSize)a5 context:(id)a6
{
  double width;
  id v10;
  id v11;
  SKUIViewElementHorizontalLayout *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;

  width = a5.width;
  v10 = a6;
  v11 = a3;
  v12 = objc_alloc_init(SKUIViewElementHorizontalLayout);
  -[SKUIViewElementHorizontalLayout setElementSpacing:](v12, "setElementSpacing:", 10.0);
  -[SKUIViewElementHorizontalLayout setLayoutWidth:](v12, "setLayoutWidth:", a4 - width);
  objc_msgSend(v11, "titleLabels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__SKUISectionHeaderView__linesForViewElement_width_buttonSize_context___block_invoke;
  v17[3] = &unk_1E73A2228;
  v20 = a4;
  v18 = v10;
  v19 = a1;
  v14 = v10;
  -[SKUIViewElementHorizontalLayout layoutViewElements:usingSizingBlock:](v12, "layoutViewElements:usingSizingBlock:", v13, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __71__SKUISectionHeaderView__linesForViewElement_width_buttonSize_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_sizeForViewElement:width:context:", a2, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a5, "sizeForViewElement:width:", a3, a4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_lines, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUISectionHeaderView preferredSizeForViewElement:context:]";
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
