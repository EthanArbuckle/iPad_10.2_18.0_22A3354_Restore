@implementation UIPreviewItemController

- (UIPreviewItemController)init
{
  return -[UIPreviewItemController initWithView:](self, "initWithView:", 0);
}

- (UIPreviewItemController)initWithView:(id)a3
{
  id v4;
  UIPreviewItemController *v5;
  UIPreviewItemController *v6;
  UIPreviewInteractionController *v7;
  UIPreviewInteractionController *previewInteractionController;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  UIPreviewItemController *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)UIPreviewItemController;
    v5 = -[UIPreviewItemController init](&v21, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_view, v4);
      v6->_type = 0;
      v6->_contentManagedByClient = 0;
      v7 = objc_alloc_init(UIPreviewInteractionController);
      previewInteractionController = v6->_previewInteractionController;
      v6->_previewInteractionController = v7;

      -[UIPreviewInteractionController setDelegate:](v6->_previewInteractionController, "setDelegate:", v6);
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[UIPreviewInteractionController gestureRecognizers](v6->_previewInteractionController, "gestureRecognizers", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(v4, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v11);
      }

      -[UIPreviewInteractionController presentationGestureRecognizer](v6->_previewInteractionController, "presentationGestureRecognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "_isGestureType:", 1) && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "setDelay:", 0.13);
      else
        NSLog(CFSTR("Warning: UIPreviewItemController expected a UILongPressGestureRecognizer, you may see unexpected behaviors"));

    }
    self = v6;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIPreviewInteractionController gestureRecognizers](self->_previewInteractionController, "gestureRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(WeakRetained, "removeGestureRecognizer:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)UIPreviewItemController;
  -[UIPreviewItemController dealloc](&v10, sel_dealloc);
}

- (NSArray)gestureRecognizers
{
  return -[UIPreviewInteractionController gestureRecognizers](self->_previewInteractionController, "gestureRecognizers");
}

- (UIGestureRecognizer)presentationGestureRecognizer
{
  return -[UIPreviewInteractionController beginPreviewGestureRecognizer](self->_previewInteractionController, "beginPreviewGestureRecognizer");
}

- (UIGestureRecognizer)presentationSecondaryGestureRecognizer
{
  return -[UIPreviewInteractionController presentationGestureRecognizer](self->_previewInteractionController, "presentationGestureRecognizer");
}

- (BOOL)_shouldCancelPreviewWithNegativeFeedback
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSDictionary *previewData;
  id WeakRetained;
  void *v13;
  void *v14;

  if (self->_type == 2)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", UIPreviewDataLink);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("http")))
    {

    }
    else
    {
      objc_msgSend(v3, "scheme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("https"));

      if (!v9)
        goto LABEL_11;
    }
    if (-[UIPreviewItemController _isMobileSafariRestricted](self, "_isMobileSafariRestricted")
      || (objc_msgSend(v3, "iTunesStoreURL"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      previewData = self->_previewData;
      self->_previewData = 0;

      self->_type = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "_previewItemControllerDidCancelPreview:", self);
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_tapticEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "actuateFeedback:", 2);

      v6 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v6 = 0;
LABEL_12:

    return v6;
  }
  return 0;
}

- (BOOL)_isMobileSafariRestricted
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilesafari"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRestricted");

  return v4;
}

