@implementation PBFGalleryCollectionViewController

uint64_t __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", dbl_1CBB8E270[v2], 1.0);
}

id __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;

  v7 = a3;
  v8 = a4;
  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "sectionTypeForSectionWithIdentifier:", v12);
  objc_msgSend(v11, "previewForPreviewUniqueIdentifier:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == 2)
  {
    v15 = CFSTR("kGalleryPosterCellWithDescriptionReuseIdentifier");
    goto LABEL_12;
  }
  objc_msgSend(v14, "type");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = PBFPreviewTypeSmartAlbum;

  if (v16 == v17)
  {
    v15 = CFSTR("kGalleryPosterSmartAlbumCellReuseIdentifier");
    goto LABEL_12;
  }
  objc_msgSend(v14, "type");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = PBFPreviewTypeHero;

  if (v18 == v19)
  {
    v15 = CFSTR("kGalleryPosterHeroCellReuseIdentifier");
    goto LABEL_12;
  }
  objc_msgSend(v14, "subtitleComplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

LABEL_11:
    v15 = CFSTR("kGalleryPosterCellWithComplicationsReuseIdentifier");
    goto LABEL_12;
  }
  objc_msgSend(v14, "suggestedComplications");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {

    goto LABEL_11;
  }
  objc_msgSend(v14, "suggestedLandscapeComplications");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
    v15 = CFSTR("kGalleryPosterCellWithComplicationsReuseIdentifier");
  else
    v15 = CFSTR("kGalleryPosterCellReuseIdentifier");
LABEL_12:
  objc_msgSend(WeakRetained[128], "updatePosterPreview:isVisible:", v14, 1);
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "configureCell:forCollectionView:posterPreview:indexPath:", v22, v9, v14, v7);

  return v22;
}

id __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(CFSTR("KGalleryHeaderElementKind"), "isEqual:", v8))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sectionIdentifierForIndex:", objc_msgSend(v9, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, CFSTR("KGalleryHeaderElementKind"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedTitleForSectionWithIdentifier:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedSubtitleForSectionWithIdentifier:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v14);
    objc_msgSend(v13, "setSubtitle:", v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __72___PBFGalleryCollectionViewController__updateAssetHelperActiveContexts___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[PBFGenericDisplayContext genericDisplayContextWithDisplayContext:](PBFGenericDisplayContext, "genericDisplayContextWithDisplayContext:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayContextWithUpdatedInterfaceOrientation:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToDisplayContext:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "appendDisplayContext:", v7);
  objc_msgSend(v7, "displayContextWithUpdatedUserInterfaceStyle:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToDisplayContext:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "appendDisplayContext:", v5);
  objc_msgSend(v7, "displayContextWithUpdatedUserInterfaceStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToDisplayContext:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "appendDisplayContext:", v6);

}

uint64_t __90___PBFGalleryCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "_updateAssetHelperActiveContexts:", 1);
  objc_msgSend(a1[5], "invalidateLayout");
  return objc_msgSend(a1[6], "reloadData");
}

PBFApplicationStateComponent *__50___PBFGalleryCollectionViewController__resetState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  PBFApplicationStateComponent *v4;
  void *v5;
  PBFApplicationStateComponent *v6;

  objc_msgSend(a2, "posterDescriptorLookupInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterDescriptorPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PBFApplicationStateComponent alloc];
  objc_msgSend(v3, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBFApplicationStateComponent initWithServerIdentity:](v4, "initWithServerIdentity:", v5);

  return v6;
}

id __80___PBFGalleryCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1048);
  objc_msgSend(*(id *)(v2 + 1008), "itemIdentifierForIndexPath:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewForPreviewUniqueIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __92___PBFGalleryCollectionViewController_collectionView_cancelPrefetchingForItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1048);
  objc_msgSend(*(id *)(v2 + 1008), "itemIdentifierForIndexPath:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewForPreviewUniqueIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
