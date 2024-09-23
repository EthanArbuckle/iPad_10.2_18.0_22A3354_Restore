@implementation SKUIModalDocumentController

- (SKUIModalDocumentController)init
{
  SKUIModalDocumentController *v3;
  NSMutableArray *v4;
  NSMutableArray *stackItems;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIModalDocumentController init].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIModalDocumentController;
  v3 = -[SKUIModalDocumentController init](&v7, sel_init);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stackItems = v3->_stackItems;
    v3->_stackItems = v4;

  }
  return v3;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_composeReviewViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7++), "setDelegate:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_giftViewControllers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "setDelegate:", 0);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v10);
  }

  -[SKUIOverlayContainerViewController backstopControl](self->_overlayViewController, "backstopControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v14.receiver = self;
  v14.super_class = (Class)SKUIModalDocumentController;
  -[SKUIModalDocumentController dealloc](&v14, sel_dealloc);
}

- (NSArray)documents
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_stackItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "document", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)navigationDocumentForDocument:(id)a3
{
  id v4;
  NSMutableArray *stackItems;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__83;
  v16 = __Block_byref_object_dispose__83;
  v17 = 0;
  stackItems = self->_stackItems;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SKUIModalDocumentController_navigationDocumentForDocument___block_invoke;
  v9[3] = &unk_1E73A7D38;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](stackItems, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__SKUIModalDocumentController_navigationDocumentForDocument___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    objc_msgSend(v11, "navigationDocumentController");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

- (id)navigationDocumentForNavigationController:(id)a3
{
  id v4;
  NSMutableArray *stackItems;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__83;
  v16 = __Block_byref_object_dispose__83;
  v17 = 0;
  stackItems = self->_stackItems;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SKUIModalDocumentController_navigationDocumentForNavigationController___block_invoke;
  v9[3] = &unk_1E73A7D38;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](stackItems, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __73__SKUIModalDocumentController_navigationDocumentForNavigationController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id obj;

  objc_msgSend(a2, "navigationDocumentController");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }

}

- (void)popAllDocuments
{
  NSMutableArray *i;

  for (i = self->_stackItems; -[NSMutableArray count](i, "count"); i = self->_stackItems)
    -[SKUIModalDocumentController _popDocument:completion:](self, "_popDocument:completion:", 0, 0);
  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");
}

- (void)popDocument
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  -[NSMutableArray lastObject](self->_stackItems, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isAnimated");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__SKUIModalDocumentController_popDocument__block_invoke;
    v6[3] = &unk_1E739FD38;
    v6[4] = self;
    -[SKUIModalDocumentController _popDocument:completion:](self, "_popDocument:completion:", v5, v6);
  }
  else
  {
    -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");
  }

}

uint64_t __42__SKUIModalDocumentController_popDocument__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidFinishIfApplicable");
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  SKUIDocumentStackItem *v14;
  SKUIDocumentStackItem *v15;
  SKUIReportAConcernViewController *v16;
  SKUIReportAConcernViewController *reportAConcernViewController;
  SKUIReportAConcernViewController *v18;
  SKUIShareTemplateActivityViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  SKUIDocumentContainerViewController *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  SKUIComposeReviewViewController *v27;
  NSMutableArray *composeReviewViewControllers;
  NSMutableArray *v29;
  NSMutableArray *v30;
  SKUIComposeReviewViewController *v31;
  void *v32;
  _QWORD v33[4];
  SKUIComposeReviewViewController *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id from;
  id v41;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[SKUIModalDocumentController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0
    || (-[SKUIModalDocumentController delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "modalDocumentController:willPushDocument:options:", self, v6, v7),
        v10,
        v11))
  {
    objc_msgSend(v6, "templateElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "elementType");
    if (v13 <= 86)
    {
      if (v13 > 38)
      {
        if (v13 == 39)
        {
          -[SKUIModalDocumentController _pushFamilySetupDocument:options:](self, "_pushFamilySetupDocument:options:", v6, v7);
        }
        else
        {
          if (v13 != 44)
            goto LABEL_28;
          -[SKUIModalDocumentController _pushGiftDocument:options:](self, "_pushGiftDocument:options:", v6, v7);
        }
      }
      else if (v13 == 16)
      {
        -[SKUIModalDocumentController _pushCharityDocument:options:](self, "_pushCharityDocument:options:", v6, v7);
      }
      else
      {
        if (v13 != 31)
          goto LABEL_28;
        -[SKUIModalDocumentController _pushDialogDocument:options:](self, "_pushDialogDocument:options:", v6, v7);
      }
    }
    else
    {
      if (v13 > 100)
      {
        switch(v13)
        {
          case 101:
            +[SKUIReportAConcernConfiguration configurationWithTemplateElement:](SKUIReportAConcernConfiguration, "configurationWithTemplateElement:", v12);
            v14 = (SKUIDocumentStackItem *)objc_claimAutoreleasedReturnValue();
            v16 = -[SKUIReportAConcernViewController initWithConfiguration:]([SKUIReportAConcernViewController alloc], "initWithConfiguration:", v14);
            reportAConcernViewController = self->_reportAConcernViewController;
            if (reportAConcernViewController)
              -[SKUIReportAConcernViewController dismissAnimated:](reportAConcernViewController, "dismissAnimated:", 0);
            v18 = self->_reportAConcernViewController;
            self->_reportAConcernViewController = v16;
            v15 = v16;

            -[SKUIModalDocumentController _pushSheetDocument:viewController:](self, "_pushSheetDocument:viewController:", v6, v15);
            goto LABEL_50;
          case 117:
            v14 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v6, v7);
            -[SKUIDocumentStackItem setUsesNavigationControllerForModalPresentation:](v14, "setUsesNavigationControllerForModalPresentation:", 0);
            v19 = [SKUIShareTemplateActivityViewController alloc];
            -[SKUIModalDocumentController clientContext](self, "clientContext");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[SKUIShareTemplateActivityViewController initWithTemplateElement:clientContext:](v19, "initWithTemplateElement:clientContext:", v12, v20);

            -[SKUIDocumentStackItem setViewController:](v14, "setViewController:", v15);
            objc_initWeak(location, v12);
            objc_initWeak(&v41, self);
            objc_initWeak(&from, v15);
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __52__SKUIModalDocumentController_pushDocument_options___block_invoke;
            v36[3] = &unk_1E73A7D88;
            objc_copyWeak(&v37, location);
            objc_copyWeak(&v38, &from);
            objc_copyWeak(&v39, &v41);
            -[SKUIDocumentStackItem setCompletionWithItemsHandler:](v15, "setCompletionWithItemsHandler:", v36);
            -[SKUIDocumentStackItem presentationType](v14, "presentationType");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v20) = objc_msgSend(v21, "isEqualToString:", 0x1E73B5550);

            if ((_DWORD)v20)
            {
              -[SKUIModalDocumentController _pushPopoverStackItem:](self, "_pushPopoverStackItem:", v14);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "userInterfaceIdiom");

              if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1)
              {
                -[SKUIDocumentStackItem popoverPresentationController](v15, "popoverPresentationController");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[SKUIModalDocumentController _pushPopoverSheetDocument:viewController:popoverPresentationController:options:](self, "_pushPopoverSheetDocument:viewController:popoverPresentationController:options:", v6, v15, v26, v7);

              }
              else
              {
                -[SKUIModalDocumentController _pushSheetStackItem:](self, "_pushSheetStackItem:", v14);
              }
            }
            -[NSMutableArray addObject:](self->_stackItems, "addObject:", v14);
            objc_destroyWeak(&v39);
            objc_destroyWeak(&v38);
            objc_destroyWeak(&v37);
            objc_destroyWeak(&from);
            objc_destroyWeak(&v41);
            objc_destroyWeak(location);
            goto LABEL_50;
          case 153:
            objc_msgSend(v12, "reviewMetadataURLString");
            v14 = (SKUIDocumentStackItem *)objc_claimAutoreleasedReturnValue();
            if (v14)
              v15 = (SKUIDocumentStackItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);
            else
              v15 = 0;
            v27 = objc_alloc_init(SKUIComposeReviewViewController);
            -[SKUIComposeReviewViewController setDelegate:](v27, "setDelegate:", self);
            -[SKUIComposeReviewViewController setTemplateViewElement:](v27, "setTemplateViewElement:", v12);
            composeReviewViewControllers = self->_composeReviewViewControllers;
            if (!composeReviewViewControllers)
            {
              v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v30 = self->_composeReviewViewControllers;
              self->_composeReviewViewControllers = v29;

              composeReviewViewControllers = self->_composeReviewViewControllers;
            }
            -[NSMutableArray addObject:](composeReviewViewControllers, "addObject:", v27);
            objc_initWeak(location, self);
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __52__SKUIModalDocumentController_pushDocument_options___block_invoke_3;
            v33[3] = &unk_1E739FDB0;
            objc_copyWeak(&v35, location);
            v31 = v27;
            v34 = v31;
            -[SKUIComposeReviewViewController loadReviewWithURL:completionBlock:](v31, "loadReviewWithURL:completionBlock:", v15, v33);
            -[SKUIModalDocumentController _pushSheetDocument:viewController:](self, "_pushSheetDocument:viewController:", v6, v31);

            objc_destroyWeak(&v35);
            objc_destroyWeak(location);

            goto LABEL_50;
        }
