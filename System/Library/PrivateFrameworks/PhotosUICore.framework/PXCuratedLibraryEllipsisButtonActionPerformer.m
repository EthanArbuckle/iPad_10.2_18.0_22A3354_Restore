@implementation PXCuratedLibraryEllipsisButtonActionPerformer

- (BOOL)presentsMenu
{
  void *v2;
  char v3;

  +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableNewActionContextMenu");

  return v3;
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithViewModel:(id)a3 assetCollectionReference:(id)a4 actionManager:(id)a5
{
  id v9;
  PXCuratedLibraryEllipsisButtonActionPerformer *v10;
  PXCuratedLibraryEllipsisButtonActionPerformer *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryEllipsisButtonActionPerformer;
  v10 = -[PXCuratedLibraryAssetCollectionActionPerformer initWithActionType:viewModel:assetCollectionReference:](&v13, sel_initWithActionType_viewModel_assetCollectionReference_, CFSTR("PXCuratedLibraryActionEllipsisButton"), a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_actionManager, a5);

  return v11;
}

- (void)setLayout:(id)a3
{
  objc_storeWeak((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_assetCollectionReferenceProvider);
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 assetCollectionReference:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 95, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryEllipsisButtonActionPerformer initWithActionType:viewModel:assetCollectionReference:]");

  abort();
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithViewModel:(id)a3 assetCollectionReferenceProvider:(id)a4 actionManager:(id)a5
{
  id v8;
  id v9;
  PXCuratedLibraryEllipsisButtonActionPerformer *v10;
  PXCuratedLibraryEllipsisButtonActionPerformer *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryEllipsisButtonActionPerformer;
  v10 = -[PXCuratedLibraryAssetCollectionActionPerformer initWithActionType:viewModel:assetCollectionReference:](&v13, sel_initWithActionType_viewModel_assetCollectionReference_, CFSTR("PXCuratedLibraryActionEllipsisButton"), a3, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_actionManager, a5);
    objc_storeWeak((id *)&v11->_assetCollectionReferenceProvider, v8);
  }

  return v11;
}

- (id)assetCollectionReference
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[PXCuratedLibraryEllipsisButtonActionPerformer assetCollectionReferenceProvider](self, "assetCollectionReferenceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXCuratedLibraryEllipsisButtonActionPerformer;
    -[PXCuratedLibraryAssetCollectionActionPerformer assetCollectionReference](&v9, sel_assetCollectionReference);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (id)buttonSpriteReference
{
  void *v3;
  void *v4;

  -[PXCuratedLibraryEllipsisButtonActionPerformer layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spriteReferenceForObjectReference:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void (**v6)(void *, void *);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  objc_class *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  SEL v70;
  BOOL v71;
  void *v72;
  void *v73;
  void *v74;
  int64_t v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD aBlock[4];
  id v93;
  _BYTE v94[128];
  _QWORD v95[3];
  _BYTE v96[128];
  _QWORD v97[4];

  v97[2] = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryEllipsisButtonActionPerformer layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v70 = a2;
    -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryEllipsisButtonActionPerformer assetCollectionReference](self, "assetCollectionReference");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[PXCuratedLibraryActionPerformer actionZoomLevel](self, "actionZoomLevel");
    v71 = v75 == 1;
    v5 = (void *)objc_opt_new();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PXCuratedLibraryEllipsisButtonActionPerformer_performUserInteractionTask__block_invoke;
    aBlock[3] = &unk_1E5127D60;
    v76 = v5;
    v93 = v76;
    v6 = (void (**)(void *, void *))_Block_copy(aBlock);
    -[PXCuratedLibraryEllipsisButtonActionPerformer actionManager](self, "actionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = CFSTR("PXCuratedLibraryActionAllPhotosZoomIn");
    v97[1] = CFSTR("PXCuratedLibraryActionAllPhotosZoomOut");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v89 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "actionPerformerForActionType:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFiltersMenu"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer sender](self, "sender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSender:", v15);

    v73 = v14;
    v6[2](v6, v14);
    v16 = v78;
    objc_msgSend(v78, "assetCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v17;
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "px_descriptionForAssertionMessage");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 176, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v60, v61);

        v16 = v78;
        v17 = v74;

      }
      objc_msgSend(v17, "photoLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "hasSharedLibraryOrPreview"))
      {
        if (v16)
        {
          objc_msgSend(v16, "indexPath");
          v20 = v86;
        }
        else
        {
          v20 = 0;
          v86 = 0u;
          v87 = 0u;
        }
        if (v20 == *(_QWORD *)off_1E50B7E98)
        {
          v68 = v4;
          v95[0] = CFSTR("PXCuratedLibraryActionSetAllLibrariesFilter");
          v95[1] = CFSTR("PXCuratedLibraryActionSetPersonalLibraryFilter");
          v95[2] = CFSTR("PXCuratedLibraryActionSetSharedLibraryFilter");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3);
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v83;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v83 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(v7, "actionPerformerForActionType:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v6[2](v6, v27);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
            }
            while (v24);
          }

          v71 = 1;
          v4 = v68;
        }
        -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "specManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "spec");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "shouldExcludeNonLibraryRelatedActionsFromTopLevelEllipsisMenuForZoomLevel:", v75);

        v21 = v31 & v71;
        v16 = v78;
      }
      else
      {
        v21 = 0;
      }

      v17 = v74;
    }
    else
    {
      v21 = 0;
    }
    v32 = v76;
    if (!v16 || (v21 & 1) != 0)
    {
      if (!v16)
        goto LABEL_65;
      goto LABEL_64;
    }
    objc_msgSend(v77, "assetCollectionActionManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetCollectionReference:displayTitleInfo:", 0, 0);

    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v34;
    if (((v75 == 1) & ~objc_msgSend(v69, "enablePlayMovieInYears")) != 0 || v75 == 4)
    {
      if (v75 == 4)
      {
        -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "assetsDataSourceManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "dataSourceForZoomLevel:", 4);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = objc_msgSend(v37, "identifier");
        v80 = xmmword_1A7C0C1F0;
        v81 = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v37, "assetsInSectionIndexPath:", &v79);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
          goto LABEL_57;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_51;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "px_descriptionForAssertionMessage");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v70, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 223, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[dataSource assetsInSectionIndexPath:PXSimpleIndexPathMakeSection(dataSource.identifier, 0)]"), v44, v45);
        goto LABEL_71;
      }
    }
    else
    {
      objc_msgSend(v34, "actionPerformerForActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypePlayMovie"), v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "performerDelegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setDelegate:", v36);

      v6[2](v6, v35);
    }
    objc_msgSend(v16, "assetCollection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_40:
        if (objc_msgSend(v37, "px_highlightKind") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAllAssetsInYearRepresentedByYearHighlight:options:", v37, 0);
          v38 = objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
        if (objc_msgSend(v37, "px_highlightKind") == 3)
        {
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v37, 0);
          v38 = objc_claimAutoreleasedReturnValue();
LABEL_44:
          v39 = (void *)v38;

          if (!v39)
          {
            v32 = v76;
LABEL_59:
            objc_msgSend(v4, "superlayout");
            v52 = objc_claimAutoreleasedReturnValue();
            v53 = (void *)v52;
            if (v52)
              v54 = (void *)v52;
            else
              v54 = v4;
            v55 = v54;

            objc_msgSend(v7, "tapToRadarPerformerAssetCollectionReference:diagnosticLayout:", v16, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v56);

            objc_msgSend(v7, "curationDebugPerformerAssetCollectionReference:diagnosticLayout:", v16, v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v6[2](v6, v57);
            goto LABEL_63;
          }
          goto LABEL_52;
        }
        objc_msgSend(v77, "assetsDataSourceManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "assetsInAssetCollection:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
          goto LABEL_57;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_51:

LABEL_52:
          objc_msgSend(v72, "setAssetsFetchResult:", v39);
          -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "specManager");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "spec");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "userInterfaceIdiom");

          if (v50 == 4 && v75 == 4)
          {
            v16 = v78;
            v32 = v76;
            goto LABEL_63;
          }
          v16 = v78;
          if (!objc_msgSend(v72, "canPerformActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypeShowMap"), v78))
          {
LABEL_58:
            v32 = v76;
            if (v75 != 4)
              goto LABEL_59;
LABEL_63:

            v17 = v74;
LABEL_64:
            -[PXCuratedLibraryEllipsisButtonActionPerformer _presentToUserOptionsFromActionPerformers:forAssetCollectionReference:](self, "_presentToUserOptionsFromActionPerformers:forAssetCollectionReference:", v32, v16);
LABEL_65:
            -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

            goto LABEL_66;
          }
          objc_msgSend(v72, "actionPerformerForActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypeShowMap"), v78);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "performerDelegate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setDelegate:", v51);

          v6[2](v6, v37);
