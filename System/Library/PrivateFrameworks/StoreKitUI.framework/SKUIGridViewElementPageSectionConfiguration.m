@implementation SKUIGridViewElementPageSectionConfiguration

- (double)columnContentWidth
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGridViewElementPageSectionConfiguration columnContentWidth].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
  -[SKUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
  return result;
}

- (double)columnWidth
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGridViewElementPageSectionConfiguration columnWidth].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if (self->_numberOfColumns < 1)
    return 0.0;
  -[SKUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v12 * v14;

  v16 = floor(v15 / (double)self->_numberOfColumns);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v16 / v18;

  return v19;
}

- (void)setDataSource:(id)a3
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
  id WeakRetained;
  id v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridViewElementPageSectionConfiguration setDataSource:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v4)
  {
    v14 = objc_storeWeak((id *)&self->_dataSource, v4);
    *(_BYTE *)&self->_dataSourceRespondsToSelectorFlags = *(_BYTE *)&self->_dataSourceRespondsToSelectorFlags & 0xFE | objc_opt_respondsToSelector() & 1;

  }
}

- (void)setNumberOfColumns:(int64_t)a3
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
        -[SKUIGridViewElementPageSectionConfiguration setNumberOfColumns:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  self->_numberOfColumns = a3;
  self->_cellContentWidth = 0.0;
  self->_cellPaddingLeftEdgeHorizontal = 0.0;
  self->_cellPaddingRightEdgeHorizontal = 0.0;
  self->_cellPaddingInteriorHorizontal = 0.0;
  self->_cellPaddingNeedsReloading = 1;
}

- (id)backgroundColorForViewElement:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIGridViewElementPageSectionConfiguration backgroundColorForViewElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ikBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (objc_msgSend(v3, "elementType") == 48)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (Class)cellClassForViewElement:(id)a3
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
  uint64_t v13;
  objc_class *v14;
  objc_class *v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridViewElementPageSectionConfiguration cellClassForViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_msgSend(v4, "elementType");
  v14 = 0;
  if (v13 > 48)
  {
    if (v13 <= 65)
    {
      if (v13 == 49 || v13 == 50)
        goto LABEL_20;
    }
    else
    {
      if (v13 == 66)
      {
        v14 = -[SKUIGridViewElementPageSectionConfiguration lockupCellClassWithLockup:](self, "lockupCellClassWithLockup:", v4);
        goto LABEL_21;
      }
      if (v13 == 141 || v13 == 152)
        goto LABEL_20;
    }
  }
  else if (v13 > 13)
  {
    if (v13 == 14)
    {
      v14 = -[SKUIGridViewElementPageSectionConfiguration _cardCellClassForCard:](self, "_cardCellClassForCard:", v4);
      goto LABEL_21;
    }
    if (v13 == 48)
      goto LABEL_20;
  }
  else if ((unint64_t)(v13 - 12) < 2 || v13 == 4)
  {
LABEL_20:
    v14 = (objc_class *)objc_opt_class();
  }
LABEL_21:
  v15 = v14;

  return v15;
}