LABEL_28:
        -[SKUIModalDocumentController clientContext](self, "clientContext");
        v14 = (SKUIDocumentStackItem *)objc_claimAutoreleasedReturnValue();
        v15 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v6, v7);
        -[SKUIDocumentStackItem modalDocumentViewControllerForDocument:options:](v14, "modalDocumentViewControllerForDocument:options:", v6, v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "setModalDocumentController:", self);
          objc_msgSend(v22, "setClientContext:", v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[SKUIDocumentStackItem setUsesNavigationControllerForModalPresentation:](v15, "setUsesNavigationControllerForModalPresentation:", objc_msgSend(v22, "needsNavigationDocument"));
          v23 = v22;
        }
        else
        {
          v23 = -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:]([SKUIDocumentContainerViewController alloc], "initWithDocument:options:clientContext:", v6, v7, v14);
          if (!v23)
          {
            NSLog(CFSTR("No view controller for document: %@, template: %@, options: %@"), v6, v12, v7);
LABEL_49:

LABEL_50:
            goto LABEL_51;
          }
        }
        -[SKUIDocumentStackItem setViewController:](v15, "setViewController:", v23);
        -[SKUIDocumentStackItem presentationType](v15, "presentationType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "isEqualToString:", 0x1E73B2550))
        {
          -[SKUIModalDocumentController _pushOverlayStackItem:](self, "_pushOverlayStackItem:", v15);
        }
        else if (objc_msgSend(v32, "isEqualToString:", 0x1E73B5550))
        {
          -[SKUIModalDocumentController _pushPopoverStackItem:](self, "_pushPopoverStackItem:", v15);
        }
        else
        {
          -[SKUIModalDocumentController _pushSheetStackItem:](self, "_pushSheetStackItem:", v15);
        }
        -[NSMutableArray addObject:](self->_stackItems, "addObject:", v15);

        goto LABEL_49;
      }
      if (v13 == 87)
      {
        -[SKUIModalDocumentController _pushPlaylistDocument:options:](self, "_pushPlaylistDocument:options:", v6, v7);
      }
      else
      {
        if (v13 != 98)
          goto LABEL_28;
        -[SKUIModalDocumentController _pushRedeemDocument:options:](self, "_pushRedeemDocument:options:", v6, v7);
      }
    }
LABEL_51:

  }
}

void __52__SKUIModalDocumentController_pushDocument_options___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SKUIModalDocumentController_pushDocument_options___block_invoke_2;
  v5[3] = &unk_1E73A7D60;
  objc_copyWeak(&v7, a1 + 4);
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, a1 + 5);
  objc_copyWeak(&v9, a1 + 6);
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __52__SKUIModalDocumentController_pushDocument_options___block_invoke_2(void **a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    SKUIShareSheetActivityTypeForUIActivityType(a1[4]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v2, CFSTR("activityType"), 0);
    else
      v3 = 0;
    objc_msgSend(WeakRetained, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 14, 1, 1, v3, 0);

  }
  v4 = objc_loadWeakRetained(a1 + 6);
  if (v4)
  {
    v5 = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(v5, "_garbageCollectActivityViewController:", v4);

    objc_msgSend(v4, "setCompletionWithItemsHandler:", 0);
  }

}

void __52__SKUIModalDocumentController_pushDocument_options___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_composeReviewViewControllerDidFinish:finished:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  void *v17;
  char v18;
  SKUIDocumentContainerViewController *v19;
  void *v20;
  SKUIDocumentContainerViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = self->_stackItems;
  v12 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "document");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v8)
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v12, "presentationType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", 0x1E73B2550);

  if ((v18 & 1) != 0)
  {
    v19 = [SKUIDocumentContainerViewController alloc];
    -[SKUIModalDocumentController clientContext](self, "clientContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:](v19, "initWithDocument:options:clientContext:", v9, v10, v20);

    if (v21)
    {
      objc_msgSend(v12, "viewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "viewControllers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v25, "mutableCopy");

        objc_msgSend(v26, "replaceObjectAtIndex:withObject:", objc_msgSend(v26, "indexOfObjectIdenticalTo:", v22), v21);
        objc_msgSend(v24, "setViewControllers:animated:", v26, 0);

      }
      else
      {
        -[SKUIOverlayContainerViewController replaceViewController:withViewController:](self->_overlayViewController, "replaceViewController:withViewController:", v22, v21);
      }
      objc_msgSend(v12, "setViewController:", v21);
      objc_msgSend(v8, "onUnload");
      objc_msgSend(v12, "_setDocument:", v9);

    }
    else
    {
      objc_msgSend(v9, "templateElement");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("No view controller for document: %@, template: %@, options: %@"), v9, v22, v10);
    }

  }
  else
  {
    NSLog(CFSTR("Invalid replaceDocument, only type=overlay can be replaced"));
  }

}