- (id)previewViewControllerForPosition:(CGPoint)a3 inSourceView:(id)a4 documentProperties:(id)a5
{
  double y;
  double x;
  id v8;
  id WeakRetained;
  MLULookupItem *lookupItem;
  int64_t *p_type;
  NSDictionary *v12;
  NSDictionary *previewData;
  NSDictionary *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  id v18;
  void *v19;
  void *v20;
  MLULookupItem *v21;
  id v22;
  MLULookupItem *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  MLULookupItem *v38;
  MLULookupItem *v39;
  void *v40;
  void *v41;
  MLULookupItem *v43;
  NSDictionary *v44;
  _QWORD v45[4];

  y = a3.y;
  x = a3.x;
  v45[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(WeakRetained, "_interactionShouldBeginFromPreviewItemController:forPosition:", self, x, y))
  {
    v15 = 0;
    goto LABEL_41;
  }
  lookupItem = self->_lookupItem;
  self->_lookupItem = 0;

  self->_contentManagedByClient = 0;
  self->_type = 0;
  p_type = &self->_type;
  objc_msgSend(WeakRetained, "_dataForPreviewItemController:atPosition:type:", self, &self->_type, x, y);
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  previewData = self->_previewData;
  self->_previewData = v12;

  v14 = self->_previewData;
  if (!self->_type || !v14)
    goto LABEL_7;
  if (-[UIPreviewItemController _shouldCancelPreviewWithNegativeFeedback](self, "_shouldCancelPreviewWithNegativeFeedback"))
  {
    v14 = self->_previewData;
LABEL_7:
    self->_previewData = 0;

    v15 = 0;
LABEL_8:
    self->_type = 0;
    goto LABEL_41;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_presentedViewControllerForPreviewItemController:", self);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v15 = (void *)v16;
      self->_contentManagedByClient = 1;
      goto LABEL_41;
    }
  }
  v17 = *p_type;
  if (*p_type == 5)
  {
    v22 = objc_alloc((Class)getMLULookupItemClass());
    -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", UIPreviewDataAttachmentList);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", UIPreviewDataAttachmentIndex);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (MLULookupItem *)objc_msgSend(v22, "initWithAttachments:currentAttachment:", v19, objc_msgSend(v20, "unsignedIntegerValue"));
LABEL_18:
    v23 = self->_lookupItem;
    self->_lookupItem = v21;

    goto LABEL_29;
  }
  if (v17 != 4)
  {
    if (v17 != 2)
      goto LABEL_29;
    v18 = objc_alloc((Class)getMLULookupItemClass());
    -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", UIPreviewDataLink);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", UIPreviewDataDDResult);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (MLULookupItem *)objc_msgSend(v18, "initWithURL:dataDetectorsResult:text:range:", v19, v20, &stru_1E16EDF20, 0, 0);
    goto LABEL_18;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", CFSTR("UIPreviewDataText"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (__CFString *)v24;
  else
    v26 = &stru_1E16EDF20;
  v27 = v26;

  -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", CFSTR("UIPreviewDataTextBefore"));
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (__CFString *)v28;
  else
    v30 = &stru_1E16EDF20;
  v31 = v30;

  -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", CFSTR("UIPreviewDataTextAfter"));
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = (__CFString *)v32;
  else
    v34 = &stru_1E16EDF20;
  v35 = v34;

  v45[0] = v31;
  v45[1] = v27;
  v45[2] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "componentsJoinedByString:", &stru_1E16EDF20);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (MLULookupItem *)objc_msgSend(objc_alloc((Class)getMLULookupItemClass()), "initWithURL:dataDetectorsResult:text:range:", 0, 0, v37, -[__CFString length](v31, "length"), -[__CFString length](v27, "length"));
  v39 = self->_lookupItem;
  self->_lookupItem = v38;

LABEL_29:
  if (self->_lookupItem)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", UIPreviewDataDDContext);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "addEntriesFromDictionary:", v40);
    }
    -[MLULookupItem setDocumentProperties:](self->_lookupItem, "setDocumentProperties:", v8);
    if (-[MLULookupItem resolve](self->_lookupItem, "resolve"))
    {
      -[MLULookupItem viewControllerToPresent](self->_lookupItem, "viewControllerToPresent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  if (*p_type == 5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_previewData, "objectForKeyedSubscript:", CFSTR("UIPreviewDataAttachmentListIsContentManaged"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _UIShimSetIsContentManaged(v15, objc_msgSend(v41, "BOOLValue"));

  }
  if (!v15)
  {
    v43 = self->_lookupItem;
    self->_lookupItem = 0;

    v44 = self->_previewData;
    self->_previewData = 0;

    goto LABEL_8;
  }
LABEL_41:

  return v15;
}

- (void)previewInteractionController:(id)a3 performCommitForPreviewViewController:(id)a4 committedViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  MLULookupItem *lookupItem;
  uint64_t v13;
  UIViewController *presentingViewController;
  _QWORD v15[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_contentManagedByClient)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "_previewItemController:commitPreview:", self, v10);
    -[UIPreviewItemController stopInteraction](self, "stopInteraction");

  }
  else
  {
    lookupItem = self->_lookupItem;
    if (lookupItem)
    {
      v13 = -[MLULookupItem commitType](lookupItem, "commitType");
      if (v13 != 4)
      {
        if (v13 == 2)
        {
          presentingViewController = self->_presentingViewController;
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __118__UIPreviewItemController_previewInteractionController_performCommitForPreviewViewController_committedViewController___block_invoke;
          v15[3] = &unk_1E16B1B28;
          v15[4] = self;
          -[UIViewController presentViewController:animated:completion:](presentingViewController, "presentViewController:animated:completion:", v10, 0, v15);
        }
        else
        {
          -[UIPreviewItemController stopInteraction](self, "stopInteraction");
        }
      }
    }
  }

}

