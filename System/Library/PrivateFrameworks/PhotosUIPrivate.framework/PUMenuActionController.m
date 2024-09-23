@implementation PUMenuActionController

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didDismissWithActionIdentifier = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.preventRevealInMomentAction = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setBrowsingSession:(id)a3
{
  PUBrowsingSession *v5;
  PUBrowsingSession **p_browsingSession;
  PUBrowsingSession *browsingSession;
  PUBrowsingSession *v8;

  v5 = (PUBrowsingSession *)a3;
  browsingSession = self->_browsingSession;
  p_browsingSession = &self->_browsingSession;
  if (browsingSession != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_browsingSession, a3);
    v5 = v8;
  }

}

- (id)_contextMenuActionWithTitle:(id)a3 image:(id)a4 attributes:(unint64_t)a5 actionHandler:(id)a6
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributes:", a5);
  return v7;
}

- (id)contextMenuActionIfAvailableForActionType:(unint64_t)a3
{
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  char v22;
  _QWORD *v23;
  id *v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  _QWORD aBlock[4];
  id v39[2];
  _QWORD v40[4];
  id v41;
  char v42;
  _QWORD v43[4];
  id v44;
  id location[2];

  if (a3 == 2)
  {
    -[PUMenuActionController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EEC162C0);

    if ((v7 & 1) != 0)
      return 0;
  }
  -[PUMenuActionController browsingSession](self, "browsingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionManager");
  v10 = objc_claimAutoreleasedReturnValue();

  -[PUMenuActionController browsingSession](self, "browsingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentAssetReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  if ((uint64_t)a3 <= 28)
  {
    if (a3 - 1 < 2)
    {
      PULocalizedString(CFSTR("PUONEUP_QUICK_ACTION_REMOVE_FROM_ALBUM"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    if (a3 - 11 < 2)
    {
      PULocalizedString(CFSTR("PUONEUP_QUICK_ACTION_RECOVER"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.bin"));
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    if (a3 - 13 < 2)
    {
      PULocalizedString(CFSTR("PUONEUP_QUICK_ACTION_RESTORE"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.bin"));
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v21 = (void *)v16;
      v18 = (void *)v10;
LABEL_42:
      v29 = 0;
LABEL_43:
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_3;
      aBlock[3] = &unk_1E58AB620;
      objc_copyWeak(v39, location);
      v39[1] = (id)a3;
      v34 = _Block_copy(aBlock);
      objc_destroyWeak(v39);
      goto LABEL_44;
    }
    goto LABEL_40;
  }
  if ((uint64_t)a3 > 52)
  {
    if (a3 - 54 < 2)
    {
      v18 = (void *)v10;
      v25 = objc_msgSend(v14, "mediaType");
      v26 = CFSTR("ITEM");
      if (v25 == 2)
        v26 = CFSTR("VIDEO");
      if (v25 == 1)
        v27 = CFSTR("PHOTO");
      else
        v27 = v26;
      objc_msgSend(CFSTR("PUONEUP_QUICK_ACTION_SYNDICATION_REMOVE_SUGGESTION_"), "stringByAppendingString:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 2;
      goto LABEL_43;
    }
    if (a3 == 53)
    {
      v18 = (void *)v10;
      v30 = objc_msgSend(v14, "mediaType");
      v31 = CFSTR("ITEM");
      if (v30 == 1)
        v31 = CFSTR("PHOTO");
      if (v30 == 2)
        v31 = CFSTR("VIDEO");
      v32 = v31;
      objc_msgSend(CFSTR("PUONEUP_QUICK_ACTION_SYNDICATION_SAVE_TO_LIBRARY_"), "stringByAppendingString:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (a3 == 29)
  {
    PULocalizedString(CFSTR("PUONEUP_QUICK_ACTION_COPY"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (a3 == 31)
  {
    PULocalizedString(CFSTR("PUONEUP_QUICK_ACTION_SHARE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)v10;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke;
    v43[3] = &unk_1E58AB5D0;
    v23 = v43;
    v24 = &v44;
    objc_copyWeak(&v44, location);
    goto LABEL_38;
  }
  if (a3 != 40)
  {
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString handleFailureInMethod:object:file:lineNumber:description:](v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMenuActionController.m"), 171, CFSTR("Attempted to create an on-demand context menu action for an unsupported action type: %ld"), a3);
    v18 = (void *)v10;
    v21 = 0;
    v37 = 0;
LABEL_41:

    goto LABEL_42;
  }
  if (objc_msgSend(v14, "isFavorite"))
    v17 = CFSTR("PUONEUP_QUICK_ACTION_UNFAVORITE");
  else
    v17 = CFSTR("PUONEUP_QUICK_ACTION_FAVORITE");
  PULocalizedString(v17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v10;
  v19 = objc_msgSend(v14, "isFavorite");
  if (v19)
    v20 = CFSTR("heart.slash");
  else
    v20 = CFSTR("heart");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19 ^ 1;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_2;
  v40[3] = &unk_1E58AB5F8;
  v23 = v40;
  v24 = &v41;
  objc_copyWeak(&v41, location);
  v42 = v22;
LABEL_38:
  v34 = _Block_copy(v23);
  objc_destroyWeak(v24);
  v29 = 0;
  if (!v34)
    goto LABEL_43;
LABEL_44:
  v35 = objc_msgSend(v18, "canPerformActionType:onAsset:inAssetCollection:", a3, v14, v15);
  if ((v35 & objc_msgSend(v18, "shouldEnableActionType:onAsset:inAssetCollection:", a3, v14, v15)) == 1)
  {
    -[PUMenuActionController _contextMenuActionWithTitle:image:attributes:actionHandler:](self, "_contextMenuActionWithTitle:image:attributes:actionHandler:", v37, v21, v29, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  objc_destroyWeak(location);

  return v36;
}

- (id)_copyMenuElement
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PUMenuActionController photosUICoreActionManager](self, "photosUICoreActionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0D7BFB0];
    if (objc_msgSend(v3, "canPerformActionType:", *MEMORY[0x1E0D7BFB0]))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewActionForActionType:image:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    -[PUMenuActionController contextMenuActionIfAvailableForActionType:](self, "contextMenuActionIfAvailableForActionType:", 29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSArray)actions
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  char *v11;
  void (**v12)(char *, _QWORD, id);
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  void *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v95[4];
  id v96;
  id location;
  _QWORD aBlock[4];
  id v99;
  _QWORD v100[3];

  v100[1] = *MEMORY[0x1E0C80C00];
  -[PUMenuActionController browsingSession](self, "browsingSession");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "actionManager");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssetReference");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v91, "asset");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "assetCollection");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v88, "px_isMemory");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUMenuActionController photosUICoreActionManager](self, "photosUICoreActionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUMenuActionController _copyMenuElement](self, "_copyMenuElement");
  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  v86 = v7;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__PUMenuActionController_actions__block_invoke;
  aBlock[3] = &unk_1E58AB648;
  v9 = v6;
  v99 = v9;
  v10 = (char *)_Block_copy(aBlock);
  v11 = v10;
  if (v9)
  {
    v12 = (void (**)(char *, _QWORD, id))(v10 + 16);
    (*((void (**)(char *, _QWORD, id))v10 + 2))(v10, *MEMORY[0x1E0D7BFB8], v5);
    (*v12)(v11, *MEMORY[0x1E0D7C088], v5);
    (*v12)(v11, *MEMORY[0x1E0D7C0C8], v5);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "showAutoEnhanceAction");

    if (v14)
      (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7BFD8], v5);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "showRotateAction");

    if (v16)
    {
      (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7BFF0], v5);
      (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7BFF8], v5);
    }
    if ((objc_msgSend(v9, "canPerformActionType:", *MEMORY[0x1E0D7C060]) & 1) == 0)
    {
      v17 = *MEMORY[0x1E0D7C128];
      if (objc_msgSend(v9, "canPerformActionType:", *MEMORY[0x1E0D7C128]))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "previewActionForActionType:image:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v19);

      }
    }
    v20 = *MEMORY[0x1E0D7C098];
    if (objc_msgSend(v9, "canPerformActionType:", *MEMORY[0x1E0D7C098]))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewActionForActionType:image:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v22);

    }
    v23 = (id)*MEMORY[0x1E0D7C0D0];
    if (objc_msgSend(v9, "canPerformActionType:", v23))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewActionForActionType:image:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v25);
    }

    if (!objc_msgSend(v9, "canPerformActionType:", *MEMORY[0x1E0D7C120]))
      goto LABEL_23;
  }
  else
  {
    -[PUMenuActionController contextMenuActionIfAvailableForActionType:](self, "contextMenuActionIfAvailableForActionType:", 31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v5, "addObject:", v26);

  }
  -[PUMenuActionController contextMenuActionIfAvailableForActionType:](self, "contextMenuActionIfAvailableForActionType:", 40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v5, "addObject:", v27);

  if (v9)
  {
LABEL_23:
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7BFD0], v5);
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7C010], v5);
    v28 = *MEMORY[0x1E0D7C0C0];
    v29 = objc_msgSend(v9, "canPerformActionType:", *MEMORY[0x1E0D7C0C0]);
    if (v93)
      v30 = v29;
    else
      v30 = 0;
    if (v30 == 1)
    {
      v31 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = (objc_class *)objc_opt_class();
        NSStringFromClass(v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "px_descriptionForAssertionMessage");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMenuActionController.m"), 305, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("photosUICoreActionManager"), v80, v81, v86);

      }
      if (objc_msgSend(v31, "shouldEnableActionType:onAsset:", v28, v93))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrowshape.turn.up.left"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "previewActionForActionType:image:", v28, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v33);

      }
    }
    v34 = *MEMORY[0x1E0D7BF98];
    if ((objc_msgSend(v9, "canPerformActionType:", *MEMORY[0x1E0D7BF98]) & (v93 != 0)) == 1)
    {
      v35 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (objc_class *)objc_opt_class();
        NSStringFromClass(v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "px_descriptionForAssertionMessage");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMenuActionController.m"), 320, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("photosUICoreActionManager"), v84, v85);

      }
      if (objc_msgSend(v35, "shouldEnableActionType:onAsset:", v34, v93))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.circle"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "previewActionForActionType:image:", v34, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v37);

      }
    }
    v38 = (id)*MEMORY[0x1E0D7C100];
    if (objc_msgSend(v9, "canPerformActionType:", v38))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.rectangle.stack"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewActionForActionType:image:", v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
        objc_msgSend(v5, "addObject:", v40);

    }
    if (v4)
    {
      v41 = (id)*MEMORY[0x1E0D7C108];
      if (objc_msgSend(v9, "canPerformActionType:", v41))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "previewActionForActionType:image:", v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
          objc_msgSend(v5, "addObject:", v43);

      }
    }
    v44 = *MEMORY[0x1E0D7C0E0];
    if (objc_msgSend(v9, "canPerformActionType:", *MEMORY[0x1E0D7C0E0]))
    {
      if (!self->_delegateRespondsTo.preventRevealInMomentAction
        || (-[PUMenuActionController delegate](self, "delegate"),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            v46 = objc_msgSend(v45, "menuActionControllerPreventRevealInMomentAction:", self),
            v45,
            (v46 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.on.rectangle"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "previewActionForActionType:image:", v44, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v48);
      }
    }
    goto LABEL_58;
  }
  v49 = objc_msgSend(v87, "canPerformActionType:onAsset:inAssetCollection:", 32, v93, v88);
  if (!self->_delegateRespondsTo.preventRevealInMomentAction)
  {
    if ((v49 & 1) == 0)
      goto LABEL_59;
    goto LABEL_57;
  }
  -[PUMenuActionController delegate](self, "delegate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "menuActionControllerPreventRevealInMomentAction:", self);

  if ((v51 & 1) == 0 && ((v49 ^ 1) & 1) == 0)
  {
LABEL_57:
    PULocalizedString(CFSTR("PUONEUP_QUICK_ACTION_REVEAL_IN_ALLPHOTOS"));
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v52 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.on.rectangle"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v8;
    v95[1] = 3221225472;
    v95[2] = __33__PUMenuActionController_actions__block_invoke_2;
    v95[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v96, &location);
    objc_msgSend(v52, "actionWithTitle:image:identifier:handler:", v38, v53, 0, v95);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v54);
    objc_destroyWeak(&v96);
    objc_destroyWeak(&location);
LABEL_58:

  }
LABEL_59:
  -[PUMenuActionController contextMenuActionIfAvailableForActionType:](self, "contextMenuActionIfAvailableForActionType:", 14);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
    objc_msgSend(v5, "addObject:", v90);
  -[PUMenuActionController contextMenuActionIfAvailableForActionType:](self, "contextMenuActionIfAvailableForActionType:", 12);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
    objc_msgSend(v5, "addObject:", v89);
  if (v9)
  {
    v55 = (id)*MEMORY[0x1E0D7C090];
    if (objc_msgSend(v9, "canPerformActionType:", v55))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack.person.crop"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewActionForActionType:image:", v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v57);
    }
    v58 = (id)*MEMORY[0x1E0D7C0F0];
    if (objc_msgSend(v9, "canPerformActionType:", v58))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2.square.stack"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewActionForActionType:image:", v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v60);
    }
    v61 = (id)*MEMORY[0x1E0D7BFA0];
    if (objc_msgSend(v9, "canPerformActionType:", v61))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewActionForActionType:image:", v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v63);
    }

    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7BF80], v5);
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7BF90], v5);
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7C078], v5);
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7C070], v5);
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7C0B8], v5);
  }
  -[PUMenuActionController contextMenuActionIfAvailableForActionType:](self, "contextMenuActionIfAvailableForActionType:", 53);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
    objc_msgSend(v5, "addObject:", v64);
  if (v9)
  {
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7C0B0], v5);
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = (id)*MEMORY[0x1E0D7C080];
    if (objc_msgSend(v9, "canPerformActionType:", v66))
      (*((void (**)(char *, id, id))v11 + 2))(v11, v66, v65);
    v67 = (id)*MEMORY[0x1E0D7C140];
    if (objc_msgSend(v9, "canPerformActionType:", v67))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewActionForActionType:image:", v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v65, "addObject:", v69);
    }
    (*((void (**)(char *, _QWORD, id))v11 + 2))(v11, *MEMORY[0x1E0D7C0A8], v65);
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v65);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v70);

  }
  -[PUMenuActionController debugActions](self, "debugActions");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v71, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("apple.logo"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", CFSTR("Internal"), v72, 0, 0, v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)MEMORY[0x1E0DC39D0];
    v100[0] = v73;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v76);

  }
  return (NSArray *)v5;
}

