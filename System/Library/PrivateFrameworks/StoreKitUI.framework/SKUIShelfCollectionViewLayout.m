@implementation SKUIShelfCollectionViewLayout

+ (double)snapToBoundariesDecelerationRate
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIShelfCollectionViewLayout snapToBoundariesDecelerationRate].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0.8;
}

+ (BOOL)collectionViewCanClipToBounds
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIShelfCollectionViewLayout collectionViewCanClipToBounds].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

+ (Class)layoutAttributesClass
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIShelfCollectionViewLayout layoutAttributesClass].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)collectionViewContentSize
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
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIShelfCollectionViewLayout collectionViewContentSize].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIShelfLayoutData totalContentSize](self->_layoutData, "totalContentSize");
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int ShouldReverseLayoutDirection;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  SKUIShelfLayoutData *layoutData;
  uint64_t v36;
  SKUIShelfLayoutData *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t *v43;
  int64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  double v49;
  double v50;
  int64_t v51;
  id v52;
  _QWORD v53[10];
  _QWORD v54[4];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[11];
  char v62;
  _QWORD v63[3];
  double v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;

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
        -[SKUIShelfCollectionViewLayout layoutAttributesForElementsInRect:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfLayoutData contentInset](self->_layoutData, "contentInset");
  v17 = v16;
  v19 = v18;
  v50 = v20;
  v22 = v21;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v65 = 0;
  v66 = &v65;
  v67 = 0x3010000000;
  v69 = 0;
  v70 = 0;
  v68 = &unk_1BBF15257;
  -[SKUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
  v25 = v24;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 0.0;
  v26 = v19;
  if (ShouldReverseLayoutDirection)
  {
    v49 = v22;
    v27 = x;
    v28 = y;
    v29 = height;
    v30 = v25;
    -[SKUIShelfLayoutData totalContentSize](self->_layoutData, "totalContentSize", v19);
    v26 = v31 - v19;
    v25 = v30;
    height = v29;
    y = v28;
    x = v27;
    v22 = v49;
  }
  v32 = x + v19;
  v33 = y + v17;
  v34 = width - (v19 + v22);
  v64 = v26;
  layoutData = self->_layoutData;
  v36 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v61[3] = &unk_1E73A3FD0;
  v62 = ShouldReverseLayoutDirection ^ 1;
  *(double *)&v61[6] = v32;
  *(double *)&v61[7] = v33;
  *(double *)&v61[8] = v34;
  *(double *)&v61[9] = height - (v17 + v50);
  v61[4] = v63;
  v61[5] = &v65;
  v61[10] = v25;
  -[SKUIShelfLayoutData enumerateColumnsUsingBlock:](layoutData, "enumerateColumnsUsingBlock:", v61);
  v55 = 0;
  v56 = &v55;
  v57 = 0x3010000000;
  v59 = 0;
  v60 = 0;
  v58 = &unk_1BBF15257;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  *(double *)&v54[3] = v17;
  v37 = self->_layoutData;
  v53[0] = v36;
  v53[1] = 3221225472;
  v53[2] = __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v53[3] = &unk_1E73A3FF8;
  *(double *)&v53[6] = v32;
  *(double *)&v53[7] = v33;
  *(double *)&v53[8] = v34;
  *(double *)&v53[9] = height - (v17 + v50);
  v53[4] = v54;
  v53[5] = &v55;
  -[SKUIShelfLayoutData enumerateRowsUsingBlock:](v37, "enumerateRowsUsingBlock:", v53);
  -[SKUIShelfCollectionViewLayout collectionView](self, "collectionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v39 = 0;
  }
  v40 = objc_msgSend(v38, "numberOfItemsInSection:", 0);
  v51 = -[SKUIShelfLayoutData numberOfRows](self->_layoutData, "numberOfRows");
  v41 = v66;
  v42 = v66[4];
  if (v42 < v66[5] + v42)
  {
    v43 = v56;
    v44 = v42 * v51;
    do
    {
      v45 = v43[4];
      if (v45 < v43[5] + v45)
      {
        do
        {
          if ((uint64_t)(v44 + v45) < v40)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUIShelfCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v39, "collectionView:layout:willApplyLayoutAttributes:", v38, self, v47);
            objc_msgSend(v52, "addObject:", v47);

            v43 = v56;
          }
          ++v45;
        }
        while (v45 < v43[5] + v43[4]);
        v41 = v66;
      }
      ++v42;
      v44 += v51;
    }
    while (v42 < v41[5] + v41[4]);
  }

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(&v65, 8);
  return v52;
}

double __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
{
  double MaxX;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  uint64_t v17;
  double result;

  if (*(_BYTE *)(a1 + 88))
  {
    MaxX = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v9 = *(double *)(a1 + 48);
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 48));
    v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  if (MaxX <= v9)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2
                                                              - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 32)
                                                              + 1;
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 72);
  if (*(_BYTE *)(a1 + 88))
    v15 = v10 >= CGRectGetMaxX(*(CGRect *)&v11) - a4;
  else
    v15 = v10 <= CGRectGetMinX(*(CGRect *)&v11) + a4;
  *a3 = v15;
  v16 = *(double *)(a1 + 80) + a4;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(a1 + 88))
    v16 = -v16;
  result = *(double *)(v17 + 24) + v16;
  *(double *)(v17 + 24) = result;
  return result;
}