uint64_t __118__UIPreviewItemController_previewInteractionController_performCommitForPreviewViewController_committedViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "commit");
  return objc_msgSend(*(id *)(a1 + 32), "stopInteraction");
}

- (BOOL)performsViewControllerCommitTransitionForPreviewInteractionController:(id)a3
{
  return 1;
}

- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtPosition:(CGPoint)a4 inView:(id)a5 presentingViewController:(id *)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  UIViewController *v20;
  UIViewController *presentedViewController;
  UIViewController *v22;

  y = a4.y;
  x = a4.x;
  v10 = a5;
  -[UIPreviewItemController presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = v10;
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      while (1)
      {
        if (v14)
        {
          objc_msgSend(v14, "parentViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            break;
        }
        +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "superview");
        v16 = objc_claimAutoreleasedReturnValue();

        v14 = v11;
        v13 = (void *)v16;
        if (!v16)
          goto LABEL_10;
      }
      v11 = v14;
LABEL_10:

    }
    else
    {
      v11 = 0;
    }
  }
  objc_msgSend(v11, "presentedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {

    v11 = 0;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v11);
  if (v11)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("Presenter"));
    -[UIPreviewItemController presentationGestureRecognizer](self, "presentationGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("Gesture"));

    -[UIPreviewItemController previewViewControllerForPosition:inSourceView:documentProperties:](self, "previewViewControllerForPosition:inSourceView:documentProperties:", v10, v18, x, y);
    v20 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    presentedViewController = self->_presentedViewController;
    self->_presentedViewController = v20;

    objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, CFSTR("Gesture"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, CFSTR("Presenter"));
    if (self->_presentedViewController)
      objc_storeStrong((id *)&self->_presentingViewController, v11);

  }
  v22 = self->_presentedViewController;

  return v22;
}

- (BOOL)performsCustomCommitTransitionForPreviewInteractionController:(id)a3
{
  return -[MLULookupItem commitType](self->_lookupItem, "commitType", a3) == 4;
}

- (void)previewInteractionController:(id)a3 performCustomCommitForPreviewViewController:(id)a4 completion:(id)a5
{
  id v7;
  MLULookupItem *lookupItem;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a5;
  lookupItem = self->_lookupItem;
  v9 = a4;
  -[UIPreviewItemController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __111__UIPreviewItemController_previewInteractionController_performCustomCommitForPreviewViewController_completion___block_invoke;
  v12[3] = &unk_1E16B2F48;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[MLULookupItem commitWithTransitionForPreviewViewController:inViewController:completion:](lookupItem, "commitWithTransitionForPreviewViewController:inViewController:completion:", v9, v10, v12);

}

uint64_t __111__UIPreviewItemController_previewInteractionController_performCustomCommitForPreviewViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stopInteraction");
}

- (BOOL)previewInteractionController:(id)a3 shouldUseStandardRevealTransformForPreviewingAtLocation:(CGPoint)a4 inView:(id)a5
{
  return self->_previewIndicatorUsesStandardAnimation || self->_previewIndicatorView == 0;
}

- (void)previewInteractionController:(id)a3 interactionProgress:(id)a4 forRevealAtLocation:(CGPoint)a5 inSourceView:(id)a6 containerView:(id)a7
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;

  v15 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  if (!self->_previewIndicatorUsesStandardAnimation && self->_previewIndicatorView)
  {
    -[UIView setAlpha:](self->_previewIndicatorImageView, "setAlpha:", 0.0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    -[UIPreviewItemController preparePreviewIndicatorViewInSourceView:updateScreen:](self, "preparePreviewIndicatorViewInSourceView:updateScreen:", WeakRetained, 0);

    objc_msgSend(v13, "addSubview:", self->_previewIndicatorView);
    objc_msgSend(v11, "addProgressObserver:", self);
  }

}