- (id)cellForViewElement:(id)a3 indexPath:(id)a4
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
  SKUIStorePageSectionContext *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIGridViewElementPageSectionConfiguration cellForViewElement:indexPath:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = self->_pageSectionContext;
  v17 = objc_msgSend(v6, "elementType");
  v18 = 0;
  if (v17 > 48)
  {
    if (v17 <= 65)
    {
      if (v17 != 49)
      {
        if (v17 != 50)
          goto LABEL_30;
        goto LABEL_20;
      }
    }
    else
    {
      if (v17 == 66)
      {
        -[SKUIGridViewElementPageSectionConfiguration _lockupCellReuseIdentifierWithLockup:](self, "_lockupCellReuseIdentifierWithLockup:", v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIStorePageSectionContext collectionView](v16, "collectionView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v20, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      }
      if (v17 == 141)
        goto LABEL_20;
      if (v17 != 152)
        goto LABEL_30;
    }
    -[SKUIStorePageSectionContext collectionView](v16, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73AA4B0, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setShowsReflectionImage:", 0);
    if (!v18)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (v17 > 13)
  {
    if (v17 == 14)
    {
      v24 = objc_msgSend(v6, "cardType");
      -[SKUIStorePageSectionContext collectionView](v16, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v24 == 3)
        v21 = CFSTR("SKUIEditorialCardCellReuseIdentifier");
      else
        v21 = CFSTR("SKUICardViewElementReuseIdentifier");
    }
    else
    {
      if (v17 != 48)
        goto LABEL_30;
      -[SKUIStorePageSectionContext collectionView](v16, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("SKUISectionHeaderReuseIdentifier");
    }
    goto LABEL_27;
  }
  if ((unint64_t)(v17 - 12) >= 2)
  {
    if (v17 != 4)
      goto LABEL_30;
    -[SKUIStorePageSectionContext collectionView](v16, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = CFSTR("SKUIActivityIndicatorReuseIdentifier");
    goto LABEL_27;
  }
LABEL_20:
  -[SKUIStorePageSectionContext collectionView](v16, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = CFSTR("SKUIButtonReuseIdentifier");
LABEL_27:
  objc_msgSend(v19, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v21, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  if (v18)
LABEL_29:
    -[SKUIGridViewElementPageSectionConfiguration configureCell:forViewElement:indexPath:](self, "configureCell:forViewElement:indexPath:", v18, v6, v7);
LABEL_30:

  return v18;
}

- (CGSize)cellSizeForViewElement:(id)a3 indexPath:(id)a4
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
  uint64_t v16;
  double v17;
  double v18;
  id v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double *v35;
  double v36;
  double v37;
  __int128 v38;
  uint64_t v39;
  double minimumCellHeight;
  double v41;
  double v42;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[3];
  char v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  CGSize result;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v57 = 0;
  v58 = (double *)&v57;
  v59 = 0x3010000000;
  v61 = 0;
  v62 = 0;
  v60 = &unk_1BBF15257;
  -[SKUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
  *((_QWORD *)v58 + 4) = v16;
  -[SKUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
  v18 = v17;
  v19 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v20)
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  v28 = objc_msgSend(v19, "elementType");

  if (v28 == 48)
  {
    -[SKUIGridViewElementPageSectionConfiguration _cellInsetsForViewElement:indexPath:](self, "_cellInsetsForViewElement:indexPath:", v19, v7);
    v30 = v29;
    v32 = v31;
    -[SKUIGridViewElementPageSectionConfiguration _cellHeightForViewElement:width:](self, "_cellHeightForViewElement:width:", v19, v18 - v33 - v34);
    v35 = v58;
    v37 = v32 + v30 + v36;
    v58[4] = v18;
    v35[5] = v37;
  }
  else
  {
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v56 = 0;
    -[SKUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
    v49 = 0;
    v50 = (double *)&v49;
    v51 = 0x4010000000;
    v52 = &unk_1BBF15257;
    v38 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    v53 = *MEMORY[0x1E0DC49E8];
    v54 = v38;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __80__SKUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke;
    v43[3] = &unk_1E73A7528;
    v48 = v39;
    v43[4] = self;
    v45 = &v49;
    v46 = &v57;
    v47 = v55;
    v44 = v7;
    -[SKUIGridViewElementPageSectionConfiguration _enumerateViewElementsForRowOfIndexPath:usingBlock:](self, "_enumerateViewElementsForRowOfIndexPath:usingBlock:", v44, v43);
    v58[5] = v50[6] + v50[4] + v58[5];

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(v55, 8);
    v35 = v58;
    v18 = v58[4];
    v37 = v58[5];
  }
  if (v37 >= self->_minimumCellHeight)
    minimumCellHeight = v37;
  else
    minimumCellHeight = self->_minimumCellHeight;
  v35[5] = minimumCellHeight;
  _Block_object_dispose(&v57, 8);

  v41 = v18;
  v42 = minimumCellHeight;
  result.height = v42;
  result.width = v41;
  return result;
}

void __80__SKUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  id v27;

  v27 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_cellInsetsForViewElement:indexPath:", v27, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *(_BYTE **)(a1 + 32);
  v15 = *(double *)(a1 + 72) - v8 - v12;
  if (v14[96])
    v16 = v15;
  else
    v16 = *(double *)(a1 + 72);
  objc_msgSend(v14, "_cellHeightForViewElement:width:", v27, v16);
  v18 = v17;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 236))
  {
    if (objc_msgSend(v27, "rendersWithPerspective"))
    {
      v19 = (void *)objc_msgSend(*(id *)(a1 + 32), "cellClassForViewElement:", v27);
      if (class_conformsToProtocol((Class)v19, (Protocol *)&unk_1EF42F8D8))
      {
        objc_msgSend(v19, "maximumPerspectiveHeightForSize:", v16, v18);
        v7 = v20;
      }
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(double *)(v21 + 48);
  if (v22 < v11)
    v22 = v11;
  *(double *)(v21 + 48) = v22;
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(double *)(v23 + 32);
  if (v24 < v7)
    v24 = v7;
  *(double *)(v23 + 32) = v24;
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(double *)(v25 + 40);
  if (v26 < v18)
    v26 = v18;
  *(double *)(v25 + 40) = v26;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 40), "isEqual:", v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v13 + v9 + v16;
  }

}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
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

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridViewElementPageSectionConfiguration collectionViewWillApplyLayoutAttributes:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "indexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", -[SKUIGridViewElementPageSectionConfiguration positionForIndexPath:](self, "positionForIndexPath:", v13));

}

- (void)configureCell:(id)a3 forViewElement:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUIStorePageSectionContext *v19;
  uint64_t v20;
  id v21;
  int v22;
  _BOOL4 v23;
  __CFString *v24;
  UIColor *v25;
  CGFloat top;
  double left;
  CGFloat right;
  double bottom;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  void *v34;
  uint64_t separatorStyle;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  id v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  id v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  _BOOL4 v86;
  SKUIStorePageSectionContext *v87;
  id v88;
  double v89;
  CGRect v90;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUIGridViewElementPageSectionConfiguration configureCell:forViewElement:indexPath:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v19 = self->_pageSectionContext;
  v20 = objc_msgSend(v9, "elementType");
  v21 = 0;
  v22 = 0;
  if (v20 <= 48)
  {
    if (v20 == 14)
    {
      if (objc_msgSend(v9, "cardType") != 3)
      {
        v21 = v8;
        v22 = 0;
        goto LABEL_11;
      }
LABEL_10:
      v22 = 0;
      v21 = 0;
LABEL_11:
      v23 = 0;
      goto LABEL_16;
    }
    v23 = 0;
    if (v20 == 48)
    {
      v21 = 0;
      v23 = 0;
      v22 = 1;
    }
  }
  else
  {
    if (v20 == 49)
    {
LABEL_9:
      objc_msgSend(v8, "setShowsReflectionImage:", 0);
      goto LABEL_10;
    }
    if (v20 != 66)
    {
      v23 = 0;
      if (v20 != 152)
        goto LABEL_16;
      goto LABEL_9;
    }
    -[SKUIGridViewElementPageSectionConfiguration _lockupCellReuseIdentifierWithLockup:](self, "_lockupCellReuseIdentifierWithLockup:", v9);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v23 = v24 == CFSTR("SKUIHorizontalLockupReuseID");

    v22 = 0;
    v21 = 0;
  }
LABEL_16:
  v25 = self->_separatorColor;
  top = self->_separatorWidths.top;
  left = self->_separatorWidths.left;
  bottom = self->_separatorWidths.bottom;
  right = self->_separatorWidths.right;
  v30 = self->_separatorMargins.top;
  v31 = self->_separatorMargins.left;
  v32 = self->_separatorMargins.bottom;
  v33 = self->_separatorMargins.right;
  if (v22)
  {
    v86 = v23;
    objc_msgSend(v9, "style");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "valueForStyle:", *MEMORY[0x1E0D3A598]);
    separatorStyle = objc_claimAutoreleasedReturnValue();

    v87 = v19;
    if (separatorStyle)
    {
      objc_msgSend(v34, "borderWidths");
      top = v36;
      left = v37;
      bottom = v38;
      right = v39;
      separatorStyle = 2;
    }
    v88 = v10;
    objc_msgSend(v34, "valueForStyle:", *MEMORY[0x1E0D3A588]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v34, "ikBorderColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "color");
      v42 = objc_claimAutoreleasedReturnValue();

      v25 = (UIColor *)v42;
    }
    objc_msgSend(v34, "valueForStyle:", *MEMORY[0x1E0D3A590]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v34, "borderMargins");
      v30 = v44;
      v31 = v45;
      v32 = v46;
      v33 = v47;
    }
    v89 = right;
    objc_msgSend(v9, "parent");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "style");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ikBackgroundColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50 && objc_msgSend(v50, "colorType") == 3)
      self->_hasHeader = 1;
    v51 = top;

    v19 = v87;
    v10 = v88;
    v23 = v86;
  }
  else
  {
    v89 = self->_separatorWidths.right;
    separatorStyle = self->_separatorStyle;
    if (self->_hasHeader)
    {
      v51 = self->_separatorWidths.top;
      if (objc_msgSend(v10, "item") == 1)
        separatorStyle = 0;
    }
    else
    {
      v51 = self->_separatorWidths.top;
    }
  }
  v52 = v31;
  v53 = v9;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v54 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v54)
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:].cold.1(v54, v55, v56, v57, v58, v59, v60, v61);
    }
  }
  v62 = v30;
  v63 = objc_msgSend(v53, "elementType");

  if (v63 == 48)
  {
    -[SKUIStorePageSectionContext activePageWidth](v19, "activePageWidth");
    v65 = v64;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
    v67 = v65 - v66;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
    v69 = v67 - v68;
  }
  else
  {
    -[SKUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
    v69 = v70;
  }
  objc_msgSend(v8, "reloadWithViewElement:width:context:", v53, self->_cellLayoutContext, v69);
  objc_msgSend(v8, "setSeparatorColor:", v25);
  objc_msgSend(v8, "setSeparatorStyle:", separatorStyle);
  objc_msgSend(v8, "setSeparatorWidths:", v51, left, bottom, v89);
  objc_msgSend(v8, "setSeparatorInsets:", v62, v52, v32, v33);
  if (v23)
    objc_msgSend(v8, "setEditing:animated:", self->_showsEditMode, 0);
  -[SKUIGridViewElementPageSectionConfiguration _normalizedContentInsetForViewElement:indexPath:](self, "_normalizedContentInsetForViewElement:indexPath:", v53, v10);
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  if (-[SKUIGridViewElementPageSectionConfiguration rendersWithPerspective](self, "rendersWithPerspective")
    && objc_msgSend(v8, "conformsToProtocol:", &unk_1EF42F8D8))
  {
    v79 = v8;
    -[SKUIStorePageSectionContext parentViewController](self->_pageSectionContext, "parentViewController");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "view");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v79, "setPerspectiveTargetView:", v81);
    objc_msgSend(v81, "bounds");
    objc_msgSend(v79, "setVanishingPoint:", CGRectGetMidX(v90), -800.0);
    if (objc_msgSend(v53, "rendersWithPerspective"))
    {
      objc_msgSend((id)objc_opt_class(), "sizeThatFitsWidth:viewElement:context:", v53, self->_cellLayoutContext, v69);
      objc_msgSend((id)objc_opt_class(), "maximumPerspectiveHeightForSize:", v82, v83);
      if (v72 < v84)
        v72 = v84;
    }

  }
  objc_msgSend(v8, "setContentInset:", v72, v74, v76, v78);
  if (v21)
  {
    -[SKUIGridViewElementPageSectionConfiguration _cardArtworkBoundingSizeForIndexPath:](self, "_cardArtworkBoundingSizeForIndexPath:", v10);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setArtworkBoundingSize:", v85);

  }
}