LABEL_57:

          goto LABEL_58;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "px_descriptionForAssertionMessage");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v70, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 219, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[viewModel.assetsDataSourceManager assetsInAssetCollection:highlight]"), v44, v45);
LABEL_71:

        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "px_descriptionForAssertionMessage");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", v70, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 213, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v64, v66);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", v70, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 213, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v64);
    }

    v16 = v78;
    goto LABEL_40;
  }
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
LABEL_66:

}

- (void)_presentToUserOptionsFromActionPerformers:(id)a3 forAssetCollectionReference:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  PXActivitySharingContext *v37;
  void *v38;
  PXActivitySharingContext *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  unsigned int v46;
  _QWORD v47[2];
  __int128 v48;
  uint8_t buf[16];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PXCuratedLibraryActionPerformer actionZoomLevel](self, "actionZoomLevel");
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "specManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldExcludeNonLibraryRelatedActionsFromTopLevelEllipsisMenuForZoomLevel:", v8);

  if (v7)
  {
    objc_msgSend(v7, "indexPath");
    v13 = v55;
  }
  else
  {
    v13 = 0;
    v55 = 0u;
    v56 = 0u;
  }
  v14 = *(_QWORD *)off_1E50B7E98;
  if (v13 == *(_QWORD *)off_1E50B7E98 || v8 == 1)
    v16 = v12;
  else
    v16 = 0;
  if (v8 == 4)
    v17 = 1;
  else
    v17 = v16;
  +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "enableNewActionContextMenu");

  if (v19)
  {
    if ((v17 & 1) == 0)
    {
      -[PXCuratedLibraryEllipsisButtonActionPerformer actionManager](self, "actionManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionPerformerForActionType:withAssetCollectionReference:", CFSTR("PXCuratedLibraryActionShare"), v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "arrayByAddingObject:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v22;
    }
    -[PXActionPerformer delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v23, "curatedLibraryActionPerformer:presentContextMenuActionsWithPerformers:", self, v6);
    }
    else
    {
      PXAssertGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v35, OS_LOG_TYPE_ERROR, "Unable to perform user interaction task.", buf, 2u);
      }

    }
    goto LABEL_54;
  }
  v46 = v17;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v6 = v6;
  v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v52 != v26)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "activity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v23, "addObject:", v28);

      }
      v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v25);
  }

  objc_msgSend(v7, "keyAssetReference");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "asset");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 4)
    v30 = 4;
  else
    v30 = 3;
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "assetsDataSourceManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dataSourceForZoomLevel:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    if (v8 == 4)
    {
      objc_msgSend(v33, "keyAsset");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v33, "containsAnyItems"))
        goto LABEL_44;
      *(_OWORD *)buf = 0u;
      v50 = 0u;
      -[PXCuratedLibraryEllipsisButtonActionPerformer assetCollectionReference](self, "assetCollectionReference");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend(v33, "indexPathForAssetCollectionReference:", v36);
      }
      else
      {
        *(_OWORD *)buf = 0u;
        v50 = 0u;
      }

      if (*(_QWORD *)buf == v14 || objc_msgSend(v33, "numberOfItemsInSection:", *(_QWORD *)&buf[8]) < 1)
      {
LABEL_44:
        v29 = 0;
        goto LABEL_45;
      }
      v47[0] = objc_msgSend(v33, "identifier");
      v47[1] = *(_QWORD *)&buf[8];
      v48 = xmmword_1A7C0C1F0;
      objc_msgSend(v33, "assetAtItemIndexPath:", v47);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (void *)v34;
  }
