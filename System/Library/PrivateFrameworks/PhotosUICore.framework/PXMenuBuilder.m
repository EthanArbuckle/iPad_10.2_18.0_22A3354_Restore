@implementation PXMenuBuilder

- (void)addActionsMenuDurationSectionWithStoryViewModel:(id)a3
{
  id v4;
  PXMenuBuilder *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = self;
  sub_1A70CE8AC(v4, (uint64_t)&v9);
  if (v10)
  {
    sub_1A689E454(&v9, (uint64_t)v11);
    v6 = v12;
    v7 = v13;
    v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    sub_1A6AAAA54((uint64_t)v8, 0, 0, v6, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  }
  else
  {
    sub_1A70CE9F8((uint64_t)&v9);
  }

}

+ (id)defaultStoryActionsMenuWithViewModel:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD aBlock[4];
  id v43;

  v3 = a3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useCommonActionInfrastructureForActionMenu");

  if (v5)
  {
    objc_msgSend(v3, "makeDefaultActionsMenu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewLayoutSpec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    v9 = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke;
    aBlock[3] = &unk_1E5126268;
    v10 = v3;
    v43 = v10;
    v40[0] = v9;
    v11 = v9;
    v40[1] = 3221225472;
    v40[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_3;
    v40[3] = &unk_1E5126290;
    v12 = _Block_copy(aBlock);
    v41 = v12;
    v13 = _Block_copy(v40);
    objc_msgSend(v10, "mainModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recipeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_4;
    v32[3] = &unk_1E5126358;
    v16 = v10;
    v33 = v16;
    v34 = v14;
    v35 = v8;
    v36 = v15;
    v37 = v7;
    v38 = v13;
    v39 = v12;
    v26 = v12;
    v27 = v7;
    v17 = v15;
    v18 = v8;
    v19 = v14;
    v20 = v13;
    +[PXMenuBuilder menuWithDeferredConfiguration:](PXMenuBuilder, "menuWithDeferredConfiguration:", v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_9;
    v30[3] = &unk_1E5149198;
    v23 = v16;
    v31 = v23;
    objc_msgSend(v21, "onOpen:", v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_11;
    v28[3] = &unk_1E5149198;
    v29 = v23;
    objc_msgSend(v24, "onClose:", v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)defaultStoryThumbnailActionsMenuWithModel:(id)a3 isFavorite:(BOOL)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  SEL v23;
  id v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;

  v7 = a3;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke;
  aBlock[3] = &unk_1E51263C0;
  v9 = v7;
  v29 = v9;
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_3;
  v26[3] = &unk_1E5126290;
  v10 = _Block_copy(aBlock);
  v27 = v10;
  v11 = _Block_copy(v26);
  objc_msgSend(v9, "layoutSpec");
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_4;
  v18[3] = &unk_1E5126460;
  v25 = a4;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  v23 = a2;
  v24 = a1;
  v21 = v11;
  v22 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  v15 = v19;
  +[PXMenuBuilder menuWithDeferredConfiguration:](PXMenuBuilder, "menuWithDeferredConfiguration:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_2;
  aBlock[3] = &unk_1E5144A98;
  v6 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = a2;
  v11 = v6;
  v7 = v5;
  v8 = _Block_copy(aBlock);

  return v8;
}

uint64_t __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;

  v6 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_5;
  v15[3] = &unk_1E51263E8;
  v16 = *(id *)(a1 + 32);
  v18 = *(_BYTE *)(a1 + 80);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v6, "addSectionWithConfiguration:", v15);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_6;
  v9[3] = &unk_1E5126410;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v14 = *(_OWORD *)(a1 + 64);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v6, "addSectionWithConfiguration:", v9);
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowInternalUI");

  if (v5)
  {
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_8;
    v7[3] = &unk_1E5126438;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v6, "addSectionWithConfiguration:", v7);

  }
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "thumbnailMenuIncludesFavoriteAction"))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionMenuItemUnavorite"), CFSTR("PhotosUICore"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("heart.slash");
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionMenuItemFavorite"), CFSTR("PhotosUICore"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("heart");
    }
    objc_msgSend(v8, "addItemWithTitle:systemImageName:handler:", v3, v5, v4);

  }
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionMenuItemChangeTitle"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItemWithTitle:systemImageName:handler:", v6, CFSTR("pencil"), v7);

}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "thumbnailMenuIncludesFeatureLessAction"))
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionMenuItemFeatureLess"), CFSTR("PhotosUICore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentAssetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_blockableFeatureActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actionType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addItemWithTitle:systemImageName:handler:", v3, CFSTR("memories.badge.minus"), v9);

    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_7;
      v13[3] = &unk_1E5126308;
      v14 = v5;
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v12, "addItemWithTitle:systemImageName:submenuConfiguration:", v3, CFSTR("memories.badge.minus"), v13);

      v6 = v14;
    }

  }
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionMenuItemDelete"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addItemWithTitle:systemImageName:options:handler:", v10, CFSTR("trash"), 1, v11);

}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemWithTitle:systemImageName:handler:", CFSTR("File Radar"), CFSTR("ant"), v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemWithTitle:systemImageName:handler:", CFSTR("Visual Diagnostics"), CFSTR("eye"), v7);

}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "localizedTitle", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v9, "actionType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 6, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addItemWithTitle:systemImageName:handler:", v10, 0, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailActionPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXMenuBuilder(PXStoryViewModel) defaultStoryThumbnailActionsMenuWithModel:isFavorite:]_block_invoke_2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXMenuBuilder+PXStoryViewModel.m"), 157, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v5 = 1;
      goto LABEL_5;
    case 2:
      v5 = 0;
