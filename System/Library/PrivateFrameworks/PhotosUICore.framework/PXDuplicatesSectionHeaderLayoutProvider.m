@implementation PXDuplicatesSectionHeaderLayoutProvider

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;

  v5 = *(_OWORD *)&a4->item;
  v11 = *(_OWORD *)&a4->dataSourceIdentifier;
  v12 = v5;
  v6 = a3;
  objc_msgSend(v6, "assetCollectionAtSectionIndexPath:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "numberOfItemsInSection:", a4->section, v11, v12);

  PXDeduplicationLocalizedGroupTitle(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  void *v5;
  __int128 v6;
  _OWORD v8[2];
  objc_super v9;

  if (a3 == 3)
  {
    PXLocalizedStringFromTable(CFSTR("MERGE_DUPLICATES_SECTION_ACTION"), CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXDuplicatesSectionHeaderLayoutProvider;
    v6 = *(_OWORD *)&a5->item;
    v8[0] = *(_OWORD *)&a5->dataSourceIdentifier;
    v8[1] = v6;
    -[PXActionableSectionHeaderLayoutProvider actionTextForActionType:dataSource:sectionIndexPath:](&v9, sel_actionTextForActionType_dataSource_sectionIndexPath_, a3, a4, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  id v14;
  objc_super v15;

  if (a4 == 3)
  {
    v7 = a5;
    v8 = a3;
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.deduplicationFromAlbumSection"), MEMORY[0x1E0C9AA70]);
    -[PXActionableSectionHeaderLayoutProvider setSelectedState:forItemsInSectionHeaderLayout:](self, "setSelectedState:forItemsInSectionHeaderLayout:", 1, v8);
    -[PXActionableSectionHeaderLayoutProvider viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetActionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionPerformerForActionType:", CFSTR("PXAssetActionTypeMergeDuplicates"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setSender:", v7);
    objc_msgSend(v14, "performActionWithCompletionHandler:", 0);
    -[PXActionableSectionHeaderLayoutProvider setSelectedState:forItemsInSectionHeaderLayout:](self, "setSelectedState:forItemsInSectionHeaderLayout:", 0, v8);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PXDuplicatesSectionHeaderLayoutProvider;
    v12 = a5;
    v13 = a3;
    -[PXActionableSectionHeaderLayoutProvider sectionHeader:didPressButtonForActionType:sender:](&v15, sel_sectionHeader_didPressButtonForActionType_sender_, v13, a4, v12);

  }
}

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isInSelectMode"))
  {
    v7.receiver = self;
    v7.super_class = (Class)PXDuplicatesSectionHeaderLayoutProvider;
    v5 = -[PXActionableSectionHeaderLayoutProvider actionTypeForHeaderLayout:](&v7, sel_actionTypeForHeaderLayout_, v4);
  }
  else
  {
    v5 = 3;
  }

  return v5;
}

@end
