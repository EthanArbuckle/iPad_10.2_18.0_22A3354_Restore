@implementation SKUIStackListCollectionViewCell

- (SKUIStackListCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUIStackListCollectionViewCell *v16;
  uint64_t v17;
  NSMapTable *listViews;
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
        -[SKUIStackListCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIStackListCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    listViews = v16->_listViews;
    v16->_listViews = (NSMapTable *)v17;

  }
  return v16;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SKUIStackListCollectionViewCell *v17;
  double v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackListCollectionViewCell setAlignment:](self, "setAlignment:", objc_msgSend(v10, "elementAlignment"));

  -[SKUIStackListCollectionViewCell listViews](self, "listViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__SKUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_1E73A1230;
  v18 = a4;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v12 = v9;
  v13 = v8;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v14);

}

void __71__SKUIStackListCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "elementType") == 59)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "addStackItemViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v10 = objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v11 = (void *)v10;
              objc_msgSend(*(id *)(a1 + 48), "listViews");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKey:", v9, v11);

            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
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
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIStackListCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "children");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v17);
        v20 |= objc_msgSend(v8, "prefetchResourcesForViewElement:reason:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), a4);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20 & 1;
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
        +[SKUIStackListCollectionViewCell preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUIStackListCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "children");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v22, "elementType") == 59)
          +[SKUIStackItemView requestLayoutForViewElement:width:context:](SKUIStackItemView, "requestLayoutForViewElement:width:context:", v22, v8, a4);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
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
  double MaxY;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t i;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  double v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MaxX;
  void *v55;
  uint64_t v56;
  double v57;
  double v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  unint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;
  CGSize result;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUIStackListCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v17 = *MEMORY[0x1E0C9D820];
  MaxY = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v6, "children");
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v70;
    v22 = 0.0;
    v23 = MaxY;
    v24 = v17;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v70 != v21)
          objc_enumerationMutation(v18);
        v26 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SKUIStackItemView sizeThatFitsWidth:viewElement:context:numberOfLines:](SKUIStackItemView, "sizeThatFitsWidth:viewElement:context:numberOfLines:", v26, v7, 0, a3);
          v29 = v22 + 17.0;
          if (v22 <= 0.0)
            v29 = v22;
          v22 = v29 + v27;
          if (v29 + v27 > a3)
          {

            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v31 = v18;
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
            if (v32)
            {
              v33 = v32;
              v34 = a3 * 0.5 + -8.5;
              v35 = floorf(v34);
              v36 = *(_QWORD *)v66;
              while (2)
              {
                for (j = 0; j != v33; ++j)
                {
                  if (*(_QWORD *)v66 != v36)
                    objc_enumerationMutation(v31);
                  v38 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v64 = 0;
                    +[SKUIStackItemView sizeThatFitsWidth:viewElement:context:numberOfLines:](SKUIStackItemView, "sizeThatFitsWidth:viewElement:context:numberOfLines:", v38, v7, &v64, v35);
                    if (MaxY < v39)
                      MaxY = v39;
                    if (v64 > 2)
                    {

                      v41 = *MEMORY[0x1E0C9D648];
                      v40 = *(double *)(MEMORY[0x1E0C9D648] + 8);
                      v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
                      v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
                      v62 = 0u;
                      v63 = 0u;
                      v60 = 0u;
                      v61 = 0u;
                      v44 = v31;
                      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
                      if (v45)
                      {
                        v46 = v45;
                        v47 = *(_QWORD *)v61;
                        do
                        {
                          for (k = 0; k != v46; ++k)
                          {
                            if (*(_QWORD *)v61 != v47)
                              objc_enumerationMutation(v44);
                            v49 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              +[SKUIStackItemView sizeThatFitsWidth:viewElement:context:numberOfLines:](SKUIStackItemView, "sizeThatFitsWidth:viewElement:context:numberOfLines:", v49, v7, 0, a3);
                              v52 = v51;
                              if (v50 >= 16.0)
                                v53 = v50;
                              else
                                v53 = 16.0;
                              v78.origin.x = v41;
                              v78.origin.y = v40;
                              v78.size.width = v42;
                              v78.size.height = v43;
                              if (v52 + CGRectGetMaxX(v78) <= a3)
                              {
                                v41 = v41 + v52;
                              }
                              else
                              {
                                v79.origin.x = v41;
                                v79.origin.y = v40;
                                v79.size.width = v42;
                                v79.size.height = v43;
                                v40 = v40 + CGRectGetHeight(v79) + 6.0;
                                v41 = 0.0;
                              }
                              v80.origin.x = v41;
                              v80.origin.y = v40;
                              v80.size.width = v52;
                              v80.size.height = v53;
                              MaxX = CGRectGetMaxX(v80);
                              if (v17 < MaxX)
                                v17 = MaxX;
                              v42 = v52;
                              v43 = v53;
                            }
                          }
                          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
                        }
                        while (v46);
                      }

                      v81.origin.x = v41;
                      v81.origin.y = v40;
                      v81.size.width = v42;
                      v81.size.height = v43;
                      MaxY = CGRectGetMaxY(v81);
                      goto LABEL_55;
                    }
                  }
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
                if (v33)
                  continue;
                break;
              }
            }

            goto LABEL_58;
          }
          if (v28 >= 16.0)
            v30 = v28;
          else
            v30 = 16.0;
          if (v23 < v30)
            v23 = v30;
          if (v24 < v22)
            v24 = v22;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      if (v20)
        continue;
      break;
    }

    v17 = v24;
    MaxY = v23;
  }
  else
  {

  }
