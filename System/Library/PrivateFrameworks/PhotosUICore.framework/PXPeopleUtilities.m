@implementation PXPeopleUtilities

+ (id)bootstrapViewControllerForContext:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  PXUIPeopleBootstrapFlowController *v7;
  void *v8;
  int v9;
  PXPeopleFlowNavigationController *v10;

  v5 = a4;
  v6 = a3;
  v7 = -[PXPeopleBootstrapFlowController initWithContext:]([PXUIPeopleBootstrapFlowController alloc], "initWithContext:", v6);

  -[PXPeopleBootstrapFlowController setBootstrapDelegate:](v7, "setBootstrapDelegate:", v5);
  if (-[PXPeopleBootstrapFlowController hasNextViewController](v7, "hasNextViewController")
    || (+[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "alwaysShowBootstrap"),
        v8,
        v9))
  {
    v10 = -[PXPeopleFlowNavigationController initWithFlowController:]([PXPeopleFlowNavigationController alloc], "initWithFlowController:", v7);
    -[PXPeopleFlowNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4
{
  return objc_msgSend(a1, "showBootstrapIfNeededWithContext:fromParentVC:force:delegate:", a3, a4, 0, 0);
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 delegate:(id)a5
{
  return objc_msgSend(a1, "showBootstrapIfNeededWithContext:fromParentVC:force:delegate:", a3, a4, 0, a5);
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 force:(BOOL)a5 delegate:(id)a6
{
  return objc_msgSend(a1, "showBootstrapIfNeededWithContext:fromParentVC:force:flowDelegate:presentationDelegate:", a3, a4, a5, a6, 0);
}

+ (BOOL)showBootstrapIfNeededWithContext:(id)a3 fromParentVC:(id)a4 force:(BOOL)a5 flowDelegate:(id)a6 presentationDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PXChangePeopleTypeAction *v19;
  PXChangePeopleTypeAction *v20;
  void *v21;
  void *v22;
  BOOL v23;
  PXChangePeopleTypeAction *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v28 = a7;
  objc_msgSend(v12, "sourcePerson");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities personWithLocalIdentifier:propertySets:](PXPeopleUtilities, "personWithLocalIdentifier:propertySets:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a5
     || +[PXPeopleUtilities shouldShowBootstrapForPerson:](PXPeopleUtilities, "shouldShowBootstrapForPerson:", v18))&& (objc_msgSend(v12, "setSourcePerson:", v18), objc_msgSend(a1, "bootstrapViewControllerForContext:delegate:", v12, v14), (v19 = (PXChangePeopleTypeAction *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = v19;
    -[PXChangePeopleTypeAction setModalPresentationStyle:](v19, "setModalPresentationStyle:", 2);
    -[PXChangePeopleTypeAction presentationController](v20, "presentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v28;
    objc_msgSend(v21, "setDelegate:", v28);

    v23 = 1;
    objc_msgSend(v13, "presentViewController:animated:completion:", v20, 1, 0);
  }
  else
  {
    if ((objc_msgSend(v12, "didCommitPreBootstrapAction") & 1) != 0 || objc_msgSend(v12, "bootstrapType"))
    {
      v20 = -[PXPeopleBootstrapFlowController initEmptyFlowWithContext:]([PXUIPeopleBootstrapFlowController alloc], "initEmptyFlowWithContext:", v12);
      -[PXChangePeopleTypeAction done:](v20, "done:", v13);
    }
    else
    {
      v25 = [PXChangePeopleTypeAction alloc];
      v29 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PXChangePeopleTypeAction initWithPeople:type:](v25, "initWithPeople:type:", v26, 1);

      objc_msgSend(v13, "undoManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAction executeWithUndoManager:completionHandler:](v20, "executeWithUndoManager:completionHandler:", v27, &__block_literal_global_2854);

    }
    v23 = 0;
    v22 = v28;
  }

  return v23;
}

+ (id)alertControllerForUntaggingPerson:(id)a3 asset:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v59;
  PXPeopleAlertContentViewController *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD aBlock[4];
  id v78;
  id v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "px_localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  v12 = objc_msgSend(v8, "mediaType");
  v63 = v10;
  v13 = v9;
  if (v11)
  {
    if (v12 == 2)
      v14 = CFSTR("PXPeopleUntagPersonDescriptionNamedVideo");
    else
      v14 = CFSTR("PXPeopleUntagPersonDescriptionNamedPhoto");
    PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v16 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v12 == 2)
      v17 = CFSTR("PXPeopleUntagPersonDescriptionNoNameVideo");
    else
      v17 = CFSTR("PXPeopleUntagPersonDescriptionNoNamePhoto");
    PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, v17);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke;
  aBlock[3] = &unk_1E51165C8;
  v18 = v7;
  v78 = v18;
  v19 = v8;
  v79 = v19;
  v20 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v16;
  v60 = -[PXPeopleAlertContentViewController initWithPerson:message:]([PXPeopleAlertContentViewController alloc], "initWithPerson:message:", v18, v16);
  objc_msgSend(v21, "setContentViewController:");
  v22 = (void *)MEMORY[0x1E0CD1570];
  objc_msgSend(v19, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchOptionsWithPhotoLibrary:orObject:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setIncludedDetectionTypes:", v25);

  v26 = (void *)MEMORY[0x1E0CB3880];
  v64 = v18;
  objc_msgSend(v18, "uuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personForFace.personUUID"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInternalPredicate:", v28);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSortDescriptors:", v30);

  v61 = v19;
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v19, v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count") != 1)
  {
    v33 = v13;
    if (objc_msgSend(v31, "count") == 2)
    {
      objc_msgSend(v31, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "centerX");
      if (v35 == 0.0)
      {
        objc_msgSend(v31, "lastObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "centerX");
        v38 = v37;

        if (v38 != 0.0)
        {
          objc_msgSend(v31, "lastObject");
          v39 = objc_claimAutoreleasedReturnValue();
LABEL_20:
          v32 = (void *)v39;
          goto LABEL_21;
        }
      }
      else
      {

      }
      objc_msgSend(v31, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "centerX");
      if (v41 == 0.0)
      {
        v59 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v31, "lastObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "centerX");
      v44 = v43;

      if (v44 == 0.0)
      {
        objc_msgSend(v31, "firstObject");
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    v59 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
LABEL_21:
  PXLocalizedStringForPersonOrPetAndVisibility(v18, 0, CFSTR("PXPeopleTagWithNewName"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x1E0DC3448];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_173;
  v71[3] = &unk_1E5116618;
  v59 = v32;
  v72 = v59;
  v75 = v20;
  v73 = v31;
  v74 = v18;
  v76 = v33;
  objc_msgSend(v45, "actionWithTitle:style:handler:", v40, 0, v71);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v46);

LABEL_22:
LABEL_24:
  v47 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXPeopleUntagPerson"), CFSTR("PhotosUICore"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_3;
  v67[3] = &unk_1E5116640;
  v68 = v31;
  v69 = v20;
  v50 = v33;
  v70 = v50;
  v51 = v31;
  v52 = v20;
  objc_msgSend(v47, "actionWithTitle:style:handler:", v48, 2, v67);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAction:", v53);
  v54 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXPeopleUntagPersonCancel"), CFSTR("PhotosUICore"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v49;
  v65[1] = 3221225472;
  v65[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_6;
  v65[3] = &unk_1E5142658;
  v66 = v50;
  v56 = v50;
  objc_msgSend(v54, "actionWithTitle:style:handler:", v55, 1, v65);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAction:", v57);
  return v21;
}

+ (id)_untaggingLog
{
  if (_untaggingLog_onceToken != -1)
    dispatch_once(&_untaggingLog_onceToken, &__block_literal_global_194);
  return (id)_untaggingLog_untaggingLog;
}

+ (id)alertControllerForRevertingSuggestLess:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  PXLocalizedStringFromTable(CFSTR("PXBlockConfirmationDialogButtonTitle_Cancel"), CFSTR("PhotosUICore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = 0;
  v40 = 0;
  v41 = 0;
  objc_msgSend(a1, "_alertStringsForPerson:alertTitle:alertMessage:alternativeLevelActionTitle:resetActionTitle:", v6, &v43, &v42, &v41, &v40);
  v29 = v43;
  v27 = v42;
  v7 = v41;
  v25 = v40;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v29, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v27);
  v44 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v11, 0, objc_msgSend(v9, "length"));

  objc_msgSend(v8, "_setAttributedMessage:", v9);
  v12 = (void *)MEMORY[0x1E0DC3448];
  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke;
  v36[3] = &unk_1E51166B0;
  v14 = v6;
  v37 = v14;
  v39 = a1;
  v15 = v26;
  v38 = v15;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v7, 2, v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v16);

  v17 = (void *)MEMORY[0x1E0DC3448];
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_2;
  v32[3] = &unk_1E51166B0;
  v33 = v14;
  v35 = a1;
  v18 = v15;
  v34 = v18;
  v19 = v14;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v25, 2, v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v20);

  v21 = (void *)MEMORY[0x1E0DC3448];
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_5;
  v30[3] = &unk_1E5142658;
  v31 = v18;
  v22 = v18;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v28, 1, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v23);

  return v8;
}

+ (void)_alertStringsForPerson:(id)a3 alertTitle:(id *)a4 alertMessage:(id *)a5 alternativeLevelActionTitle:(id *)a6 resetActionTitle:(id *)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  id *v25;
  id *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "px_localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userFeedbackProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userFeedback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  v33[0] = *MEMORY[0x1E0C96668];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "linkedContactWithKeysToFetch:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "termsOfAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == 3)
  {
    if (objc_msgSend(v11, "length"))
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleBlockPersonRevertAlertTitleNamed_FromNeverFeature"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v11;
      PXStringWithValidatedFormat();
      v32 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleBlockPersonRevertAlertTitleNoName_FromNeverFeature"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = CFSTR("PXPeopleBlockPersonRevertAlertInformativeText_FromNeverFeature");
    v24 = CFSTR("PXPeopleBlockPersonRevertAlertChangeLevelActionTitle_FromNeverFeature");
  }
  else
  {
    if (v14 != 2)
    {
      v20 = v17;
      v32 = 0;
      v21 = 0;
      v22 = 0;
      goto LABEL_13;
    }
    if (objc_msgSend(v11, "length"))
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleBlockPersonRevertAlertTitleNamed_FromFeatureLess"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v11;
      PXStringWithValidatedFormat();
      v32 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleBlockPersonRevertAlertTitleNoName_FromFeatureLess"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = CFSTR("PXPeopleBlockPersonRevertAlertInformativeText_FromFeatureLess");
    v24 = CFSTR("PXPeopleBlockPersonRevertAlertChangeLevelActionTitle_FromFeatureLess");
  }
  PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  PXLocalizedAttributedStringForPersonOrPet(v10, 0, v17, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (objc_msgSend(v11, "length", v30))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleBlockPersonRevertResetActionTitleNamed"));
    v25 = a5;
    v26 = a6;
    v27 = a7;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    a7 = v27;
    a6 = v26;
    a5 = v25;
  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleBlockPersonRevertResetActionTitleNoName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = objc_retainAutorelease(v32);
  if (a5)
    *a5 = objc_retainAutorelease(v21);
  if (a6)
    *a6 = objc_retainAutorelease(v22);
  if (a7)
    *a7 = objc_retainAutorelease(v29);

}

+ (id)suggestLessOptionSelectionViewController:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SuggestLessPeopleOptionSelectionViewController initWithPeople:delegate:completionHandler:]([_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController alloc], "initWithPeople:delegate:completionHandler:", v9, v8, v7);

  return v10;
}

+ (void)handleUnlinkContact:(id)a3 person:(id)a4 presentationEnvironment:(id)a5 sourceItem:(id)a6 handleUnlinkageInternally:(BOOL)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  BOOL v35;

  v13 = a4;
  v14 = a8;
  v15 = a6;
  v30 = a5;
  v16 = a3;
  PXLocalizedStringFromTable(CFSTR("PXPeopleInfoUnlinkContactAlertTitle"), CFSTR("PhotosUICore"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fullNameFromContact:", v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(CFSTR("PXPeopleInfoUnlinkContactAlertMessage"), CFSTR("PhotosUICore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v17, CFSTR("%@"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v29, v18, 0, v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXPeopleInfoUnlinkContactConfirmationAction"), CFSTR("PhotosUICore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __124__PXPeopleUtilities_UI__handleUnlinkContact_person_presentationEnvironment_sourceItem_handleUnlinkageInternally_completion___block_invoke;
  v32[3] = &unk_1E5123230;
  v35 = a7;
  v33 = v13;
  v34 = v14;
  v22 = v14;
  v23 = v13;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 2, v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v24);

  v25 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXPeopleInfoUnlinkContactCancelAction"), CFSTR("PhotosUICore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v27);

  objc_msgSend(v19, "popoverPresentationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSourceItem:", v15);

  objc_msgSend(v30, "presentViewController:animated:completionHandler:", v19, 1, 0);
}

+ (void)_unlinkContactfromPerson:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke;
  v9[3] = &unk_1E5148348;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  +[PXPeopleUtilities unlinkContactInfoForPerson:completion:](PXPeopleUtilities, "unlinkContactInfoForPerson:completion:", v8, v9);

}

+ (id)contactViewControllerForContact:(id)a3 target:(id)a4 selector:(SEL)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x1E0C974D8];
  v8 = a4;
  objc_msgSend(v7, "viewControllerForContact:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardFooterGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXPeopleInfoUnlinkContactButton"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addActionWithTitle:target:selector:inGroup:destructive:", v12, v8, a5, v11, 1);

  return v9;
}

void __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      v9 = "Unlinked contact info for person %{public}@ from contact details";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, buf, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v5;
    v9 = "Failed to unlink contact info for person %{public}@ from contact details with error %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke_237;
  block[3] = &unk_1E5148A40;
  v14 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__PXPeopleUtilities_UI___unlinkContactfromPerson_completion___block_invoke_237(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __124__PXPeopleUtilities_UI__handleUnlinkContact_person_presentationEnvironment_sourceItem_handleUnlinkageInternally_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = v3;
    +[PXPeopleUtilities _unlinkContactfromPerson:completion:](PXPeopleUtilities, "_unlinkContactfromPerson:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_5:
    v3 = v5;
    goto LABEL_6;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    goto LABEL_5;
  }
LABEL_6:

}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];
  _QWORD v21[3];
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__2805;
  v23[4] = __Block_byref_object_dispose__2806;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  objc_msgSend(*(id *)(a1 + 32), "userFeedbackProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  v22 = v7;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_202;
  v15[3] = &unk_1E513CD68;
  v17 = v21;
  v18 = v20;
  v19 = v23;
  v16 = *(id *)(a1 + 32);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_204;
  v11[3] = &unk_1E5116688;
  v10 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v23;
  v14 = v9;
  v12 = v10;
  objc_msgSend(v4, "performChanges:completionHandler:", v15, v11);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_3;
  v8[3] = &unk_1E5149198;
  v9 = *(id *)(a1 + 32);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_4;
  v6[3] = &unk_1E51166D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "performChanges:completionHandler:", v8, v6);

}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("User cancelled confirmation alert"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserFeedback:", 0);

}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = (void *)MEMORY[0x1E0D09910];
    v11 = *MEMORY[0x1E0D09830];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.userFeedback.reverted.suggestLess.person"), v9);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_202(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v2 < 2)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    goto LABEL_6;
  }
  if (v2 == 2)
  {
LABEL_6:
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 3;
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = CFSTR("com.apple.photos.CPAnalytics.userFeedback.avoid.person");
    goto LABEL_7;
  }
  if (v2 != 3)
    goto LABEL_8;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = CFSTR("com.apple.photos.CPAnalytics.userFeedback.dislike.person");