- (void)interactionProgressDidUpdate:(id)a3
{
  double v4;
  BOOL v5;
  double v6;
  CADisplayLink *v7;
  CADisplayLink *previewIndicatorDisplayLink;
  CADisplayLink *v9;
  void *v10;

  objc_msgSend(a3, "percentComplete");
  v5 = v4 <= 0.2;
  v6 = 0.0;
  if (!v5)
    v6 = 1.0;
  self->_previewIndicatorAnimationTargetAlpha = v6;
  if (!self->_previewIndicatorDisplayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_updatePreviewIndicatorAnimation_);
    v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    previewIndicatorDisplayLink = self->_previewIndicatorDisplayLink;
    self->_previewIndicatorDisplayLink = v7;

    v9 = self->_previewIndicatorDisplayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v9, "addToRunLoop:forMode:", v10, *MEMORY[0x1E0C99748]);

    self->_lastPreviewIndicatorAnimationTimestamp = CACurrentMediaTime();
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  CADisplayLink *previewIndicatorDisplayLink;

  -[CADisplayLink invalidate](self->_previewIndicatorDisplayLink, "invalidate", a3, a4);
  previewIndicatorDisplayLink = self->_previewIndicatorDisplayLink;
  self->_previewIndicatorDisplayLink = 0;

}

