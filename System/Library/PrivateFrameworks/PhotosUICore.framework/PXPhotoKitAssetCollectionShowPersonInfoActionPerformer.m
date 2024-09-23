@implementation PXPhotoKitAssetCollectionShowPersonInfoActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "people", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 1;

  return v5;
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "people");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "traitEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC36F8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __124__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke;
  v19[3] = &unk_1E5125768;
  v20 = v10;
  v21 = v12;
  v22 = v7;
  v23 = a1;
  v14 = v7;
  v15 = v12;
  v16 = v10;
  objc_msgSend(v13, "elementWithUncachedProvider:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (int64_t)actionTypeForPerson:(id)a3 outContact:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int64_t v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "px_isHuman"))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C96890];
  v14[1] = v7;
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkedContactWithKeysToFetch:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
    v11 = 2;
  }
  else
  {
LABEL_6:
    objc_msgSend(v5, "px_localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v12, "length");

    if (v10)
    {
      v10 = 0;
      if (objc_msgSend(v5, "px_isHuman"))
        v11 = 1;
      else
        v11 = 3;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (void)_createPersonInfoActionForPerson:(id)a3 traitCollection:(id)a4 handler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  uint64_t v14;
  id v15;
  id v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  void *v22;
  double v23;
  double v24;
  _BOOL8 v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void *v31;
  id v32;
  void (**v33)(id, void *);
  uint64_t v34;
  _QWORD v35[4];
  void *v36;
  id v37;
  id v38;
  void (**v39)(id, void *);
  uint64_t v40;
  id v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v41 = 0;
  v14 = objc_msgSend(a1, "actionTypeForPerson:outContact:", v10, &v41);
  v15 = v41;
  switch(v14)
  {
    case 0:
      PXLocalizedStringForPersonOrPetAndVisibility(v10, 0, CFSTR("PXPeopleInfoNameThisPerson"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "px_isHuman"))
        v17 = CFSTR("person.crop.circle.badge.plus");
      else
        v17 = CFSTR("pawprint.fill");
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:image:identifier:handler:](PXPhotoKitAssetCollectionShowPersonInfoAction, "actionWithTitle:image:identifier:handler:", v16, v18, 0, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setType:", 0);
      v42 = v19;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = &v42;
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.badge.plus"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("PXPeopleInfoLinkContactInfoAction"), CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:image:identifier:handler:](PXPhotoKitAssetCollectionShowPersonInfoAction, "actionWithTitle:image:identifier:handler:", v18, v16, 0, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setType:", 1);
      v43[0] = v19;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = (void **)v43;
LABEL_7:
      objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v22);

      goto LABEL_16;
    case 2:
      if (v11)
      {
        objc_msgSend(v11, "displayScale");
        v24 = v23;
        v25 = objc_msgSend(v11, "layoutDirection") == 1;
      }
      else
      {
        v25 = 0;
        v24 = 1.0;
      }
      objc_msgSend(MEMORY[0x1E0CD16C0], "fullNameFromContact:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke;
      v35[3] = &unk_1E5125790;
      v36 = v28;
      v38 = v12;
      v40 = 2;
      v37 = v15;
      v39 = v13;
      v16 = v28;
      +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v37, v25, 1, v35, 48.0, 48.0, v24);

      v18 = v36;
      goto LABEL_16;
    case 3:
      if (v11)
      {
        objc_msgSend(v11, "displayScale");
        v27 = v26;
      }
      else
      {
        v27 = 1.0;
      }
      objc_msgSend(v10, "px_localizedName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke_2;
      v30[3] = &unk_1E51257B8;
      v31 = v29;
      v32 = v12;
      v34 = 3;
      v33 = v13;
      v16 = v29;
      +[PXActivityUtilities requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:](PXActivityUtilities, "requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:", v10, 1, v30, 48.0, 48.0, v27);

      v18 = v31;
LABEL_16:

      break;
    default:
      break;
  }

}

void __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:image:identifier:handler:](PXPhotoKitAssetCollectionShowPersonInfoAction, "actionWithTitle:image:identifier:handler:", *(_QWORD *)(a1 + 32), a2, 0, *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setType:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v3, "setContact:", *(_QWORD *)(a1 + 40));
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 40), "emailAddresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "phoneNumbers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "stringValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
    }

    objc_msgSend(v3, "setSubtitle:", v6);
  }
  v9 = *(_QWORD *)(a1 + 56);
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void __126__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__createPersonInfoActionForPerson_traitCollection_handler_completion___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to get image for named pet with error %@", buf, 0xCu);
    }

  }
  +[PXPhotoKitAssetCollectionShowPersonInfoAction actionWithTitle:image:identifier:handler:](PXPhotoKitAssetCollectionShowPersonInfoAction, "actionWithTitle:image:identifier:handler:", a1[4], v6, 0, a1[5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setType:", a1[7]);
  v10 = a1[6];
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

uint64_t __124__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 56), "_createPersonInfoActionForPerson:traitCollection:handler:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (void)performUserInteractionTask
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  -[PXPhotoKitAssetCollectionActionPerformer sendingAction](self, "sendingAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_6:
    -[PXAssetCollectionActionPerformer people](self, "people");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v9 = objc_msgSend((id)objc_opt_class(), "actionTypeForPerson:outContact:", v8, &v11);
    v10 = v11;
    -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer _performUserInteractionTaskWithType:contact:](self, "_performUserInteractionTaskWithType:contact:", v9, v10);

    v4 = 0;
    goto LABEL_7;
  }
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer _performUserInteractionTaskWithType:contact:](self, "_performUserInteractionTaskWithType:contact:", v5, v6);

