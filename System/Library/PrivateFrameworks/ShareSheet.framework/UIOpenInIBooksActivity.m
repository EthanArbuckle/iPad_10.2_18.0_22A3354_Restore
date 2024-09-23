@implementation UIOpenInIBooksActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

- (UIOpenInIBooksActivity)init
{
  UIOpenInIBooksActivity *v2;
  UIOpenInIBooksActivity *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIOpenInIBooksActivity;
  v2 = -[UIActivity init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIOpenInIBooksActivity setApplicationIdentifier:](v2, "setApplicationIdentifier:", CFSTR("com.apple.iBooks"));
  return v3;
}

- (int64_t)_defaultSortGroup
{
  return 4;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.OpenInIBooks");
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  return CFSTR("com.apple.iBooks");
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OpenIniBooks[Activity]"), CFSTR("Books"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_appIsDocumentTypeOwner
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[UIOpenInIBooksActivity url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForURL:isContentManaged:sourceAuditToken:", v3, -[UIOpenInIBooksActivity isContentManaged](self, "isContentManaged"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CA59C8];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CA59C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationsAvailableForOpeningWithHandlerRanks:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "bundleIdentifier", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.iBooks"));

          if ((v15 & 1) != 0)
          {
            v16 = 1;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_12:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int CanDisplayActivityForApplicationProxy;
  char v13;
  void *v14;
  BOOL v15;
  BOOL v16;

  -[objc_class sharedConnection](getMCProfileConnectionClass_3(), "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIOpenInIBooksActivity sourceApplicationBundleID](self, "sourceApplicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:", &unk_1E403F500, v7, -[UIOpenInIBooksActivity isContentManaged](self, "isContentManaged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", CFSTR("com.apple.iBooks"));

  if (v10
    && (-[UIOpenInIBooksActivity _loadedApplicationProxy](self, "_loadedApplicationProxy"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        CanDisplayActivityForApplicationProxy = _UIActivityCanDisplayActivityForApplicationProxy(v11),
        v11,
        CanDisplayActivityForApplicationProxy))
  {
    v13 = _UIActivityItemTypes();
    -[UIOpenInIBooksActivity operation](self, "operation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = 0;
    }
    else
    {
      v16 = (_UIActivityItemTypes() & 0x22) != 0;
      v15 = (v13 & 0x80) == 0 && v16;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
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

- (id)_loadedApplicationProxy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIOpenInIBooksActivity applicationProxy](self, "applicationProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CA5860];
    -[UIOpenInIBooksActivity applicationIdentifier](self, "applicationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationProxyForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIOpenInIBooksActivity setApplicationProxy:](self, "setApplicationProxy:", v6);

  }
  return -[UIOpenInIBooksActivity applicationProxy](self, "applicationProxy");
}

- (void)_openDocumentWithApplication
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];

  -[UIOpenInIBooksActivity url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIActivityDefaultOpenApplicationLaunchServiceOptions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v9, 0, sizeof(v9));
  _SharingUIAuditTokenForCurrentProcess((uint64_t)v9);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIOpenInIBooksActivity applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v3, v6, 0, -[UIOpenInIBooksActivity isContentManaged](self, "isContentManaged"), v9, 0, v4, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIOpenInIBooksActivity setOperation:](self, "setOperation:", v7);

  -[UIOpenInIBooksActivity operation](self, "operation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__UIOpenInIBooksActivity_openResourceOperation_didFinishCopyingResource___block_invoke;
  block[3] = &unk_1E4001608;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__UIOpenInIBooksActivity_openResourceOperation_didFinishCopyingResource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedCopyingResource:", 1);
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__UIOpenInIBooksActivity_openResourceOperation_didFailWithError___block_invoke;
  block[3] = &unk_1E4001608;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __65__UIOpenInIBooksActivity_openResourceOperation_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedCopyingResource:", 0);
}

- (void)openResourceOperationDidComplete:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__UIOpenInIBooksActivity_openResourceOperationDidComplete___block_invoke;
  block[3] = &unk_1E4001608;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__UIOpenInIBooksActivity_openResourceOperationDidComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedCopyingResource:", 1);
}

- (void)_finishedCopyingResource:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8[1024];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  -[UIOpenInIBooksActivity operation](self, "operation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[UIOpenInIBooksActivity shouldUnlinkFile](self, "shouldUnlinkFile"))
    {
      bzero(v8, 0x400uLL);
      -[UIOpenInIBooksActivity url](self, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getCString:maxLength:encoding:", v8, 1024, 4);

      unlink(v8);
      -[UIOpenInIBooksActivity setShouldUnlinkFile:](self, "setShouldUnlinkFile:", 0);
    }
    -[UIOpenInIBooksActivity setUrl:](self, "setUrl:", 0);
    -[UIOpenInIBooksActivity setOperation:](self, "setOperation:", 0);
    -[UIActivity activityDidFinish:](self, "activityDidFinish:", v3);
  }
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  id location;

  -[UIOpenInIBooksActivity url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIOpenInIBooksActivity _openDocumentWithApplication](self, "_openDocumentWithApplication");
  }
  else
  {
    -[UIOpenInIBooksActivity printInteractionController](self, "printInteractionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jobName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByStandardizingPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || !objc_msgSend(v7, "length"))
    {
      +[UIOpenInIBooksActivity bestJobNameForActivityItems:](UIOpenInIBooksActivity, "bestJobNameForActivityItems:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    tempURLForJobName(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIOpenInIBooksActivity setUrl:](self, "setUrl:", v9);

    location = 0;
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __41__UIOpenInIBooksActivity_performActivity__block_invoke;
    v15 = &unk_1E40038B8;
    objc_copyWeak(&v16, &location);
    v10 = (void *)MEMORY[0x1A1AE9514](&v12);
    -[UIOpenInIBooksActivity url](self, "url", v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "savePDFToURL:completionHandler:", v11, v10);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __41__UIOpenInIBooksActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleSaveToPDFWithCompleted:error:", a3, v6);

}

- (void)_handleSaveToPDFWithCompleted:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  v6 = a4;
  if (v6 || !v4)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[UIOpenInIBooksActivity _handleSaveToPDFWithCompleted:error:].cold.1(self, (uint64_t)v6, v8);

    -[UIOpenInIBooksActivity setUrl:](self, "setUrl:", 0);
    -[UIOpenInIBooksActivity setShouldUnlinkFile:](self, "setShouldUnlinkFile:", 0);
    -[UIActivity activityDidFinish:items:error:](self, "activityDidFinish:items:error:", 0, 0, v6);
  }
  else
  {
    -[UIOpenInIBooksActivity setShouldUnlinkFile:](self, "setShouldUnlinkFile:", 1);
    -[UIOpenInIBooksActivity url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UIOpenInIBooksActivity _openDocumentWithApplication](self, "_openDocumentWithApplication");
  }

}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  void *v12;
  const __CFURL *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CGFloat v22;
  const __CFDictionary *v23;
  CGContext *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t j;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  const __CFURL *v42;
  void *v43;
  UIOpenInIBooksActivity *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGRect v50;
  _BYTE v51[128];
  CGAffineTransform transform;
  CGRect mediaBox;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_UIActivityItemTypes() & 0x20) != 0)
  {
    -[UIOpenInIBooksActivity printInteractionController](self, "printInteractionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v36 = v4;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v47 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "setPrintPageRenderer:", v41);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v5, "setPrintFormatter:", v41);
              goto LABEL_35;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v5, "setPrintInfo:", v41);
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v38)
          continue;
        break;
      }
    }
