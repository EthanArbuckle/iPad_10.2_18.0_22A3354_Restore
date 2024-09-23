@implementation SKUICommentDocumentViewController

- (SKUICommentDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUICommentDocumentViewController *v14;
  SKUICommentDocumentViewController *v15;
  uint64_t v16;
  SKUIStackTemplateElement *stackTemplateElement;
  void *v18;
  void *v19;
  _QWORD v21[4];
  SKUICommentDocumentViewController *v22;
  objc_super v23;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUICommentDocumentViewController initWithTemplateElement:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUICommentDocumentViewController;
  v14 = -[SKUICommentDocumentViewController init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_templateElement, a3);
    v15->_scrollNewCommentToView = -[SKUICommentTemplateViewElement scrollNewCommentToView](v15->_templateElement, "scrollNewCommentToView");
    objc_msgSend(v5, "firstChildForElementType:", 132);
    v16 = objc_claimAutoreleasedReturnValue();
    stackTemplateElement = v15->_stackTemplateElement;
    v15->_stackTemplateElement = (SKUIStackTemplateElement *)v16;

    -[SKUICommentDocumentViewController setAutomaticallyAdjustsScrollViewInsets:](v15, "setAutomaticallyAdjustsScrollViewInsets:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v15, sel__keyboardWillChangeFrameNotification_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v15, sel__keyboardDidHideChangeNotification_, *MEMORY[0x1E0DC4E68], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v15, sel__keyboardWillHideNotification_, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v15, sel__keyboardWillShowNotification_, *MEMORY[0x1E0DC4FE8], 0);
    +[SKUIMediaSocialProfileCoordinator sharedCoordinator](SKUIMediaSocialProfileCoordinator, "sharedCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__SKUICommentDocumentViewController_initWithTemplateElement___block_invoke;
    v21[3] = &unk_1E73A7FF0;
    v22 = v15;
    objc_msgSend(v19, "getProfileWithOptions:profileBlock:", 0, v21);

  }
  return v15;
}

void __61__SKUICommentDocumentViewController_initWithTemplateElement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SKUIMediaSocialAuthor *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a2)
  {
    v3 = a2;
    v4 = objc_alloc_init(SKUIMediaSocialAuthor);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1040);
    *(_QWORD *)(v5 + 1040) = v4;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
    objc_msgSend(v3, "profileType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAuthorType:", v8);

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
    objc_msgSend(v3, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v10);

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
    objc_msgSend(v3, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v12);

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
    objc_msgSend(v3, "profileImageURL");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setThumbnailImageURL:", v14);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);
  -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", 0);
  -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", 0);
  -[SKUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUICommentDocumentViewController;
  -[SKUIViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  SKUIStackTemplateElement *stackTemplateElement;
  SKUICommentPostBarView *v5;
  SKUICommentPostBarView *v6;
  SKUICommentPostBarView *postView;
  SKUICommentPostBarView *v8;
  void *v9;
  SKUICommentPostBarView *v10;
  void *v11;
  void *v12;
  SKUICommentPostBarView *v13;
  void *v14;
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  stackTemplateElement = self->_stackTemplateElement;
  v15 = v3;
  if (stackTemplateElement)
  {
    -[SKUICommentDocumentViewController updateStackElement:withView:](self, "updateStackElement:withView:", stackTemplateElement, v3);
    v3 = v15;
  }
  if (!self->_postView)
  {
    v5 = [SKUICommentPostBarView alloc];
    v6 = -[SKUICommentPostBarView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    postView = self->_postView;
    self->_postView = v6;

    -[SKUICommentPostBarView setDelegate:](self->_postView, "setDelegate:", self);
    v8 = self->_postView;
    -[SKUICommentTemplateViewElement postButtonText](self->_templateElement, "postButtonText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICommentPostBarView setPostButtonText:](v8, "setPostButtonText:", v9);

    v10 = self->_postView;
    -[SKUICommentTemplateViewElement postPlaceholderText](self->_templateElement, "postPlaceholderText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICommentPostBarView setPlaceholderText:](v10, "setPlaceholderText:", v11);

    -[SKUICommentPostBarView setPostButtonVisible:](self->_postView, "setPostButtonVisible:", 0);
    -[SKUICommentTemplateViewElement asText](self->_templateElement, "asText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = self->_postView;
      -[SKUICommentTemplateViewElement asText](self->_templateElement, "asText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICommentPostBarView setAsText:](v13, "setAsText:", v14);

    }
    objc_msgSend(v15, "addSubview:", self->_postView);
    v3 = v15;
  }
  -[SKUICommentDocumentViewController setView:](self, "setView:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  SKUICommentTemplateViewElement *templateElement;
  objc_super v6;

  v3 = a3;
  templateElement = self->_templateElement;
  if (templateElement
    && -[SKUICommentTemplateViewElement showKeyboard](templateElement, "showKeyboard")
    && !self->_didShowKeyboard)
  {
    -[SKUICommentPostBarView becomeFirstResponder](self->_postView, "becomeFirstResponder");
    self->_didShowKeyboard = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUICommentDocumentViewController;
  -[SKUICommentDocumentViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUICommentDocumentViewController _layoutScrollView:](self, "_layoutScrollView:", 0.0);
  v5.receiver = self;
  v5.super_class = (Class)SKUICommentDocumentViewController;
  -[SKUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  -[SKUICommentDocumentViewController _checkAdminStatus](self, "_checkAdminStatus");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SKUIStackDocumentViewController view](self->_childViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");
  v6.receiver = self;
  v6.super_class = (Class)SKUICommentDocumentViewController;
  -[SKUICommentDocumentViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  -[SKUICommentDocumentViewController _layoutScrollView:](self, "_layoutScrollView:", 0.0);
  if (!self->_keyboardVisible)
  {
    -[SKUICommentDocumentViewController _layoutKeyboard](self, "_layoutKeyboard");
    -[SKUICommentDocumentViewController _reloadContentSize:](self, "_reloadContentSize:", 0.0);
  }
  v3.receiver = self;
  v3.super_class = (Class)SKUICommentDocumentViewController;
  -[SKUICommentDocumentViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUICommentDocumentViewController;
  v7 = a4;
  -[SKUICommentDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SKUIStackDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](self->_childViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height, v8.receiver, v8.super_class);

}

- (void)documentDidUpdate:(id)a3
{
  SKUICommentTemplateViewElement *v4;
  SKUICommentTemplateViewElement *templateElement;
  void *v6;
  SKUIStackDocumentViewController *childViewController;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "templateElement");
  v4 = (SKUICommentTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  -[SKUIViewElement firstChildForElementType:](self->_templateElement, "firstChildForElementType:", 132);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  childViewController = self->_childViewController;
  if (childViewController)
  {
    -[SKUIStackDocumentViewController documentDidUpdate:withTemplate:](childViewController, "documentDidUpdate:withTemplate:", v9, v6);
  }
  else
  {
    -[SKUICommentDocumentViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICommentDocumentViewController updateStackElement:withView:](self, "updateStackElement:withView:", v6, v8);

    -[SKUICommentDocumentViewController _reloadContentSize:](self, "_reloadContentSize:", 0.0);
  }

}

- (void)updateStackElement:(id)a3 withView:(id)a4
{
  id v7;
  SKUIStackDocumentViewController *childViewController;
  void *v9;
  SKUIStackDocumentViewController *v10;
  SKUIStackDocumentViewController *v11;
  SKUIStackDocumentViewController *v12;
  void *v13;
  SKUIStackDocumentViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_storeStrong((id *)&self->_stackTemplateElement, a3);
  v7 = a4;
  childViewController = self->_childViewController;
  if (childViewController)
  {
    -[SKUIStackDocumentViewController view](childViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[SKUIStackDocumentViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
  }
  v10 = -[SKUIStackDocumentViewController initWithTemplateElement:layoutStyle:]([SKUIStackDocumentViewController alloc], "initWithTemplateElement:layoutStyle:", self->_stackTemplateElement, 0);
  v11 = self->_childViewController;
  self->_childViewController = v10;

  v12 = self->_childViewController;
  -[SKUIViewController clientContext](self, "clientContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewController setClientContext:](v12, "setClientContext:", v13);

  v14 = self->_childViewController;
  -[SKUIViewController operationQueue](self, "operationQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewController setOperationQueue:](v14, "setOperationQueue:", v15);

  -[SKUIStackDocumentViewController view](self->_childViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAutoresizingMask:", 18);
  -[SKUICommentDocumentViewController _backgroundColor](self, "_backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  objc_msgSend(v7, "bounds");
  objc_msgSend(v16, "setFrame:");
  -[SKUICommentDocumentViewController addChildViewController:](self, "addChildViewController:", self->_childViewController);
  -[SKUIStackDocumentViewController didMoveToParentViewController:](self->_childViewController, "didMoveToParentViewController:", self);
  objc_msgSend(v7, "addSubview:", v16);
  objc_msgSend(v7, "sendSubviewToBack:", v16);

}

- (void)commentPostBarView:(id)a3 text:(id)a4 as:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  SKUICommentTemplateViewElement *templateElement;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  if (self->_templateElement)
  {
    -[SKUICommentDocumentViewController _getSelectedCommenter](self, "_getSelectedCommenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICommentDocumentViewController _getSelectedCommenter](self, "_getSelectedCommenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "isAttributed");
    v13 = (void *)MEMORY[0x1E0C9AAA0];
    if (v12)
      v13 = (void *)MEMORY[0x1E0C9AAB0];
    v14 = v13;
    objc_msgSend(v9, "authorType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v9, "authorType");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = &stru_1E73A9FB0;
    }

    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setObject:forKey:", CFSTR("post"), CFSTR("type"));
    if (v8)
      objc_msgSend(v17, "setObject:forKey:", v8, CFSTR("comment"));
    if (v11)
      objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("commenter"));
    objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("isAttributed"));
    objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("authorType"));
    templateElement = self->_templateElement;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke;
    v19[3] = &unk_1E73A2D58;
    v20 = v7;
    -[SKUICommentTemplateViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](templateElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v17, v19);

  }
}

void __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke_2;
  block[3] = &unk_1E739FD38;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setText:", &stru_1E73A9FB0);
  return objc_msgSend(*(id *)(a1 + 32), "resignFirstResponder");
}

- (void)_keyboardWillShowNotification:(id)a3
{
  int64_t selectedCommenter;
  id v5;

  self->_keyboardVisible = 1;
  selectedCommenter = self->_selectedCommenter;
  v5 = a3;
  -[SKUICommentDocumentViewController _setSelectedCommenter:](self, "_setSelectedCommenter:", selectedCommenter);
  -[SKUICommentPostBarView setPostButtonVisible:](self->_postView, "setPostButtonVisible:", 1);
  -[SKUICommentDocumentViewController _layoutKeyboard](self, "_layoutKeyboard");
  -[SKUICommentDocumentViewController _keyboardWillChangeNotification:accountForGuideLines:applyKeyboardOffset:](self, "_keyboardWillChangeNotification:accountForGuideLines:applyKeyboardOffset:", v5, 0, 1);

}

- (void)_keyboardWillHideNotification:(id)a3
{
  SKUICommentPostBarView *postView;
  id v5;

  postView = self->_postView;
  v5 = a3;
  -[SKUICommentPostBarView setCommenter:](postView, "setCommenter:", 0);
  -[SKUICommentPostBarView setPostButtonVisible:](self->_postView, "setPostButtonVisible:", 0);
  -[SKUICommentDocumentViewController _layoutKeyboard](self, "_layoutKeyboard");
  -[SKUICommentDocumentViewController _keyboardWillChangeNotification:accountForGuideLines:applyKeyboardOffset:](self, "_keyboardWillChangeNotification:accountForGuideLines:applyKeyboardOffset:", v5, 1, 0);

}

- (void)_keyboardDidHideChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v4 = a3;
  self->_keyboardVisible = 0;
  if (self->_scrollNewCommentToView)
  {
    v15 = v4;
    -[SKUIStackDocumentViewController sectionsViewController](self->_childViewController, "sectionsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contentSize");
    v8 = v7;
    -[SKUICommentDocumentViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;

    if (v8 >= v11)
    {
      objc_msgSend(v6, "contentInset");
      v13 = v12;
      objc_msgSend(v6, "bounds");
      objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, v13 + v8 - v14);
    }

    v4 = v15;
  }

}

- (void)_keyboardWillChangeNotification:(id)a3 accountForGuideLines:(BOOL)a4 applyKeyboardOffset:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double y;
  double v26;
  uint64_t v27;
  void *v28;
  SKUICommentDocumentViewController *v29;
  SKUICommentDocumentViewController *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double height;
  id v38;

  v5 = a5;
  v6 = a4;
  objc_msgSend(a3, "userInfo");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "CGRectValue");
    self->_keyboardRect.origin.x = v10;
    self->_keyboardRect.origin.y = v11;
    self->_keyboardRect.size.width = v12;
    self->_keyboardRect.size.height = v13;
    objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0DC4E48]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0DC4E40]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0DC3F10], "beginAnimations:context:", 0, 0);
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationCurve:", v18);
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationDuration:", v16);
    -[SKUICommentPostBarView frame](self->_postView, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    y = self->_keyboardRect.origin.y;
    -[SKUICommentPostBarView bounds](self->_postView, "bounds");
    if (v6)
    {
      -[SKUICommentDocumentViewController presentingViewController](self, "presentingViewController");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = (SKUICommentDocumentViewController *)v27;
      else
        v29 = self;
      v30 = v29;

      -[SKUICommentDocumentViewController view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bounds");
      v33 = v32 - v24;
      -[SKUICommentDocumentViewController bottomLayoutGuide](v30, "bottomLayoutGuide");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "length");
      v36 = v33 - v35;

    }
    else
    {
      v36 = y - v26;
    }
    -[SKUICommentPostBarView setFrame:](self->_postView, "setFrame:", v20, v36, v22, v24);
    objc_msgSend(MEMORY[0x1E0DC3F10], "commitAnimations");
    height = 0.0;
    if (v5)
      height = self->_keyboardRect.size.height;
    -[SKUICommentDocumentViewController _reloadContentSize:](self, "_reloadContentSize:", height);
  }

}

- (id)_backgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SKUICommentTemplateViewElement style](self->_templateElement, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_changeCommenter
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
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
  void *v23;
  SKUICommentHeaderViewController *v24;
  void *v25;
  NSArray *obj;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3450];
  -[SKUIViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", 0, 0, SKUIUserInterfaceIdiom(v4) == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setModalPresentationStyle:", 7);
  -[SKUICommentTemplateViewElement commentAsText](self->_templateElement, "commentAsText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SKUICommentHeaderViewController initWithTitle:]([SKUICommentHeaderViewController alloc], "initWithTitle:", v25);
  objc_msgSend(MEMORY[0x1E0DC3448], "_actionWithContentViewController:style:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_commenters;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v11, "isMySelf"))
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUICommentTemplateViewElement myselfText](self->_templateElement, "myselfText");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if ((objc_msgSend(v11, "isAttributed") & 1) != 0)
            objc_msgSend(v11, "attributedName");
          else
            objc_msgSend(v11, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "thumbnailImage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __53__SKUICommentDocumentViewController__changeCommenter__block_invoke;
        v27[3] = &unk_1E73A3B38;
        v27[4] = self;
        +[SKUICommenterAction _actionWithTitle:image:style:handler:shouldDismissHandler:](SKUICommenterAction, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v15, v16, 0, v27, &__block_literal_global_50);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIndex:", v8 + i);
        objc_msgSend(v17, "_setChecked:", v8 + i == self->_selectedCommenter);
        objc_msgSend(v17, "_setTitleTextAlignment:", 4);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_setTitleTextColor:", v18);

        objc_msgSend(v5, "addAction:", v17);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v8 += i;
    }
    while (v7);
  }

  v19 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E73A9FB0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, &__block_literal_global_58);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v5, "addAction:", v22);
  -[SKUICommentDocumentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

void __53__SKUICommentDocumentViewController__changeCommenter__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136) = objc_msgSend(v3, "index");
    objc_msgSend(*(id *)(a1 + 32), "_setSelectedCommenter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136));
  }

}