- (Class)lockupCellClassWithLockup:(id)a3
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

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridViewElementPageSectionConfiguration lockupCellClassWithLockup:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if ((unint64_t)-[SKUIGridViewElementPageSectionConfiguration _lockupTypeForLockup:](self, "_lockupTypeForLockup:", v4) <= 8)
  {
    objc_opt_class();
    self = (SKUIGridViewElementPageSectionConfiguration *)objc_claimAutoreleasedReturnValue();
  }

  return (Class)self;
}

- (int64_t)positionForIndexPath:(id)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  void *v16;
  id WeakRetained;
  int64_t v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridViewElementPageSectionConfiguration positionForIndexPath:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_msgSend(a3, "item");
  v14 = 1;
  v19 = 1;
  if ((v13 & 0x8000000000000000) == 0)
  {
    v15 = v13;
    if (v13 >= -[NSArray count](self->_positions, "count"))
    {
      v14 = 1;
    }
    else
    {
      -[NSArray objectAtIndex:](self->_positions, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "integerValue");
      v19 = v14;

    }
  }
  if ((*(_BYTE *)&self->_dataSourceRespondsToSelectorFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "gridViewElementPageSectionConfiguration:configurePosition:forItemAtIndexPath:", self, &v19, a3);

    return v19;
  }
  return v14;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIGridViewElementPageSectionConfiguration registerReusableClassesForCollectionView:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73BE850);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7C90);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B36D0);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B6AF0);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B7A90);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AA4B0);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B2830);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B0070);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73AE590);

}

- (void)reloadCellWithIndexPath:(id)a3 forViewElement:(id)a4 reason:(int64_t)a5
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
  void *v20;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIGridViewElementPageSectionConfiguration reloadCellWithIndexPath:forViewElement:reason:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIStorePageSectionContext collectionView](self->_pageSectionContext, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cellForItemAtIndexPath:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
  objc_msgSend(v19, "reloadWithViewElement:width:context:", v9, self->_cellLayoutContext);
  if (a5 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v19, "setEditing:animated:", self->_showsEditMode, 1);
  }
  if (-[SKUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](self, "viewElementIsStandardCard:", v9))
  {
    -[SKUIGridViewElementPageSectionConfiguration _cardArtworkBoundingSizeForIndexPath:](self, "_cardArtworkBoundingSizeForIndexPath:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setArtworkBoundingSize:", v20);

  }
  -[SKUIGridViewElementPageSectionConfiguration _normalizedContentInsetForViewElement:indexPath:](self, "_normalizedContentInsetForViewElement:indexPath:", v9, v8);
  objc_msgSend(v19, "setContentInset:");

}