LABEL_7:
  v5 = v4;
  v6 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v4;

LABEL_8:
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", a1[4]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F0]), "initWithType:feature:context:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), 0, 0);
    objc_msgSend(v11, "setUserFeedback:", v7);

  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to get a new feedback type from person: %@ (current feedback type (%ld))", buf, 0x16u);
    }

  }
}

void __75__PXPeopleUtilities_UI__alertControllerForRevertingSuggestLess_completion___block_invoke_204(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = (void *)MEMORY[0x1E0D09910];
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12 = *MEMORY[0x1E0D09830];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendEvent:withPayload:", v7, v10);

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

void __38__PXPeopleUtilities_UI___untaggingLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.people", "PXPeopleUtilitiesUntagging");
  v1 = (void *)_untaggingLog_untaggingLog;
  _untaggingLog_untaggingLog = (uint64_t)v0;

}

id __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  unint64_t v51;
  os_signpost_id_t v52;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  NSObject *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[PXPeopleUtilities _untaggingLog](PXPeopleUtilities, "_untaggingLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "untagPersonTotal", ", buf, 2u);
  }

  if (objc_msgSend(v2, "count"))
  {
    v8 = v6;
    v9 = v8;
    if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v4, "untagPersonPerformChanges", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_155;
    v60[3] = &unk_1E5148D08;
    v61 = *(id *)(a1 + 32);
    v11 = v2;
    v62 = v11;
    v59 = 0;
    v12 = objc_msgSend(v10, "performChangesAndWait:error:", v60, &v59);
    v13 = v59;

    v14 = v9;
    v15 = v14;
    if (v7 > 0xFFFFFFFFFFFFFFFDLL)
    {

      if (v13)
        v21 = 0;
      else
        v21 = v12;
      if (v21 == 1)
      {
        v49 = v13;
        v51 = v4 - 1;
        v22 = v15;
LABEL_25:
        v50 = v6;
        v52 = v4;
        v48 = v15;

        v23 = (void *)MEMORY[0x1E0CD1570];
        objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fetchOptionsWithPhotoLibrary:orObject:", v24, 0);
        v25 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setIncludedDetectionTypes:](v25, "setIncludedDetectionTypes:", v26);

        -[NSObject setMinimumVerifiedFaceCount:](v25, "setMinimumVerifiedFaceCount:", 0);
        -[NSObject setMinimumUnverifiedFaceCount:](v25, "setMinimumUnverifiedFaceCount:", 0);
        -[NSObject setIncludeTorsoOnlyPerson:](v25, "setIncludeTorsoOnlyPerson:", 1);
        -[NSObject setFetchLimit:](v25, "setFetchLimit:", 1);
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        obj = v11;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        if (v27)
        {
          v28 = v27;
          v20 = 0;
          v29 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v56 != v29)
                objc_enumerationMutation(obj);
              objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonWithFace:options:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i), v25, v48);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "fetchedObjects");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "count");

              if (v33)
              {
                objc_msgSend(v31, "fetchedObjects");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "firstObject");
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "localIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v36, "isEqualToString:", v37);

                if ((v38 & 1) == 0)
                {
                  PLUIGetLog();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v35, "localIdentifier");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v65 = v40;
                    _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_DEFAULT, "Marking newly created person as needing key face: %{public}@", buf, 0xCu);

                  }
                  objc_msgSend(v35, "markAsNeedingKeyFace");
                }
                v20 = v35;
              }

            }
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          }
          while (v28);
        }
        else
        {
          v20 = 0;
        }

        v43 = v48;
        v44 = v43;
        v7 = v51;
        v4 = v52;
        if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v44, OS_SIGNPOST_INTERVAL_END, v52, "untagPersonDetermineNewPerson", ", buf, 2u);
        }

        v13 = v49;
        v6 = v50;
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v4, "untagPersonPerformChanges", ", buf, 2u);
      }

      if (v13)
        v16 = 0;
      else
        v16 = v12;
      if ((v16 & 1) != 0)
      {
        v49 = v13;
        v51 = v4 - 1;
        v17 = v15;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v4, "untagPersonDetermineNewPerson", ", buf, 2u);
        }
        goto LABEL_25;
      }
    }
    PLUIGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v41 = *(void **)(a1 + 32);
      v42 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v65 = v41;
      v66 = 2112;
      v67 = v42;
      v68 = 2112;
      v69 = v13;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "Failed to untag person: %@ asset: %@ error: %@", buf, 0x20u);
    }
    v20 = 0;
    goto LABEL_47;
  }
  PLUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v65 = v18;
    v66 = 2112;
    v67 = v19;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to link any asset's face to the person we're untagging (person: %@, asset: %@)", buf, 0x16u);
  }
  v20 = 0;