LABEL_5:
      objc_msgSend(v3, "setFavorite:completionHandler:", v5, 0);
      break;
    case 3:
      objc_msgSend(v3, "presentShareSheet");
      break;
    case 4:
      objc_msgSend(v3, "presentTitleEditor");
      break;
    case 5:
      objc_msgSend(v3, "deleteMemory");
      break;
    case 6:
      objc_msgSend(v3, "featureLess:", *(_QWORD *)(a1 + 40));
      break;
    case 7:
      objc_msgSend(v3, "fileRadar");
      break;
    case 8:
      objc_msgSend(v3, "showVisualDiagnostics");
      break;
    default:
      break;
  }

}

id __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD aBlock[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_2;
  aBlock[3] = &unk_1E51449E0;
  v8 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = a3;
  v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_4(id *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_5;
  v11[3] = &unk_1E51262B8;
  v12 = a1[4];
  v16 = a1[9];
  v13 = a1[5];
  v14 = a1[6];
  v15 = a1[7];
  objc_msgSend(v6, "addSectionWithConfiguration:", v11);
  objc_msgSend(v6, "addActionsMenuDurationSectionWithStoryViewModel:", a1[4]);
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowInternalUI");

  if (v5)
  {
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_6;
    v7[3] = &unk_1E5126330;
    v8 = a1[4];
    v9 = a1[8];
    v10 = a1[10];
    objc_msgSend(v6, "addItemWithTitle:systemImageName:submenuConfiguration:", CFSTR("Internal"), CFSTR("applelogo"), v7);

  }
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_102029);
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_200);
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActionMenuOpen:", 0);
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActionMenuOpen:", 1);
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canToggleSelectMode"))
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemSelect"), CFSTR("PhotosUICore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addItemWithTitle:systemImageName:handler:", v3, CFSTR("checkmark.circle"), v4);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "currentAssetCollectionIsFavorite"))
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemRemoveFromFavorites"), CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("heart.slash");
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemAddToFavorites"), CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("heart");
  }
  objc_msgSend(v40, "addItemWithTitle:systemImageName:handler:", v5, v7, v6);

  if ((objc_msgSend(*(id *)(a1 + 32), "allowedChromeItems") & 0x10000000) != 0)
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemEditMovieTimeline"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "canShowManagePhotosAction"))
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemManagePhotos"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_10:
    v9();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addItemWithTitle:systemImageName:handler:", v8, CFSTR("photo.on.rectangle.angled"), v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "desiredPlayState")
    || !objc_msgSend(*(id *)(a1 + 40), "currentChapterTitleIsVisible"))
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemChangeTitle"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemEditChapterTitle"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v12();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addItemWithTitle:systemImageName:handler:", v11, CFSTR("pencil"), v13);

  if (objc_msgSend(*(id *)(a1 + 32), "viewMode") == 1 && !objc_msgSend(*(id *)(a1 + 32), "desiredPlayState"))
  {
    objc_msgSend(*(id *)(a1 + 40), "visibleDisplayAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "visibleDisplayAssets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "recipe");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "keyAsset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17;
      v21 = v19;
      if (v20 == v21)
      {

      }
      else
      {
        v22 = v21;
        if (v20 && v21)
        {
          v23 = objc_msgSend(v20, "isContentEqualTo:", v21);
          if (!v23)
            v23 = objc_msgSend(v22, "isContentEqualTo:", v20);

          if (v23 == 2)
            goto LABEL_29;
        }
        else
        {

        }
        PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemMakeKeyPhoto"), CFSTR("PhotosUICore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addItemWithTitle:systemImageName:handler:", v16, CFSTR("person.crop.rectangle.stack"), v20);
      }

LABEL_29:
      PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemHideFromMemory"), CFSTR("PhotosUICore"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addItemWithTitle:systemImageName:handler:", v24, CFSTR("minus.circle"), v25);

    }
  }
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemAirPlay"), CFSTR("PhotosUICore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addItemWithTitle:systemImageName:handler:", v26, CFSTR("airplayvideo"), v27);

  v28 = objc_msgSend(*(id *)(a1 + 32), "shouldAutoReplayPreference");
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemReplay"), CFSTR("PhotosUICore"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addItemWithTitle:systemImageName:state:options:handler:", v29, CFSTR("repeat"), v28, 0, v30);

  objc_msgSend(*(id *)(a1 + 32), "viewEnvironmentModel");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(*(id *)(a1 + 32), "viewEnvironmentModel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "supportsTogglingDimming");

    if (v34)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewEnvironmentModel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isDimmed");

      v37 = v36;
      PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionMenuItemDim"), CFSTR("PhotosUICore"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addItemWithTitle:systemImageName:state:options:handler:", v38, CFSTR("circle.lefthalf.dotted.inset.half.filled.inverse"), v37, 0, v39);

    }
  }

}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_6(id *a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  objc_msgSend(a1[4], "addInternalActionsTo:");
  if (objc_msgSend(a1[5], "isHUDEnabled"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_7;
    v4[3] = &unk_1E5126308;
    v5 = a1[4];
    v6 = a1[6];
    objc_msgSend(v3, "addItemWithTitle:systemImageName:submenuConfiguration:", CFSTR("HUD"), CFSTR("gauge"), v4);

  }
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(void *, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isHUDVisible"))
    v4 = objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDType");
  else
    v4 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_8;
  aBlock[3] = &unk_1E51262E0;
  v19 = v4;
  v5 = v3;
  v17 = v5;
  v18 = *(id *)(a1 + 40);
  v6 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v6[2](v6, 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[PXStorySettings possibleDefaultHUDTypes](PXStorySettings, "possibleDefaultHUDTypes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v6[2](v6, objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "integerValue"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_8(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  _BOOL8 v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;

  v4 = a1[6];
  v5 = (void *)a1[4];
  v6 = a2 - 1;
  if ((unint64_t)(a2 - 1) >= 0x13)
  {
    v12 = CFSTR("None");
    v8 = CFSTR("None");
    v7 = CFSTR("eye.slash");
  }
  else
  {
    v12 = off_1E5136070[v6];
    v7 = off_1E5136108[v6];
  }
  v9 = v4 == a2;
  v10 = v7;
  (*(void (**)(void))(a1[5] + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemWithTitle:systemImageName:state:options:handler:", v12, v10, v9, 0, v11);

}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "actionPerformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performActionForChromeActionMenuItem:withValue:sender:", a1[5], a1[6], v4);

}

- (PXMenuBuilder)init
{
  PXMenuBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *menuItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXMenuBuilder;
  v2 = -[PXMenuBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    menuItems = v2->_menuItems;
    v2->_menuItems = v3;

  }
  return v2;
}

- (void)addSectionWithConfiguration:(id)a3
{
  void (**v4)(id, PXMenuBuilder *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXMenuBuilder *v9;

  v4 = (void (**)(id, PXMenuBuilder *))a3;
  v9 = objc_alloc_init(PXMenuBuilder);
  v4[2](v4, v9);

  v5 = (void *)MEMORY[0x1E0DC39D0];
  -[PXMenuBuilder menuItems](v9, "menuItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMenuBuilder _addMenuItem:](self, "_addMenuItem:", v8);

}

- (void)addSectionWithMenu:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(a3, "children");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMenuBuilder _addMenuItem:](self, "_addMenuItem:", v5);

}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 handler:(id)a5
{
  -[PXMenuBuilder addItemWithTitle:systemImageName:options:handler:](self, "addItemWithTitle:systemImageName:options:handler:", a3, a4, 0, a5);
}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
  -[PXMenuBuilder addItemWithTitle:systemImageName:state:options:handler:](self, "addItemWithTitle:systemImageName:state:options:handler:", a3, a4, 0, a5, a6);
}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 state:(int64_t)a5 options:(unint64_t)a6 handler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  _QWORD v24[4];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a7;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_systemImageNamed:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)MEMORY[0x1E0DC3428];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__PXMenuBuilder_addItemWithTitle_systemImageName_state_options_handler___block_invoke;
  v24[3] = &unk_1E513A608;
  v15 = v12;
  v25 = v15;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v10, v13, 0, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "hasPreview");
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_Shared"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v10, "isEqualToString:", v20);

  if (v19 && v21)
    PXSharedLibraryUpdateActionTitleForPreview(v16);
  objc_msgSend(v16, "setAttributes:", (2 * (a6 & 1)) | (a6 >> 2) & 1);
  if ((unint64_t)a5 <= 2)
    objc_msgSend(v16, "setState:");
  -[PXMenuBuilder _addMenuItem:](self, "_addMenuItem:", v16);

}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 submenuConfiguration:(id)a5
{
  void (**v8)(id, PXMenuBuilder *);
  PXMenuBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = (void (**)(id, PXMenuBuilder *))a5;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", a4);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_alloc_init(PXMenuBuilder);
  v8[2](v8, v9);
  v10 = (void *)MEMORY[0x1E0DC39D0];
  -[PXMenuBuilder menuItems](v9, "menuItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuWithTitle:image:identifier:options:children:", v13, a4, 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMenuBuilder _addMenuItem:](self, "_addMenuItem:", v12);

}

