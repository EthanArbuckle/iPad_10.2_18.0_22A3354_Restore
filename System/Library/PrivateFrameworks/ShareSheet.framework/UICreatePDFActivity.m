@implementation UICreatePDFActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.MarkupAsPDF");
}

- (id)_systemImageName
{
  return CFSTR("pencil.tip.crop.circle");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Markup[Markup]"), CFSTR("Markup"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setupQuickLookWithURL:(id)a3 activityItems:(id)a4 isPreview:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  UICreatePDFActivityItem *v10;
  UICreatePDFActivityItem *previewURLItem;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(UICreatePDFActivityItem);
  previewURLItem = self->_previewURLItem;
  self->_previewURLItem = v10;

  -[UICreatePDFActivityItem setPreviewItemURL:](self->_previewURLItem, "setPreviewItemURL:", v8);
  if (v5)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v17, "jobName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_17;
    }
    else
    {
LABEL_10:

    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedInfoDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("CFBundleDisplayName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "infoDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", CFSTR("CFBundleDisplayName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "infoDictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", CFSTR("CFBundleName"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          _ShareSheetBundle();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Untitled[Markup]"), CFSTR("Untitled"), CFSTR("Localizable"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    v28 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringFromDate:dateStyle:timeStyle:", v29, 2, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ - %@"), v22, v30, (_QWORD)v45);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    if ((unint64_t)objc_msgSend(v18, "length") >= 0x81)
    {
      v31 = objc_msgSend(v18, "rangeOfComposedCharacterSequenceAtIndex:", 128);
      objc_msgSend(v18, "substringToIndex:", v31 + v32);
      v33 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v33;
    }
    v34 = SanitizeStringForUseAsFileName_onceToken;
    v35 = v18;
    if (v34 != -1)
      dispatch_once(&SanitizeStringForUseAsFileName_onceToken, &__block_literal_global_207);
    objc_msgSend(v35, "componentsSeparatedByCharactersInSet:", SanitizeStringForUseAsFileName___illegalFileNameCharacters);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "componentsJoinedByString:", CFSTR(" | "));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "pathExtension");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringByAppendingPathExtension:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "URLByAppendingPathComponent:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeItemAtURL:error:", v41, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "moveItemAtURL:toURL:error:", v8, v41, 0);

    if (v44)
      -[UICreatePDFActivityItem setPreviewItemURL:](self->_previewURLItem, "setPreviewItemURL:", v41);

  }
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICreatePDFActivity;
  if (-[UIPrintActivity canPerformWithActivityItems:](&v7, sel_canPerformWithActivityItems_, v4)
    && !-[UIPrintActivity isContentManaged](self, "isContentManaged")
    && (_UIActivityItemTypes() & 0xA0) != 0)
  {
    v5 = !_UIActivityHasAtMoreThan(v4, 128, 1);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  QLPreviewController *v5;
  QLPreviewController *previewController;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIImage *v12;
  UIImage *v13;
  UIImage *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  UICreatePDFActivityPrintPaper *v31;
  void *v32;
  UICreatePDFActivity *v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (QLPreviewController *)objc_alloc_init(getQLPreviewControllerClass());
  previewController = self->_previewController;
  self->_previewController = v5;

  -[QLPreviewController setAppearanceActions:](self->_previewController, "setAppearanceActions:", 4);
  _UIShimSetIsContentManaged(self->_previewController, -[UIPrintActivity isContentManaged](self, "isContentManaged"));
  -[QLPreviewController setDataSource:](self->_previewController, "setDataSource:", self);
  v33 = self;
  -[QLPreviewController setDelegate:](self->_previewController, "setDelegate:", self);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
LABEL_3:
    v11 = 0;
    v34 = v9;
    while (1)
    {
      if (*(_QWORD *)v39 != v10)
        objc_enumerationMutation(v7);
      v12 = *(UIImage **)(*((_QWORD *)&v38 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[UIImage isFileURL](v12, "isFileURL"))
          break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v10;
        v16 = v7;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "temporaryDirectory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR(".png"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLByAppendingPathComponent:", v21);
        v13 = (UIImage *)objc_claimAutoreleasedReturnValue();

        UIImagePNGRepresentation(v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "writeToURL:atomically:", v13, 1);

        if (v23)
        {
          v7 = v16;
          v10 = v15;
          v9 = v34;
          goto LABEL_14;
        }
        v14 = 0;
        v7 = v16;
        v10 = v15;
        v9 = v34;
LABEL_16:

        if (v14)
        {
          -[UICreatePDFActivity _setupQuickLookWithURL:activityItems:isPreview:](v33, "_setupQuickLookWithURL:activityItems:isPreview:", v14, v7, 0);

          goto LABEL_21;
        }
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
    v13 = v12;
    if (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintURL:", v13)
      && (-[objc_class canPreviewItem:](getQLPreviewControllerClass(), "canPreviewItem:", v13) & 1) != 0)
    {
LABEL_14:
      v13 = v13;
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_16;
  }
LABEL_19:

  v37.receiver = v33;
  v37.super_class = (Class)UICreatePDFActivity;
  -[UIPrintActivity prepareWithActivityItems:](&v37, sel_prepareWithActivityItems_, v7);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;

  -[UIPrintActivity printInteractionController](v33, "printInteractionController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_setupPrintPanel:", 0);

  -[UIPrintActivity printInteractionController](v33, "printInteractionController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[UICreatePDFActivityPrintPaper initWithPaperSize:]([UICreatePDFActivityPrintPaper alloc], "initWithPaperSize:", v26 + -144.0, v28 + -72.0);
  objc_msgSend(v30, "setPaper:", v31);

  -[UIPrintActivity printInteractionController](v33, "printInteractionController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke;
  v35[3] = &unk_1E4002B18;
  v35[4] = v33;
  v36 = v7;
  objc_msgSend(v32, "_generatePrintPreview:", v35);

LABEL_21:
}

void __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke_2;
  block[3] = &unk_1E4001730;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__UICreatePDFActivity_prepareWithActivityItems___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setupQuickLookWithURL:activityItems:isPreview:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "reloadData");
  objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cleanPrintState");

}

- (id)_embeddedActivityViewController
{
  return 0;
}

- (id)activityViewController
{
  return self->_previewController;
}

- (void)_cleanup
{
  UICreatePDFActivityItem *previewURLItem;
  QLPreviewController *previewController;
  objc_super v5;

  previewURLItem = self->_previewURLItem;
  self->_previewURLItem = 0;

  previewController = self->_previewController;
  self->_previewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)UICreatePDFActivity;
  -[UIPrintActivity _cleanup](&v5, sel__cleanup);
}