LABEL_48:

  v45 = v6;
  v46 = v45;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v46, OS_SIGNPOST_INTERVAL_END, v4, "untagPersonTotal", ", buf, 2u);
  }

  return v20;
}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_173(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_2;
  v13 = &unk_1E51165F0;
  v15 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  +[PXPeopleBootstrapContext contextWithFace:type:delayedPersonBlock:](PXPeopleBootstrapContext, "contextWithFace:type:delayedPersonBlock:", v2, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsToBeAddedToPeopleAlbum:", 1);
  objc_msgSend(v3, "setSourcePerson:", *(_QWORD *)(a1 + 48));
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/People/Shared/PXPeopleUtilities+UI.m"), "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v6, v7, "+[PXPeopleUtilities(UI) alertControllerForUntaggingPerson:asset:completion:]_block_invoke", 240, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCallerInfo:", v8);

  +[PXPeopleUtilities bootstrapViewControllerForContext:delegate:](PXPeopleUtilities, "bootstrapViewControllerForContext:delegate:", v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.untag.newTagTapped"), MEMORY[0x1E0C9AA70]);

}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_3(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_4;
  block[3] = &unk_1E513DE18;
  v5 = a1[5];
  v4 = a1[4];
  v6 = a1[6];
  dispatch_async(v2, block);

}

uint64_t __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.untag.cancelTapped"), MEMORY[0x1E0C9AA70]);
}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v2 = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_5;
  block[3] = &unk_1E5148A40;
  v5 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.untag.untagTapped"), MEMORY[0x1E0C9AA70]);
}