uint64_t __53__SKUICommentDocumentViewController__changeCommenter__block_invoke_2()
{
  return 1;
}

- (void)_checkAdminStatus
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DAF6A0], "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke;
  v4[3] = &unk_1E73A32F0;
  v4[4] = self;
  objc_msgSend(v3, "getAdminStatusAndWaitWithOptions:resultBlock:", 0, v4);

}

void __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SKUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_2;
    v4[3] = &unk_1E73A8078;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "getAuthorsAndWaitWithOptions:authorsBlock:", 0, v4);

  }
}

void __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_3;
  v5[3] = &unk_1E739FD10;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_3(uint64_t a1)
{
  void *v2;
  SKUICommenter *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  SKUICommenter *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  SKUICommenter *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v32 = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040))
  {
    v3 = -[SKUICommenter initWithAuthor:]([SKUICommenter alloc], "initWithAuthor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
    -[SKUICommenter setIsMySelf:](v3, "setIsMySelf:", 1);
    objc_msgSend(v2, "addObject:", v3);

    a1 = v32;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v36;
      v8 = CFSTR("commentAsEntity");
      v9 = CFSTR("commentWithAttribution");
      do
      {
        v10 = 0;
        v33 = v6;
        do
        {
          if (*(_QWORD *)v36 != v7)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
          objc_msgSend(v11, "permissions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v8);

          if (v13)
          {
            v14 = -[SKUICommenter initWithAuthor:]([SKUICommenter alloc], "initWithAuthor:", v11);
            objc_msgSend(v2, "addObject:", v14);

          }
          objc_msgSend(v11, "permissions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v9);

          if (v16)
          {
            v17 = v9;
            v18 = v8;
            v19 = v7;
            v20 = v2;
            v21 = -[SKUICommenter initWithAuthor:]([SKUICommenter alloc], "initWithAuthor:", v11);
            -[SKUICommenter setIsAttributed:](v21, "setIsAttributed:", 1);
            objc_msgSend(*(id *)(a1 + 32), "clientContext");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
              objc_msgSend(v22, "localizedStringForKey:", CFSTR("ATTRIBUTION_PERSON_%@_FROM_GROUP_%@"));
            else
              +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ATTRIBUTION_PERSON_%@_FROM_GROUP_%@"), 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@%@"), 0, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            a1 = v32;
            -[SKUICommenter setAttributedName:](v21, "setAttributedName:", v28);
            objc_msgSend(v20, "addObject:", v21);

            v2 = v20;
            v7 = v19;
            v8 = v18;
            v9 = v17;
            v6 = v33;
          }
          ++v10;
        }
        while (v6 != v10);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v6);
    }

  }
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 1056);
  *(_QWORD *)(v29 + 1056) = v2;
  v31 = v2;

  objc_msgSend(*(id *)(a1 + 32), "_preloadCommenterImages");
}