- (void)setOverlayNavigationController:(id)a3 withTransitionCoordinator:(id)a4
{
  UINavigationController *v7;
  id v8;
  UINavigationController **p_overlayNavigationController;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (UINavigationController *)a3;
  v8 = a4;
  p_overlayNavigationController = &self->_overlayNavigationController;
  if (self->_overlayNavigationController != v7)
  {
    if (v7)
    {
      -[SKUIOverlayContainerViewController viewControllers](self->_overlayViewController, "viewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIModalDocumentController _dismissOverlayControllerWithStackItem:animated:](self, "_dismissOverlayControllerWithStackItem:animated:", 0, 0);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            -[UINavigationController pushViewController:animated:](v7, "pushViewController:animated:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), 0, (_QWORD)v16);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
    else
    {
      -[SKUIModalDocumentController _presentOverlayViewControllersFromNavigationController:](self, "_presentOverlayViewControllersFromNavigationController:");
    }
    objc_storeStrong((id *)p_overlayNavigationController, a3);
  }

}

- (void)ensureOverlayNavigationControllerStackConsistencyForNavigationController:(id)a3
{
  UINavigationController *v4;
  UINavigationController *v5;
  NSMutableArray *stackItems;
  _QWORD v7[4];
  UINavigationController *v8;
  SKUIModalDocumentController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = (UINavigationController *)a3;
  v5 = v4;
  if (v4 && self->_overlayNavigationController == v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__83;
    v15 = __Block_byref_object_dispose__83;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    stackItems = self->_stackItems;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __104__SKUIModalDocumentController_ensureOverlayNavigationControllerStackConsistencyForNavigationController___block_invoke;
    v7[3] = &unk_1E73A7DB0;
    v8 = v5;
    v9 = self;
    v10 = &v11;
    -[NSMutableArray enumerateObjectsUsingBlock:](stackItems, "enumerateObjectsUsingBlock:", v7);
    objc_storeStrong((id *)&self->_stackItems, (id)v12[5]);

    _Block_object_dispose(&v11, 8);
  }

}

void __104__SKUIModalDocumentController_ensureOverlayNavigationControllerStackConsistencyForNavigationController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "presentationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isEqualToString:", 0x1E73B2550);

  objc_msgSend(*(id *)(a1 + 32), "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (!v8)
    {
      objc_msgSend(v10, "document");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "onUnload");

      goto LABEL_6;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
LABEL_6:

}

- (SKUIOverlayContainerViewController)_overlayViewController
{
  return self->_overlayViewController;
}

- (UINavigationController)_overlayNavigationController
{
  return self->_overlayNavigationController;
}

- (void)_popDocumentSkippingUserInterfaceUpdates
{
  void *v3;
  id v4;

  -[NSMutableArray lastObject](self->_stackItems, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "document");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "onUnload");

    -[NSMutableArray removeLastObject](self->_stackItems, "removeLastObject");
  }
  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");

}

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4
{
  id v6;

  v6 = a4;
  -[SKUIModalDocumentController _composeReviewViewControllerDidFinish:finished:](self, "_composeReviewViewControllerDidFinish:finished:", a3, 0);
  -[SKUIModalDocumentController _presentAlertForDialog:](self, "_presentAlertForDialog:", v6);

}

- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4
{
  -[SKUIModalDocumentController _presentAlertForDialog:](self, "_presentAlertForDialog:", a4);
}

- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4
{
  id v6;
  float v7;
  float v8;

  v6 = a3;
  objc_msgSend(a4, "rating");
  v8 = v7;
  if (v7 < 0.00000011921)
    -[SKUIModalDocumentController _promptForStarRating:](self, "_promptForStarRating:", v6);

  return v8 >= 0.00000011921;
}

- (void)composeReviewViewControllerDidCancel:(id)a3
{
  -[SKUIModalDocumentController _composeReviewViewControllerDidFinish:finished:](self, "_composeReviewViewControllerDidFinish:finished:", a3, 0);
}

- (void)composeReviewViewController:(id)a3 didSubmitWithEdit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "templateViewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "templateViewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("edited");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 14, 1, 1, v10, 0);

  }
  -[SKUIModalDocumentController _composeReviewViewControllerDidFinish:finished:](self, "_composeReviewViewControllerDidFinish:finished:", v6, 1);

}

- (void)_composeReviewViewControllerDidFinish:(id)a3 finished:(BOOL)a4
{
  id v6;
  _QWORD v7[4];
  BOOL v8;

  v6 = a3;
  -[SKUIModalDocumentController _unloadDocumentForViewController:](self, "_unloadDocumentForViewController:", v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SKUIModalDocumentController__composeReviewViewControllerDidFinish_finished___block_invoke;
  v7[3] = &__block_descriptor_33_e5_v8__0l;
  v8 = a4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);
  objc_msgSend(v6, "setDelegate:", 0);
  -[NSMutableArray removeObjectIdenticalTo:](self->_composeReviewViewControllers, "removeObjectIdenticalTo:", v6);

  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");
}

void __78__SKUIModalDocumentController__composeReviewViewControllerDidFinish_finished___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  SKUIToastViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIToastViewController *v8;
  id v9;

  if (*(_BYTE *)(a1 + 32))
  {
    v1 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "imageNamed:inBundle:", CFSTR("toast-review"), v2);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v3 = [SKUIToastViewController alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TOAST_REVIEW_FINISHED_PRIMARY"), &stru_1E73A9FB0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TOAST_REVIEW_FINISHED_SECONDARY"), &stru_1E73A9FB0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKUIToastViewController initWithTitle:description:image:](v3, "initWithTitle:description:image:", v5, v7, v9);

    -[SKUIToastViewController present](v8, "present");
  }
}

- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  id v5;

  v5 = a3;
  -[SKUIModalDocumentController _unloadDocumentForViewController:](self, "_unloadDocumentForViewController:", v5);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v5, "setDelegate:", 0);
  -[NSMutableArray removeObjectIdenticalTo:](self->_giftViewControllers, "removeObjectIdenticalTo:", v5);

  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");
}

- (void)unloadDocumentForViewController:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setModalDocumentController:", 0);
  -[SKUIModalDocumentController _unloadDocumentForViewController:](self, "_unloadDocumentForViewController:", v4);

}

- (void)overlayContainerViewController:(id)a3 willPopViewController:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *stackItems;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__83;
  v17 = __Block_byref_object_dispose__83;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  stackItems = self->_stackItems;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__SKUIModalDocumentController_overlayContainerViewController_willPopViewController___block_invoke;
  v10[3] = &unk_1E73A7D38;
  v9 = v7;
  v11 = v9;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](stackItems, "enumerateObjectsUsingBlock:", v10);
  objc_storeStrong((id *)&self->_stackItems, (id)v14[5]);

  _Block_object_dispose(&v13, 8);
}