LABEL_45:
  v37 = [PXActivitySharingContext alloc];
  objc_msgSend(v7, "assetCollection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PXActivitySharingContext initWithAssetCollection:assetsDataSource:](v37, "initWithAssetCollection:assetsDataSource:", v38, v33);

  -[PXActivitySharingContext setActivities:](v39, "setActivities:", v23);
  -[PXActivitySharingContext setWantsActionSheet:](v39, "setWantsActionSheet:", 1);
  -[PXActivitySharingContext setExcludeShareActivity:](v39, "setExcludeShareActivity:", v46);
  -[PXActivitySharingContext setKeyAsset:](v39, "setKeyAsset:", v29);
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "zoomLevel");
  if ((unint64_t)(v41 - 1) >= 3)
    v42 = 0;
  else
    v42 = 14 - v41;
  -[PXActivitySharingContext setSourceOrigin:](v39, "setSourceOrigin:", v42);

  -[PXActionPerformer delegate](self, "delegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v43, "curatedLibraryActionPerformer:presentShareSheetWithSharingContext:", self, v39);
  }
  else
  {
    PXAssertGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v44, OS_LOG_TYPE_ERROR, "Unable to perform user interaction task.", buf, 2u);
    }

  }
LABEL_54:

}

- (PXCuratedLibraryLayoutAssetCollectionReferenceProvider)assetCollectionReferenceProvider
{
  return (PXCuratedLibraryLayoutAssetCollectionReferenceProvider *)objc_loadWeakRetained((id *)&self->_assetCollectionReferenceProvider);
}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (PXCuratedLibraryActionManager)actionManager
{
  return self->_actionManager;
}

uint64_t __75__PXCuratedLibraryEllipsisButtonActionPerformer_performUserInteractionTask__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

@end