uint64_t __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__PXPeopleUtilities_UI__alertControllerForUntaggingPerson_asset_completion___block_invoke_155(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isVerified") & 1) == 0)
    objc_msgSend(v2, "setVerified:", 1);
  objc_msgSend(v2, "addRejectedFaces:forCluster:", *(_QWORD *)(a1 + 40), 0);

}

+ (id)personWithPersonUri:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUri"));

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPersonContext:", 1);
  objc_msgSend(v7, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUri = %@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)peopleWithPersonUris:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUris"));

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUri IN (%@)"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchPeopleWithUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludedDetectionTypes:", v7);

  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)finalMergeTargetPersonForPersonWithUUID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CD1570];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotoLibrary:", v6);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)personWithLocalIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "personWithLocalIdentifier:propertySets:", a3, 0);
}

+ (id)personWithLocalIdentifier:(id)a3 propertySets:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CD16F8];
  v7 = a3;
  objc_msgSend(v6, "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier = %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncludedDetectionTypes:", v11);

  if (v5 && objc_msgSend(v5, "count"))
    objc_msgSend(v9, "setFetchPropertySets:", v5);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_peopleHomeFetchResultForPersonType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != -1"), CFSTR("manualOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithType:options:", a3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)mergePersons:(id)a3 withPerson:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "fetchPropertySetsIfNeeded");
        objc_msgSend(v13, "userFeedbackProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userFeedback");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (!v16)
          v10 = objc_msgSend(MEMORY[0x1E0CD17F0], "mergeFeedbackType:withOtherFeedbackType:", objc_msgSend(v15, "type"), v10);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v5, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__PXPeopleUtilities_mergePersons_withPerson___block_invoke;
  v25[3] = &unk_1E5145560;
  v18 = v7;
  v26 = v18;
  v19 = v5;
  v27 = v19;
  v28 = v10;
  v24 = 0;
  v20 = objc_msgSend(v17, "performChangesAndWait:error:", v25, &v24);
  v21 = v24;

  if ((v20 & 1) == 0)
  {
    PLUIGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "People merging failed with error: %@", buf, 0xCu);
    }

  }
  return v20;
}

+ (id)identifiersForPeople:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "localIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)assetCollectionListFetchResultForPerson:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1390];
  v15[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetsForPersons:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CD14E0];
  v14 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transientCollectionListWithCollections:title:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)assetCollectionListFetchResultForPeople:(id)a3 assetCollectionFetchResults:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = *MEMORY[0x1E0CD1958];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  objc_msgSend(v7, "setIncludeTorsoAndFaceDetectionData:", 1);
  v32 = v7;
  v33 = v6;
  v31 = v5;
  if (objc_msgSend(v4, "count") == 1)
  {
    v9 = objc_msgSend(v5, "px_isHuman");
    v10 = CFSTR("PXPetVirtualCollection");
    if (v9)
      v10 = CFSTR("PXPersonVirtualCollection");
    v11 = v10;
    objc_msgSend(v5, "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPersons:options:", v4, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PXPeopleUtilities identifiersForPeople:](PXPeopleUtilities, "identifiersForPeople:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v6, "assetIdentifiersForPersonIdentifiers:error:", v14, &v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v34;
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v15, v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16)
      {
        PLUIGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "localizedDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v18;
          _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Error while getting assets for social group: %@", buf, 0xCu);

        }
      }
      v13 = 0;
    }
    v11 = CFSTR("PXSocialGroupVirtualCollection");
    v19 = CFSTR("PXSocialGroupVirtualCollection");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v33;
  }
  -[__CFString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("-%@"), v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    +[PXPeopleUtilities titleStringForPeople:](PXPeopleUtilities, "titleStringForPeople:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v13, v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CD14E0];
    v37 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transientCollectionListWithCollections:title:", v25, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v6, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v35 = v23;
      v36 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)sortDescriptorsWithPersonAssetSortOrder:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("dateCreated"), a3 == 1);
  v7[0] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("uuid"), 1);
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isPersonHiddenFromPeopleHome:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "type") == -1 || objc_msgSend(v3, "verifiedType") == 0;

  return v4;
}