- (id)debugActions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;

  -[PUMenuActionController photosUICoreActionManager](self, "photosUICoreActionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__PUMenuActionController_debugActions__block_invoke;
    v6[3] = &unk_1E58AB670;
    v7 = v2;
    v8 = v3;
    v4 = _Block_copy(v6);
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *MEMORY[0x1E0D7C038], 0);
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *MEMORY[0x1E0D7C030], 0);
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *MEMORY[0x1E0D7C020], 0);
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *MEMORY[0x1E0D7C028], 0);
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *MEMORY[0x1E0D7C040], 0);
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *MEMORY[0x1E0D7C048], 0);
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *MEMORY[0x1E0D7C058], 0);

  }
  return v3;
}

- (void)_notifyDelegateOfAction:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateRespondsTo.didDismissWithActionIdentifier)
  {
    v4 = a3;
    -[PUMenuActionController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "menuActionController:didDismissWithActionIdentifier:", self, v4);

  }
}

- (void)_performSimpleActionWithType:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PUMenuActionController *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  -[PUMenuActionController browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetCollection");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v10 && v11)
  {
    objc_msgSend(v7, "actionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v10;
    v22 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v14, "canPerformAction:onAllAssetsByAssetCollection:", a3, v16);
    if ((_DWORD)v13)
    {
      v20 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v19 = self;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actionPerformerForSimpleActionType:onAssetReferences:", a3, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUMenuActionController _executeActionPerformer:](v19, "_executeActionPerformer:", v18);

    }
  }
  if (v6)
    v6[2](v6, v13);

}