- (BOOL)previewController:(id)a3 canEditItem:(id)a4
{
  return 1;
}

- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4
{
  return 1;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[UICreatePDFActivity activityType](self, "activityType", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  UICreatePDFActivityItem *previewURLItem;

  previewURLItem = self->_previewURLItem;
  if (previewURLItem)
    return previewURLItem;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", &stru_1E4004990);
}

- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3
{
  return 0;
}

- (BOOL)shouldPresentDismissActionsWithoutEditedItemsForPreviewController:(id)a3
{
  return 1;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  Class QLDismissActionClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  Class v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  UICreatePDFActivity *v22;
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICreatePDFActivityItem previewItemURL](self->_previewURLItem, "previewItemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    QLDismissActionClass = (Class)getQLDismissActionClass();
    _ShareSheetBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Save File to...[Markup]"), CFSTR("Save File To…"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __58__UICreatePDFActivity_dismissActionsForPreviewController___block_invoke;
    v21 = &unk_1E4002B40;
    v22 = self;
    v23 = v4;
    -[objc_class actionWithTitle:image:alertStyle:shouldDismissQuickLookAutomatically:handler:](QLDismissActionClass, "actionWithTitle:image:alertStyle:shouldDismissQuickLookAutomatically:handler:", v10, v7, 0, 0, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v11, v18, v19, v20, v21, v22);
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (Class)getQLDismissActionClass();
  _ShareSheetBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Delete PDF[Markup]"), CFSTR("Delete PDF"), CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class actionWithTitle:image:alertStyle:shouldDismissQuickLookAutomatically:handler:](v13, "actionWithTitle:image:alertStyle:shouldDismissQuickLookAutomatically:handler:", v15, v12, 2, 1, &__block_literal_global_18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v16);
  return v5;
}

void __58__UICreatePDFActivity_dismissActionsForPreviewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "previewItemURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
    goto LABEL_6;
  }
  objc_msgSend(v7, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editedFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3730]), "initWithURL:inMode:", v5, 2);
  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v6, 1, 0);

LABEL_6:
}

- (void)previewControllerDidDismiss:(id)a3
{
  -[UIPrintActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  -[UIPrintActivity activityDidFinish:](self, "activityDidFinish:", 1, a4);
}

- (QLPreviewController)previewController
{
  return self->_previewController;
}

- (void)setPreviewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewController, a3);
}

- (UICreatePDFActivityItem)previewURLItem
{
  return self->_previewURLItem;
}

- (void)setPreviewURLItem:(id)a3
{
  objc_storeStrong((id *)&self->_previewURLItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURLItem, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
}

@end