- (void)requestCellLayoutForViewElement:(id)a3
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
  objc_class *v13;
  id v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIGridViewElementPageSectionConfiguration cellClassForViewElement:](self, "cellClassForViewElement:", v4);
  v14 = v4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v15)
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  v23 = objc_msgSend(v14, "elementType");

  if (v23 == 48)
  {
    -[SKUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
    v25 = v24;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
    v27 = v25 - v26;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
    v29 = v27 - v28;
  }
  else
  {
    -[SKUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
  }
  -[objc_class requestLayoutForViewElement:width:context:](v13, "requestLayoutForViewElement:width:context:", v14, self->_cellLayoutContext, (double)(uint64_t)v29);

}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forGridViewElement:(id)a4
{
  CGFloat right;
  double bottom;
  CGFloat left;
  double top;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  char v25;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIGridViewElementPageSectionConfiguration sectionContentInsetAdjustedFromValue:forGridViewElement:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v25 = 0;
  objc_msgSend(v8, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = SKUIViewElementPaddingForStyle(v17, &v25);
  v20 = v19;

  if (v25)
  {
    bottom = v20;
    top = v18;
  }

  v21 = top;
  v22 = left;
  v23 = bottom;
  v24 = right;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)updateLayoutPropertiesForGridViewElement:(id)a3
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
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  NSArray *v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  unint64_t v27;
  int64_t numberOfColumns;
  unsigned int v29;
  uint64_t v30;
  NSArray *v31;
  SKUIGridViewElementPageSectionConfiguration *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  NSArray *positions;
  void *v42;
  void *v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[4];
  _QWORD v53[3];

  *(_QWORD *)((char *)&v53[1] + 4) = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activePageWidth");
  v15 = v14;
  self->_cellContentWidth = 0.0;
  objc_msgSend(v4, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGridViewElementPageSectionConfiguration setNumberOfColumns:](self, "setNumberOfColumns:", -[SKUIGridViewElementPageSectionConfiguration _numberOfColumnsForWidth:style:](self, "_numberOfColumnsForWidth:style:", v16, v15));

  v42 = v13;
  objc_msgSend(v13, "clientContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = SKUIUserInterfaceIdiom(v17);

  if (v18 == 1)
  {
    if (-[SKUIGridViewElementPageSectionConfiguration _isContainedWithinExploreTemplateWithGridViewElement:](self, "_isContainedWithinExploreTemplateWithGridViewElement:", v4))
    {
      v19 = 3;
    }
    else
    {
      v19 = 4;
    }
  }
  else
  {
    if (v15 < 414.0)
    {
      self->_cardVerticalSpacingStyle = 0;
      goto LABEL_15;
    }
    if (self->_numberOfColumns > 1)
      v19 = 2;
    else
      v19 = 1;
  }
  self->_cardVerticalSpacingStyle = v19;
LABEL_15:
  v20 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v4, "flattenedChildren");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  v43 = v4;
  if (v46)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = *(_QWORD *)v48;
    v44 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v48 != v25)
          objc_enumerationMutation(obj);
        v27 = v24 + i;
        numberOfColumns = self->_numberOfColumns;
        if (numberOfColumns == 1)
        {
          v29 = 5;
          v23 = v24 + i;
        }
        else
        {
          v30 = v24;
          v31 = v20;
          v32 = self;
          v33 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * i);
          if (os_variant_has_internal_content()
            && _os_feature_enabled_impl()
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            -[SKUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:].cold.1(v52, v53, v34);
          }
          v35 = objc_msgSend(v33, "elementType");

          self = v32;
          if (v35 == 48)
          {
            numberOfColumns = v32->_numberOfColumns;
            v22 = numberOfColumns - 1;
            v29 = 5;
            v23 = v27;
          }
          else
          {
            numberOfColumns = v32->_numberOfColumns;
            if (v22 == numberOfColumns - 1)
              v29 = 4;
            else
              v29 = 2;
            if (!v22)
            {
              v22 = 0;
              v23 = v27;
              v29 = 1;
            }
          }
          v20 = v31;
          v24 = v30;
          v25 = v44;
        }
        if (v21)
          v36 = v29;
        else
          v36 = v29 | 8;
        if (v22 < numberOfColumns - 1)
        {
          ++v22;
        }
        else
        {
          ++v21;
          v22 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v20, "addObject:", v37);

      }
      v24 += v46;
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v46);
  }
  else
  {
    v23 = 0;
  }

  for (; v23 < -[NSArray count](v20, "count"); ++v23)
  {
    -[NSArray objectAtIndex:](v20, "objectAtIndex:", v23);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39 | 0x20u);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray replaceObjectAtIndex:withObject:](v20, "replaceObjectAtIndex:withObject:", v23, v40);

  }
  positions = self->_positions;
  self->_positions = v20;

}

- (void)updateStylePropertiesForGridViewElement:(id)a3 gridItemViewElements:(id)a4 numberOfGridItems:(unint64_t)a5
{
  id v7;
  NSArray *v8;
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
  double v19;
  double v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  char v35;
  double gridViewElementStyleItemWidth;
  BOOL *p_gridIsEdgeToEdge;
  uint64_t v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  int64_t v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  NSArray *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  BOOL v63;
  void *v64;
  BOOL v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  NSArray *viewElements;
  void *v71;
  void *v72;
  int64_t v73;
  void *v74;
  float v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSArray *obj;
  uint64_t v80;
  id v81;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (NSArray *)a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIGridViewElementPageSectionConfiguration updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v21)
        -[SKUIGridViewElementPageSectionConfiguration updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
  if (objc_msgSend(v7, "elementType") == 45)
    v29 = objc_msgSend(v7, "showsEditMode");
  else
    v29 = 0;
  self->_showsEditMode = v29;
  objc_msgSend(v7, "style");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "itemWidth");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "floatValue");
  self->_gridViewElementStyleItemWidth = v34;
  v35 = objc_msgSend(v33, "hasSuffix:", CFSTR("%"));
  self->_gridViewElementStyleItemWidthIsPercentage = v35;
  if ((v35 & 1) != 0)
  {
    gridViewElementStyleItemWidth = self->_gridViewElementStyleItemWidth;
    self->_gridIsEdgeToEdge = gridViewElementStyleItemWidth == 100.0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
    if (gridViewElementStyleItemWidth == 100.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v38 = objc_claimAutoreleasedReturnValue();

      v40 = *MEMORY[0x1E0DC49E8];
      v39 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v41 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v42 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      v17 = (void *)v38;
      goto LABEL_17;
    }
  }
  else
  {
    self->_gridIsEdgeToEdge = 0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
  }
  v41 = 0.0;
  v42 = 15.0;
  v39 = 15.0;
  v40 = 0.0;
