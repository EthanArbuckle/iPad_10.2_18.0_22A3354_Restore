@implementation SPUIRemoteSearchViewController

- (SPUIRemoteSearchViewController)init
{
  SPUIRemoteSearchViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  v2 = -[SPUISpotlightRemoteViewController initWithSceneIdentifier:](&v4, sel_initWithSceneIdentifier_, CFSTR("searchScreen"));
  -[SPUIRemoteSearchViewController setDistanceToTopOfIcons:](v2, "setDistanceToTopOfIcons:", 58.0);
  return v2;
}

- (id)sceneSpecification
{
  return (id)objc_opt_new();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  double v18;
  int v19;
  void *v20;
  objc_super v21;

  v8 = a3;
  v9 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if (objc_msgSend(v10, "shouldDismiss"))
    {
      -[SPUIRemoteSearchViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissSearchView");

    }
    if (objc_msgSend(v10, "shouldBackground"))
    {
      objc_msgSend(v8, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "settings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "presentationIntent");

        if (v14 == 4)
        {
          v21.receiver = self;
          v21.super_class = (Class)SPUIRemoteSearchViewController;
          -[SPUISpotlightRemoteViewController viewDidDisappear:](&v21, sel_viewDidDisappear_, 0);
        }
      }
      else
      {

      }
    }

  }
  objc_msgSend(v8, "clientSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "clientSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "distanceToTopOfIcons");
    if (v18 > 0.0)
    {
      objc_msgSend(v17, "distanceToTopOfIcons");
      -[SPUIRemoteSearchViewController setDistanceToTopOfIcons:](self, "setDistanceToTopOfIcons:");
    }
    -[SPUIRemoteSearchViewController setSearchHeaderLayerRenderID:](self, "setSearchHeaderLayerRenderID:", objc_msgSend(v17, "searchHeaderLayerRenderID"));
    -[SPUIRemoteSearchViewController setSearchHeaderContextID:](self, "setSearchHeaderContextID:", objc_msgSend(v17, "searchHeaderContextID"));
    -[SPUIRemoteSearchViewController setSearchHeaderBackgroundContextID:](self, "setSearchHeaderBackgroundContextID:", objc_msgSend(v17, "searchHeaderBackgroundContextID"));
    -[SPUIRemoteSearchViewController setSearchHeaderBackgroundLayerRenderID:](self, "setSearchHeaderBackgroundLayerRenderID:", objc_msgSend(v17, "searchHeaderBackgroundLayerRenderID"));
    objc_msgSend(v17, "keyboardProtectorHeight");
    -[SPUIRemoteSearchViewController setKeyboardProtectorHeight:](self, "setKeyboardProtectorHeight:");
    objc_msgSend(v17, "searchBarSize");
    -[SPUIRemoteSearchViewController setSearchBarSize:](self, "setSearchBarSize:");
    objc_msgSend(v17, "dockedSearchBarSize");
    -[SPUIRemoteSearchViewController setDockedSearchBarSize:](self, "setDockedSearchBarSize:");
    objc_msgSend(v17, "searchBarCornerRadius");
    -[SPUIRemoteSearchViewController setSearchBarCornerRadius:](self, "setSearchBarCornerRadius:");
    objc_msgSend(v17, "keyboardHeight");
    -[SPUIRemoteSearchViewController setKeyboardHeight:](self, "setKeyboardHeight:");
    -[SPUIRemoteSearchViewController setSearchHeaderBlurContextID:](self, "setSearchHeaderBlurContextID:", objc_msgSend(v17, "searchHeaderBlurContextID"));
    -[SPUIRemoteSearchViewController setSearchHeaderBlurLayerRenderID:](self, "setSearchHeaderBlurLayerRenderID:", objc_msgSend(v17, "searchHeaderBlurLayerRenderID"));
    v19 = -[SPUIRemoteSearchViewController isKeyboardPresented](self, "isKeyboardPresented");
    if (v19 != objc_msgSend(v17, "isKeyboardPresented"))
    {
      -[SPUIRemoteSearchViewController setKeyboardPresented:](self, "setKeyboardPresented:", objc_msgSend(v17, "isKeyboardPresented"));
      -[SPUIRemoteSearchViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v20, "searchViewKeyboardPresentationStateDidChange");

    }
  }

}

