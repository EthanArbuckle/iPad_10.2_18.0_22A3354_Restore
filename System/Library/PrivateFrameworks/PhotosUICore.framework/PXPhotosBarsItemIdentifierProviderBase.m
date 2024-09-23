@implementation PXPhotosBarsItemIdentifierProviderBase

+ (void)_topBarValuesForSelectionModeWithModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 allowSelectAll:(BOOL)a7 allowAdd:(BOOL)a8 allowTrashActions:(BOOL)a9 allowDeleteShareActions:(BOOL)a10 allowFilterIndicator:(BOOL)a11
{
  _BOOL4 v11;
  id v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  id v21;
  id v22;
  void (**v23)(void *, const __CFString *);
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const __CFString *v38;
  uint64_t v39;
  _BOOL4 v40;
  _QWORD aBlock[4];
  id v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  _QWORD v48[2];
  _QWORD v49[2];

  v40 = a8;
  v11 = a7;
  v49[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if ((objc_msgSend(v13, "allowsMoveToLibraryAction") & 1) != 0
    || (objc_msgSend(v13, "allowsMoveToPersonalLibraryAction") & 1) != 0
    || objc_msgSend(v13, "allowsMoveToSharedLibraryAction"))
  {
    *a4 = 0;
  }
  else
  {
    objc_msgSend(v13, "selectionManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "assetTypeCounter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "typedCount");
    PXLocalizedSelectModeCaption(1, v35, v36);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v37;

  }
  v14 = objc_msgSend(v13, "isInCompactMode");
  objc_msgSend(v13, "selectionSnapshot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "areAllItemsSelected");

  v17 = objc_msgSend(v13, "allowsAddToLibraryAction");
  v18 = objc_msgSend(v13, "allowsInfoAction");
  if (objc_msgSend(v13, "wantsToolbarVisible") && (objc_msgSend(v13, "prefersActionsInToolbar") & 1) != 0)
  {
    v19 = 1;
  }
  else if (objc_msgSend(v13, "shouldAlwaysRespectToolbarActionPlacementPreference"))
  {
    v19 = objc_msgSend(v13, "prefersActionsInToolbar");
  }
  else
  {
    v19 = 0;
  }
  v20 = objc_msgSend(v13, "allowsTapbackAction");
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __213__PXPhotosBarsItemIdentifierProviderBase__topBarValuesForSelectionModeWithModel_title_leadingIdentifiers_trailingIdentifiers_allowSelectAll_allowAdd_allowTrashActions_allowDeleteShareActions_allowFilterIndicator___block_invoke;
  aBlock[3] = &unk_1E51485B0;
  v22 = v21;
  v44 = v22;
  v23 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  if (objc_msgSend(v13, "canExitSelectMode"))
    v23[2](v23, CFSTR("PXBarItemIdentifierCancel"));
  if (((v20 ^ 1 | v19) & 1) == 0)
    v23[2](v23, CFSTR("PXBarItemIdentifierTapback"));
  if (((v17 ^ 1 | v19) & 1) == 0)
    v23[2](v23, CFSTR("PXBarItemIdentifierAddToLibrary"));
  if (v18)
    v23[2](v23, CFSTR("PXBarItemIdentifierInfo"));
  if (!v14)
  {
    if (a9)
    {
      v48[0] = CFSTR("PXBarItemIdentifierDelete");
      v48[1] = CFSTR("PXBarItemIdentifierRestore");
      v26 = (void *)MEMORY[0x1E0C99D20];
      v27 = (const __CFString **)v48;
      v28 = 2;
      goto LABEL_46;
    }
    if (a10)
    {
      v47 = CFSTR("PXBarItemIdentifierShare");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "allowsTrashAction"))
      {
        objc_msgSend(v25, "arrayByAddingObject:", CFSTR("PXBarItemIdentifierTrash"));
        v30 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v30;
      }
      if (!v40)
      {
        if (v11)
          goto LABEL_47;
        goto LABEL_36;
      }
      objc_msgSend(v25, "arrayByAddingObject:", CFSTR("PXBarItemIdentifierAdd"));
      v39 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v39;
      if (!v11)
        goto LABEL_36;
    }
    else
    {
      if (v40)
      {
        v46 = CFSTR("PXBarItemIdentifierAdd");
        v26 = (void *)MEMORY[0x1E0C99D20];
        v27 = &v46;
        v28 = 1;
LABEL_46:
        objc_msgSend(v26, "arrayWithObjects:count:", v27, v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_47;
LABEL_36:
        if (!a11)
          goto LABEL_38;
        goto LABEL_37;
      }
      v25 = (void *)MEMORY[0x1E0C9AA60];
      if (!v11)
        goto LABEL_36;
    }
LABEL_47:
    if (v16)
      v38 = CFSTR("PXBarItemIdentifierDeselectAll");
    else
      v38 = CFSTR("PXBarItemIdentifierSelectAll");
    v23[2](v23, v38);
    if (!a11)
      goto LABEL_38;
LABEL_37:
    v23[2](v23, CFSTR("PXBarItemIdentifierFilterIndicatorButton"));
    goto LABEL_38;
  }
  if (v11)
  {
    v24 = CFSTR("PXBarItemIdentifierSelectAll");
    if (v16)
      v24 = CFSTR("PXBarItemIdentifierDeselectAll");
    v49[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (v40)
  {
    objc_msgSend(v25, "arrayByAddingObject:", CFSTR("PXBarItemIdentifierAdd"));
    v29 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v29;
  }
  if (a11)
    goto LABEL_37;
LABEL_38:
  if (!objc_msgSend(v25, "count"))
  {
    v45 = CFSTR("PXBarItemIdentifierPlaceholder");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v31 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v31;
  }
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v22, "insertObject:atIndex:", CFSTR("PXBarItemIdentifierButtonEndSpacing"), 0);
  v32 = objc_retainAutorelease(v25);
  *a5 = v32;
  *a6 = (id)objc_msgSend(v22, "copy");

}

void __213__PXPhotosBarsItemIdentifierProviderBase__topBarValuesForSelectionModeWithModel_title_leadingIdentifiers_trailingIdentifiers_allowSelectAll_allowAdd_allowTrashActions_allowDeleteShareActions_allowFilterIndicator___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