LABEL_55:
  objc_msgSend(v6, "style");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "elementAlignment");

  if (v56 == 3)
    MaxY = MaxY + 6.0;
  a3 = v17;
LABEL_58:

  v57 = a3;
  v58 = MaxY;
  result.height = v58;
  result.width = v57;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKUIStackListCollectionViewCell listViews](self, "listViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "nextObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = 0;
    do
    {
      if ((v15 & 1) != 0)
        v15 = 1;
      else
        v15 = objc_msgSend(v14, "setImage:forArtworkRequest:context:", v8, v9, v10);
      objc_msgSend(v12, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    while (v16);
  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  double height;
  double width;
  double v6;
  double v7;
  __int128 v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v8 = *MEMORY[0x1E0C9D820];
  if (!-[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, a3.width, a3.height))
  {
    if (-[SKUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", &v8, 0.0, 0.0, width, height))
    {
      goto LABEL_6;
    }
    -[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", &v8, 0.0, 0.0, width, height);
  }
  if (-[SKUIStackListCollectionViewCell alignment](self, "alignment") == 3)
    *((double *)&v8 + 1) = *((double *)&v8 + 1) + 6.0;
LABEL_6:
  v7 = *((double *)&v8 + 1);
  v6 = *(double *)&v8;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKUIStackListCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[SKUIStackListCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (!-[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11)&& !-[SKUIStackListCollectionViewCell layoutSubviewsWithFixedWidth:size:](self, "layoutSubviewsWithFixedWidth:size:", 0, v5, v7, v9, v11))
  {
    -[SKUIStackListCollectionViewCell layoutSubviewsWithFlowLayout:size:](self, "layoutSubviewsWithFlowLayout:size:", 0, v5, v7, v9, v11);
  }
}

- (BOOL)layoutSubviewsWithFlowLayout:(CGRect)a3 size:(CGSize *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MinX;
  double v43;
  double v44;
  BOOL v45;
  _BOOL4 v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MaxX;
  double v52;
  _BOOL4 v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat MaxY;
  CGRect v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  CGFloat rect;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v76 = *MEMORY[0x1E0C80C00];
  -[SKUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  rect = v10;
  v12 = v11;
  v14 = v13;
  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = width;
  v77.size.height = height;
  v15 = CGRectGetWidth(v77);
  v61.origin.x = x;
  v61.origin.y = y;
  v78.origin.x = x;
  v78.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v78.size.width = width;
  v78.size.height = height;
  v16 = CGRectGetWidth(v78);
  v18 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = -[SKUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  v68 = v18;
  v69 = v17;
  if (!v23)
  {
    v26 = 1;
    v27 = 0.0;
    goto LABEL_32;
  }
  v24 = v23;
  v70 = v15 - v12 - v14;
  v65 = v12;
  v62 = v16 - v14;
  v63 = v18;
  if (v21)
    v12 = v16 - v14;
  v25 = *(_QWORD *)v72;
  v26 = 1;
  v27 = 0.0;
  v28 = rect;
  v64 = v17;
  do
  {
    v29 = 0;
    v30 = v20;
    v31 = v19;
    do
    {
      v67 = v30;
      if (*(_QWORD *)v72 != v25)
        objc_enumerationMutation(v22);
      v32 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v29);
      objc_msgSend(v32, "sizeThatFits:", v70, 1.79769313e308, *(_QWORD *)&v61.origin.x, *(_QWORD *)&v61.origin.y, *(_QWORD *)&v61.size.width, *(_QWORD *)&v61.size.height);
      v19 = v33;
      v79.size.height = v34;
      v79.origin.x = v63;
      v79.origin.y = v17;
      v79.size.width = v19;
      v35 = fmax(CGRectGetHeight(v79), 16.0);
      if (-[SKUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned"))
      {
        v80.origin.x = v63;
        v80.origin.y = v17;
        v80.size.width = v19;
        v36 = v35;
        v80.size.height = v35;
        v12 = v12 - CGRectGetWidth(v80);
      }
      else
      {
        v36 = v35;
      }
      v37 = -[SKUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
      v38 = v12;
      v39 = v28;
      v40 = v19;
      v20 = v36;
      v41 = v36;
      if (v37)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v38);
        if (MinX >= v65 + CGRectGetMinX(v61))
          goto LABEL_13;
      }
      else if (CGRectGetMaxX(*(CGRect *)&v38) <= v62)
      {
LABEL_13:
        v43 = v12;
        v44 = v12;
        goto LABEL_20;
      }
      if (v70 < v27)
        v27 = v70;
      objc_msgSend(v32, "setFrame:", v12, v28, v19, v20);
      objc_msgSend(v32, "layoutIfNeeded");
      v45 = (unint64_t)objc_msgSend(v32, "numberOfLines") > 1;
      v43 = v65;
      if (-[SKUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned"))
      {
        v81.origin.x = v12;
        v81.origin.y = rect;
        v81.size.width = v19;
        v81.size.height = v20;
        v43 = v62 - CGRectGetWidth(v81);
      }
      v26 &= v45;
      v82.origin.x = v68;
      v82.origin.y = v69;
      v82.size.width = v31;
      v82.size.height = v67;
      v28 = CGRectGetMaxY(v82) + 6.0;
      v44 = v43;
LABEL_20:
      objc_msgSend(v32, "setFrame:", v43, v28, v19, v20);
      v46 = -[SKUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
      v47 = v43;
      v48 = v28;
      v49 = v19;
      v50 = v20;
      if (v46)
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v47);
        v52 = -17.0;
      }
      else
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v47);
        v52 = 17.0;
      }
      v12 = MaxX + v52;
      v53 = -[SKUIStackListCollectionViewCell _isRightAligned](self, "_isRightAligned");
      v68 = v44;
      v69 = v28;
      v54 = v43;
      v55 = v28;
      v56 = v19;
      v57 = v20;
      if (v53)
        v58 = v70 - CGRectGetMinX(*(CGRect *)&v54);
      else
        v58 = CGRectGetMaxX(*(CGRect *)&v54);
      if (v27 < v58)
        v27 = v58;
      ++v29;
      v30 = v20;
      v31 = v19;
      v28 = rect;
      v17 = v64;
    }
    while (v24 != v29);
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v75, 16, v20);
  }
  while (v24);
LABEL_32:

  if (a4)
  {
    v83.origin.x = v68;
    v83.origin.y = v69;
    v83.size.width = v19;
    v83.size.height = v20;
    MaxY = CGRectGetMaxY(v83);
    a4->width = v27;
    a4->height = MaxY;
  }
  return v26 & 1;
}

- (BOOL)layoutSubviewsWithFixedWidth:(CGRect)a3 size:(CGSize *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  char v22;
  double v23;
  uint64_t i;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxX;
  double v31;
  CGFloat v32;
  CGFloat MaxY;
  double v35;
  double v36;
  CGRect v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v43 = *MEMORY[0x1E0C80C00];
  -[SKUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v37.origin.x = x;
  v37.origin.y = y;
  v44.origin.x = x;
  v44.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v44.size.width = width;
  v44.size.height = height;
  v38 = 0u;
  v39 = 0u;
  v36 = v15;
  v16 = CGRectGetWidth(v44) - v13 - v15;
  v40 = 0u;
  v41 = 0u;
  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = v16 * 0.5 + -8.5;
    v35 = floorf(v20);
    v21 = *(_QWORD *)v39;
    v22 = 1;
    v23 = v13;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v17);
        v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v25, "sizeThatFits:", v35, 1.79769313e308);
        v27 = v26;
        v29 = v28;
        v45.origin.x = v23;
        v45.origin.y = v11;
        v45.size.width = v27;
        v45.size.height = v29;
        MaxX = CGRectGetMaxX(v45);
        if (MaxX <= CGRectGetMaxX(v37) - v36)
        {
          v31 = v11;
          v32 = v23;
        }
        else
        {
          v46.origin.x = v13;
          v46.origin.y = v11;
          v46.size.width = v27;
          v46.size.height = v29;
          v31 = CGRectGetMaxY(v46) + 6.0;
          v23 = v13;
          v32 = v13;
        }
        objc_msgSend(v25, "setFrame:", v23, v31, v27, v29);
        objc_msgSend(v25, "layoutIfNeeded");
        v22 &= (unint64_t)objc_msgSend(v25, "numberOfLines") < 3;
        v47.origin.x = v23;
        v47.origin.y = v31;
        v47.size.width = v27;
        v47.size.height = v29;
        v23 = CGRectGetMaxX(v47) + 17.0;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v19);
  }
  else
  {
    v32 = *MEMORY[0x1E0C9D648];
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v22 = 1;
  }

  if (a4)
  {
    v48.origin.x = v32;
    v48.origin.y = v31;
    v48.size.width = v27;
    v48.size.height = v29;
    MaxY = CGRectGetMaxY(v48);
    a4->width = v16;
    a4->height = MaxY;
  }
  return v22;
}

- (BOOL)_isRightAligned
{
  return -[SKUIStackListCollectionViewCell alignment](self, "alignment") == 3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSMapTable)listViews
{
  return self->_listViews;
}

- (void)setListViews:(id)a3
{
  objc_storeStrong((id *)&self->_listViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listViews, 0);
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