LABEL_35:

  }
  else
  {
    +[UIOpenInIBooksActivity bestJobNameForActivityItems:](UIOpenInIBooksActivity, "bestJobNameForActivityItems:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _UIActivityItemsGetImages(v4, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count"))
    {
      tempURLForJobName(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "size");
      v50.origin.x = 0.0;
      v50.origin.y = 0.0;
      v50.size.width = v9;
      v50.size.height = v10;
      mediaBox.origin.x = 0.0;
      mediaBox.origin.y = 0.0;
      mediaBox.size.width = v9;
      mediaBox.size.height = v10;
      v11 = v5;
      v12 = (void *)MEMORY[0x1E0CB34D0];
      v13 = v8;
      objc_msgSend(v12, "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedInfoDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("CFBundleDisplayName"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "infoDictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("CFBundleDisplayName"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "infoDictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", CFSTR("CFBundleName"));
          v21 = objc_claimAutoreleasedReturnValue();

          if (v21)
            v16 = (__CFString *)v21;
          else
            v16 = CFSTR("Untitled");
        }
      }
      v22 = *MEMORY[0x1E0C9DB40];
      transform.a = *(CGFloat *)MEMORY[0x1E0C9DB88];
      transform.b = v22;
      *(_QWORD *)&v54 = v11;
      *((_QWORD *)&v54 + 1) = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &transform, 2);
      v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v24 = CGPDFContextCreateWithURL(v13, &mediaBox, v23);

      if (v24)
      {
        v42 = v13;
        v44 = self;
        UIGraphicsPushContext(v24);
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v43 = v7;
        v25 = v7;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, &mediaBox, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v55;
          v29 = *MEMORY[0x1E0C9D538];
          v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v55 != v28)
                objc_enumerationMutation(v25);
              v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_msgSend(v32, "size", v42);
              v34 = v33;
              v50.origin.x = 0.0;
              v50.origin.y = 0.0;
              v50.size.width = v35;
              v50.size.height = v33;
              CGContextBeginPage(v24, &v50);
              CGContextSaveGState(v24);
              transform.a = 1.0;
              transform.b = 0.0;
              transform.c = 0.0;
              *(_OWORD *)&transform.d = xmmword_19E4D34D0;
              transform.ty = v34;
              CGContextConcatCTM(v24, &transform);
              objc_msgSend(v32, "drawAtPoint:", v29, v30);
              CGContextRestoreGState(v24);
              CGContextEndPage(v24);
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, &mediaBox, 16);
          }
          while (v27);
        }

        UIGraphicsPopContext();
        CGPDFContextClose(v24);
        CGContextRelease(v24);
        v7 = v43;
        self = v44;
        v13 = v42;
      }

    }
    else
    {
      v13 = 0;
    }

    -[UIOpenInIBooksActivity setUrl:](self, "setUrl:", v13);
    -[UIOpenInIBooksActivity setShouldUnlinkFile:](self, "setShouldUnlinkFile:", 1);
  }

}

+ (id)defaultJobName
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("iBooksJobName[Activity]"), CFSTR("Untitled"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)jobNameFormatForFile
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("iBooksJobNameForURL[Activity]"), CFSTR("Untitled"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bestJobNameForActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = v9;
    objc_msgSend(a1, "jobNameFormatForFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringWithFormat:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(a1, "defaultJobName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v14;
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

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)shouldUnlinkFile
{
  return self->_shouldUnlinkFile;
}

- (void)setShouldUnlinkFile:(BOOL)a3
{
  self->_shouldUnlinkFile = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (void)setApplicationProxy:(id)a3
{
  objc_storeStrong((id *)&self->_applicationProxy, a3);
}

- (NSOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (void)setPrintInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_printInteractionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
}

- (void)_handleSaveToPDFWithCompleted:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_19E419000, a3, OS_LOG_TYPE_ERROR, "ERROR: opening %{public}@ in Books required saving to PDF first, but that failed with the error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