- (void)_promptTrashActionConfirmationForAsset:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  int v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id *v13;
  id *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  char v54;
  id v55;
  id obj;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  id *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__105068;
  v73 = __Block_byref_object_dispose__105069;
  v74 = 0;
  v63 = 0;
  v64 = (id *)&v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__105068;
  v67 = __Block_byref_object_dispose__105069;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__105068;
  v61 = __Block_byref_object_dispose__105069;
  v62 = 0;
  v8 = objc_msgSend(v6, "isGuestAsset");
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if (!v8)
    goto LABEL_3;
  v75[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v58 + 5);
  v12 = (void *)v58[5];
  v14 = v64;
  v55 = v64[5];
  obj = v12;
  v15 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings();
  objc_storeStrong(v13, obj);
  objc_storeStrong(v14 + 5, v55);

  if ((v15 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(v6, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v47[0] = v10;
    v47[1] = 3221225472;
    v47[2] = __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke;
    v47[3] = &unk_1E58AB698;
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BE0]), "initWithPhotoLibrary:", v17);
    v48 = v18;
    v51 = &v69;
    v52 = &v63;
    v53 = &v57;
    v49 = v6;
    v19 = v17;
    v50 = v19;
    v54 = v9;
    objc_msgSend(v19, "performBlockAndWait:", v47);

  }
  PULocalizedString(CFSTR("CANCEL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v70[5], v64[5], 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0DC3448];
  v23 = v58[5];
  v45[0] = v10;
  v45[1] = 3221225472;
  v45[2] = __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_2;
  v45[3] = &unk_1E58AB6C0;
  v24 = v7;
  v46 = v24;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 2, v45);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v25);

  v26 = (void *)MEMORY[0x1E0DC3448];
  v40 = v10;
  v41 = 3221225472;
  v42 = __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_3;
  v43 = &unk_1E58AB6C0;
  v27 = v24;
  v44 = v27;
  objc_msgSend(v26, "actionWithTitle:style:handler:", v20, 1, &v40);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v28, v40, v41, v42, v43);

  -[PUMenuActionController browsingSession](self, "browsingSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "viewModel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currentAssetReference");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "pxAssetReference");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUMenuActionController regionOfInterestProvider](self, "regionOfInterestProvider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "regionOfInterestForAssetReference:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v21, "popoverPresentationController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUMenuActionController presentingViewController](self, "presentingViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSourceView:", v37);

    objc_msgSend(v35, "sourceView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rectInCoordinateSpace:", v38);
    objc_msgSend(v35, "setSourceRect:");

  }
  -[PUMenuActionController presentingViewController](self, "presentingViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "presentViewController:animated:completion:", v21, 1, 0);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
}