- (void)updatePreviewIndicatorAnimation:(id)a3
{
  CADisplayLink *previewIndicatorDisplayLink;
  double v5;
  CADisplayLink *v6;
  double previewIndicatorAnimationTargetAlpha;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[UIView alpha](self->_previewIndicatorImageView, "alpha", a3);
  previewIndicatorDisplayLink = self->_previewIndicatorDisplayLink;
  if (v5 == self->_previewIndicatorAnimationTargetAlpha)
  {
    -[CADisplayLink invalidate](previewIndicatorDisplayLink, "invalidate");
    v6 = self->_previewIndicatorDisplayLink;
    self->_previewIndicatorDisplayLink = 0;

  }
  else
  {
    -[CADisplayLink timestamp](previewIndicatorDisplayLink, "timestamp");
    previewIndicatorAnimationTargetAlpha = self->_previewIndicatorAnimationTargetAlpha;
    v9 = (v8 - self->_lastPreviewIndicatorAnimationTimestamp) / 0.15;
    -[UIView alpha](self->_previewIndicatorImageView, "alpha");
    if (previewIndicatorAnimationTargetAlpha >= v10)
      v11 = v9;
    else
      v11 = -v9;
    -[UIView alpha](self->_previewIndicatorImageView, "alpha");
    v13 = fmin(v12 + v11, 1.0);
    if (v13 < 0.0)
      v13 = 0.0;
    -[UIView setAlpha:](self->_previewIndicatorImageView, "setAlpha:", v13);
    -[CADisplayLink timestamp](self->_previewIndicatorDisplayLink, "timestamp");
    self->_lastPreviewIndicatorAnimationTimestamp = v14;
  }
}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6
{
  double y;
  double x;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double width;
  double height;
  void *v19;
  id v20;

  y = a5.y;
  x = a5.x;
  v20 = a4;
  v10 = a6;
  -[UIPreviewItemController startInteraction](self, "startInteraction");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_contentManagedByClient && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_previewItemController:willPresentPreview:forPosition:inSourceView:", self, v20, v10, x, y);
  objc_opt_class();
  self->_previewIndicatorUsesStandardAnimation = objc_opt_isKindOfClass() & 1;
  -[UIPreviewItemController setupPreviewIndicatorInSourceView:](self, "setupPreviewIndicatorInSourceView:", v10);
  if (self->_previewIndicatorUsesStandardAnimation)
  {
    -[UIView setFrame:](self->_previewIndicatorView, "setFrame:", self->_previewIndicatorBoundingRect.origin.x, self->_previewIndicatorBoundingRect.origin.y, self->_previewIndicatorBoundingRect.size.width, self->_previewIndicatorBoundingRect.size.height);
    v12 = objc_loadWeakRetained((id *)&self->_view);
    -[UIPreviewItemController preparePreviewIndicatorViewInSourceView:updateScreen:](self, "preparePreviewIndicatorViewInSourceView:updateScreen:", v12, 1);

    objc_msgSend(v10, "addSubview:", self->_previewIndicatorView);
    objc_msgSend(v20, "presentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", self->_previewIndicatorView);

    objc_msgSend(v20, "presentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self->_previewIndicatorView, "bounds");
    v19 = v14;
  }
  else
  {
    objc_msgSend(v20, "presentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    v15 = self->_previewIndicatorBoundingRect.origin.x;
    v16 = self->_previewIndicatorBoundingRect.origin.y;
    width = self->_previewIndicatorBoundingRect.size.width;
    height = self->_previewIndicatorBoundingRect.size.height;
  }
  objc_msgSend(v19, "setSourceRect:", v15, v16, width, height);

}

- (void)previewInteractionController:(id)a3 didDismissViewController:(id)a4 committing:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  id v8;

  v5 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_contentManagedByClient && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_previewItemController:didDismissPreview:committing:", self, v8, v5);
  -[UIPreviewItemController stopInteraction](self, "stopInteraction");
  -[UIPreviewItemController clearPreviewIndicator](self, "clearPreviewIndicator");

}

- (void)clearPreviewIndicator
{
  UIView *previewIndicatorView;
  UIImageView *previewIndicatorImageView;
  UIView *previewIndicatorSnapshotView;
  CGSize v6;

  -[UIView removeFromSuperview](self->_previewIndicatorView, "removeFromSuperview");
  previewIndicatorView = self->_previewIndicatorView;
  self->_previewIndicatorView = 0;

  -[UIView removeFromSuperview](self->_previewIndicatorImageView, "removeFromSuperview");
  previewIndicatorImageView = self->_previewIndicatorImageView;
  self->_previewIndicatorImageView = 0;

  -[UIView removeFromSuperview](self->_previewIndicatorSnapshotView, "removeFromSuperview");
  previewIndicatorSnapshotView = self->_previewIndicatorSnapshotView;
  self->_previewIndicatorSnapshotView = 0;

  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_previewIndicatorBoundingRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_previewIndicatorBoundingRect.size = v6;
}

- (void)preparePreviewIndicatorViewInSourceView:(id)a3 updateScreen:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *previewIndicatorSnapshotView;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:toView:", v8, self->_previewIndicatorBoundingRect.origin.x, self->_previewIndicatorBoundingRect.origin.y, self->_previewIndicatorBoundingRect.size.width, self->_previewIndicatorBoundingRect.size.height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  _UISnapshotViewRectAfterCommit(v7, v4, v10, v12, v14, v16);
  v17 = (UIView *)objc_claimAutoreleasedReturnValue();
  previewIndicatorSnapshotView = self->_previewIndicatorSnapshotView;
  self->_previewIndicatorSnapshotView = v17;

  -[UIView insertSubview:atIndex:](self->_previewIndicatorView, "insertSubview:atIndex:", self->_previewIndicatorSnapshotView, 0);
  -[UIView bounds](self->_previewIndicatorView, "bounds");
  -[UIView setFrame:](self->_previewIndicatorSnapshotView, "setFrame:");
}

