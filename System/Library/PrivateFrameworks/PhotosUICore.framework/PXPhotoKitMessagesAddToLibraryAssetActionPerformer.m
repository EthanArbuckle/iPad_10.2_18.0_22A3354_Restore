@implementation PXPhotoKitMessagesAddToLibraryAssetActionPerformer

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  int v17;
  uint64_t v18;
  _BOOL4 v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  _BOOL4 v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  int v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  id v75[2];
  _QWORD v76[5];
  id v77;
  uint8_t v78[16];
  _QWORD v79[4];
  id v80;
  PXPhotoKitMessagesAddToLibraryAssetActionPerformer *v81;
  id v82;
  id v83;
  id v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  _QWORD *v90;
  SEL v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _QWORD v98[4];
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint8_t buf[4];
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAnyItemSelected") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("PXPhotoKitMessagesAddToLibraryAssetActionPerformer: No items selected for add to library action"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v16);

    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m"), 54, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("snapshot.dataSource"), v57, v59);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m"), 54, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("snapshot.dataSource"), v57);
  }

LABEL_4:
  -[PXPhotoKitAssetActionPerformer importStatusManager](self, "importStatusManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "itemCount");

  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  v107 = 0;
  v108 = &v107;
  v109 = 0x2020000000;
  v110 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v98[3] = 0;
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__174253;
  v96 = __Block_byref_object_dispose__174254;
  v97 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke;
  v79[3] = &unk_1E51319B8;
  v91 = a2;
  v62 = v6;
  v80 = v62;
  v81 = self;
  v63 = v7;
  v82 = v63;
  v85 = &v111;
  v86 = &v92;
  v67 = v5;
  v83 = v67;
  v87 = &v107;
  v68 = v10;
  v84 = v68;
  v88 = &v103;
  v89 = &v99;
  v90 = v98;
  objc_msgSend(v11, "enumerateItemIndexPathsUsingBlock:", v79);

  v64 = (void *)objc_msgSend(v68, "count");
  PLSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v112[3];
    v14 = v108[3];
    *(_DWORD *)buf = 134218752;
    v116 = v9;
    v117 = 2048;
    v118 = v13;
    v119 = 2048;
    v120 = v14;
    v121 = 2048;
    v122 = v64;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Assets selected: %tu, assets saved: %tu, assets in progress %tu, assets to save: %tu", buf, 0x2Au);
  }

  if (v104[3] == v9)
  {
    v15 = CFSTR("_Photo");
  }
  else if (v100[3] == v9)
  {
    v15 = CFSTR("_Video");
  }
  else
  {
    v15 = CFSTR("_Item");
  }
  v17 = objc_msgSend(v67, "isCloudPhotoLibraryEnabled");
  v18 = v112[3];
  v19 = v18 != 0;
  if (v18)
  {
    if (v18 == v9)
    {
      v20 = CFSTR("PXCMMMessagesSaveToLibrary_AllSaved_Multiple");
      if (v9 == 1)
        v20 = CFSTR("PXCMMMessagesSaveToLibrary_AllSaved");
      v21 = v20;
      -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v108[3] + v18 != v9)
      {
        objc_msgSend(CFSTR("PXCMMMessagesSaveToLibrary_SomeSaved"), "stringByAppendingString:", v15);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v51, CFSTR("PhotosUICore"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v112[3];
        PXLocalizedStringWithValidatedFormat(v52, CFSTR("%tu"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(CFSTR("PXCMMMessagesSaveToLibraryActionTitle_SaveWithCount"), "stringByAppendingString:", v15, v61);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v53, CFSTR("PhotosUICore"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v9 - v112[3];
        PXLocalizedStringWithValidatedFormat(v54, CFSTR("%tu"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 0;
        v65 = 0;
        v27 = 1;
        v31 = 1;
        if (v36)
          goto LABEL_33;
        goto LABEL_30;
      }
      objc_msgSend(CFSTR("PXCMMMessagesSaveToLibrary_AllSavedOrInProgress"), "stringByAppendingString:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v108[3];
      PXLocalizedStringWithValidatedFormat(v32, CFSTR("%tu"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v65 = 0;
    v31 = 0;
    v27 = 1;
  }
  else
  {
    v23 = v17;
    v24 = CFSTR("PXCMMMessagesSaveToLibrary_AllUnsaved_Multiple");
    v25 = v108[3];
    if (v9 == 1)
    {
      v24 = CFSTR("PXCMMMessagesSaveToLibrary_AllUnsaved");
      v26 = CFSTR("PXCMMMessagesSaveToLibrary_AllInProgress");
    }
    else
    {
      v26 = CFSTR("PXCMMMessagesSaveToLibrary_AllInProgress_Multiple");
    }
    v27 = v25 != v9;
    v65 = v25 == v9;
    if (v25 == v9)
      v28 = (__CFString *)v26;
    else
      v28 = (__CFString *)v24;
    v29 = v28;
    -[__CFString stringByAppendingString:](v29, "stringByAppendingString:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v22, "stringByAppendingString:", CFSTR("_ICPL"));
      v30 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v30;
    }
    PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v27;
  }

LABEL_30:
  v33 = CFSTR("PXCMMMessagesSaveToLibraryActionTitle_Multiple");
  if (v9 == 1)
    v33 = CFSTR("PXCMMMessagesSaveToLibraryActionTitle");
  v34 = v33;
  -[__CFString stringByAppendingString:](v34, "stringByAppendingString:", v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v35, CFSTR("PhotosUICore"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v66, 0, v60);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  if (v19)
  {
    if (!v93[5])
    {
      PLSharingGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v78 = 0;
        _os_log_impl(&dword_1A6789000, v50, OS_LOG_TYPE_ERROR, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Some or all photos are already saved, but we can't find an assetID in Photos to navigate", v78, 2u);
      }

      v27 = 0;
      v65 = 1;
      if (!v31)
        goto LABEL_38;
      goto LABEL_37;
    }
    v38 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXCMMMessagesSaveToLibraryActionTitle_ShowInPhotos"), CFSTR("PhotosUICore"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_183;
    v76[3] = &unk_1E51319E0;
    v76[4] = &v92;
    objc_copyWeak(&v77, (id *)buf);
    objc_msgSend(v38, "actionWithTitle:style:handler:", v39, 0, v76);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v40);

    objc_destroyWeak(&v77);
  }
  if (v31)
  {
LABEL_37:
    v41 = (void *)MEMORY[0x1E0DC3448];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_185;
    v73[3] = &unk_1E5131A08;
    v75[1] = v64;
    objc_copyWeak(v75, (id *)buf);
    v74 = v68;
    objc_msgSend(v41, "actionWithTitle:style:handler:", v36, 0, v73);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v42);

    objc_destroyWeak(v75);
  }
LABEL_38:
  if (v27)
  {
    v43 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXCMMMessagesSaveToLibraryCancelTitle"), CFSTR("PhotosUICore"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_188;
    v71[3] = &unk_1E5140760;
    objc_copyWeak(&v72, (id *)buf);
    objc_msgSend(v43, "actionWithTitle:style:handler:", v44, 1, v71);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v45);

    objc_destroyWeak(&v72);
  }
  if (v65)
  {
    v46 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_191;
    v69[3] = &unk_1E5140760;
    objc_copyWeak(&v70, (id *)buf);
    objc_msgSend(v46, "actionWithTitle:style:handler:", v47, 0, v69);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v48);

    objc_destroyWeak(&v70);
  }
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v37))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Failed to present save alert"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v49);

  }
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(v98, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v111, 8);

LABEL_45:
}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  _BYTE buf[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  *(_OWORD *)buf = *a2;
  *(_OWORD *)&buf[16] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", buf);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 120);
    v26 = *(_QWORD *)(a1 + 40);
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m"), 65, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v24, v28);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 120);
    v22 = *(_QWORD *)(a1 + 40);
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v21, v22, CFSTR("PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m"), 65, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v24);
  }

LABEL_3:
  v6 = objc_msgSend(*(id *)(a1 + 48), "importStateForAsset:", v5);
  if (v6 == 1)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    PLSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      goto LABEL_16;
    }
    objc_msgSend(v5, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v13;
    v14 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Asset %{public}@ is already downloading";
LABEL_11:
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);

    goto LABEL_12;
  }
  v7 = v6;
  if (v6 == 2)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      PXAssetToRevealForMomentSharedAsset(v5, 2, *(void **)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    PLSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    objc_msgSend(v5, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v13;
    v14 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Asset %{public}@ is already saved";
    goto LABEL_11;
  }
  PLSharingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Asset %{public}@ is not saved with state %tu", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);
LABEL_16:
  v17 = objc_msgSend(v5, "mediaType");
  v18 = a1 + 104;
  v19 = a1 + 112;
  if (v17 == 1)
    v19 = a1 + 96;
  if (v17 != 2)
    v18 = v19;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v18 + 8) + 24);

}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_183(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id WeakRetained;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138543362;
    v19 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Show in Photos selected: Will navigate to asset %{public}@", buf, 0xCu);
  }

  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(CFSTR("photos://asset?uuid="), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend(v7, "openSensitiveURL:withOptions:error:", v6, 0, &v17);
  v9 = v17;

  PLSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      v12 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Success navigating to asset %{public}@";
      v13 = v11;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 12;
LABEL_8:
      _os_log_impl(&dword_1A6789000, v13, v14, v12, buf, v15);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v4;
    v20 = 2112;
    v21 = v9;
    v12 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Failed navigating to asset %{public}@, error: %@";
    v13 = v11;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
    goto LABEL_8;
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_185(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Save selected. Saving %lu media objects", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "importAssets:", *(_QWORD *)(a1 + 32));

}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_188(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Cancel selected.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_191(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Okay selected.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

@end
