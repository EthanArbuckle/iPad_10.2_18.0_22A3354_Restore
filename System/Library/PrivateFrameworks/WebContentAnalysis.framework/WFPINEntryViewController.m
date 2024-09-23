@implementation WFPINEntryViewController

+ (id)serviceViewControllerClassName
{
  return CFSTR("WFServicePINEntryNavigationController");
}

+ (Class)remoteViewControllerClass
{
  return (Class)objc_opt_class();
}

- (WFPINEntryViewController)initWithURL:(id)a3 pageTitle:(id)a4 completion:(id)a5
{
  WFPINEntryViewController *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFPINEntryViewController;
  v9 = -[WFPINEntryViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    if (!a3)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("WFPINEntryViewController.m"), 55, CFSTR("WFPINEntryViewController: URL cannot be nil"));
    v9->_URL = (NSURL *)a3;
    if (!a4)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("WFPINEntryViewController.m"), 57, CFSTR("WFPINEntryViewController: pageTitle cannot be nil"));
    v9->_pageTitle = (NSString *)objc_msgSend(a4, "copy");
    if (!a5)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("WFPINEntryViewController.m"), 59, CFSTR("WFPINEntryViewController: completion block cannot be nil"));
    v9->_completion = (id)objc_msgSend(a5, "copy");
    v10 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke;
    v14[3] = &unk_24C583CC0;
    v14[4] = a5;
    -[WFPINEntryViewController _beginDelayingPresentation:cancellationHandler:](v9, "_beginDelayingPresentation:cancellationHandler:", v14, 3.0);
    v11 = (void *)objc_msgSend((id)objc_opt_class(), "remoteViewControllerClass");
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke_2;
    v13[3] = &unk_24C583CE8;
    v13[4] = v9;
    v13[5] = a5;
    objc_msgSend(v11, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", objc_msgSend((id)objc_opt_class(), "serviceViewControllerClassName"), CFSTR("com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI"), v13);
  }
  return v9;
}

uint64_t __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFPINEntryErrorDomain"), 0, 0));
  return 0;
}

uint64_t __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = *MEMORY[0x24BDD1398];
    v9[0] = a3;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFPINEntryErrorDomain"), 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
  else
  {
    objc_msgSend(v4, "insertRemoteViewController:", a2);
    return objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFPINEntryViewController;
  -[WFPINEntryViewController dealloc](&v3, sel_dealloc);
}

- (void)insertRemoteViewController:(id)a3
{
  uint64_t v5;
  void *v6;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 16;
  else
    v5 = 17;
  -[WFPINEntryViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", v5);
  -[WFPINEntryViewController view](self, "view");
  -[WFPINEntryViewController addChildViewController:](self, "addChildViewController:", a3);
  v6 = (void *)objc_msgSend(a3, "view");
  objc_msgSend((id)-[WFPINEntryViewController view](self, "view"), "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend((id)-[WFPINEntryViewController view](self, "view"), "addSubview:", objc_msgSend(a3, "view"));
  objc_storeWeak((id *)&self->_remoteViewController, a3);
  objc_msgSend(objc_loadWeak((id *)&self->_remoteViewController), "setDelegate:", self);
  objc_msgSend(objc_loadWeak((id *)&self->_remoteViewController), "setURL:", self->_URL);
  objc_msgSend(objc_loadWeak((id *)&self->_remoteViewController), "setPageTitle:", self->_pageTitle);
}

- (void)presentViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  UIViewController *v13;
  UIViewController *rootViewControllerToUse;
  uint64_t v15;
  void *v16;
  _UIFallbackPresentationViewController *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v6);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "rootViewController");
        if (v12)
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      v13 = (UIViewController *)objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (!v25)
        goto LABEL_14;
      v26 = v25;
      v27 = *(_QWORD *)v34;
LABEL_29:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v7);
        v13 = *(UIViewController **)(*((_QWORD *)&v33 + 1) + 8 * v28);
        if (-[WFPINEntryViewController hasUIWebViewSubView:](self, "hasUIWebViewSubView:", -[UIViewController view](v13, "view")))
        {
          break;
        }
        if (v26 == ++v28)
        {
          v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          if (v26)
            goto LABEL_29;
          goto LABEL_14;
        }
      }
    }
    self->_rootViewControllerToUse = v13;
  }
LABEL_14:
  rootViewControllerToUse = self->_rootViewControllerToUse;
  if (rootViewControllerToUse
    && (v15 = -[UIViewController view](rootViewControllerToUse, "view"),
        (v16 = (void *)objc_msgSend(MEMORY[0x24BDF6F98], "_viewControllerForFullScreenPresentationFromView:", v15)) != 0))
  {
    objc_msgSend(v16, "presentViewController:animated:completion:", self, 1, 0);
  }
  else
  {
    v17 = (_UIFallbackPresentationViewController *)objc_alloc_init(MEMORY[0x24BDF70B0]);
    self->_fallbackPresentationVC = v17;
    -[_UIFallbackPresentationViewController setRotationDecider:](v17, "setRotationDecider:", self);
    v18 = (void *)objc_msgSend(MEMORY[0x24BDF6FF8], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
    v19 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if (objc_msgSend(v24, "delegate"))
          {
            objc_msgSend(v24, "beginDisablingInterfaceAutorotation");
            objc_msgSend(v19, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v21);
    }
    self->_windowsWithDisabledRotation = (NSArray *)v19;
    -[_UIFallbackPresentationViewController _presentViewController:sendingView:animated:](self->_fallbackPresentationVC, "_presentViewController:sendingView:animated:", self, 0, v4);
  }
}

- (BOOL)hasUIWebViewSubView:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)objc_msgSend(a3, "subviews", 0);
    v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (!v5)
      return v5;
    v7 = v5;
    v8 = *(_QWORD *)v12;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v6);
      if (-[WFPINEntryViewController hasUIWebViewSubView:](self, "hasUIWebViewSubView:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)))
      {
        break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        LOBYTE(v5) = 0;
        if (v7)
          goto LABEL_6;
        return v5;
      }
    }
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *windowsWithDisabledRotation;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_fallbackPresentationVC)
  {
    windowsWithDisabledRotation = self->_windowsWithDisabledRotation;
    if (windowsWithDisabledRotation)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](windowsWithDisabledRotation, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(windowsWithDisabledRotation);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "endDisablingInterfaceAutorotation");
          }
          while (v7 != v9);
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](windowsWithDisabledRotation, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }
      self->_windowsWithDisabledRotation = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)WFPINEntryViewController;
  -[WFPINEntryViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 2;
}

- (id)delegate
{
  return 0;
}

- (void)userEnteredCorrectPIN
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __49__WFPINEntryViewController_userEnteredCorrectPIN__block_invoke;
  v2[3] = &unk_24C583C80;
  v2[4] = self;
  -[WFPINEntryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

uint64_t __49__WFPINEntryViewController_userEnteredCorrectPIN__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[121])
  {
    v3 = v1[128];
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v1 = *(_QWORD **)(a1 + 32);
    }
  }
  return (*(uint64_t (**)(void))(v1[127] + 16))();
}

- (void)userDidCancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__WFPINEntryViewController_userDidCancel__block_invoke;
  v2[3] = &unk_24C583C80;
  v2[4] = self;
  -[WFPINEntryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

uint64_t __41__WFPINEntryViewController_userDidCancel__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[121])
  {
    v3 = v1[128];
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v1 = *(_QWORD **)(a1 + 32);
    }
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(v1[127] + 16))(v1[127], 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFPINEntryErrorDomain"), 2, 0));
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteViewController);
}

@end