void __84__SKUIModalDocumentController_overlayContainerViewController_willPopViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(v6, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "onUnload");
    v6 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  }

}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  UIPopoverController *v4;

  v4 = (UIPopoverController *)a3;
  -[SKUIModalDocumentController _unloadDocumentForPopoverController:](self, "_unloadDocumentForPopoverController:", v4);
  -[UIPopoverController setDelegate:](v4, "setDelegate:", 0);
  if (self->_popoverController == v4)
  {
    self->_popoverController = 0;

  }
  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4;
  NSMutableArray *stackItems;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  stackItems = self->_stackItems;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__SKUIModalDocumentController_popoverPresentationControllerDidDismissPopover___block_invoke;
  v11[3] = &unk_1E73A52A0;
  v10 = v4;
  v12 = v10;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v11);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onUnload");

    -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v7);
  }
  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");

}

BOOL __78__SKUIModalDocumentController_popoverPresentationControllerDidDismissPopover___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __96__SKUIModalDocumentController_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke;
    v9[3] = &unk_1E739FD10;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, v9);

  }
}

uint64_t __96__SKUIModalDocumentController_popoverPresentationController_willRepositionPopoverToRect_inView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_garbageCollectActivityViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_overlayControllerBackstopAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *stackItems;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[SKUIOverlayContainerViewController viewControllers](self->_overlayViewController, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        stackItems = self->_stackItems;
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke;
        v15[3] = &unk_1E73A7DF8;
        v15[4] = v11;
        v16 = v4;
        -[NSMutableArray enumerateObjectsUsingBlock:](stackItems, "enumerateObjectsUsingBlock:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke_2;
  v14[3] = &unk_1E73A4750;
  v14[4] = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v14);
  if (objc_msgSend(v4, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", objc_msgSend(v4, "firstIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](self->_stackItems, "removeObjectsAtIndexes:", v4);
  }
  else
  {
    v13 = 0;
  }
  -[SKUIModalDocumentController _dismissOverlayControllerWithStackItem:animated:](self, "_dismissOverlayControllerWithStackItem:animated:", v13, objc_msgSend(v13, "isAnimated"));
  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");

}

void __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  _BOOL4 IsDescendent;

  objc_msgSend(a2, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsDescendent = SKUIViewControllerIsDescendent(v7, *(void **)(a1 + 32));

  if (IsDescendent)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    *a4 = 1;
  }
}

void __64__SKUIModalDocumentController__overlayControllerBackstopAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectAtIndex:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onDisappear");

  objc_msgSend(v4, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onUnload");

}

- (CGRect)_centerRect:(id)a3 adjust:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  float v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "bounds");
  v6 = CGRectGetMidX(v21) + -2.0;
  v7 = floorf(v6);
  objc_msgSend(v5, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  v16 = CGRectGetMidY(v22) + -2.0;
  v17 = floorf(v16);
  if (v4)
    v18 = v7;
  else
    v18 = 1.0;
  if (v4)
    v19 = v17;
  else
    v19 = 1.0;
  v20 = v7;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v20;
  return result;
}

- (void)_dismissOverlayControllerWithStackItem:(id)a3 animated:(BOOL)a4
{
  SKUIOverlayContainerViewController *v6;
  void *v7;
  SKUIOverlayContainerViewController *overlayViewController;
  void *v9;
  _QWORD v10[4];
  SKUIOverlayContainerViewController *v11;

  v6 = self->_overlayViewController;
  -[SKUIOverlayContainerViewController backstopControl](self->_overlayViewController, "backstopControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  overlayViewController = self->_overlayViewController;
  self->_overlayViewController = 0;

  if (a4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__SKUIModalDocumentController__dismissOverlayControllerWithStackItem_animated___block_invoke;
    v10[3] = &unk_1E739FD38;
    v11 = v6;
    -[SKUIOverlayContainerViewController dismissWithFadeTransitionCompletionBlock:](v11, "dismissWithFadeTransitionCompletionBlock:", v10);

  }
  else
  {
    -[SKUIOverlayContainerViewController view](v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[SKUIOverlayContainerViewController removeFromParentViewController](v6, "removeFromParentViewController");
  }

}

uint64_t __79__SKUIModalDocumentController__dismissOverlayControllerWithStackItem_animated___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
}

- (void)_garbageCollectActivityViewController:(id)a3
{
  void *v4;
  _BOOL4 IsDescendent;
  UIPopoverController *popoverController;
  id v7;

  v7 = a3;
  -[UIPopoverController contentViewController](self->_popoverController, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsDescendent = SKUIViewControllerIsDescendent(v7, v4);

  if (IsDescendent)
  {
    -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
    popoverController = self->_popoverController;
    self->_popoverController = 0;

  }
  -[SKUIModalDocumentController _unloadDocumentForViewController:](self, "_unloadDocumentForViewController:", v7);
  -[SKUIModalDocumentController _sendDidFinishIfApplicable](self, "_sendDidFinishIfApplicable");

}

- (id)_imageForImageViewElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "resourceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    SKUIImageWithResourceName(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_overlayStackItems
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_stackItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "presentationType", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", 0x1E73B2550);

        if (v11)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (void)_popDocument:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = a4;
  -[NSMutableArray lastObject](self->_stackItems, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "presentationType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", 0x1E73B2550))
    {
      -[SKUIModalDocumentController _popOverlayStackItem:animated:completion:](self, "_popOverlayStackItem:animated:completion:", v7, v4, v12);
    }
    else if (objc_msgSend(v8, "isEqualToString:", 0x1E73B5550))
    {
      -[SKUIModalDocumentController _popPopoverStackItem:animated:completion:](self, "_popPopoverStackItem:animated:completion:", v7, v4, v12);
    }
    else
    {
      objc_msgSend(v7, "navigationDocumentController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(v7, "viewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v4, v12);

    }
    objc_msgSend(v7, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "onUnload");

    -[NSMutableArray removeLastObject](self->_stackItems, "removeLastObject");
  }

}

- (BOOL)_popoverController:(id)a3 containsStackItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a4;
  objc_msgSend(a3, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationDocumentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = SKUIViewControllerIsDescendent(v9, v6)
     || (objc_msgSend(v9, "navigationController"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v10,
         v10 == v6)
     || SKUIViewControllerIsDescendent(v8, v6);

  return v11;
}

- (void)_popOverlayStackItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  -[SKUIOverlayContainerViewController viewControllers](self->_overlayViewController, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < 2)
    -[SKUIModalDocumentController _dismissOverlayControllerWithStackItem:animated:](self, "_dismissOverlayControllerWithStackItem:animated:", v11, v6);
  else
    -[SKUIOverlayContainerViewController popViewControllerAnimated:completion:](self->_overlayViewController, "popViewControllerAnimated:completion:", v6, v8);

}

- (void)_popPopoverStackItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  v7 = a5;
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  -[UIPopoverController contentViewController](self->_popoverController, "contentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SKUIModalDocumentController__popPopoverStackItem_animated_completion___block_invoke;
  v10[3] = &unk_1E73A17D0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v5, v10);

}

void __72__SKUIModalDocumentController__popPopoverStackItem_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;

  }
}

