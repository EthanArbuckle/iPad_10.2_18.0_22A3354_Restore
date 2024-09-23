@implementation UIPrintInteractionController

- (void)dismissAnimated:(BOOL)animated
{
  -[UIPrintInteractionController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", animated, 0);
}

- (UIPrintInteractionController)init
{
  UIPrintInteractionController *v2;
  UIPrintInteractionController *v3;
  NSOperationQueue *v4;
  NSOperationQueue *previewQueue;
  uint64_t v6;
  NSMutableSet *previewStates;
  NSObject *v8;
  NSObject *webKitFormatterMutex;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIPrintInteractionController;
  v2 = -[UIPrintInteractionController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    previewQueue = v3->_previewQueue;
    v3->_previewQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_previewQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v3->_previewQueue, "setName:", CFSTR("com.apple.UIKit.UIPrintInteractionController.printPreviewGeneration"));
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    previewStates = v3->_previewStates;
    v3->_previewStates = (NSMutableSet *)v6;

    v3->_showsNumberOfCopies = 1;
    v3->_showsPaperOrientation = 1;
    v3->_showsScalingFactor = 1;
    v8 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    webKitFormatterMutex = v3->_webKitFormatterMutex;
    v3->_webKitFormatterMutex = v8;

  }
  return v3;
}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(void);

  v4 = a3;
  v7 = (void (**)(void))a4;
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    self->_supressNotifyDismissed = 1;
    -[UIPrintInteractionController printPanelViewController](self, "printPanelViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissAnimated:completionHandler:", v4, v7);

  }
  else if (v7)
  {
    v7[2]();
  }

}

- (BOOL)printStateActive
{
  return self->_printStateActive;
}

+ (BOOL)isPrintingAvailable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAirPrintAllowed");

  return v3;
}

+ (NSSet)printableUTIs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CFArrayRef v8;
  uint64_t v9;
  void *v10;

  v2 = (void *)printableUTIs___printableUTIs;
  if (!printableUTIs___printableUTIs)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)printableUTIs___printableUTIs;
    printableUTIs___printableUTIs = v6;

    v8 = CGImageSourceCopyTypeIdentifiers();
    v2 = (void *)printableUTIs___printableUTIs;
    if (v8)
    {
      objc_msgSend((id)printableUTIs___printableUTIs, "setByAddingObjectsFromArray:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)printableUTIs___printableUTIs;
      printableUTIs___printableUTIs = v9;

      v2 = (void *)printableUTIs___printableUTIs;
    }
  }
  return (NSSet *)v2;
}

+ (BOOL)canPrintURL:(NSURL *)url
{
  void *v3;
  BOOL v4;

  GetImageUTI(0, url);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)canPrintData:(NSData *)data
{
  void *v3;
  BOOL v4;

  GetImageUTI(data, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (UIPrintInteractionController)sharedPrintController
{
  void *v2;
  UIPrintInteractionController *v3;
  void *v4;

  v2 = (void *)__sharedPrintController;
  if (!__sharedPrintController)
  {
    v3 = objc_alloc_init(UIPrintInteractionController);
    v4 = (void *)__sharedPrintController;
    __sharedPrintController = (uint64_t)v3;

    v2 = (void *)__sharedPrintController;
  }
  return (UIPrintInteractionController *)v2;
}

- (void)dealloc
{
  unint64_t v3;
  void *v4;
  id completionHandler;
  NSOperationQueue *previewQueue;
  objc_super v7;

  v3 = *MEMORY[0x1E0DC4878];
  if (self->_backgroundTaskIdentifier != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_endBackgroundTask:", self->_backgroundTaskIdentifier);

    self->_backgroundTaskIdentifier = v3;
  }
  -[UIPrintInteractionController _cancelPreviewQueue:completionHandler:](self, "_cancelPreviewQueue:completionHandler:", 1, 0);
  -[UIPrintInteractionController _cleanPrintState](self, "_cleanPrintState");
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  previewQueue = self->_previewQueue;
  self->_previewQueue = 0;

  v7.receiver = self;
  v7.super_class = (Class)UIPrintInteractionController;
  -[UIPrintInteractionController dealloc](&v7, sel_dealloc);
}

- (void)_cancelPreviewQueue:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  NSOperationQueue *previewQueue;
  NSOperationQueue *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  previewQueue = self->_previewQueue;
  if (previewQueue)
  {
    if (v4)
      -[NSOperationQueue cancelAllOperations](previewQueue, "cancelAllOperations");
    if (v6)
    {
      v8 = self->_previewQueue;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __70__UIPrintInteractionController__cancelPreviewQueue_completionHandler___block_invoke;
      v9[3] = &unk_1E9D96EC8;
      v10 = v6;
      -[NSOperationQueue addBarrierBlock:](v8, "addBarrierBlock:", v9);

    }
  }
  else if (v6)
  {
    v6[2](v6);
  }

}

uint64_t __70__UIPrintInteractionController__cancelPreviewQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPrintingItem:(id)printingItem
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = printingItem;
  if (self->_printingItem != v4)
  {
    v7 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (id)objc_msgSend(v7, "copy");
    else
      v5 = v7;
    v6 = self->_printingItem;
    self->_printingItem = v5;

    v4 = v7;
  }

}

- (void)updatePrintingItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *v11;
  NSArray *printingItems;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_printingItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          if (objc_msgSend(v10, "isFileURL", (_QWORD)v13)
            && IsPrintablePDFURL(v10, 0, 0)
            && !-[UIPrintInteractionController _canPrintPDFURL:](self, "_canPrintPDFURL:", v10))
          {
            objc_msgSend(v3, "addObject:", v10);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_printingItems);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray removeObjectsInArray:](v11, "removeObjectsInArray:", v3);
    printingItems = self->_printingItems;
    self->_printingItems = v11;

  }
}

- (BOOL)_presentAnimated:(BOOL)a3 hostingScene:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  int v21;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t *v40;
  id v41;
  BOOL v42;
  id location;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  UIPrintInteractionController *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v35 = a5;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_findUISceneForLegacyInterfaceOrientation");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UIPrintInteractionController setHostingWindowScene:](self, "setHostingWindowScene:", v8, v35);
  -[UIPrintInteractionController printingItems](self, "printingItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (unint64_t)objc_msgSend(v10, "count") > 1;

  if (v11
    && (-[UIPrintInteractionController updatePrintingItems](self, "updatePrintingItems"),
        -[UIPrintInteractionController printingItems](self, "printingItems"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count") == 0,
        v12,
        v13))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v8);
    objc_storeStrong((id *)&self->_alertWindow, v23);
    objc_msgSend(v23, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v24);

    objc_msgSend(v23, "setWindowLevel:", *MEMORY[0x1E0DC5638]);
    v25 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    objc_msgSend(v23, "setRootViewController:", v25);
    objc_msgSend(v23, "makeKeyAndVisible");
    v26 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Protected PDF files can only be printed separately."), CFSTR("Protected PDF files can only be printed separately."), CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "alertControllerWithTitle:message:preferredStyle:", v28, 0, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("PRINT_INTERACTION_OK_BUTTON"), CFSTR("OK"), CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke;
    v48[3] = &unk_1E9D96EF0;
    v33 = v29;
    v49 = v33;
    v50 = self;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 0, v48);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addAction:", v34);

    objc_msgSend(v25, "presentViewController:animated:completion:", v33, 0, 0);
    v21 = *((unsigned __int8 *)v52 + 24);

  }
  else
  {
    -[UIPrintInteractionController setUsingWebKitFormatter:](self, "setUsingWebKitFormatter:", 0);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[UIPrintInteractionController printPageRenderer](self, "printPageRenderer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "printFormatters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend((id)objc_opt_class(), "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("_WKWebViewPrintFormatter"));

          if (v20)
          {
            -[UIPrintInteractionController setUsingWebKitFormatter:](self, "setUsingWebKitFormatter:", 1);
            goto LABEL_15;
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_15:

    objc_initWeak(&location, self);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke_2;
    v37[3] = &unk_1E9D96F18;
    objc_copyWeak(&v41, &location);
    v40 = &v51;
    v37[4] = self;
    v39 = v36;
    v42 = a3;
    v38 = v8;
    -[UIPrintInteractionController _ensurePDFIsUnlockedFirstAttempt:completionHandler:](self, "_ensurePDFIsUnlockedFirstAttempt:completionHandler:", 1, v37);
    v21 = *((unsigned __int8 *)v52 + 24);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v51, 8);

  return v21 != 0;
}

void __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setHidden:", 1);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

void __80__UIPrintInteractionController__presentAnimated_hostingScene_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  id *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && (a2 & 1) == 0)
  {
    v8 = WeakRetained;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setupPrintPanel:forPDFGenerationOnly:", *(_QWORD *)(a1 + 48), 0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(v8[32], "pdfPassword");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        objc_msgSend(v8, "_updatePrintInfoWithAnnotations");
      v6 = objc_loadWeakRetained(v8 + 16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "printInteractionControllerWillPresentPrinterOptions:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v8, "printPanelViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentPrintPanelAnimated:hostingScene:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40));

    }
    else
    {
      objc_msgSend(v8, "_endPrintJobWithAction:error:", 0, 0);
    }
    WeakRetained = v8;
  }

}

- (BOOL)presentAnimated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  return -[UIPrintInteractionController _presentAnimated:hostingScene:completionHandler:](self, "_presentAnimated:hostingScene:completionHandler:", animated, 0, completion);
}

- (BOOL)presentFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  _BOOL8 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *v13;
  UIPrintInteractionCompletionHandler v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  _QWORD v26[5];
  UIView *v27;
  id v28[5];
  BOOL v29;
  id location;

  v7 = animated;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v13 = view;
  v14 = completion;
  -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[UIView window](v13, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController setHostingWindowScene:](self, "setHostingWindowScene:", v17);

    -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_findUISceneForLegacyInterfaceOrientation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintInteractionController setHostingWindowScene:](self, "setHostingWindowScene:", v20);

    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if (v22)
  {
    NSLog(CFSTR("WARNING: -[UIPrintInteractionController presentFromRect:animated:completionHandler:] called on iPhone."));
    -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[UIPrintInteractionController _presentAnimated:hostingScene:completionHandler:](self, "_presentAnimated:hostingScene:completionHandler:", v7, v23, v14);

  }
  else
  {
    v24 = 0;
    if (-[UIPrintInteractionController _setupPrintPanel:forPDFGenerationOnly:](self, "_setupPrintPanel:forPDFGenerationOnly:", v14, 0))
    {
      objc_initWeak(&location, self);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __82__UIPrintInteractionController_presentFromRect_inView_animated_completionHandler___block_invoke;
      v26[3] = &unk_1E9D96F40;
      objc_copyWeak(v28, &location);
      v26[4] = self;
      v28[1] = *(id *)&x;
      v28[2] = *(id *)&y;
      v28[3] = *(id *)&width;
      v28[4] = *(id *)&height;
      v27 = v13;
      v29 = v7;
      -[UIPrintInteractionController _ensurePDFIsUnlockedFirstAttempt:completionHandler:](self, "_ensurePDFIsUnlockedFirstAttempt:completionHandler:", 1, v26);

      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
      v24 = 1;
    }
  }

  return v24;
}

void __82__UIPrintInteractionController_presentFromRect_inView_animated_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if ((a2 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_endPrintJobWithAction:error:", 0, 0);
    }
    else
    {
      objc_msgSend(WeakRetained[32], "pdfPassword");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        objc_msgSend(v8, "_updatePrintInfoWithAnnotations");
      v6 = objc_loadWeakRetained(v8 + 16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "printInteractionControllerWillPresentPrinterOptions:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v8, "printPanelViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentPrintPanelFromRect:inView:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

    }
    WeakRetained = v8;
  }

}

- (BOOL)presentFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  _BOOL8 v6;
  UIBarButtonItem *v8;
  UIPrintInteractionCompletionHandler v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  _QWORD v22[5];
  UIBarButtonItem *v23;
  id v24;
  BOOL v25;
  id location;

  v6 = animated;
  v8 = item;
  v9 = completion;
  -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[UIBarButtonItem _viewForPresenting](v8, "_viewForPresenting");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController setHostingWindowScene:](self, "setHostingWindowScene:", v13);

    -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_findUISceneForLegacyInterfaceOrientation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintInteractionController setHostingWindowScene:](self, "setHostingWindowScene:", v16);

    }
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18)
  {
    v19 = 0;
    if (-[UIPrintInteractionController _setupPrintPanel:forPDFGenerationOnly:](self, "_setupPrintPanel:forPDFGenerationOnly:", v9, 0))
    {
      objc_initWeak(&location, self);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __84__UIPrintInteractionController_presentFromBarButtonItem_animated_completionHandler___block_invoke;
      v22[3] = &unk_1E9D96F68;
      objc_copyWeak(&v24, &location);
      v22[4] = self;
      v23 = v8;
      v25 = v6;
      -[UIPrintInteractionController _ensurePDFIsUnlockedFirstAttempt:completionHandler:](self, "_ensurePDFIsUnlockedFirstAttempt:completionHandler:", 1, v22);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      v19 = 1;
    }
  }
  else
  {
    NSLog(CFSTR("WARNING: -[UIPrintInteractionController presentFromBarButtonItem:animated:completionHandler:] called on iPhone."));
    -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[UIPrintInteractionController _presentAnimated:hostingScene:completionHandler:](self, "_presentAnimated:hostingScene:completionHandler:", v6, v20, v9);

  }
  return v19;
}

void __84__UIPrintInteractionController_presentFromBarButtonItem_animated_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if ((a2 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_endPrintJobWithAction:error:", 0, 0);
    }
    else
    {
      objc_msgSend(WeakRetained[32], "pdfPassword");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        objc_msgSend(v8, "_updatePrintInfoWithAnnotations");
      v6 = objc_loadWeakRetained(v8 + 16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "printInteractionControllerWillPresentPrinterOptions:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v8, "printPanelViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentPrintPanelFromBarButtonItem:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

    }
    WeakRetained = v8;
  }

}

- (BOOL)printToPrinter:(UIPrinter *)printer completionHandler:(UIPrintInteractionCompletionHandler)completion
{
  UIPrinter *v6;
  UIPrintInteractionCompletionHandler v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  UIPrintInfo *printInfo;
  UIPrintInfo *v13;
  UIPrintInfo *activePrintInfo;
  void *v15;
  id printingItem;
  NSArray *printingItems;
  UITallPDFPrintFormatter *v18;
  id v19;
  void *v20;
  uint64_t v21;
  UITallPDFPrintFormatter *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PKPrinter *v30;
  UIPrintingProgress *printingProgress;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UIPrintingProgress *v36;
  void *v37;
  UIPrintingProgress *v38;
  UIPrintingProgress *v39;
  _QWORD v41[4];
  UIPrinter *v42;
  UIPrintInteractionController *v43;
  _QWORD v44[5];
  _QWORD v45[5];

  v6 = printer;
  v7 = completion;
  if (!+[UIPrintInteractionController isPrintingAvailable](UIPrintInteractionController, "isPrintingAvailable"))goto LABEL_9;
  if (!self->_printingItem
    && !-[NSArray count](self->_printingItems, "count")
    && !self->_printFormatter
    && !self->_printPageRenderer)
  {
    NSLog(CFSTR("ERROR: attempting to display print options with no printing source (item/items/formatter/renderer) set"));
LABEL_9:
    v10 = 0;
    goto LABEL_31;
  }
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    -[UIPrintInteractionController printPanelViewController](self, "printPanelViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UIPrintInteractionController printPanelViewController](self, "printPanelViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissAnimated:completionHandler:", 1, 0);

      -[UIPrintInteractionController setPrintPanelViewController:](self, "setPrintPanelViewController:", 0);
    }
    goto LABEL_9;
  }
  -[UIPrintInteractionController setPrintStateActive:](self, "setPrintStateActive:", 1);
  v11 = (void *)objc_msgSend(v7, "copy");
  -[UIPrintInteractionController set_completionHandler:](self, "set_completionHandler:", v11);

  printInfo = self->_printInfo;
  if (printInfo)
  {
    v13 = (UIPrintInfo *)-[UIPrintInfo copy](printInfo, "copy");
  }
  else
  {
    +[UIPrintInfo printInfo](UIPrintInfo, "printInfo");
    v13 = (UIPrintInfo *)objc_claimAutoreleasedReturnValue();
  }
  activePrintInfo = self->_activePrintInfo;
  self->_activePrintInfo = v13;

  -[UIPrintInfo setDuplex:](self->_activePrintInfo, "setDuplex:", 0);
  if (-[NSArray count](self->_printingItems, "count") == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_printingItems, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    printingItem = self->_printingItem;
    self->_printingItem = v15;

    printingItems = self->_printingItems;
    self->_printingItems = 0;

  }
  -[UIPrintInteractionController _updatePrintInfoWithAnnotations](self, "_updatePrintInfoWithAnnotations");
  if (self->_printingItem
    && -[UIPrintInteractionController _printingItemIsReallyTallPDF](self, "_printingItemIsReallyTallPDF"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = [UITallPDFPrintFormatter alloc];
      v19 = self->_printingItem;
      -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[UITallPDFPrintFormatter initWithPDFURL:pdfPassword:](v18, "initWithPDFURL:pdfPassword:", v19, v20);
LABEL_21:
      v24 = (void *)v21;
      -[UIPrintInteractionController setPrintFormatter:](self, "setPrintFormatter:", v21);

      -[UIPrintInteractionController printFormatter](self, "printFormatter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPerPageContentInsets:", 36.0, 36.0, 36.0, 36.0);

      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = [UITallPDFPrintFormatter alloc];
      v23 = self->_printingItem;
      -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[UITallPDFPrintFormatter initWithPDFData:pdfPassword:](v22, "initWithPDFData:pdfPassword:", v23, v20);
      goto LABEL_21;
    }
  }
LABEL_22:
  -[UIPrinter _internalPrinter](v6, "_internalPrinter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInteractionController setPrinter:](self, "setPrinter:", v26);

  -[UIPrintInteractionController printer](self, "printer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v27, "printInfoSupported");

  -[UIPrintInteractionController printer](self, "printer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = self->_printer;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke;
    v45[3] = &unk_1E9D96F90;
    v45[4] = self;
    -[UIPrintInteractionController _setPrinterInfoState:](self, "_setPrinterInfoState:", _UIPrinterInfoGetState(v30, v45));
  }
  else
  {
    printingProgress = self->_printingProgress;
    if (!printingProgress)
    {
      -[PKPrinter displayName](self->_printer, "displayName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (!v32 || !objc_msgSend(v32, "length"))
      {
        -[UIPrinter URL](v6, "URL");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "host");
        v35 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)v35;
      }
      v36 = [UIPrintingProgress alloc];
      -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_2;
      v44[3] = &unk_1E9D96D90;
      v44[4] = self;
      v38 = -[UIPrintingProgress initWithPrinterName:forceDisplayAsAlert:hostingWindowScene:cancelHandler:](v36, "initWithPrinterName:forceDisplayAsAlert:hostingWindowScene:cancelHandler:", v33, 1, v37, v44);
      v39 = self->_printingProgress;
      self->_printingProgress = v38;

      printingProgress = self->_printingProgress;
    }
    -[UIPrintingProgress setPrinterInfoState:](printingProgress, "setPrinterInfoState:", 0);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_3;
    v41[3] = &unk_1E9D96FB8;
    v42 = v6;
    v43 = self;
    -[UIPrinter contactPrinter:](v42, "contactPrinter:", v41);

  }
  v10 = 1;
LABEL_31:

  return v10;
}

uint64_t __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPrinterInfoState:", a2);
}

uint64_t __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endPrintJobWithAction:error:", 0, 0);
}

void __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "_internalPrinter"), (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v4 = (void *)v3, v5 = objc_msgSend(*(id *)(a1 + 40), "printStateActive"), v4, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_internalPrinter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setPrinter:", v6);

    v7 = *(_QWORD **)(a1 + 40);
    v8 = (void *)v7[12];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_4;
    v11[3] = &unk_1E9D96F90;
    v11[4] = v7;
    objc_msgSend(v7, "_setPrinterInfoState:", _UIPrinterInfoGetState(v8, v11));
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "printStateActive"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_setPrinterInfoState:", 2);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 4, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_endPrintJobWithAction:error:", 0, v10);

  }
}

uint64_t __65__UIPrintInteractionController_printToPrinter_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPrinterInfoState:", a2);
}

- (void)_cleanPrintState
{
  UIPrintPageRenderer *printPageRenderer;
  UIPrintFormatter *printFormatter;
  id printingItem;
  NSArray *printingItems;
  UIPrintPaper *printPaper;
  NSMutableSet *previewStates;
  NSURL *tempPreviewFileURL;
  UIPrintPaper *paper;
  UIPrintPanelViewController *printPanelViewController;
  UIPrintingProgress *printingProgress;
  PKPrintSettings *printSettings;
  UIPrintInfo *activePrintInfo;
  UIPrintPageRenderer *formatterRenderer;
  NSURL *saveFileURL;
  NSArray *pageRanges;
  PKPrinter *printer;
  UIWindowScene *hostingWindowScene;

  printPageRenderer = self->_printPageRenderer;
  self->_printPageRenderer = 0;

  printFormatter = self->_printFormatter;
  self->_printFormatter = 0;

  printingItem = self->_printingItem;
  self->_printingItem = 0;

  printingItems = self->_printingItems;
  self->_printingItems = 0;

  printPaper = self->_printPaper;
  self->_printPaper = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_printActivityDelegate, 0);
  *(_DWORD *)&self->_showsPageRange = 16777472;
  self->_isContentManaged = 0;
  self->_printStateActive = 0;
  previewStates = self->_previewStates;
  self->_pageCountWithRanges = 0;
  self->_previewStates = 0;

  tempPreviewFileURL = self->_tempPreviewFileURL;
  self->_tempPreviewFileURL = 0;

  paper = self->_paper;
  self->_paper = 0;

  self->_currentPage = 0;
  self->_pagesDrawn = 0;
  self->_currentRange.location = 0;
  self->_currentRange.length = 0;
  printPanelViewController = self->_printPanelViewController;
  self->_printPanelViewController = 0;

  printingProgress = self->_printingProgress;
  self->_printingProgress = 0;

  printSettings = self->_printSettings;
  self->_printSettings = 0;

  activePrintInfo = self->_activePrintInfo;
  self->_activePrintInfo = 0;

  self->_printerInfoState = 0;
  self->_supressNotifyDismissed = 0;
  formatterRenderer = self->_formatterRenderer;
  self->_formatterRenderer = 0;

  self->_manualPrintPageEnabled = 0;
  saveFileURL = self->_saveFileURL;
  self->_saveFileURL = 0;

  self->_showPrintingProgress = 0;
  self->_pageCount = 0;
  pageRanges = self->_pageRanges;
  self->_pageRanges = 0;

  printer = self->_printer;
  self->_printer = 0;

  hostingWindowScene = self->_hostingWindowScene;
  self->_hostingWindowScene = 0;

}