+ (id)facesForPerson:(id)a3 inAssets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "fetchedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in (%@)"), CFSTR("assetForFace"), v7, (_QWORD)v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("noindex:(%K) = %@"), CFSTR("personForFace"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3528];
  v30[0] = v14;
  v30[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "librarySpecificFetchOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setInternalPredicate:", v20);
  objc_msgSend(v22, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIncludedDetectionTypes:", v23);

  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithOptions:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)sharedContactStore
{
  if (sharedContactStore_onceToken != -1)
    dispatch_once(&sharedContactStore_onceToken, &__block_literal_global_206_143019);
  return (id)sharedContactStore_contactStore;
}

+ (BOOL)isGreenTeaAndContactsAccessDenied
{
  if (isGreenTeaAndContactsAccessDenied_onceToken != -1)
    dispatch_once(&isGreenTeaAndContactsAccessDenied_onceToken, &__block_literal_global_208_143017);
  return isGreenTeaAndContactsAccessDenied_isGreenTeaAndAccessDenied;
}

+ (id)fetchMeContact
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *MEMORY[0x1E0C96890];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "+[PXPeopleUtilities fetchMeContact]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%s: Error fetching the me contact: %@", buf, 0x16u);
    }

    v4 = 0;
  }

  return v4;
}

+ (void)unlinkContactInfoForPerson:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__PXPeopleUtilities_unlinkContactInfoForPerson_completion___block_invoke;
  v9[3] = &unk_1E5149198;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "performChanges:completionHandler:", v9, v6);

}

+ (id)comparatorByPeopleHomeSortingType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[6];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke;
  aBlock[3] = &__block_descriptor_48_e18___PHPerson_16__0_8l;
  aBlock[4] = a2;
  aBlock[5] = a1;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_2;
  v25[3] = &unk_1E512D280;
  v5 = _Block_copy(aBlock);
  v26 = v5;
  v6 = _Block_copy(v25);
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_4;
  v23[3] = &unk_1E512D2C8;
  v24 = v5;
  v7 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_5;
  v18[3] = &unk_1E512D2F0;
  v19 = v6;
  v20 = &__block_literal_global_217_143009;
  v22 = a3;
  v8 = _Block_copy(v23);
  v21 = v8;
  v9 = v6;
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_6;
  v14[3] = &unk_1E512D318;
  v16 = v8;
  v17 = a3;
  v15 = _Block_copy(v18);
  v10 = v8;
  v11 = v15;
  v12 = _Block_copy(v14);

  return v12;
}

+ (NSArray)sortDescriptorsForManualSort
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (NSArray)reverseSortDescriptorsForManualSort
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (unint64_t)currentSortOrderFor:(id)a3
{
  return +[PXPeopleSwiftUtilities rawValueFor:](PXPeopleSwiftUtilities, "rawValueFor:", +[PXPeopleSwiftUtilities currentSortOrderFor:](PXPeopleSwiftUtilities, "currentSortOrderFor:", a3));
}

+ (void)setSortOrder:(unint64_t)a3 toPhotoLibrary:(id)a4
{
  id v5;

  v5 = a4;
  +[PXPeopleSwiftUtilities setWithSortOrder:to:](PXPeopleSwiftUtilities, "setWithSortOrder:to:", +[PXPeopleSwiftUtilities sortOrderFor:](PXPeopleSwiftUtilities, "sortOrderFor:", a3), v5);

}

+ (int64_t)manualOrderForInsertingAtEndOfSectionWithType:(int64_t)a3
{
  void *v3;
  int64_t v4;

  if (a3 < 0)
    return 0;
  +[PXPeopleUtilities lastManuallySortedPersonInSectionOfType:](PXPeopleUtilities, "lastManuallySortedPersonInSectionOfType:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "manualOrder") + 1;

  return v4;
}

+ (id)lastManuallySortedPersonInSectionOfType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v12;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 454, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type >= PHPersonTypeOrdinary"));

  }
  objc_msgSend(a1, "_peopleHomeFetchResultForPersonType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "comparatorByPeopleHomeSortingType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)isFavoritePerson:(id)a3
{
  return objc_msgSend(a3, "type") == 1;
}

+ (void)peopleFaceTilesForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIncludedDetectionTypes:", v10);

    objc_msgSend(v8, "setIncludeTorsoAndFaceDetectionData:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v14, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PXPeopleUtilities_peopleFaceTilesForAsset_options_completion___block_invoke;
  v15[3] = &unk_1E512D340;
  v16 = v11;
  v17 = v9;
  v12 = v11;
  v13 = v9;
  objc_msgSend(a1, "_peopleFaceTilesForFaces:asset:options:completion:", v12, v14, v8, v15);

}

+ (void)peopleFaceTilesForFaces:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v14, "count");
  if (v10 && v13)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__PXPeopleUtilities_peopleFaceTilesForFaces_asset_options_completion___block_invoke;
    v15[3] = &unk_1E512D368;
    v16 = v12;
    objc_msgSend(a1, "_peopleFaceTilesForFaces:asset:options:completion:", v14, v10, v11, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, MEMORY[0x1E0C9AA60]);
  }

}

+ (id)generateNewFaceTileFromFaceTile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXPeopleFaceTile *v18;
  void *v19;
  PXPeopleFaceTile *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v6);

  v7 = (void *)MEMORY[0x1E0CD1528];
  objc_msgSend(v4, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchFacesWithLocalIdentifiers:options:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "personLocalIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0CD16C0];
    v22 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchPersonsWithLocalIdentifiers:options:", v15, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = [PXPeopleFaceTile alloc];
  objc_msgSend(v3, "asset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[PXPeopleFaceTile initWithFace:asset:person:](v18, "initWithFace:asset:person:", v11, v19, v17);
  return v20;
}

+ (id)personFaceTileByPersonIdForPersons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "_pl_indexBy:", &__block_literal_global_225_142998);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchKeyFaceByPersonLocalIdentifierForPersons:options:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAssetsGroupedByFaceUUIDForFaces:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__PXPeopleUtilities_personFaceTileByPersonIdForPersons___block_invoke_2;
    v15[3] = &unk_1E512D3B0;
    v16 = v4;
    v17 = v8;
    v18 = v9;
    v10 = v9;
    v11 = v8;
    v12 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
    v13 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