LABEL_17:
  v43 = 1.0 / v20;
  objc_msgSend(v30, "ikBorderColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "color");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = objc_retainAutorelease(v45);
    if (CGColorGetAlpha((CGColorRef)objc_msgSend(v46, "CGColor")) <= 0.00000011920929)
    {
      v81 = 0;
      v47 = 0;
      goto LABEL_37;
    }
    v81 = v46;

  }
  else
  {
    v81 = v17;
  }
  objc_msgSend(v30, "dividerType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("grid-full")) & 1) != 0)
  {
    v47 = 2;
  }
  else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("grid-top")) & 1) != 0)
  {
    v47 = 3;
  }
  else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("full")) & 1) != 0)
  {
    v47 = 4;
  }
  else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("grid-vertical")) & 1) != 0)
  {
    v47 = 6;
  }
  else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v47 = 0;
  }
  else if (*p_gridIsEdgeToEdge || (objc_msgSend(v17, "isEqualToString:", CFSTR("edge-to-edge")) & 1) != 0)
  {
    v47 = 7;
  }
  else
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = v8;
    v76 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    if (v76)
    {
      v77 = v76;
      v80 = *(_QWORD *)v84;
      v47 = 1;
LABEL_55:
      v78 = 0;
      while (1)
      {
        if (*(_QWORD *)v84 != v80)
          objc_enumerationMutation(obj);
        if (!SKUIIKViewElementTypeIsButton(objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v78), "elementType")))
          break;
        if (v77 == ++v78)
        {
          v77 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
          if (v77)
            goto LABEL_55;
          goto LABEL_61;
        }
      }
    }
    else
    {
LABEL_61:
      v47 = 4;
    }

  }
  objc_msgSend(v30, "valueForStyle:", *MEMORY[0x1E0D3A598]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v30, "borderWidths");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v43 = v55;
    goto LABEL_38;
  }
LABEL_37:
  v54 = v43;
  v52 = v43;
  v50 = v43;
LABEL_38:
  v56 = v8;

  objc_msgSend(v30, "valueForStyle:", *MEMORY[0x1E0D3A590]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v30, "borderMargins");
    v40 = v58;
    v39 = v59;
    v41 = v60;
    v42 = v61;
  }
  objc_msgSend(v30, "valueForStyle:", *MEMORY[0x1E0D3A5B0]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 1;
  if (!v62)
  {
    objc_msgSend(v30, "valueForStyle:", CFSTR("itml-padding"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v64 != 0;

  }
  if (v30)
    v65 = v63;
  else
    v65 = 0;
  self->_hasGridViewElementStyle = v65;
  objc_msgSend(v30, "elementPadding");
  self->_gridViewElementStyleElementPadding.top = v66;
  self->_gridViewElementStyleElementPadding.left = v67;
  self->_gridViewElementStyleElementPadding.bottom = v68;
  self->_gridViewElementStyleElementPadding.right = v69;
  self->_numberOfGridItems = a5;
  self->_separatorStyle = v47;
  objc_storeStrong((id *)&self->_separatorColor, v81);
  self->_separatorMargins.top = v40;
  self->_separatorMargins.left = v39;
  self->_separatorMargins.bottom = v41;
  self->_separatorMargins.right = v42;
  self->_separatorWidths.top = v50;
  self->_separatorWidths.left = v52;
  self->_separatorWidths.bottom = v54;
  self->_separatorWidths.right = v43;
  viewElements = self->_viewElements;
  self->_viewElements = v56;

  self->_cellContentWidth = 0.0;
  self->_cellPaddingNeedsReloading = 1;
  self->_cellPaddingLeftEdgeHorizontal = 0.0;
  self->_cellPaddingRightEdgeHorizontal = 0.0;
  self->_cellPaddingInteriorHorizontal = 0.0;
  objc_msgSend(v7, "style");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "lockupType");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
    v73 = SKUILockupViewTypeForString(v72);
  else
    v73 = -1;
  self->_lockupType = v73;
  objc_msgSend(v30, "itemHeight");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74 || (objc_msgSend(v30, "rowHeight"), (v74 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v74, "floatValue");
    self->_minimumCellHeight = v75;

  }
  else
  {
    self->_minimumCellHeight = 44.0;
  }

}

- (BOOL)viewElementIsStandardCard:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_msgSend(v3, "elementType") == 14 && objc_msgSend(v3, "cardType") != 3;

  return v12;
}

- (id)_cardArtworkBoundingSizeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__74;
  v14 = __Block_byref_object_dispose__74;
  v15 = 0;
  if (self->_numberOfColumns >= 2)
  {
    -[SKUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__SKUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke;
    v9[3] = &unk_1E73A7550;
    v9[6] = v6;
    v9[4] = self;
    v9[5] = &v10;
    -[SKUIGridViewElementPageSectionConfiguration _enumerateViewElementsForRowOfIndexPath:usingBlock:](self, "_enumerateViewElementsForRowOfIndexPath:usingBlock:", v4, v9);
    v5 = (void *)v11[5];
  }
  v7 = v5;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __84__SKUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  SKUISizeValue *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "viewElementIsStandardCard:"))
  {
    +[SKUICardViewElementCollectionViewCell artworkBoundingSizeWithViewElement:width:context:](SKUICardViewElementCollectionViewCell, "artworkBoundingSizeWithViewElement:width:context:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), *(double *)(a1 + 48));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "unionWithSize:", v3, v4);
    }
    else
    {
      v6 = -[SKUISizeValue initWithSize:]([SKUISizeValue alloc], "initWithSize:", v3, v4);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }

}