- (id)_currentPrintInfo
{
  UIPrintInfo *activePrintInfo;

  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
    activePrintInfo = self->_activePrintInfo;
  else
    activePrintInfo = 0;
  return activePrintInfo;
}

- (CGSize)_printItemContentSize:(id)a3
{
  id v4;
  UIPrintInfo *activePrintInfo;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  double width;
  double height;
  BOOL v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  CGDataProvider *v16;
  CGDataProvider *v17;
  CGPDFDocument *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  CGPDFPage *v23;
  CGImageSource *v24;
  CGImageSource *v25;
  CGImage *v26;
  CGImage *v27;
  CGPDFDocumentRef v28;
  CGPDFDocument *v29;
  uint64_t v30;
  void *v31;
  _BOOL4 IsEncrypted;
  id v33;
  CGPDFPage *Page;
  id v35;
  unint64_t v36;
  CGImageSource *v37;
  CGImageSource *v38;
  CGImage *ImageAtIndex;
  CGImage *v40;
  double v41;
  double v42;
  CGSize result;
  CGRect v44;
  CGRect BoxRect;

  v4 = a3;
  activePrintInfo = self->_activePrintInfo;
  if (activePrintInfo)
    v6 = (-[UIPrintInfo outputType](activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1;
  else
    v6 = 0;
  -[PKPrinter availableRollPapersPreferBorderless:](self->_printer, "availableRollPapersPreferBorderless:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  width = *MEMORY[0x1E0C9D820];
  height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v8)
    v11 = v4 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "size");
      width = v12;
      height = v13;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v4;
        if (IsAssetURL(v14))
        {
          GetPHAssetForAssetURLSync(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          width = (double)(unint64_t)objc_msgSend(v15, "pixelWidth");
          height = (double)(unint64_t)objc_msgSend(v15, "pixelHeight");

        }
        else if (objc_msgSend(v14, "isFileURL"))
        {
          if (-[UIPrintInteractionController _canPrintPDFURL:](self, "_canPrintPDFURL:", v14))
          {
            v28 = CGPDFDocumentCreateWithURL((CFURLRef)v14);
            if (v28)
            {
              v29 = v28;
              -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
              v30 = objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v31 = (void *)v30;
                IsEncrypted = CGPDFDocumentIsEncrypted(v29);

                if (IsEncrypted)
                {
                  -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
                  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  CGPDFDocumentUnlockWithPassword(v29, (const char *)objc_msgSend(v33, "cStringUsingEncoding:", 4));

                }
              }
              Page = CGPDFDocumentGetPage(v29, 1uLL);
              if (Page)
              {
                BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
                width = BoxRect.size.width;
                height = BoxRect.size.height;
              }
              CGPDFDocumentRelease(v29);
            }
          }
          else
          {
            v37 = CGImageSourceCreateWithURL((CFURLRef)v14, 0);
            if (v37)
            {
              v38 = v37;
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v37, 0, 0);
              if (ImageAtIndex)
              {
                v40 = ImageAtIndex;
                width = (double)CGImageGetWidth(ImageAtIndex);
                height = (double)CGImageGetHeight(v40);
                CGImageRelease(v40);
              }
              CFRelease(v38);
            }
          }
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[UIPrintInteractionController _canPrintPDFData:](self, "_canPrintPDFData:", v4))
          {
            v16 = CGDataProviderCreateWithCFData((CFDataRef)v4);
            if (v16)
            {
              v17 = v16;
              v18 = CGPDFDocumentCreateWithProvider(v16);
              CGDataProviderRelease(v17);
              if (v18)
              {
                -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
                v19 = objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  v20 = (void *)v19;
                  v21 = CGPDFDocumentIsEncrypted(v18);

                  if (v21)
                  {
                    -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
                    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    CGPDFDocumentUnlockWithPassword(v18, (const char *)objc_msgSend(v22, "cStringUsingEncoding:", 4));

                  }
                }
                v23 = CGPDFDocumentGetPage(v18, 1uLL);
                if (v23)
                {
                  v44 = CGPDFPageGetBoxRect(v23, kCGPDFCropBox);
                  width = v44.size.width;
                  height = v44.size.height;
                }
                CGPDFDocumentRelease(v18);
              }
            }
          }
          v24 = CGImageSourceCreateWithData((CFDataRef)v4, 0);
          if (v24)
          {
            v25 = v24;
            v26 = CGImageSourceCreateImageAtIndex(v24, 0, 0);
            if (v26)
            {
              v27 = v26;
              width = (double)CGImageGetWidth(v26);
              height = (double)CGImageGetHeight(v27);
              CGImageRelease(v27);
            }
            CFRelease(v25);
          }
        }
        else
        {
          getPHAssetClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = v4;
            width = (double)(unint64_t)objc_msgSend(v35, "pixelWidth");
            v36 = objc_msgSend(v35, "pixelHeight");

            height = (double)v36;
          }
        }
      }
    }
  }

  v41 = width;
  v42 = height;
  result.height = v42;
  result.width = v41;
  return result;
}

- (CGSize)_printItemContentSize
{
  id printingItem;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  printingItem = self->_printingItem;
  if (printingItem)
  {
    v4 = printingItem;
LABEL_3:
    -[UIPrintInteractionController _printItemContentSize:](self, "_printItemContentSize:", v4);
    v6 = v5;
    v8 = v7;

    goto LABEL_4;
  }
  v6 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[NSArray count](self->_printingItems, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_printingItems, "objectAtIndexedSubscript:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_3;
  }
LABEL_4:
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)_canShowDuplex
{
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char isKindOfClass;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (self->_printingItem)
  {
    v19[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_printingItems;
  }
  v4 = v3;
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {

            v12 = 0;
            goto LABEL_16;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  v12 = (-[UIPrintInfo outputType](self->_activePrintInfo, "outputType", (_QWORD)v14) & 0xFFFFFFFFFFFFFFFDLL) != 1;
LABEL_16:

  return v12;
}

- (BOOL)_canShowPageRange
{
  _BOOL4 v3;

  if (self->_showsPageRange || (v3 = -[UIPrintInteractionController _canPreviewContent](self, "_canPreviewContent")))
  {
    v3 = -[UIPrintInteractionController printStateActive](self, "printStateActive");
    if (v3)
      LOBYTE(v3) = (self->_printPageRenderer || self->_formatterRenderer || self->_printingItem && !self->_printingItems)
                && -[UIPrintInteractionController pageCount](self, "pageCount") > 1;
  }
  return v3;
}

- (BOOL)_canShowPaperList
{
  _BOOL4 v3;

  v3 = -[UIPrintInteractionController printStateActive](self, "printStateActive");
  if (v3)
    LOBYTE(v3) = (-[UIPrintInfo outputType](self->_activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1
              || self->_showsPaperSelectionForLoadedPapers;
  return v3;
}

- (BOOL)_canShowCopies
{
  return self->_showsNumberOfCopies;
}

- (BOOL)_canShowColor
{
  _BOOL4 v3;

  v3 = -[UIPrintInteractionController printStateActive](self, "printStateActive");
  if (v3)
    LOBYTE(v3) = -[UIPrintInfo outputType](self->_activePrintInfo, "outputType") != UIPrintInfoOutputGrayscale
              && -[UIPrintInfo outputType](self->_activePrintInfo, "outputType") != UIPrintInfoOutputPhotoGrayscale;
  return v3;
}

- (BOOL)_canShowStaple
{
  _BOOL4 v3;

  v3 = -[UIPrintInteractionController printStateActive](self, "printStateActive");
  if (v3)
    LOBYTE(v3) = (-[UIPrintInfo outputType](self->_activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 0;
  return v3;
}

- (BOOL)_canShowPunch
{
  _BOOL4 v3;

  v3 = -[UIPrintInteractionController printStateActive](self, "printStateActive");
  if (v3)
    LOBYTE(v3) = (-[UIPrintInfo outputType](self->_activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 0;
  return v3;
}

- (BOOL)_canShowAnnotations
{
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFData *v10;
  CGDataProvider *v11;
  CGDataProvider *v12;
  CGPDFDocument *v13;
  NSArray *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 IsEncrypted;
  id v18;
  size_t NumberOfPages;
  size_t v20;
  size_t v21;
  BOOL v22;
  BOOL v23;
  NSArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (self->_printingItem)
  {
    v31[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_printingItems;
  }
  v4 = v3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = v3;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v25 = v4;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = CGDataProviderCreateWithCFData(v10);
            if (v11)
            {
              v12 = v11;
              v13 = CGPDFDocumentCreateWithProvider(v11);
              CGDataProviderRelease(v12);
              if (v13)
              {
                v14 = v5;
                -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
                v15 = objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  v16 = (void *)v15;
                  IsEncrypted = CGPDFDocumentIsEncrypted(v13);

                  if (IsEncrypted)
                  {
                    -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
                    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    CGPDFDocumentUnlockWithPassword(v13, (const char *)objc_msgSend(v18, "cStringUsingEncoding:", 4));

                  }
                }
                NumberOfPages = CGPDFDocumentGetNumberOfPages(v13);
                if (NumberOfPages)
                {
                  v20 = NumberOfPages;
                  v21 = 0;
                  v22 = 1;
                  do
                  {
                    if (CGPDFDocumentGetPage(v13, ++v21) && CGPDFPageGetAnnotationCount())
                      break;
                    v22 = v20 > v21;
                  }
                  while (v20 != v21);
                  CGPDFDocumentRelease(v13);
                  v5 = v14;
                  if (v22)
                  {

                    v23 = 1;
                    goto LABEL_28;
                  }
                }
                else
                {
                  CGPDFDocumentRelease(v13);
                  v5 = v14;
                }
              }
            }
          }

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
      v23 = 0;
LABEL_28:
      v4 = v25;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)_canShowLayout
{
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (self->_printingItem)
  {
    v20[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_printingItems;
  }
  v4 = v3;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UIPrintInteractionController printInfo](self, "printInfo");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "outputType") & 0xFFFFFFFFFFFFFFFDLL;

            if (v12 == 1)
            {

              v13 = 0;
              goto LABEL_17;
            }
          }

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_17:

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)_canShowOrientation
{
  NSArray *v3;
  BOOL v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!-[UIPrintInteractionController showsPaperOrientation](self, "showsPaperOrientation"))
    return 0;
  if (self->_printingItem)
  {
    v17[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_printingItems;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

          v4 = 0;
          goto LABEL_18;
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = 1;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v4 = 1;
  }
LABEL_18:

  return v4;
}

- (BOOL)_canShowScaling
{
  NSArray *v3;
  BOOL v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!-[UIPrintInteractionController showsPaperOrientation](self, "showsPaperOrientation"))
    return 0;
  if (self->_printingItem)
  {
    v17[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_printingItems;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

          v4 = 0;
          goto LABEL_18;
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = 1;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v4 = 1;
  }
LABEL_18:

  return v4;
}

- (NSArray)pageRanges
{
  UIPrintPageRenderer *printPageRenderer;
  NSArray *formatterRenderer;
  NSArray *pageRanges;

  if (!-[UIPrintInteractionController printStateActive](self, "printStateActive"))
    goto LABEL_11;
  printPageRenderer = self->_printPageRenderer;
  if (!printPageRenderer || !-[UIPrintPageRenderer _numberOfPagesIsCached](printPageRenderer, "_numberOfPagesIsCached"))
  {
    formatterRenderer = (NSArray *)self->_formatterRenderer;
    if (!formatterRenderer)
      return formatterRenderer;
    if (!-[NSArray _numberOfPagesIsCached](formatterRenderer, "_numberOfPagesIsCached"))
    {
LABEL_11:
      formatterRenderer = 0;
      return formatterRenderer;
    }
  }
  pageRanges = self->_pageRanges;
  if ((!pageRanges || !-[NSArray count](pageRanges, "count"))
    && !-[UIPrintInteractionController usingWebKitFormatter](self, "usingWebKitFormatter"))
  {
    -[UIPrintInteractionController _updatePageCount](self, "_updatePageCount");
  }
  formatterRenderer = self->_pageRanges;
  return formatterRenderer;
}

- (void)setPageRanges:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "rangeValue", (_QWORD)v13);
          v9 += v12;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    self->_pageCountWithRanges = v9;
    objc_storeStrong((id *)&self->_pageRanges, a3);
  }

}

- (PKPrinter)printer
{
  PKPrinter *printer;

  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
    printer = self->_printer;
  else
    printer = 0;
  return printer;
}

- (void)setPrinter:(id)a3
{
  PKPrinter *v5;
  PKPrinter **p_printer;
  UIPrintPaper *paper;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  PKPrinter *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  UIPrintInteractionController *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (PKPrinter *)a3;
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    p_printer = &self->_printer;
    if (self->_printer != v5)
    {
      objc_storeStrong((id *)&self->_printer, a3);
      paper = self->_paper;
      self->_paper = 0;

      v25 = self;
      -[UIPrintInfo _updateWithPrinter:](self->_activePrintInfo, "_updateWithPrinter:", v5);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(MEMORY[0x1E0D80A50], "lastUsedPrinters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v9)
      {
        v10 = v9;
        v20 = v5;
        v11 = 0;
        v12 = *(_QWORD *)v28;
        v26 = *MEMORY[0x1E0D80BD8];
        v24 = *MEMORY[0x1E0D80A98];
        v23 = *MEMORY[0x1E0D80AA0];
        v21 = *MEMORY[0x1E0D80AB0];
        v22 = *MEMORY[0x1E0D80AA8];
        while (1)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v8);
            if (*p_printer)
            {
              v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v14, "objectForKey:", v26);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPrinter name](*p_printer, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqualToString:", v16);

              if (v17)
              {
                objc_msgSend(v14, "objectForKey:", v24);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (((objc_msgSend(v18, "isEqualToString:", v23) & 1) != 0
                   || objc_msgSend(v18, "isEqualToString:", v21))
                  && -[UIPrintInfo duplex](v25->_activePrintInfo, "duplex") == UIPrintInfoDuplexNone)
                {
                  v19 = 1;
LABEL_16:
                  -[UIPrintInfo setDuplex:](v25->_activePrintInfo, "setDuplex:", v19);
                }
                else if (objc_msgSend(v18, "isEqualToString:", v22))
                {
                  v19 = 0;
                  goto LABEL_16;
                }
                v11 = v18;
                continue;
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (!v10)
          {

            v5 = v20;
            if (!v11)
              goto LABEL_23;
            goto LABEL_28;
          }
        }
      }

LABEL_23:
      if (-[UIPrintInfo duplex](v25->_activePrintInfo, "duplex") == UIPrintInfoDuplexNone
        && (-[PKPrinter type](v5, "type") == 3 || -[PKPrinter type](v5, "type") == 2))
      {
        -[UIPrintInfo setDuplex:](v25->_activePrintInfo, "setDuplex:", 1);
      }
      v11 = 0;
LABEL_28:

    }
  }

}

- (UIPrintPaper)paper
{
  UIPrintPaper **p_paper;
  PKPrinter *printer;
  UIPrintInfo *activePrintInfo;
  uint64_t v6;
  UIPrintInfoOutputType v7;
  void *v8;
  UIPrintInfoOutputType v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  double v41;
  double v42;
  UIPrintPaper *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  double v52;
  double v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  double v60;
  double v61;
  id v62;
  uint64_t v63;
  UIPrintPaper *v64;
  UIPrintPaper *paper;
  unint64_t v67;
  void *v68;
  UIPrintPaper **v69;
  id obj;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (!-[UIPrintInteractionController printStateActive](self, "printStateActive"))
    goto LABEL_79;
  p_paper = &self->_paper;
  if (self->_paper)
    goto LABEL_79;
  printer = self->_printer;
  activePrintInfo = self->_activePrintInfo;
  if (printer)
  {
    v6 = -[UIPrintInfo duplex](activePrintInfo, "duplex");
    v7 = -[UIPrintInfo outputType](self->_activePrintInfo, "outputType");
    -[UIPrintInteractionController _printItemContentSize](self, "_printItemContentSize");
    +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", printer, v6, v7);
  }
  else
  {
    +[UIPrintPaper _genericPaperListForOutputType:](UIPrintPaper, "_genericPaperListForOutputType:", -[UIPrintInfo outputType](activePrintInfo, "outputType"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIPrintInfo outputType](self->_activePrintInfo, "outputType");
  -[UIPrintInteractionController printPageRenderer](self, "printPageRenderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIPrintInteractionController printPageRenderer](self, "printPageRenderer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paperRect");
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v16 = v9 & 0xFFFFFFFFFFFFFFFDLL;
  if (v13 == 0.0 && self->_printer)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend(MEMORY[0x1E0D80A50], "lastUsedPrintersForPhoto:", v16 == 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
    if (v17)
    {
      v18 = v17;
      v67 = v9 & 0xFFFFFFFFFFFFFFFDLL;
      v68 = v8;
      v69 = &self->_paper;
      v19 = *(_QWORD *)v84;
      v20 = *MEMORY[0x1E0D80BD8];
      v21 = *MEMORY[0x1E0D80BD0];
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v84 != v19)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKey:", v20, v67, v68, v69);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPrinter name](self->_printer, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if (v26)
          {
            objc_msgSend(v23, "objectForKey:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = v27;
              objc_msgSend(v27, "CGSizeValue");
              v13 = v29;
              v15 = v30;

              goto LABEL_22;
            }
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
        if (v18)
          continue;
        break;
      }
LABEL_22:
      v8 = v68;
      p_paper = v69;
      v16 = v67;
    }

  }
  if (v13 == 0.0)
  {
    +[UIPrintPaper _defaultPaperForOutputType:](UIPrintPaper, "_defaultPaperForOutputType:", -[UIPrintInfo outputType](self->_activePrintInfo, "outputType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "paperSize");
    v13 = v32;
    v15 = v33;

  }
  if (v13 <= 0.0)
    goto LABEL_59;
  v34 = v16;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v35 = v8;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v80;
    while (2)
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v80 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
        objc_msgSend(v40, "paperSize");
        if ((v41 != v13 || v42 != v15) && (v41 != v15 || v42 != v13))
          continue;
        objc_storeStrong((id *)p_paper, v40);
        goto LABEL_44;
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      if (v37)
        continue;
      break;
    }
  }
LABEL_44:

  v45 = *p_paper;
  v16 = v34;
  if (!*p_paper)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v46 = v35;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v76;
      while (2)
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v76 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
          objc_msgSend(v51, "paperSize");
          if (vabdd_f64(v52, v13) < 0.029 && vabdd_f64(v53, v15) < 0.029
            || vabdd_f64(v52, v15) < 0.029 && vabdd_f64(v53, v13) < 0.029)
          {
            objc_storeStrong((id *)p_paper, v51);
            goto LABEL_58;
          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
        if (v48)
          continue;
        break;
      }
    }
LABEL_58:

    v16 = v34;
LABEL_59:
    v45 = *p_paper;
  }
  if (v16 != 1)
  {
LABEL_74:
    if (!v45)
    {
      v62 = -[UIPrintInteractionController _updatePrintPaper](self, "_updatePrintPaper");
      objc_storeStrong((id *)p_paper, self->_printPaper);
      if (!self->_paper)
      {
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "objectAtIndex:", 0);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = *p_paper;
          *p_paper = (UIPrintPaper *)v63;

        }
      }
    }
    goto LABEL_78;
  }
  if (!v45)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v54 = v8;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v72;
      while (2)
      {
        for (m = 0; m != v56; ++m)
        {
          if (*(_QWORD *)v72 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
          objc_msgSend(v59, "paperSize");
          if (v61 <= 720.0 && v60 <= 720.0)
          {
            objc_storeStrong((id *)p_paper, v59);
            goto LABEL_73;
          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
        if (v56)
          continue;
        break;
      }
    }
LABEL_73:

    v45 = *p_paper;
    goto LABEL_74;
  }
LABEL_78:

LABEL_79:
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
    paper = self->_paper;
  else
    paper = 0;
  return paper;
}

- (void)setPaper:(id)a3
{
  _BOOL4 v5;
  UIPrintPaper *v6;
  UIPrintPaper **p_paper;
  UIPrintPaper *paper;
  UIPrintPaper *v9;

  v9 = (UIPrintPaper *)a3;
  v5 = -[UIPrintInteractionController printStateActive](self, "printStateActive");
  v6 = v9;
  if (v5)
  {
    paper = self->_paper;
    p_paper = &self->_paper;
    if (paper != v9)
    {
      objc_storeStrong((id *)p_paper, a3);
      v6 = v9;
    }
  }

}

- (NSURL)tempPreviewFileURL
{
  UIPrintInteractionController *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_tempPreviewFileURL;
  objc_sync_exit(v2);

  return v3;
}

- (void)setTempPreviewFileURL:(id)a3
{
  NSURL *v4;
  NSURL *tempPreviewFileURL;
  UIPrintInteractionController *obj;

  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_tempPreviewFileURL && (-[NSURL isEqual:](v4, "isEqual:") & 1) == 0)
    -[UIPrintInteractionController removeFileAtURL:](obj, "removeFileAtURL:", obj->_tempPreviewFileURL);
  tempPreviewFileURL = obj->_tempPreviewFileURL;
  obj->_tempPreviewFileURL = v4;

  objc_sync_exit(obj);
}

