@implementation UIPrintActivity

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
  return CFSTR("com.apple.UIKit.activity.Print");
}

- (id)_systemImageName
{
  return CFSTR("printer");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Print[Activity]"), CFSTR("Print"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D80C28], "isPrintingAvailable") || (_UIActivityItemTypes() & 0x40) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else if ((_UIActivityItemTypes() & 0xA2) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = v3;
    v4 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintData:", v9, (_QWORD)v10) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || !objc_msgSend(v9, "isFileURL")
              || (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintURL:", v9) & 1) == 0)
            {
              continue;
            }
          }
          LOBYTE(v4) = 1;
          goto LABEL_21;
        }
        v4 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_21:

  }
  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  BOOL v38;
  __int16 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (!v7)
    goto LABEL_14;
  v8 = v7;
  v9 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIPrintActivity printInteractionController](self, "printInteractionController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPrintPageRenderer:", v11);
LABEL_13:

        v5 = 0;
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIPrintActivity printInteractionController](self, "printInteractionController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPrintFormatter:", v11);
        goto LABEL_13;
      }
      ScanForPrintingItems(v11, v5, (char *)&v39 + 1, (char *)&v39, &v38);
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v8)
      continue;
    break;
  }
LABEL_14:

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPrintingItems:", v5);
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrintingItem:", v13);

LABEL_18:
  }
  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPrintInfo:", 0);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UIPrintActivity printInteractionController](self, "printInteractionController", (_QWORD)v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setPrintInfo:", v21);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "printInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 || !HIBYTE(v39))
    {
LABEL_33:

    }
    else
    {
      v25 = v39;

      if (!v25)
      {
        objc_msgSend(MEMORY[0x1E0D80C20], "printInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setOutputType:", 1);
        -[UIPrintActivity printInteractionController](self, "printInteractionController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setPrintInfo:", v23);
        goto LABEL_33;
      }
    }
  }
  -[UIPrintActivity printInteractionController](self, "printInteractionController", (_QWORD)v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShowsPaperSelectionForLoadedPapers:", 1);

  v27 = -[UIPrintActivity isContentManaged](self, "isContentManaged");
  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setIsContentManaged:", v27);

  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPrintActivityDelegate:", self);

}

- (id)_embeddedActivityViewController
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIViewController *wrapperViewController;
  UIPrintActivityWrapperNavigationController *v11;
  void *v12;
  UIViewController *v13;
  UIViewController *v14;
  UIViewController *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "userInterfaceIdiom"))
  {

    goto LABEL_13;
  }
  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_canShowPreview");

  if ((v5 & 1) != 0)
  {
LABEL_13:
    v15 = 0;
    return v15;
  }
  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printPageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "printFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_7:

      goto LABEL_8;
    }
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "printingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      goto LABEL_7;
    }
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "printingItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
      goto LABEL_9;
    if (self->_wrapperViewController)
      -[UIPrintActivity activityDidFinish:](self, "activityDidFinish:", 0);
    goto LABEL_13;
  }
LABEL_8:

LABEL_9:
  wrapperViewController = self->_wrapperViewController;
  if (!wrapperViewController)
  {
    v11 = [UIPrintActivityWrapperNavigationController alloc];
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__UIPrintActivity__embeddedActivityViewController__block_invoke;
    v20[3] = &unk_1E4003390;
    v20[4] = self;
    v13 = -[UIPrintActivityWrapperNavigationController initWithPrintInteractionController:completion:](v11, "initWithPrintInteractionController:completion:", v12, v20);
    v14 = self->_wrapperViewController;
    self->_wrapperViewController = v13;

    wrapperViewController = self->_wrapperViewController;
  }
  v15 = wrapperViewController;
  return v15;
}

uint64_t __50__UIPrintActivity__embeddedActivityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];

  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printPageRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_6;
  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    -[UIPrintActivity printInteractionController](self, "printInteractionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow windowScene](self->_windowHoldingActivityViewController, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__UIPrintActivity_performActivity__block_invoke;
    v12[3] = &unk_1E4003368;
    v12[4] = self;
    objc_msgSend(v7, "_presentAnimated:hostingScene:completionHandler:", 1, v8, v12);

    return;
  }
  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "printingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_5;
  }
  -[UIPrintActivity printInteractionController](self, "printInteractionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "printingItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
    goto LABEL_7;
  -[UIPrintActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

uint64_t __34__UIPrintActivity_performActivity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:");
}

- (void)cancelPrintOptions
{
  -[UIPrintActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (UIPrintInteractionController)printInteractionController
{
  UIPrintInteractionController *printInteractionController;
  UIPrintInteractionController *v4;
  UIPrintInteractionController *v5;

  printInteractionController = self->_printInteractionController;
  if (!printInteractionController)
  {
    v4 = (UIPrintInteractionController *)objc_alloc_init(MEMORY[0x1E0D80C28]);
    v5 = self->_printInteractionController;
    self->_printInteractionController = v4;

    printInteractionController = self->_printInteractionController;
  }
  return printInteractionController;
}

- (void)activityDidFinish:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPrintActivity;
  -[UIActivity activityDidFinish:](&v4, sel_activityDidFinish_, a3);
  -[UIPrintActivity setWrapperViewController:](self, "setWrapperViewController:", 0);
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  return self->_wrapperViewController;
}

- (id)printInteractionControllerWindowForPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  -[UIPrintActivity windowHoldingActivityViewController](self, "windowHoldingActivityViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[UIPrintActivity windowHoldingActivityViewController](self, "windowHoldingActivityViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIPrintActivity windowHoldingActivityViewController](self, "windowHoldingActivityViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSString)sourceApplicationBundleID
{
  return self->_sourceApplicationBundleID;
}

- (void)setSourceApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UIViewController)wrapperViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 136, 1);
}

- (void)setWrapperViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setPrintInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_printInteractionController, a3);
}

- (UIWindow)windowHoldingActivityViewController
{
  return (UIWindow *)objc_getProperty(self, a2, 152, 1);
}

- (void)setWindowHoldingActivityViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowHoldingActivityViewController, 0);
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
}

@end