- (void)_performFavoriteAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  -[PUMenuActionController browsingSession](self, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollection");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    objc_msgSend(v5, "actionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "canPerformActionType:onAsset:inAssetCollection:", 40, v8, v10))
    {
      v14[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionPerformerForSettingFavoriteTo:onAssetReferences:", v3, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUMenuActionController _executeActionPerformer:](self, "_executeActionPerformer:", v13);

    }
  }

}

- (void)_executeActionPerformer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUMenuActionController _activeActionPerformer](self, "_activeActionPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6 == 10 || v6 == 5)
  {
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PUMenuActionController _activeActionPerformer](self, "_activeActionPerformer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Attempted to execute performer:%@ while an active performer is busy: %@", buf, 0x16u);

    }
  }
  else
  {
    -[PUMenuActionController _setActiveActionPerformer:](self, "_setActiveActionPerformer:", v4);
    objc_msgSend(v4, "setDelegate:", self);
    v9 = objc_msgSend(v4, "actionType");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__PUMenuActionController__executeActionPerformer___block_invoke;
    v10[3] = &unk_1E58AB728;
    v10[4] = self;
    v10[5] = v9;
    objc_msgSend(v4, "performWithCompletionHandler:", v10);
  }

}

- (id)undoManagerForAssetActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PUMenuActionController presentingViewController](self, "presentingViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PUNavigationController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[PUMenuActionController presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (objc_msgSend(v6, "actionType") == 31)
    {
      v9 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v7);
      objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v7;
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "userInterfaceIdiom");

        if (v12 == 1)
          v13 = 1;
        else
          v13 = objc_msgSend(v10, "px_shouldForceAlertStyle");
        objc_msgSend(v10, "setPreferredStyle:", v13);

      }
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);
    }
  }

  return v8 != 0;
}

- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, SEL, id, id))a5 + 2))(a5, a2, a3, a4);
  return 1;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (PXRegionOfInterestProvider)regionOfInterestProvider
{
  return (PXRegionOfInterestProvider *)objc_loadWeakRetained((id *)&self->_regionOfInterestProvider);
}

- (void)setRegionOfInterestProvider:(id)a3
{
  objc_storeWeak((id *)&self->_regionOfInterestProvider, a3);
}

- (PUMenuActionControllerDelegate)delegate
{
  return (PUMenuActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXActionManager)photosUICoreActionManager
{
  return self->_photosUICoreActionManager;
}

- (void)setPhotosUICoreActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_photosUICoreActionManager, a3);
}

- (PUAssetActionPerformer)_activeActionPerformer
{
  return self->__activeActionPerformer;
}

- (void)_setActiveActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->__activeActionPerformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeActionPerformer, 0);
  objc_storeStrong((id *)&self->_photosUICoreActionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_regionOfInterestProvider);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

void __50__PUMenuActionController__executeActionPerformer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Error executing action: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (*(_QWORD *)(a1 + 40) == 29 && v6)
    {
      PULocalizedString(CFSTR("COPY_TO_PASTEBOARD_PREPARATION_ERROR_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("COPY_TO_PASTEBOARD_PREPARATION_ERROR_MESSAGE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("OK"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, &__block_literal_global_105063);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v13);

      objc_msgSend(v7, "presentViewController:animated:completion:", v10, 1, 0);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_setActiveActionPerformer:", 0);

}

void __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id obj;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(id *)(v6 + 40);
  obj = v4;
  v7 = *(_QWORD *)(v5 + 8);
  v11 = *(id *)(v7 + 40);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pl_managedAssetFromPhotoLibrary:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getDeletionWarningTitle:message:buttonTitle:forAssets:syndicationAssetCount:clientName:style:", &obj, &v12, &v11, v10, *(unsigned __int8 *)(a1 + 80), 0, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v12);
  objc_storeStrong((id *)(v7 + 40), v11);

}

uint64_t __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38__PUMenuActionController_debugActions__block_invoke(uint64_t a1, void *a2, int a3)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:", v11);
  v6 = v11;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "systemImageNameForActionType:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "previewActionForActionType:image:", v11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a3)
        v10 = 2;
      else
        v10 = 0;
      objc_msgSend(v9, "setAttributes:", v10);
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

    v6 = v11;
  }

}

void __33__PUMenuActionController_actions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:", v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "systemImageNameForActionType:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "menuElementForActionType:image:willStartActionHandler:didEndActionHandler:", v10, v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "addObject:", v9);

    }
  }

}

void __33__PUMenuActionController_actions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performSimpleActionWithType:completionHandler:", 32, 0);

}

void __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyDelegateOfAction:", CFSTR("com.apple.mobileslideshow.PUMenuActionController.share"));

}

void __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performFavoriteAction:", *(unsigned __int8 *)(a1 + 40));

}

void __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performSimpleActionWithType:completionHandler:", *(_QWORD *)(a1 + 40), 0);

}

@end