- (void)removeFileAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  id v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      v10 = 0;
      v7 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v10);
      v8 = v10;
      v9 = v8;
      if ((v7 & 1) == 0)
        NSLog(CFSTR("Removing temporary preview file failed:%@"), v8);

    }
  }

}

- (void)_updatePrintInfoWithAnnotations
{
  if (-[UIPrintInteractionController _canShowAnnotations](self, "_canShowAnnotations"))
    -[UIPrintInfo setImagePDFAnnotations:](self->_activePrintInfo, "setImagePDFAnnotations:", 1);
}

- (id)rendererToUse
{
  UIPrintInteractionController *v2;
  UIPrintPageRenderer *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  UIPrintPageRenderer *printPageRenderer;
  UIPrintPageRenderer *v11;
  UIPrintPageRenderer *v13;
  UIPrintPageRenderer *formatterRenderer;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_printPageRenderer)
  {
    if (!v2->_printFormatter)
    {
      v11 = 0;
      goto LABEL_14;
    }
    if (!v2->_formatterRenderer)
    {
      v13 = objc_alloc_init(UIPrintPageRenderer);
      formatterRenderer = v2->_formatterRenderer;
      v2->_formatterRenderer = v13;

      -[UIPrintPageRenderer addPrintFormatter:startingAtPageAtIndex:](v2->_formatterRenderer, "addPrintFormatter:startingAtPageAtIndex:", v2->_printFormatter, 0);
    }
  }
  v3 = v2->_formatterRenderer;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIPrintPageRenderer printFormatters](v3, "printFormatters", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v16;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
          -[UIPrintInteractionController activePrintInfo](v2, "activePrintInfo");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setImagePDFAnnotations:", objc_msgSend(v9, "imagePDFAnnotations"));

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

  }
  printPageRenderer = v2->_printPageRenderer;
  if (!printPageRenderer)
    printPageRenderer = v2->_formatterRenderer;
  v11 = printPageRenderer;
LABEL_14:
  objc_sync_exit(v2);

  return v11;
}

- (void)_updatePageCount
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  size_t v8;
  CGDataProvider *v9;
  CGDataProvider *v10;
  CGPDFDocument *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  const __CFURL *v17;
  CGDataProvider *v18;
  CGDataProvider *v19;
  CGPDFDocument *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  NSArray *pageRanges;
  uint64_t v27;
  int64_t v28;
  void *v29;
  NSArray *v30;
  NSArray *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  NSArray *v40;
  NSArray *v41;
  void *v42;
  NSArray *printingItems;
  uint64_t v44;
  void *v45;
  _BOOL4 IsEncrypted;
  id v47;
  int64_t pageCount;
  void *v49;
  NSArray *obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  _BYTE v60[128];
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  pageCount = self->_pageCount;
  v3 = -[UIPrintInteractionController _updatePrintPaper](self, "_updatePrintPaper");
  -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIPrintPaper paperSize](self->_printPaper, "paperSize");
    v6 = v5;
    -[UIPrintPaper paperSize](self->_printPaper, "paperSize");
    objc_msgSend(v4, "setPaperRect:", 0.0, 0.0, v6, v7);
    -[UIPrintPaper _printableRectForDuplex:](self->_printPaper, "_printableRectForDuplex:", -[UIPrintInfo duplex](self->_activePrintInfo, "duplex") != UIPrintInfoDuplexNone);
    objc_msgSend(v4, "setPrintableRect:");
    v8 = objc_msgSend(v4, "_numberOfPages");
    self->_pageCount = v8;
    goto LABEL_3;
  }
  if (!self->_printingItem)
  {
    printingItems = self->_printingItems;
    if (printingItems)
      v8 = (int)-[NSArray count](printingItems, "count");
    else
      v8 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || IsAssetURL(self->_printingItem))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    v9 = CGDataProviderCreateWithCFData((CFDataRef)self->_printingItem);
    if (!v9)
      goto LABEL_11;
    v10 = v9;
    v11 = CGPDFDocumentCreateWithProvider(v9);
    CGDataProviderRelease(v10);
    if (!v11)
      goto LABEL_11;
LABEL_52:
    -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = (void *)v44;
      IsEncrypted = CGPDFDocumentIsEncrypted(v11);

      if (IsEncrypted)
      {
        -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
        v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGPDFDocumentUnlockWithPassword(v11, (const char *)objc_msgSend(v47, "cStringUsingEncoding:", 4));

      }
    }
    self->_pageCount = (int)CGPDFDocumentGetNumberOfPages(v11);
    CGPDFDocumentRelease(v11);
    v8 = self->_pageCount;
LABEL_3:
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_13;
    goto LABEL_11;
  }
  v11 = CGPDFDocumentCreateWithURL((CFURLRef)self->_printingItem);
  if (v11)
    goto LABEL_52;
LABEL_11:
  v8 = 1;
LABEL_12:
  self->_pageCount = v8;
LABEL_13:
  v49 = v4;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = self->_printingItems;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (!v12)
    goto LABEL_31;
  v13 = v12;
  v14 = *(_QWORD *)v56;
  v15 = 0x1E0C99000uLL;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v56 != v14)
        objc_enumerationMutation(obj);
      v17 = *(const __CFURL **)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !IsAssetURL(v17))
      {
        v20 = CGPDFDocumentCreateWithURL(v17);
        if (!v20)
          continue;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v18 = CGDataProviderCreateWithCFData(v17);
        if (!v18)
          continue;
        v19 = v18;
        v20 = CGPDFDocumentCreateWithProvider(v18);
        CGDataProviderRelease(v19);
        if (!v20)
          continue;
      }
      v21 = v15;
      -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        v24 = CGPDFDocumentIsEncrypted(v20);

        if (v24)
        {
          -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CGPDFDocumentUnlockWithPassword(v20, (const char *)objc_msgSend(v25, "cStringUsingEncoding:", 4));

        }
      }
      v8 = v8 + CGPDFDocumentGetNumberOfPages(v20) - 1;
      CGPDFDocumentRelease(v20);
      v15 = v21;
    }
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  }
  while (v13);
LABEL_31:

  if (-[UIPrintInfo pageCount](self->_activePrintInfo, "pageCount") != v8)
    -[UIPrintInfo setPageCount:](self->_activePrintInfo, "setPageCount:", v8);
  pageRanges = self->_pageRanges;
  if (!pageRanges)
  {
    v28 = self->_pageCount;
    goto LABEL_38;
  }
  v27 = -[NSArray count](pageRanges, "count");
  v28 = self->_pageCount;
  if (!v27 || v28 != pageCount)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v31 = self->_pageRanges;
    self->_pageRanges = v30;

    v32 = (void *)-[NSArray copy](self->_pageRanges, "copy");
    -[UIPrintInfo setPageRanges:](self->_activePrintInfo, "setPageRanges:", v32);

  }
  self->_pageCountWithRanges = 0;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v33 = self->_pageRanges;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "rangeValue");
        self->_pageCountWithRanges += v38;
      }
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v35);
  }

  if (self->_pageCountWithRanges > self->_pageCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v41 = self->_pageRanges;
    self->_pageRanges = v40;

    v42 = (void *)-[NSArray copy](self->_pageRanges, "copy");
    -[UIPrintInfo setPageRanges:](self->_activePrintInfo, "setPageRanges:", v42);

    self->_pageCountWithRanges = self->_pageCount;
  }

}

- (BOOL)_setupPrintPanel:(id)a3
{
  return -[UIPrintInteractionController _setupPrintPanel:forPDFGenerationOnly:](self, "_setupPrintPanel:forPDFGenerationOnly:", a3, 1);
}

- (BOOL)_setupPrintPanel:(id)a3 forPDFGenerationOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id printingItem;
  NSArray *printingItems;
  UIPrintInfo *printInfo;
  UIPrintInfo *v15;
  UIPrintInfo **p_activePrintInfo;
  UIPrintInfo *activePrintInfo;
  void *v18;
  UITallPDFPrintFormatter *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  UITallPDFPrintFormatter *v27;
  id v28;
  void *v29;
  void *v30;
  id WeakRetained;
  void *v32;
  id v33;
  char v34;
  id v35;
  id v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIPrintPanelViewController *v43;

  v4 = a4;
  v6 = a3;
  if (!+[UIPrintInteractionController isPrintingAvailable](UIPrintInteractionController, "isPrintingAvailable")&& !v4)
  {
    goto LABEL_10;
  }
  if (!self->_printingItem
    && !-[NSArray count](self->_printingItems, "count")
    && !self->_printFormatter
    && !self->_printPageRenderer)
  {
    NSLog(CFSTR("ERROR: attempting to display print options with no printing source (item/items/formatter/renderer) set"));
LABEL_10:
    v9 = 0;
    goto LABEL_43;
  }
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    -[UIPrintInteractionController printPanelViewController](self, "printPanelViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIPrintInteractionController printPanelViewController](self, "printPanelViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissAnimated:completionHandler:", 1, 0);

    }
    goto LABEL_10;
  }
  -[UIPrintInteractionController setPrintStateActive:](self, "setPrintStateActive:", 1);
  v10 = (void *)objc_msgSend(v6, "copy");
  -[UIPrintInteractionController set_completionHandler:](self, "set_completionHandler:", v10);

  if (-[NSArray count](self->_printingItems, "count") == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_printingItems, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    printingItem = self->_printingItem;
    self->_printingItem = v11;

    printingItems = self->_printingItems;
    self->_printingItems = 0;

  }
  printInfo = self->_printInfo;
  if (printInfo)
  {
    v15 = (UIPrintInfo *)-[UIPrintInfo copy](printInfo, "copy");
  }
  else
  {
    +[UIPrintInfo printInfo](UIPrintInfo, "printInfo");
    v15 = (UIPrintInfo *)objc_claimAutoreleasedReturnValue();
  }
  p_activePrintInfo = &self->_activePrintInfo;
  activePrintInfo = self->_activePrintInfo;
  self->_activePrintInfo = v15;

  -[UIPrintInteractionController pdfPassword](self, "pdfPassword");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setPdfPassword:](self->_activePrintInfo, "setPdfPassword:", v18);

  if (!self->_printInfo)
  {
    if (self->_printingItem)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = self->_printingItem;
        objc_msgSend(v23, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByDeletingPathExtension");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintInfo setJobName:](self->_activePrintInfo, "setJobName:", v26);

      }
    }
  }
  if ((-[UIPrintInfo outputType](*p_activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1)
    -[UIPrintInfo setDuplex:](*p_activePrintInfo, "setDuplex:", 0);
  -[UIPrintInteractionController _updatePrintInfoWithAnnotations](self, "_updatePrintInfoWithAnnotations");
  if (self->_printingItem
    && -[UIPrintInteractionController _printingItemIsReallyTallPDF](self, "_printingItemIsReallyTallPDF"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = [UITallPDFPrintFormatter alloc];
      v20 = self->_printingItem;
      -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[UITallPDFPrintFormatter initWithPDFURL:pdfPassword:](v19, "initWithPDFURL:pdfPassword:", v20, v21);
LABEL_28:
      v29 = (void *)v22;
      -[UIPrintInteractionController setPrintFormatter:](self, "setPrintFormatter:", v22);

      -[UIPrintInteractionController printFormatter](self, "printFormatter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPerPageContentInsets:", 36.0, 36.0, 36.0, 36.0);

      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = [UITallPDFPrintFormatter alloc];
      v28 = self->_printingItem;
      -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[UITallPDFPrintFormatter initWithPDFData:pdfPassword:](v27, "initWithPDFData:pdfPassword:", v28, v21);
      goto LABEL_28;
    }
  }
LABEL_29:
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(WeakRetained, "printInteractionControllerParentViewController:", self),
          (v32 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v33 = objc_loadWeakRetained((id *)&self->_printActivityDelegate);
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0
        || (v35 = objc_loadWeakRetained((id *)&self->_printActivityDelegate),
            objc_msgSend(v35, "printInteractionControllerParentViewController:", self),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            v35,
            !v32))
      {
        v36 = objc_loadWeakRetained((id *)&self->_printActivityDelegate);
        v37 = objc_opt_respondsToSelector();

        if ((v37 & 1) != 0)
        {
          v38 = objc_loadWeakRetained((id *)&self->_printActivityDelegate);
          objc_msgSend(v38, "printInteractionControllerWindowForPresentation:", self);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "rootViewController");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "presentedViewController");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            do
            {
              objc_msgSend(v40, "presentedViewController");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v32, "presentedViewController");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              v40 = v32;
            }
            while (v42);
          }
          else
          {
            v32 = v40;
          }
        }
        else
        {
          v32 = 0;
        }
      }
    }
    v43 = -[UIPrintPanelViewController initWithPrintInterationController:inParentController:]([UIPrintPanelViewController alloc], "initWithPrintInterationController:inParentController:", self, v32);
    -[UIPrintInteractionController setPrintPanelViewController:](self, "setPrintPanelViewController:", v43);

  }
  v9 = 1;
LABEL_43:

  return v9;
}

- (void)_generatePDFWithNupForPrintingCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGContext *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  unint64_t j;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  CGContext *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  id v50;
  NSArray *v51;
  void (**v52)(id, id);
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_printingItem)
  {
    v58[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_printingItems;
  }
  v7 = v6;
  if (v5)
    v8 = objc_msgSend(v5, "numberOfPages");
  else
    v8 = -[NSArray count](v6, "count");
  v9 = v8;
  -[UIPrintInteractionController _tempFilePath](self, "_tempFilePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIPrintInteractionController _newPDFURLWithPath:isContentManaged:](self, "_newPDFURLWithPath:isContentManaged:", v10, self->_isContentManaged);

  -[UIPrintInteractionController _mediaRect](self, "_mediaRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scalingFactor");
  v22 = v17 * v21;

  -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scalingFactor");
  v25 = v19 * v24;

  v26 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v11, v13, v15, v22, v25);
  if (v5)
  {
    v50 = v11;
    v51 = v7;
    v52 = v4;
    v27 = -[UIPrintInteractionController _fullPagesRange](self, "_fullPagesRange");
    objc_msgSend(v5, "prepareForDrawingPages:", v27, v28);
    objc_msgSend(v5, "_startSaveContext:", v26);
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pageRanges");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v54 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          for (j = objc_msgSend(v36, "rangeValue"); ; ++j)
          {
            v38 = objc_msgSend(v36, "rangeValue");
            objc_msgSend(v36, "rangeValue");
            if (j >= v39 + v38)
              break;
            -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "scalingFactor");
            objc_msgSend(v5, "_drawPage:withScale:drawingToPDF:", j, 1);

          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v33);
    }

    objc_msgSend(v5, "_endSaveContext");
    v7 = v51;
    v4 = v52;
    v11 = v50;
    goto LABEL_27;
  }
  if (-[NSArray count](v7, "count") == 1)
  {
    -[NSArray objectAtIndex:](v7, "objectAtIndex:", 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = v31;
        objc_msgSend(v41, "ui_setIsContentManaged:", self->_isContentManaged);
        if (!IsAssetURL(v41) && -[UIPrintInteractionController _canPrintPDFURL:](self, "_canPrintPDFURL:", v41))
          goto LABEL_26;

      }
    }
    -[UIPrintInteractionController _tempFilePath](self, "_tempFilePath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[UIPrintInteractionController _newPDFURLWithPath:isContentManaged:](self, "_newPDFURLWithPath:isContentManaged:", v42, self->_isContentManaged);

    v43 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v41, v13, v15, v22, v25);
    -[UIPrintInteractionController _drawPrintItem:toContext:printAllPages:](self, "_drawPrintItem:toContext:printAllPages:", v31, v43, 0);
    CGPDFContextClose(v43);
    CGContextRelease(v43);
LABEL_26:
    -[UIPrintInteractionController redrawPDFwithPageRange:](self, "redrawPDFwithPageRange:", v41);
    v44 = objc_claimAutoreleasedReturnValue();

    -[UIPrintInteractionController removeFileAtURL:](self, "removeFileAtURL:", v11);
    v11 = (id)v44;
LABEL_27:

    goto LABEL_28;
  }
  if (-[NSArray count](v7, "count") >= 2 && v9)
  {
    for (k = 0; k != v9; ++k)
    {
      if (!-[UIPrintInteractionController printStateActive](self, "printStateActive"))
        break;
      -[NSArray objectAtIndex:](v7, "objectAtIndex:", k);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintInteractionController _drawPrintItem:toContext:printAllPages:](self, "_drawPrintItem:toContext:printAllPages:", v49, v26, 1);

    }
  }
LABEL_28:
  if (v26)
  {
    CGPDFContextClose(v26);
    CGContextRelease(v26);
  }
  if (-[UIPrintInteractionController needRedrawWithNUp](self, "needRedrawWithNUp"))
  {
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController printPaper](self, "printPaper");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    redrawPDFWithNUp(v11, v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v47;
  }
  v4[2](v4, v11);

}

- (id)redrawPDFwithPageRange:(id)a3
{
  CGPDFDocument *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFURL *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 IsEncrypted;
  id v13;
  void *v14;
  CGPDFPage *Page;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGContextRef v19;
  CGContext *v20;
  uint64_t i;
  void *v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  CGPDFDocument *v26;
  CGPDFPage *v27;
  __CFDictionary *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  const __CFURL *v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  UIPrintInteractionController *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGRect mediaBox;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = CGPDFDocumentCreateWithURL((CFURLRef)a3);
  v39 = self;
  -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = 0;
  if (!v7 || !v4)
    goto LABEL_24;
  -[UIPrintInteractionController activePrintInfo](v39, "activePrintInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pdfPassword");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    IsEncrypted = CGPDFDocumentIsEncrypted(v4);

    if (!IsEncrypted)
      goto LABEL_7;
    -[UIPrintInteractionController activePrintInfo](v39, "activePrintInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pdfPassword");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGPDFDocumentUnlockWithPassword(v4, (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4));

  }
LABEL_7:
  if (CGPDFDocumentAllowsPrinting(v4))
  {
    -[UIPrintInteractionController _tempFilePath](v39, "_tempFilePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIPrintInteractionController _newPDFURLWithPath:isContentManaged:](v39, "_newPDFURLWithPath:isContentManaged:", v14, v39->_isContentManaged);

    Page = CGPDFDocumentGetPage(v4, 1uLL);
    memset(&mediaBox, 0, sizeof(mediaBox));
    if (Page)
    {
      mediaBox.origin.x = getPDFPageBoxRect(Page);
      mediaBox.origin.y = v16;
      mediaBox.size.width = v17;
      mediaBox.size.height = v18;
    }
    v19 = CGPDFContextCreateWithURL(v8, &mediaBox, 0);
    if (v19)
    {
      v20 = v19;
      v34 = v8;
      v35 = v7;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v7;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v38)
      {
        v37 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v41 != v37)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            v23 = objc_msgSend(v22, "rangeValue", v34, v35);
            v24 = objc_msgSend(v22, "rangeValue");
            objc_msgSend(v22, "rangeValue");
            if (v23 < v25 + v24)
            {
              do
              {
                ++v23;
                v26 = v4;
                v27 = CGPDFDocumentGetPage(v4, v23);
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v28 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
                getPDFPageProperties(v28, v27);
                CGPDFContextBeginPage(v20, v28);
                -[UIPrintInteractionController activePrintInfo](v39, "activePrintInfo");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "imagePDFAnnotations");

                if (v30)
                  CGContextDrawPDFPageWithAnnotations();
                else
                  CGContextDrawPDFPage(v20, v27);
                CGContextEndPage(v20);

                v31 = objc_msgSend(v22, "rangeValue");
                objc_msgSend(v22, "rangeValue");
                v4 = v26;
              }
              while (v23 < v32 + v31);
            }
          }
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v38);
      }

      CGPDFContextClose(v20);
      CGContextRelease(v20);
      v8 = v34;
      v7 = v35;
    }
LABEL_24:
    if (!v4)
      goto LABEL_28;
    goto LABEL_27;
  }
  v8 = 0;
LABEL_27:
  CGPDFDocumentRelease(v4);
LABEL_28:

  return v8;
}

- (id)_newPDFURLWithPath:(id)a3 isContentManaged:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ui_setIsContentManaged:", v4);
  return v5;
}

- (id)_tempFilePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uuid_string_t v7;
  uuid_t out;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(out, 0, sizeof(out));
  uuid_generate_random(out);
  uuid_unparse(out, v7);
  v2 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@.pdf"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateRendererWithQuality:(int64_t)a3
{
  id obj;

  -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  self->_currentRenderingQuality = objc_msgSend(obj, "currentRenderingQualityForRequestedRenderingQuality:", a3);
  objc_msgSend(obj, "setRequestedRenderingQuality:", a3);
  objc_sync_exit(obj);

}

- (_NSRange)_fullPagesRange
{
  NSUInteger v3;
  NSUInteger pageCount;
  _NSRange result;

  if (-[UIPrintInteractionController _pageRendererAvailable](self, "_pageRendererAvailable"))
  {
    v3 = 0;
    pageCount = self->_pageCount;
  }
  else
  {
    if (self->_printingItem)
      goto LABEL_4;
    if (!-[NSArray count](self->_printingItems, "count"))
    {
      pageCount = 0;
      v3 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    }
    if (self->_printingItem)
LABEL_4:
      pageCount = 1;
    else
      pageCount = -[NSArray count](self->_printingItems, "count");
    v3 = 0;
  }
LABEL_10:
  result.length = pageCount;
  result.location = v3;
  return result;
}

- (BOOL)_isPageCancelled:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_previewStates, "containsObject:", v4))
    v5 = objc_msgSend(v4, "cancelled");
  else
    v5 = 1;

  return v5;
}

- (BOOL)_pageRendererAvailable
{
  UIPrintInteractionController *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_printPageRenderer)
    v3 = 1;
  else
    v3 = v2->_printFormatter != 0;
  objc_sync_exit(v2);

  return v3;
}

