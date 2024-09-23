@implementation VideosExtrasNavigationController

- (VideosExtrasNavigationController)initWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  UIViewController *v6;
  uint64_t v7;
  VideosExtrasNavigationController *v8;
  void *v9;
  void *v10;
  UIViewController *emptyViewController;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3F20];
  v5 = a3;
  v6 = (UIViewController *)objc_msgSend([v4 alloc], "initWithNibName:bundle:", 0, 0);
  v7 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)VideosExtrasNavigationController;
  v8 = -[VideosExtrasNavigationController initWithNavigationBarClass:toolbarClass:](&v13, sel_initWithNavigationBarClass_toolbarClass_, v7, 0);
  -[UIViewController navigationItem](v6, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasNavigationController _installDoneButtonOnNavigationItem:](v8, "_installDoneButtonOnNavigationItem:", v9);

  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasNavigationController setViewControllers:](v8, "setViewControllers:", v10);

  emptyViewController = v8->_emptyViewController;
  v8->_emptyViewController = v6;

  objc_storeWeak((id *)&v8->_context, v5);
  v8->_showsBuiltInNavControls = 1;
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasNavigationController;
  -[VideosExtrasNavigationController viewDidLoad](&v4, sel_viewDidLoad);
  -[VideosExtrasNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, 0);
  -[VideosExtrasNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;

  -[VideosExtrasNavigationController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VideosExtrasMainTemplateViewController)mainTemplateViewController
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "extrasRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainTemplateViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VideosExtrasMainTemplateViewController *)v4;
}

- (void)setClearsStackOnNextPush
{
  self->_clearStackOnPush = 1;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v6;
  VideosExtrasLoadingView *loadingView;
  VideosExtrasLoadingView *v8;
  void *v9;
  VideosExtrasLoadingView *v10;
  VideosExtrasLoadingView *v11;
  VideosExtrasLoadingView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  UIViewController *emptyViewController;
  UIViewController *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  loadingView = self->_loadingView;
  if (loadingView)
  {
    -[VideosExtrasLoadingView cancelCountdownToVisibility](loadingView, "cancelCountdownToVisibility");
    -[VideosExtrasLoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
    v8 = self->_loadingView;
    self->_loadingView = 0;

  }
  objc_msgSend(v21, "templateElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = -[VideosExtrasLoadingView initWithDocument:options:delegate:]([VideosExtrasLoadingView alloc], "initWithDocument:options:delegate:", v21, v6, self);
    v11 = self->_loadingView;
    self->_loadingView = v10;

    v12 = self->_loadingView;
    -[VideosExtrasNavigationController topViewController](self, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[VideosExtrasLoadingView setFrame:](v12, "setFrame:");

    -[VideosExtrasNavigationController topViewController](self, "topViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_loadingView)
    {
      if (v16)
      {
        -[VideosExtrasNavigationController mainTemplateViewController](self, "mainTemplateViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v16, "addSubview:", self->_loadingView);
          -[VideosExtrasLoadingView startCountdownToVisibilityWithInterval:](self->_loadingView, "startCountdownToVisibilityWithInterval:", 0.33);
        }
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VideosExtrasNavigationController _presentDialogTemplate:](self, "_presentDialogTemplate:", v9);
  }
  else if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    +[VideosExtrasTemplateViewController templateViewControllerWithDocument:options:context:](VideosExtrasTemplateViewController, "templateViewControllerWithDocument:options:context:", v21, v6, WeakRetained);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      emptyViewController = self->_emptyViewController;
      -[VideosExtrasNavigationController topViewController](self, "topViewController");
      v20 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (emptyViewController == v20)
        -[UINavigationController _VideosExtras_replaceViewController:withViewController:animated:](self, "_VideosExtras_replaceViewController:withViewController:animated:", self->_emptyViewController, v16, 0);
      else
        -[VideosExtrasNavigationController pushViewController:animated:](self, "pushViewController:animated:", v16, 1);
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (void)popDocument
{
  id v2;

  v2 = (id)-[VideosExtrasNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
}

- (void)popToDocument:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VideosExtrasNavigationController viewControllers](self, "viewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "document");
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v4)
          {
            v12 = (id)-[VideosExtrasNavigationController popToViewController:animated:](self, "popToViewController:animated:", v10, 1);
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)popToRootDocument
{
  void *v3;
  id v4;

  -[VideosExtrasNavigationController documents](self, "documents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasNavigationController popToDocument:](self, "popToDocument:", v3);

}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a5;
  v14 = 0;
  v9 = -[VideosExtrasNavigationController _viewControllerForDocument:index:](self, "_viewControllerForDocument:index:", v7, &v14);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    +[VideosExtrasTemplateViewController templateViewControllerWithDocument:options:context:](VideosExtrasTemplateViewController, "templateViewControllerWithDocument:options:context:", v7, v8, WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasNavigationController viewControllers](self, "viewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "insertObject:atIndex:", v11, v14);
    -[VideosExtrasNavigationController setViewControllers:](self, "setViewControllers:", v13);

  }
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a4;
  v8 = a5;
  v14 = 0;
  v9 = -[VideosExtrasNavigationController _viewControllerForDocument:index:](self, "_viewControllerForDocument:index:", v7, &v14);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    +[VideosExtrasTemplateViewController templateViewControllerWithDocument:options:context:](VideosExtrasTemplateViewController, "templateViewControllerWithDocument:options:context:", v7, v8, WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasNavigationController viewControllers](self, "viewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v14, v11);
    -[VideosExtrasNavigationController setViewControllers:](self, "setViewControllers:", v13);

  }
}

- (id)_viewControllerForDocument:(id)a3 index:(int64_t *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VideosExtrasNavigationController viewControllers](self, "viewControllers");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "document", (_QWORD)v15);
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v6)
          {
            v8 = v11;
            v13 = objc_msgSend(v7, "indexOfObject:", v8);
            goto LABEL_12;
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  if (a4)
    *a4 = v13;

  return v8;
}

- (id)documents
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VideosExtrasNavigationController viewControllers](self, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "document");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_dismissViewController:(id)a3
{
  VideosExtrasContext **p_context;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  p_context = &self->_context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "extrasDoneButtonPressed");
  }
  else
  {
    objc_msgSend(WeakRetained, "extrasRequestsPlaybackStop");
    v4 = objc_loadWeakRetained((id *)p_context);
    objc_msgSend(v4, "extrasRootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_presentDialogTemplate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD block[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "descriptionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredStyle:", 1);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "buttons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "string");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v18, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VideosExtrasNavigationController__presentDialogTemplate___block_invoke;
  block[3] = &unk_1E9F98FD8;
  block[4] = self;
  v24 = v10;
  v20 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __59__VideosExtrasNavigationController__presentDialogTemplate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)loadingView:(id)a3 documentDidUpdate:(id)a4 options:(id)a5
{
  VideosExtrasLoadingView *loadingView;
  id v8;
  id v9;

  loadingView = self->_loadingView;
  v8 = a5;
  v9 = a4;
  -[VideosExtrasLoadingView cancelCountdownToVisibility](loadingView, "cancelCountdownToVisibility");
  -[VideosExtrasLoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  -[VideosExtrasNavigationController pushDocument:options:](self, "pushDocument:options:", v9, v8);

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  VideosExtrasContext **p_context;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  p_context = &self->_context;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "extrasRootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detectMainDocument:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasNavigationController;
  -[VideosExtrasNavigationController setViewControllers:animated:](&v11, sel_setViewControllers_animated_, v10, v4);

}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "extrasRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainTemplateViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "videoPlaybackViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)&self->_context);
      objc_msgSend(v9, "featurePlaybackViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v10)
        goto LABEL_6;
    }
    else
    {

    }
    -[VideosExtrasNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 0, 0);
    -[VideosExtrasNavigationController navigationBar](self, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 1;
    goto LABEL_9;
  }

