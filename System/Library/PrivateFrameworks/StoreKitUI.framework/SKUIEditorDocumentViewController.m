@implementation SKUIEditorDocumentViewController

- (SKUIEditorDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SKUIEditorDocumentViewController *v6;
  SKUIEditorDocumentViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorDocumentViewController initWithTemplateElement:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIEditorDocumentViewController;
  v6 = -[SKUIEditorDocumentViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIEditorDocumentViewController;
  -[SKUIViewController dealloc](&v4, sel_dealloc);
}

- (void)_doneButtonAction
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  SKUIEditorDocumentViewController *v7;
  id v8;
  id location;

  -[SKUIEditorTemplateView text](self->_editorView, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEditorTemplateView setDisabled:](self->_editorView, "setDisabled:", 1);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SKUIEditorDocumentViewController__doneButtonAction__block_invoke;
  v5[3] = &unk_1E73A6C28;
  objc_copyWeak(&v8, &location);
  v4 = v3;
  v6 = v4;
  v7 = self;
  -[SKUIEditorDocumentViewController _updateBiographyWithText:onCompletion:](self, "_updateBiographyWithText:onCompletion:", v4, v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __53__SKUIEditorDocumentViewController__doneButtonAction__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_sendDoneEventAndDismissWithText:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "setDisabled:", 0);

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SKUIEditorDocumentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;

    -[SKUIEditorDocumentViewController _updateEditorViewInset](self, "_updateEditorViewInset");
  }

}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SKUIEditorDocumentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;

    -[SKUIEditorDocumentViewController _updateEditorViewInset](self, "_updateEditorViewInset");
  }

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  CGSize v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_keyboardFrame.size = v5;
    -[SKUIEditorDocumentViewController _updateEditorViewInset](self, "_updateEditorViewInset");
  }

}

- (void)documentDidUpdate:(id)a3
{
  SKUIEditorTemplateViewElement *v4;
  SKUIEditorTemplateViewElement *templateElement;
  SKUIEditorTemplateView *editorView;
  void *v7;

  objc_msgSend(a3, "templateElement");
  v4 = (SKUIEditorTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  editorView = self->_editorView;
  if (editorView)
  {
    -[SKUIEditorDocumentViewController _backgroundColor](self, "_backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewReuseView setBackgroundColor:](editorView, "setBackgroundColor:", v7);

  }
  -[SKUIEditorDocumentViewController _layoutNavigation](self, "_layoutNavigation");
}

- (void)didChangeTextInEditorTemplateView:(id)a3
{
  if (!self->_isTextChanged)
  {
    self->_isTextChanged = 1;
    -[SKUIEditorDocumentViewController _layoutNavigation](self, "_layoutNavigation", a3);
  }
}

- (void)loadView
{
  id v3;
  SKUIEditorTemplateView *editorView;
  SKUIEditorTemplateView *v5;
  SKUIEditorTemplateView *v6;
  SKUIEditorTemplateView *v7;
  void *v8;
  SKUIEditorTemplateView *v9;
  SKUIEditorTemplateViewElement *templateElement;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  editorView = self->_editorView;
  v11 = v3;
  if (!editorView)
  {
    v5 = objc_alloc_init(SKUIEditorTemplateView);
    v6 = self->_editorView;
    self->_editorView = v5;

    -[SKUIEditorTemplateView setDelegate:](self->_editorView, "setDelegate:", self);
    v7 = self->_editorView;
    -[SKUIEditorDocumentViewController _backgroundColor](self, "_backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewReuseView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[SKUIEditorTemplateView setPreservesSuperviewLayoutMargins:](self->_editorView, "setPreservesSuperviewLayoutMargins:", 1);
    v9 = self->_editorView;
    templateElement = self->_templateElement;
    -[SKUIViewElementLayoutContext activePageWidth](self->_layoutContext, "activePageWidth");
    -[SKUIEditorTemplateView reloadWithViewElement:width:context:](v9, "reloadWithViewElement:width:context:", templateElement, self->_layoutContext);
    v3 = v11;
    editorView = self->_editorView;
  }
  objc_msgSend(v3, "addSubview:", editorView);
  -[SKUIEditorDocumentViewController setView:](self, "setView:", v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIEditorDocumentViewController _layoutEditorView](self, "_layoutEditorView");
  -[SKUIEditorDocumentViewController _layoutNavigation](self, "_layoutNavigation");
  v5.receiver = self;
  v5.super_class = (Class)SKUIEditorDocumentViewController;
  -[SKUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIEditorTemplateView resignFirstResponder](self->_editorView, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)SKUIEditorDocumentViewController;
  -[SKUIEditorDocumentViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  -[SKUIEditorDocumentViewController _layoutEditorView](self, "_layoutEditorView");
  -[SKUIEditorDocumentViewController _layoutNavigation](self, "_layoutNavigation");
  v3.receiver = self;
  v3.super_class = (Class)SKUIEditorDocumentViewController;
  -[SKUIEditorDocumentViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIEditorDocumentViewController;
  -[SKUIEditorDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v4, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
}

- (void)_authenticateOnCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C0]), "initWithAccount:", v5);
    objc_msgSend(v6, "setPromptStyle:", 1);
    objc_msgSend(v6, "setShouldCreateNewSession:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAF5C0], "contextForSignIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF488]), "initWithAuthenticationContext:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke;
  v9[3] = &unk_1E73A6C50;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "startWithAuthenticateResponseBlock:", v9);

}