- (CGRect)_mediaRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIPrintInfo *printInfo;
  uint64_t v14;
  UIPrintPaper *printPaper;
  UIPrintPaper *v16;
  UIPrintPaper *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "paperRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    printInfo = self->_printInfo;
    if (printInfo)
      v14 = -[UIPrintInfo outputType](printInfo, "outputType");
    else
      v14 = 1;
    printPaper = self->_printPaper;
    if (printPaper)
    {
      v16 = printPaper;
    }
    else
    {
      +[UIPrintPaper _defaultPaperForOutputType:](UIPrintPaper, "_defaultPaperForOutputType:", v14);
      v16 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;
    -[UIPrintPaper paperSize](v16, "paperSize");
    v10 = v18;
    -[UIPrintPaper paperSize](v17, "paperSize");
    v12 = v19;
    v6 = 0.0;

    v8 = 0.0;
  }

  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)_printingItemPrintablePDFURL
{
  id v3;
  id v4;
  void *v5;

  if (!-[UIPrintInteractionController _pageRendererAvailable](self, "_pageRendererAvailable"))
  {
    if (-[NSArray count](self->_printingItems, "count") == 1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_printingItems, "objectAtIndexedSubscript:", 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = self->_printingItem;
    }
    v5 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = v5;
        objc_msgSend(v3, "ui_setIsContentManaged:", self->_isContentManaged);
        if (!IsAssetURL(v3) && -[UIPrintInteractionController _canPrintPDFURL:](self, "_canPrintPDFURL:", v3))
          goto LABEL_12;

      }
    }
    v3 = 0;
LABEL_12:

    return v3;
  }
  v3 = 0;
  return v3;
}

- (void)_generatePDFWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  int64_t v17;
  int64_t pageCountWithRanges;
  int64_t v19;
  int64_t v20;
  UIPrintPreviewState *v21;
  NSMutableSet *previewStates;
  NSMutableSet *v23;
  NSMutableSet *v24;
  UIPrintPreviewState *v25;
  _QWORD v26[4];
  UIPrintPreviewState *v27;
  id v28;
  id v29;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "printInteractionControllerWillStartJob:", self);
  -[UIPrintInteractionController _printingItemPrintablePDFURL](self, "_printingItemPrintablePDFURL");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v4 || !v7)
    goto LABEL_15;
  -[UIPrintInteractionController _printablePDFURLSize:](self, "_printablePDFURLSize:", v7);
  v10 = v9;
  v12 = v11;
  -[UIPrintInteractionController paper](self, "paper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paperSize");
  if (v10 != v15 || v12 != v14)
  {
LABEL_14:

    goto LABEL_15;
  }
  if (-[UIPrintInteractionController _canShowAnnotations](self, "_canShowAnnotations"))
  {
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "imagePDFAnnotations") & 1) != 0)
    {
      v17 = -[UIPrintInteractionController pageCount](self, "pageCount");
      pageCountWithRanges = self->_pageCountWithRanges;

      if (v17 != pageCountWithRanges)
        goto LABEL_15;
LABEL_12:
      -[UIPrintInteractionController _updatePageCount](self, "_updatePageCount");
      (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v8, 0);
      goto LABEL_18;
    }

    goto LABEL_14;
  }
  v19 = -[UIPrintInteractionController pageCount](self, "pageCount");
  v20 = self->_pageCountWithRanges;

  if (v19 == v20)
    goto LABEL_12;
LABEL_15:
  -[UIPrintInteractionController _cancelAllPreviewGeneration](self, "_cancelAllPreviewGeneration");
  v21 = objc_alloc_init(UIPrintPreviewState);
  previewStates = self->_previewStates;
  if (!previewStates)
  {
    v23 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    v24 = self->_previewStates;
    self->_previewStates = v23;

    previewStates = self->_previewStates;
  }
  -[NSMutableSet addObject:](previewStates, "addObject:", v21);
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__UIPrintInteractionController__generatePDFWithCompletionHandler___block_invoke;
  v26[3] = &unk_1E9D96FE0;
  objc_copyWeak(&v29, &location);
  v25 = v21;
  v27 = v25;
  v28 = v5;
  -[UIPrintInteractionController _cancelPreviewQueue:completionHandler:](self, "_cancelPreviewQueue:completionHandler:", 1, v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

LABEL_18:
}

void __66__UIPrintInteractionController__generatePDFWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id *v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    if ((objc_msgSend(*(id *)(a1 + 32), "cancelled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      if (v3)
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, 1);
    }
    else
    {
      if (objc_msgSend(v14, "_pageRendererAvailable"))
        objc_msgSend(v14, "_updateRendererWithQuality:", 0);
      objc_msgSend(v14, "_updatePageCount");
      v4 = objc_msgSend(v14, "_fullPagesRange");
      v6 = v5;
      if (objc_msgSend(v14, "_pageRendererAvailable"))
      {
        objc_msgSend(v14, "rendererToUse");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "prepareForDrawingPages:", v4, v6);

      }
      objc_msgSend(v14, "drawPagesWithPreviewState:", *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "cancelled"))
        v9 = 0;
      else
        v9 = v8;
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        (*(void (**)(uint64_t, id, uint64_t))(v11 + 16))(v11, v10, objc_msgSend(*(id *)(a1 + 32), "cancelled"));
      objc_msgSend(v14, "setTempPreviewFileURL:", v8);

    }
    WeakRetained = v14;
    v12 = v14[25];
    if (v12 && *(_QWORD *)(a1 + 32))
    {
      v13 = v12;
      objc_sync_enter(v13);
      objc_msgSend(v14[25], "removeObject:", *(_QWORD *)(a1 + 32));
      objc_sync_exit(v13);

      WeakRetained = v14;
    }
  }

}

- (int64_t)numberOfPages
{
  return -[UIPrintInfo pageCount](self->_activePrintInfo, "pageCount");
}

- (id)getPrintingItemForPageNum:(int64_t)a3 pdfItemPageNum:(int64_t *)a4
{
  UIPrintInteractionController *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFURL *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFURL *v15;
  CGDataProvider *v16;
  CGDataProvider *v17;
  CGPDFDocument *v18;
  UIPrintInteractionController *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 IsEncrypted;
  id v23;
  int64_t v24;
  int64_t *v26;
  NSArray *v27;
  NSArray *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v5 = self;
  v35[1] = *MEMORY[0x1E0C80C00];
  if (self->_printingItem)
  {
    v35[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_printingItems;
  }
  v7 = v6;
  if (!v6 || !-[NSArray count](v6, "count"))
  {
    v11 = 0;
    goto LABEL_32;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v7;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_31;
  }
  v10 = v9;
  v26 = a4;
  v27 = v7;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v31;
  v28 = v8;
LABEL_8:
  v14 = 0;
  v15 = v11;
  while (1)
  {
    if (*(_QWORD *)v31 != v13)
      objc_enumerationMutation(v8);
    v11 = (const __CFURL *)*(id *)(*((_QWORD *)&v30 + 1) + 8 * v14);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !IsAssetURL(v11))
    {
      v18 = CGPDFDocumentCreateWithURL(v11);
      if (!v18)
        goto LABEL_16;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v16 = CGDataProviderCreateWithCFData(v11)) == 0
        || (v17 = v16, v18 = CGPDFDocumentCreateWithProvider(v16), CGDataProviderRelease(v17), !v18))
      {
LABEL_16:
        if (++v12 == a3)
          goto LABEL_27;
        goto LABEL_24;
      }
    }
    v19 = v5;
    -[UIPrintInfo pdfPassword](v5->_activePrintInfo, "pdfPassword", v26);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      IsEncrypted = CGPDFDocumentIsEncrypted(v18);

      if (IsEncrypted)
      {
        -[UIPrintInfo pdfPassword](v19->_activePrintInfo, "pdfPassword");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGPDFDocumentUnlockWithPassword(v18, (const char *)objc_msgSend(v23, "cStringUsingEncoding:", 4));

      }
    }
    v24 = CGPDFDocumentGetNumberOfPages(v18) + v12;
    if (v24 >= a3)
      break;
    CGPDFDocumentRelease(v18);
    v12 = v24;
    v5 = v19;
    v8 = v28;
LABEL_24:
    ++v14;
    v15 = v11;
    if (v10 == v14)
    {
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v10)
        goto LABEL_8;

      v11 = 0;
LABEL_27:
      v7 = v27;
      goto LABEL_31;
    }
  }
  *v26 = a3 - v12;
  CGPDFDocumentRelease(v18);
  v7 = v27;
  v8 = v28;
LABEL_31:

LABEL_32:
  return v11;
}

- (CGSize)paperSizeForPageNum:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double width;
  double v9;
  double v10;
  void *v11;
  void *v12;
  UIPrintInfo *printInfo;
  uint64_t v14;
  UIPrintPaper *printPaper;
  UIPrintPaper *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  CGDataProvider *v22;
  CGDataProvider *v23;
  CGPDFDocument *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 IsEncrypted;
  id v29;
  CGPDFPage *Page;
  double height;
  uint64_t v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  NSUInteger v46;
  uint64_t v47;
  size_t pageNumber;
  CGSize result;
  CGRect BoxRect;

  -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    width = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    pageNumber = a3;
    -[UIPrintInteractionController getPrintingItemForPageNum:pdfItemPageNum:](self, "getPrintingItemForPageNum:pdfItemPageNum:", a3, &pageNumber);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
LABEL_42:

      goto LABEL_43;
    }
    printInfo = self->_printInfo;
    if (printInfo)
      v14 = -[UIPrintInfo outputType](printInfo, "outputType");
    else
      v14 = 1;
    printPaper = self->_printPaper;
    if (printPaper)
    {
      v16 = printPaper;
    }
    else
    {
      +[UIPrintPaper _defaultPaperForOutputType:](UIPrintPaper, "_defaultPaperForOutputType:", v14);
      v16 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_retainAutorelease(v12);
      if (objc_msgSend(v18, "CGImage"))
      {
        objc_msgSend(v18, "size");
        width = v19;
        v10 = v20;
      }
      objc_msgSend(v17, "_pkPaper");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isRoll") && !self->_printingItem)
      {
        v46 = -[NSArray count](self->_printingItems, "count");

        if (v46 < 2)
          goto LABEL_16;
        +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, -[UIPrintInfo duplex](self->_printInfo, "duplex"), v14, width, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v21, width, v10);
          v47 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v47;
        }
      }

LABEL_16:
      goto LABEL_35;
    }
    v22 = CGDataProviderCreateWithCFData((CFDataRef)v12);
    if (!v22 || (v23 = v22, v24 = CGPDFDocumentCreateWithProvider(v22), CGDataProviderRelease(v23), !v24))
    {
LABEL_35:
      objc_msgSend(v17, "paperSize");
      v35 = v34;
      objc_msgSend(v17, "paperSize");
      if ((v35 <= v36 || width >= v10)
        && ((objc_msgSend(v17, "paperSize"), v38 = v37, objc_msgSend(v17, "paperSize"), v38 >= v39) || width <= v10))
      {
        objc_msgSend(v17, "paperSize");
        width = v42;
        objc_msgSend(v17, "paperSize");
        v10 = v43;
      }
      else
      {
        objc_msgSend(v17, "paperSize");
        width = v40;
        objc_msgSend(v17, "paperSize");
        v10 = v41;
      }

      goto LABEL_42;
    }
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pdfPassword");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      IsEncrypted = CGPDFDocumentIsEncrypted(v24);

      if (!IsEncrypted)
      {
LABEL_23:
        Page = CGPDFDocumentGetPage(v24, pageNumber);
        BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
        width = BoxRect.size.width;
        height = BoxRect.size.height;
        LODWORD(v32) = CGPDFPageGetRotationAngle(Page) % 360;
        if ((int)v32 >= 0)
          v32 = (int)v32;
        else
          v32 = (int)v32 + 360;
        v33 = v32 == 90 || v32 == 270;
        if (v33)
          v10 = width;
        else
          v10 = height;
        if (v33)
          width = height;
        CGPDFDocumentRelease(v24);
        goto LABEL_35;
      }
      -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pdfPassword");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGPDFDocumentUnlockWithPassword(v24, (const char *)objc_msgSend(v29, "cStringUsingEncoding:", 4));

    }
    goto LABEL_23;
  }
  objc_msgSend(v5, "paperRect");
  width = v7;
  v10 = v9;
LABEL_43:

  v44 = width;
  v45 = v10;
  result.height = v45;
  result.width = v44;
  return result;
}

- (void)drawImageForPageNum:(int64_t)a3 toContext:(CGContext *)a4 sheetSize:(CGSize)a5
{
  double height;
  double width;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  CGDataProviderRef v19;
  CGDataProvider *v20;
  CGPDFDocument *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 IsEncrypted;
  id v26;
  CGPDFPageRef Page;
  CGPDFPage *v28;
  void *v29;
  CGAffineTransform v30;
  size_t pageNumber;
  CGAffineTransform transform;
  CGAffineTransform v33;

  height = a5.height;
  width = a5.width;
  -[UIPrintInteractionController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[UIPrintInteractionController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "printInteractionControllerWillStartJob:", self);

  }
  -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    pageNumber = a3;
    -[UIPrintInteractionController getPrintingItemForPageNum:pdfItemPageNum:](self, "getPrintingItemForPageNum:pdfItemPageNum:", a3, &pageNumber);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIPrintInteractionController drawImage:toContext:sheetSize:](self, "drawImage:toContext:sheetSize:", v18, a4, width, height);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v19 = CGDataProviderCreateWithCFData((CFDataRef)v18);
    if (!v19)
      goto LABEL_21;
    v20 = v19;
    CGContextSaveGState(a4);
    memset(&v33, 0, sizeof(v33));
    CGContextGetBaseCTM();
    CGContextGetCTM(&v30, a4);
    CGContextSetBaseCTM();
    v21 = CGPDFDocumentCreateWithProvider(v20);
    CGDataProviderRelease(v20);
    if (!v21)
    {
LABEL_20:
      transform = v33;
      CGContextSetBaseCTM();
      CGContextRestoreGState(a4);
      goto LABEL_21;
    }
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pdfPassword");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      IsEncrypted = CGPDFDocumentIsEncrypted(v21);

      if (!IsEncrypted)
      {
LABEL_17:
        Page = CGPDFDocumentGetPage(v21, pageNumber);
        if (Page)
        {
          v28 = Page;
          -[UIPrintInteractionController printPaper](self, "printPaper");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          drawPDFPageToCGContext(v28, a4, v29, -[UIPrintInfo imagePDFAnnotations](self->_activePrintInfo, "imagePDFAnnotations"), width, height);

        }
        CGPDFDocumentRelease(v21);
        goto LABEL_20;
      }
      -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pdfPassword");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGPDFDocumentUnlockWithPassword(v21, (const char *)objc_msgSend(v26, "cStringUsingEncoding:", 4));

    }
    goto LABEL_17;
  }
  -[UIPrintInteractionController renderThumbnailMutex](self, "renderThumbnailMutex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    -[UIPrintInteractionController setRenderThumbnailMutex:](self, "setRenderThumbnailMutex:", v15);

  }
  -[UIPrintInteractionController renderThumbnailMutex](self, "renderThumbnailMutex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v16);
  CGContextSaveGState(a4);
  -[UIPrintInteractionController paperSizeForPageNum:](self, "paperSizeForPageNum:", a3);
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, height / v17, height / v17);
  transform = v33;
  CGContextConcatCTM(a4, &transform);
  -[UIPrintInteractionController _updateRendererWithQuality:](self, "_updateRendererWithQuality:", 1);
  objc_msgSend(v13, "prepareForDrawingPages:", a3 - 1, 1);
  objc_msgSend(v13, "_startSaveContext:", a4);
  objc_msgSend(v13, "_drawPage:withScale:drawingToPDF:", a3 - 1, 0, 1.0);
  objc_msgSend(v13, "_endSaveContext");
  CGContextRestoreGState(a4);
  objc_sync_exit(v16);
LABEL_22:

}

- (id)createWebKitPDFForAllPages
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  CGContext *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;

  -[UIPrintInteractionController webKitFormatterMutex](self, "webKitFormatterMutex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[UIPrintInteractionController _updateRendererWithQuality:](self, "_updateRendererWithQuality:", 0);
  -[UIPrintInteractionController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIPrintInteractionController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "printInteractionControllerWillStartJob:", self);

  }
  -[UIPrintInteractionController _updatePageCount](self, "_updatePageCount");
  if (-[UIPrintInteractionController pageCount](self, "pageCount") < 1)
  {
    v13 = 0;
  }
  else
  {
    -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paperRect");
    v9 = v8;
    v11 = v10;
    -[UIPrintInteractionController _tempFilePath](self, "_tempFilePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIPrintInteractionController _newPDFURLWithPath:isContentManaged:](self, "_newPDFURLWithPath:isContentManaged:", v12, self->_isContentManaged);

    v14 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v13, 0.0, 0.0, v9, v11);
    objc_msgSend(v7, "_startSaveContext:", v14);
    v15 = -[UIPrintInteractionController _fullPagesRange](self, "_fullPagesRange");
    v17 = v16;
    if (v15 < v15 + v16)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isCancelled");

        if ((v19 & 1) != 0)
          break;
        objc_msgSend(v7, "_drawPage:withScale:drawingToPDF:", v15++, 1, 1.0);
        --v17;
      }
      while (v17);
    }
    objc_msgSend(v7, "_endSaveContext");
    CGPDFContextClose(v14);
    CGContextRelease(v14);

  }
  objc_sync_exit(v3);

  return v13;
}

- (void)recalculateWebKitPageCount
{
  id obj;

  -[UIPrintInteractionController webKitFormatterMutex](self, "webKitFormatterMutex");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  -[UIPrintInteractionController _updatePageCount](self, "_updatePageCount");
  objc_sync_exit(obj);

}

- (id)drawPagesWithPreviewState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v33;
  id obj;
  id v35;
  CGContext *context;
  NSArray *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_printingItem)
  {
    v43[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_3:
      v6 = objc_msgSend(v5, "numberOfPages");
      goto LABEL_6;
    }
  }
  else
  {
    v37 = self->_printingItems;
    if (v5)
      goto LABEL_3;
  }
  v6 = -[NSArray count](v37, "count");
LABEL_6:
  v7 = v6;
  -[UIPrintInteractionController _tempFilePath](self, "_tempFilePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[UIPrintInteractionController _newPDFURLWithPath:isContentManaged:](self, "_newPDFURLWithPath:isContentManaged:", v8, self->_isContentManaged);

  if (v5)
  {
    -[UIPrintInteractionController printPaper](self, "printPaper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scalingFactor");
    v11 = v10;

    -[UIPrintInteractionController printPaper](self, "printPaper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paperSize");
    v14 = v13;
    v16 = v15;

    -[UIPrintInteractionController _mediaRect](self, "_mediaRect");
    if (v14 == v19 && v16 == v20)
    {
      v20 = v11 * v16;
      v19 = v11 * v14;
      v17 = 0.0;
      v18 = 0.0;
    }
    context = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v35, v17, v18, v19, v20);
    -[UIPrintInteractionController webKitFormatterMutex](self, "webKitFormatterMutex");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    objc_msgSend(v5, "_startSaveContext:", context);
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pageRanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v39;
LABEL_11:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v26);
        v28 = objc_msgSend(v27, "rangeValue", obj);
        do
        {
          v29 = objc_msgSend(v27, "rangeValue");
          objc_msgSend(v27, "rangeValue");
          if (v28 >= v30 + v29)
            break;
          objc_msgSend(v5, "_drawPage:withScale:drawingToPDF:", v28, 1, v11);
          if (!-[UIPrintInteractionController printStateActive](self, "printStateActive"))
            break;
          ++v28;
        }
        while (!-[UIPrintInteractionController _isPageCancelled:](self, "_isPageCancelled:", v4));
        if (!-[UIPrintInteractionController printStateActive](self, "printStateActive")
          || -[UIPrintInteractionController _isPageCancelled:](self, "_isPageCancelled:", v4))
        {
          break;
        }
        if (++v26 == v24)
        {
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v24)
            goto LABEL_11;
          break;
        }
      }
    }

    objc_msgSend(v5, "_endSaveContext");
    v31 = obj;
    objc_sync_exit(obj);
LABEL_23:

  }
  else
  {
    -[UIPrintInteractionController _mediaRect](self, "_mediaRect");
    context = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", v35);
    if (v7)
    {
      v33 = 0;
      while (-[UIPrintInteractionController printStateActive](self, "printStateActive")
           && !-[UIPrintInteractionController _isPageCancelled:](self, "_isPageCancelled:", v4))
      {
        if (v33 < -[NSArray count](v37, "count"))
        {
          -[NSArray objectAtIndex:](v37, "objectAtIndex:", v33);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintInteractionController _drawPrintItem:toContext:printAllPages:](self, "_drawPrintItem:toContext:printAllPages:", v31, context, -[NSArray count](v37, "count") > 1);
          if (!-[UIPrintInteractionController printStateActive](self, "printStateActive")
            || -[UIPrintInteractionController _isPageCancelled:](self, "_isPageCancelled:", v4))
          {
            goto LABEL_23;
          }

        }
        if (v7 == ++v33)
          break;
      }
    }
  }
  if (context)
  {
    CGPDFContextClose(context);
    CGContextRelease(context);
  }

  return v35;
}

