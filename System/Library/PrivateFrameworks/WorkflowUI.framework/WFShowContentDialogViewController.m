@implementation WFShowContentDialogViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WFShowContentDialogViewController;
  -[WFCompactDialogViewController loadView](&v21, sel_loadView);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrangeActionsVertically:", 1);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFShowContentDialogViewController setHighlightView:](self, "setHighlightView:", v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setView:", v4);
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "requiredVisualStyleCategories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "integerValue");
        objc_msgSend(v3, "visualStylingProviderForCategory:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setVisualStylingProvider:forCategory:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v5, "addChildViewController:", v13);
  -[WFShowContentDialogViewController setPreviewViewController:](self, "setPreviewViewController:", v13);
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v14);
  v15 = (id)objc_msgSend(v14, "wf_addConstraintsToFillSuperview:", v4);
  objc_msgSend(v13, "didMoveToParentViewController:", v5);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTapGesture_);
  objc_msgSend(v4, "addGestureRecognizer:", v16);
  -[WFShowContentDialogViewController updateActions](self, "updateActions");

}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double result;

  -[WFShowContentDialogViewController previewViewController](self, "previewViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentHeightForWidth:", a3);
  v9 = v8;

  -[WFShowContentDialogViewController contentHeightWithPreferredHeight:maxVisibleHeight:](self, "contentHeightWithPreferredHeight:maxVisibleHeight:", v9, a4);
  return result;
}

- (double)contentHeightWithPreferredHeight:(double)a3 maxVisibleHeight:(double)a4
{
  void *v6;
  int v7;
  int v8;

  -[WFShowContentDialogViewController previewViewController](self, "previewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "contentAllowsScrolling");

  if (a3 < a4)
    v8 = 1;
  else
    v8 = v7;
  if (v8)
    return a3;
  else
    return a4;
}

- (void)prepareForPresentationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  id location;
  _QWORD v20[3];
  char v21;
  _QWORD v22[3];
  char v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_initWeak(&location, self);
  -[WFCompactDialogViewController request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke;
  v14[3] = &unk_24E604148;
  objc_copyWeak(&v18, &location);
  v16 = v22;
  v17 = v20;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v5, "getContentCollectionWithCompletionHandler:", v14);

  v8 = dispatch_time(0, 1000000000);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_6;
  v10[3] = &unk_24E604170;
  v12 = v20;
  v13 = v22;
  v11 = v7;
  v9 = v7;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFShowContentDialogViewController;
  -[WFShowContentDialogViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[WFShowContentDialogViewController installThumbnailHandler](self, "installThumbnailHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    -[WFShowContentDialogViewController setInstallThumbnailHandler:](self, "setInstallThumbnailHandler:", 0);
  }

}

- (void)updateActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location[2];

  v3 = (void *)objc_opt_new();
  objc_initWeak(location, self);
  -[WFShowContentDialogViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  v6 = MEMORY[0x24BDAC760];
  if (v5 >= 2)
  {
    v7 = (void *)MEMORY[0x24BEC1450];
    v8 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Show All %ld Results"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShowContentDialogViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, objc_msgSend(v10, "numberOfItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultButtonWithTitle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __50__WFShowContentDialogViewController_updateActions__block_invoke;
    v24[3] = &unk_24E604D60;
    objc_copyWeak(&v25, location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v12, v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

    objc_destroyWeak(&v25);
  }
  -[WFCompactDialogViewController request](self, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doneButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __50__WFShowContentDialogViewController_updateActions__block_invoke_2;
  v22[3] = &unk_24E604D60;
  objc_copyWeak(&v23, location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v15, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  -[WFCompactDialogViewController request](self, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cancelButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __50__WFShowContentDialogViewController_updateActions__block_invoke_3;
  v20[3] = &unk_24E604D60;
  objc_copyWeak(&v21, location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v18, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v3);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

}

- (void)handleTapGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[WFShowContentDialogViewController presentFullScreenPreview](self, "presentFullScreenPreview");
}

- (void)presentFullScreenPreview
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[WFShowContentDialogViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEBDB08]);
    objc_msgSend(v4, "setModalPresentationStyle:", 5);
    objc_storeStrong((id *)&self->_containerViewController, v4);
    -[WFShowContentDialogViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BEC2F30]);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setDataSource:", v5);
    objc_msgSend(v6, "setModalPresentationStyle:", 5);
    objc_msgSend(v6, "setOverrideParentApplicationDisplayIdentifier:", *MEMORY[0x24BEC17D8]);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(v5, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke;
    v12[3] = &unk_24E604768;
    v12[4] = &v17;
    v12[5] = &v13;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

    objc_msgSend(v6, "setIsContentManaged:", v14[3] > v18[3]);
    if (objc_msgSend(MEMORY[0x24BDBCF50], "bannersEnabled"))
    {
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke_2;
      v9[3] = &unk_24E604ED0;
      v9[4] = self;
      v10 = v4;
      v11 = v6;
      -[WFShowContentDialogViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, v9);

    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);

  }
}

- (double)targetHeightForAnimatingPreviewViewController:(id)a3 toProposedHeight:(double)a4
{
  double v6;
  double result;

  -[WFCompactPlatterViewController maximumExpectedVisibleContentHeight](self, "maximumExpectedVisibleContentHeight", a3);
  -[WFShowContentDialogViewController contentHeightWithPreferredHeight:maxVisibleHeight:](self, "contentHeightWithPreferredHeight:maxVisibleHeight:", a4, v6);
  return result;
}

- (void)previewControllerWillDismiss:(id)a3
{
  id v4;

  if (objc_msgSend(MEMORY[0x24BDBCF50], "bannersEnabled", a3))
  {
    -[WFShowContentDialogViewController askContainerForHomeGestureUpdate](self, "askContainerForHomeGestureUpdate");
    -[WFShowContentDialogViewController containerViewController](self, "containerViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)sourceViewForQuickLook
{
  void *v3;
  void *v4;
  void *v5;

  -[WFShowContentDialogViewController previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "contentAllowsScrolling") & 1) != 0)
  {
    -[WFCompactPlatterViewController platterView](self, "platterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentViewContainerView");
  }
  else
  {
    -[WFShowContentDialogViewController previewViewController](self, "previewViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceViewForQuickLook");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v6;
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
  double v18;
  CGRect result;

  -[WFShowContentDialogViewController sourceViewForQuickLook](self, "sourceViewForQuickLook", a3, a4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a5 = v6;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)askContainerForHomeGestureUpdate
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFBannerShouldUpdateHomeGestureOwnershipNotification"), 0);

}

- (BOOL)hasCustomHomeGestureBehavior
{
  void *v2;
  BOOL v3;

  -[WFShowContentDialogViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)homeGestureDidPassThreshold
{
  void *v3;

  -[WFShowContentDialogViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[WFShowContentDialogViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)shouldHideSashView
{
  void *v2;
  char v3;

  -[WFShowContentDialogViewController previewViewController](self, "previewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsImageOrMediaThumbnail");

  return v3;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (WFCompactHighlightedView)highlightView
{
  return (WFCompactHighlightedView *)objc_loadWeakRetained((id *)&self->_highlightView);
}

- (void)setHighlightView:(id)a3
{
  objc_storeWeak((id *)&self->_highlightView, a3);
}

- (WFCompactContentPreviewViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewViewController, a3);
}

- (WFContentCollection)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (id)installThumbnailHandler
{
  return self->_installThumbnailHandler;
}

- (void)setInstallThumbnailHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_installThumbnailHandler, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_destroyWeak((id *)&self->_highlightView);
  objc_storeStrong((id *)&self->_containerViewController, 0);
}

void __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "attributionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToBeSentToDestinationWithManagedLevel:", 1);

  if (v4)
  {
    v5 = a1 + 32;
    v6 = v9;
LABEL_5:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24);
    goto LABEL_6;
  }
  objc_msgSend(v9, "attributionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAllowedToBeSentToDestinationWithManagedLevel:", 2);

  v6 = v9;
  if (v8)
  {
    v5 = a1 + 40;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "askContainerForHomeGestureUpdate");
  return objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 48), 1, 0);
}