double __67__SKUIShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3, double a4)
{
  double v6;
  uint64_t v7;
  double result;

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= *(double *)(a1 + 56))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2
                                                              - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 32)
                                                              + 1;
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *a3 = v6 >= CGRectGetMaxY(*(CGRect *)(a1 + 48)) - a4;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v7 + 24) + a4;
  *(double *)(v7 + 24) = result;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
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
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t i;
  double v24;
  double v25;
  double v26;
  uint64_t j;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t k;
  double v33;
  double v34;
  double v35;
  double v36;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShelfCollectionViewLayout layoutAttributesForItemAtIndexPath:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfCollectionViewLayout collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v15);

  -[SKUIShelfLayoutData contentInset](self->_layoutData, "contentInset");
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(v4, "item");
  v21 = -[SKUIShelfLayoutData numberOfRows](self->_layoutData, "numberOfRows");
  v22 = v20 / v21;
  if ((storeShouldReverseLayoutDirection() & 1) != 0)
  {
    for (i = -[SKUIShelfLayoutData numberOfColumns](self->_layoutData, "numberOfColumns") - 1; i > v22; --i)
    {
      -[SKUIShelfLayoutData columnWidthForIndex:](self->_layoutData, "columnWidthForIndex:", i);
      v25 = v24;
      -[SKUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
      v19 = v19 + v25 + v26;
    }
  }
  else if (v22 >= 1)
  {
    for (j = 0; j != v22; ++j)
    {
      -[SKUIShelfLayoutData columnWidthForIndex:](self->_layoutData, "columnWidthForIndex:", j);
      v29 = v28;
      -[SKUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
      v19 = v19 + v29 + v30;
    }
  }
  v31 = v20 % v21;
  if (v31 >= 1)
  {
    for (k = 0; k != v31; ++k)
    {
      -[SKUIShelfLayoutData rowHeightForIndex:](self->_layoutData, "rowHeightForIndex:", k);
      v17 = v17 + v33;
    }
  }
  -[SKUIShelfLayoutData rowHeightForIndex:](self->_layoutData, "rowHeightForIndex:", v31);
  v35 = v34;
  -[SKUIShelfLayoutData columnWidthForIndex:](self->_layoutData, "columnWidthForIndex:", v22);
  objc_msgSend(v13, "setFrame:", v19, v17, v36, v35);

  return v13;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUIShelfLayoutData *layoutData;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[10];
  _QWORD v26[4];
  objc_super v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x3010000000;
  v32 = 0;
  v33 = 0;
  v31 = &unk_1BBF15257;
  v27.receiver = self;
  v27.super_class = (Class)SKUIShelfCollectionViewLayout;
  -[SKUIShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v27, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  v32 = v17;
  v33 = v18;
  -[SKUIShelfLayoutData columnSpacing](self->_layoutData, "columnSpacing");
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  layoutData = self->_layoutData;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__SKUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v25[3] = &unk_1E73A4020;
  v25[5] = &v28;
  v25[6] = v26;
  *(double *)&v25[7] = x;
  *(double *)&v25[8] = y;
  v25[9] = v20;
  v25[4] = self;
  -[SKUIShelfLayoutData enumerateColumnsUsingBlock:](layoutData, "enumerateColumnsUsingBlock:", v25);
  v21 = v29[4];
  v22 = v29[5];
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
  v23 = v21;
  v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

double __99__SKUIShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, double a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double result;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(double *)(v6 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(double *)(v8 + 24);
  v10 = v9 + a2;
  if (v7 > v9 && v7 < v10)
  {
    v13 = *(double *)(a1 + 56);
    if (v13 > 0.0 || v13 >= 0.0 && v7 - v9 >= a2 * 0.5)
      v9 = v10 + *(double *)(a1 + 72);
    *(double *)(v6 + 32) = v9;
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    objc_msgSend(v14, "contentSize");
    v17 = v16;
    objc_msgSend(v14, "bounds");
    v19 = v17 - v18;
    if (v15 < v17 - v18)
      v19 = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v19;
    *a4 = 1;

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(double *)(v8 + 24);
  }
  result = *(double *)(a1 + 72) + a2 + v9;
  *(double *)(v8 + 24) = result;
  return result;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 1;
}

- (SKUIShelfLayoutData)layoutData
{
  return self->_layoutData;
}

- (void)setLayoutData:(id)a3
{
  objc_storeStrong((id *)&self->_layoutData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutData, 0);
}

+ (void)snapToBoundariesDecelerationRate
{
  OUTLINED_FUNCTION_1();
}

+ (void)collectionViewCanClipToBounds
{
  OUTLINED_FUNCTION_1();
}

+ (void)layoutAttributesClass
{
  OUTLINED_FUNCTION_1();
}

- (void)collectionViewContentSize
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutAttributesForElementsInRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutAttributesForItemAtIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)targetContentOffsetForProposedContentOffset:(uint64_t)a3 withScrollingVelocity:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