- (void)drawImage:(id)a3 toContext:(CGContext *)a4 sheetSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  uint64_t v11;
  CGImage *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  id v46;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  objc_msgSend(v9, "CIImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    ConvertCIBasedImage(v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  v46 = objc_retainAutorelease(v9);
  v12 = (CGImage *)objc_msgSend(v46, "CGImage");
  v13 = v46;
  if (v12)
  {
    v14 = objc_msgSend(v46, "imageOrientation");
    if (v14 > 7)
      v15 = 1;
    else
      v15 = drawImage_toContext_sheetSize___UIImageOrientationToEXIFOrientationMapping[v14];
    -[UIPrintInteractionController printPaper](self, "printPaper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "paperSize");
    v18 = v17;
    v20 = v19;

    -[UIPrintInteractionController printPaper](self, "printPaper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "printableRect");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v30 = v18 - (v23 + v27);
    v31 = v20 - (v25 + v29);
    v44 = height;
    if ((v18 <= v20 || width >= height) && (v18 >= v20 || width <= height))
    {
      v32 = v25;
      v33 = v31;
      v31 = v30;
      v25 = v23;
      v34 = v20;
      v20 = v18;
    }
    else
    {
      v32 = v23;
      v33 = v30;
      v34 = v18;
    }
    objc_msgSend(v46, "size", *(_QWORD *)&v44);
    v36 = v35;
    objc_msgSend(v46, "size");
    if (v36 >= v37 + v37)
    {
      v41 = 0;
    }
    else
    {
      objc_msgSend(v46, "size");
      v39 = v38;
      objc_msgSend(v46, "size");
      v41 = v39 < v40 + v40;
    }
    v42 = v25 == 0.0;
    if (v31 != 0.0)
      v42 = 0;
    if (v33 != 0.0)
      v42 = 0;
    if (v32 != 0.0)
      v42 = 0;
    v43 = width / v20;
    if (width / v20 >= v45 / v34)
      v43 = v45 / v34;
    drawCGImageToCGContext(v12, a4, v15, v42 && v41, 0, width, v45, v25 * v43, v32 * v43, width - v31 * v43 - v25 * v43, v45 - v32 * v43 - v33 * v43);
    v13 = v46;
  }

}

- (void)_generatePrintPreview:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__UIPrintInteractionController__generatePrintPreview___block_invoke;
  v6[3] = &unk_1E9D97008;
  v7 = v4;
  v5 = v4;
  -[UIPrintInteractionController _generatePDFWithCompletionHandler:](self, "_generatePDFWithCompletionHandler:", v6);

}

uint64_t __54__UIPrintInteractionController__generatePrintPreview___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_convertToPrintableItem:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  const __CFData *v14;
  id v15;
  void *v16;
  id v17;
  CGImageSource *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;

  v4 = a3;
  if (!v4
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      ? (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass())
      : (isKindOfClass = 1),
        (getPHAssetClass(), v6 = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0) && (v6 & 1) == 0))
  {
LABEL_8:
    v7 = 0;
    goto LABEL_47;
  }
  -[UIPrintInteractionController convertedPrintableItems](self, "convertedPrintableItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIPrintInteractionController convertedPrintableItems](self, "convertedPrintableItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 != v10)
        goto LABEL_47;

      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController setConvertedPrintableItems:](self, "setConvertedPrintableItems:", v11);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v4;
    if (IsAssetURL(v12))
    {
      GetPHAssetForAssetURLSync(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_40;
LABEL_30:
      GetImageForPHAssetSync(v13);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
      if (!v7)
      {
        v14 = 0;
LABEL_42:
        v17 = 0;
        goto LABEL_43;
      }
LABEL_32:
      objc_msgSend(v7, "CIImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        ConvertCIBasedImage(v7);
        v20 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v20;
      }
      v17 = objc_retainAutorelease(v7);
      if (objc_msgSend(v17, "CGImage"))
      {
        v7 = v17;
        v14 = 0;
        v17 = v7;
      }
      else
      {
        v14 = 0;
        v7 = 0;
      }
      goto LABEL_43;
    }
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v12, 1, &v25);
    v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    v16 = v15;
    if (!v14)
    {
      NSLog(CFSTR("%s: FAILED to load data from URL=%@. Error=%@"), "-[UIPrintInteractionController _convertToPrintableItem:]", v12, v15);

      v13 = 0;
      goto LABEL_41;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      v13 = 0;
      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      getPHAssetClass();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
LABEL_40:
        v14 = 0;
        goto LABEL_41;
      }
      v13 = v4;
      goto LABEL_30;
    }
    v14 = (const __CFData *)v4;
  }
  if (!-[UIPrintInteractionController _canPrintPDFData:](self, "_canPrintPDFData:", v14))
  {
    v18 = CGImageSourceCreateWithData(v14, 0);
    v13 = v18;
    if (v18)
    {
      ImageFromImageSource(v18);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      CFRelease(v13);
      v13 = 0;
      goto LABEL_31;
    }
LABEL_41:
    v7 = 0;
    goto LABEL_42;
  }
  v14 = v14;
  v13 = 0;
  v17 = 0;
  v7 = v14;
LABEL_43:
  -[UIPrintInteractionController convertedPrintableItems](self, "convertedPrintableItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v7)
  {
    objc_msgSend(v21, "setObject:forKey:", v7, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, v4);

  }
LABEL_47:

  return v7;
}

- (void)_drawPrintItem:(id)a3 toContext:(CGContext *)a4 printAllPages:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIPrintInfo *printInfo;
  uint64_t v18;
  UIPrintPaper *printPaper;
  UIPrintPaper *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const __CFDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSUInteger v35;
  uint64_t v36;
  _QWORD v37[4];

  v5 = a5;
  -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIPrintInteractionController _addPDFWithData:toContext:addAllPages:](self, "_addPDFWithData:toContext:addAllPages:", v8, a4, v5);
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    v9 = v8;
    objc_msgSend(v9, "CIImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      ConvertCIBasedImage(v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v11;
    }
    v12 = objc_retainAutorelease(v9);
    if (!objc_msgSend(v12, "CGImage"))
    {
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v12, "size");
    v14 = v13;
    v16 = v15;
    printInfo = self->_printInfo;
    if (printInfo)
      v18 = -[UIPrintInfo outputType](printInfo, "outputType");
    else
      v18 = 1;
    printPaper = self->_printPaper;
    if (printPaper)
    {
      v20 = printPaper;
    }
    else
    {
      +[UIPrintPaper _defaultPaperForOutputType:](UIPrintPaper, "_defaultPaperForOutputType:", v18);
      v20 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
    -[UIPrintPaper _pkPaper](v20, "_pkPaper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isRoll") && !self->_printingItem)
    {
      v35 = -[NSArray count](self->_printingItems, "count");

      if (v35 < 2)
        goto LABEL_17;
      +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, -[UIPrintInfo duplex](self->_printInfo, "duplex"), v18, v14, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v22, v14, v16);
        v36 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v36;
      }
    }

LABEL_17:
    objc_msgSend(v21, "paperSize");
    v24 = v23;
    objc_msgSend(v21, "paperSize");
    if ((v24 <= v25 || v14 >= v16)
      && ((objc_msgSend(v21, "paperSize"), v27 = v26, objc_msgSend(v21, "paperSize"), v27 >= v28) || v14 <= v16))
    {
      objc_msgSend(v21, "paperSize");
      v31 = v30;
      objc_msgSend(v21, "paperSize");
      v37[0] = 0;
      v37[1] = 0;
      v37[2] = v31;
      v37[3] = v32;
      v33 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v37, 32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dictionaryWithObject:forKey:", v34, *MEMORY[0x1E0C9DB58]);
      v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v21, "paperSize");
      v29 = 0;
    }
    CGPDFContextBeginPage(a4, v29);
    CGContextSaveGState(a4);
    objc_msgSend(v12, "imageOrientation");
    objc_msgSend(v21, "printableRect");
    PKDrawImageToSheet();
    CGContextRestoreGState(a4);
    CGPDFContextEndPage(a4);

    goto LABEL_24;
  }
LABEL_25:

}

- (void)_addPDFWithData:(id)a3 toContext:(CGContext *)a4 addAllPages:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  CGDataProvider *v11;
  CGDataProvider *v12;
  CGPDFDocumentRef v13;
  CGPDFDocument *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 IsEncrypted;
  id v18;
  size_t NumberOfPages;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFAllocator *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t i;
  CGPDFPage *Page;
  CGPDFPage *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFDictionary *Mutable;
  CFDataRef v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  CGDataProvider *v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *key;
  UInt8 bytes[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[3];
  CGRect BoxRect;

  v67[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    if (a4)
    {
      v10 = objc_retainAutorelease(v8);
      v11 = CGDataProviderCreateWithData(0, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0);
      if (v11)
      {
        v12 = v11;
        v13 = CGPDFDocumentCreateWithProvider(v11);
        if (v13)
        {
          v14 = v13;
          -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            IsEncrypted = CGPDFDocumentIsEncrypted(v14);

            if (IsEncrypted)
            {
              -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
              v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              CGPDFDocumentUnlockWithPassword(v14, (const char *)objc_msgSend(v18, "cStringUsingEncoding:", 4));

            }
          }
          NumberOfPages = CGPDFDocumentGetNumberOfPages(v14);
          v53 = v12;
          v54 = v9;
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, NumberOfPages);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v67[0] = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
            v21 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "pageRanges");
            v21 = objc_claimAutoreleasedReturnValue();
          }
          v22 = (void *)v21;

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          obj = v22;
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          if (v57)
          {
            v56 = *(_QWORD *)v63;
            v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            key = (void *)*MEMORY[0x1E0C9DB58];
            v24 = *MEMORY[0x1E0C9D820];
            v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v63 != v56)
                  objc_enumerationMutation(obj);
                v58 = v26;
                v27 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v26);
                v28 = objc_msgSend(v27, "rangeValue");
                v29 = objc_msgSend(v27, "rangeValue");
                objc_msgSend(v27, "rangeValue");
                for (i = v30 + v29; v28 < i; i = v52 + v51)
                {
                  Page = CGPDFDocumentGetPage(v14, ++v28);
                  if (Page)
                  {
                    v33 = Page;
                    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
                    v34 = BoxRect.size.width / BoxRect.size.height;
                    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo", BoxRect.origin.x, BoxRect.origin.y);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "printPaper");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v36, "paperSize");
                    v38 = v37;
                    objc_msgSend(v36, "paperSize");
                    v40 = v38 / v39;
                    *(_OWORD *)bytes = 0u;
                    v61 = 0u;
                    v41 = v34 >= 1.0 || v40 <= 1.0;
                    if (!v41 || (v34 > 1.0 ? (v42 = v40 < 1.0) : (v42 = 0), v42))
                    {
                      objc_msgSend(v36, "paperSize", v40);
                      v44 = v47;
                      objc_msgSend(v36, "paperSize");
                    }
                    else
                    {
                      objc_msgSend(v36, "paperSize", v40);
                      v44 = v43;
                      objc_msgSend(v36, "paperSize");
                      v46 = v45;
                    }
                    memset(bytes, 0, sizeof(bytes));
                    *(_QWORD *)&v61 = v44;
                    *((_QWORD *)&v61 + 1) = v46;
                    Mutable = CFDictionaryCreateMutable(v23, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                    v49 = CFDataCreate(v23, bytes, 32);
                    CFDictionaryAddValue(Mutable, key, v49);
                    CFRelease(v49);
                    CGPDFContextBeginPage(a4, Mutable);
                    CFRelease(Mutable);
                    CGContextSaveGState(a4);
                    CGContextSetAllowsAntialiasing(a4, 1);
                    CGContextSetShouldAntialias(a4, 1);
                    CGContextSetAllowsFontSmoothing(a4, 0);
                    CGContextSetShouldSmoothFonts(a4, 0);
                    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
                    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    objc_msgSend(v50, "CGColor");
                    CGContextSetFontSmoothingBackgroundColor();

                    CGContextSetAllowsFontSubpixelPositioning(a4, 0);
                    CGContextSetShouldSubpixelPositionFonts(a4, 0);
                    CGContextSetAllowsFontSubpixelQuantization(a4, 0);
                    CGContextSetShouldSubpixelQuantizeFonts(a4, 0);
                    CGContextSetTextGreekingThreshold();
                    CGContextSetLineWidthThreshold();
                    CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
                    drawPDFPageToCGContext(v33, a4, v36, -[UIPrintInfo imagePDFAnnotations](self->_activePrintInfo, "imagePDFAnnotations"), v24, v25);
                    CGContextRestoreGState(a4);
                    CGPDFContextEndPage(a4);

                  }
                  v51 = objc_msgSend(v27, "rangeValue");
                  objc_msgSend(v27, "rangeValue");
                }
                v26 = v58 + 1;
              }
              while (v58 + 1 != v57);
              v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
            }
            while (v57);
          }

          CGPDFDocumentRelease(v14);
          v12 = v53;
          v9 = v54;
        }
        CGDataProviderRelease(v12);
      }
    }
  }

}

- (void)_cancelAllPreviewGeneration
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)-[NSMutableSet copy](self->_previewStates, "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setCancelled:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_printPanelDidPresent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "printInteractionControllerDidPresentPrinterOptions:", self);

}

- (void)_printPanelWillDismissWithAction:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  PKPrinter *printer;
  char v8;
  void *v9;
  void *v10;

  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    -[UIPrintInteractionController _cancelAllPreviewGeneration](self, "_cancelAllPreviewGeneration");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = WeakRetained;
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v9 = WeakRetained;
      printer = self->_printer;
      self->_printer = 0;

      if (-[UIPrintInteractionController _canPreviewContent](self, "_canPreviewContent")
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "printInteractionControllerDidFinishJob:", self);
      }
      -[UIPrintInteractionController setConvertedPrintableItems:](self, "setConvertedPrintableItems:", 0);
      v6 = v9;
    }
    if (!self->_supressNotifyDismissed)
    {
      v10 = v6;
      v8 = objc_opt_respondsToSelector();
      v6 = v10;
      if ((v8 & 1) != 0)
      {
        objc_msgSend(v10, "printInteractionControllerWillDismissPrinterOptions:", self);
        v6 = v10;
      }
    }

  }
}

- (void)_setPrinterInfoState:(int)a3
{
  uint64_t v3;
  UIPrintingProgress *v5;
  void *v6;
  UIPrintingProgress *v7;
  void *printingProgress;
  UIPrintingProgress *v9;
  void *v10;
  UIPrintingProgress *v11;
  UIPrintingProgress *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = *(_QWORD *)&a3;
  if (self->_printingProgress)
    goto LABEL_7;
  if (self->_saveFileURL)
  {
    if (!self->_showPrintingProgress)
      goto LABEL_7;
    v5 = [UIPrintingProgress alloc];
    -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__UIPrintInteractionController__setPrinterInfoState___block_invoke_2;
    v13[3] = &unk_1E9D96D90;
    v13[4] = self;
    v7 = -[UIPrintingProgress initPDFCreationWithHostingWindowScene:cancelHandler:](v5, "initPDFCreationWithHostingWindowScene:cancelHandler:", v6, v13);
    printingProgress = self->_printingProgress;
    self->_printingProgress = v7;
  }
  else
  {
    v9 = [UIPrintingProgress alloc];
    -[PKPrinter displayName](self->_printer, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController printPanelViewController](self, "printPanelViewController");
    printingProgress = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__UIPrintInteractionController__setPrinterInfoState___block_invoke;
    v14[3] = &unk_1E9D96D90;
    v14[4] = self;
    v11 = -[UIPrintingProgress initWithPrinterName:forceDisplayAsAlert:hostingWindowScene:cancelHandler:](v9, "initWithPrinterName:forceDisplayAsAlert:hostingWindowScene:cancelHandler:", v6, printingProgress == 0, v10, v14);
    v12 = self->_printingProgress;
    self->_printingProgress = v11;

  }
LABEL_7:
  if ((_DWORD)v3 == 1)
    -[UIPrintInteractionController _startPrinting](self, "_startPrinting");
  else
    -[UIPrintingProgress setPrinterInfoState:](self->_printingProgress, "setPrinterInfoState:", v3);
}

uint64_t __53__UIPrintInteractionController__setPrinterInfoState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endPrintJobWithAction:error:", 0, 0);
}

uint64_t __53__UIPrintInteractionController__setPrinterInfoState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endPrintJobWithAction:error:", 0, 0);
}

- (void)_printPanelDidDismissWithAction:(int64_t)a3
{
  id WeakRetained;
  PKPrinter *printer;
  _QWORD v7[5];

  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    -[UIPrintInteractionController setPrintPanelViewController:](self, "setPrintPanelViewController:", 0);
    -[UIPrintInteractionController setTempPreviewFileURL:](self, "setTempPreviewFileURL:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!self->_supressNotifyDismissed && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "printInteractionControllerDidDismissPrinterOptions:", self);
    if (a3 == 1 && (printer = self->_printer) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __64__UIPrintInteractionController__printPanelDidDismissWithAction___block_invoke;
      v7[3] = &unk_1E9D96F90;
      v7[4] = self;
      -[UIPrintInteractionController _setPrinterInfoState:](self, "_setPrinterInfoState:", _UIPrinterInfoGetState(printer, v7));
    }
    else
    {
      -[UIPrintInteractionController _endPrintJobWithAction:error:](self, "_endPrintJobWithAction:error:", a3, 0);
    }

  }
}

uint64_t __64__UIPrintInteractionController__printPanelDidDismissWithAction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPrinterInfoState:", a2);
}

- (void)_updateCutterBehavior
{
  __assert_rtn("-[UIPrintInteractionController _updateCutterBehavior]", "UIPrintInteractionController.m", 2353, "pkFinishingsNumbers.count == uiCutterBehaviorNumbers.count");
}

- (void)_preparePrintInfo
{
  double *v3;
  id printingItem;
  id v5;
  void *v6;
  double width;
  double height;
  const __CFURL *v9;
  CGPDFDocumentRef v10;
  CGPDFDocument *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 IsEncrypted;
  id v15;
  CGPDFPage *Page;
  CGDataProvider *v17;
  CGDataProvider *v18;
  CGPDFDocument *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  CGPDFPage *v24;
  void *v25;
  PKPrintSettings *v26;
  PKPrintSettings *printSettings;
  id v28;
  void *v29;
  int v30;
  void *v31;
  UIPrintInfoDuplex v32;
  id *v33;
  id *v34;
  void *v35;
  PKPrinter *printer;
  void *v37;
  double v38;
  double v39;
  void *v40;
  PKPrinter *v41;
  void *v42;
  void *v43;
  id v44;
  CGRect BoxRect;
  CGRect v46;

  -[UIPrintInfo _updateWithPrinter:](self->_activePrintInfo, "_updateWithPrinter:", self->_printer);
  if (!-[UIPrintInfo staple](self->_activePrintInfo, "staple")
    && !-[UIPrintInfo punch](self->_activePrintInfo, "punch"))
  {
    goto LABEL_32;
  }
  v3 = (double *)MEMORY[0x1E0C9D820];
  printingItem = self->_printingItem;
  if (printingItem)
  {
    v5 = printingItem;
  }
  else
  {
    if (-[NSArray count](self->_printingItems, "count") != 1)
    {
      v6 = 0;
      goto LABEL_8;
    }
    -[NSArray objectAtIndexedSubscript:](self->_printingItems, "objectAtIndexedSubscript:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_8:
  width = *v3;
  height = v3[1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    if (-[__CFURL isFileURL](v9, "isFileURL"))
    {
      if (-[UIPrintInteractionController _canPrintPDFURL:](self, "_canPrintPDFURL:", v9))
      {
        v10 = CGPDFDocumentCreateWithURL(v9);
        if (v10)
        {
          v11 = v10;
          -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            IsEncrypted = CGPDFDocumentIsEncrypted(v11);

            if (IsEncrypted)
            {
              -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
              v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              CGPDFDocumentUnlockWithPassword(v11, (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4));

            }
          }
          Page = CGPDFDocumentGetPage(v11, 1uLL);
          if (Page)
          {
            BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
            width = BoxRect.size.width;
            height = BoxRect.size.height;
          }
          CGPDFDocumentRelease(v11);
        }
      }
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[UIPrintInteractionController _canPrintPDFData:](self, "_canPrintPDFData:", v6))
      {
        v17 = CGDataProviderCreateWithCFData((CFDataRef)v6);
        if (v17)
        {
          v18 = v17;
          v19 = CGPDFDocumentCreateWithProvider(v17);
          CGDataProviderRelease(v18);
          if (v19)
          {
            -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = (void *)v20;
              v22 = CGPDFDocumentIsEncrypted(v19);

              if (v22)
              {
                -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
                v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                CGPDFDocumentUnlockWithPassword(v19, (const char *)objc_msgSend(v23, "cStringUsingEncoding:", 4));

              }
            }
            v24 = CGPDFDocumentGetPage(v19, 1uLL);
            if (v24)
            {
              v46 = CGPDFPageGetBoxRect(v24, kCGPDFCropBox);
              width = v46.size.width;
              height = v46.size.height;
            }
            CGPDFDocumentRelease(v19);
          }
        }
      }
    }
  }
  if (height < width)
    -[UIPrintInfo setOrientation:](self->_activePrintInfo, "setOrientation:", 1);

LABEL_32:
  -[UIPrintInfo printerID](self->_activePrintInfo, "printerID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo setPrinterID:](self->_printInfo, "setPrinterID:", v25);

  -[UIPrintInfo setDuplex:](self->_printInfo, "setDuplex:", -[UIPrintInfo duplex](self->_activePrintInfo, "duplex"));
  v26 = -[UIPrintInfo _createPrintSettingsForPrinter:](self->_activePrintInfo, "_createPrintSettingsForPrinter:", self->_printer);
  printSettings = self->_printSettings;
  self->_printSettings = v26;

  v28 = -[UIPrintInteractionController _updatePrintPaper](self, "_updatePrintPaper");
  -[UIPrintPaper _pkPaper](self->_paper, "_pkPaper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isRoll");

  if (v30)
    -[UIPrintInteractionController _updateCutterBehavior](self, "_updateCutterBehavior");
  -[UIPrintPaper _pkPaper](self->_printPaper, "_pkPaper");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPrintSettings setPaper:](self->_printSettings, "setPaper:", v31);

  v32 = -[UIPrintInfo duplex](self->_activePrintInfo, "duplex");
  v33 = (id *)MEMORY[0x1E0D80AB0];
  v34 = (id *)MEMORY[0x1E0D80AA0];
  if (v32 != UIPrintInfoDuplexShortEdge)
    v34 = (id *)MEMORY[0x1E0D80AA8];
  if (v32 != UIPrintInfoDuplexLongEdge)
    v33 = v34;
  v44 = *v33;
  v35 = (void *)MEMORY[0x1E0D80A50];
  printer = self->_printer;
  -[PKPrintSettings paper](self->_printSettings, "paper");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "paperSize");
  objc_msgSend(v35, "addLastUsedPrinter:duplexMode:lastUsedSize:forPhoto:", printer, v44, (-[UIPrintInfo outputType](self->_activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1, v38, v39);

  v40 = (void *)MEMORY[0x1E0D80A50];
  v41 = self->_printer;
  -[PKPrinter displayName](v41, "displayName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPrinter location](self->_printer, "location");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addPrinterToiCloud:displayName:location:", v41, v42, v43);

}

- (id)_paperForPDFItem:(id)a3 withDuplexMode:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v6 = a3;
  if (!self->_printer)
  {
    v9 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIPrintInteractionController _printablePDFURLSize:](self, "_printablePDFURLSize:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = *MEMORY[0x1E0C9D820];
      v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_9;
    }
    -[UIPrintInteractionController _printablePDFDataSize:](self, "_printablePDFDataSize:", v6);
  }
  v10 = v7;
  v11 = v8;