- (id)_presenterViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;

  -[SKUIModalDocumentController rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      objc_msgSend(v2, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v2, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v7;
      if (!v4)
        return v7;
    }
  }
  v7 = v2;
  return v7;
}

- (void)_presentOverlayViewControllersFromNavigationController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  SKUIModalDocumentController *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(v20, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = self;
  -[SKUIModalDocumentController _overlayStackItems](self, "_overlayStackItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count") - 1;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "viewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v14);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = v15;
          objc_msgSend(v6, "addObject:", v14);
          objc_msgSend(v5, "removeObjectAtIndex:", v16);
          if (v8 >= v16)
            v8 = v16;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  if (v8 < objc_msgSend(v5, "count"))
    objc_msgSend(v5, "removeObjectsInRange:", v8, objc_msgSend(v5, "count") - v8);
  if (objc_msgSend(v6, "count"))
  {
    -[SKUIModalDocumentController _showOverlayContainerViewController](v19, "_showOverlayContainerViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "showViewControllers:", v6);
    objc_msgSend(v20, "setViewControllers:animated:", v5, 0);
    objc_msgSend(v20, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutIfNeeded");

  }
}

- (void)_pushCharityDocument:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  SKUIDonationViewController *v7;
  void *v8;
  SKUIURL *v9;
  void *v10;
  SKUIURL *v11;
  void *v12;
  id v13;

  v5 = a3;
  objc_msgSend(v5, "templateElement");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "campaignIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[SKUIDonationViewController initWithCharityIdentifier:]([SKUIDonationViewController alloc], "initWithCharityIdentifier:", v6);
  }
  else
  {
    objc_msgSend(v13, "charityMetadataURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [SKUIURL alloc];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SKUIURL initWithURL:](v9, "initWithURL:", v10);

    }
    else
    {
      v11 = 0;
    }
    v7 = -[SKUIDonationViewController initWithURL:]([SKUIDonationViewController alloc], "initWithURL:", v11);

  }
  -[SKUIModalDocumentController clientContext](self, "clientContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDonationViewController setClientContext:](v7, "setClientContext:", v12);

  -[SKUIModalDocumentController _pushSheetDocument:viewController:](self, "_pushSheetDocument:viewController:", v5, v7);
}

- (void)_presentAlertForDialog:(id)a3
{
  id v4;
  SKUIStoreDialogController *dialogController;
  SKUIStoreDialogController *v6;
  SKUIStoreDialogController *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    dialogController = self->_dialogController;
    if (!dialogController)
    {
      v6 = objc_alloc_init(SKUIStoreDialogController);
      v7 = self->_dialogController;
      self->_dialogController = v6;

      dialogController = self->_dialogController;
    }
    -[SKUIModalDocumentController _presenterViewController](self, "_presenterViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStoreDialogController presentDialog:fromViewController:](dialogController, "presentDialog:fromViewController:", v9, v8);

    v4 = v9;
  }

}

- (void)_presetPopoverSheetDocument:(id)a3 viewController:(id)a4 popoverPresentationController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SKUIDocumentStackItem *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v10, 0);

  -[SKUIDocumentStackItem setViewController:](v12, "setViewController:", v9);
  -[SKUIDocumentStackItem setPopoverPresentationController:](v12, "setPopoverPresentationController:", v8);

  -[NSMutableArray addObject:](self->_stackItems, "addObject:", v12);
  -[SKUIModalDocumentController _presenterViewController](self, "_presenterViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_promptForStarRating:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, int, float);
  void *v8;
  id v9;
  id location;

  v3 = a3;
  objc_initWeak(&location, v3);
  objc_msgSend(MEMORY[0x1E0CD8050], "starRatingAlertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __52__SKUIModalDocumentController__promptForStarRating___block_invoke;
  v8 = &unk_1E73A6A38;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "setCompletion:", &v5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __52__SKUIModalDocumentController__promptForStarRating___block_invoke(uint64_t a1, int a2, float a3)
{
  double v4;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(float *)&v4 = a3;
    objc_msgSend(WeakRetained, "setRating:", v4);
    objc_msgSend(WeakRetained, "submitReview");

  }
}

- (void)_pushDialogDocument:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  SKUIToastViewController *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  void *v43;
  void *v44;
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id from;
  _QWORD v57[4];
  id v58;
  id location;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = a4;
  v40 = v5;
  objc_msgSend(v5, "templateElement");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v41, "dialogType"))
  {
    case 0:
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v38, v39, 1);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      goto LABEL_5;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v38, v39, 0);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "popoverPresentationController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDelegate:", self);
      goto LABEL_6;
    case 2:
      objc_initWeak(&location, self);
      -[SKUIModalDocumentController dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke;
      v57[3] = &unk_1E73A7E20;
      objc_copyWeak(&v58, &location);
      objc_msgSend(v11, "modalDocumentController:alertControllerForDocument:withDismissObserverBlock:options:", self, v40, v57, v37);
      v47 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v47 != 0;
      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);
LABEL_5:
      v36 = 0;
      if (v10)
        goto LABEL_42;
LABEL_6:
      if (v47)
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v47);
        objc_msgSend(v41, "buttons");
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (v12)
        {
          v46 = *(_QWORD *)v53;
          do
          {
            v48 = v12;
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v53 != v46)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              v15 = objc_msgSend(v14, "buttonViewType");
              v16 = 2;
              if (v15 != 11)
                v16 = 0;
              v17 = v15 != 10 && v15 != 11;
              if (v15 == 10)
                v18 = 1;
              else
                v18 = v16;
              objc_msgSend(v14, "buttonImage");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                -[SKUIModalDocumentController _imageForImageViewElement:](self, "_imageForImageViewElement:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v20 = 0;
              }
              v21 = (void *)MEMORY[0x1E0DC3448];
              objc_msgSend(v14, "buttonText");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "string");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v49[0] = MEMORY[0x1E0C809B0];
              v49[1] = 3221225472;
              v49[2] = __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke_2;
              v49[3] = &unk_1E73A7E48;
              objc_copyWeak(&v50, &location);
              objc_copyWeak(&v51, &from);
              v49[4] = v14;
              objc_msgSend(v21, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v23, v20, v18, v49, &__block_literal_global_49);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                objc_msgSend(v14, "buttonTitleStyle");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = SKUIViewElementAlignmentForStyle(v25);
                if (v26)
                  objc_msgSend(v24, "_setTitleTextAlignment:", SKUIViewElementNSTextAlignmentForIKElementAlignment(v26));
                v27 = v25;
                if (!v25)
                {
                  objc_msgSend(v14, "style");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = v27;
                }
                SKUIViewElementPlainColorWithStyle(v27, 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v25)

                if (v28)
                  objc_msgSend(v24, "_setTitleTextColor:", v28);
                objc_msgSend(v19, "style");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v29;
                if (!v29)
                {
                  objc_msgSend(v14, "style");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = v29;
                }
                SKUIViewElementPlainColorWithStyle(v29, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v30)

                if (v31)
                  objc_msgSend(v24, "_setImageTintColor:", v31);
                objc_msgSend(v24, "_setChecked:", objc_msgSend(v14, "isSelected"));

              }
              objc_msgSend(v47, "addAction:", v24);

              objc_destroyWeak(&v51);
              objc_destroyWeak(&v50);

            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          }
          while (v12);
        }

        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      else
      {
LABEL_42:
        if (!v47)
        {
          v47 = 0;
          goto LABEL_49;
        }
      }
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "userInterfaceIdiom");

      if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        -[SKUIModalDocumentController _pushPopoverSheetDocument:viewController:popoverPresentationController:options:](self, "_pushPopoverSheetDocument:viewController:popoverPresentationController:options:", v40, v47, v36, v37);
      else
        -[SKUIModalDocumentController _pushSheetDocument:viewController:](self, "_pushSheetDocument:viewController:", v40, v47);