+ (CGRect)faceRectForPeopleFaceTile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "px_cropRectWithCropFactor:", 1.5);
  objc_msgSend(v4, "pixelWidth");
  objc_msgSend(v4, "pixelHeight");
  PXRectDenormalize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (void)_peopleFaceTilesForFaces:(id)a3 asset:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  PXPeopleFaceTile *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  PXPeopleFaceTile *v34;
  void *v35;
  void *v36;
  PXPeopleFaceTile *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(id, void *, id);
  void *v43;
  id v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v44 = a5;
  v11 = (void (**)(id, void *, id))a6;
  v12 = v10;
  v42 = v11;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v21 = -[PXPeopleFaceTile initWithFace:asset:person:]([PXPeopleFaceTile alloc], "initWithFace:asset:person:", v20, v12, 0);
        objc_msgSend(v20, "personLocalIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v13, "setObject:forKey:", v21, v22);
        objc_msgSend(v20, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v21, v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v17);
  }
  v43 = v12;
  v41 = v15;

  v24 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(v13, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchPersonsWithLocalIdentifiers:options:", v25, v44);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v26;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        objc_msgSend(v31, "localIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = [PXPeopleFaceTile alloc];
        objc_msgSend(v33, "face");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "asset");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[PXPeopleFaceTile initWithFace:asset:person:](v34, "initWithFace:asset:person:", v35, v36, v31);

        -[PXPeopleFaceTile face](v37, "face");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v37, v39);

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v28);
  }

  objc_msgSend(v14, "allValues");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2](v42, v40, obj);

}

+ (BOOL)shouldShowBootstrapForPerson:(id)a3
{
  return +[PXPeopleUtilities shouldShowBootstrapForPerson:context:](PXPeopleUtilities, "shouldShowBootstrapForPerson:context:", a3, 0);
}

+ (BOOL)shouldShowBootstrapForPerson:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = +[PXPeopleUtilities _hasRecentlyHandledBootstrapOrSuggestionForPerson:](PXPeopleUtilities, "_hasRecentlyHandledBootstrapOrSuggestionForPerson:", v5);
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "alwaysShowBootstrap");

  if (v5)
    v10 = !v7 | v9;
  else
    v10 = 0;
  if (v7)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "People UI: Should not show bootstrap; bootstrap has been handled recently for person: %@ context: %@",
        (uint8_t *)&v16,
        0x16u);
    }

    if (v5)
    {
LABEL_6:
      if (!v9)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else if (v5)
  {
    goto LABEL_6;
  }
  PLUIGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "People UI: Should not show bootstrap; person is nil for context: %@",
      (uint8_t *)&v16,
      0xCu);
  }

  if (!v9)
  {
LABEL_7:
    if ((v10 & 1) != 0)
      goto LABEL_21;
    goto LABEL_18;
  }
LABEL_15:
  PLUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "People UI: Always show bootstrap flag is enabled for person: %@ context: %@", (uint8_t *)&v16, 0x16u);
  }

  if ((v10 & 1) == 0)
  {
LABEL_18:
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_INFO, "People UI: Should not show bootstrap; the resolved BOOL is NO for person: %@ context: %@",
        (uint8_t *)&v16,
        0x16u);
    }

  }
LABEL_21:

  return v10;
}

+ (void)temporarilySuppressBootstrapOrSuggestionForPerson:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[PXPeopleUtilities _isPhotosProcess](PXPeopleUtilities, "_isPhotosProcess"))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "People UI: temporarilySuppressBootstrapOrSuggestionForPerson: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(a1, "_daysDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleCandidateWidgetUtilities insertPerson:forDaysDictionary:](PXPeopleCandidateWidgetUtilities, "insertPerson:forDaysDictionary:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXPeopleCandidateWidgetUtilities removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:](PXPeopleCandidateWidgetUtilities, "removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXPeopleUtilities _setDaysDictionary:](PXPeopleUtilities, "_setDaysDictionary:", v8);
  }

}

+ (void)resetTemporarilySuppressedBootstrapOrSuggestions
{
  if (+[PXPeopleUtilities _isPhotosProcess](PXPeopleUtilities, "_isPhotosProcess"))
    +[PXPeopleUtilities _setDaysDictionary:](PXPeopleUtilities, "_setDaysDictionary:", MEMORY[0x1E0C9AA70]);
}

+ (BOOL)canShowSuggestionForPerson:(id)a3
{
  return objc_msgSend(a1, "_hasRecentlyHandledBootstrapOrSuggestionForPerson:", a3) ^ 1;
}

+ (BOOL)_hasRecentlyHandledBootstrapOrSuggestionForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  v4 = a3;
  if (+[PXPeopleUtilities _isPhotosProcess](PXPeopleUtilities, "_isPhotosProcess"))
  {
    objc_msgSend(a1, "_daysDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleCandidateWidgetUtilities removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:](PXPeopleCandidateWidgetUtilities, "removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToDictionary:", v6) & 1) == 0)
      +[PXPeopleUtilities _setDaysDictionary:](PXPeopleUtilities, "_setDaysDictionary:", v6);
    v7 = !+[PXPeopleCandidateWidgetUtilities shouldFetchCandidatesForPerson:forDaysDictionary:](PXPeopleCandidateWidgetUtilities, "shouldFetchCandidatesForPerson:forDaysDictionary:", v4, v6);

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)_daysDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PXPeopleCandidateWidgetKey"));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA70];
  return v4;
}

+ (void)_setDaysDictionary:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("PXPeopleCandidateWidgetKey"));

}

+ (BOOL)_isPhotosProcess
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Photos")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

  return v4;
}

+ (id)titleStringForPerson:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities titleStringForPeople:](PXPeopleUtilities, "titleStringForPeople:", v5, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)titleStringForSocialGroup:(id)a3
{
  return (id)objc_msgSend(a3, "px_title");
}

+ (id)defaultTitleStringForSocialGroup:(id)a3
{
  return (id)objc_msgSend(a3, "px_defaultTitle");
}