LABEL_6:
  -[VideosExtrasNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, 0);
  -[VideosExtrasNavigationController navigationBar](self, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = 0;
LABEL_9:
  objc_msgSend(v11, "setUserInteractionEnabled:", v13);

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VideosExtrasNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "extrasRootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detectMainDocument:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "containsObject:", v6))
  {
    if (self->_clearStackOnPush)
    {
      self->_clearStackOnPush = 0;
      objc_msgSend(v6, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasNavigationController _installDoneButtonOnNavigationItem:](self, "_installDoneButtonOnNavigationItem:", v12);
      v18[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v13, 0);
    }
    else
    {
      objc_msgSend(v6, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasNavigationController topViewController](self, "topViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v13, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("BACK"), 0, CFSTR("VideosExtras"));
        v16 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v16;
      }
      -[VideosExtrasNavigationController _installBackButtonOnNavigationItem:withTitle:](self, "_installBackButtonOnNavigationItem:withTitle:", v12, v13);
      v17.receiver = self;
      v17.super_class = (Class)VideosExtrasNavigationController;
      -[VideosExtrasNavigationController pushViewController:animated:](&v17, sel_pushViewController_animated_, v6, v4);
    }

  }
}

- (void)_installDoneButtonOnNavigationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_showsBuiltInNavControls)
  {
    v4 = a3;
    -[VideosExtrasNavigationController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VideosExtrasNavigationBarButton extrasNavigationButton:](VideosExtrasNavigationBarButton, "extrasNavigationButton:", objc_msgSend(v5, "_activeBarMetrics"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DONE"), 0, CFSTR("VideosExtras"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v7, 0);

    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__dismissViewController_, 64);
    objc_msgSend(v9, "sizeToFit");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v9);
    objc_msgSend(v4, "setLeftBarButtonItem:", v8);

  }
}

- (void)_popViewControllerFromBackButton
{
  id v2;

  v2 = (id)-[VideosExtrasNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
}

- (void)_installBackButtonOnNavigationItem:(id)a3 withTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[VideosExtrasNavigationController navigationBar](self, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VideosExtrasNavigationBarButton extrasBackButton:](VideosExtrasNavigationBarButton, "extrasBackButton:", objc_msgSend(v8, "_activeBarMetrics"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTitle:forState:", v6, 0);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__popViewControllerFromBackButton, 64);
  objc_msgSend(v10, "sizeToFit");
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v10, "semanticContentAttribute")) == 1)
  {
    objc_msgSend(v10, "imageEdgeInsets");
    objc_msgSend(v10, "setImageEdgeInsets:");
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v10);
  objc_msgSend(v7, "setLeftBarButtonItem:", v9);

}

- (BOOL)showsBuiltInNavControls
{
  return self->_showsBuiltInNavControls;
}

- (void)setShowsBuiltInNavControls:(BOOL)a3
{
  self->_showsBuiltInNavControls = a3;
}

- (VideosExtrasContext)context
{
  return (VideosExtrasContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_emptyViewController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