- (Class)_cardCellClassForCard:(id)a3
{
  objc_msgSend(a3, "cardType");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (double)_cellContentWidth
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double cellContentWidth;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  result = self->_cellContentWidth;
  if (result >= 0.00000011920929)
    return result;
  result = self->_gridViewElementStyleItemWidth;
  if (result <= 0.00000011920929)
  {
    -[SKUIGridViewElementPageSectionConfiguration columnContentWidth](self, "columnContentWidth");
    v8 = v7;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_viewElements;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v10)
      goto LABEL_36;
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "elementType", (_QWORD)v18);
        if (v15 == 66)
        {
          if (objc_msgSend(v14, "lockupViewType") == 7)
          {
            -[SKUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
LABEL_33:
            self->_cellContentWidth = v16;
            continue;
          }
          if (objc_msgSend(v14, "lockupViewType") == 2 && v8 <= 0.0)
          {
            +[SKUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:context:](SKUIHorizontalLockupCollectionViewCell, "preferredSizeForViewElement:context:", v14, self->_cellLayoutContext);
            -[SKUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
            cellContentWidth = self->_cellContentWidth;
LABEL_31:
            if (cellContentWidth >= v16)
              v16 = cellContentWidth;
            goto LABEL_33;
          }
LABEL_28:
          v16 = self->_cellContentWidth;
          if (v16 < v8)
            v16 = v8;
          goto LABEL_33;
        }
        if (v15 != 48)
        {
          if (v15 == 14
            && -[SKUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](self, "viewElementIsStandardCard:", v14))
          {
            +[SKUICardViewElementCollectionViewCell preferredSizeForViewElement:context:](SKUICardViewElementCollectionViewCell, "preferredSizeForViewElement:context:", v14, self->_cellLayoutContext);
            cellContentWidth = self->_cellContentWidth;
            if (v16 >= v8)
              v16 = v8;
            goto LABEL_31;
          }
          goto LABEL_28;
        }
        v16 = v8;
        if (self->_cellContentWidth < 0.00000011920929)
          goto LABEL_33;
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v16);
      if (!v11)
      {
LABEL_36:

        return self->_cellContentWidth;
      }
    }
  }
  if (self->_gridViewElementStyleItemWidthIsPercentage)
  {
    v4 = result / 100.0;
    v5 = 1.0;
    if (v4 <= 1.0)
    {
      v5 = v4;
      if (v4 < 0.00000011920929)
        v5 = 0.0;
    }
    -[SKUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
    result = v5 * v6;
  }
  self->_cellContentWidth = result;
  return result;
}

- (double)_cellHeightForViewElement:(id)a3 width:(double)a4
{
  id v6;
  objc_class *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  float v17;

  v6 = a3;
  v7 = -[SKUIGridViewElementPageSectionConfiguration cellClassForViewElement:](self, "cellClassForViewElement:", v6);
  if (v7)
  {
    -[objc_class sizeThatFitsWidth:viewElement:context:](v7, "sizeThatFitsWidth:viewElement:context:", v6, self->_cellLayoutContext, a4);
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }
  objc_msgSend(v6, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemHeight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "floatValue");
    v14 = v13;
  }
  else
  {
    objc_msgSend(v10, "rowHeight");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      v14 = v17;
    }
    else
    {
      v14 = 0.0;
    }

  }
  if (v9 < v14)
    v9 = v14;

  return v9;
}

- (UIEdgeInsets)_cellInsetsForViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  id v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  char v68;
  UIEdgeInsets result;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0DC49E8];
  v67 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(v6, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v12 = SKUIViewElementPaddingForStyle(v11, &v68);
  if (v68)
  {
    v16 = v8 + v12;
    v17 = v9 + v14;
    v18 = v67 + v13;
    v19 = v10 + v15;
    goto LABEL_18;
  }
  v19 = v10;
  v17 = v9;
  v18 = v67;
  v16 = v8;
  if (self->_hasGridViewElementStyle)
    goto LABEL_18;
  v20 = objc_msgSend(v6, "elementType", v12);
  if (v20 <= 47)
  {
    if ((unint64_t)(v20 - 12) >= 2)
    {
      if (v20 == 14
        && -[SKUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](self, "viewElementIsStandardCard:", v6))
      {
        v19 = v10;
        v17 = v9;
        v18 = v67;
        v16 = v8;
        switch(self->_cardVerticalSpacingStyle)
        {
          case 0:
          case 4:
            v17 = v9 + 30.0;
            v21 = 20.0;
            goto LABEL_16;
          case 1:
            v21 = 25.0;
            goto LABEL_15;
          case 2:
            v17 = v9 + 24.0;
            v21 = 33.0;
            goto LABEL_16;
          case 3:
            objc_msgSend(v6, "firstChildForElementType:", 66);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
              v17 = v9 + 20.0;
            else
              v17 = v9;
            if (v62)
              v16 = v8 + 30.0;
            else
              v16 = v8 + 25.0;
            goto LABEL_17;
          default:
            goto LABEL_18;
        }
        goto LABEL_18;
      }
      goto LABEL_14;
    }
LABEL_13:
    v17 = v9 + 12.0;
    v21 = 11.0;
    goto LABEL_16;
  }
  if (v20 == 48)
  {
    v17 = v9 + 10.0;
    v16 = v8 + 4.0;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
    v18 = v67 + v60;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
    v19 = v10 + v61;
    goto LABEL_18;
  }
  if (v20 == 141 || v20 == 50)
    goto LABEL_13;
LABEL_14:
  v21 = 10.0;
LABEL_15:
  v17 = v9 + v21;
LABEL_16:
  v16 = v8 + v21;
LABEL_17:
  v19 = v10;
  v18 = v67;
LABEL_18:
  v22 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v23)
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  v31 = objc_msgSend(v22, "elementType");

  if (v31 != 48)
  {
    v65 = v16;
    v66 = v17;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingInteriorHorizontal](self, "_cellPaddingInteriorHorizontal");
    v33 = v19 + v18 + v32 * 2.0;
    -[SKUIGridViewElementPageSectionConfiguration columnContentWidth](self, "columnContentWidth");
    v35 = v33 + v34;
    -[SKUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
    v37 = v35 <= v36;
    if (v35 <= v36)
      v38 = v19;
    else
      v38 = 0.0;
    if (v37)
      v39 = v18;
    else
      v39 = 0.0;
    -[SKUIGridViewElementPageSectionConfiguration _cellPaddingInteriorHorizontal](self, "_cellPaddingInteriorHorizontal");
    v41 = v40;
    v42 = -[SKUIGridViewElementPageSectionConfiguration positionForIndexPath:](self, "positionForIndexPath:", v7);
    if ((v42 & 1) != 0)
    {
      -[SKUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
      v45 = v44;
      v43 = v41;
    }
    else
    {
      if ((v42 & 4) != 0)
        -[SKUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
      else
        v43 = v41;
      v45 = v41;
    }
    v18 = v39 + v45;
    v19 = v38 + v43;
    if (objc_msgSend(v22, "elementType") == 66)
    {
      v63 = v9;
      v64 = v10;
      -[SKUIGridViewElementPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "largeScreenElementPadding");
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v54 = v53;

      if (v67 != v50 || v8 != v48 || v64 != v54 || v63 != v52)
      {
        v19 = v54;
        v65 = v48;
        v66 = v52;
        v18 = v50;
      }
      v55 = -0.0;
      if (self->_gridViewElementStyleItemWidthIsPercentage)
        v55 = v41;
      v17 = v66 + v55;
      v16 = v65 + v55;
    }
    else
    {
      v17 = v66;
    }
  }

  v56 = v16;
  v57 = v18;
  v58 = v17;
  v59 = v19;
  result.right = v59;
  result.bottom = v58;
  result.left = v57;
  result.top = v56;
  return result;
}

- (double)_cellPaddingInteriorHorizontal
{
  -[SKUIGridViewElementPageSectionConfiguration _reloadCellPaddingIfNeeded](self, "_reloadCellPaddingIfNeeded");
  return self->_cellPaddingInteriorHorizontal;
}

- (double)_cellPaddingLeftEdgeHorizontal
{
  -[SKUIGridViewElementPageSectionConfiguration _reloadCellPaddingIfNeeded](self, "_reloadCellPaddingIfNeeded");
  return self->_cellPaddingLeftEdgeHorizontal;
}

- (double)_cellPaddingRightEdgeHorizontal
{
  -[SKUIGridViewElementPageSectionConfiguration _reloadCellPaddingIfNeeded](self, "_reloadCellPaddingIfNeeded");
  return self->_cellPaddingRightEdgeHorizontal;
}

- (double)_columnContentWidthPaddingForWidth:(double)a3
{
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = -[SKUIGridViewElementPageSectionConfiguration _useOrdinalPadding](self, "_useOrdinalPadding");
  -[SKUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "horizontalPadding");
  v8 = a3 - v7;
  v9 = a3 + v7 * -2.0;
  if (v5)
    v10 = v8;
  else
    v10 = v9;

  return v10;
}

- (void)_enumerateViewElementsForRowOfIndexPath:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, _BYTE *);
  uint64_t v8;
  uint64_t v9;
  int64_t numberOfGridItems;
  void *v11;
  int64_t v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint8_t v20[4];
  _DWORD v21[7];

  *(_QWORD *)&v21[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  v8 = objc_msgSend(v6, "item") / self->_numberOfColumns * self->_numberOfColumns;
  v18 = v6;
  v9 = objc_msgSend(v6, "section");
  v19 = 0;
  numberOfGridItems = self->_numberOfGridItems;
  -[SKUIGridViewElementPageSectionConfiguration dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  do
  {
    if (v12 >= self->_numberOfColumns + v8 || v12 >= numberOfGridItems)
      break;
    v14 = (void *)MEMORY[0x1BCCE6C7C]();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gridViewElementPageSectionConfiguration:viewElementForIndexPath:", self, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (os_variant_has_internal_content()
        && _os_feature_enabled_impl()
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        -[SKUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:].cold.1(v20, v21, v17);
      }
      if (objc_msgSend(v16, "elementType") != 48)
        v7[2](v7, v16, v15, &v19);
    }

    objc_autoreleasePoolPop(v14);
    ++v12;
  }
  while (!v19);

}