+ (id)titleStringForPeople:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = &stru_1E5149688;
  if (v4)
  {
    v6 = v4;
    if (v4 == 1)
    {
      objc_msgSend(v3, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_localizedName");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (__CFString *)v8;
      else
        v10 = &stru_1E5149688;
      v5 = v10;

      goto LABEL_34;
    }
    v11 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "px_localizedName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17 && objc_msgSend(v17, "length"))
            objc_msgSend(v7, "addObject:", v18);
          if (!v11 && objc_msgSend(v7, "count") == 3)
          {

            goto LABEL_21;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_21:

    v19 = objc_msgSend(v7, "count");
    if (v19)
    {
      if (v19 == v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v7);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_34:

        goto LABEL_35;
      }
      v20 = v19 != 3 || v11;
      if ((v20 & 1) == 0)
      {
        objc_msgSend(v7, "removeLastObject");
        v19 = 2;
      }
      v21 = v6 - v19;
      v22 = (void *)MEMORY[0x1E0CB3738];
      PXLocalizedStringFromTable(CFSTR("PXRelatedPeopleWidgeNOthers"), CFSTR("PhotosUICore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObject:", v24, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringByJoiningStrings:", v25);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v11)
      {
        v5 = &stru_1E5149688;
        goto LABEL_34;
      }
      PXLocalizedStringForPeople(v12, CFSTR("PXRelatedPeopleWidgetNameNPeople"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_34;
  }
LABEL_35:

  return v5;
}

+ (id)_titleStringForPeople:(id)a3 singlePersonFallback:(id)a4 groupFallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  objc_msgSend(a1, "titleStringForPeople:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v13 = (unint64_t)objc_msgSend(v12, "length") > 0x16;
  v27 = 0u;
  v28 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "px_localizedName", (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (!v19 || !objc_msgSend(v19, "length"))
        {

          v13 = 1;
          goto LABEL_12;
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_12:

  if (v11 == 1 && (v21 = v9, v13) || (v11 > 3 ? (v22 = 1) : (v22 = v13), v21 = v10, v22 == 1))
  {
    v23 = v21;

    v12 = v23;
  }

  return v12;
}

+ (id)slideshowTitleStringForPeople:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  PXLocalizedStringFromTable(CFSTR("PXRelatedPeopleTogether"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titleStringForPeople:singlePersonFallback:groupFallback:", v4, &stru_1E5149688, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)memoryTitleStringFromPeople:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  PXLocalizedStringFromTable(CFSTR("PXRelatedPeoplePortraitOf"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXRelatedPeopleTogether"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titleStringForPeople:singlePersonFallback:groupFallback:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)summaryTitleForLibrary:(id)a3 count:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "locKeyForPersonOrPet:withVisibility:key:", 0, objc_msgSend(a3, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleHomeSummaryQuantitySubtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithCount(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)unblockPersonsInLibrary:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = (void *)MEMORY[0x1E0CD1630];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "memoriesWithBlockedPersonFeatureInPhotoLibrary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchPersonsWithUserFeedbackWithOptions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__PXPeopleUtilities_unblockPersonsInLibrary_completion___block_invoke;
  v14[3] = &unk_1E5148D08;
  v15 = v8;
  v16 = v11;
  v12 = v11;
  v13 = v8;
  objc_msgSend(v7, "performChanges:completionHandler:", v14, v6);

}

+ (id)sortedPersons:(id)a3 byPersonMemoryFeatures:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") == 1)
        {
          objc_msgSend(v13, "personLocalIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__PXPeopleUtilities_sortedPersons_byPersonMemoryFeatures___block_invoke;
  v18[3] = &unk_1E512D3D8;
  v19 = v7;
  v15 = v7;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)peopleArrayFromFastEnumeration:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v5 = v3;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (v6)
      {
        objc_msgSend(v6, "fetchedObjects");
        v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    v4 = (id)objc_msgSend(v7, "copy");
    v6 = 0;
    goto LABEL_19;
  }
  v4 = v3;

  if (!v4)
    goto LABEL_6;
LABEL_20:

  return v4;
}

+ (id)peopleFetchResultFromFastEnumeration:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v9 = v7;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;

      if (v10)
      {
LABEL_19:
        v16 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v16, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v6, v17, 0, 0, 0);

        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++), (_QWORD)v19);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    goto LABEL_19;
  }
  v8 = v7;

  if (!v8)
    goto LABEL_6;
LABEL_20:

  return v8;
}

+ (id)socialGroupFetchResultFromFastEnumeration:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v9 = v7;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;

      if (v10)
      {
LABEL_19:
        v16 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(MEMORY[0x1E0CD17C0], "fetchType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v16, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v6, v17, 0, 0, 0);

        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++), (_QWORD)v19);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    goto LABEL_19;
  }
  v8 = v7;

  if (!v8)
    goto LABEL_6;
LABEL_20:

  return v8;
}

+ (id)fetchPeopleAndPetsInSocialGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v6);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInSocialGroup:option:", v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)keyFaceForPerson:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 880, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludedDetectionTypes:", v8);

  objc_msgSend(v7, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1528], "px_fetchKeyFaceForPerson:options:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)keyAssetForPerson:(id)a3 face:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIncludeHiddenAssets:", 0);
    objc_msgSend(v9, "setFetchLimit:", 1);
    v10 = (void *)MEMORY[0x1E0CD1390];
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchAssetsForFaces:options:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 895, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

    }
    objc_msgSend(v7, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v14;
    objc_msgSend(v9, "setIncludeHiddenAssets:", 0);
    objc_msgSend(v9, "setFetchLimit:", 1);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetForPerson:options:", v7, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (void)people:(id)a3 hasHumans:(BOOL *)a4 hasPets:(BOOL *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a4 || !a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 909, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outHasHumans != nil && outHasPets != nil"));

  }
  *a4 = 0;
  *a5 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          PLUIGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v15;
            v18 = v17;
            v19 = "PXPeopleUtilities: %@ does not respond to isHuman.";
            goto LABEL_18;
          }
LABEL_19:

          goto LABEL_20;
        }
        if (!*a4)
          *a4 = objc_msgSend(v15, "px_isHuman");
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          PLUIGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v15;
            v18 = v17;
            v19 = "PXPeopleUtilities: %@ does not respond to isPet.";
LABEL_18:
            _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0xCu);
          }
          goto LABEL_19;
        }
        if (*a5)
        {
          v16 = 1;
        }
        else
        {
          v16 = objc_msgSend(v15, "px_isPet");
          *a5 = v16;
        }
        if (*a4 && v16)
          goto LABEL_27;
LABEL_20:
        ++v14;
      }
      while (v12 != v14);
      v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      v12 = v20;
    }
    while (v20);
  }
LABEL_27:

}

+ (id)locKeyForHasHumans:(BOOL)a3 hasPets:(BOOL)a4 key:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  v8 = v7;
  if (v6 && v5)
  {
    v9 = CFSTR("_PeoplePet");
  }
  else
  {
    if (!v5)
    {
      v10 = v7;
      goto LABEL_8;
    }
    v9 = CFSTR("_Pet");
  }
  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v11 = v10;

  return v11;
}