- (void)setupPreviewIndicatorInSourceView:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  UIView *v18;
  UIView *previewIndicatorView;
  void *v20;
  UIImageView *v21;
  UIImageView *previewIndicatorImageView;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  const CGPath *PathWithShrinkWrappedRects;
  double height;
  double width;
  double v34;
  double v35;
  double v36;
  float v37;
  id v38;
  void *v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[2];
  CGRect v49;

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIPreviewItemController clearPreviewIndicator](self, "clearPreviewIndicator");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_presentationRectsForPreviewItemController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_25;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(WeakRetained, "_presentationRectForPreviewItemController:", self);
    objc_msgSend(v7, "valueWithCGRect:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_25;
  }
  if (objc_msgSend(v6, "count"))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "CGRectValue");
          v49.origin.x = v14;
          v49.origin.y = v15;
          v49.size.width = v16;
          v49.size.height = v17;
          self->_previewIndicatorBoundingRect = CGRectUnion(self->_previewIndicatorBoundingRect, v49);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v11);
    }

    v18 = objc_alloc_init(UIView);
    previewIndicatorView = self->_previewIndicatorView;
    self->_previewIndicatorView = v18;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_presentationSnapshotForPreviewItemController:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v20);
        previewIndicatorImageView = self->_previewIndicatorImageView;
        self->_previewIndicatorImageView = v21;

        -[UIView addSubview:](self->_previewIndicatorView, "addSubview:", self->_previewIndicatorImageView);
      }

    }
    objc_msgSend(v4, "window");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v4, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "screen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scale");
      v27 = v26;

    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "scale");
      v27 = v28;
    }

    v29 = v27;
    v30 = (float)(v29 * 5.0);
    PathWithShrinkWrappedRects = (const CGPath *)WebKitCreatePathWithShrinkWrappedRects();
    if (!PathWithShrinkWrappedRects)
      PathWithShrinkWrappedRects = CGPathCreateWithRoundedRect(self->_previewIndicatorBoundingRect, v30, v30, 0);
    width = self->_previewIndicatorBoundingRect.size.width;
    height = self->_previewIndicatorBoundingRect.size.height;
    v34 = 1.0;
    if (!self->_previewIndicatorUsesStandardAnimation)
    {
      objc_msgSend(v4, "convertRect:toView:", 0, self->_previewIndicatorBoundingRect.origin.x, self->_previewIndicatorBoundingRect.origin.y, self->_previewIndicatorBoundingRect.size.width, self->_previewIndicatorBoundingRect.size.height);
      width = v35;
      height = v36;
      v37 = v35 / self->_previewIndicatorBoundingRect.size.width;
      v34 = v37;
    }
    v38 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    objc_msgSend(v38, "setPath:", PathWithShrinkWrappedRects);
    CGPathRelease(PathWithShrinkWrappedRects);
    objc_msgSend(v38, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    CATransform3DMakeScale(&v41, v34, v34, 1.0);
    CATransform3DTranslate(&v42, &v41, -self->_previewIndicatorBoundingRect.origin.x, -self->_previewIndicatorBoundingRect.origin.y, 0.0);
    v40 = v42;
    objc_msgSend(v38, "setTransform:", &v40);
    -[UIView layer](self->_previewIndicatorView, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setMask:", v38);

    -[UIView setFrame:](self->_previewIndicatorView, "setFrame:", 0.0, 0.0, width, height);
    -[UIView bounds](self->_previewIndicatorView, "bounds");
    -[UIImageView setFrame:](self->_previewIndicatorImageView, "setFrame:");

  }
LABEL_25:

}

- (void)startInteraction
{
  id WeakRetained;

  if (self->_interactionInProgress)
  {
    NSLog(CFSTR("-[UIPreviewItemController stopInteraction] not called after startInteraction. This is unexpected, please file a radar."), a2);
    -[UIPreviewItemController stopInteraction](self, "stopInteraction");
  }
  self->_interactionInProgress = 1;
  objc_storeStrong((id *)&self->_strongSelf, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_interactionStartedFromPreviewItemController:", self);

}

- (void)stopInteraction
{
  MLULookupItem *lookupItem;
  UIPreviewItemController *strongSelf;
  UIViewController *presentingViewController;
  UIViewController *presentedViewController;
  NSDictionary *previewData;
  id WeakRetained;

  if (self->_interactionInProgress)
  {
    self->_interactionInProgress = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "_interactionStoppedFromPreviewItemController:", self);
    lookupItem = self->_lookupItem;
    self->_lookupItem = 0;

    strongSelf = self->_strongSelf;
    self->_strongSelf = 0;

    presentingViewController = self->_presentingViewController;
    self->_presentingViewController = 0;

    presentedViewController = self->_presentedViewController;
    self->_presentedViewController = 0;

    previewData = self->_previewData;
    self->_type = 0;
    self->_previewData = 0;

  }
  else
  {
    NSLog(CFSTR("-[UIPreviewItemController stopInteraction] called more than once after startInteraction. This is unexpected, please file a radar."), a2);
  }
}

- (UIPreviewItemDelegate)delegate
{
  return (UIPreviewItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)previewData
{
  return self->_previewData;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (BOOL)interactionInProgress
{
  return self->_interactionInProgress;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_previewData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_previewIndicatorDisplayLink, 0);
  objc_storeStrong((id *)&self->_previewIndicatorSnapshotView, 0);
  objc_storeStrong((id *)&self->_previewIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_previewIndicatorView, 0);
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_storeStrong((id *)&self->_lookupItem, 0);
}

@end