- (BOOL)_isContainedWithinExploreTemplateWithGridViewElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      v6 = objc_msgSend(v5, "elementType");
      objc_msgSend(v5, "parent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v7;
      v8 = v6 == 37;
    }
    while (!v8 && v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_lockupCellReuseIdentifierWithLockup:(id)a3
{
  unint64_t v3;
  id v4;

  v3 = -[SKUIGridViewElementPageSectionConfiguration _lockupTypeForLockup:](self, "_lockupTypeForLockup:", a3);
  if (v3 <= 8)
    v4 = (id)*off_1E73A75E0[v3];
  return v4;
}

- (int64_t)_lockupTypeForLockup:(id)a3
{
  int64_t result;

  result = self->_lockupType;
  if (result == -1)
    return objc_msgSend(a3, "lockupViewType");
  return result;
}

- (UIEdgeInsets)_normalizedContentInsetForViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[4];
  id v31;
  SKUIGridViewElementPageSectionConfiguration *v32;
  uint64_t *v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  UIEdgeInsets result;

  v6 = a3;
  v7 = a4;
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x4010000000;
  v37 = &unk_1BBF15257;
  v38 = 0u;
  v39 = 0u;
  -[SKUIGridViewElementPageSectionConfiguration _cellInsetsForViewElement:indexPath:](self, "_cellInsetsForViewElement:indexPath:", v6, v7);
  *(_QWORD *)&v38 = v8;
  *((_QWORD *)&v38 + 1) = v9;
  *(_QWORD *)&v39 = v10;
  *((_QWORD *)&v39 + 1) = v11;
  v12 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v13)
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v21 = objc_msgSend(v12, "elementType");

  if (v21 != 48)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __95__SKUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke;
    v30[3] = &unk_1E73A7578;
    v31 = v12;
    v32 = self;
    v33 = &v34;
    -[SKUIGridViewElementPageSectionConfiguration _enumerateViewElementsForRowOfIndexPath:usingBlock:](self, "_enumerateViewElementsForRowOfIndexPath:usingBlock:", v7, v30);

  }
  v22 = v35[4];
  v23 = v35[5];
  v24 = v35[6];
  v25 = v35[7];
  _Block_object_dispose(&v34, 8);

  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

uint64_t __95__SKUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;

  if (*(_QWORD *)(result + 32) != a2)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 40), "_cellInsetsForViewElement:indexPath:", a2, a3);
    v6 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8);
    v7 = *(double *)(v6 + 48);
    if (v7 < v5)
      v7 = v5;
    *(double *)(v6 + 48) = v7;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8);
    if (*(double *)(v8 + 32) >= v4)
      v4 = *(double *)(v8 + 32);
    *(double *)(v8 + 32) = v4;
  }
  return result;
}

- (int64_t)_numberOfColumnsForWidth:(double)a3 style:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "columnCount");
    v9 = -[SKUIStorePageSectionContext layoutStyle](self->_pageSectionContext, "layoutStyle");
    if (v8 != -1)
    {
      if ((float)((float)v8 * 320.0) + 320.0 <= a3)
        ++v8;
      goto LABEL_18;
    }
  }
  else
  {
    v9 = -[SKUIStorePageSectionContext layoutStyle](self->_pageSectionContext, "layoutStyle");
  }
  v10 = (uint64_t)(a3 / 320.0);
  if (v10 <= 1)
    v10 = 1;
  if ((unint64_t)v10 >= 3)
    v10 = 3;
  v11 = 1;
  if (a3 >= 640.0)
    v11 = 2;
  if (v9 == 2)
    v10 = v11;
  if (v9 == 1)
    v8 = 1;
  else
    v8 = v10;