+ (id)locKeyForPeople:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;
  __int16 v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 950, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  v12 = 0;
  +[PXPeopleUtilities people:hasHumans:hasPets:](PXPeopleUtilities, "people:hasHumans:hasPets:", v7, (char *)&v12 + 1, &v12);
  +[PXPeopleUtilities locKeyForHasHumans:hasPets:key:](PXPeopleUtilities, "locKeyForHasHumans:hasPets:key:", HIBYTE(v12), v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)locKeyForPersonOrPet:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v5 && !objc_msgSend(v5, "px_isHuman"))
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("_Pet"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

+ (id)locKeyForPersonOrPet:(id)a3 withVisibility:(unint64_t)a4 key:(id)a5
{
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;

  +[PXPeopleUtilities locKeyForPersonOrPet:key:](PXPeopleUtilities, "locKeyForPersonOrPet:key:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 == 1)
  {
    v8 = CFSTR("__People");
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v8 = CFSTR("__Pets");
LABEL_5:
    objc_msgSend(v6, "stringByAppendingString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

+ (BOOL)isDetectionTypeHuman:(signed __int16)a3
{
  return a3 > 4 || (a3 & 0x1F) == 1;
}

+ (int64_t)changeTypeForPeople:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleUtilities.m"), 990, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:photoLibrary:](PXPeopleUtilities, "peopleFetchResultFromFastEnumeration:photoLibrary:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PXPeopleChangeTypeActionPerformer changeTypeFor:](PXPeopleChangeTypeActionPerformer, "changeTypeFor:", v9);

  return v10;
}

+ (void)performSetSocialGroupKeyPhotoWithAsset:(id)a3 socialGroup:(id)a4 undoManager:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PXSocialGroupMakeKeyPhotoAction *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PXSocialGroupMakeKeyPhotoAction initWithSocialGroup:newKeyAsset:]([PXSocialGroupMakeKeyPhotoAction alloc], "initWithSocialGroup:newKeyAsset:", v11, v12);

  -[PXAction executeWithUndoManager:completionHandler:](v13, "executeWithUndoManager:completionHandler:", v10, v9);
}

+ (id)makeLemonadeDetailViewControllerForPerson:(id)a3 allPeople:(id)a4
{
  return +[PXLemonadePeoplePhotosPagingGridUtilities detailViewControllerFor:people:](PXLemonadePeoplePhotosPagingGridUtilities, "detailViewControllerFor:people:", a3, a4);
}

uint64_t __58__PXPeopleUtilities_sortedPersons_byPersonMemoryFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v7, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "compare:", v13);

  return v14;
}

void __56__PXPeopleUtilities_unblockPersonsInLibrary_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1640], "unblockPersonsInMemoriesWithBlockedPersonFeature:", *(_QWORD *)(a1 + 32));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setUserFeedback:", 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __56__PXPeopleUtilities_personFaceTileByPersonIdForPersons___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXPeopleFaceTile *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[PXPeopleFaceTile initWithFace:asset:person:]([PXPeopleFaceTile alloc], "initWithFace:asset:person:", v5, v9, v6);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v10, v11);

  }
}

uint64_t __56__PXPeopleUtilities_personFaceTileByPersonIdForPersons___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

uint64_t __70__PXPeopleUtilities_peopleFaceTilesForFaces_asset_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__PXPeopleUtilities_peopleFaceTilesForAsset_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

id __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PXPeopleUtilities.m"), 355, CFSTR("Unexpected object type: %@"), v3);

      abort();
    }
    objc_msgSend(v3, "modelObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

__CFString *__55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_2(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_localizedName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E5149688;
  v4 = v2;

  return v4;
}

uint64_t __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "manualOrder");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "manualOrder");

  if (v8 <= v10)
  {
    if (v8 >= v10)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "compare:", v15);

    }
    else
    {
      v11 = -1;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(a1[4] + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[4] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(void))(a1[5] + 16))();
  v10 = (*(uint64_t (**)(void))(a1[5] + 16))();
  v11 = v10 ^ 1;
  if (((v9 ^ 1) & 1) != 0 || (v11 & 1) != 0)
  {
    if ((v9 ^ 1 | v10) == 1)
    {
      if ((v9 | v11) == 1)
        v13 = (*(uint64_t (**)(void))(a1[6] + 16))();
      else
        v13 = 1;
    }
    else
    {
      v13 = -1;
    }
  }
  else
  {
    v12 = objc_msgSend(v7, "localizedStandardCompare:", v8);
    if (a1[7] == 1)
      v13 = v12;
    else
      v13 = -v12;
  }

  return v13;
}

uint64_t __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 48);
  if (!v8)
  {
    v9 = a1 + 40;
    goto LABEL_6;
  }
  if (v8 == 2 || v8 == 1)
  {
    v9 = a1 + 32;
LABEL_6:
    v3 = (*(uint64_t (**)(void))(*(_QWORD *)v9 + 16))();
  }

  return v3;
}

BOOL __55__PXPeopleUtilities_comparatorByPeopleHomeSortingType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

void __59__PXPeopleUtilities_unlinkContactInfoForPerson_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setName:", 0);
  objc_msgSend(v1, "setDisplayName:", 0);
  objc_msgSend(v1, "setContactMatchingDictionary:", MEMORY[0x1E0C9AA70]);
  objc_msgSend(v1, "setPersonUri:", &stru_1E5149688);

}

uint64_t __54__PXPeopleUtilities_isGreenTeaAndContactsAccessDenied__block_invoke()
{
  uint64_t result;

  result = PLIsChinaSKU();
  if ((_DWORD)result)
  {
    result = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
    isGreenTeaAndContactsAccessDenied_isGreenTeaAndAccessDenied = (unint64_t)(result - 1) < 2;
  }
  return result;
}

void __39__PXPeopleUtilities_sharedContactStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)sharedContactStore_contactStore;
  sharedContactStore_contactStore = (uint64_t)v0;

}

void __45__PXPeopleUtilities_mergePersons_withPerson___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x1E0CD16D8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForMergingPersons:nominalTargetIdentifier:", v3, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "targetPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userFeedbackProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (*(_QWORD *)(a1 + 48) != v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F0]), "initWithType:feature:context:", *(_QWORD *)(a1 + 48), 0, 0);
    objc_msgSend(v10, "setUserFeedback:", v9);

  }
}

uint64_t __55__PXPeopleUtilities_fetchPeopleWithUUIDs_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", a2);
}

@end