LABEL_9:
  v9 = 0;
  if (v10 > 0.0 && v11 > 0.0)
  {
    +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, a4, -[UIPrintInfo outputType](self->_activePrintInfo, "outputType"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v12, v10, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
LABEL_15:

  return v9;
}

- (id)_paperForContentType:(int64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PKPrinter *printer;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[UIPrintPaper _defaultPaperListForOutputType:](UIPrintPaper, "_defaultPaperListForOutputType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPrinter knowsReadyPaperList](self->_printer, "knowsReadyPaperList"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        printer = self->_printer;
        objc_msgSend(v10, "_pkPaper", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(printer) = -[PKPrinter isPaperReady:](printer, "isPaperReady:", v12);

        if ((printer & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v13 = v10;

      if (v13)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
  }
  objc_msgSend(v4, "objectAtIndex:", 0, (_QWORD)v15);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v13;
}

- (double)_getCutLengthFromDelegateForPaper:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (pthread_main_np() == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "printInteractionController:cutLengthForPaper:", self, v4);
    *((_QWORD *)v13 + 3) = v6;

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__UIPrintInteractionController__getCutLengthFromDelegateForPaper___block_invoke;
    block[3] = &unk_1E9D97030;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__UIPrintInteractionController__getCutLengthFromDelegateForPaper___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 128));
  objc_msgSend(WeakRetained, "printInteractionController:cutLengthForPaper:", a1[4], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v2;

}

- (id)_getChosenPaperFromDelegateForPaperList:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (pthread_main_np() == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "printInteractionController:choosePaper:", self, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v14[5];
    v14[5] = v6;

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__UIPrintInteractionController__getChosenPaperFromDelegateForPaperList___block_invoke;
    block[3] = &unk_1E9D97030;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __72__UIPrintInteractionController__getChosenPaperFromDelegateForPaperList___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 128));
  objc_msgSend(WeakRetained, "printInteractionController:choosePaper:", a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_updatePrintPaper
{
  UIPrintPaper *printPaper;
  UIPrintPaper **p_printPaper;
  id WeakRetained;
  PKPrinter *printer;
  UIPrintInfoDuplex v7;
  UIPrintInfoOutputType v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  UIPrintPaper *v29;
  UIPrintPaper *v30;
  PKPrinter *v31;
  UIPrintInfoDuplex v32;
  UIPrintInfoOutputType v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIPrintPaper *v38;
  UIPrintPaper *v39;
  UIPrintPaper *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _BOOL8 v52;
  PKPrinter *v53;
  UIPrintInfoDuplex v54;
  _QWORD *v55;
  UIPrintPaper *paper;
  id printingItem;
  UIPrintPaper *v58;
  UIPrintPaper *v59;
  UIPrintPaper *v60;
  UIPrintPaper *v61;
  void *v62;
  PKPrinter *v63;
  UIPrintInfoDuplex v64;
  UIPrintInfoOutputType v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  double v73;
  double v74;
  unint64_t v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  UIPrintPaper *v81;
  void *v83;
  void *v84;
  id v85;
  char v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  p_printPaper = &self->_printPaper;
  printPaper = self->_printPaper;
  self->_printPaper = 0;

  WeakRetained = objc_loadWeakRetained((id *)p_printPaper - 1);
  if (*(p_printPaper - 5))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      printer = self->_printer;
      v7 = -[UIPrintInfo duplex](self->_activePrintInfo, "duplex");
      v8 = -[UIPrintInfo outputType](self->_activePrintInfo, "outputType");
      -[UIPrintInteractionController _printItemContentSize](self, "_printItemContentSize");
      +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", printer, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && objc_msgSend(v11, "count"))
      {
        v83 = v10;
        v84 = v9;
        v85 = WeakRetained;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v93 = 0uLL;
          v94 = 0uLL;
          v91 = 0uLL;
          v92 = 0uLL;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v92;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v92 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
                objc_msgSend(v18, "_pkPaper", v83, v84, v85);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIPrintInteractionController _getCutLengthFromDelegateForPaper:](self, "_getCutLengthFromDelegateForPaper:", v18);
                objc_msgSend(v19, "cutToLength:");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "_updatePKPaper:", v20);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
            }
            while (v15);
          }
        }
        else
        {
          v89 = 0uLL;
          v90 = 0uLL;
          v87 = 0uLL;
          v88 = 0uLL;
          v21 = v12;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v88;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v88 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
                objc_msgSend(v26, "_pkPaper", v83, v84, v85);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "paperSize");
                objc_msgSend(v27, "cutToLength:");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "_updatePKPaper:", v28);

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
            }
            while (v23);
          }
        }

        v9 = v84;
        WeakRetained = v85;
        v10 = v83;
      }
      -[UIPrintInteractionController _getChosenPaperFromDelegateForPaperList:](self, "_getChosenPaperFromDelegateForPaperList:", v9, v83, v84, v85);
      v29 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue();
      v30 = self->_printPaper;
      self->_printPaper = v29;

    }
    else if (self->_printer && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (self->_paper)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
      }
      else
      {
        v31 = self->_printer;
        v32 = -[UIPrintInfo duplex](self->_activePrintInfo, "duplex");
        v33 = -[UIPrintInfo outputType](self->_activePrintInfo, "outputType");
        -[UIPrintInteractionController _printItemContentSize](self, "_printItemContentSize");
        +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", v31, v32, v33);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_110);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "filteredArrayUsingPredicate:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36 && objc_msgSend(v36, "count"))
      {
        objc_msgSend(v37, "objectAtIndex:", 0);
        v38 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue();
        v39 = self->_printPaper;
        self->_printPaper = v38;

        v40 = self->_printPaper;
        -[UIPrintPaper _pkPaper](v40, "_pkPaper");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintInteractionController _getCutLengthFromDelegateForPaper:](self, "_getCutLengthFromDelegateForPaper:", self->_printPaper);
        objc_msgSend(v41, "cutToLength:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintPaper _updatePKPaper:](v40, "_updatePKPaper:", v42);

      }
    }
  }
  if (!*p_printPaper)
  {
    paper = self->_paper;
    if (!paper || (objc_storeStrong((id *)p_printPaper, paper), !*p_printPaper))
    {
      printingItem = self->_printingItem;
      if (!printingItem
        || (-[UIPrintInteractionController _paperForPDFItem:withDuplexMode:](self, "_paperForPDFItem:withDuplexMode:", printingItem, -[UIPrintInfo duplex](self->_activePrintInfo, "duplex")), v58 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue(), v59 = self->_printPaper, self->_printPaper = v58, v59, !self->_printPaper))
      {
        -[UIPrintInteractionController _paperForContentType:](self, "_paperForContentType:", -[UIPrintInfo outputType](self->_activePrintInfo, "outputType"));
        v60 = (UIPrintPaper *)objc_claimAutoreleasedReturnValue();
        v61 = self->_printPaper;
        self->_printPaper = v60;

      }
    }
  }
  if (self->_printer)
  {
    v86 = 0;
    -[UIPrintPaper _pkPaper](*p_printPaper, "_pkPaper");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "imageableAreaRect");
    v52 = v47 == 0.0
       && v44 == 0.0
       && (v48 = v45, v49 = v46, objc_msgSend(v43, "paperSize"), v50 == v48)
       && (objc_msgSend(v43, "paperSize"), v51 == v49)
       || (-[UIPrintInfo outputType](self->_activePrintInfo, "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1;
    v53 = self->_printer;
    v54 = -[UIPrintInfo duplex](self->_activePrintInfo, "duplex");
    if (v54 == UIPrintInfoDuplexLongEdge)
    {
      v55 = (_QWORD *)MEMORY[0x1E0D80AB0];
    }
    else
    {
      v55 = (_QWORD *)MEMORY[0x1E0D80AA0];
      if (v54 != UIPrintInfoDuplexShortEdge)
        v55 = (_QWORD *)MEMORY[0x1E0D80AA8];
    }
    -[PKPrinter matchedPaper:preferBorderless:withDuplexMode:didMatch:](v53, "matchedPaper:preferBorderless:withDuplexMode:didMatch:", v43, v52, *v55, &v86);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v86
      || -[PKPrinter knowsReadyPaperList](self->_printer, "knowsReadyPaperList")
      && (-[PKPrinter isPaperReady:](self->_printer, "isPaperReady:", v62) & 1) == 0)
    {
      v63 = self->_printer;
      v64 = -[UIPrintInfo duplex](self->_activePrintInfo, "duplex");
      v65 = -[UIPrintInfo outputType](self->_activePrintInfo, "outputType");
      -[UIPrintInteractionController _printItemContentSize](self, "_printItemContentSize");
      +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "paperSize");
      v68 = v67;
      objc_msgSend(v43, "paperSize");
      +[UIPrintPaper bestPaperForPageSize:andContentType:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:andContentType:withPapersFromArray:", -[UIPrintInfo outputType](self->_activePrintInfo, "outputType"), v66, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70;
      if (v70)
      {
        objc_msgSend(v70, "_pkPaper");
        v72 = objc_claimAutoreleasedReturnValue();

        v62 = (void *)v72;
      }

    }
    if (objc_msgSend(v62, "isRoll") && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIPrintInteractionController _getCutLengthFromDelegateForPaper:](self, "_getCutLengthFromDelegateForPaper:", self->_printPaper);
      v74 = v73;
      v75 = objc_msgSend(v62, "minCutLength");
      if (v74 < (double)v75)
        v74 = (double)v75;
      v76 = (double)(unint64_t)objc_msgSend(v62, "maxCutLength");
      if (v74 < v76)
        v76 = v74;
      objc_msgSend(v62, "cutToLength:", v76);
      v77 = objc_claimAutoreleasedReturnValue();

      v62 = (void *)v77;
    }
    -[UIPrintPaper _updatePKPaper:](*p_printPaper, "_updatePKPaper:", v62);

  }
  if (-[UIPrintInfo orientation](self->_activePrintInfo, "orientation") == UIPrintInfoOrientationLandscape)
  {
    v78 = 1;
    if (-[PKPrinter hasPrintInfoSupported](self->_printer, "hasPrintInfoSupported"))
    {
      -[PKPrinter printInfoSupported](self->_printer, "printInfoSupported");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "objectForKey:", *MEMORY[0x1E0D80B68]);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v79) = objc_msgSend(v80, "containsObject:", *MEMORY[0x1E0D80B80]);
      if ((_DWORD)v79)
        v78 = 2;
      else
        v78 = 1;
    }
  }
  else
  {
    v78 = 0;
  }
  -[UIPrintPaper _setPaperOrientation:](self->_printPaper, "_setPaperOrientation:", v78);
  -[UIPrintInfo scalingFactor](self->_activePrintInfo, "scalingFactor");
  -[UIPrintPaper setScalingFactor:](self->_printPaper, "setScalingFactor:");
  v81 = self->_printPaper;

  return v81;
}

uint64_t __49__UIPrintInteractionController__updatePrintPaper__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "_pkPaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRoll");

  return v3;
}

uint64_t __49__UIPrintInteractionController__updatePrintPaper__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "_pkPaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRoll");

  return v3;
}

- (void)_startPrinting
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = MEMORY[0x1E0C809B0];
  if (self->_backgroundTaskIdentifier == *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __46__UIPrintInteractionController__startPrinting__block_invoke;
    v6[3] = &unk_1E9D96D90;
    v6[4] = self;
    self->_backgroundTaskIdentifier = objc_msgSend(v4, "_beginBackgroundTaskWithExpirationHandler:", v6);

  }
  -[UIPrintInteractionController _cancelAllPreviewGeneration](self, "_cancelAllPreviewGeneration");
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __46__UIPrintInteractionController__startPrinting__block_invoke_2;
  v5[3] = &unk_1E9D96D90;
  v5[4] = self;
  -[UIPrintInteractionController _cancelPreviewQueue:completionHandler:](self, "_cancelPreviewQueue:completionHandler:", 1, v5);
}

uint64_t __46__UIPrintInteractionController__startPrinting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endPrintJobWithAction:error:", 0, 0);
}

void __46__UIPrintInteractionController__startPrinting__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int v5;
  id *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  _QWORD *v28;
  _QWORD v29[5];

  objc_msgSend(*(id *)(a1 + 32), "_preparePrintInfo");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "printInteractionControllerWillStartJob:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_updateRendererWithQuality:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = 0;

  v5 = objc_msgSend(*(id *)(a1 + 32), "needRedrawWithNUp");
  v6 = *(id **)(a1 + 32);
  if (v5)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __46__UIPrintInteractionController__startPrinting__block_invoke_3;
    v29[3] = &unk_1E9D97098;
    v29[4] = v6;
    objc_msgSend(v6, "_generatePDFWithNupForPrintingCompletion:", v29);
    goto LABEL_19;
  }
  objc_msgSend(v6[30], "setPage:ofPage:", -2, 0);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "outputType") & 0xFFFFFFFFFFFFFFFDLL) == 1)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setObject:forKey:", *MEMORY[0x1E0D80C00], *MEMORY[0x1E0D80C08]);
  v7 = *(id **)(a1 + 32);
  if (v7[11])
  {
    if (objc_msgSend(v7[11], "count"))
      goto LABEL_11;
    v7 = *(id **)(a1 + 32);
  }
  objc_msgSend(v7, "_updatePageCount");
LABEL_11:
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v8 + 88), "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v8 + 312) = objc_msgSend(v9, "rangeValue");
  *(_QWORD *)(v8 + 320) = v10;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 144);
  if (v12)
  {
    objc_msgSend(v12, "prepareForDrawingPages:", *(_QWORD *)(v11 + 312), *(_QWORD *)(v11 + 320));
  }
  else if (!*(_QWORD *)(v11 + 152))
  {
    if (*(_QWORD *)(v11 + 160))
    {
      *(_QWORD *)(v11 + 216) = -1;
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 248);
      v19 = objc_msgSend(*(id *)(v17 + 256), "scaleUp");
      v20 = (_QWORD *)MEMORY[0x1E0D80BC0];
      if (!v19)
        v20 = (_QWORD *)MEMORY[0x1E0D80BB0];
      objc_msgSend(v18, "setObject:forKey:", *v20, *MEMORY[0x1E0D80BB8]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "removeObjectForKey:", *MEMORY[0x1E0D80B68]);
      v21 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      if (v21)
      {
        if (objc_msgSend(v21, "count"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "rangeValue");
          v24 = v23;
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);

          if (v24 != v25)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *MEMORY[0x1E0D80BA8]);
        }
      }
    }
    else if (*(_QWORD *)(v11 + 168))
    {
      v26 = *(void **)(v11 + 248);
      v27 = objc_msgSend(*(id *)(v11 + 256), "scaleUp");
      v28 = (_QWORD *)MEMORY[0x1E0D80BC0];
      if (!v27)
        v28 = (_QWORD *)MEMORY[0x1E0D80BB0];
      objc_msgSend(v26, "setObject:forKey:", *v28, *MEMORY[0x1E0D80BB8]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "removeObjectForKey:", *MEMORY[0x1E0D80B68]);
      v13 = -1;
      goto LABEL_15;
    }
  }
  v13 = 1;
LABEL_15:
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(v14 + 192);
  if (v15 <= 0)
    v15 = *(_QWORD *)(v14 + 176);
  objc_msgSend(*(id *)(v14 + 240), "setPage:ofPage:", v13, v15);
  v16 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v16 + 70))
  {
    objc_msgSend(*(id *)(v16 + 240), "nextPrintDelay");
    objc_msgSend((id)v16, "_printPageWithDelay:");
  }
LABEL_19:

}

void __46__UIPrintInteractionController__startPrinting__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
    objc_msgSend(*(id *)(a1 + 32), "_printPageWithDelay:", 0.0);
    v4 = v5;
  }

}

- (BOOL)_canPrintPDFData:(id)a3
{
  UIPrintInfo *activePrintInfo;
  id v4;
  void *v5;
  BOOL v6;

  activePrintInfo = self->_activePrintInfo;
  v4 = a3;
  -[UIPrintInfo pdfPassword](activePrintInfo, "pdfPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IsPrintablePDFData(v4, 1, v5);

  return v6;
}

- (CGSize)_printablePDFDataSize:(id)a3
{
  const __CFData *v4;
  double MaxCropSize;
  double v6;
  CGDataProvider *v7;
  CGDataProvider *v8;
  CGPDFDocument *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 IsEncrypted;
  id v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = (const __CFData *)a3;
  MaxCropSize = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (HasValidPDFHeader(v4))
  {
    v7 = CGDataProviderCreateWithCFData(v4);
    if (v7)
    {
      v8 = v7;
      v9 = CGPDFDocumentCreateWithProvider(v7);
      CGDataProviderRelease(v8);
      if (v9)
      {
        -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          IsEncrypted = CGPDFDocumentIsEncrypted(v9);

          if (IsEncrypted)
          {
            -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
            v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            CGPDFDocumentUnlockWithPassword(v9, (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4));

          }
        }
        MaxCropSize = GetMaxCropSize(v9);
        v6 = v14;
      }
      CGPDFDocumentRelease(v9);
    }
  }

  v15 = MaxCropSize;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)_canPrintPDFURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pdfPassword");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = IsPrintablePDFURL(v4, 1, v6);

  }
  else
  {
    v7 = IsPrintablePDFURL(v4, 1, 0);
  }

  return v7;
}

