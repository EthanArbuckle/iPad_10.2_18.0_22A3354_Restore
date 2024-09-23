@implementation PXPhotosBarsItemIdentifierProviderRecentlyDeleted

+ (void)valuesForModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 toolbarIdentifiers:(id *)a7 hasSharedLibraryOrPreview:(BOOL)a8
{
  _BOOL4 v8;
  id v10;
  int v11;
  int v12;
  char v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id *v22;
  id *v23;
  id *v24;
  __CFString **v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD);
  __CFString **v38;
  id v39;
  uint64_t v40;
  id v41;
  void (**v42)(void *, const __CFString *);
  id v43;
  void *v44;
  BOOL v45;
  void (**v46)(_QWORD, _QWORD);
  __CFString **v47;
  uint64_t v48;
  void *v53;
  _QWORD v54[5];
  _QWORD aBlock[5];
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[5];
  _QWORD v66[6];

  v8 = a8;
  v66[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "currentDataSource");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isInSelectMode");
  v12 = objc_msgSend(v10, "wantsToolbarVisible");
  v13 = objc_msgSend(v10, "wantsContentFilterIndicatorVisible");
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "enableNewActionMenu"))
    v15 = objc_msgSend(v10, "allowsActionMenuBehavior");
  else
    v15 = 0;

  if ((objc_msgSend(v10, "isInCompactMode") & 1) != 0)
    v16 = 0;
  else
    v16 = objc_msgSend(v10, "supportsAspectRatioToggle");
  v17 = objc_msgSend(v10, "allowsMultiSelectMenu");
  v18 = objc_msgSend(v10, "dismissAffordance");
  if (objc_msgSend(v10, "contentPrivacyState"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18 == 1)
    {
      v25 = PXBarItemIdentifierDismiss;
      v20 = v19;
      v23 = a6;
      v22 = a7;
      v24 = a5;
    }
    else
    {
      v23 = a6;
      v22 = a7;
      v24 = a5;
      if (v18 == 4)
      {
        v25 = PXBarItemIdentifierExplicitBack;
        v20 = v19;
      }
      else
      {
        if (v18 != 2)
        {
LABEL_28:
          v27 = 0;
          v28 = 0;
          goto LABEL_54;
        }
        v25 = PXBarItemIdentifierDismiss;
      }
    }
    objc_msgSend(v20, "addObject:", *v25);
    goto LABEL_28;
  }
  if (!objc_msgSend(v53, "containsAnyItems"))
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3;
    aBlock[3] = &unk_1E51485B0;
    aBlock[4] = v32;
    v35 = _Block_copy(aBlock);
    v54[0] = v34;
    v54[1] = 3221225472;
    v54[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4;
    v54[3] = &unk_1E51485B0;
    v54[4] = v33;
    v36 = _Block_copy(v54);
    v37 = (void (**)(_QWORD, _QWORD))v36;
    if (v18 == 2)
      (*((void (**)(void *, const __CFString *))v36 + 2))(v36, CFSTR("PXBarItemIdentifierDismiss"));
    if ((v8 & v15) == 1)
      ((void (**)(_QWORD, const __CFString *))v37)[2](v37, CFSTR("PXBarItemIdentifierActionMenu"));
    if (v18 == 1)
    {
      v38 = PXBarItemIdentifierDismiss;
    }
    else
    {
      if (v18 != 4)
      {
LABEL_43:
        v21 = v33;
        v19 = v32;

        v27 = 0;
        v28 = 0;
LABEL_44:
        v23 = a6;
        v22 = a7;
LABEL_53:
        v24 = a5;
        goto LABEL_54;
      }
      v38 = PXBarItemIdentifierExplicitBack;
    }
    (*((void (**)(void *, __CFString *))v35 + 2))(v35, *v38);
    goto LABEL_43;
  }
  if (!v11)
  {
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke;
    v58[3] = &unk_1E51485B0;
    v41 = v39;
    v59 = v41;
    v42 = (void (**)(void *, const __CFString *))_Block_copy(v58);
    v56[0] = v40;
    v56[1] = 3221225472;
    v56[2] = __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2;
    v56[3] = &unk_1E51485B0;
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v57 = v43;
    v44 = _Block_copy(v56);
    if (v18 == 2)
      v42[2](v42, CFSTR("PXBarItemIdentifierDismiss"));
    if (v15)
      v42[2](v42, CFSTR("PXBarItemIdentifierActionMenu"));
    if (objc_msgSend(v10, "wantsSelectButton"))
      v42[2](v42, CFSTR("PXBarItemIdentifierSelect"));
    if (v16)
      v42[2](v42, CFSTR("PXBarItemIdentifierToggleAspectFit"));
    if (v18 == 1)
    {
      v47 = PXBarItemIdentifierDismiss;
      v23 = a6;
      v22 = a7;
      v46 = (void (**)(_QWORD, _QWORD))v44;
    }
    else
    {
      v45 = v18 == 4;
      v23 = a6;
      v22 = a7;
      v46 = (void (**)(_QWORD, _QWORD))v44;
      if (!v45)
        goto LABEL_47;
      v47 = PXBarItemIdentifierExplicitBack;
    }
    ((void (**)(_QWORD, __CFString *))v46)[2](v46, *v47);
LABEL_47:
    if (objc_msgSend(v41, "count"))
      objc_msgSend(v41, "insertObject:atIndex:", CFSTR("PXBarItemIdentifierButtonEndSpacing"), 0);
    if (v12)
    {
      v63[0] = CFSTR("PXBarItemIdentifierDelete");
      v63[1] = CFSTR("PXBarItemIdentifierPlaceholder");
      v63[2] = CFSTR("PXBarItemIdentifierRecover");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    v21 = v41;
    v19 = v43;

    v27 = 0;
    goto LABEL_53;
  }
  v62 = 0;
  v60 = (id)MEMORY[0x1E0C9AA60];
  v61 = (id)MEMORY[0x1E0C9AA60];
  v26 = v12 ^ 1;
  BYTE2(v48) = v13;
  LOWORD(v48) = v12 ^ 1;
  objc_msgSend(a1, "_topBarValuesForSelectionModeWithModel:title:leadingIdentifiers:trailingIdentifiers:allowSelectAll:allowAdd:allowTrashActions:allowDeleteShareActions:allowFilterIndicator:", v10, &v62, &v61, &v60, 0, 0, v48);
  v27 = v62;
  v19 = v61;
  v21 = v60;
  v28 = 0;
  if ((v26 & 1) == 0)
  {
    if (objc_msgSend(v10, "navBarStyle"))
    {
      if ((v17 & v11) != 0)
      {
        v66[0] = CFSTR("PXBarItemIdentifierPlaceholder");
        v66[1] = CFSTR("PXBarItemIdentifierSelectModeCaption");
        v66[2] = CFSTR("PXBarItemIdentifierPlaceholder");
        v66[3] = CFSTR("PXBarItemIdentifierSelectModeMenu");
        v29 = (void *)MEMORY[0x1E0C99D20];
        v30 = v66;
        v31 = 4;
      }
      else
      {
        v65[0] = CFSTR("PXBarItemIdentifierDelete");
        v65[1] = CFSTR("PXBarItemIdentifierPlaceholder");
        v65[2] = CFSTR("PXBarItemIdentifierSelectModeCaption");
        v65[3] = CFSTR("PXBarItemIdentifierPlaceholder");
        v65[4] = CFSTR("PXBarItemIdentifierRestore");
        v29 = (void *)MEMORY[0x1E0C99D20];
        v30 = v65;
        v31 = 5;
      }
    }
    else
    {
      v64[0] = CFSTR("PXBarItemIdentifierDelete");
      v64[1] = CFSTR("PXBarItemIdentifierPlaceholder");
      v64[2] = CFSTR("PXBarItemIdentifierRestore");
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v64;
      v31 = 3;
    }
    objc_msgSend(v29, "arrayWithObjects:count:", v30, v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!a4)
    goto LABEL_44;
  v23 = a6;
  v22 = a7;
  v24 = a5;
  if (v27)
  {
    v27 = objc_retainAutorelease(v27);
    *a4 = v27;
  }
LABEL_54:
  if (v24 && v19)
    *v24 = objc_retainAutorelease(v19);
  if (v23 && v21)
    *v23 = objc_retainAutorelease(v21);
  if (v22 && v28)
    *v22 = objc_retainAutorelease(v28);

}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __158__PXPhotosBarsItemIdentifierProviderRecentlyDeleted_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
