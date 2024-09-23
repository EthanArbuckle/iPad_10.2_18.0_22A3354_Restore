@implementation PXFeedGadget

- (PXFeedGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedGadget.m"), 42, CFSTR("%s is not available as initializer"), "-[PXFeedGadget init]");

  abort();
}

- (PXFeedGadget)initWithConfiguration:(id)a3
{
  id v5;
  PXFeedGadget *v6;
  PXFeedGadget *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFeedGadget;
  v6 = -[PXFeedGadget init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (void)invalidatePreferredContentHeight
{
  id v3;

  -[PXFeedGadget delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadget:didChange:", self, 64);

}

- (PXFeedViewController)feedViewController
{
  PXFeedViewController *feedViewController;
  NSObject *v5;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  feedViewController = self->_feedViewController;
  if (!feedViewController)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%@ accessed before being loaded", (uint8_t *)&v8, 0xCu);

    }
    feedViewController = self->_feedViewController;
  }
  return feedViewController;
}

- (void)_loadFeedViewControllerIfNeeded
{
  PXFeedViewController *v4;
  void *v5;
  PXFeedViewController *v6;
  PXFeedViewController *feedViewController;
  _QWORD v8[6];

  if (!self->_feedViewController)
  {
    v4 = [PXFeedViewController alloc];
    -[PXFeedGadget configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXFeedViewController initWithConfiguration:](v4, "initWithConfiguration:", v5);
    feedViewController = self->_feedViewController;
    self->_feedViewController = v6;

    -[PXFeedViewController setFeedGadget:](self->_feedViewController, "setFeedGadget:", self);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PXFeedGadget__loadFeedViewControllerIfNeeded__block_invoke;
  v8[3] = &unk_1E5144EB8;
  v8[4] = self;
  v8[5] = a2;
  if (_loadFeedViewControllerIfNeeded_onceToken != -1)
    dispatch_once(&_loadFeedViewControllerIfNeeded_onceToken, v8);
}

- (PXFeedViewLayoutSpecManager)specManager
{
  PXFeedViewLayoutSpecManager *specManager;
  NSObject *v5;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  specManager = self->_specManager;
  if (!specManager)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%@ accessed before being loaded", (uint8_t *)&v8, 0xCu);

    }
    specManager = self->_specManager;
  }
  return specManager;
}

- (void)_loadSpecManagerIfNeeded
{
  PXFeedViewLayoutSpecManager *v3;
  PXFeedViewLayoutSpecManager *specManager;
  id v5;

  if (!self->_specManager)
  {
    -[PXFeedGadget configuration](self, "configuration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specManagerWithExtendedTraitCollection:", 0);
    v3 = (PXFeedViewLayoutSpecManager *)objc_claimAutoreleasedReturnValue();
    specManager = self->_specManager;
    self->_specManager = v3;

  }
}

