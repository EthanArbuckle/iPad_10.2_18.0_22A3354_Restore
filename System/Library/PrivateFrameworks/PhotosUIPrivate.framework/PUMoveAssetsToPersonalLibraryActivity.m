@implementation PUMoveAssetsToPersonalLibraryActivity

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  objc_super v12;

  v6 = a4;
  objc_storeStrong((id *)&self->_presenterViewController, a3);
  v9 = a3;
  v10 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PUMoveAssetsToPersonalLibraryActivity;
  LOBYTE(v6) = -[PXActivity _presentActivityOnViewController:animated:completion:](&v12, sel__presentActivityOnViewController_animated_completion_, v9, v6, v10);

  return v6;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BDA0];
}

- (id)activityTitle
{
  return (id)PXLocalizedSharedLibraryString();
}

- (id)_systemImageName
{
  return CFSTR("person");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPreparingIndividualItems");

  if (!v5)
    return 0;
  -[PXActivity itemSourceController](self, "itemSourceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = PXSharedLibraryCanMoveAssetsToPersonalLibrary();
  return (char)v6;
}

- (id)_multiContributorConfirmationAlertControllerForAssets:(id)a3 contributorName:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMoveAssetsToPersonalLibraryActivity.m"), 67, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assets"), v36, v38);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMoveAssetsToPersonalLibraryActivity.m"), 67, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assets"), v36);
  }

LABEL_3:
  objc_msgSend(v12, "fetchedObjects");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "count");
  v15 = &stru_1E58AD278;
  if (v14 > 1)
    v15 = CFSTR("S");
  v16 = v15;
  v17 = objc_msgSend(v10, "length");
  v18 = objc_msgSend(v12, "count");
  v40 = (void *)v13;
  if (v17)
  {
    v47 = 0;
    v48[0] = 0;
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0D7B718], "assetTypeCountsForAssets:photosCount:videosCount:othersCount:", v13, v48, &v47, &v46);
    if (v48[0] == v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Photo%@"), v16);
    }
    else if (v47 == v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Video%@"), v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Item%@"), v16);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v10;
    PXLocalizedStringWithValidatedFormat();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v47 = 0;
    v48[0] = 0;
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0D7B718], "assetTypeCountsForAssets:photosCount:videosCount:othersCount:", v13, v48, &v47, &v46);
    if (v48[0] == v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Photo%@"), v16);
    }
    else if (v47 == v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Video%@"), v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Item%@"), v16);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v21, 0, v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedSharedLibraryString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke;
  v43[3] = &unk_1E58A3B68;
  v44 = v12;
  v26 = v11;
  v45 = v26;
  v27 = v12;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v28);

  v29 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v25;
  v41[1] = 3221225472;
  v41[2] = __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke_165;
  v41[3] = &unk_1E58AB6C0;
  v42 = v26;
  v31 = v26;
  objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 1, v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v32);

  return v22;
}

- (void)performActivity
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  PUMoveAssetsToPersonalLibraryActivity *v32;
  id v33;
  SEL v34;
  _QWORD aBlock[6];

  -[PXActivity itemSourceController](self, "itemSourceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMoveAssetsToPersonalLibraryActivity.m"), 123, CFSTR("Expecting non-empty, non-zero assets in %@"), v23);

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke;
  aBlock[3] = &unk_1E58AB060;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_3;
  v30[3] = &unk_1E58A7F38;
  v8 = v5;
  v31 = v8;
  v32 = self;
  v34 = a2;
  v9 = v7;
  v33 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(v30);
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hasPreview");
  if (PXSharedLibraryShouldDisplayMoveToPersonalLibraryConfirmation())
  {
    objc_msgSend(v8, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    PXSharedLibraryGetMoveToPersonalLibraryConfirmationTitleAndMessage();
    v24 = 0;

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v24, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3448];
    -[PUMoveAssetsToPersonalLibraryActivity activityTitle](self, "activityTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_188;
    v27[3] = &unk_1E58AB6C0;
    v28 = v10;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v18);

    v19 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2_189;
    v25[3] = &unk_1E58AB6C0;
    v26 = v9;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v21);

    -[UIViewController px_presentOverTopmostPresentedViewController:animated:completion:](self->_presenterViewController, "px_presentOverTopmostPresentedViewController:animated:completion:", v15, 1, 0);
  }
  else
  {
    v10[2](v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterViewController, 0);
}