void __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke_2;
  v5[3] = &unk_1E73A1578;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "authenticateResponseType");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 4);
  return result;
}

- (id)_backgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SKUIEditorTemplateViewElement style](self->_templateElement, "style");
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

- (id)_layoutContext
{
  SKUIViewElementLayoutContext *layoutContext;
  SKUIViewElementLayoutContext *v4;
  SKUIViewElementLayoutContext *v5;
  SKUIViewElementLayoutContext *v6;
  void *v7;

  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    v5 = self->_layoutContext;
    self->_layoutContext = v4;

    v6 = self->_layoutContext;
    -[SKUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewElementLayoutContext setClientContext:](v6, "setClientContext:", v7);

    -[SKUIViewElementLayoutContext setContainerViewElementType:](self->_layoutContext, "setContainerViewElementType:", -[SKUIEditorTemplateViewElement elementType](self->_templateElement, "elementType"));
    -[SKUIViewElementLayoutContext setParentViewController:](self->_layoutContext, "setParentViewController:", self);
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_layoutEditorView
{
  SKUIEditorTemplateView *editorView;
  id v3;

  editorView = self->_editorView;
  -[SKUIEditorDocumentViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[SKUIEditorTemplateView setFrame:](editorView, "setFrame:");

}

- (void)_layoutNavigation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGRect *p_toolbarFrame;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGSize v17;
  id v18;

  -[SKUIEditorDocumentViewController navigationController](self, "navigationController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", self->_isTextChanged);
  objc_msgSend(v6, "setTarget:", self);
  objc_msgSend(v6, "setAction:", sel__doneButtonAction);
  objc_msgSend(v5, "leftBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTarget:", self);
  objc_msgSend(v7, "setAction:", sel__cancelButtonAction);
  objc_msgSend(v18, "setToolbarHidden:", !self->_isTextChanged);
  objc_msgSend(v18, "toolbar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTarget:", self);
  objc_msgSend(v10, "setAction:", sel__resetButtonAction);
  p_toolbarFrame = &self->_toolbarFrame;
  if (self->_isTextChanged)
  {
    objc_msgSend(v18, "toolbar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    p_toolbarFrame->origin.x = v13;
    p_toolbarFrame->origin.y = v14;
    p_toolbarFrame->size.width = v15;
    p_toolbarFrame->size.height = v16;

  }
  else
  {
    v17 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    p_toolbarFrame->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_toolbarFrame.size = v17;
  }

}

- (id)_locateFirstButtonWithType:(int64_t)a3 inChildrenOfElement:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__66;
  v13 = __Block_byref_object_dispose__66;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__SKUIEditorDocumentViewController__locateFirstButtonWithType_inChildrenOfElement___block_invoke;
  v8[3] = &unk_1E73A44E8;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __83__SKUIEditorDocumentViewController__locateFirstButtonWithType_inChildrenOfElement___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  BOOL v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v6 = objc_msgSend(v9, "elementType") == 12;
  v7 = v9;
  if (v6)
  {
    v8 = v9;
    if (objc_msgSend(v8, "buttonViewType") == *(_QWORD *)(a1 + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
    }

    v7 = v9;
  }

}

- (void)_resetButtonAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  _QWORD v23[4];
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[SKUIViewElement firstChildForElementType:](self->_templateElement, "firstChildForElementType:", 31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v20, v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "buttons");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v11, "buttonViewType", v19) == 11)
        {
          objc_initWeak(&location, self);
          v12 = (void *)MEMORY[0x1E0DC3448];
          objc_msgSend(v11, "buttonText");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __54__SKUIEditorDocumentViewController__resetButtonAction__block_invoke;
          v23[3] = &unk_1E73A13B0;
          objc_copyWeak(&v24, &location);
          objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
        }
        else
        {
          v16 = (void *)MEMORY[0x1E0DC3448];
          objc_msgSend(v11, "buttonText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v6, "addAction:", v15);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  -[SKUIEditorDocumentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

void __54__SKUIEditorDocumentViewController__resetButtonAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetTextView");

}

- (void)_resetTextView
{
  SKUIEditorTemplateView *editorView;
  SKUIEditorTemplateViewElement *templateElement;

  editorView = self->_editorView;
  templateElement = self->_templateElement;
  -[SKUIViewElementLayoutContext activePageWidth](self->_layoutContext, "activePageWidth");
  -[SKUIEditorTemplateView reloadWithViewElement:width:context:](editorView, "reloadWithViewElement:width:context:", templateElement, self->_layoutContext);
  self->_isTextChanged = 0;
  -[SKUIEditorDocumentViewController _layoutNavigation](self, "_layoutNavigation");
}

- (void)_sendCancelEventAndDismiss
{
  void *v3;
  SKUIEditorTemplateViewElement *templateElement;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("cancelButton"), CFSTR("buttonIdentifier"), 0);
  templateElement = self->_templateElement;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SKUIEditorDocumentViewController__sendCancelEventAndDismiss__block_invoke;
  v5[3] = &unk_1E73A2D58;
  v5[4] = self;
  -[SKUIEditorTemplateViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](templateElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 14, 1, 1, v3, v5);

}