- (void)_addMenuItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXMenuBuilder menuItems](self, "menuItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)menuItems
{
  return self->_menuItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItems, 0);
}

void __72__PXMenuBuilder_addItemWithTitle_systemImageName_state_options_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "sender");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

+ (id)menuWithDeferredConfiguration:(id)a3
{
  return +[PXMenuBuilder menuWithTitle:deferredConfiguration:](PXMenuBuilder, "menuWithTitle:deferredConfiguration:", 0, a3);
}

+ (id)menuWithTitle:(id)a3 deferredConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DC39D0];
  v7 = (void *)MEMORY[0x1E0DC36F8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__PXMenuBuilder_menuWithTitle_deferredConfiguration___block_invoke;
  v14[3] = &unk_1E512B1A0;
  v15 = v5;
  v8 = v5;
  v9 = a3;
  objc_msgSend(v7, "elementWithProvider:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuWithTitle:children:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_menuWithConfiguration:(id)a3
{
  void (**v3)(id, PXMenuBuilder *);
  PXMenuBuilder *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void (**)(id, PXMenuBuilder *))a3;
  v4 = objc_alloc_init(PXMenuBuilder);
  v3[2](v3, v4);

  v5 = (void *)MEMORY[0x1E0DC39D0];
  -[PXMenuBuilder menuItems](v4, "menuItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithChildren:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __53__PXMenuBuilder_menuWithTitle_deferredConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  PXMenuBuilder *v6;

  v3 = a2;
  v6 = objc_alloc_init(PXMenuBuilder);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  -[PXMenuBuilder menuItems](v6, "menuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v3[2](v3, v5);

}

@end
