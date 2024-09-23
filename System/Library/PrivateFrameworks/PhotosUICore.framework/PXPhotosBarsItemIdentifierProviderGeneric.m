@implementation PXPhotosBarsItemIdentifierProviderGeneric

+ (void)valuesForModel:(id)a3 title:(id *)a4 leadingIdentifiers:(id *)a5 trailingIdentifiers:(id *)a6 toolbarIdentifiers:(id *)a7 hasSharedLibraryOrPreview:(BOOL)a8
{
  id v10;
  void *v11;
  unint64_t v12;
  int v13;
  void *v14;
  char v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  char v26;
  unsigned __int8 v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  char v38;
  id v39;
  void *v40;
  id v41;
  __CFString **v42;
  id *v43;
  id *v44;
  id *v45;
  char v46;
  int v47;
  int v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  int v53;
  const __CFString *v54;
  uint64_t v55;
  BOOL v56;
  id v57;
  uint64_t v58;
  id v59;
  void (**v60)(void *, const __CFString *);
  id v61;
  void *v62;
  void (**v63)(_QWORD, _QWORD);
  uint64_t v64;
  __CFString **v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void (**v69)(void *, const __CFString *);
  char v70;
  void (**v71)(void *, const __CFString *);
  int v72;
  void (**v73)(void *, const __CFString *);
  int v74;
  void (**v75)(void *, const __CFString *);
  __CFString **v76;
  void (**v77)(void *, const __CFString *);
  __CFString **v78;
  void *v79;
  void (**v80)(_QWORD, _QWORD);
  void *v81;
  void *v82;
  int v83;
  int v84;
  char v85;
  uint64_t v86;
  int v87;
  int v88;
  uint64_t v89;
  int v90;
  char v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  unsigned int v97;
  id v98;
  id v100;
  uint64_t v101;
  int v102;
  int v103;
  void *v105;
  int v106;
  int v107;
  id v108;
  uint64_t v109;
  int v110;
  int v111;
  unsigned int v112;
  void (**v113)(void *, const __CFString *);
  id *v115;
  id *v116;
  _QWORD v117[4];
  id v118;
  _QWORD aBlock[4];
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  id v129[2];

  v10 = a3;
  objc_msgSend(v10, "currentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "allowedChromeItems");
  v13 = objc_msgSend(v10, "isInSelectMode");
  objc_msgSend(v10, "selectionSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAnyItemSelected");

  v16 = objc_msgSend(v10, "navBarStyle");
  v17 = objc_msgSend(v10, "allowsAddAction");
  v18 = 0;
  if (v17 && (v13 & 1) == 0 && (v15 & 1) == 0)
    v18 = objc_msgSend(v10, "allowsEmptyPlaceholderBehavior");
  v112 = v18;
  if (objc_msgSend(v10, "allowsShareAction"))
  {
    objc_msgSend(v10, "assetActionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v19, "supportsActionType:", CFSTR("PXAssetActionTypeShare"));

  }
  else
  {
    v87 = 0;
  }
  v92 = objc_msgSend(v10, "allowsTrashAction");
  v115 = a7;
  v97 = objc_msgSend(v10, "allowsSelectAllAction");
  if ((objc_msgSend(v10, "isInCompactMode") & 1) != 0 || !objc_msgSend(v10, "supportsAspectRatioToggle"))
    LODWORD(v89) = 0;
  else
    v89 = (v12 >> 13) & 1;
  v20 = objc_msgSend(v10, "wantsToolbarVisible");
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "enableNewActionMenu") & 1) != 0)
  {
    v22 = objc_msgSend(v10, "allowsActionMenuBehavior");

    if (v22)
    {
      objc_msgSend(v10, "currentLens");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "allowsActionMenu");

      if (v24)
      {
        v109 = (v12 >> 1) & 1;
        goto LABEL_18;
      }
    }
  }
  else
  {

  }
  LODWORD(v109) = 0;