void __50__WFShowContentDialogViewController_updateActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentFullScreenPreview");

}

void __50__WFShowContentDialogViewController_updateActions__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __50__WFShowContentDialogViewController_updateActions__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 1);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_24E604148;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  v8 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v3, "generatePreviewControllerDataSource:", v6);

  objc_destroyWeak(&v9);
}

_QWORD *__81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_6(_QWORD *result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
    return (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_3;
  block[3] = &unk_24E604120;
  block[4] = WeakRetained;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v11 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v6 = (id)v7;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "loadViewIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "updateActions");
  if (objc_msgSend(*(id *)(a1 + 40), "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "previewViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_4;
    v7[3] = &unk_24E6040F8;
    objc_copyWeak(&v10, (id *)(a1 + 72));
    v9 = *(_QWORD *)(a1 + 64);
    v6 = *(_OWORD *)(a1 + 48);
    v5 = (id)v6;
    v8 = v6;
    objc_msgSend(v2, "setContentItem:completionHandler:", v4, v7);

    objc_destroyWeak(&v10);
  }
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  _QWORD v9[5];
  id v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_5;
  v9[3] = &unk_24E6048A8;
  v9[4] = WeakRetained;
  v10 = v5;
  v7 = (void (**)(_QWORD))_Block_copy(v9);
  v8 = v7;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (objc_msgSend(WeakRetained, "isBeingPresented"))
      objc_msgSend(WeakRetained, "setInstallThumbnailHandler:", v8);
    else
      v8[2](v8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (a2)
      objc_msgSend(WeakRetained, "setInstallThumbnailHandler:", v7);
    else
      v7[2](v7);
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }

}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

@end
