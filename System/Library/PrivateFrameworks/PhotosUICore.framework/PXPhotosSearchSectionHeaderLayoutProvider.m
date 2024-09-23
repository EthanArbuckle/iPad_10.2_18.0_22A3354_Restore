@implementation PXPhotosSearchSectionHeaderLayoutProvider

- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  id v5;
  __int128 v6;
  void *v7;
  void *v8;
  BOOL v9;
  _OWORD v11[2];

  v5 = a3;
  v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  objc_msgSend(v5, "assetCollectionAtSectionIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = objc_msgSend(v5, "numberOfItemsInSection:", a4->section) > 0;
  else
    v9 = 0;

  return v9;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v16[2];
  _OWORD v17[2];

  v6 = a3;
  v7 = v6;
  memset(v17, 0, sizeof(v17));
  if (v6)
  {
    objc_msgSend(v6, "lastSectionIndexPath");
    if ((*((_QWORD *)&v17[0] + 1) & 0x8000000000000000) != 0)
      goto LABEL_10;
  }
  while (1)
  {
    v16[0] = v17[0];
    v16[1] = v17[1];
    if (-[PXPhotosSearchSectionHeaderLayoutProvider wantsHeaderForDataSource:sectionIndexPath:](self, "wantsHeaderForDataSource:sectionIndexPath:", v7, v16))
    {
      break;
    }
    v8 = (*((_QWORD *)&v17[0] + 1))--;
    if (v8 <= 0)
      goto LABEL_10;
  }
  if (a4->dataSourceIdentifier == *(_QWORD *)&v17[0]
    && *(_OWORD *)&a4->section == *(_OWORD *)((char *)v17 + 8)
    && a4->subitem == *((_QWORD *)&v17[1] + 1))
  {
    v9 = objc_msgSend(v7, "numberOfItemsInSection:");
    v10 = (void *)MEMORY[0x1E0CB3940];
    PXLocalizedStringFromTable(CFSTR("%ld_SEARCH_ALL_RESULTS"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_10:
    v13 = *(_OWORD *)&a4->item;
    v17[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v17[1] = v13;
    objc_msgSend(v7, "assetCollectionAtSectionIndexPath:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)customBackgroundStyle
{
  return &unk_1E53ECB10;
}

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int64_t v12;
  void *v14;
  int64x2_t v15;
  int64x2_t v16;
  _OWORD v17[2];
  int64x2_t v18;
  int64x2_t v19;

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "lastSectionIndexPath");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }

  if (v18.i64[1] < 0)
    goto LABEL_12;
  while (1)
  {
    objc_msgSend(v4, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v18;
    v17[1] = v19;
    v8 = -[PXPhotosSearchSectionHeaderLayoutProvider wantsHeaderForDataSource:sectionIndexPath:](self, "wantsHeaderForDataSource:sectionIndexPath:", v7, v17);

    if (v8)
      break;
    v9 = v18.i64[1]--;
    if (v9 <= 0)
      goto LABEL_12;
  }
  if (v4)
  {
    objc_msgSend(v4, "sectionIndexPath");
    v10 = v15;
    v11 = v16;
  }
  else
  {
    v10 = 0uLL;
    v11 = 0uLL;
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v10, v18), (int32x4_t)vceqq_s64(v11, v19))), 0xFuLL))) & 1) != 0)
  {
    -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isInSelectMode"))
      v12 = 8;
    else
      v12 = 9;

  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

- (int64_t)actionVisibilityForHeaderLayout:(id)a3
{
  return 0;
}

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__PXPhotosSearchSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke;
  v9[3] = &unk_1E51437F8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performChanges:", v9);

}

void __94__PXPhotosSearchSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsInSelectMode:", objc_msgSend(v3, "isInSelectMode") ^ 1);
  objc_msgSend(v3, "attemptSetInSelectMode:", objc_msgSend(v3, "isInSelectMode") ^ 1);

}

@end
