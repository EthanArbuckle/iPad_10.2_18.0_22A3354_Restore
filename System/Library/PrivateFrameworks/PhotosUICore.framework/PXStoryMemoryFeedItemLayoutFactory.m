@implementation PXStoryMemoryFeedItemLayoutFactory

- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7
{
  double height;
  double width;
  id v14;
  id v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PXStoryMemoryFeedItemExtendedTraitCollection *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PXStoryModel *v28;
  uint64_t v29;
  id v30;
  void *v31;
  __int128 v32;
  id v33;
  id v34;
  void *v35;
  PXStoryLayout *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  PXStoryMemoryFeedItemExtendedTraitCollection *v43;
  id *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  char v53;
  _OWORD v54[3];

  height = a6.height;
  width = a6.width;
  v14 = a4;
  v15 = a5;
  v16 = *(_OWORD *)&a3->item;
  v54[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v54[1] = v16;
  objc_msgSend(v14, "objectReferenceAtIndexPath:", v54);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedItemLayoutFactory.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference != nil"));

    v17 = 0;
  }
  PXStoryConfigurationForObjectReference(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLaunchType:", CFSTR("ForYou"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedItemLayoutFactory.m"), 63, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v44 = a7;
  v45 = v18;
  if (a3->item)
    v22 = 0;
  else
    v22 = objc_msgSend(v20, "wantsFullscreenFeedExperience");
  v23 = [PXStoryMemoryFeedItemExtendedTraitCollection alloc];
  objc_msgSend(v15, "specManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[PXStoryMemoryFeedItemExtendedTraitCollection initWithSpecManager:initialReferenceSize:isFullscreen:](v23, "initWithSpecManager:initialReferenceSize:isFullscreen:", v24, v22, width, height);

  v25 = (void *)objc_msgSend(v19, "copyWithAdditionalOptions:", 66);
  objc_msgSend(v15, "assetCollectionActionPerformerDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAssetCollectionActionPerformerDelegate:", v26);

  objc_msgSend(v15, "presentingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPresentingViewController:", v27);

  objc_msgSend(v25, "setContainerTapToRadarDiagnosticsProvider:", v15);
  v28 = -[PXStoryModel initWithConfiguration:extendedTraitCollection:]([PXStoryModel alloc], "initWithConfiguration:extendedTraitCollection:", v25, v43);
  v29 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke;
  v51[3] = &unk_1E5124FA8;
  v52 = v21;
  v53 = v22;
  v30 = v21;
  -[PXStoryModel performChanges:](v28, "performChanges:", v51);
  objc_msgSend(v15, "actionPerformer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v29;
  v46[1] = 3221225472;
  v46[2] = __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke_2;
  v46[3] = &unk_1E5124FD0;
  v32 = *(_OWORD *)&a3->item;
  v49 = *(_OWORD *)&a3->dataSourceIdentifier;
  v50 = v32;
  v47 = v31;
  v48 = v14;
  v33 = v14;
  v34 = v31;
  -[PXStoryModel thumbnailActionPerformer](v28, "thumbnailActionPerformer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPresentPlayerAction:", v46);

  v36 = -[PXStoryLayout initWithModel:]([PXStoryLayout alloc], "initWithModel:", v28);
  -[PXStoryModel resourcesDataSourceManager](v28, "resourcesDataSourceManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dataSource");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "keyAssetResource");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "px_storyResourceDisplayAsset");
  *v44 = (id)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (void)setItemLayout:(id)a3 shouldAutoplayContent:(BOOL)a4 videoTimeRange:(id *)a5
{
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  BOOL v13;

  objc_msgSend(a3, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_shouldAutoplayContent_videoTimeRange___block_invoke;
  v9[3] = &__block_descriptor_81_e31_v16__0___PXStoryMutableModel__8l;
  v13 = a4;
  v8 = *(_OWORD *)&a5->var0.var3;
  v10 = *(_OWORD *)&a5->var0.var0;
  v11 = v8;
  v12 = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v7, "performChanges:", v9);

}

- (void)setItemLayout:(id)a3 isTouched:(BOOL)a4
{
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  objc_msgSend(a3, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isTouched___block_invoke;
  v6[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
  v7 = a4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)setItemLayout:(id)a3 isHovered:(BOOL)a4
{
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  objc_msgSend(a3, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isHovered___block_invoke;
  v6[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
  v7 = a4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (BOOL)shouldReloadItemLayout:(id)a3 forChangedItemFromIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5 toIndexPath:(PXSimpleIndexPath *)a6 inDataSource:(id)a7
{
  id v11;
  __int128 v12;
  id v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  id v25;
  int v26;
  _BOOL4 v27;
  id v28;
  id v29;
  int v30;
  id v31;
  id v32;
  int v33;
  uint64_t v34;
  int v35;
  void *v36;
  int v37;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;

  v11 = a3;
  v12 = *(_OWORD *)&a4->item;
  v41 = *(_OWORD *)&a4->dataSourceIdentifier;
  v42 = v12;
  v13 = a7;
  objc_msgSend(a5, "objectAtIndexPath:", &v41);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a6->item;
  v41 = *(_OWORD *)&a6->dataSourceIdentifier;
  v42 = v15;
  objc_msgSend(v13, "objectAtIndexPath:", &v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v23 = 0;
    goto LABEL_36;
  }
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke(v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v20 = v18;
  v21 = v20;
  if (v19 == v20)
  {

  }
  else
  {
    if (!v19 || !v20)
    {

LABEL_16:
LABEL_30:
      v27 = 1;
      goto LABEL_31;
    }
    v22 = objc_msgSend(v19, "isContentEqualTo:", v20);
    if (!v22)
      v22 = objc_msgSend(v21, "isContentEqualTo:", v19);

    if (v22 != 2)
      goto LABEL_16;
  }
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_2(v14);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_2(v16);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v24 == v25)
  {

  }
  else
  {
    v26 = objc_msgSend(v24, "isEqualToString:", v25);

    if (!v26)
    {
      v27 = 1;
      goto LABEL_29;
    }
  }
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_3(v14);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_3(v16);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v40 = v28;
  if (v28 == v29)
  {

LABEL_22:
    v39 = v24;
    __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_4(v14);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_4(v16);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {

    }
    else
    {
      v33 = objc_msgSend(v31, "isEqualToString:", v32);

      if (!v33)
      {
        v27 = 1;
LABEL_27:

        v24 = v39;
        goto LABEL_28;
      }
    }
    v34 = __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_5(v14);
    v27 = v34 != __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_5(v16);
    goto LABEL_27;
  }
  v30 = objc_msgSend(v28, "isEqualToString:", v29);

  if (v30)
    goto LABEL_22;
  v27 = 1;
LABEL_28:

LABEL_29:
  if (v27)
    goto LABEL_30;
LABEL_31:
  v35 = objc_msgSend(v14, "isFavorite", v39);
  if (v35 != objc_msgSend(v16, "isFavorite"))
  {
    objc_msgSend(v11, "model");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v16, "isFavorite");
    if (v37 != objc_msgSend(v36, "currentAssetCollectionIsFavorite"))
      v27 = 1;

  }
  v23 = v27;
LABEL_36:

  return v23;
}

- (id)itemPlacementControllerForItemReference:(id)a3 itemLayout:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "itemPlacementControllerForItemReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)collectTapToRadarDiagnosticsForItemLayout:(id)a3 indexPath:(PXSimpleIndexPath *)a4 intoContainer:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = (objc_class *)MEMORY[0x1E0CB37A0];
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__PXStoryMemoryFeedItemLayoutFactory_collectTapToRadarDiagnosticsForItemLayout_indexPath_intoContainer___block_invoke;
  v13[3] = &unk_1E513FA78;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v9, "enumerateDescendantsLayoutsUsingBlock:", v13);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feed Item #%li"), a4->item);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttachmentWithText:name:", v12, v11);

}

- (int64_t)layoutKind
{
  return self->layoutKind;
}

- (void)setLayoutKind:(int64_t)a3
{
  self->layoutKind = a3;
}

void __104__PXStoryMemoryFeedItemLayoutFactory_collectTapToRadarDiagnosticsForItemLayout_indexPath_intoContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE9E4EE0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    +[PXStorySettings possibleFeedHUDTypes](PXStorySettings, "possibleFeedHUDTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "integerValue");
          objc_msgSend(v3, "diagnosticTextForHUDType:displaySize:", v9, 1920.0, 1080.0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = CFSTR("None");
            if ((unint64_t)(v9 - 1) <= 0x12)
              v11 = off_1E5136070[v9 - 1];
            v12 = *(void **)(a1 + 32);
            v13 = v11;
            objc_msgSend(v12, "appendFormat:", CFSTR("== %@ ==\n"), v13);

            objc_msgSend(*(id *)(a1 + 32), "appendString:", v10);
            objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
}

id __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "keyAssetFetchResult");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_2(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "assetCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_3(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "assetCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedSubtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *__127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_4(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  __CFString *v5;

  v1 = a1;
  objc_msgSend(v1, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v1, "assetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storyTitleCategory");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E5149688;
  }

  return v5;
}

uint64_t __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_5(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v1, "assetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "storyColorGradeKind");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isHovered___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsHovering:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isTouched___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsTouching:", *(unsigned __int8 *)(a1 + 32));
}

void __89__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_shouldAutoplayContent_videoTimeRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _OWORD v6[3];

  v3 = *(unsigned __int8 *)(a1 + 80);
  v4 = a2;
  objc_msgSend(v4, "setShouldAutoplayThumbnail:", v3);
  v5 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v5;
  v6[2] = *(_OWORD *)(a1 + 64);
  objc_msgSend(v4, "setThumbnailAutoplayTimeRange:", v6);

}

void __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setIsHUDVisible:", objc_msgSend(v3, "isFeedHUDVisible"));
  objc_msgSend(v5, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 32), "feedHUDType"));
  if (*(_BYTE *)(a1 + 40))
    v4 = 5;
  else
    v4 = 1;
  objc_msgSend(v5, "setThumbnailStyle:", v4);

}

uint64_t __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __int128 v3;
  _OWORD v5[2];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  return objc_msgSend(v2, "handlePrimaryActionOnItemAtIndexPath:inDataSource:", v5, v1);
}

@end