LABEL_49:
      v35 = v36;
LABEL_50:

      return;
    case 4:
      v34 = -[SKUIToastViewController initWithDialogTemplate:]([SKUIToastViewController alloc], "initWithDialogTemplate:", v41);
      -[SKUIToastViewController present](v34, "present");

      goto LABEL_47;
    default:
LABEL_47:
      v35 = 0;
      v47 = 0;
      goto LABEL_50;
  }
}

void __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_unloadDocumentForViewController:", v3);

}

uint64_t __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_unloadDocumentForViewController:", v3);

  return objc_msgSend(a1[4], "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

uint64_t __59__SKUIModalDocumentController__pushDialogDocument_options___block_invoke_3()
{
  return 1;
}

- (void)_pushFamilySetupDocument:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = SKUIAccountsFramework();
  v11 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("ACAccountStore"), v6));
  v7 = SKUIAppleAccountUIFramework();
  v8 = objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("AAUIFamilySetupViewController"), v7));
  objc_msgSend(v11, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAccount:store:", v9, v11);

  objc_msgSend(v10, "setDelegate:", self);
  -[SKUIModalDocumentController _pushSheetDocument:viewController:](self, "_pushSheetDocument:viewController:", v5, v10);

}

- (void)_pushGiftDocument:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  SKUIGift *v7;
  SKUIGift *v8;
  void *v9;
  SKUIGift *v10;
  SKUIGiftViewController *v11;
  void *v12;
  NSMutableArray *giftViewControllers;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;

  v5 = a3;
  objc_msgSend(v5, "templateElement");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v16, "giftType");
  v7 = [SKUIGift alloc];
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v16, "productItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIGift initWithItem:](v8, "initWithItem:", v9);

  }
  else
  {
    v10 = -[SKUIGift initWithGiftCategory:](v7, "initWithGiftCategory:", 0);
  }
  v11 = -[SKUIGiftViewController initWithGift:]([SKUIGiftViewController alloc], "initWithGift:", v10);
  -[SKUIModalDocumentController clientContext](self, "clientContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftViewController setClientContext:](v11, "setClientContext:", v12);

  -[SKUIGiftViewController setGiftDelegate:](v11, "setGiftDelegate:", self);
  giftViewControllers = self->_giftViewControllers;
  if (!giftViewControllers)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = self->_giftViewControllers;
    self->_giftViewControllers = v14;

    giftViewControllers = self->_giftViewControllers;
  }
  -[NSMutableArray addObject:](giftViewControllers, "addObject:", v11);
  -[SKUIModalDocumentController _pushSheetDocument:viewController:](self, "_pushSheetDocument:viewController:", v5, v11);

}

- (void)_pushOverlayStackItem:(id)a3
{
  id v4;
  void *v5;
  UINavigationController *overlayNavigationController;
  void *v7;
  void *v8;
  _SKUIModalSheetNavigationController *v9;
  _SKUIModalSheetNavigationController *v10;
  id WeakRetained;
  _SKUIModalSheetNavigationController *v12;
  SKUINavigationDocumentController *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  overlayNavigationController = self->_overlayNavigationController;
  if (overlayNavigationController)
  {
    objc_msgSend(v4, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController pushViewController:animated:](overlayNavigationController, "pushViewController:animated:", v7, objc_msgSend(v5, "isAnimated"));

  }
  else
  {
    objc_msgSend(v4, "overlayType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewController");
    v9 = (_SKUIModalSheetNavigationController *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", 0x1E73B2710)
      && objc_msgSend(v5, "usesNavigationControllerForModalPresentation"))
    {
      v10 = objc_alloc_init(_SKUIModalSheetNavigationController);
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
      -[_SKUIModalSheetNavigationController setDelegate:](v10, "setDelegate:", WeakRetained);

      v12 = v10;
      v13 = -[SKUINavigationDocumentController initWithNavigationController:]([SKUINavigationDocumentController alloc], "initWithNavigationController:", v12);
      -[SKUIModalDocumentController clientContext](self, "clientContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationDocumentController setClientContext:](v13, "setClientContext:", v14);

      objc_msgSend(v5, "setNavigationDocumentController:", v13);
      v20[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationDocumentController setStackItems:animated:](v13, "setStackItems:animated:", v15, 0);

      -[SKUIModalDocumentController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "modalDocumentController:barStyleForStackItem:", self, v5);
        -[_SKUIModalSheetNavigationController navigationBar](v12, "navigationBar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBarStyle:", v17);

      }
    }
    else
    {
      v12 = v9;
    }
    -[SKUIModalDocumentController _showOverlayContainerViewController](self, "_showOverlayContainerViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "_appearState"))
    {
      objc_msgSend(v19, "beginAppearanceTransition:animated:", 1, 0);
      objc_msgSend(v19, "endAppearanceTransition");
    }
    objc_msgSend(v19, "showViewController:withCompletionBlock:", v12, 0);

  }
}

- (void)_pushPlaylistDocument:(id)a3 options:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SKUIModalDocumentController *v11;

  objc_msgSend(a3, "templateElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstChildForElementType:", 152);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SKUIModalDocumentController__pushPlaylistDocument_options___block_invoke;
  v9[3] = &unk_1E73A3380;
  v10 = v5;
  v11 = self;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __61__SKUIModalDocumentController__pushPlaylistDocument_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SKUIPlayableAsset *v10;

  v6 = a2;
  v10 = -[SKUIPlayableAsset initWithVideoViewElement:assetViewElement:]([SKUIPlayableAsset alloc], "initWithVideoViewElement:assetViewElement:", *(_QWORD *)(a1 + 32), v6);

  objc_msgSend(*(id *)(a1 + 40), "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIVideoPreviewPlayPlayableAsset(v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "_presenterViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

    SKUIVideoPreviewDismissOnEnterBackground(v8);
    *a4 = 1;
  }

}