LABEL_18:

  return v8;
}

- (void)_reloadCellPaddingIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  CGFloat left;
  CGFloat right;
  float v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  int64_t numberOfColumns;
  float v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;

  if (self->_cellPaddingNeedsReloading)
  {
    -[SKUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
    if (v3 <= 0.0)
    {
      -[SKUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "horizontalPadding");
      v7 = v9 + v9;

    }
    else
    {
      -[SKUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
      v5 = v4;
      -[SKUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
      *(float *)&v6 = v5 - v6 * (double)self->_numberOfColumns;
      v7 = floorf(*(float *)&v6);
    }
    v10 = -[SKUIGridViewElementPageSectionConfiguration _useOrdinalPadding](self, "_useOrdinalPadding");
    v11 = v10;
    if (self->_numberOfColumns > 1)
    {
      if (self->_hasGridViewElementStyle)
      {
        left = self->_gridViewElementStyleElementPadding.left;
        right = self->_gridViewElementStyleElementPadding.right;
      }
      else
      {
        -[SKUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "horizontalPadding");
        left = v17;

        if (v11)
        {
          right = left;
          left = 0.0;
        }
        else
        {
          -[SKUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "horizontalPadding");
          right = v19;

        }
      }
      if (!self->_gridViewElementStyleItemWidthIsPercentage)
      {
        self->_cellPaddingLeftEdgeHorizontal = left;
        self->_cellPaddingRightEdgeHorizontal = right;
        numberOfColumns = self->_numberOfColumns;
        v22 = (v7 - left - right) / (double)(numberOfColumns - 1) * 0.5;
        v23 = floorf(v22);
        self->_cellPaddingInteriorHorizontal = v23;
        if (right < v23)
        {
          v24 = v7 / (float)((float)(numberOfColumns + 1) + (float)(numberOfColumns + 1));
          v25 = floorf(v24);
          v26 = v25 + v25;
          self->_cellPaddingRightEdgeHorizontal = v25 + v25;
          v27 = fmax(left - right, 0.0);
          if (v11)
            v26 = v27;
          self->_cellPaddingInteriorHorizontal = v25;
          self->_cellPaddingLeftEdgeHorizontal = v26;
        }
        goto LABEL_25;
      }
      self->_cellPaddingLeftEdgeHorizontal = 0.0;
      self->_cellPaddingRightEdgeHorizontal = 0.0;
      if (!self->_hasGridViewElementStyle)
      {
        self->_cellPaddingInteriorHorizontal = 0.0;
        goto LABEL_25;
      }
      v20 = self->_gridViewElementStyleElementPadding.left;
      if (v20 < self->_gridViewElementStyleElementPadding.right)
        v20 = self->_gridViewElementStyleElementPadding.right;
      v15 = v20 * 0.5;
    }
    else
    {
      if (v10)
      {
        self->_cellPaddingLeftEdgeHorizontal = 0.0;
        self->_cellPaddingRightEdgeHorizontal = v7;
        self->_cellPaddingInteriorHorizontal = v7;
LABEL_25:
        self->_cellPaddingNeedsReloading = 0;
        return;
      }
      v14 = v7 * 0.5;
      v15 = floorf(v14);
      self->_cellPaddingLeftEdgeHorizontal = v15;
      self->_cellPaddingRightEdgeHorizontal = v15;
    }
    self->_cellPaddingInteriorHorizontal = v15;
    goto LABEL_25;
  }
}

- (BOOL)_useOrdinalPadding
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[NSArray firstObject](self->_viewElements, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "elementType") == 48 && -[NSArray count](self->_viewElements, "count") >= 2)
  {
    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (objc_msgSend(v3, "elementType") == 66)
  {
    -[SKUIViewElementLayoutContext largeScreenElementPadding](self->_cellLayoutContext, "largeScreenElementPadding");
    if (*(double *)(MEMORY[0x1E0DC49E8] + 8) == v8
      && *MEMORY[0x1E0DC49E8] == v5
      && *(double *)(MEMORY[0x1E0DC49E8] + 24) == v7
      && *(double *)(MEMORY[0x1E0DC49E8] + 16) == v6)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__SKUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke;
      v14[3] = &unk_1E73A01D0;
      v14[4] = &v15;
      objc_msgSend(v3, "enumerateChildrenUsingBlock:", v14);
    }
  }
  v12 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __65__SKUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "elementType");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 80;
  *a3 = 1;
  return result;
}

- (SKUIViewElementLayoutContext)cellLayoutContext
{
  return self->_cellLayoutContext;
}

- (void)setCellLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayoutContext, a3);
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (SKUIStorePageSectionContext)pageSectionContext
{
  return self->_pageSectionContext;
}

- (void)setPageSectionContext:(id)a3
{
  objc_storeStrong((id *)&self->_pageSectionContext, a3);
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (BOOL)showsEditMode
{
  return self->_showsEditMode;
}

- (SKUIGridViewElementPageSectionConfigurationDataSource)dataSource
{
  return (SKUIGridViewElementPageSectionConfigurationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pageSectionContext, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_positions, 0);
}

- (void)columnContentWidth
{
  OUTLINED_FUNCTION_1();
}

- (void)columnWidth
{
  OUTLINED_FUNCTION_1();
}

- (void)setDataSource:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setNumberOfColumns:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)backgroundColorForViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)cellClassForViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)cellForViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)cellSizeForViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)cellSizeForViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)collectionViewWillApplyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)configureCell:(uint64_t)a3 forViewElement:(uint64_t)a4 indexPath:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)lockupCellClassWithLockup:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)positionForIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)registerReusableClassesForCollectionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadCellWithIndexPath:(uint64_t)a3 forViewElement:(uint64_t)a4 reason:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)requestCellLayoutForViewElement:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sectionContentInsetAdjustedFromValue:(uint64_t)a3 forGridViewElement:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)updateLayoutPropertiesForGridViewElement:(uint64_t)a3 .cold.1(uint8_t *a1, _QWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "SKUIGridViewElementIsFullWidth";
}

- (void)updateLayoutPropertiesForGridViewElement:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)updateStylePropertiesForGridViewElement:(uint64_t)a3 gridItemViewElements:(uint64_t)a4 numberOfGridItems:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)updateStylePropertiesForGridViewElement:(uint64_t)a3 gridItemViewElements:(uint64_t)a4 numberOfGridItems:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)viewElementIsStandardCard:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