- (BOOL)_canShowPreview
{
  UIPrintInteractionController *v2;
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  UIPrintInteractionController *v13;
  void *v14;
  void *v15;
  BOOL v16;
  CGImageSourceRef v17;
  char v18;
  UIPrintFormatter *printFormatter;
  NSArray *v21;
  NSArray *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v2 = self;
  v28[1] = *MEMORY[0x1E0C80C00];
  if (self->_printingItem)
  {
    v28[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_printingItems;
  }
  v4 = v3;
  if (v3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = v3;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      v9 = 0x1E0DC3000uLL;
      v21 = v4;
      v22 = v5;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && IsAssetURL(v11))
            goto LABEL_34;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_34;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "isFileURL"))
          {
            if (-[UIPrintInteractionController printStateActive](v2, "printStateActive"))
            {
              -[UIPrintInteractionController activePrintInfo](v2, "activePrintInfo");
              v12 = v9;
              v13 = v2;
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "pdfPassword");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = IsPrintablePDFURL(v11, 0, v15);

              v2 = v13;
              v9 = v12;
              v5 = v22;
              if (v16)
                goto LABEL_34;
            }
            else if (IsPrintablePDFURL(v11, 0, 0))
            {
              goto LABEL_34;
            }
            v17 = CGImageSourceCreateWithURL((CFURLRef)v11, 0);
            if (v17)
            {
              CFRelease(v17);
LABEL_34:

              v18 = 1;
              v4 = v21;
              goto LABEL_35;
            }
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v4 = v21;
        if (v7)
          continue;
        break;
      }
    }

    goto LABEL_32;
  }
  if (!dyld_program_sdk_at_least())
  {
    printFormatter = v2->_printFormatter;
    if (!printFormatter)
    {
LABEL_32:
      v18 = 0;
      goto LABEL_35;
    }
    if ((-[UIPrintFormatter isMemberOfClass:](printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (-[UIPrintFormatter isMemberOfClass:](v2->_printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (-[UIPrintFormatter isMemberOfClass:](v2->_printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (-[UIPrintFormatter isMemberOfClass:](v2->_printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      v18 = -[UIPrintFormatter isMemberOfClass:](v2->_printFormatter, "isMemberOfClass:", objc_opt_class());
      goto LABEL_35;
    }
    goto LABEL_31;
  }
  if (v2->_printPageRenderer)
  {
LABEL_31:
    v18 = 1;
    goto LABEL_35;
  }
  v18 = v2->_printFormatter != 0;
LABEL_35:

  return v18;
}

- (BOOL)_canPreviewContent
{
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  UIPrintFormatter *printFormatter;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (self->_printingItem)
  {
    v20[0] = self->_printingItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_printingItems;
  }
  v4 = v3;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && IsAssetURL(v10))
            goto LABEL_21;
          -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", v10, (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {

LABEL_21:
            goto LABEL_22;
          }

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

    goto LABEL_29;
  }
  if (!dyld_program_sdk_at_least())
  {
    printFormatter = self->_printFormatter;
    if (!printFormatter)
    {
LABEL_29:
      v12 = 0;
      goto LABEL_30;
    }
    if ((-[UIPrintFormatter isMemberOfClass:](printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (-[UIPrintFormatter isMemberOfClass:](self->_printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (-[UIPrintFormatter isMemberOfClass:](self->_printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (-[UIPrintFormatter isMemberOfClass:](self->_printFormatter, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      v12 = -[UIPrintFormatter isMemberOfClass:](self->_printFormatter, "isMemberOfClass:", objc_opt_class());
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if (self->_printPageRenderer)
  {
LABEL_22:
    v12 = 1;
    goto LABEL_30;
  }
  v12 = self->_printFormatter != 0;
LABEL_30:

  return v12;
}

- (CGSize)_printablePDFURLSize:(id)a3
{
  const __CFURL *v4;
  double *v5;
  void *v6;
  void *v7;
  void *v8;
  double MaxCropSize;
  double v10;
  CGDataProvider *v11;
  CGDataProvider *v12;
  CGPDFDocument *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 IsEncrypted;
  id v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v4 = (const __CFURL *)a3;
  v5 = (double *)MEMORY[0x1E0C9D820];
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "readDataUpToLength:error:", 4096, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  MaxCropSize = *v5;
  v10 = v5[1];
  if (HasValidPDFHeader(v8))
  {
    v11 = CGDataProviderCreateWithURL(v4);
    if (v11)
    {
      v12 = v11;
      v13 = CGPDFDocumentCreateWithProvider(v11);
      CGDataProviderRelease(v12);
      if (v13)
      {
        -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          IsEncrypted = CGPDFDocumentIsEncrypted(v13);

          if (IsEncrypted)
          {
            -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
            v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            CGPDFDocumentUnlockWithPassword(v13, (const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4));

          }
        }
        MaxCropSize = GetMaxCropSize(v13);
        v10 = v18;
      }
      CGPDFDocumentRelease(v13);
    }
  }

  v19 = MaxCropSize;
  v20 = v10;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_ensurePDFIsUnlockedFirstAttempt:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  CGDataProvider *v12;
  CGDataProvider *v13;
  CGPDFDocument *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void (**v32)(id, _QWORD);
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  CGPDFDocument *v45;
  _QWORD v46[4];
  id v47;
  UIPrintInteractionController *v48;
  id v49;
  void (**v50)(id, _QWORD);
  CGPDFDocument *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  CGPDFDocument *v56;
  _QWORD v57[6];

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[NSArray count](self->_printingItems, "count") == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_printingItems, "objectAtIndexedSubscript:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->_printingItem;
  }
  v8 = v7;
  if (!v7)
    goto LABEL_22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "readDataUpToLength:error:", 4096, 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }
  if (!HasValidPDFHeader(v9)
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      ? (v12 = CGDataProviderCreateWithURL((CFURLRef)v8))
      : (v12 = CGDataProviderCreateWithCFData((CFDataRef)v8)),
        (v13 = v12) == 0 || (v14 = CGPDFDocumentCreateWithProvider(v12), CGDataProviderRelease(v13), !v14)))
  {
LABEL_21:

LABEL_22:
    v6[2](v6, 0);
    goto LABEL_23;
  }
  if (CGPDFDocumentAllowsPrinting(v14))
  {
    CGPDFDocumentRelease(v14);
    goto LABEL_21;
  }
  v45 = v14;
  -[UIPrintInteractionController hostingWindowScene](self, "hostingWindowScene");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_findUISceneForLegacyInterfaceOrientation");
    v15 = objc_claimAutoreleasedReturnValue();

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v15);
  objc_storeStrong((id *)&self->_alertWindow, v17);
  objc_msgSend(v17, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v18);

  objc_msgSend(v17, "setWindowLevel:", *MEMORY[0x1E0DC5638]);
  v42 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  -[UIWindow setRootViewController:](self->_alertWindow, "setRootViewController:");
  -[UIWindow makeKeyAndVisible](self->_alertWindow, "makeKeyAndVisible");
  v19 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v43 = v17;
  v44 = (void *)v15;
  if (v4)
    v22 = CFSTR("Without the proper password, you do not have permission to print this document.");
  else
    v22 = CFSTR("Incorrect password for document.");
  objc_msgSend(v20, "localizedStringForKey:value:table:", v22, v22, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Enter the password to unlock printing."), CFSTR("Enter the password to unlock printing."), CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v23, v25, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v57[0] = MEMORY[0x1E0C809B0];
  v26 = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke;
  v57[3] = &unk_1E9D96D90;
  v57[4] = self;
  v27 = (void *)MEMORY[0x1D82A9A48](v57);
  v39 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("PRINT_INTERACTION_CANCEL_BUTTON"), CFSTR("Cancel"), CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v26;
  v52[1] = 3221225472;
  v52[2] = __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_2;
  v52[3] = &unk_1E9D970C0;
  v56 = v45;
  v30 = v40;
  v53 = v30;
  v31 = v27;
  v54 = v31;
  v32 = v6;
  v55 = v32;
  objc_msgSend(v39, "actionWithTitle:style:handler:", v29, 1, v52);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAction:", v33);

  v41 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("PRINT_INTERACTION_OK_BUTTON"), CFSTR("OK"), CFSTR("Localizable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_3;
  v46[3] = &unk_1E9D970E8;
  v47 = v30;
  v48 = self;
  v49 = v31;
  v51 = v45;
  v50 = v32;
  v36 = v31;
  v37 = v30;
  objc_msgSend(v41, "actionWithTitle:style:handler:", v35, 0, v46);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAction:", v38);

  objc_msgSend(v37, "addTextFieldWithConfigurationHandler:", &__block_literal_global_129);
  objc_msgSend(v42, "presentViewController:animated:completion:", v37, 0, 0);

LABEL_23:
}

void __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setHidden:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

uint64_t __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_2(uint64_t a1)
{
  CGPDFDocumentRelease(*(CGPDFDocumentRef *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CGPDFDocument *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPdfPassword:", v3);

  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "setPdfPassword:", v4);

  v5 = *(CGPDFDocument **)(a1 + 64);
  objc_msgSend(v7, "text");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGPDFDocumentUnlockWithPassword(v5, (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4));

  LOBYTE(v5) = CGPDFDocumentAllowsPrinting(*(CGPDFDocumentRef *)(a1 + 64));
  CGPDFDocumentRelease(*(CGPDFDocumentRef *)(a1 + 64));
  if ((v5 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 40), "_ensurePDFIsUnlockedFirstAttempt:completionHandler:", 0, *(_QWORD *)(a1 + 56));

}

void __83__UIPrintInteractionController__ensurePDFIsUnlockedFirstAttempt_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a2;
  objc_msgSend(v2, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Password"), CFSTR("Password"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

  objc_msgSend(v5, "setSecureTextEntry:", 1);
}

- (BOOL)_printingItemIsReallyTallPDF
{
  double v3;
  double v4;
  CGDataProvider *v5;
  double v6;
  double v7;
  CGDataProvider *v8;
  double v9;
  double v10;
  CGPDFDocument *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 IsEncrypted;
  id v15;
  CGPDFDictionary *Info;
  __CFString *v17;
  CGPDFStringRef value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIPrintInteractionController _printablePDFURLSize:](self, "_printablePDFURLSize:", self->_printingItem);
    LOBYTE(v5) = 0;
    if (v4 <= 0.0)
      return (char)v5;
    v6 = v3;
    if (v3 <= 0.0)
      return (char)v5;
    v7 = v4;
    v8 = CGDataProviderCreateWithURL((CFURLRef)self->_printingItem);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    -[UIPrintInteractionController _printablePDFDataSize:](self, "_printablePDFDataSize:", self->_printingItem);
    LOBYTE(v5) = 0;
    if (v10 <= 0.0)
      return (char)v5;
    v6 = v9;
    if (v9 <= 0.0)
      return (char)v5;
    v7 = v10;
    v8 = CGDataProviderCreateWithCFData((CFDataRef)self->_printingItem);
  }
  v5 = v8;
  if (!v8)
    return (char)v5;
  v11 = CGPDFDocumentCreateWithProvider(v8);
  CGDataProviderRelease(v5);
  if (!v11)
  {
LABEL_18:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    IsEncrypted = CGPDFDocumentIsEncrypted(v11);

    if (IsEncrypted)
    {
      -[UIPrintInfo pdfPassword](self->_activePrintInfo, "pdfPassword");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGPDFDocumentUnlockWithPassword(v11, (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4));

    }
  }
  LOBYTE(v5) = 0;
  if (CGPDFDocumentGetNumberOfPages(v11) == 1 && v7 / v6 > 3.0)
  {
    Info = CGPDFDocumentGetInfo(v11);
    if (Info)
    {
      value = 0;
      CGPDFDictionaryGetString(Info, "Keywords", &value);
      v17 = (__CFString *)CGPDFStringCopyTextString(value);
      LOBYTE(v5) = -[__CFString containsString:](v17, "containsString:", CFSTR("com.apple.MarkupPDF"));

    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  CGPDFDocumentRelease(v11);
  return (char)v5;
}

- (void)_printPageWithDelay:(double)a3
{
  dispatch_time_t v5;
  _QWORD block[5];
  id v7;
  id location;

  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    objc_initWeak(&location, self);
    v5 = dispatch_time(0, (uint64_t)a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__UIPrintInteractionController__printPageWithDelay___block_invoke;
    block[3] = &unk_1E9D97178;
    objc_copyWeak(&v7, &location);
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __52__UIPrintInteractionController__printPageWithDelay___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "printStateActive"))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__UIPrintInteractionController__printPageWithDelay___block_invoke_2;
    v5[3] = &unk_1E9D97150;
    objc_copyWeak(&v6, v2);
    objc_msgSend(v4, "addOperationWithBlock:", v5);
    objc_destroyWeak(&v6);
  }

}

void __52__UIPrintInteractionController__printPageWithDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "printStateActive"))
    objc_msgSend(WeakRetained, "_printPage");

}

- (void)_printPage
{
  void *v3;
  void *nupFileURL;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    -[UIPrintInteractionController rendererToUse](self, "rendererToUse");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    nupFileURL = self->_nupFileURL;
    if (v3)
    {
      if (!nupFileURL)
      {
        -[UIPrintInteractionController _printPageWithRenderer:](self, "_printPageWithRenderer:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintInteractionController _completePrintPageWithError:](self, "_completePrintPageWithError:", v5);
LABEL_9:

        return;
      }
    }
    else if (!nupFileURL)
    {
      nupFileURL = self->_printingItem;
      if (!nupFileURL)
      {
        -[NSArray objectAtIndex:](self->_printingItems, "objectAtIndex:", self->_currentPage);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v6 = nupFileURL;
LABEL_8:
    v5 = v6;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__UIPrintInteractionController__printPage__block_invoke;
    v7[3] = &unk_1E9D971A0;
    objc_copyWeak(&v8, &location);
    -[UIPrintInteractionController _printItemAsync:completionHandler:](self, "_printItemAsync:completionHandler:", v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
}

void __42__UIPrintInteractionController__printPage__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_completePrintPageWithError:", v3);

}

- (void)_completePrintPageWithError:(id)a3
{
  unint64_t v4;
  int64_t pagesDrawn;
  unint64_t currentPage;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  unint64_t v15;
  void *v16;
  NSUInteger v17;
  UIPrintPageRenderer *printPageRenderer;
  NSUInteger location;
  BOOL v20;
  NSUInteger v21;
  int64_t pageCount;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t)a3;
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    if (self->_printingItem || self->_printingItems || self->_nupFileURL)
      pagesDrawn = -1;
    else
      pagesDrawn = self->_pagesDrawn;
    currentPage = self->_currentPage;
    if (currentPage != -1)
    {
      if (currentPage == self->_currentRange.location + self->_currentRange.length - 1)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = self->_pageRanges;
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if (objc_msgSend(v12, "rangeValue", (_QWORD)v23) == self->_currentRange.location
                && v13 == self->_currentRange.length)
              {
                v15 = -[NSArray count](self->_pageRanges, "count");
                if (v15 > -[NSArray indexOfObject:](self->_pageRanges, "indexOfObject:", v12) + 1)
                {
                  -[NSArray objectAtIndexedSubscript:](self->_pageRanges, "objectAtIndexedSubscript:", -[NSArray indexOfObject:](self->_pageRanges, "indexOfObject:", v12) + 1);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  self->_currentRange.location = objc_msgSend(v16, "rangeValue");
                  self->_currentRange.length = v17;

                  self->_currentPage = (int)(self->_currentRange.location - 1);
                  printPageRenderer = self->_printPageRenderer;
                  if (printPageRenderer)
                    -[UIPrintPageRenderer prepareForDrawingPages:](printPageRenderer, "prepareForDrawingPages:");
                  goto LABEL_24;
                }
              }
            }
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_24:

      }
      currentPage = self->_currentPage + 1;
      self->_currentPage = currentPage;
    }
    if (v4 | (unint64_t)self->_nupFileURL
      || (self->_pageCount & 0x8000000000000000) == 0
      && ((location = self->_currentRange.location, v20 = currentPage >= location, v21 = currentPage - location, !v20)
       || v21 >= self->_currentRange.length)
      || currentPage == -1)
    {
      -[UIPrintingProgress setPage:ofPage:](self->_printingProgress, "setPage:ofPage:", -1, 0, (_QWORD)v23);
      -[UIPrintInteractionController _endPrintJobWithAction:error:](self, "_endPrintJobWithAction:error:", 1, v4);
    }
    else
    {
      if (self->_pageCountWithRanges <= 0)
        pageCount = self->_pageCount;
      else
        pageCount = self->_pageCountWithRanges;
      -[UIPrintingProgress setPage:ofPage:](self->_printingProgress, "setPage:ofPage:", pagesDrawn, pageCount, (_QWORD)v23);
      if (!self->_manualPrintPageEnabled)
      {
        -[UIPrintingProgress nextPrintDelay](self->_printingProgress, "nextPrintDelay");
        -[UIPrintInteractionController _printPageWithDelay:](self, "_printPageWithDelay:");
      }
    }
  }

}

- (void)_printItemAsync:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  CGImageSource *v25;
  CGImageSource *v26;
  CFStringRef Type;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  UIPrintPaper *v32;
  void *v33;
  PKPrinter *v34;
  UIPrintPaper *v35;
  void *v36;
  BOOL v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  void *v53;
  PKPrinter *v54;
  PKPrintSettings *v55;
  PKPrinter *v56;
  PKPrinter *v57;
  _BOOL4 v58;
  UIPrintInfoDuplex v59;
  UIPrintInfoOutputType v60;
  uint64_t v61;
  double v62;
  double v63;
  const __CFDictionary *v64;
  CGContext *v65;
  CGContext *v66;
  BOOL v67;
  PKPrinter *v68;
  _BOOL4 v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  PKPrintSettings *printSettings;
  void *v77;
  CGDataConsumer *consumer;
  PKPrinter *printer;
  PKPrinter *v80;
  id v81;
  _QWORD v82[5];
  id v83;
  uint64_t *v84;
  _QWORD v85[4];
  id v86;
  uint64_t *v87;
  _QWORD v88[5];
  id v89;
  uint64_t *v90;
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  CGRect mediaBox;
  CGDataConsumerCallbacks cbks;
  PKPrinter *info;
  uint64_t v101;
  void *values;
  void *keys[4];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = __Block_byref_object_copy_;
    v96 = __Block_byref_object_dispose_;
    v97 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      v9 = 0;
      v81 = 0;
      v10 = 0;
      v11 = 0;
      if (!v8)
        goto LABEL_17;
LABEL_46:
      if (!-[PKPrinter startJob:ofType:](self->_printer, "startJob:ofType:", self->_printSettings, v11))
      {
        v32 = self->_printPaper;
        -[UIPrintPaper _pkPaper](v32, "_pkPaper");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "isRoll") && !self->_printingItem)
        {
          v58 = -[NSArray count](self->_printingItems, "count") > 1;

          if (!v58)
            goto LABEL_50;
          printer = self->_printer;
          v59 = -[UIPrintInfo duplex](self->_printInfo, "duplex");
          v60 = -[UIPrintInfo outputType](self->_printInfo, "outputType");
          objc_msgSend(v8, "size");
          +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", printer, v59, v60);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v8, "size");
            +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v33);
            v61 = objc_claimAutoreleasedReturnValue();

            v32 = (UIPrintPaper *)v61;
          }
        }

LABEL_50:
        v34 = self->_printer;
        v8 = v8;
        v80 = v34;
        v35 = v32;
        objc_msgSend(v8, "CIImage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36 == 0;

        v38 = v8;
        if (!v37)
        {
          ConvertCIBasedImage(v8);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v39 = objc_retainAutorelease(v38);
        if (objc_msgSend(v39, "CGImage"))
        {
          info = v80;
          v101 = 0;
          cbks = (CGDataConsumerCallbacks)xmmword_1E9D972C8;
          consumer = CGDataConsumerCreate(&info, &cbks);
          if (consumer)
          {
            memset(&mediaBox, 0, sizeof(mediaBox));
            objc_msgSend(v39, "size");
            v41 = v40;
            v43 = v42;
            -[UIPrintPaper paperSize](v35, "paperSize");
            v45 = v44;
            -[UIPrintPaper paperSize](v35, "paperSize");
            if ((v45 <= v46 || v41 >= v43)
              && ((-[UIPrintPaper paperSize](v35, "paperSize"),
                   v48 = v47,
                   -[UIPrintPaper paperSize](v35, "paperSize"),
                   v48 >= v49)
               || v41 <= v43))
            {
              -[UIPrintPaper paperSize](v35, "paperSize");
              v51 = v62;
              -[UIPrintPaper paperSize](v35, "paperSize");
              v52 = v63;
            }
            else
            {
              -[UIPrintPaper paperSize](v35, "paperSize");
              v51 = v50;
              -[UIPrintPaper paperSize](v35, "paperSize");
            }
            mediaBox.origin.x = 0.0;
            mediaBox.origin.y = 0.0;
            mediaBox.size.width = v51;
            mediaBox.size.height = v52;
            v64 = (const __CFDictionary *)GetDefaultPDFContextAuxilliaryInfo___auxilliaryInfo;
            if (!GetDefaultPDFContextAuxilliaryInfo___auxilliaryInfo)
            {
              keys[0] = *(void **)MEMORY[0x1E0C9DB70];
              values = (void *)*MEMORY[0x1E0C9AE40];
              v64 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              GetDefaultPDFContextAuxilliaryInfo___auxilliaryInfo = (uint64_t)v64;
            }
            v65 = CGPDFContextCreate(consumer, &mediaBox, v64);
            v66 = v65;
            if (v65)
            {
              CGPDFContextBeginPage(v65, 0);
              objc_msgSend(v39, "imageOrientation");
              -[UIPrintPaper paperSize](v35, "paperSize");
              -[UIPrintPaper printableRect](v35, "printableRect");
              PKDrawImageToSheet();
              CGPDFContextEndPage(v66);
              CGPDFContextClose(v66);
              CGContextRelease(v66);
            }
            CGDataConsumerRelease(consumer);
          }
          v67 = (_BYTE)v101 == 0;

          if (!v67)
          {
            v68 = self->_printer;
            v88[0] = MEMORY[0x1E0C809B0];
            v88[1] = 3221225472;
            v88[2] = __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke;
            v88[3] = &unk_1E9D971C8;
            v88[4] = self;
            v90 = &v92;
            v89 = v7;
            -[PKPrinter finishJobCompletionHandler:](v68, "finishJobCompletionHandler:", v88);

          }
        }
        else
        {

        }
      }
LABEL_82:

      _Block_object_dispose(&v92, 8);
      goto LABEL_83;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v6;
      if (v13)
      {
        v9 = v13;
        GetImageUTI(0, v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
        {
          PrintableMIMEType(v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v81 = 0;
            v10 = 0;
LABEL_28:

            goto LABEL_29;
          }
          if (IsAssetURL(v9))
          {
            GetPHAssetForAssetURLSync(v9);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v81 = (id)v19;
              v10 = 0;
              goto LABEL_27;
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 3, 0);
            v23 = objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v10 = 0;
            v22 = (void *)v93[5];
            v93[5] = v23;
          }
          else
          {
            v20 = v93;
            v91 = (id)v93[5];
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 1, &v91);
            v10 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v91;
            v22 = (void *)v20[5];
            v20[5] = (uint64_t)v21;
          }

          v81 = 0;
          goto LABEL_27;
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 3, 0);
        v18 = objc_claimAutoreleasedReturnValue();
        v81 = 0;
        v10 = 0;
        v9 = (void *)v93[5];
        v93[5] = v18;
LABEL_27:

        v9 = 0;
        v11 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v6;
        v81 = 0;
        v9 = 0;
        v11 = 0;
LABEL_29:
        if (!v10)
        {
          v8 = 0;
          goto LABEL_43;
        }
        if (-[UIPrintInteractionController _canPrintPDFData:](self, "_canPrintPDFData:", v10))
        {
          v24 = (id)*MEMORY[0x1E0D80AC8];

          v8 = 0;
          v11 = v24;
        }
        else
        {
          v25 = CGImageSourceCreateWithData((CFDataRef)v10, 0);
          v26 = v25;
          if (v25)
          {
            Type = CGImageSourceGetType(v25);
            PrintableMIMEType((uint64_t)Type);
            v28 = (id)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              v8 = 0;
            }
            else
            {
              ImageFromImageSource(v26);
              v8 = (id)objc_claimAutoreleasedReturnValue();
              v28 = (id)*MEMORY[0x1E0D80AC8];

              v10 = 0;
            }
            CFRelease(v26);
            v11 = v28;
          }
          else
          {
            v8 = 0;
          }
        }
        if (!v10 || v11)
        {
LABEL_43:
          if (v81)
          {
            GetImageForPHAssetSync(v81);
            v31 = objc_claimAutoreleasedReturnValue();

            v8 = (id)v31;
          }
          if (v8)
            goto LABEL_46;
          if (!v9)
          {
            if (v10)
            {
              if (!-[PKPrinter startJob:ofType:](self->_printer, "startJob:ofType:", self->_printSettings, v11))
              {
                v56 = self->_printer;
                v10 = objc_retainAutorelease(v10);
                if (!-[PKPrinter sendData:ofLength:](v56, "sendData:ofLength:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length")))
                {
                  v57 = self->_printer;
                  v82[0] = MEMORY[0x1E0C809B0];
                  v82[1] = 3221225472;
                  v82[2] = __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_3;
                  v82[3] = &unk_1E9D971C8;
                  v82[4] = self;
                  v84 = &v92;
                  v83 = v7;
                  -[PKPrinter finishJobCompletionHandler:](v57, "finishJobCompletionHandler:", v82);

                }
              }
              v8 = 0;
              v9 = 0;
              goto LABEL_82;
            }
            goto LABEL_17;
          }
          -[UIPrintPaper _pkPaper](self->_printPaper, "_pkPaper");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v53, "isRoll") && !self->_printingItem)
          {
            v69 = -[NSArray count](self->_printingItems, "count") > 1;

            if (!v69)
              goto LABEL_63;
            -[UIPrintInteractionController _printItemContentSize:](self, "_printItemContentSize:", v6);
            v71 = v70;
            v73 = v72;
            +[UIPrintPaper _readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:](UIPrintPaper, "_readyPaperListForPrinter:withDuplexMode:forContentType:contentSize:", self->_printer, -[UIPrintInfo duplex](self->_printInfo, "duplex"), -[UIPrintInfo outputType](self->_printInfo, "outputType"), v70, v72);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53)
            {
              +[UIPrintPaper bestPaperForPageSize:withPapersFromArray:](UIPrintPaper, "bestPaperForPageSize:withPapersFromArray:", v53, v71, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v74;
              if (v74)
              {
                printSettings = self->_printSettings;
                objc_msgSend(v74, "_pkPaper");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKPrintSettings setPaper:](printSettings, "setPaper:", v77);

              }
            }
          }