void __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 1);
  }
  else
  {
    PXLocalizedSharedLibraryString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2;
    v9[3] = &unk_1E58A8DE8;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "px_presentOverTopmostPresentedViewController:animated:completion:", v5, 1, 0);
  }
}

void __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *i;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  objc_class *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 40), "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != v2)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v29;
      _os_log_error_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Number of original assets changed in %@!", buf, 0xCu);

    }
  }
  PXSharedLibraryFetchAssetsContributedByMeFromAssets();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 != objc_msgSend(v7, "count"))
  {
    PXLocalizedSharedLibraryString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedSharedLibraryString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_184;
    v42[3] = &unk_1E58A3B68;
    v43 = v7;
    v44 = *(id *)(a1 + 48);
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v42);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v19);

    v20 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_185;
    v40[3] = &unk_1E58AB6C0;
    v41 = *(id *)(a1 + 48);
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v22);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "px_presentOverTopmostPresentedViewController:animated:completion:", v10, 1, 0);
    v11 = v43;
    goto LABEL_28;
  }
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1 + 56);
    v32 = *(_QWORD *)(a1 + 40);
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("PUMoveAssetsToPersonalLibraryActivity.m"), 148, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("myAssets.firstObject"), v34);
LABEL_31:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1 + 56);
    v36 = *(_QWORD *)(a1 + 40);
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v35, v36, CFSTR("PUMoveAssetsToPersonalLibraryActivity.m"), 148, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("myAssets.firstObject"), v34, v38);

    goto LABEL_31;
  }
LABEL_8:
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD17A8], "fetchContributorsForAssets:options:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v11, "fetchedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v14, "count") < 3)
  {
    if (objc_msgSend(v14, "count") == 2)
    {
      v48 = 0u;
      v46 = 0u;
      v47 = 0u;
      v45 = 0u;
      v23 = v14;
      v24 = (void *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v24)
      {
        v39 = v8;
        v25 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v23);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "isCurrentUser") & 1) == 0)
            {
              PXSharedLibraryShortNameForParticipant();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
          }
          v24 = (void *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v24)
            continue;
          break;
        }
LABEL_25:
        v8 = v39;
      }

      objc_msgSend(*(id *)(a1 + 40), "_multiContributorConfirmationAlertControllerForAssets:contributorName:completion:", v7, v24, *(_QWORD *)(a1 + 48));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "px_presentOverTopmostPresentedViewController:animated:completion:", v28, 1, 0);

    }
    else
    {
      PLUIGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_INFO, "Attempting to move all selected assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", buf, 2u);
      }

      PXSharedLibraryMoveAssetsToPersonalLibrary();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_multiContributorConfirmationAlertControllerForAssets:contributorName:completion:", v7, 0, *(_QWORD *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "px_presentOverTopmostPresentedViewController:animated:completion:", v15, 1, 0);

  }
LABEL_28:

}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_188(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToPersonalLibrary();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2_189(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_184()
{
  NSObject *v0;
  uint8_t v2[16];

  PLUIGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AAB61000, v0, OS_LOG_TYPE_INFO, "Attempting to move only user's assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", v2, 2u);
  }

  return PXSharedLibraryMoveAssetsToPersonalLibrary();
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_185(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_INFO, "Move to Personal Library canceled.", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __56__PUMoveAssetsToPersonalLibraryActivity_performActivity__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
}

uint64_t __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  PLUIGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AAB61000, v0, OS_LOG_TYPE_INFO, "Attempting to move assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", v2, 2u);
  }

  return PXSharedLibraryMoveAssetsToPersonalLibrary();
}

uint64_t __122__PUMoveAssetsToPersonalLibraryActivity__multiContributorConfirmationAlertControllerForAssets_contributorName_completion___block_invoke_165(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

@end