- (PXProgrammaticNavigationParticipant)navigationParticipant
{
  void *v3;

  if (!self->_didLoadNavigationParticipant)
  {
    -[PXFeedGadget _loadFeedViewControllerIfNeeded](self, "_loadFeedViewControllerIfNeeded");
    -[PXFeedGadget feedViewController](self, "feedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE9B41A0))
      objc_storeStrong((id *)&self->_navigationParticipant, v3);
    self->_didLoadNavigationParticipant = 1;

  }
  return self->_navigationParticipant;
}

- (void)_navigateToFullFeedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  -[PXFeedGadget configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createSeeAllViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PXFeedGadget navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __62__PXFeedGadget__navigateToFullFeedAnimated_completionHandler___block_invoke;
      v11[3] = &unk_1E5148A40;
      v12 = v6;
      objc_msgSend(v9, "px_pushViewController:animated:completion:", v8, v4, v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("missing navigation controller"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("missing feed view controller"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
  }

}

- (UINavigationController)navigationController
{
  void *v3;
  void *v4;
  void *v5;

  -[PXFeedGadget delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadgetViewControllerHostingGadget:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationController *)v5;
}

- (void)setIsGadgetControllerActive:(BOOL)a3
{
  if (self->_isGadgetControllerActive != a3)
  {
    self->_isGadgetControllerActive = a3;
    -[PXFeedGadget _updateIsContentActive](self, "_updateIsContentActive");
  }
}

- (void)setIsContentVisible:(BOOL)a3
{
  if (self->_isContentVisible != a3)
  {
    self->_isContentVisible = a3;
    -[PXFeedGadget _updateIsContentActive](self, "_updateIsContentActive");
  }
}

- (void)_updateIsContentActive
{
  _BOOL8 v3;

  if (-[PXFeedGadget isGadgetControllerActive](self, "isGadgetControllerActive"))
    v3 = -[PXFeedGadget isContentVisible](self, "isContentVisible")
      || -[PXFeedGadget isContentActive](self, "isContentActive");
  else
    v3 = 0;
  -[PXFeedGadget setIsContentActive:](self, "setIsContentActive:", v3);
}

- (void)setIsContentActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_isContentActive != a3)
  {
    v3 = a3;
    self->_isContentActive = a3;
    -[PXFeedGadget configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "handleContentSeen");
    else
      objc_msgSend(v4, "handleContentDismissed");

  }
}

- (unint64_t)gadgetType
{
  void *v2;
  unint64_t v3;

  -[PXFeedGadget configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gadgetType");

  return v3;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (void)gadgetControllerHasAppeared
{
  -[PXFeedGadget setIsGadgetControllerActive:](self, "setIsGadgetControllerActive:", 1);
}

- (void)gadgetWasDismissed
{
  -[PXFeedGadget setIsGadgetControllerActive:](self, "setIsGadgetControllerActive:", 0);
}

- (void)contentViewWillAppear
{
  -[PXFeedGadget setIsContentVisible:](self, "setIsContentVisible:", 1);
}

- (void)contentViewDidDisappear
{
  -[PXFeedGadget setIsContentVisible:](self, "setIsContentVisible:", 0);
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  void *v6;
  BOOL v7;
  PXGadgetSpec *gadgetSpec;
  PXGadgetSpec *v9;

  v9 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = -[PXGadgetSpec isEqual:](v9, "isEqual:", v5);

  if (!v7)
  {
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    gadgetSpec = self->_gadgetSpec;
    -[PXFeedGadget configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGadgetSpec:", gadgetSpec);
LABEL_4:

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  PXFeedViewController *feedViewController;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXFeedGadget _loadSpecManagerIfNeeded](self, "_loadSpecManagerIfNeeded");
  feedViewController = self->_feedViewController;
  if (feedViewController)
  {
    -[PXFeedViewController sizeThatFits:](feedViewController, "sizeThatFits:", width, height);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *(double *)off_1E50B8810;
    v10 = *((double *)off_1E50B8810 + 1);
  }
  if (PXSizeIsNull())
  {
    -[PXFeedGadget specManager](self, "specManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "spec");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "gadgetSizeThatFits:", width, height);
    v14 = v13;
    v16 = v15;
    objc_msgSend(v12, "viewOutsets");
    v8 = v14 - (v17 + v18);
    v10 = v16 - (v19 + v20);

  }
  v21 = v8;
  v22 = v10;
  result.height = v22;
  result.width = v21;
  return result;
}

- (id)contentViewController
{
  -[PXFeedGadget _loadFeedViewControllerIfNeeded](self, "_loadFeedViewControllerIfNeeded");
  return -[PXFeedGadget feedViewController](self, "feedViewController");
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  -[PXFeedGadget configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadgetLocalizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)wantsMultilineTitle
{
  void *v2;
  char v3;

  -[PXFeedGadget configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsMultilineGadgetTitle");

  return v3;
}

- (unint64_t)headerStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXFeedGadget configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)accessoryButtonType
{
  void *v2;
  unint64_t v3;

  -[PXFeedGadget configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gadgetAccessoryButtonType");

  return v3;
}

- (NSString)accessoryButtonTitle
{
  void *v2;
  void *v3;

  -[PXFeedGadget configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadgetAccessoryButtonLocalizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)userDidSelectAccessoryButton:(id)a3
{
  -[PXFeedGadget _navigateToFullFeedAnimated:completionHandler:](self, "_navigateToFullFeedAnimated:completionHandler:", 1, &__block_literal_global_169060);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 10)
  {
    v5 = 1;
  }
  else
  {
    -[PXFeedGadget navigationParticipant](self, "navigationParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "routingOptionsForDestination:", v4);

  }
  return v5;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "type") == 10 || objc_msgSend(v9, "type") == 25 && objc_msgSend(v9, "revealMode") == 1)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__PXFeedGadget_navigateToDestination_options_completionHandler___block_invoke;
    v13[3] = &unk_1E51417E8;
    v14 = v10;
    -[PXFeedGadget _navigateToFullFeedAnimated:completionHandler:](self, "_navigateToFullFeedAnimated:completionHandler:", (a4 >> 1) & 1, v13);

  }
  else
  {
    -[PXFeedGadget navigationParticipant](self, "navigationParticipant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedGadget.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationParticipant != nil"));

    }
    objc_msgSend(v11, "navigateToDestination:options:completionHandler:", v9, a4, v10);

  }
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 10)
  {
    v5 = 0;
  }
  else
  {
    -[PXFeedGadget navigationParticipant](self, "navigationParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextExistingParticipantOnRouteToDestination:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  void *v2;
  void *v3;

  -[PXFeedGadget navigationParticipant](self, "navigationParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_navigationDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXProgrammaticNavigationDestination *)v3;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXFeedConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isGadgetControllerActive
{
  return self->_isGadgetControllerActive;
}

- (BOOL)isContentVisible
{
  return self->_isContentVisible;
}

- (BOOL)isContentActive
{
  return self->_isContentActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_navigationParticipant, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_feedViewController, 0);
}

uint64_t __64__PXFeedGadget_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 1;
  else
    v3 = 5;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __45__PXFeedGadget_userDidSelectAccessoryButton___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to navigate to full feed: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __62__PXFeedGadget__navigateToFullFeedAnimated_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__PXFeedGadget__loadFeedViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PXFeedGadget__loadFeedViewControllerIfNeeded__block_invoke_2;
  v3[3] = &unk_1E5144EB8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleTaskWithQoS:block:", 0, v3);

}

void __47__PXFeedGadget__loadFeedViewControllerIfNeeded__block_invoke_2()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  +[PXStoryAutoEditConfigurationFactory autoEditConfiguration](PXStoryAutoEditConfigurationFactory, "autoEditConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    PXAssertGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v2 = 0;
      _os_log_error_impl(&dword_1A6789000, v1, OS_LOG_TYPE_ERROR, "Unable to prewarm autoedit config", v2, 2u);
    }

  }
}

@end