- (void)_pushPopoverStackItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIPopoverController *popoverController;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SKUIModalDocumentController *v14;
  id v15;

  v4 = a3;
  -[SKUIModalDocumentController _modalSourceViewProviderFromStackItems](self, "_modalSourceViewProviderFromStackItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_popoverController)
  {
    -[SKUIModalDocumentController _unloadDocumentForPopoverController:](self, "_unloadDocumentForPopoverController:");
    -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
    -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 0);
    -[UIPopoverController contentViewController](self->_popoverController, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    popoverController = self->_popoverController;
    self->_popoverController = 0;

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "sourceElementIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginIgnoringInteractionEvents");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke;
    v11[3] = &unk_1E73A7ED8;
    v12 = v9;
    v13 = v4;
    v14 = self;
    v15 = v7;
    objc_msgSend(v5, "getModalSourceViewForElementIdentifier:completionBlock:", v12, v11);

  }
  else
  {
    -[SKUIModalDocumentController _pushSheetStackItem:](self, "_pushSheetStackItem:", v4);
  }

}

void __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id WeakRetained;
  SKUINavigationDocumentController *v9;
  void *v10;
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
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v35;
  id v36;
  void (**v37)(void *, _QWORD);
  void *v38;
  void *v39;
  void *v40;
  int8x16_t v41;
  _QWORD aBlock[4];
  id v43;
  int8x16_t v44;
  id v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sourceButtonBarItem");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalSourceView");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v4 | v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "usesNavigationControllerForModalPresentation") & 1) != 0)
    {
      v40 = v6;
      v7 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 80));
      objc_msgSend(v7, "setDelegate:", WeakRetained);

      objc_msgSend(v7, "setModalPresentationStyle:", 7);
      v9 = -[SKUINavigationDocumentController initWithNavigationController:]([SKUINavigationDocumentController alloc], "initWithNavigationController:", v7);
      objc_msgSend(*(id *)(a1 + 48), "clientContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationDocumentController setClientContext:](v9, "setClientContext:", v10);

      objc_msgSend(*(id *)(a1 + 40), "setNavigationDocumentController:", v9);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B48]), "initWithContentViewController:", v7);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(void **)(v12 + 88);
      *(_QWORD *)(v12 + 88) = v11;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setDelegate:");
      objc_msgSend(*(id *)(a1 + 40), "document");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "templateElement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "style");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ikBackgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "color");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((SKUIColorSchemeStyleForColor(v18) | 2) == 3)
      {
        objc_msgSend(v7, "navigationBar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setBarStyle:", 1);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "_setPopoverBackgroundStyle:", 7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "contentViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "popoverPresentationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "_setPopoverBackgroundStyle:", 7);

      }
      objc_msgSend(v7, "navigationBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = 480.0 - v23;

      v6 = v40;
    }
    else
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B48]), "initWithContentViewController:", v6);
      v28 = *(_QWORD *)(a1 + 48);
      v29 = *(void **)(v28 + 88);
      *(_QWORD *)(v28 + 88) = v27;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setDelegate:");
      v9 = 0;
      v24 = 480.0;
    }
    objc_msgSend(v6, "preferredContentSize");
    v31 = *MEMORY[0x1E0C9D820];
    v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (*MEMORY[0x1E0C9D820] == v33 && v32 == v30)
      objc_msgSend(v6, "setPreferredContentSize:", 320.0, v24, v31, v32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setPopoverContentSize:", 320.0, v24, v31, v32);
    if (v9)
    {
      v46[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationDocumentController setStackItems:animated:](v9, "setStackItems:animated:", v35, 0);

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke_2;
    aBlock[3] = &unk_1E73A7EB0;
    v43 = (id)v5;
    v41 = *(int8x16_t *)(a1 + 40);
    v36 = (id)v41.i64[0];
    v44 = vextq_s8(v41, v41, 8uLL);
    v45 = (id)v4;
    v37 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v38 = *(void **)(a1 + 56);
    if (v38)
      objc_msgSend(v38, "animateAlongsideTransition:completion:", 0, v37);
    else
      v37[2](v37, 0);

  }
  else
  {
    v25 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "document");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not find source element ID: %@ for popover document: %@"), v25, v26);

  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "endIgnoringInteractionEvents");

}

void __53__SKUIModalDocumentController__pushPopoverStackItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    v11 = v3;
    objc_msgSend(v4, "bounds");
    objc_msgSend(v5, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", *(_QWORD *)(a1 + 32), 15, objc_msgSend(*(id *)(a1 + 48), "isAnimated"), v6, v7, v8, v9);
LABEL_5:
    v3 = v11;
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    v11 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v10, 15, objc_msgSend(*(id *)(a1 + 48), "isAnimated"));
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_modalSourceViewProviderFromStackItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  if (-[NSMutableArray count](self->_stackItems, "count"))
  {
    -[NSMutableArray lastObject](self->_stackItems, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "topViewController");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF438FA8))
      WeakRetained = v4;
    else
      WeakRetained = 0;

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_modalSourceViewProvider);
  }
  return WeakRetained;
}

- (void)_pushRedeemDocument:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SKUIRedeemViewController *v9;

  v5 = a3;
  v9 = -[SKUIRedeemViewController initWithRedeemCategory:]([SKUIRedeemViewController alloc], "initWithRedeemCategory:", 0);
  -[SKUIModalDocumentController clientContext](self, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewController setClientContext:](v9, "setClientContext:", v6);

  objc_msgSend(v5, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "initialCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemViewController setInitialCode:](v9, "setInitialCode:", v8);

  -[SKUIModalDocumentController _pushSheetDocument:viewController:](self, "_pushSheetDocument:viewController:", v5, v9);
}