LABEL_18:
  objc_msgSend(v10, "optionsController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = a5;
  v107 = v13;
  if (v25)
    v110 = !+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  else
    v110 = 0;

  v101 = v16;
  v96 = v20;
  if (v16)
    v26 = v20;
  else
    v26 = 0;
  v27 = objc_msgSend(v10, "wantsContentFilterIndicatorVisible");
  v28 = objc_msgSend(v10, "allowsDismissAction");
  v29 = objc_msgSend(v10, "allowsAddToLibraryAction");
  v94 = objc_msgSend(v10, "allowsContentSyndicationSaveAllAction");
  v30 = objc_msgSend(v10, "allowsInfoAction");
  v31 = objc_msgSend(v10, "allowsMultiSelectMenu");
  v95 = objc_msgSend(v10, "allowsReplyAction");
  v91 = objc_msgSend(v10, "allowsTapbackAction");
  if (objc_msgSend(v10, "wantsToolbarVisible") && (objc_msgSend(v10, "prefersActionsInToolbar") & 1) != 0)
  {
    v32 = 1;
  }
  else
  {
    v32 = objc_msgSend(v10, "shouldAlwaysRespectToolbarActionPlacementPreference");
    if (v32)
      v32 = objc_msgSend(v10, "prefersActionsInToolbar");
  }
  v103 = v32;
  v111 = v30;
  if ((v12 & 1) != 0)
    v33 = objc_msgSend(v10, "dismissAffordance");
  else
    v33 = 0;
  v34 = objc_msgSend(v10, "contentPrivacyState");
  v93 = objc_msgSend(v10, "allowsShareAllAction");
  v102 = v29;
  v106 = v28;
  v88 = v31;
  if (objc_msgSend(v10, "allowsShareAllAction"))
    v90 = objc_msgSend(v10, "wantsShareGridButtonVisible");
  else
    v90 = 0;
  objc_msgSend(v10, "specManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "spec");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "wantsToggleSidebarButton");

  v38 = objc_msgSend(v10, "wantsSelectModeCaptionInContextMenu");
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if ((v37 & 1) != 0)
    {
      v42 = &PXBarItemIdentifierToggleSidebar;
      v40 = v39;
      v44 = a6;
      v43 = v115;
      v45 = v116;
      goto LABEL_97;
    }
    v55 = v33;
    v56 = v33 == 1;
    v44 = a6;
    v43 = v115;
    v45 = v116;
    if (v56)
    {
      v42 = PXBarItemIdentifierDismiss;
    }
    else
    {
      if (v55 != 4)
      {
        if (v55 != 2)
        {
LABEL_98:
          v50 = 0;
          v49 = 0;
          goto LABEL_145;
        }
        v42 = PXBarItemIdentifierDismiss;
LABEL_97:
        objc_msgSend(v40, "addObject:", *v42);
        goto LABEL_98;
      }
      v42 = PXBarItemIdentifierExplicitBack;
    }
    v40 = v39;
    goto LABEL_97;
  }
  v46 = v38;
  v47 = v37;
  v48 = v27 & ((v12 & 0x1000) != 0);
  if (!objc_msgSend(v11, "containsAnyItems"))
  {
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v58 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4;
    aBlock[3] = &unk_1E51485B0;
    v59 = v57;
    v120 = v59;
    v60 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
    v117[0] = v58;
    v117[1] = 3221225472;
    v117[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_5;
    v117[3] = &unk_1E51485B0;
    v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v118 = v61;
    v62 = _Block_copy(v117);
    v63 = (void (**)(_QWORD, _QWORD))v62;
    v64 = v33;
    if (v47)
      (*((void (**)(void *, const __CFString *))v62 + 2))(v62, CFSTR("PXBarItemIdentifierToggleSidebar"));
    v45 = v116;
    if (v64 == 2)
      v60[2](v60, CFSTR("PXBarItemIdentifierDismiss"));
    if ((_DWORD)v109)
      v60[2](v60, CFSTR("PXBarItemIdentifierActionMenu"));
    if (v111)
      v60[2](v60, CFSTR("PXBarItemIdentifierInfo"));
    if (v112)
      v60[2](v60, CFSTR("PXBarItemIdentifierAdd"));
    if (v110)
      v60[2](v60, CFSTR("PXBarItemIdentifierCustomOptionsButton"));
    if (v48)
      v60[2](v60, CFSTR("PXBarItemIdentifierFilterIndicatorButton"));
    if (((v106 ^ 1 | v47) & 1) == 0)
      ((void (**)(_QWORD, const __CFString *))v63)[2](v63, CFSTR("PXBarItemIdentifierDismiss"));
    if (v64 == 1)
    {
      v65 = PXBarItemIdentifierDismiss;
    }
    else
    {
      if (v64 != 4)
      {
LABEL_101:
        if (objc_msgSend(v59, "count"))
          objc_msgSend(v59, "insertObject:atIndex:", CFSTR("PXBarItemIdentifierButtonEndSpacing"), 0);
        v39 = v61;
        v41 = v59;

        v50 = 0;
        goto LABEL_143;
      }
      v65 = PXBarItemIdentifierExplicitBack;
    }
    ((void (**)(_QWORD, __CFString *))v63)[2](v63, *v65);
    goto LABEL_101;
  }
  if (!v107)
  {
    v66 = v33;
    v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v68 = MEMORY[0x1E0C809B0];
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke;
    v125[3] = &unk_1E51485B0;
    v108 = v67;
    v126 = v108;
    v69 = (void (**)(void *, const __CFString *))_Block_copy(v125);
    v123[0] = v68;
    v123[1] = 3221225472;
    v123[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2;
    v123[3] = &unk_1E51485B0;
    v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v124 = v100;
    v105 = _Block_copy(v123);
    v121[0] = v68;
    v121[1] = 3221225472;
    v121[2] = __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3;
    v121[3] = &unk_1E51485B0;
    v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v122 = v98;
    v113 = (void (**)(void *, const __CFString *))_Block_copy(v121);
    if (v33 == 2)
      v70 = v47;
    else
      v70 = 1;
    if ((v70 & 1) == 0)
      v69[2](v69, CFSTR("PXBarItemIdentifierDismiss"));
    v45 = v116;
    if ((_DWORD)v109)
      v69[2](v69, CFSTR("PXBarItemIdentifierActionMenu"));
    if (v94)
    {
      if (v103)
        v71 = v113;
      else
        v71 = v69;
      v71[2](v71, CFSTR("PXBarItemIdentifierContentSyndicationSaveAll"));
    }
    if (objc_msgSend(v10, "wantsSelectButton"))
      v69[2](v69, CFSTR("PXBarItemIdentifierSelect"));
    v72 = v93 & v103;
    if (objc_msgSend(v10, "searchActionLocation") == 1)
      v69[2](v69, CFSTR("PXBarItemIdentifierSearch"));
    if ((v72 | v90) == 1)
    {
      if (v72)
        v73 = v113;
      else
        v73 = v69;
      v73[2](v73, CFSTR("PXBarItemIdentifierShare"));
    }
    if (v95)
    {
      v74 = v110;
      if ((v103 & 1) != 0)
      {
        v113[2](v113, CFSTR("PXBarItemIdentifierReply"));
        v75 = v113;
        if ((v91 & 1) == 0)
        {
LABEL_114:
          if (v111)
            v69[2](v69, CFSTR("PXBarItemIdentifierInfo"));
          if (v102)
          {
            if (v103)
              v77 = v113;
            else
              v77 = v69;
            v77[2](v77, CFSTR("PXBarItemIdentifierAddToLibrary"));
          }
          if ((_DWORD)v89)
          {
            v69[2](v69, CFSTR("PXBarItemIdentifierToggleAspectFit"));
            if (!v74)
            {
LABEL_123:
              if (!v48)
                goto LABEL_124;
              goto LABEL_128;
            }
          }
          else if (!v74)
          {
            goto LABEL_123;
          }
          v69[2](v69, CFSTR("PXBarItemIdentifierCustomOptionsButton"));
          if (!v48)
          {
LABEL_124:
            if ((v47 & 1) != 0)
            {
LABEL_125:
              v78 = &PXBarItemIdentifierToggleSidebar;
              v79 = v108;
              v80 = (void (**)(_QWORD, _QWORD))v105;
              v82 = v98;
              v81 = v100;
              goto LABEL_138;
            }
LABEL_129:
            v80 = (void (**)(_QWORD, _QWORD))v105;
            v82 = v98;
            if (v106)
              (*((void (**)(void *, const __CFString *))v105 + 2))(v105, CFSTR("PXBarItemIdentifierDismiss"));
            v79 = v108;
            if (v66 == 1)
            {
              v78 = PXBarItemIdentifierDismiss;
              v81 = v100;
            }
            else
            {
              v56 = v66 == 4;
              v81 = v100;
              if (!v56)
              {
LABEL_139:
                if (v101 && objc_msgSend(v79, "count"))
                  objc_msgSend(v79, "insertObject:atIndex:", CFSTR("PXBarItemIdentifierButtonEndSpacing"), 0);
                v41 = v79;
                v39 = v81;
                v50 = (void *)objc_msgSend(v82, "copy");

LABEL_143:
                v49 = 0;
LABEL_144:
                v44 = a6;
                v43 = v115;
                goto LABEL_145;
              }
              v78 = PXBarItemIdentifierExplicitBack;
            }
LABEL_138:
            ((void (**)(_QWORD, __CFString *))v80)[2](v80, *v78);
            goto LABEL_139;
          }
LABEL_128:
          v69[2](v69, CFSTR("PXBarItemIdentifierFilterIndicatorButton"));
          if ((v47 & 1) != 0)
            goto LABEL_125;
          goto LABEL_129;
        }
LABEL_113:
        v75[2](v75, CFSTR("PXBarItemIdentifierTapback"));
        goto LABEL_114;
      }
      v69[2](v69, CFSTR("PXBarItemIdentifierReply"));
      if ((v91 & 1) == 0)
        goto LABEL_114;
    }
    else
    {
      v74 = v110;
      if ((v91 & 1) == 0)
        goto LABEL_114;
      v75 = v113;
      if ((v103 & 1) != 0)
        goto LABEL_113;
    }
    v75 = v69;
    goto LABEL_113;
  }
  v129[0] = 0;
  v127 = (id)MEMORY[0x1E0C9AA60];
  v128 = (id)MEMORY[0x1E0C9AA60];
  BYTE2(v86) = v48;
  BYTE1(v86) = v26 ^ 1;
  LOBYTE(v86) = 0;
  objc_msgSend(a1, "_topBarValuesForSelectionModeWithModel:title:leadingIdentifiers:trailingIdentifiers:allowSelectAll:allowAdd:allowTrashActions:allowDeleteShareActions:allowFilterIndicator:", v10, v129, &v128, &v127, v97, v112, v86);
  v49 = v129[0];
  v39 = v128;
  v41 = v127;
  v50 = 0;
  v45 = v116;
  if (!v96)
    goto LABEL_185;
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = v51;
  if ((v87 | v92) == 1)
  {
    v53 = v87 ^ 1;
    if (v87)
      v54 = CFSTR("PXBarItemIdentifierShare");
    else
      v54 = CFSTR("PXBarItemIdentifierTrash");
    objc_msgSend(v51, "addObject:", v54);
  }
  else
  {
    v53 = 0;
  }
  if (!objc_msgSend(v10, "navBarStyle"))
  {
    if ((v112 & 1) != 0)
    {
      v76 = PXBarItemIdentifierAdd;
      v83 = v102;
    }
    else
    {
      v83 = v102;
      if ((objc_msgSend(v10, "allowsMergeDuplicatesAction") & 1) != 0)
      {
        v76 = PXBarItemIdentifierMergeDuplicates;
      }
      else if ((objc_msgSend(v10, "allowsMoveToLibraryAction") & 1) != 0)
      {
        v76 = PXBarItemIdentifierMoveToLibrary;
      }
      else if ((objc_msgSend(v10, "allowsMoveToPersonalLibraryAction") & 1) != 0)
      {
        v76 = PXBarItemIdentifierMoveToPersonalLibrary;
      }
      else
      {
        if (!objc_msgSend(v10, "allowsMoveToSharedLibraryAction"))
          goto LABEL_176;
        v76 = PXBarItemIdentifierMoveToSharedLibrary;
      }
    }
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierPlaceholder"));
    goto LABEL_175;
  }
  objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierPlaceholder"));
  if ((objc_msgSend(v10, "allowsMergeDuplicatesAction") & 1) != 0)
  {
    v76 = PXBarItemIdentifierMergeDuplicates;
LABEL_169:
    v83 = v102;
LABEL_175:
    objc_msgSend(v52, "addObject:", *v76);
    goto LABEL_176;
  }
  if ((objc_msgSend(v10, "allowsMoveToLibraryAction") & 1) != 0)
  {
    v76 = PXBarItemIdentifierMoveToLibrary;
    goto LABEL_169;
  }
  if ((objc_msgSend(v10, "allowsMoveToPersonalLibraryAction") & 1) != 0)
  {
    v76 = PXBarItemIdentifierMoveToPersonalLibrary;
    goto LABEL_169;
  }
  v84 = objc_msgSend(v10, "allowsMoveToSharedLibraryAction");
  if (v84)
    v76 = PXBarItemIdentifierMoveToSharedLibrary;
  else
    v76 = PXBarItemIdentifierSelectModeCaption;
  if ((v84 & 1) != 0)
    goto LABEL_169;
  v85 = v46 ^ 1;
  v83 = v102;
  if ((v85 & 1) != 0)
    goto LABEL_175;
LABEL_176:
  if ((v83 & v103) == 1)
  {
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierPlaceholder"));
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierAddToLibrary"));
  }
  if (objc_msgSend(v10, "allowsFileRadarAction"))
  {
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierPlaceholder"));
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierFileRadar"));
  }
  if (((v53 | v92 ^ 1) & 1) == 0)
  {
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierPlaceholder"));
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierTrash"));
  }
  if ((v88 & v107) != 0)
  {
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
    objc_msgSend(v52, "addObject:", CFSTR("PXBarItemIdentifierSelectModeMenu"));
  }
  v50 = (void *)objc_msgSend(v52, "copy");

LABEL_185:
  if (!a4)
    goto LABEL_144;
  v44 = a6;
  v43 = v115;
  if (v49)
  {
    v49 = objc_retainAutorelease(v49);
    *a4 = v49;
  }
LABEL_145:
  if (v45 && v39)
    *v45 = objc_retainAutorelease(v39);
  if (v44 && v41)
    *v44 = objc_retainAutorelease(v41);
  if (v43 && v50)
    *v43 = objc_retainAutorelease(v50);

}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count")
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("PXBarItemIdentifierInterButtonSpacing")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierPlaceholder"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __150__PXPhotosBarsItemIdentifierProviderGeneric_valuesForModel_title_leadingIdentifiers_trailingIdentifiers_toolbarIdentifiers_hasSharedLibraryOrPreview___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("PXBarItemIdentifierInterButtonSpacing"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