- (void)setSource:(unint64_t)a3
{
  _QWORD v3[5];

  self->_source = a3;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SPUIRemoteSearchViewController_setSource___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v16__0__SPUIMutableSearchViewSceneSettings_8l;
  v3[4] = a3;
  -[SPUIRemoteSearchViewController updateSceneSettingsWithBlock:](self, "updateSceneSettingsWithBlock:", v3);
}

uint64_t __44__SPUIRemoteSearchViewController_setSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentationSource:", *(_QWORD *)(a1 + 32));
}

- (void)setRevealProgress:(double)a3
{
  id v4;
  _QWORD v5[5];

  self->_revealProgress = a3;
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__SPUIRemoteSearchViewController_setRevealProgress___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
  *(double *)&v5[4] = a3;
  objc_msgSend(v4, "updateSettingsWithBlock:", v5);

}

void __52__SPUIRemoteSearchViewController_setRevealProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setRevealProgress:", *(double *)(a1 + 32));

}

- (void)didInvalidateSceneWhenForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPUIRemoteSearchViewController;
  -[SPUISpotlightRemoteViewController didInvalidateSceneWhenForeground](&v3, sel_didInvalidateSceneWhenForeground);
  -[SPUIRemoteSearchViewController setSource:](self, "setSource:", -[SPUIRemoteSearchViewController source](self, "source"));
  -[SPUIRemoteSearchViewController updateIntent:](self, "updateIntent:", 1);
  -[SPUIRemoteSearchViewController updateIntent:](self, "updateIntent:", 2);
}