uint64_t __62__SKUIEditorDocumentViewController__sendCancelEventAndDismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_sendDoneEventAndDismissWithText:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  SKUIEditorTemplateViewElement *templateElement;
  _QWORD v8[5];

  v4 = (objc_class *)MEMORY[0x1E0C99D80];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithObjectsAndKeys:", CFSTR("doneButton"), CFSTR("buttonIdentifier"), v5, CFSTR("text"), 0);

  templateElement = self->_templateElement;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SKUIEditorDocumentViewController__sendDoneEventAndDismissWithText___block_invoke;
  v8[3] = &unk_1E73A2D58;
  v8[4] = self;
  -[SKUIEditorTemplateViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](templateElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 14, 1, 1, v6, v8);

}

uint64_t __69__SKUIEditorDocumentViewController__sendDoneEventAndDismissWithText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateBiographyWithText:(id)a3 onCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SKUIMediaSocialUpdateProfileOperation *v14;
  void *v15;
  SKUIMediaSocialUpdateProfileOperation *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[SKUIEditorTemplateViewElement contentId](self->_templateElement, "contentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v11, CFSTR("SKUIMediaSocialAdminPermissionsOptionIgnoreCache"), 0);

    +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator](SKUIMediaSocialAdminPermissionsCoordinator, "sharedCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke;
    v19[3] = &unk_1E73A6C78;
    v20 = v8;
    v21 = &v22;
    objc_msgSend(v13, "getAuthorsAndWaitWithOptions:authorsBlock:", v12, v19);

  }
  if (*((_BYTE *)v23 + 24))
  {
    v14 = [SKUIMediaSocialUpdateProfileOperation alloc];
    -[SKUIViewController clientContext](self, "clientContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SKUIMediaSocialUpdateProfileOperation initWithClientContext:](v14, "initWithClientContext:", v15);

    -[SKUIMediaSocialUpdateProfileOperation setEntityType:](v16, "setEntityType:", CFSTR("artist"));
    -[SKUIMediaSocialUpdateProfileOperation setIdentifier:](v16, "setIdentifier:", v8);
    -[SKUIMediaSocialUpdateProfileOperation setValue:forProfileField:](v16, "setValue:forProfileField:", v6, CFSTR("bio"));
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_2;
    v17[3] = &unk_1E73A6A10;
    v18 = v7;
    -[SKUIMediaSocialUpdateProfileOperation setOutputBlock:](v16, "setOutputBlock:", v17);
    -[SKUIMediaSocialUpdateProfileOperation main](v16, "main");

  }
  _Block_object_dispose(&v22, 8);

}

void __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "longLongValue");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "longLongValue");

        if (v11 == v4)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

void __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_3;
  v3[3] = &unk_1E73A33F8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_updateEditorViewInset
{
  SKUIEditorTemplateView *editorView;
  double Height;

  editorView = self->_editorView;
  Height = CGRectGetHeight(self->_keyboardFrame);
  -[SKUIEditorTemplateView setBottomInset:](editorView, "setBottomInset:", Height + CGRectGetHeight(self->_toolbarFrame));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_resetButtonElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_editorView, 0);
  objc_storeStrong((id *)&self->_doneButtonElement, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorDocumentViewController initWithTemplateElement:]";
}

@end