LABEL_7:
}

- (void)_performUserInteractionTaskWithType:(int64_t)a3 contact:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0:
    case 3:
      -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer _showNamingView](self, "_showNamingView");
      goto LABEL_5;
    case 1:
      -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer _showContactPicker](self, "_showContactPicker");
      goto LABEL_5;
    case 2:
      -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer _showContactDetailViewControllerForContact:](self, "_showContactDetailViewControllerForContact:", v6);
LABEL_5:
      v6 = v7;
      break;
    default:
      break;
  }

}

- (void)_showNamingView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[PXAssetCollectionActionPerformer people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleNamingCreator namingViewControllerFor:presentationEnvironment:](PXPeopleNamingCreator, "namingViewControllerFor:presentationEnvironment:", v14, v4);
  }
  else
  {
    +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/PXDisplay Adoption/PhotoKit/Actions/Asset Collection Action Performers/People/PXPhotoKitAssetCollectionShowPersonInfoActionPerformer.m"), "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v7, v8, "-[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer _showNamingView]", 190);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCallerInfo:", v9);

    +[PXPeopleUtilities bootstrapViewControllerForContext:delegate:](PXPeopleUtilities, "bootstrapViewControllerForContext:delegate:", v4, 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXActionPerformer presentViewController:](self, "presentViewController:", v10))
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v14, "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_genericErrorWithDebugDescription:", CFSTR("Failed to present people naming view for person: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v13);

  }
}

- (void)_showContactPicker
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C974B0]);
  objc_msgSend(v4, "setDelegate:", self);
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present contact picker"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v3);

  }
}

- (void)_showContactDetailViewControllerForContact:(id)a3
{
  void *v4;
  id v5;

  +[PXPeopleUtilities contactViewControllerForContact:target:selector:](PXPeopleUtilities, "contactViewControllerForContact:target:selector:", a3, self, sel__handleUnlinkContactButton_);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v5, sel__showContactDetailViewControllerForContact_, self, (void *)1);
  if (-[PXActionPerformer pushViewController:](self, "pushViewController:", v5))
  {
    -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer setPushedContactViewController:](self, "setPushedContactViewController:", v5);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to push contact detail view controller"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v4);

  }
}

- (void)_handleUnlinkContactButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer pushedContactViewController](self, "pushedContactViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer people](self, "people");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  PXPresentationEnvironmentForSender(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__handleUnlinkContactButton___block_invoke;
  v10[3] = &unk_1E5148D30;
  objc_copyWeak(&v11, &location);
  +[PXPeopleUtilities handleUnlinkContact:person:presentationEnvironment:sourceItem:handleUnlinkageInternally:completion:](PXPeopleUtilities, "handleUnlinkContact:person:presentationEnvironment:sourceItem:handleUnlinkageInternally:completion:", v6, v8, v9, v4, 1, v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_popContactViewController
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  -[PXPhotoKitAssetCollectionShowPersonInfoActionPerformer pushedContactViewController](self, "pushedContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v2)
  {
    v6 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);
  }
  else
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Contact details view controller is not top most, which is unexpected. Will not dismiss", v7, 2u);
    }

  }
}

- (void)contactPickerDidCancel:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled contact picking from info action", v5, 2u);
  }

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a4;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "User selected contact for person from info action", v11, 2u);
  }

  -[PXAssetCollectionActionPerformer people](self, "people");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleBootstrap nameAndVerifyPerson:toContact:photoLibrary:completionHandler:](PXPeopleBootstrap, "nameAndVerifyPerson:toContact:photoLibrary:completionHandler:", v8, v5, v9, &__block_literal_global_96869);

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Missing person to assign contact from info action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v10);

  }
}

- (CNContactViewController)pushedContactViewController
{
  return (CNContactViewController *)objc_loadWeakRetained((id *)&self->_pushedContactViewController);
}

- (void)setPushedContactViewController:(id)a3
{
  objc_storeWeak((id *)&self->_pushedContactViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pushedContactViewController);
}

void __89__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer_contactPicker_didSelectContact___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to assign contact to person with error %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __85__PXPhotoKitAssetCollectionShowPersonInfoActionPerformer__handleUnlinkContactButton___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_popContactViewController");

}

@end