- (double)keyboardHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double result;
  char v11;

  -[SPUIRemoteSearchViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isContinuityDisplay") & 1) != 0)
  {

    return 0.0;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x24BDF6B18], "isInHardwareKeyboardMode");

    result = 0.0;
    if ((v11 & 1) == 0)
      return self->_keyboardHeight;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(void);
  NSObject *v7;
  objc_super v8;

  v3 = a3;
  kdebug_trace();
  -[SPUIRemoteSearchViewController willStartPresetingSpotlightHandler](self, "willStartPresetingSpotlightHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SPUIRemoteSearchViewController willStartPresetingSpotlightHandler](self, "willStartPresetingSpotlightHandler");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
  v8.receiver = self;
  v8.super_class = (Class)SPUIRemoteSearchViewController;
  -[SPUISpotlightRemoteViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  v7 = qword_253DC7800;
  if (!qword_253DC7800)
  {
    SPUIInitLogging();
    v7 = qword_253DC7800;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SPUIRemoteSearchViewController viewWillAppear:].cold.1(v7, self);
  -[SPUIRemoteSearchViewController updateIntent:](self, "updateIntent:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  -[SPUIRemoteSearchViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SPUIRemoteSearchViewController updateIntent:](self, "updateIntent:", 2);
  -[SPUIRemoteSearchViewController finishCompletionHandlerIfNeeded](self, "finishCompletionHandlerIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(void);
  objc_super v7;

  v3 = a3;
  -[SPUIRemoteSearchViewController willBeginDismissingSpotlightHandler](self, "willBeginDismissingSpotlightHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SPUIRemoteSearchViewController willBeginDismissingSpotlightHandler](self, "willBeginDismissingSpotlightHandler");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
  v7.receiver = self;
  v7.super_class = (Class)SPUIRemoteSearchViewController;
  -[SPUIRemoteSearchViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  -[SPUIRemoteSearchViewController updateIntent:](self, "updateIntent:", 3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v3 = a3;
  -[SPUIRemoteSearchViewController setRevealProgress:](self, "setRevealProgress:", 0.0);
  +[SPUISpotlightSceneManager sharedManager](SPUISpotlightSceneManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spendMoreTimeReleasingMemory");

  -[SPUIRemoteSearchViewController updateIntent:](self, "updateIntent:", 4);
  -[SPUIRemoteSearchViewController didFinishDismissingSpotlightHandler](self, "didFinishDismissingSpotlightHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPUIRemoteSearchViewController didFinishDismissingSpotlightHandler](self, "didFinishDismissingSpotlightHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
  if (-[SPUISpotlightRemoteViewController crashedWhileForeground](self, "crashedWhileForeground"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SPUIRemoteSearchViewController;
    -[SPUISpotlightRemoteViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
  }
}

- (void)updateIntent:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__SPUIRemoteSearchViewController_updateIntent___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v16__0__SPUIMutableSearchViewSceneSettings_8l;
  v3[4] = a3;
  -[SPUIRemoteSearchViewController updateSceneSettingsWithBlock:](self, "updateSceneSettingsWithBlock:", v3);
}

uint64_t __47__SPUIRemoteSearchViewController_updateIntent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentationIntent:", *(_QWORD *)(a1 + 32));
}

- (BOOL)prewarmSceneInTheBackground
{
  return 1;
}

- (void)updateSceneSettingsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke;
  v6[3] = &unk_24DA1D080;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SPUISpotlightRemoteViewController addOrExecuteEventAsNeeded:](self, "addOrExecuteEventAsNeeded:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke_2;
  v4[3] = &unk_24DA1D058;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "updateSettingsWithBlock:", v4);

}

void __63__SPUIRemoteSearchViewController_updateSceneSettingsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)sceneDidInvalidate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  -[SPUISpotlightRemoteViewController sceneDidInvalidate:](&v4, sel_sceneDidInvalidate_, a3);
  -[SPUIRemoteSearchViewController setSearchHeaderContextID:](self, "setSearchHeaderContextID:", 0);
  -[SPUIRemoteSearchViewController setSearchHeaderLayerRenderID:](self, "setSearchHeaderLayerRenderID:", 0);
}

- (void)finishCompletionHandlerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(void);
  void *v8;
  uint64_t v9;
  id v10;

  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SPUISpotlightRemoteViewController scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[SPUIRemoteSearchViewController finishedPresentingSpotlightHandler](self, "finishedPresentingSpotlightHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void (**)(void))v6;
    -[SPUISpotlightRemoteViewController scene](self, "scene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "contentState") != 2)
    {

      goto LABEL_9;
    }
    v9 = objc_msgSend(v10, "presentationIntent");

    if (v9 == 2)
    {
      -[SPUIRemoteSearchViewController finishedPresentingSpotlightHandler](self, "finishedPresentingSpotlightHandler");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();
LABEL_9:

    }
  }

}

- (void)sceneContentStateDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUIRemoteSearchViewController;
  -[SPUISpotlightRemoteViewController sceneContentStateDidChange:](&v4, sel_sceneContentStateDidChange_, a3);
  -[SPUIRemoteSearchViewController finishCompletionHandlerIfNeeded](self, "finishCompletionHandlerIfNeeded");
}

- (double)revealProgress
{
  return self->_revealProgress;
}

- (unint64_t)source
{
  return self->_source;
}

- (SPUIRemoteSearchViewDelegate)delegate
{
  return (SPUIRemoteSearchViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)distanceToTopOfIcons
{
  return self->_distanceToTopOfIcons;
}

- (void)setDistanceToTopOfIcons:(double)a3
{
  self->_distanceToTopOfIcons = a3;
}

- (unint64_t)searchHeaderLayerRenderID
{
  return self->_searchHeaderLayerRenderID;
}

- (void)setSearchHeaderLayerRenderID:(unint64_t)a3
{
  self->_searchHeaderLayerRenderID = a3;
}

- (unsigned)searchHeaderContextID
{
  return self->_searchHeaderContextID;
}

- (void)setSearchHeaderContextID:(unsigned int)a3
{
  self->_searchHeaderContextID = a3;
}

- (unint64_t)searchHeaderBackgroundLayerRenderID
{
  return self->_searchHeaderBackgroundLayerRenderID;
}

- (void)setSearchHeaderBackgroundLayerRenderID:(unint64_t)a3
{
  self->_searchHeaderBackgroundLayerRenderID = a3;
}

- (unsigned)searchHeaderBackgroundContextID
{
  return self->_searchHeaderBackgroundContextID;
}

- (void)setSearchHeaderBackgroundContextID:(unsigned int)a3
{
  self->_searchHeaderBackgroundContextID = a3;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (double)keyboardProtectorHeight
{
  return self->_keyboardProtectorHeight;
}

- (void)setKeyboardProtectorHeight:(double)a3
{
  self->_keyboardProtectorHeight = a3;
}

- (BOOL)isKeyboardPresented
{
  return self->_keyboardPresented;
}

- (void)setKeyboardPresented:(BOOL)a3
{
  self->_keyboardPresented = a3;
}

- (CGSize)searchBarSize
{
  double width;
  double height;
  CGSize result;

  width = self->_searchBarSize.width;
  height = self->_searchBarSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSearchBarSize:(CGSize)a3
{
  self->_searchBarSize = a3;
}

- (CGSize)dockedSearchBarSize
{
  double width;
  double height;
  CGSize result;

  width = self->_dockedSearchBarSize.width;
  height = self->_dockedSearchBarSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDockedSearchBarSize:(CGSize)a3
{
  self->_dockedSearchBarSize = a3;
}

- (double)searchBarCornerRadius
{
  return self->_searchBarCornerRadius;
}

- (void)setSearchBarCornerRadius:(double)a3
{
  self->_searchBarCornerRadius = a3;
}

- (unint64_t)searchHeaderBlurLayerRenderID
{
  return self->_searchHeaderBlurLayerRenderID;
}

- (void)setSearchHeaderBlurLayerRenderID:(unint64_t)a3
{
  self->_searchHeaderBlurLayerRenderID = a3;
}

- (unsigned)searchHeaderBlurContextID
{
  return self->_searchHeaderBlurContextID;
}

- (void)setSearchHeaderBlurContextID:(unsigned int)a3
{
  self->_searchHeaderBlurContextID = a3;
}

- (UIView)dummyTransitionView
{
  return self->_dummyTransitionView;
}

- (void)setDummyTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->_dummyTransitionView, a3);
}

- (id)willStartPresetingSpotlightHandler
{
  return self->_willStartPresetingSpotlightHandler;
}

- (void)setWillStartPresetingSpotlightHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (id)finishedPresentingSpotlightHandler
{
  return self->_finishedPresentingSpotlightHandler;
}

- (void)setFinishedPresentingSpotlightHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (id)willBeginDismissingSpotlightHandler
{
  return self->_willBeginDismissingSpotlightHandler;
}

- (void)setWillBeginDismissingSpotlightHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (id)didFinishDismissingSpotlightHandler
{
  return self->_didFinishDismissingSpotlightHandler;
}

- (void)setDidFinishDismissingSpotlightHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishDismissingSpotlightHandler, 0);
  objc_storeStrong(&self->_willBeginDismissingSpotlightHandler, 0);
  objc_storeStrong(&self->_finishedPresentingSpotlightHandler, 0);
  objc_storeStrong(&self->_willStartPresetingSpotlightHandler, 0);
  objc_storeStrong((id *)&self->_dummyTransitionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewWillAppear:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(a2, "keyboardHeight");
  *(float *)&v5 = v5;
  objc_msgSend(v3, "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v6;
  _os_log_debug_impl(&dword_218DEA000, v4, OS_LOG_TYPE_DEBUG, "Keyboard height %@", (uint8_t *)&v7, 0xCu);

}

@end