- (void)_pushSheetDocument:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SKUIDocumentStackItem *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v7, 0);

  -[SKUIDocumentStackItem setViewController:](v9, "setViewController:", v6);
  -[NSMutableArray addObject:](self->_stackItems, "addObject:", v9);
  -[SKUIModalDocumentController _presenterViewController](self, "_presenterViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_pushPopoverSheetDocument:(id)a3 viewController:(id)a4 popoverPresentationController:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  BOOL v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  SKUIModalDocumentController *v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_modalSourceViewProvider);
  objc_msgSend(v13, "objectForKey:", CFSTR("sourceElement"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = WeakRetained == 0;
  else
    v16 = 1;
  v17 = v16;
  if (v11 && v17)
  {
    objc_msgSend(v11, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIModalDocumentController _presenterViewController](self, "_presenterViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIModalDocumentController _centerRect:adjust:](self, "_centerRect:adjust:", v20, 0);
    objc_msgSend(v18, "setSourceRect:");

    objc_msgSend(v11, "popoverPresentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIModalDocumentController _presenterViewController](self, "_presenterViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSourceView:", v23);

    -[SKUIModalDocumentController _presetPopoverSheetDocument:viewController:popoverPresentationController:](self, "_presetPopoverSheetDocument:viewController:popoverPresentationController:", v10, v11, v12);
  }
  else if (v11)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __110__SKUIModalDocumentController__pushPopoverSheetDocument_viewController_popoverPresentationController_options___block_invoke;
    v24[3] = &unk_1E73A7ED8;
    v25 = v11;
    v26 = self;
    v27 = v10;
    v28 = v12;
    objc_msgSend(WeakRetained, "getModalSourceViewForElementIdentifier:completionBlock:", v15, v24);

  }
}

void __110__SKUIModalDocumentController__pushPopoverSheetDocument_viewController_popoverPresentationController_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "originalSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceView:", v4);

  objc_msgSend(v10, "originalSourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v10, "originalSourceView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_centerRect:adjust:", v8, 1);
    objc_msgSend(v6, "setSourceRect:");

    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "_presetPopoverSheetDocument:viewController:popoverPresentationController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

}

- (void)_pushSheetStackItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  unsigned int v11;
  uint64_t v12;
  _SKUIModalSheetNavigationController *v13;
  void *v14;
  _SKUIModalSheetNavigationController *v15;
  id WeakRetained;
  _SKUIModalSheetNavigationController *v17;
  SKUINavigationDocumentController *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SKUIBackdropContentViewController *v25;
  double v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "templateElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ikBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v26 = 1.0;
    v11 = objc_msgSend(v9, "getRed:green:blue:alpha:", 0, 0, 0, &v26);
    v10 = v26;
    if (v26 < 0.00000011920929)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v4, "viewController", v10);
  v13 = (_SKUIModalSheetNavigationController *)objc_claimAutoreleasedReturnValue();
  -[SKUIModalDocumentController _presenterViewController](self, "_presenterViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "usesNavigationControllerForModalPresentation"))
  {
    v15 = objc_alloc_init(_SKUIModalSheetNavigationController);
    if (objc_msgSend(v14, "preferredUserInterfaceStyle"))
      -[_SKUIModalSheetNavigationController setForcedUserInterfaceStyle:](v15, "setForcedUserInterfaceStyle:", objc_msgSend(v14, "preferredUserInterfaceStyle"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
    -[_SKUIModalSheetNavigationController setDelegate:](v15, "setDelegate:", WeakRetained);

    -[_SKUIModalSheetNavigationController _setClipUnderlapWhileTransitioning:](v15, "_setClipUnderlapWhileTransitioning:", v12);
    v17 = v15;

    v18 = -[SKUINavigationDocumentController initWithNavigationController:]([SKUINavigationDocumentController alloc], "initWithNavigationController:", v17);
    -[SKUIModalDocumentController clientContext](self, "clientContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationDocumentController setClientContext:](v18, "setClientContext:", v19);

    objc_msgSend(v4, "setNavigationDocumentController:", v18);
    v27[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationDocumentController setStackItems:animated:](v18, "setStackItems:animated:", v20, 0);

    -[SKUIModalDocumentController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "modalDocumentController:barStyleForStackItem:", self, v4);
      -[_SKUIModalSheetNavigationController navigationBar](v17, "navigationBar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBarStyle:", v22);

    }
  }
  else
  {
    v17 = v13;
  }
  objc_msgSend(v4, "sheetType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", 0x1E73B55B0))
    -[_SKUIModalSheetNavigationController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 2);
  if ((v12 & 1) != 0)
  {
    v25 = -[SKUIBackdropContentViewController initWithContentViewController:]([SKUIBackdropContentViewController alloc], "initWithContentViewController:", v17);
    objc_msgSend(v14, "presentViewController:animated:completion:", v25, objc_msgSend(v4, "isAnimated"), 0);

  }
  else
  {
    objc_msgSend(v14, "presentViewController:animated:completion:", v17, objc_msgSend(v4, "isAnimated"), 0);
  }

}

- (void)_sendDidFinishIfApplicable
{
  id v3;

  -[SKUIModalDocumentController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSMutableArray count](self->_stackItems, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "modalDocumentControllerDidFinish:", self);

}

- (id)_showOverlayContainerViewController
{
  SKUIOverlayContainerViewController *overlayViewController;
  SKUIOverlayContainerViewController *v4;
  SKUIOverlayContainerViewController *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  overlayViewController = self->_overlayViewController;
  if (!overlayViewController)
  {
    v4 = objc_alloc_init(SKUIOverlayContainerViewController);
    v5 = self->_overlayViewController;
    self->_overlayViewController = v4;

    -[SKUIOverlayContainerViewController backstopControl](self->_overlayViewController, "backstopControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__overlayControllerBackstopAction_, 64);

    -[SKUIOverlayContainerViewController setDelegate:](self->_overlayViewController, "setDelegate:", self);
    -[UIViewController addChildViewController:](self->_rootViewController, "addChildViewController:", self->_overlayViewController);
    -[UIViewController view](self->_rootViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SKUIOverlayContainerViewController view](self->_overlayViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutoresizingMask:", 18);
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
    objc_msgSend(v7, "addSubview:", v16);
    -[SKUIOverlayContainerViewController didMoveToParentViewController:](self->_overlayViewController, "didMoveToParentViewController:", self->_rootViewController);
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceLevel:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setOverrideTraitCollection:forChildViewController:](self->_rootViewController, "setOverrideTraitCollection:forChildViewController:", v17, self->_overlayViewController);

    overlayViewController = self->_overlayViewController;
  }
  return overlayViewController;
}

- (void)_unloadDocumentForPopoverController:(id)a3
{
  id v4;
  NSMutableArray *stackItems;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  stackItems = self->_stackItems;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__SKUIModalDocumentController__unloadDocumentForPopoverController___block_invoke;
  v11[3] = &unk_1E73A7F00;
  v11[4] = self;
  v10 = v4;
  v12 = v10;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v11);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onUnload");

    -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v7);
  }

}

uint64_t __67__SKUIModalDocumentController__unloadDocumentForPopoverController___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popoverController:containsStackItem:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_unloadDocumentForViewController:(id)a3
{
  id v4;
  NSMutableArray *stackItems;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  stackItems = self->_stackItems;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__SKUIModalDocumentController__unloadDocumentForViewController___block_invoke;
  v11[3] = &unk_1E73A52A0;
  v10 = v4;
  v12 = v10;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v11);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onUnload");

    -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v7);
  }

}

BOOL __64__SKUIModalDocumentController__unloadDocumentForViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIModalDocumentDelegate)delegate
{
  return (SKUIModalDocumentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIModalSourceViewProvider)modalSourceViewProvider
{
  return (SKUIModalSourceViewProvider *)objc_loadWeakRetained((id *)&self->_modalSourceViewProvider);
}

- (void)setModalSourceViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_modalSourceViewProvider, a3);
}

- (UINavigationControllerDelegate)navigationControllerDelegate
{
  return (UINavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
}

- (void)setNavigationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationControllerDelegate, a3);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (SKUIModalDocumentDataSource)dataSource
{
  return (SKUIModalDocumentDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_destroyWeak((id *)&self->_navigationControllerDelegate);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_overlayNavigationController, 0);
  objc_destroyWeak((id *)&self->_modalSourceViewProvider);
  objc_storeStrong((id *)&self->_giftViewControllers, 0);
  objc_storeStrong((id *)&self->_reportAConcernViewController, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeReviewViewControllers, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIModalDocumentController init]";
}

@end