LABEL_63:
          v54 = self->_printer;
          v55 = self->_printSettings;
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_2;
          v85[3] = &unk_1E9D971F0;
          v87 = &v92;
          v86 = v7;
          -[PKPrinter printURL:ofType:printSettings:completionHandler:](v54, "printURL:ofType:printSettings:completionHandler:", v9, v11, v55, v85);

          v8 = 0;
          goto LABEL_82;
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 3, 0);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v93[5];
        v93[5] = v29;

LABEL_42:
        v10 = 0;
        v11 = 0;
        goto LABEL_43;
      }
      getPHAssetClass();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v81 = v6;
        v9 = 0;
        v8 = 0;
        goto LABEL_42;
      }
    }
    v81 = 0;
    v11 = 0;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 3, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v93[5];
    v93[5] = v16;

    if (v7)
      (*((void (**)(id, uint64_t))v7 + 2))(v7, v93[5]);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_82;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
LABEL_83:

}

uint64_t __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  if (a2)
  {
    objc_msgSend(*(id *)(a1[4] + 96), "abortJobCompletionHandler:", 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 4, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

uint64_t __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  if (a2 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 4, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

uint64_t __66__UIPrintInteractionController__printItemAsync_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  if (a2)
  {
    objc_msgSend(*(id *)(a1[4] + 96), "abortJobCompletionHandler:", 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 4, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (BOOL)needRedrawWithNUp
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[UIPrintInteractionController _canShowLayout](self, "_canShowLayout"))
    return 0;
  -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "nUpActive") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "borderType"))
    {
      v4 = 1;
    }
    else
    {
      -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "bookletStyle") <= 0)
      {
        -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "flipHorizontal");

      }
      else
      {
        v4 = 1;
      }

    }
  }

  return v4;
}

- (id)_createDocInfoDict
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIPrintPaper *paper;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFData *v13;
  CGDataProvider *v14;
  CGDataProvider *v15;
  CGPDFDocument *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 IsEncrypted;
  id v30;
  CGPDFDictionary *Info;
  CGPDFDictionary *v32;
  CFStringRef v33;
  __CFString *v34;
  CFStringRef v35;
  __CFString *v36;
  CFStringRef v37;
  __CFString *v38;
  void *v39;
  CGPDFDocument *v41;
  CGPDFArrayRef v42;
  CGPDFStringRef value;

  GetAppName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInfo jobName](self->_activePrintInfo, "jobName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    GetDefaultJobName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = *MEMORY[0x1E0C9DB88];
  v6 = *MEMORY[0x1E0C9DB40];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x1E0C9DB88], v3, *MEMORY[0x1E0C9DB40], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  paper = self->_paper;
  if (paper)
  {
    -[UIPrintPaper _keywordForPDFMetadata](paper, "_keywordForPDFMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UIPrintPaper _keywordForPDFMetadata](self->_paper, "_keywordForPDFMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x1E0C9DB50]);

    }
  }
  -[UIPrintInteractionController printingItem](self, "printingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIPrintInteractionController printingItem](self, "printingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintInteractionController _convertToPrintableItem:](self, "_convertToPrintableItem:", v12);
    v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_35;
    v14 = CGDataProviderCreateWithCFData(v13);
    if (!v14)
      goto LABEL_35;
    v15 = v14;
    v16 = CGPDFDocumentCreateWithProvider(v14);
    CGDataProviderRelease(v15);
    if (!v16)
      goto LABEL_35;
    v17 = CGPDFDocumentCopyOutputIntents();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v7, "setObject:forKey:", v17, *MEMORY[0x1E0C9DB60]);

    }
    -[UIPrintInteractionController pdfPassword](self, "pdfPassword");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[UIPrintInteractionController pdfPassword](self, "pdfPassword");
      v41 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      v16 = v41;
      if (v22)
      {
        -[UIPrintInteractionController pdfPassword](self, "pdfPassword");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v23, *MEMORY[0x1E0C9DB68]);

        -[UIPrintInteractionController pdfPassword](self, "pdfPassword");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v24, *MEMORY[0x1E0C9DB98]);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CGPDFDocumentAllowsPrinting(v16));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v25, *MEMORY[0x1E0C9DB20]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CGPDFDocumentAllowsCopying(v16));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v26, *MEMORY[0x1E0C9DB18]);

    objc_msgSend(v7, "setObject:forKey:", CFSTR("pdftopdf filter"), v6);
    -[UIPrintInteractionController pdfPassword](self, "pdfPassword");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      IsEncrypted = CGPDFDocumentIsEncrypted(v16);

      if (IsEncrypted)
      {
        -[UIPrintInteractionController pdfPassword](self, "pdfPassword");
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGPDFDocumentUnlockWithPassword(v16, (const char *)objc_msgSend(v30, "cStringUsingEncoding:", 4));

      }
    }
    Info = CGPDFDocumentGetInfo(v16);
    if (Info)
    {
      v32 = Info;
      v42 = 0;
      value = 0;
      if (CGPDFDictionaryGetString(Info, "Title", &value))
      {
        v33 = CGPDFStringCopyTextString(value);
        if (v33)
        {
          v34 = (__CFString *)v33;
          objc_msgSend(v7, "setObject:forKey:", v33, v5);

        }
      }
      if (CGPDFDictionaryGetString(v32, "Author", &value))
      {
        v35 = CGPDFStringCopyTextString(value);
        if (v35)
        {
          v36 = (__CFString *)v35;
          objc_msgSend(v7, "setObject:forKey:", v35, *MEMORY[0x1E0C9DB30]);

        }
      }
      if (CGPDFDictionaryGetString(v32, "Subject", &value))
      {
        v37 = CGPDFStringCopyTextString(value);
        if (v37)
        {
          v38 = (__CFString *)v37;
          objc_msgSend(v7, "setObject:forKey:", v37, *MEMORY[0x1E0C9DB80]);

        }
      }
      if (CGPDFDictionaryGetString(v32, "Keywords", &value))
      {
        v39 = (void *)CGPDFStringCopyTextString(value);
        if (!v39)
          goto LABEL_34;
      }
      else
      {
        if (!CGPDFDictionaryGetArray(v32, "AAPL:Keywords", &v42))
          goto LABEL_34;
        v39 = v42;
        if (!v42)
          goto LABEL_34;
      }
      objc_msgSend(v7, "setObject:forKey:", v39, *MEMORY[0x1E0C9DB50]);

    }
LABEL_34:
    CGPDFDocumentRelease(v16);
LABEL_35:

  }
  return v7;
}

- (CGContext)_newSaveContext:(id)a3 withMediaRect:(CGRect)a4
{
  const __CFURL *v5;
  const __CFDictionary *v6;
  CGContext *v7;
  CGRect v9;

  v9 = a4;
  if (!a3)
    return 0;
  v5 = (const __CFURL *)a3;
  -[UIPrintInteractionController _createDocInfoDict](self, "_createDocInfoDict", *(_QWORD *)&v9.origin.x, *(_QWORD *)&v9.origin.y, *(_QWORD *)&v9.size.width, *(_QWORD *)&v9.size.height);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = CGPDFContextCreateWithURL(v5, &v9, v6);

  return v7;
}

- (id)_printPageWithRenderer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger location;
  NSUInteger length;
  NSURL *saveFileURL;
  CGContext *v13;
  CGContext *v14;
  void *v15;
  PKPrinter *printer;
  void *v17;
  int64_t currentPage;
  void *v19;

  v4 = a3;
  if (!-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (self->_currentPage != self->_currentRange.location)
    goto LABEL_13;
  -[NSArray firstObject](self->_pageRanges, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;
  location = self->_currentRange.location;
  length = self->_currentRange.length;

  if (location != v6 || length != v8)
    goto LABEL_13;
  saveFileURL = self->_saveFileURL;
  if (saveFileURL)
  {
    objc_msgSend(v4, "paperRect");
    v13 = -[UIPrintInteractionController _newSaveContext:withMediaRect:](self, "_newSaveContext:withMediaRect:", saveFileURL);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v4, "_startPrintJobContext:", v13);
      CGContextRelease(v14);
LABEL_13:
      v15 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    printer = self->_printer;
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(printer) = objc_msgSend(v4, "_startPrintJobContext:printInfo:printSettings:", printer, v17, self->_printSettings);

    if ((printer & 1) != 0)
      goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive") && !v15)
  {
    currentPage = self->_currentPage;
    -[UIPrintInteractionController activePrintInfo](self, "activePrintInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scalingFactor");
    objc_msgSend(v4, "_drawPage:withScale:drawingToPDF:", currentPage, 1);

  }
  if (-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    if (!v15)
    {
      ++self->_pagesDrawn;
      if (self->_pageCount < 0)
        self->_pageCount = objc_msgSend(v4, "numberOfPages");
    }
  }
LABEL_21:

  return v15;
}

- (void)_endPrintJobWithAction:(int64_t)a3 error:(id)a4
{
  id v6;
  UIPrintInteractionController *v7;
  id temporaryRetainCycle;
  BOOL v9;
  _BOOL8 v10;
  char v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v6 = a4;
  v7 = objc_retainAutorelease(self);
  temporaryRetainCycle = v7->_temporaryRetainCycle;
  v7->_temporaryRetainCycle = 0;

  if (-[UIPrintInteractionController printStateActive](v7, "printStateActive"))
  {
    v9 = a3 == 0;
    v10 = a3 == 0;
    v11 = !v9;
    -[UIPrintInteractionController _cancelAllPreviewGeneration](v7, "_cancelAllPreviewGeneration");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke;
    v12[3] = &unk_1E9D96E50;
    v12[4] = v7;
    v14 = v11;
    v13 = v6;
    -[UIPrintInteractionController _cancelPreviewQueue:completionHandler:](v7, "_cancelPreviewQueue:completionHandler:", v10, v12);

  }
}

void __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  char v18;
  char v19[1024];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "rendererToUse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_endPrintJobContext");
  if (*(_BYTE *)(a1 + 48) && !*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "finishJobCompletionHandler:", 0);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "abortJobCompletionHandler:", 0);
  v4 = *(id **)(a1 + 32);
  if (v4[34] && (!*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v4[34], "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getCString:maxLength:encoding:", v19, 1024, 4);

    unlink(v19);
    v4 = *(id **)(a1 + 32);
  }
  objc_msgSend(v4, "setConvertedPrintableItems:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  v7 = *MEMORY[0x1E0DC4878];
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != *MEMORY[0x1E0DC4878]
     || objc_msgSend((id)*MEMORY[0x1E0DC4730], "_taskSuspendingUnsupported"))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "printInteractionControllerDidFinishJob:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "endProgress");
  objc_msgSend(*(id *)(a1 + 32), "_completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = pthread_main_np();
    v10 = *(_QWORD *)(a1 + 32);
    if (v9 == 1 || *(_QWORD *)(v10 + 272))
    {
      v8[2](v8, v10, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke_2;
      block[3] = &unk_1E9D97218;
      v12 = v8;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v17 = v12;
      block[4] = v13;
      v18 = *(_BYTE *)(a1 + 48);
      v16 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_cleanPrintState");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v7;
  }

}

uint64_t __61__UIPrintInteractionController__endPrintJobWithAction_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (id)appOptionsViewController
{
  UIPrintInteractionControllerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "performSelector:", sel_appOptionsViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_completionHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)set_completionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(UIPrintInfo *)printInfo
{
  objc_storeStrong((id *)&self->_printInfo, printInfo);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)showsPageRange
{
  return self->_showsPageRange;
}

- (void)setShowsPageRange:(BOOL)showsPageRange
{
  self->_showsPageRange = showsPageRange;
}

- (BOOL)showsNumberOfCopies
{
  return self->_showsNumberOfCopies;
}

- (void)setShowsNumberOfCopies:(BOOL)showsNumberOfCopies
{
  self->_showsNumberOfCopies = showsNumberOfCopies;
}

- (BOOL)showsPaperSelectionForLoadedPapers
{
  return self->_showsPaperSelectionForLoadedPapers;
}

- (void)setShowsPaperSelectionForLoadedPapers:(BOOL)showsPaperSelectionForLoadedPapers
{
  self->_showsPaperSelectionForLoadedPapers = showsPaperSelectionForLoadedPapers;
}

- (BOOL)showsPaperOrientation
{
  return self->_showsPaperOrientation;
}

- (void)setShowsPaperOrientation:(BOOL)showsPaperOrientation
{
  self->_showsPaperOrientation = showsPaperOrientation;
}

- (UIPrintPaper)printPaper
{
  return self->_printPaper;
}

- (UIPrintPageRenderer)printPageRenderer
{
  return self->_printPageRenderer;
}

- (void)setPrintPageRenderer:(UIPrintPageRenderer *)printPageRenderer
{
  objc_storeStrong((id *)&self->_printPageRenderer, printPageRenderer);
}

- (UIPrintFormatter)printFormatter
{
  return self->_printFormatter;
}

- (void)setPrintFormatter:(UIPrintFormatter *)printFormatter
{
  objc_storeStrong((id *)&self->_printFormatter, printFormatter);
}

- (id)printingItem
{
  return self->_printingItem;
}

- (NSArray)printingItems
{
  return self->_printingItems;
}

- (void)setPrintingItems:(NSArray *)printingItems
{
  objc_setProperty_nonatomic_copy(self, a2, printingItems, 168);
}

- (void)setPrintStateActive:(BOOL)a3
{
  self->_printStateActive = a3;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (UIWindowScene)hostingWindowScene
{
  return self->_hostingWindowScene;
}

- (void)setHostingWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_hostingWindowScene, a3);
}

- (int64_t)pageCountWithRanges
{
  return self->_pageCountWithRanges;
}

- (void)setPageCountWithRanges:(int64_t)a3
{
  self->_pageCountWithRanges = a3;
}

- (NSMutableSet)previewStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPreviewStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSObject)renderThumbnailMutex
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setRenderThumbnailMutex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (_NSRange)currentRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_currentRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setCurrentRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_currentRange, &v3, 16, 1, 0);
}

- (int64_t)pagesDrawn
{
  return self->_pagesDrawn;
}

- (void)setPagesDrawn:(int64_t)a3
{
  self->_pagesDrawn = a3;
}

- (UIPrintPanelViewController)printPanelViewController
{
  return (UIPrintPanelViewController *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPrintPanelViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (UIPrintingProgress)printingProgress
{
  return (UIPrintingProgress *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPrintingProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (PKPrintSettings)printSettings
{
  return (PKPrintSettings *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPrintSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (UIPrintInfo)activePrintInfo
{
  return (UIPrintInfo *)objc_getProperty(self, a2, 256, 1);
}

- (void)setActivePrintInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (int)printerInfoState
{
  return self->_printerInfoState;
}

- (void)setPrinterInfoState:(int)a3
{
  self->_printerInfoState = a3;
}

- (BOOL)supressNotifyDismissed
{
  return self->_supressNotifyDismissed;
}

- (void)setSupressNotifyDismissed:(BOOL)a3
{
  self->_supressNotifyDismissed = a3;
}

- (UIPrintPageRenderer)formatterRenderer
{
  return (UIPrintPageRenderer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFormatterRenderer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)manualPrintPageEnabled
{
  return self->_manualPrintPageEnabled;
}

- (void)setManualPrintPageEnabled:(BOOL)a3
{
  self->_manualPrintPageEnabled = a3;
}

- (NSURL)saveFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSaveFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (BOOL)showPrintingProgress
{
  return self->_showPrintingProgress;
}

- (void)setShowPrintingProgress:(BOOL)a3
{
  self->_showPrintingProgress = a3;
}

- (NSString)pdfPassword
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPdfPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSMutableDictionary)convertedPrintableItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setConvertedPrintableItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (BOOL)usingWebKitFormatter
{
  return self->_usingWebKitFormatter;
}

- (void)setUsingWebKitFormatter:(BOOL)a3
{
  self->_usingWebKitFormatter = a3;
}

- (NSObject)webKitFormatterMutex
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setWebKitFormatterMutex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (UIPrintInteractionControllerActivityDelegate)printActivityDelegate
{
  return (UIPrintInteractionControllerActivityDelegate *)objc_loadWeakRetained((id *)&self->_printActivityDelegate);
}

- (void)setPrintActivityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_printActivityDelegate, a3);
}

- (BOOL)showsScalingFactor
{
  return self->_showsScalingFactor;
}

- (void)setShowsScalingFactor:(BOOL)a3
{
  self->_showsScalingFactor = a3;
}

- (BOOL)preventPDFCreation
{
  return self->_preventPDFCreation;
}

- (void)setPreventPDFCreation:(BOOL)a3
{
  self->_preventPDFCreation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printActivityDelegate);
  objc_storeStrong((id *)&self->_webKitFormatterMutex, 0);
  objc_storeStrong((id *)&self->_convertedPrintableItems, 0);
  objc_storeStrong((id *)&self->_pdfPassword, 0);
  objc_storeStrong((id *)&self->_saveFileURL, 0);
  objc_storeStrong((id *)&self->_formatterRenderer, 0);
  objc_storeStrong((id *)&self->_activePrintInfo, 0);
  objc_storeStrong((id *)&self->_printSettings, 0);
  objc_storeStrong((id *)&self->_printingProgress, 0);
  objc_storeStrong((id *)&self->_printPanelViewController, 0);
  objc_storeStrong((id *)&self->_renderThumbnailMutex, 0);
  objc_storeStrong((id *)&self->_previewStates, 0);
  objc_storeStrong((id *)&self->_hostingWindowScene, 0);
  objc_storeStrong((id *)&self->_printingItems, 0);
  objc_storeStrong(&self->_printingItem, 0);
  objc_storeStrong((id *)&self->_printFormatter, 0);
  objc_storeStrong((id *)&self->_printPageRenderer, 0);
  objc_storeStrong((id *)&self->_printPaper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_tempPreviewFileURL, 0);
  objc_storeStrong((id *)&self->_paper, 0);
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_pageRanges, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_nupFileURL, 0);
  objc_storeStrong((id *)&self->_alertWindow, 0);
  objc_storeStrong(&self->_temporaryRetainCycle, 0);
  objc_storeStrong((id *)&self->_previewQueue, 0);
}

- (void)_enableManualPrintPage:(BOOL)a3
{
  self->_manualPrintPageEnabled = a3;
}

- (void)_manualPrintPage
{
  -[UIPrintInteractionController _printPageWithDelay:](self, "_printPageWithDelay:", 0.0);
}

- (void)_cancelManualPrintPage
{
  -[UIPrintInteractionController _endPrintJobWithAction:error:](self, "_endPrintJobWithAction:error:", 0, 0);
}

- (BOOL)savePDFToURL:(id)a3 completionHandler:(id)a4
{
  return -[UIPrintInteractionController savePDFToURL:showProgress:hostingScene:completionHandler:](self, "savePDFToURL:showProgress:hostingScene:completionHandler:", a3, 1, 0, a4);
}

- (BOOL)savePDFToURL:(id)a3 showProgress:(BOOL)a4 completionHandler:(id)a5
{
  return -[UIPrintInteractionController savePDFToURL:showProgress:hostingScene:completionHandler:](self, "savePDFToURL:showProgress:hostingScene:completionHandler:", a3, a4, 0, a5);
}

- (BOOL)savePDFToURL:(id)a3 showProgress:(BOOL)a4 hostingScene:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *WeakRetained;
  BOOL v15;
  void *v16;
  UIPrintInfo *printInfo;
  UIPrintInfo *v18;
  UIPrintInfo *activePrintInfo;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (*(_OWORD *)&self->_printPageRenderer == 0)
  {
    NSLog(CFSTR("ERROR: attempting to save to URL with no printing source (formatter/renderer) set"));
    if (v13)
      goto LABEL_4;
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  if (!-[UIPrintInteractionController printStateActive](self, "printStateActive"))
  {
    -[UIPrintInteractionController setPrintStateActive:](self, "setPrintStateActive:", 1);
    v16 = (void *)objc_msgSend(v13, "copy");
    -[UIPrintInteractionController set_completionHandler:](self, "set_completionHandler:", v16);

    printInfo = self->_printInfo;
    if (printInfo)
    {
      v18 = (UIPrintInfo *)-[UIPrintInfo copy](printInfo, "copy");
    }
    else
    {
      +[UIPrintInfo printInfo](UIPrintInfo, "printInfo");
      v18 = (UIPrintInfo *)objc_claimAutoreleasedReturnValue();
    }
    activePrintInfo = self->_activePrintInfo;
    self->_activePrintInfo = v18;

    -[UIPrintInteractionController setPrinter:](self, "setPrinter:", 0);
    -[UIPrintInfo setPrinterID:](self->_activePrintInfo, "setPrinterID:", 0);
    -[UIPrintInfo setDuplex:](self->_activePrintInfo, "setDuplex:", 0);
    objc_storeStrong((id *)&self->_saveFileURL, a3);
    self->_showPrintingProgress = a4;
    objc_storeStrong((id *)&self->_hostingWindowScene, a5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "printInteractionControllerWillPresentPrinterOptions:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "printInteractionControllerDidPresentPrinterOptions:", self);
    if (!self->_supressNotifyDismissed)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "printInteractionControllerWillDismissPrinterOptions:", self);
      if (!self->_supressNotifyDismissed && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "printInteractionControllerDidDismissPrinterOptions:", self);
    }
    v15 = 1;
    -[UIPrintInteractionController _setPrinterInfoState:](self, "_setPrinterInfoState:", 1);
    goto LABEL_19;
  }
  if (!v13)
    goto LABEL_21;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIPrintErrorDomain"), 4, 0);
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, UIPrintInteractionController *, _QWORD, void *))v13 + 2))(v13, self, 0, WeakRetained);
  v15 = 0;
LABEL_19:

LABEL_22:
  return v15;
}

@end