- (id)_getSelectedCommenter
{
  void *v3;
  unint64_t selectedCommenter;

  v3 = -[NSArray count](self->_commenters, "count");
  if (v3)
  {
    selectedCommenter = self->_selectedCommenter;
    if (selectedCommenter >= -[NSArray count](self->_commenters, "count"))
    {
      v3 = 0;
    }
    else
    {
      -[NSArray objectAtIndex:](self->_commenters, "objectAtIndex:", self->_selectedCommenter);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_layoutContext
{
  SKUIViewElementLayoutContext *layoutContext;
  SKUIViewElementLayoutContext *v4;
  SKUIViewElementLayoutContext *v5;
  SKUIViewElementLayoutContext *v6;
  void *v7;
  SKUILayoutCache *v8;
  SKUILayoutCache *textLayoutCache;
  SKUIViewElementTextLayoutCache *v10;
  SKUIResourceLoader *v11;
  void *v12;
  void *v13;
  SKUIResourceLoader *v14;

  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    v5 = self->_layoutContext;
    self->_layoutContext = v4;

    -[SKUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", self);
    v6 = self->_layoutContext;
    -[SKUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](v6, "setClientContext:", v7);

    -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_layoutContext, "setContainerViewElementType:", -[SKUICommentTemplateViewElement elementType](self->_templateElement, "elementType"));
    -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", self);
    v8 = objc_alloc_init(SKUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    -[SKUILayoutCache setDelegate:](self->_textLayoutCache, "setDelegate:", self);
    v10 = -[SKUIViewElementTextLayoutCache initWithLayoutCache:]([SKUIViewElementTextLayoutCache alloc], "initWithLayoutCache:", self->_textLayoutCache);
    -[SKUIViewElementLayoutContext setLabelLayoutCache:](self->_layoutContext, "setLabelLayoutCache:", v10);
    v11 = [SKUIResourceLoader alloc];
    -[SKUIViewController operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewController clientContext](self, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SKUIResourceLoader initWithOperationQueue:clientContext:](v11, "initWithOperationQueue:clientContext:", v12, v13);

    -[SKUIViewElementLayoutContext setResourceLoader:](self->_layoutContext, "setResourceLoader:", v14);
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_layoutScrollView:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  -[SKUICommentDocumentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SKUIStackDocumentViewController view](self->_childViewController, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13 - a3);

}

- (void)_layoutKeyboard
{
  uint64_t v3;
  void *v4;
  SKUICommentDocumentViewController *v5;
  SKUICommentDocumentViewController *v6;
  SKUICommentPostBarView *postView;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  SKUICommentPostBarView *v21;

  -[SKUICommentDocumentViewController presentingViewController](self, "presentingViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (SKUICommentDocumentViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  postView = self->_postView;
  -[SKUICommentDocumentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[SKUICommentPostBarView sizeThatFits:](postView, "sizeThatFits:", v9, v10);
  v12 = v11;
  v14 = v13;

  -[SKUICommentDocumentViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16 - v14;
  -[SKUICommentDocumentViewController bottomLayoutGuide](v6, "bottomLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "length");
  v20 = v17 - v19;

  v21 = self->_postView;
  -[SKUICommentPostBarView setFrame:](v21, "setFrame:", 0.0, v20, v12, v14);
}

- (BOOL)_loadImageForURL:(id)a3 cacheKey:(id)a4 dataConsumer:(id)a5 reason:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SKUIArtworkRequest *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[SKUICommentDocumentViewController _layoutContext](self, "_layoutContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resourceLoader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(SKUIArtworkRequest);
  -[SKUIResourceRequest setCacheKey:](v15, "setCacheKey:", v11);

  -[SKUIArtworkRequest setDataConsumer:](v15, "setDataConsumer:", v10);
  -[SKUIArtworkRequest setURL:](v15, "setURL:", v12);

  LOBYTE(a6) = objc_msgSend(v14, "loadResourceWithRequest:reason:", v15, a6);
  return a6;
}

- (void)_preloadCommenterImages
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  SKUICommentImageDataConsumer *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_commenters;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "thumbnailImageURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = objc_alloc_init(SKUICommentImageDataConsumer);
          -[SKUIStyledImageDataConsumer setImageSize:](v9, "setImageSize:", 25.0, 25.0);
          objc_initWeak(&location, v7);
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __60__SKUICommentDocumentViewController__preloadCommenterImages__block_invoke;
          v12[3] = &unk_1E73A1EE0;
          objc_copyWeak(&v13, &location);
          -[SKUICommentImageDataConsumer setCompletionBlock:](v9, "setCompletionBlock:", v12);
          objc_msgSend(v7, "thumbnailImageURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "thumbnailImageURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUICommentDocumentViewController _loadImageForURL:cacheKey:dataConsumer:reason:](self, "_loadImageForURL:cacheKey:dataConsumer:reason:", v10, v11, v9, 1);

          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);

        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

void __60__SKUICommentDocumentViewController__preloadCommenterImages__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setThumbnailImage:", v5);

}

- (void)_reloadContentSize:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  SKUICommentDocumentViewController *v14;
  SKUICommentDocumentViewController *v15;
  void *v16;
  double v17;
  SKUICommentPostBarView *postView;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  -[SKUIStackDocumentViewController sectionsViewController](self->_childViewController, "sectionsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[SKUICommentDocumentViewController topLayoutGuide](self, "topLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "length");
  v11 = v10;

  if (a3 <= 0.0)
  {
    -[SKUICommentDocumentViewController presentingViewController](self, "presentingViewController");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (SKUICommentDocumentViewController *)v12;
    else
      v14 = self;
    v15 = v14;

    -[SKUICommentDocumentViewController bottomLayoutGuide](v15, "bottomLayoutGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "length");
    a3 = v17;

  }
  else
  {
    objc_msgSend(v24, "contentOffset");
    objc_msgSend(v24, "setContentOffset:");
  }
  postView = self->_postView;
  -[SKUICommentDocumentViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  -[SKUICommentPostBarView sizeThatFits:](postView, "sizeThatFits:", v20, v21);
  v23 = v7 + a3 + v22;

  objc_msgSend(v24, "setContentInset:", v11, v6, v23, v8);
}

- (void)_setSelectedCommenter:(int64_t)a3
{
  unint64_t selectedCommenter;
  void *v6;
  void *v7;
  SKUICommentPostBarView *postView;
  id v9;

  if (-[NSArray count](self->_commenters, "count")
    && (selectedCommenter = self->_selectedCommenter, selectedCommenter < -[NSArray count](self->_commenters, "count")))
  {
    if (a3
      || (-[SKUICommentTemplateViewElement myselfText](self->_templateElement, "myselfText"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      -[NSArray objectAtIndex:](self->_commenters, "objectAtIndex:", self->_selectedCommenter);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isAttributed"))
        objc_msgSend(v6, "attributedName");
      else
        objc_msgSend(v6, "name");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[SKUICommentTemplateViewElement myselfText](self->_templateElement, "myselfText");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    postView = self->_postView;
    if (self->_keyboardVisible)
    {
      -[SKUICommentPostBarView setCommenter:](postView, "setCommenter:", v9);
    }
    else
    {
      -[SKUICommentPostBarView setCommenter:](postView, "setCommenter:", 0);
      -[SKUICommentDocumentViewController _layoutKeyboard](self, "_layoutKeyboard");
    }

  }
  else
  {
    -[SKUICommentPostBarView setCommenter:](self->_postView, "setCommenter:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_stackTemplateElement, 0);
  objc_storeStrong((id *)&self->_postView, 0);
  objc_storeStrong((id *)&self->_observedArtworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_commenters, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_authorForActiveAccount, 0);
}

- (void)initWithTemplateElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
