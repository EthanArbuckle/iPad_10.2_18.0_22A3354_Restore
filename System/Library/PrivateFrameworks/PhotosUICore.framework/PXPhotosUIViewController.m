@implementation PXPhotosUIViewController

- (void)swift_configureDismissalInteractionController:(id)a3
{
  void (*v5)(PXPhotosUIViewController *, _UNKNOWN **);
  id v6;
  PXPhotosUIViewController *v7;

  v5 = *(void (**)(PXPhotosUIViewController *, _UNKNOWN **))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a3) + 0x178);
  v7 = self;
  v6 = a3;
  v5(self, &off_1E510AC08);

}

- (void)swift_viewDidLoad
{
  PXPhotosUIViewController *v2;
  uint64_t v3;
  PXPhotosViewModel *v4;

  v2 = self;
  v4 = -[PXPhotosUIViewController viewModel](v2, sel_viewModel);
  v3 = swift_unknownObjectRetain();
  sub_1A6963F7C(v3, (uint64_t)&off_1E510AC18);

}

- (void)swift_handleViewModelChange:(unint64_t)a3
{
  PXPhotosUIViewController *v4;

  v4 = self;
  sub_1A70B9C64(a3);

}

- (void)swift_specDidChange
{
  PXPhotosUIViewController *v2;

  v2 = self;
  sub_1A70BA04C();

}

- (BOOL)swift_updateScrollViewControllerForScrollDetentsProvider
{
  PXPhotosUIViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1A70BA32C();

  return v3 & 1;
}

- (BOOL)swift_scrollViewControllerShouldScrollToTop:(id)a3
{
  PXPhotosUIViewController *v4;
  PXPhotosUIViewController *v5;
  PXPhotosViewModel *v6;
  uint64_t v7;
  PXPhotosContentController *v8;

  v4 = (PXPhotosUIViewController *)a3;
  v5 = self;
  v6 = -[PXPhotosUIViewController viewModel](v5, sel_viewModel);
  v7 = PXPhotosViewModel.scrollDetentsProvider.getter();

  swift_unknownObjectRelease();
  if (v7)
  {
    v8 = -[PXPhotosUIViewController contentController](v5, sel_contentController);
    -[PXPhotosContentController scrollToInitialPositionAnimated:withCompletionHandler:](v8, sel_scrollToInitialPositionAnimated_withCompletionHandler_, 1, 0);

    v4 = v5;
    v5 = (PXPhotosUIViewController *)v8;
  }

  return v7 == 0;
}

- (id)representedItem
{
  PXPhotosUIViewController *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _OWORD v11[2];
  _QWORD v12[3];
  uint64_t v13;

  v2 = self;
  if (-[PXPhotosUIViewController explicitRepresentedItem](v2, sel_explicitRepresentedItem))
  {
    sub_1A7AE46D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_1A689FDC0((uint64_t)v11, (uint64_t)v12);

  v3 = v13;
  if (!v13)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v5 + 16))(v8, v6);
  v9 = (void *)sub_1A7AE4D9C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v9;
}

- (BOOL)shouldBeginScrollingContentWithPanAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 velocity:(CGPoint)a5
{
  double y;
  double v7;
  double x;
  PXPhotosUIViewController *v10;
  PXPhotosViewModel *v11;
  unsigned int v12;
  id v14;
  BOOL v15;

  y = a5.y;
  v7 = a3.y;
  x = a3.x;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = -[PXPhotosUIViewController viewModel](v10, sel_viewModel);
  v12 = -[PXPhotosViewModel isScrollDisabledForAxis:](v11, sel_isScrollDisabledForAxis_, 1);

  if (v12)
  {
    swift_unknownObjectRelease();

    return 0;
  }
  if (y > 0.0
    && (v14 = -[PXPhotosUIViewController presentingViewController](v10, sel_presentingViewController),
        v14,
        v14))
  {
    v15 = sub_1A70BAE44((uint64_t)a4, x, v7);
    swift_unknownObjectRelease();

    if (v15)
      return 0;
  }
  else
  {
    swift_unknownObjectRelease();

  }
  return 1;
}

- (id)createSearchOverlayController
{
  PXPhotosUIViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1A70BB54C();

  return v3;
}

- (PXPhotosUIViewController)initWithConfiguration:(id)a3
{
  id v4;
  PXPhotosUIViewController *v5;
  uint64_t v6;
  PXPhotosViewConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosUIViewController;
  v5 = -[PXPhotosUIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (PXPhotosViewConfiguration *)v6;

    -[PXPhotosViewConfiguration setIsEmbedded:](v5->_configuration, "setIsEmbedded:", 0);
  }

  return v5;
}

- (PXPhotosUIViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosUIViewController.m"), 224, CFSTR("%s is not available as initializer"), "-[PXPhotosUIViewController initWithCoder:]");

  abort();
}

- (PXPhotosUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosUIViewController.m"), 228, CFSTR("%s is not available as initializer"), "-[PXPhotosUIViewController initWithNibName:bundle:]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  PXUnregisterPreferencesObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;

  -[PXPhotosUIViewController contentControllerIfLoaded](self, "contentControllerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "currentDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("containerCollection=%@"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("not loaded");
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@:%p; %@>"), v12, self, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (PXPhotosContentController)contentController
{
  PXPhotosContentController *contentController;
  void *v6;

  contentController = self->_contentController;
  if (!contentController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosUIViewController.m"), 248, CFSTR("Content controller should not be accessed before viewDidLoad"));

    contentController = self->_contentController;
  }
  return contentController;
}

- (PXPhotosContentController)contentControllerIfLoaded
{
  return self->_contentController;
}

- (PXPhotosViewModel)viewModelIfLoaded
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController contentControllerIfLoaded](self, "contentControllerIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPhotosViewModel *)v3;
}

- (PXPhotosViewModel)viewModel
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPhotosViewModel *)v3;
}

- (PXGView)gridView
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGView *)v3;
}

- (id)currentDataSource
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PXPhotosUIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXPhotosUIViewController contentController](self, "contentController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentDataSource");
  }
  else
  {
    -[PXPhotosUIViewController configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXPhotosViewEventTracker)eventTracker
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPhotosViewEventTracker *)v3;
}

- (id)scrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPhotosUIViewController gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PXPhotosViewUIInteraction)interaction
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPhotosViewUIInteraction *)v3;
}

- (NSString)toolbarBackdropGroupName
{
  NSString *toolbarBackdropGroupName;
  NSString *v4;
  NSString *v5;

  toolbarBackdropGroupName = self->_toolbarBackdropGroupName;
  if (!toolbarBackdropGroupName)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PhotosToolbar-%p"), self);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_toolbarBackdropGroupName;
    self->_toolbarBackdropGroupName = v4;

    toolbarBackdropGroupName = self->_toolbarBackdropGroupName;
  }
  return toolbarBackdropGroupName;
}

- (PXPhotosFilterToggleButtonController)filterButtonController
{
  PXPhotosFilterToggleButtonController *filterButtonController;
  void *v4;
  void *v5;
  void *v6;
  PXPhotosFilterToggleButtonController *v7;
  void *v8;
  PXPhotosFilterToggleButtonController *v9;
  PXPhotosFilterToggleButtonController *v10;

  filterButtonController = self->_filterButtonController;
  if (!filterButtonController)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "photosViewRoundedAccessoryConfigurationWithSymbolName:", CFSTR("line.3.horizontal.decrease"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController toolbarBackdropGroupName](self, "toolbarBackdropGroupName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setVisualEffectGroupName:", v5);

    v7 = [PXPhotosFilterToggleButtonController alloc];
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXPhotosFilterToggleButtonController initWithViewModel:buttonConfiguration:](v7, "initWithViewModel:buttonConfiguration:", v8, v4);
    v10 = self->_filterButtonController;
    self->_filterButtonController = v9;

    filterButtonController = self->_filterButtonController;
  }
  return filterButtonController;
}

- (PXPhotosStatusToggleButtonController)statusButtonController
{
  PXPhotosStatusToggleButtonController *statusButtonController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotosStatusToggleButtonController *v9;
  PXPhotosStatusToggleButtonController *v10;

  statusButtonController = self->_statusButtonController;
  if (!statusButtonController)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footerViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_opt_class();
    -[PXPhotosUIViewController toolbarBackdropGroupName](self, "toolbarBackdropGroupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_roundedButtonConfigurationWithSymbolName:inset:fontSize:weight:groupName:", CFSTR("info"), 7, v7, 7.0, 14.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[PXPhotosStatusToggleButtonController initWithFooterViewModel:buttonConfiguration:]([PXPhotosStatusToggleButtonController alloc], "initWithFooterViewModel:buttonConfiguration:", v5, v8);
    v10 = self->_statusButtonController;
    self->_statusButtonController = v9;

    -[PXPhotosStatusToggleButtonController setDelegate:](self->_statusButtonController, "setDelegate:", self);
    statusButtonController = self->_statusButtonController;
  }
  return statusButtonController;
}

- (PXPhotosCloseButtonController)closeButtonController
{
  PXPhotosCloseButtonController *closeButtonController;
  void *v4;
  void *v5;
  void *v6;
  PXPhotosCloseButtonController *v7;
  PXPhotosCloseButtonController *v8;

  closeButtonController = self->_closeButtonController;
  if (!closeButtonController)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "photosViewRoundedAccessoryConfigurationWithSymbolName:", CFSTR("xmark"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController toolbarBackdropGroupName](self, "toolbarBackdropGroupName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setVisualEffectGroupName:", v5);

    v7 = -[PXPhotosCloseButtonController initWithButtonConfiguration:]([PXPhotosCloseButtonController alloc], "initWithButtonConfiguration:", v4);
    v8 = self->_closeButtonController;
    self->_closeButtonController = v7;

    -[PXPhotosCloseButtonController setDelegate:](self->_closeButtonController, "setDelegate:", self);
    closeButtonController = self->_closeButtonController;
  }
  return closeButtonController;
}

- (void)setAlternateContentView:(id)a3
{
  UIView *v5;
  UIView **p_alternateContentView;
  UIView *alternateContentView;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  _QWORD v12[4];
  BOOL v13;

  v5 = (UIView *)a3;
  p_alternateContentView = &self->_alternateContentView;
  alternateContentView = self->_alternateContentView;
  if (alternateContentView != v5)
  {
    -[UIView removeFromSuperview](alternateContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_alternateContentView, a3);
    -[PXPhotosUIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[UIView setFrame:](*p_alternateContentView, "setFrame:");
    -[UIView setAutoresizingMask:](*p_alternateContentView, "setAutoresizingMask:", 18);
    -[PXPhotosUIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", *p_alternateContentView);

    -[PXPhotosUIViewController _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
    v10 = *p_alternateContentView != 0;
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__PXPhotosUIViewController_setAlternateContentView___block_invoke;
    v12[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v13 = v10;
    objc_msgSend(v11, "performChanges:", v12);

  }
}

- (void)_requestFocusUpdateWithAssetReference:(id)a3
{
  id v4;

  -[PXPhotosUIViewController setPreferredFocusAssetReference:](self, "setPreferredFocusAssetReference:", a3);
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFocusUpdateToEnvironment:", self);

}

- (void)_updateEmptyBehaviorIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSections"))
  {
    if ((objc_msgSend(v3, "containsAnyItems") & 1) == 0)
    {
      -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopAnimated:", 1);

      -[PXPhotosUIViewController viewModel](self, "viewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "allowsPopOnEmptyBehavior");

      if (v6)
      {
        -[PXPhotosUIViewController navigationController](self, "navigationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v7, "px_popToViewControllerPrecedingViewController:animated:", self, 1);

        goto LABEL_11;
      }
    }
LABEL_10:
    -[PXPhotosUIViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
    goto LABEL_11;
  }
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsPopOnContainerDeleteBehavior");

  if (v10)
  {
    -[PXPhotosUIViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "px_popToViewControllerPrecedingViewController:animated:", self, 1);

  }
  if (objc_msgSend(v14, "viewDelegateRespondsTo:", 4))
  {
    objc_msgSend(v14, "viewDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerWasDeletedForPhotosViewController:", self);

  }
  if ((v10 & 1) == 0)
    goto LABEL_10;
LABEL_11:

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXStatusController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PXStatusController *placeholderStatusController;
  PXPhotosGridPlaceholderStatusController *fallbackPlaceholderStatusController;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *emptyPlaceholderDragController;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PXPhotosDragController *v41;
  PXPhotosDragController *v42;
  void *v43;
  PXPhotosDragController *v44;
  _QWORD v45[4];
  id v46;
  id location;

  v4 = a3;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXPhotosUIViewController isViewLoaded](self, "isViewLoaded")
    || !objc_msgSend(v5, "allowsEmptyPlaceholderBehavior"))
  {
    goto LABEL_21;
  }
  v6 = objc_msgSend(v5, "emptyPlaceholderState");
  objc_msgSend(v5, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v6)
  {
    case 3:
      objc_msgSend(v5, "emptyPlaceholderStatusViewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[PXPhotosUIViewController placeholderStatusController](self, "placeholderStatusController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosUIViewController placeholderStatusController](self, "placeholderStatusController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = objc_alloc_init(PXStatusController);

          objc_msgSend(v5, "emptyPlaceholderStatusViewModel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXStatusController setViewModel:](v16, "setViewModel:", v17);

          -[PXStatusController setDelegate:](v16, "setDelegate:", self);
          -[PXPhotosUIViewController setPlaceholderStatusController:](self, "setPlaceholderStatusController:", v16);
          v14 = v16;
        }
        objc_msgSend(v14, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PXPhotosUIViewController fallbackPlaceholderStatusController](self, "fallbackPlaceholderStatusController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          _FallbackPlaceholderStatusControllerForViewModel(v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPhotosUIViewController setFallbackPlaceholderStatusController:](self, "setFallbackPlaceholderStatusController:", v14);
          objc_msgSend(v14, "statusController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setDelegate:", self);

        }
        objc_msgSend(v14, "statusController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3698], "loadingConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedLoadingInitialDataSourceMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v18);

      v19 = objc_msgSend(v7, "isLoadingInitialDataSource");
      goto LABEL_18;
    case 1:
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E0DC3428];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __77__PXPhotosUIViewController__updateContentUnavailableConfigurationUsingState___block_invoke;
      v45[3] = &unk_1E5147F40;
      objc_copyWeak(&v46, &location);
      objc_msgSend(v8, "actionWithHandler:", v45);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosUIViewController privacyController](self, "privacyController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "authenticationType");

      PXContentLockedPlaceholderConfiguration(1, v11, objc_msgSend(v5, "wantsContentUnavailableUnlockButtonVisible"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
      break;
    default:
      placeholderStatusController = self->_placeholderStatusController;
      self->_placeholderStatusController = 0;

      fallbackPlaceholderStatusController = self->_fallbackPlaceholderStatusController;
      self->_fallbackPlaceholderStatusController = 0;

      v19 = 0;
      v12 = 0;
      goto LABEL_18;
  }
  v19 = 0;
LABEL_18:
  -[PXPhotosUIViewController setShowingInitialLoadPlaceholder:](self, "setShowingInitialLoadPlaceholder:", v19);

  if (!v12)
  {
LABEL_21:
    objc_msgSend(0, "updatedConfigurationForState:", v4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v43);

    -[PXPhotosUIViewController invalidateHeaderView](self, "invalidateHeaderView");
    v12 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v5, "specManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "spec");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "placeholderFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textProperties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v26);

  objc_msgSend(v25, "placeholderFontColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setColor:", v28);

  objc_msgSend(v25, "contentUnavailablePlaceholderDirectionalLayoutMargins");
  objc_msgSend(v12, "setDirectionalLayoutMargins:");
  v30 = objc_msgSend(v25, "contentUnavailablePlaceholderDisablesVerticalBounce") ^ 1;
  -[PXPhotosUIViewController gridView](self, "gridView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "scrollViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAlwaysBounceVertical:", v30);

  objc_msgSend(v12, "updatedConfigurationForState:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v33);

  -[PXPhotosUIViewController invalidateHeaderView](self, "invalidateHeaderView");
  -[PXPhotosUIViewController configuration](self, "configuration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = objc_msgSend(v34, "allowsDragIn");

  if (!(_DWORD)v30)
  {
LABEL_22:
    emptyPlaceholderDragController = self->_emptyPlaceholderDragController;
    self->_emptyPlaceholderDragController = 0;
    goto LABEL_23;
  }
  v44 = [PXPhotosDragController alloc];
  -[PXPhotosUIViewController view](self, "view");
  emptyPlaceholderDragController = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "selectionManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "assetCollectionActionManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController interaction](self, "interaction");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PXPhotosDragController initWithContentView:selectionManager:assetCollectionActionManager:delegate:](v44, "initWithContentView:selectionManager:assetCollectionActionManager:delegate:", emptyPlaceholderDragController, v37, v39, v40);
  v42 = self->_emptyPlaceholderDragController;
  self->_emptyPlaceholderDragController = v41;

LABEL_23:
}

- (void)_updateUIFromViewModelPrivacyState
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contentPrivacyState");

  PLContentPrivacyUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v7 = v6;
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "View Controller: Content should be obscured: %{public}@", (uint8_t *)&v12, 0xCu);

  }
  -[PXPhotosUIViewController gridView](self, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentShouldBeObscured:", v4 != 0);
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4 && objc_msgSend(v9, "isContextMenuInteractionActive"))
  {
    objc_msgSend(v10, "contextMenuInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissMenu");

  }
  -[PXPhotosUIViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");

}

- (void)_updateSubviewsOrdering
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosUIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController gridView](self, "gridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendSubviewToBack:", v3);

  -[PXPhotosUIViewController alternateContentView](self, "alternateContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v4);

}

- (void)_updateBackButtonBehavior
{
  void *v3;
  void *v4;
  PXPhotosUIViewController *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v16;
  _BOOL8 v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  id v22;

  -[UIViewController px_splitViewController](self, "px_splitViewController");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (PXPhotosUIViewController *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v7 = 0;
  }
  else
  {
    -[PXPhotosUIViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hidesBackButton") ^ 1;

  }
  if ((objc_msgSend(v22, "isSidebarVisible") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v22, "splitBehavior") == 1 || objc_msgSend(v22, "splitBehavior") == 2;
  v9 = objc_msgSend(v22, "displayMode");
  -[PXPhotosUIViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftBarButtonItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[PXPhotosUIViewController contentController](self, "contentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v9 != 3 && v12 == 0;
  v17 = ((v7 | v8) & 1) == 0 && v16;
  objc_msgSend(v14, "setWantsHeaderInSafeArea:", v17);
  v18 = objc_msgSend(v22, "splitBehavior");
  v19 = v9 == 3 || v8;
  if (v19 == 1)
  {
    if (v18 == 2)
      v20 = v7 ^ 1;
    else
      v20 = 0;
    if (objc_msgSend(v22, "splitBehavior") == 1)
      v21 = 1;
    else
      v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v14, "setAlignsHeaderTitleWithLayoutMargins:", v21);

}

- (void)_updateDrawerButtonVisibility
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[UIViewController px_splitViewController](self, "px_splitViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController viewModelIfLoaded](self, "viewModelIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "gridStyle");
  if (v10 && (v4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if ((objc_msgSend(v10, "displayMode") & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v5 = objc_msgSend(v10, "isCollapsed") ^ 1;
    else
      v5 = 0;
    -[PXPhotosUIViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = 0;
    else
      v7 = v5;
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setWantsToggleSidebarButton:", v7);
    objc_msgSend(v9, "setShouldMakeSpaceForToggleSidebarButton:", v5);

  }
}

- (void)setShowingInitialLoadPlaceholder:(BOOL)a3
{
  if (self->_showingInitialLoadPlaceholder != a3)
  {
    self->_showingInitialLoadPlaceholder = a3;
    if (!a3)
    {
      -[PXPhotosUIViewController setHasScrolledToInitialPosition:](self, "setHasScrolledToInitialPosition:", 0);
      -[PXPhotosUIViewController _scrollToInitialPositionIfNecessary](self, "_scrollToInitialPositionIfNecessary");
    }
  }
}

- (void)invalidateHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "viewDelegateRespondsTo:", 2))
  {
    -[PXPhotosUIViewController contentController](self, "contentController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosUIViewController _contentUnavailableConfiguration](self, "_contentUnavailableConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v13, "viewDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "headerViewForPhotosViewController:", self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v13, "viewDelegateRespondsTo:", 0x8000))
    {
      objc_msgSend(v13, "viewDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "shouldAnimateFromHeaderView:toHeaderView:", v4, v6);

    }
    else
    {
      v9 = 0;
    }
    -[PXPhotosUIViewController contentController](self, "contentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHeaderView:animated:", v6, v9);

    -[PXPhotosUIViewController contentController](self, "contentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXPhotosViewNoteHeaderViewSizeDidChange(v12);

  }
}

- (double)visibleHeightForNumberOfPhotosRows:(double)a3
{
  double v5;
  double v6;

  v5 = 0.0;
  v6 = 0.0;
  -[PXPhotosUIViewController _getPhotosRowHeight:spacing:](self, "_getPhotosRowHeight:spacing:", &v6, &v5);
  return -(v5 - a3 * (v6 + v5));
}

- (double)numberOfPhotosRowsForVisibleHeight:(double)a3
{
  double v5;
  double v6;

  v5 = 0.0;
  v6 = 0.0;
  -[PXPhotosUIViewController _getPhotosRowHeight:spacing:](self, "_getPhotosRowHeight:spacing:", &v6, &v5);
  return (v5 + a3) / (v5 + v6);
}

- (void)_getPhotosRowHeight:(double *)a3 spacing:(double *)a4
{
  void *v7;
  _PXPhotosEstimatedExtendedTraitCollection *v8;
  PXZoomablePhotosLayoutSpec *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PXZoomablePhotosLayoutSpec *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  -[PXPhotosUIViewController configuration](self, "configuration");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "layoutSizeClass"))
  {
    v8 = -[_PXPhotosEstimatedExtendedTraitCollection initWithViewController:]([_PXPhotosEstimatedExtendedTraitCollection alloc], "initWithViewController:", self);

    v7 = v8;
  }
  v9 = [PXZoomablePhotosLayoutSpec alloc];
  v10 = objc_msgSend(v26, "gridStyle");
  objc_msgSend(v26, "itemAspectRatio");
  v12 = v11;
  objc_msgSend(v26, "customUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "additionalAspectFitEdgeMargins");
  v19 = -[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:](v9, "initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:", v7, 0, 0, v10, v13, 0, v12, v15, v16, v17, v18, 0, 0);

  v20 = -[PXZoomablePhotosLayoutSpec initialNumberOfColumns](v19, "initialNumberOfColumns");
  -[PXZoomablePhotosLayoutSpec interitemSpacing](v19, "interitemSpacing");
  v22 = v21;
  -[PXFeatureSpec layoutReferenceSize](v19, "layoutReferenceSize");
  v24 = v23;
  -[PXZoomablePhotosLayoutSpec itemAspectRatio](v19, "itemAspectRatio");
  if (a3)
    *a3 = round(((v22 + v24) / (double)v20 - v22) / v25);
  if (a4)
    *a4 = v22;

}

- (double)collapsibleFooterHeight
{
  void *v2;
  double v3;
  double v4;

  -[PXPhotosUIViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapsibleFooterHeight");
  v4 = v3;

  return v4;
}

- (double)secondaryToolbarHeight
{
  void *v2;
  double v3;
  double v4;

  -[PXPhotosUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (objc_msgSend(v2, "isSecondaryToolbarVisible"))
  {
    objc_msgSend(v2, "containerViewAdditionalEdgeInsets");
    v3 = v4;
  }

  return v3;
}

- (void)setSecondaryToolbarAlpha:(double)a3
{
  if (self->_secondaryToolbarAlpha != a3)
  {
    self->_secondaryToolbarAlpha = a3;
    -[PXPhotosUIViewController _invalidateSecondaryToolbarOpacity](self, "_invalidateSecondaryToolbarOpacity");
  }
}

- (void)_presentOneUpForSingleSelectedAssetWithActivity:(unint64_t)a3
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isInSelectMode");
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v9, "singleSelectedAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PXPhotosUIViewController interaction](self, "interaction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __76__PXPhotosUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke;
      v10[3] = &__block_descriptor_40_e44_v16__0___PXOneUpPresentationConfiguration__8l;
      v10[4] = a3;
      objc_msgSend(v8, "presentOneUpForAssetReference:configurationHandler:", v7, v10);

    }
    v6 = v9;
  }

}

- (void)_dismissOnInternalRequest
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dismissRequested");

  if ((v4 & 1) != 0)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performChanges:", &__block_literal_global_200466);

    -[PXPhotosUIViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "px_popToViewControllerPrecedingViewController:animated:", self, 1);

    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performChanges:", &__block_literal_global_178_200467);

  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Photos grid internal dismiss attempted without being requested", buf, 2u);
    }

  }
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  return -[PXPhotosUIViewController regionOfInterestForAssetReference:image:shouldSnapshotPlaceholder:](self, "regionOfInterestForAssetReference:image:shouldSnapshotPlaceholder:", a3, 0, 1);
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4
{
  return -[PXPhotosUIViewController regionOfInterestForAssetReference:image:shouldSnapshotPlaceholder:](self, "regionOfInterestForAssetReference:image:shouldSnapshotPlaceholder:", a3, a4, 1);
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 shouldSnapshotPlaceholder:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  -[PXPhotosUIViewController interaction](self, "interaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "regionOfInterestForAssetReference:image:fallbackMediaProvider:shouldSnapshot:", v8, a4, 0, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)scrollToRevealAssetReference:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXPhotosUIViewController contentController](self, "contentController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollToRevealAssetReference:completionHandler:", v7, v6);

}

- (void)scrollToCenterAssetReference:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXPhotosUIViewController contentController](self, "contentController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollToRevealAssetReference:scrollPosition:padding:completionHandler:", v7, 18, v6, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));

}

- (void)setHiddenAssetReferences:(id)a3
{
  -[PXPhotosUIViewController setHiddenAssetReferences:animationType:](self, "setHiddenAssetReferences:animationType:", a3, 0);
}

- (void)setHiddenAssetReferences:(id)a3 animationType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[PXPhotosUIViewController contentController](self, "contentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPendingHideAnimationType:", a4);

  -[PXPhotosUIViewController interaction](self, "interaction");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHiddenAssetReferences:", v6);

}

- (NSSet)hiddenAssetReferences
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hiddenAssetReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setHidesNavbar:(BOOL)a3
{
  int v3;
  void *v4;
  _QWORD v5[4];
  char v6;

  v3 = a3;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hidesNavbar") != v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__PXPhotosUIViewController_setHidesNavbar___block_invoke;
    v5[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v6 = v3;
    objc_msgSend(v4, "performChanges:", v5);
  }

}

- (BOOL)hidesNavbar
{
  void *v2;
  char v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesNavbar");

  return v3;
}

- (void)setHidesToolbar:(BOOL)a3
{
  int v3;
  void *v4;
  _QWORD v5[4];
  char v6;

  v3 = a3;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hidesToolbar") != v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__PXPhotosUIViewController_setHidesToolbar___block_invoke;
    v5[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v6 = v3;
    objc_msgSend(v4, "performChanges:", v5);
  }

}

- (BOOL)hidesToolbar
{
  void *v2;
  char v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesToolbar");

  return v3;
}

- (void)setShouldAlwaysRespectToolbarActionPlacementPreference:(BOOL)a3
{
  int v3;
  void *v4;
  _QWORD v5[4];
  char v6;

  v3 = a3;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldAlwaysRespectToolbarActionPlacementPreference") != v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__PXPhotosUIViewController_setShouldAlwaysRespectToolbarActionPlacementPreference___block_invoke;
    v5[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v6 = v3;
    objc_msgSend(v4, "performChanges:", v5);
  }

}

- (BOOL)shouldAlwaysRespectToolbarActionPlacementPreference
{
  void *v2;
  char v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAlwaysRespectToolbarActionPlacementPreference");

  return v3;
}

- (BOOL)isScrolledToTop
{
  void *v2;
  char v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrolledToTop");

  return v3;
}

- (PXAssetReference)assetReferenceForCurrentScrollPosition
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetReferenceForCurrentScrollPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetReference *)v3;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextMenuInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIContextMenuInteraction *)v3;
}

- (void)ensureSwipeDismissalInteraction
{
  id v2;

  -[PXPhotosUIViewController interaction](self, "interaction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ensureSwipeDismissalInteraction");

}

- (UIViewControllerInteractiveTransitioning)edgeSwipeDismissalInteraction
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "edgeSwipeDismissalInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewControllerInteractiveTransitioning *)v3;
}

- (void)setPlacementOverride:(id)a3
{
  PXGItemPlacement *v5;
  PXGItemPlacement *v6;

  v5 = (PXGItemPlacement *)a3;
  if (self->_placementOverride != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placementOverride, a3);
    -[PXPhotosUIViewController _updateBackgroundColorOverride](self, "_updateBackgroundColorOverride");
    v5 = v6;
  }

}

- (void)_updateBackgroundColorOverride
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PXPhotosUIViewController placementOverride](self, "placementOverride");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController backgroundColorBeforeOverride](self, "backgroundColorBeforeOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (!v11 || v3)
  {
    if (!v11)
    {
      if (v3)
      {
        v6 = v3;
        -[PXPhotosUIViewController setBackgroundColorBeforeOverride:](self, "setBackgroundColorBeforeOverride:", 0);
        v3 = v6;
      }
      else
      {
        -[PXPhotosUIViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "backgroundColor");
        v6 = (id)objc_claimAutoreleasedReturnValue();

        v3 = 0;
      }
      v7 = v6;
      goto LABEL_6;
    }
  }
  else
  {
    -[PXPhotosUIViewController gridView](self, "gridView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosUIViewController setBackgroundColorBeforeOverride:](self, "setBackgroundColorBeforeOverride:", v3);
    v4 = v11;
  }
  objc_msgSend(v4, "chromeAlpha");
  objc_msgSend(v3, "colorWithAlphaComponent:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  -[PXPhotosUIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  if (v11)
  -[PXPhotosUIViewController gridView](self, "gridView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v6);

}

- (void)loadView
{
  _PXPhotosGridContainerUIView *v3;
  _PXPhotosGridContainerUIView *v4;

  v3 = [_PXPhotosGridContainerUIView alloc];
  v4 = -[_PXPhotosGridContainerUIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_PXPhotosGridContainerUIView setDelegate:](v4, "setDelegate:", self);
  -[PXPhotosUIViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  PXPhotosContentController *v7;
  void *v8;
  PXPhotosContentController *v9;
  PXPhotosContentController *contentController;
  void *v11;
  PXContentPrivacyController *v12;
  PXContentPrivacyController *privacyController;
  PXContentPrivacyController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PXPhotosBarsController *v25;
  PXPhotosBarsController *barsController;
  PXAssetSelectionUserActivityController *v27;
  void *v28;
  PXAssetSelectionUserActivityController *v29;
  PXAssetSelectionUserActivityController *userActivityController;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  UIView *v60;
  UIView *fullscreenOverlay;
  PXUpdater *v62;
  PXUpdater *updater;
  id *v64;
  id *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id location;
  objc_super v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v80.receiver = self;
  v80.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewDidLoad](&v80, sel_viewDidLoad);
  -[PXPhotosUIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController containerViewController](self, "containerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    -[UIViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
  }
  else
  {
    -[PXPhotosUIViewController containerViewController](self, "containerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController px_enableOneUpPresentationFromViewController:](self, "px_enableOneUpPresentationFromViewController:", v6);

  }
  -[UIViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [PXPhotosContentController alloc];
  -[PXPhotosUIViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPhotosContentController initWithConfiguration:traitCollection:](v7, "initWithConfiguration:traitCollection:", v8, v67);
  contentController = self->_contentController;
  self->_contentController = v9;

  -[PXPhotosContentController setDelegate:](self->_contentController, "setDelegate:", self);
  -[PXPhotosUIViewController configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privacyController");
  v12 = (PXContentPrivacyController *)objc_claimAutoreleasedReturnValue();
  privacyController = self->_privacyController;
  self->_privacyController = v12;

  v14 = self->_privacyController;
  if (v14 && -[PXContentPrivacyController isLocked](v14, "isLocked"))
    -[PXPhotosUIViewController setShouldScrollToInitialPositionAfterUnlock:](self, "setShouldScrollToInitialPositionAfterUnlock:", 1);
  if (-[PXPhotosUIViewController shouldUseSystemSwipeToDismiss](self, "shouldUseSystemSwipeToDismiss"))
  {
    self->_allowedInteractiveDismissBehaviors = 0;
  }
  else
  {
    -[PXPhotosUIViewController configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_allowedInteractiveDismissBehaviors = objc_msgSend(v15, "allowedInteractiveDismissBehaviors");

  }
  -[PXPhotosUIViewController _updateOneUpPresentationInteraction](self, "_updateOneUpPresentationInteraction");
  -[PXPhotosUIViewController interaction](self, "interaction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUiInteractionDelegate:", self);

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerChangeObserver:context:", self, ViewModelObserverContext_200319);
  objc_msgSend(v17, "currentDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "containerCollection");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v68, "px_isHiddenSmartAlbum"))
    PXRegisterPreferencesObserver(self);
  if (objc_msgSend(v68, "px_isRecentlyDeletedSmartAlbum"))
    +[PXTipsAppDonation donateSignalForEvent:](PXTipsAppDonation, "donateSignalForEvent:", 1);
  if (objc_msgSend(v68, "px_isRecoveredSmartAlbum"))
  {
    v19 = v68;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    objc_msgSend(v20, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_assetsRecoveryCountsManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "markAsRead");
  }
  objc_msgSend(v17, "specManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerChangeObserver:context:", self, SpecManagerObserverContext_200321);

  if (objc_msgSend(v17, "decorationViewClass"))
    objc_msgSend(v17, "performChanges:", &__block_literal_global_186_200445);
  objc_msgSend(v17, "performChanges:", &__block_literal_global_187_200446);
  -[PXPhotosUIViewController configuration](self, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "allowedBehaviors") & 1) != 0)
  {
    -[UIViewController px_enableBarAppearance](self, "px_enableBarAppearance");
    v25 = -[PXPhotosBarsController initWithPhotosContentController:]([PXPhotosBarsController alloc], "initWithPhotosContentController:", self->_contentController);
    barsController = self->_barsController;
    self->_barsController = v25;

    -[PXPhotosBarsController setDelegate:](self->_barsController, "setDelegate:", self);
    -[PXBarsController setViewController:](self->_barsController, "setViewController:", self);
    if (objc_msgSend(v24, "wantsTabBarHidden"))
      objc_msgSend(v17, "performChanges:", &__block_literal_global_190_200448);
  }
  if (objc_msgSend(v17, "allowsSelectionUserActivityBehavior"))
  {
    v27 = [PXAssetSelectionUserActivityController alloc];
    objc_msgSend(v17, "selectionManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[PXAssetSelectionUserActivityController initWithSelectionManager:](v27, "initWithSelectionManager:", v28);
    userActivityController = self->_userActivityController;
    self->_userActivityController = v29;

  }
  -[PXPhotosContentController gridView](self->_contentController, "gridView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "scrollViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scrollView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  objc_msgSend(v31, "setFrame:");
  objc_msgSend(v31, "setAutoresizingMask:", 18);
  if (objc_msgSend(v24, "backgroundStyle") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v33);
    objc_msgSend(v3, "bounds");
    objc_msgSend(v34, "setFrame:");
    objc_msgSend(v17, "specManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "spec");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "visualEffectViewGroupName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_setGroupName:", v37);

    objc_msgSend(v34, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "addSubview:", v34);

  }
  objc_msgSend(v31, "setEnableUnderlaySupport:", objc_msgSend(v24, "enableSupportForTungstenUnderlay"));
  objc_msgSend(v3, "addSubview:", v31);
  -[PXPhotosUIViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v66, 5);
  -[PXPhotosUIViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  objc_msgSend(v31, "scrollViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "registerObserver:", self);

  -[PXPhotosUIViewController _configureDismissalInteractionController](self, "_configureDismissalInteractionController");
  -[PXPhotosUIViewController invalidateHeaderView](self, "invalidateHeaderView");
  objc_msgSend(v24, "bannerProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPresentationDelegate:", self);

  -[PXPhotosUIViewController _updateSecondaryToolbarController](self, "_updateSecondaryToolbarController");
  -[PXPhotosUIViewController _updateSecondaryToolbarAccessoryViews](self, "_updateSecondaryToolbarAccessoryViews");
  -[PXPhotosUIViewController _updateIsModalInPresentation](self, "_updateIsModalInPresentation");
  -[PXPhotosUIViewController _updateBackgroundColor](self, "_updateBackgroundColor");
  objc_initWeak(&location, self);
  v83[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __39__PXPhotosUIViewController_viewDidLoad__block_invoke_4;
  v77[3] = &unk_1E5134E00;
  v64 = &v78;
  objc_copyWeak(&v78, &location);
  v41 = (id)-[PXPhotosUIViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v40, v77);

  objc_msgSend(v17, "assetCollectionActionManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTraitEnvironment:", self);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0x100000, sel_openSelectionWithCommandDownArrow_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", v43);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_cancelSelectMode_);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", v44);

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[PXPhotosUIViewController interaction](self, "interaction");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "keyCommandsForSelectionExtension");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  v48 = v3;
  if (v47)
  {
    v49 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v74 != v49)
          objc_enumerationMutation(v46);
        -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i), v64);
      }
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v47);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[PXPhotosUIViewController assetActionManager](self, "assetActionManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "actionKeyCommands");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v70 != v54)
          objc_enumerationMutation(v52);
        -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j), v64);
      }
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v53);
  }

  if (objc_msgSend(v17, "dismissAffordance"))
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0x100000, sel_modalDismiss_);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", v56);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("["), 0x100000, sel_modalDismiss_);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController addKeyCommand:](self, "addKeyCommand:", v57);

  }
  objc_msgSend(v24, "fullscreenOverlayControllers", v64);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosFullscreenOverlayViewControllerFactory makeViewControllerWithOverlayControllers:photosViewModel:](PXPhotosFullscreenOverlayViewControllerFactory, "makeViewControllerWithOverlayControllers:photosViewModel:", v58, v17);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[PXPhotosUIViewController addChildViewController:](self, "addChildViewController:", v59);
    objc_msgSend(v59, "view");
    v60 = (UIView *)objc_claimAutoreleasedReturnValue();
    fullscreenOverlay = self->_fullscreenOverlay;
    self->_fullscreenOverlay = v60;

    objc_msgSend(v48, "addSubview:", self->_fullscreenOverlay);
    objc_msgSend(v59, "didMoveToParentViewController:", self);
  }
  v62 = (PXUpdater *)objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", self, sel__setNeedsUpdate);
  updater = self->_updater;
  self->_updater = v62;

  -[PXUpdater addUpdateSelector:needsUpdate:](self->_updater, "addUpdateSelector:needsUpdate:", sel__updateObservedSplitViewController, 1);
  -[PXUpdater addUpdateSelector:](self->_updater, "addUpdateSelector:", sel__updateSidebarVisibilityDependentProperties);
  -[PXPhotosUIViewController swift_viewDidLoad](self, "swift_viewDidLoad");

  objc_destroyWeak(v65);
  objc_destroyWeak(&location);

}

- (void)_setNeedsUpdate
{
  id v2;

  -[PXPhotosUIViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_updateBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  -[PXPhotosUIViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController contentController](self, "contentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosUIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  -[PXPhotosUIViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 2)
    v9 = objc_msgSend(v7, "darkModeBackgroundStyle");
  else
    v9 = objc_msgSend(v7, "lightModeBackgroundStyle");
  v10 = v9;

  if ((unint64_t)(v10 - 1) < 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = (void *)v12;
    objc_msgSend(v4, "setBackgroundColor:", v12);

    goto LABEL_9;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_configureDismissalInteractionController
{
  PXViewControllerDismissalInteractionController *v3;
  PXViewControllerDismissalInteractionController *dismissalInteractionController;

  if (-[PXPhotosUIViewController allowedInteractiveDismissBehaviors](self, "allowedInteractiveDismissBehaviors"))
  {
    if (!self->_dismissalInteractionController)
    {
      v3 = -[PXViewControllerDismissalInteractionController initWithViewController:]([PXViewControllerDismissalInteractionController alloc], "initWithViewController:", self);
      dismissalInteractionController = self->_dismissalInteractionController;
      self->_dismissalInteractionController = v3;

      -[PXPhotosUIViewController _updateDismissalInteractionControllerProperties](self, "_updateDismissalInteractionControllerProperties");
      -[PXPhotosUIViewController swift_configureDismissalInteractionController:](self, "swift_configureDismissalInteractionController:", self->_dismissalInteractionController);
    }
  }
}

- (void)_updateDismissalInteractionControllerProperties
{
  unint64_t v3;
  id v4;

  -[PXPhotosUIViewController dismissalInteractionController](self, "dismissalInteractionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXPhotosUIViewController allowedInteractiveDismissBehaviors](self, "allowedInteractiveDismissBehaviors");
  objc_msgSend(v4, "setSwipeDownAllowed:", v3 & 1);
  objc_msgSend(v4, "setSwipeUpAllowed:", (v3 >> 1) & 1);
  objc_msgSend(v4, "setScreenEdgeSwipeAllowed:", (v3 >> 2) & 1);
  objc_msgSend(v4, "setWantsChromeVisible:", 0);

}

- (void)_updateIsModalInPresentation
{
  id v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController px_setModalInPresentation:](self, "px_setModalInPresentation:", objc_msgSend(v3, "isModalInPresentation"));

}

- (void)_updateSecondaryToolbarController
{
  void *v3;
  void *v4;
  int v5;
  char isKindOfClass;
  PXPhotosViewOptionsToolbarController *v7;
  PXPhotosViewOptionsToolbarController *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  char v14;
  PXPhotosLensToolbarController *v15;
  PXPhotosLensToolbarController *v16;
  uint64_t v17;
  void *v18;
  int v19;
  char v20;
  PXPhotosExternalSecondaryToolbarController *v21;
  PXPhotosExternalSecondaryToolbarController *v22;
  void *v23;
  PXPhotosExternalSecondaryToolbarController *v24;
  void *v25;
  void *v26;
  void *v27;
  PXPhotosExternalSecondaryToolbarController *v28;

  -[PXPhotosUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v28 = (PXPhotosExternalSecondaryToolbarController *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewOptionsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v3, "isInSelectMode") & 1) == 0)
    v5 = objc_msgSend(v3, "hidesViewOptionsToolbar") ^ 1;
  else
    v5 = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (((v5 ^ 1) & 1) != 0 || (isKindOfClass & 1) == 0)
  {
    if (v5)
    {
      v8 = [PXPhotosViewOptionsToolbarController alloc];
      -[PXPhotosUIViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PXPhotosViewOptionsToolbarController initWithModel:containerView:](v8, "initWithModel:containerView:", v4, v9);

      -[PXPhotosViewOptionsToolbarController setShouldHideAccessoryViewsOnScroll:](v7, "setShouldHideAccessoryViewsOnScroll:", objc_msgSend(v3, "dismissAffordance") != 3);
      -[PXSecondaryToolbarController setLegibilityGradientEnabled:](v7, "setLegibilityGradientEnabled:", 1);
      -[PXPhotosUIViewController gridView](self, "gridView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scrollViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSecondaryToolbarController setContentScrollViewController:](v7, "setContentScrollViewController:", v11);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = v28;
  }
  v12 = objc_msgSend(v3, "wantsLensControlVisible");
  v13 = v12 & (v5 ^ 1);
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();
  if (v13 == 1 && (v14 & 1) != 0)
  {
    v15 = v28;
LABEL_16:

    v7 = (PXPhotosViewOptionsToolbarController *)v15;
    goto LABEL_17;
  }
  if (v13)
  {
    v16 = [PXPhotosLensToolbarController alloc];
    -[PXPhotosUIViewController view](self, "view");
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = -[PXPhotosLensToolbarController initWithViewModel:containerView:](v16, "initWithViewModel:containerView:", v3, v17);

    v7 = (PXPhotosViewOptionsToolbarController *)v17;
    goto LABEL_16;
  }
LABEL_17:
  -[PXPhotosUIViewController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "wantsExternallyRenderedSecondaryToolbar") & ((v5 | v12) ^ 1);

  objc_opt_class();
  v20 = objc_opt_isKindOfClass();
  if (v19 == 1 && (v20 & 1) != 0)
  {
    v21 = v28;
LABEL_29:

    v24 = v21;
    goto LABEL_30;
  }
  if (v19)
  {
    v22 = [PXPhotosExternalSecondaryToolbarController alloc];
    -[PXPhotosUIViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PXPhotosExternalSecondaryToolbarController initWithContainerView:](v22, "initWithContainerView:", v23);

  }
  else
  {
    v21 = (PXPhotosExternalSecondaryToolbarController *)v7;
  }
  v24 = v28;
  if (v21 != v28)
  {
    -[PXPhotosUIViewController gridView](self, "gridView");
    v7 = (PXPhotosViewOptionsToolbarController *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      -[PXSecondaryToolbarController setActionHandler:](v28, "setActionHandler:", 0);
      -[PXSecondaryToolbarController removeFromContainerView](v28, "removeFromContainerView");
      -[PXPhotosViewOptionsToolbarController scrollViewController](v7, "scrollViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "unregisterObserver:", v28);

    }
    -[PXPhotosUIViewController toolbarBackdropGroupName](self, "toolbarBackdropGroupName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSecondaryToolbarController setBackdropGroupName:](v21, "setBackdropGroupName:", v26);

    -[PXPhotosUIViewController setSecondaryToolbarController:](self, "setSecondaryToolbarController:", v21);
    if (v21)
    {
      -[PXSecondaryToolbarController setActionHandler:](v21, "setActionHandler:", self);
      -[PXSecondaryToolbarController updateIfNeeded](v21, "updateIfNeeded");
      -[PXSecondaryToolbarController containerViewAdditionalEdgeInsets](v21, "containerViewAdditionalEdgeInsets");
      -[PXPhotosViewOptionsToolbarController setAdditionalSafeAreaInsets:](v7, "setAdditionalSafeAreaInsets:");
      -[PXPhotosViewOptionsToolbarController scrollViewController](v7, "scrollViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "registerObserver:", v21);

      -[PXPhotosUIViewController _updateSecondaryToolbarAccessoryViews](self, "_updateSecondaryToolbarAccessoryViews");
    }
    else
    {
      -[PXPhotosViewOptionsToolbarController setAdditionalSafeAreaInsets:](v7, "setAdditionalSafeAreaInsets:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    }
    goto LABEL_29;
  }
LABEL_30:
  -[PXPhotosUIViewController _updateSecondaryToolbarOpacity](self, "_updateSecondaryToolbarOpacity");

}

- (void)_updateSecondaryToolbarOpacity
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  -[PXPhotosUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController secondaryToolbarAlpha](self, "secondaryToolbarAlpha");
  objc_msgSend(v3, "_configureOpacityOfSecondaryToolbarController:withViewModel:secondaryToolbarAlpha:", v5, v4);

}

- (void)setOneUpEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_contentController)
  {
    v3 = a3;
    -[PXPhotosUIViewController interaction](self, "interaction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)_invalidateOneUpPresentationInteraction
{
  void *v3;

  -[PXPhotosUIViewController interaction](self, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOneUpPresentation:", 0);

  -[PXPhotosUIViewController _updateOneUpPresentationInteraction](self, "_updateOneUpPresentationInteraction");
}

- (void)_updateOneUpPresentationInteraction
{
  void *v3;
  id v4;

  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController interaction](self, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOneUpPresentation:", v4);

}

- (void)_updateSecondaryToolbarAccessoryViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewOptionsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotosUIViewController filterButtonController](self, "filterButtonController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateButton");
    objc_msgSend(v5, "button");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "dismissAffordance") == 3)
      -[PXPhotosUIViewController closeButtonController](self, "closeButtonController");
    else
      -[PXPhotosUIViewController statusButtonController](self, "statusButtonController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[PXPhotosUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeadingAccessoryView:", v9);

  -[PXPhotosUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTrailingAccessoryView:", v4);

}

- (void)_updateScrollViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosUIViewController contentController](self, "contentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PXPhotosUIViewController swift_updateScrollViewControllerForScrollDetentsProvider](self, "swift_updateScrollViewControllerForScrollDetentsProvider"))
  {
    -[PXPhotosUIViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "scrollingBehavior");

    if (v9 == 1)
    {
      objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);
      objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);
      v10 = 1;
      objc_msgSend(v7, "setShouldScrollSimultaneouslyWithDescendantScrollView:", 1);
      +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "horizontalPagingTechnique");

      if (!v12)
      {
        objc_msgSend(v4, "interPageSpacing");
        objc_msgSend(v7, "setHorizontalInterPageSpacing:");
        v10 = 0;
      }
      objc_msgSend(v7, "setDecelerationRate:", v10);
      objc_msgSend(v4, "layoutReferenceSize");
      v14 = v13;
      objc_msgSend(v4, "interPageSpacing");
      +[PXScrollBehavior pagingBehaviorWithAxis:pagingOrigin:pageOffset:decelerationRate:](PXScrollBehavior, "pagingBehaviorWithAxis:pagingOrigin:pageOffset:decelerationRate:", 2, 1, 0.0, v14 + v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosUIViewController setScrollBehavior:](self, "setScrollBehavior:", v16);
      -[PXPhotosUIViewController contentController](self, "contentController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setVisibleRectDelegate:", self);

    }
  }

}

- (id)_createButtonForScrollingToNeighboringSectionInDirection:(unint64_t)a3
{
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v15;
  _QWORD v16[4];
  id v17[2];
  id location;

  if (a3 == 1)
  {
    v5 = CFSTR("chevron.up");
  }
  else
  {
    if (a3 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosUIViewController.m"), 1252, CFSTR("unsupported direction"));

      abort();
    }
    v5 = CFSTR("chevron.down");
  }
  objc_initWeak(&location, self);
  v6 = (void *)objc_opt_class();
  -[PXPhotosUIViewController toolbarBackdropGroupName](self, "toolbarBackdropGroupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_roundedButtonConfigurationWithSymbolName:inset:fontSize:weight:groupName:", v5, 7, v7, 10.0, 12.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3518];
  v10 = (void *)MEMORY[0x1E0DC3428];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PXPhotosUIViewController__createButtonForScrollingToNeighboringSectionInDirection___block_invoke;
  v16[3] = &unk_1E5134E28;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  objc_msgSend(v10, "actionWithHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buttonWithConfiguration:primaryAction:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  return v12;
}

- (id)_createSortButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[PXPhotosUIViewController toolbarBackdropGroupName](self, "toolbarBackdropGroupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_roundedButtonConfigurationWithSymbolName:inset:fontSize:weight:groupName:", CFSTR("arrow.up.arrow.down"), 7, v4, 10.0, 14.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsMenuAsPrimaryAction:", 1);
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC39D0];
  v8 = (void *)MEMORY[0x1E0DC36F8];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __45__PXPhotosUIViewController__createSortButton__block_invoke;
  v16 = &unk_1E5134E50;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v8, "elementWithUncachedProvider:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithChildren:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenu:", v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_createPlayAsMemoryButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__PXPhotosUIViewController__createPlayAsMemoryButton__block_invoke;
  v13 = &unk_1E5147F40;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v3, "actionWithHandler:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  -[PXPhotosUIViewController toolbarBackdropGroupName](self, "toolbarBackdropGroupName", v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_roundedButtonConfigurationWithSymbolName:inset:fontSize:weight:groupName:", CFSTR("play.fill"), 7, v6, 10.0, 12.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v8;
}

- (void)_scrollToInitialPositionIfNecessary
{
  void *v3;
  void *v4;
  PXProgrammaticNavigationRequest *v5;
  uint64_t v6;
  id v7;
  PXProgrammaticNavigationRequest *v8;
  _QWORD v9[4];
  id v10;
  PXPhotosUIViewController *v11;
  id v12;

  if (!-[PXPhotosUIViewController hasScrolledToInitialPosition](self, "hasScrolledToInitialPosition")
    && !-[PXPhotosUIViewController isShowingInitialLoadingPlaceholder](self, "isShowingInitialLoadingPlaceholder"))
  {
    -[PXPhotosUIViewController setHasScrolledToInitialPosition:](self, "setHasScrolledToInitialPosition:", 1);
    -[PXPhotosUIViewController pendingInitialNavigationRequest](self, "pendingInitialNavigationRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PXPhotosUIViewController setPendingInitialNavigationRequest:](self, "setPendingInitialNavigationRequest:", 0);
      objc_msgSend(v3, "destination");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = [PXProgrammaticNavigationRequest alloc];
      v6 = objc_msgSend(v3, "options");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke;
      v9[3] = &unk_1E5134E78;
      v10 = v4;
      v11 = self;
      v12 = v3;
      v7 = v4;
      v8 = -[PXProgrammaticNavigationRequest initWithDestination:options:completionHandler:](v5, "initWithDestination:options:completionHandler:", v7, v6, v9);
      PXProgrammaticNavigationRequestExecute(v8, self);

    }
    else
    {
      -[PXPhotosUIViewController _scrollToInitialPositionAnimated:](self, "_scrollToInitialPositionAnimated:", 0);
    }

  }
}

- (void)_scrollToInitialPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  -[PXPhotosUIViewController contentController](self, "contentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PXPhotosUIViewController__scrollToInitialPositionAnimated___block_invoke;
  v6[3] = &unk_1E5147360;
  v6[4] = self;
  objc_msgSend(v5, "scrollToInitialPositionAnimated:withCompletionHandler:", v3, v6);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewIsAppearing:](&v8, sel_viewIsAppearing_);
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChanges:", &__block_literal_global_243);

  -[PXPhotosUIViewController barsController](self, "barsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIfNeeded");

  -[PXPhotosUIViewController contentController](self, "contentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentViewWillAppear:", v3);

  -[PXPhotosUIViewController _scrollToInitialPositionIfNecessary](self, "_scrollToInitialPositionIfNecessary");
  -[PXPhotosUIViewController _updateBackButtonBehavior](self, "_updateBackButtonBehavior");
  -[PXPhotosUIViewController _updateDrawerButtonVisibility](self, "_updateDrawerButtonVisibility");
}

- (void)containerView:(id)a3 willMoveToWindow:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  if (a4)
  {
    objc_msgSend(a4, "windowScene", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusBarManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBarFrame");
    v8 = v7;

    -[PXPhotosUIViewController contentController](self, "contentController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStatusBarHeight:", v8);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[PXPhotosUIViewController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  -[PXPhotosUIViewController contentController](self, "contentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIfNeeded");

  -[PXPhotosUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIfNeeded");

  -[PXPhotosUIViewController dismissalInteractionController](self, "dismissalInteractionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllerViewWillLayoutSubviews");

  -[PXPhotosUIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PXPhotosUIViewController fullscreenOverlay](self, "fullscreenOverlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewDidAppear:](&v11, sel_viewDidAppear_);
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChanges:", &__block_literal_global_248_200416);

  -[PXPhotosUIViewController contentController](self, "contentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopForceIncludingAllAssetsInDataSource");

  -[PXPhotosUIViewController eventTracker](self, "eventTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logViewControllerDidAppear:", self);

  -[PXPhotosUIViewController contentController](self, "contentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentViewDidAppear:", v3);

  -[PXPhotosUIViewController userActivityController](self, "userActivityController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[PXPhotosUIViewController privacyController](self, "privacyController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewDidAppearForAuthenticationContext:", self);

  -[PXPhotosUIViewController _updateBackButtonBehavior](self, "_updateBackButtonBehavior");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:", &__block_literal_global_251_200414);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewDidDisappear:](&v11, sel_viewDidDisappear_);
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChanges:", &__block_literal_global_254_200412);

  -[PXPhotosUIViewController eventTracker](self, "eventTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logViewControllerDidDisappear:", self);

  -[PXPhotosUIViewController userActivityController](self, "userActivityController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  v8 = PXContentPrivacyNavigationStateFromViewController(self);
  -[PXPhotosUIViewController privacyController](self, "privacyController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewDidDisappearForAuthenticationContext:withNavigationState:", self, v8);

  -[PXPhotosUIViewController contentController](self, "contentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentViewDidDisappear:", v3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotosUIViewController;
  v6 = a4;
  -[PXPhotosUIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PXPhotosUIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E5148240;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v7);

}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController viewLayoutMarginsDidChange](&v4, sel_viewLayoutMarginsDidChange);
  -[PXPhotosUIViewController secondaryToolbarController](self, "secondaryToolbarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (a3)
    -[PXPhotosUIViewController _invalidateObservedSplitViewController](self, "_invalidateObservedSplitViewController");
  else
    -[PXPhotosUIViewController setObservedSplitViewController:](self, "setObservedSplitViewController:", 0);
}

- (void)_invalidateObservedSplitViewController
{
  id v2;

  -[PXPhotosUIViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateObservedSplitViewController);

}

- (void)_updateObservedSplitViewController
{
  id v3;

  -[UIViewController px_splitViewController](self, "px_splitViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController setObservedSplitViewController:](self, "setObservedSplitViewController:", v3);

}

- (void)_invalidateSidebarVisibilityDependentProperties
{
  id v2;

  -[PXPhotosUIViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSidebarVisibilityDependentProperties);

}

- (void)_updateSidebarVisibilityDependentProperties
{
  -[PXPhotosUIViewController _updateBackButtonBehavior](self, "_updateBackButtonBehavior");
  -[PXPhotosUIViewController _updateDrawerButtonVisibility](self, "_updateDrawerButtonVisibility");
}

- (void)setObservedSplitViewController:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observedSplitViewController);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_observedSplitViewController);
    objc_msgSend(v5, "unregisterChangeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_observedSplitViewController, obj);
    objc_msgSend(obj, "registerChangeObserver:", self);

    -[PXPhotosUIViewController _invalidateSidebarVisibilityDependentProperties](self, "_invalidateSidebarVisibilityDependentProperties");
  }

}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PXPhotosUIViewController contentControllerIfLoaded](self, "contentControllerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_msgSend(v5, "allowedChromeItems") & 0x400) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)px_willTransitionBars
{
  id v2;

  -[PXPhotosUIViewController gridView](self, "gridView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldWorkaround18475431:", 1);

}

- (void)px_didTransitionBars
{
  id v2;

  -[PXPhotosUIViewController gridView](self, "gridView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldWorkaround18475431:", 0);

}

- (BOOL)px_determinesPreferredStatusBarStyle
{
  return 1;
}

- (UIEdgeInsets)px_layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosUIViewController;
  -[UIViewController px_layoutMargins](&v7, sel_px_layoutMargins);
  if (v3 >= v5)
    v6 = v3;
  else
    v6 = v5;
  if (v3 != v5)
  {
    v5 = v6;
    v3 = v6;
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)px_containedViewControllerModalStateChanged
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosUIViewController;
  -[UIViewController px_containedViewControllerModalStateChanged](&v4, sel_px_containedViewControllerModalStateChanged);
  -[PXPhotosUIViewController dismissalInteractionController](self, "dismissalInteractionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containedViewControllerModalStateChanged");

}

- (int64_t)userInterfaceFeature
{
  return 5;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PXPhotosUIViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "firstResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_containsResponder:", v2);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  __CFString *v18;
  char v19;
  void *v20;
  uint64_t v22;
  __CFString *v23;
  unsigned __int8 v24;
  objc_super v25;
  _OWORD v26[2];

  v6 = a4;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (sel_paste_ == a3)
  {
    objc_msgSend(v7, "currentDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "numberOfSections") != 1)
    {
      v10 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (v11)
      objc_msgSend(v11, "firstSectionIndexPath");
    else
      memset(v26, 0, sizeof(v26));
    objc_msgSend(v11, "assetCollectionReferenceAtSectionIndexPath:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetCollectionActionManager");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = -[__CFString canPerformActionType:assetCollectionReference:](v18, "canPerformActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypePasteAssets"), v17);
LABEL_29:
    v10 = v19;

    goto LABEL_35;
  }
  if (sel_addAssetsToAlbum_ == a3)
  {
    objc_msgSend(v7, "assetCollectionActionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    v13 = CFSTR("PXAssetCollectionActionTypeAddFrom");
    goto LABEL_33;
  }
  if (sel_openSelectionWithCommandDownArrow_ != a3 && sel_toggleViewer_ != a3)
  {
    if (sel_zoomIn_ == a3)
    {
      -[PXPhotosUIViewController interaction](self, "interaction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      v13 = CFSTR("PXPhotosGridActionZoomIn");
    }
    else if (sel_zoomOut_ == a3)
    {
      -[PXPhotosUIViewController interaction](self, "interaction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      v13 = CFSTR("PXPhotosGridActionZoomOut");
    }
    else
    {
      if (sel_toggleViewMode_ != a3)
      {
        if (sel_toggleFilter_ != a3)
        {
          if (sel_toggleEditMode_ == a3)
          {
            -[PXPhotosUIViewController interaction](self, "interaction");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v11, "canToggleSelectMode");
            goto LABEL_34;
          }
          if (sel_cancelSelectMode_ == a3)
          {
            v24 = objc_msgSend(v7, "canExitSelectMode");
            goto LABEL_47;
          }
          if (sel_selectAll_ != a3)
          {
            if (sel_deselectAll_ == a3)
            {
              objc_msgSend(v7, "selectionSnapshot");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v11, "isAnyItemSelected");
              goto LABEL_34;
            }
            -[PXPhotosUIViewController assetActionManager](self, "assetActionManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_opt_respondsToSelector();

            if ((v15 & 1) != 0)
            {
              -[PXPhotosUIViewController assetActionManager](self, "assetActionManager");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v11, "canPerformAction:withSender:", a3, v6);
LABEL_34:
              v10 = v16;
              goto LABEL_35;
            }
            v25.receiver = self;
            v25.super_class = (Class)PXPhotosUIViewController;
            v24 = -[PXPhotosUIViewController canPerformAction:withSender:](&v25, sel_canPerformAction_withSender_, a3, v6);
LABEL_47:
            v10 = v24;
            goto LABEL_36;
          }
          if (objc_msgSend(v7, "canEnterSelectMode"))
          {
            v24 = objc_msgSend(v8, "allowsSelectAllAction");
            goto LABEL_47;
          }
          goto LABEL_10;
        }
        -[PXPhotosUIViewController interaction](self, "interaction");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PXNumberPropertyFromCommand(v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v17, "integerValue");
        if ((unint64_t)(v22 - 1) > 3)
          v23 = &stru_1E5149688;
        else
          v23 = off_1E5132538[v22 - 1];
        v18 = v23;
        v19 = objc_msgSend(v11, "canPerformActionType:", v18);
        goto LABEL_29;
      }
      -[PXPhotosUIViewController interaction](self, "interaction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      v13 = CFSTR("PXPhotosGridActionToggleAspectFit");
    }
LABEL_33:
    v16 = objc_msgSend(v12, "canPerformActionType:", v13);
    goto LABEL_34;
  }
  if (objc_msgSend(v7, "canPresentOneUp") && (objc_msgSend(v8, "isInSelectMode") & 1) == 0)
  {
    objc_msgSend(v8, "singleSelectedAssetReference");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20 != 0;

    goto LABEL_36;
  }
LABEL_10:
  v10 = 0;
LABEL_36:

  return v10;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  objc_super v16;

  v6 = a4;
  -[PXPhotosUIViewController interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetForKeyCommands");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PXPhotosUIViewController interaction](self, "interaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetForKeyCommands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PXPhotosUIViewController assetActionManager](self, "assetActionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[PXPhotosUIViewController assetActionManager](self, "assetActionManager");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)PXPhotosUIViewController;
      -[PXPhotosUIViewController targetForAction:withSender:](&v16, sel_targetForAction_withSender_, a3, v6);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v14;
  }

  return v11;
}

- (void)validateCommand:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  id v13;

  v13 = a3;
  if ((char *)objc_msgSend(v13, "action") == sel_toggleEditMode_)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isInSelectMode](v4, "isInSelectMode"))
      v8 = CFSTR("PXPhotosGridCancel");
    else
      v8 = CFSTR("PXPhotosGridSelect");
    PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ((char *)objc_msgSend(v13, "action") == sel_toggleViewMode_)
  {
    -[PXPhotosUIViewController interaction](self, "interaction");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString discoverabilityTitleForActionType:](v4, "discoverabilityTitleForActionType:", CFSTR("PXPhotosGridActionToggleAspectFit"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v5 = (void *)v9;
    objc_msgSend(v13, "setDiscoverabilityTitle:", v9);
LABEL_19:

    goto LABEL_20;
  }
  if ((char *)objc_msgSend(v13, "action") == sel_toggleFilter_)
  {
    PXNumberPropertyFromCommand(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    if ((unint64_t)(v11 - 1) > 3)
      v12 = &stru_1E5149688;
    else
      v12 = off_1E5132538[v11 - 1];
    v4 = v12;

    -[PXPhotosUIViewController interaction](self, "interaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "discoverabilityTitleForActionType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDiscoverabilityTitle:", v6);
    goto LABEL_18;
  }
  if ((char *)objc_msgSend(v13, "action") == sel_addAssetsToAlbum_)
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotosGridAddPhotosActionMenuTitle"), CFSTR("PhotosUICore"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDiscoverabilityTitle:", v4);
LABEL_20:

    goto LABEL_21;
  }
  if ((char *)objc_msgSend(v13, "action") == sel_addAssetsToLastUsedAlbum_)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString assetActionManager](v4, "assetActionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionPerformerForActionType:", CFSTR("PXAssetActionTypeAddToLastUsedAlbum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedTitleForUseCase:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDiscoverabilityTitle:", v7);

LABEL_18:
    goto LABEL_19;
  }
LABEL_21:

}

- (void)paste:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  _OWORD v11[2];

  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "firstSectionIndexPath");
  else
    memset(v11, 0, sizeof(v11));
  objc_msgSend(v5, "assetCollectionReferenceAtSectionIndexPath:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollectionActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionPerformerForActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypePasteAssets"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "performActionWithCompletionHandler:", &__block_literal_global_299);
  }
  else
  {
    PLGridZeroGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Unable to paste assets.", v10, 2u);
    }

  }
}

- (void)openSelectionWithCommandDownArrow:(id)a3
{
  -[PXPhotosUIViewController _presentOneUpForSingleSelectedAssetWithActivity:](self, "_presentOneUpForSingleSelectedAssetWithActivity:", 0);
}

- (void)toggleViewer:(id)a3
{
  -[PXPhotosUIViewController _presentOneUpForSingleSelectedAssetWithActivity:](self, "_presentOneUpForSingleSelectedAssetWithActivity:", 0);
}

- (void)zoomIn:(id)a3
{
  id v3;

  -[PXPhotosUIViewController interaction](self, "interaction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performActionWithType:", CFSTR("PXPhotosGridActionZoomIn"));

}

- (void)zoomOut:(id)a3
{
  id v3;

  -[PXPhotosUIViewController interaction](self, "interaction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performActionWithType:", CFSTR("PXPhotosGridActionZoomOut"));

}

- (void)toggleEditMode:(id)a3
{
  id v3;

  -[PXPhotosUIViewController interaction](self, "interaction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleSelectMode");

}

- (void)toggleViewMode:(id)a3
{
  id v3;

  -[PXPhotosUIViewController interaction](self, "interaction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performActionWithType:", CFSTR("PXPhotosGridActionToggleAspectFit"));

}

- (void)toggleFilter:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;

  PXNumberPropertyFromCommand(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if ((unint64_t)(v5 - 1) > 3)
    v6 = &stru_1E5149688;
  else
    v6 = off_1E5132538[v5 - 1];
  v8 = v6;

  -[PXPhotosUIViewController interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performActionWithType:", v8);

}

- (void)addAssetsToAlbum:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollectionActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionPerformerForActionType:", CFSTR("PXAssetCollectionActionTypeAddFrom"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "performActionWithCompletionHandler:", 0);
}

- (void)selectAll:(id)a3
{
  id v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "allowsSelectAllAction"))
    objc_msgSend(v3, "performChanges:", &__block_literal_global_300_200384);

}

- (void)deselectAll:(id)a3
{
  id v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_301_200383);

}

- (void)cancelSelectMode:(id)a3
{
  id v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_302_200382);

}

- (void)modalDismiss:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[PXPhotosUIViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Modal dismiss requested but there is no presenting view controller", v5, 2u);
    }

  }
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)playCollectionAsMemory
{
  void *v2;
  void *v3;
  id v4;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetCollectionActionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionPerformerForActionType:", CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXPhotosUIViewController contentController](self, "contentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosUIViewController preferredFocusAssetReference](self, "preferredFocusAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "axLeafForObjectReference:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "axGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    v15 = v6;
    v16 = v7;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = (uint64_t *)&v15;
    v11 = 2;
  }
  else
  {
    v14 = v7;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v14;
    v11 = 1;
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  void *v3;
  char v4;
  void *v5;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "navBarStyle"))
  {
    v4 = 0;
  }
  else
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "shouldOptOutOfChromelessBars");

  }
  return v4;
}

- (id)pu_debugCurrentlySelectedAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allItemsEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pu_debugCurrentPrivacyController
{
  return self->_privacyController;
}

- (NSArray)visibleUUIDs
{
  void *v2;
  _QWORD *v3;
  id v4;
  void (*v5)(_QWORD *, _QWORD *);
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[PXPhotosUIViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleAssetsIterator");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PXPhotosUIViewController_visibleUUIDs__block_invoke;
  v9[3] = &unk_1E5134FC0;
  v10 = v4;
  v5 = (void (*)(_QWORD *, _QWORD *))v3[2];
  v6 = v4;
  v5(v3, v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSArray *)v7;
}

- (BOOL)pu_handleSecondTabTap
{
  return -[PXPhotosUIViewController scrollToBottomAnimated:](self, "scrollToBottomAnimated:", 1);
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;

  v3 = a3;
  v5 = -[PXPhotosUIViewController isViewLoaded](self, "isViewLoaded");
  if (v5)
  {
    -[PXPhotosUIViewController contentController](self, "contentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollToInitialPositionAnimated:withCompletionHandler:", v3, 0);

  }
  return v5;
}

- (BOOL)scrollToBottomAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PXPhotosUIViewController isViewLoaded](self, "isViewLoaded");
  if (v5)
  {
    -[PXPhotosUIViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "px_isScrolledAtEdge:", 3);

    if ((v7 & 1) == 0)
    {
      -[PXPhotosUIViewController scrollView](self, "scrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_scrollToEdge:animated:", 3, v3);

      v9 = (void *)MEMORY[0x1E0D09910];
      v14 = *MEMORY[0x1E0D09830];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.viewScrolledToBottom"), v12);

    }
    LOBYTE(v5) = v7 ^ 1;
  }
  return v5;
}

- (BOOL)resetToInitialStateIfPossible
{
  int v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = -[PXPhotosUIViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAnyItemSelected");

    if ((v6 & 1) != 0
      || -[UIViewController px_containsViewControllerModalInPresentation](self, "px_containsViewControllerModalInPresentation")|| (-[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "state"), v7, v8))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[PXPhotosUIViewController viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performChanges:", &__block_literal_global_307);

      -[PXPhotosUIViewController _scrollToInitialPositionAnimated:](self, "_scrollToInitialPositionAnimated:", 0);
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (PXActionManager)assetActionManager
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetActionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXActionManager *)v3;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];

  v4 = a3;
  -[PXPhotosUIViewController currentDataSource](self, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "type");
  if ((unint64_t)(v7 - 5) < 2)
  {
    v13 = objc_msgSend(v6, "px_isAllPhotosSmartAlbum");
  }
  else if ((unint64_t)(v7 - 7) > 1)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "assetCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc((Class)off_1E50B1668);
      v10 = *((_OWORD *)off_1E50B8778 + 1);
      v20[0] = *(_OWORD *)off_1E50B8778;
      v20[1] = v10;
      v11 = (void *)objc_msgSend(v9, "initWithAssetCollection:keyAssetReference:indexPath:", v8, 0, v20);
      if ((objc_msgSend(v8, "isEqual:", v6) & 1) != 0)
        goto LABEL_17;
      if (v5)
      {
        objc_msgSend(v5, "indexPathForAssetCollectionReference:", v11);
        v12 = v18;
      }
      else
      {
        v12 = 0;
        v18 = 0u;
        v19 = 0u;
      }
      if (v12 != *(_QWORD *)off_1E50B7E98)
        goto LABEL_17;
      if (!objc_msgSend(v8, "px_isRecentsSmartAlbum"))
        goto LABEL_26;
      if (!objc_msgSend(v6, "px_isAllPhotosSmartAlbum"))
        goto LABEL_26;
      -[PXPhotosUIViewController viewModel](self, "viewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewOptionsModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortOrderState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_17:
        v13 = 1;
      }
      else
      {
LABEL_26:
        if (objc_msgSend(v8, "px_isFeaturedPhotosCollection", v18, v19))
          v13 = objc_msgSend(v6, "px_isFeaturedPhotosCollection");
        else
          v13 = 0;
      }

    }
    else if (objc_msgSend(v4, "type") == 7)
    {
      v13 = objc_msgSend(v6, "px_isAllPhotosSmartAlbum");
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  void *v32;
  PXProgrammaticNavigationRequest *v33;
  NSObject *v34;
  id *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  _QWORD v44[11];
  _QWORD v45[11];
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  _QWORD aBlock[4];
  id v50;
  id v51;
  id v52;
  id location;
  _OWORD buf[2];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5135010;
  objc_copyWeak(&v52, &location);
  v10 = v7;
  v50 = v10;
  v11 = v8;
  v51 = v11;
  v12 = _Block_copy(aBlock);
  if (!-[PXPhotosUIViewController isViewLoaded](self, "isViewLoaded"))
    goto LABEL_20;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isAppearing"))
  {

    goto LABEL_5;
  }
  v14 = -[PXPhotosUIViewController hasScrolledToInitialPosition](self, "hasScrolledToInitialPosition");

  if (!v14)
  {
LABEL_20:
    -[PXPhotosUIViewController pendingInitialNavigationRequest](self, "pendingInitialNavigationRequest");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "cancel");

    v33 = -[PXProgrammaticNavigationRequest initWithDestination:options:completionHandler:]([PXProgrammaticNavigationRequest alloc], "initWithDestination:options:completionHandler:", v10, a4, v12);
    -[PXPhotosUIViewController setPendingInitialNavigationRequest:](self, "setPendingInitialNavigationRequest:", v33);

    goto LABEL_33;
  }
LABEL_5:
  objc_msgSend(v10, "sidebarBackNavigationRootDestination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController currentDataSource](self, "currentDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "isEqual:", v18);

  if (v19)
  {
    -[PXPhotosUIViewController navigationItem](self, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "px_setHidesBackButtonInRegularWidth:", 1);
    -[PXPhotosUIViewController traitCollection](self, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "px_updateBackButtonVisibilityForTraitCollection:", v21);

    -[PXPhotosUIViewController _updateBackButtonBehavior](self, "_updateBackButtonBehavior");
  }
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "performChanges:", &__block_literal_global_309_200360);

  v48[0] = v9;
  v48[1] = 3221225472;
  v48[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3;
  v48[3] = &unk_1E5135058;
  v48[4] = self;
  v40 = _Block_copy(v48);
  objc_msgSend(v10, "asset");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "type") == 7 && objc_msgSend(v10, "revealMode") != 2)
    goto LABEL_19;
  if (objc_msgSend(v10, "type") == 6 && objc_msgSend(v10, "revealMode") == 1)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "viewOptionsModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sortOrderState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 && objc_msgSend(v26, "sortOrder") != 2)
      objc_msgSend(v26, "performChanges:", &__block_literal_global_314);
    -[PXPhotosUIViewController currentDataSource](self, "currentDataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v46 = 0u;
    v47 = 0u;
    if (v27)
    {
      objc_msgSend(v27, "lastItemIndexPath");
      if ((_QWORD)v46 != *(_QWORD *)off_1E50B7E98
        && (_QWORD)v47 != 0x7FFFFFFFFFFFFFFFLL
        && *((_QWORD *)&v47 + 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        buf[0] = v46;
        buf[1] = v47;
        objc_msgSend(v28, "assetAtItemIndexPath:", buf);
        v29 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v29;
LABEL_19:
        v45[0] = v9;
        v45[1] = 3221225472;
        v45[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_315;
        v45[3] = &unk_1E5135110;
        v30 = v45;
        v45[7] = v40;
        v31 = v23;
        v45[4] = v31;
        v45[5] = self;
        v45[6] = v10;
        v45[10] = a4;
        v45[8] = v11;
        v45[9] = v12;
        -[PXPhotosUIViewController _waitForAvailabilityOfAsset:completionHandler:](self, "_waitForAvailabilityOfAsset:completionHandler:", v31, v45);
LABEL_26:
        v35 = (id *)(v30 + 7);

        v36 = (void *)v30[4];
LABEL_27:

        goto LABEL_28;
      }
    }
    PXAssertGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v28;
      _os_log_error_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "Couldn't get last asset index path in data source: %@", (uint8_t *)buf, 0xCu);
    }

  }
  if (v23)
  {
    v44[0] = v9;
    v44[1] = 3221225472;
    v44[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_4_326;
    v44[3] = &unk_1E5135110;
    v30 = v44;
    v44[7] = v40;
    v31 = v23;
    v44[4] = v31;
    v44[5] = self;
    v44[6] = v10;
    v44[10] = a4;
    v44[8] = v11;
    v44[9] = v12;
    -[PXPhotosUIViewController _waitForAvailabilityOfAsset:completionHandler:](self, "_waitForAvailabilityOfAsset:completionHandler:", v31, v44);
    goto LABEL_26;
  }
  if (objc_msgSend(v10, "revealMode") == 3)
  {
    -[PXPhotosUIViewController contentController](self, "contentController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v9;
    v42[1] = 3221225472;
    v42[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_330;
    v42[3] = &unk_1E513FE10;
    v43 = v12;
    objc_msgSend(v36, "scrollToInitialPositionAnimated:withCompletionHandler:", (a4 >> 1) & 1, v42);
    v31 = 0;
    v35 = &v43;
    goto LABEL_27;
  }
  (*((void (**)(void *, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);
  v31 = 0;
LABEL_28:
  if (objc_msgSend(v10, "type") == 8)
  {
    if (objc_msgSend(v10, "displayAlbumOptions"))
    {
      -[PXPhotosUIViewController interaction](self, "interaction");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "canPerformActionType:", CFSTR("PXPhotosGridActionManagePeople"));

      if (v38)
      {
        -[PXPhotosUIViewController interaction](self, "interaction");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "performActionWithType:", CFSTR("PXPhotosGridActionManagePeople"));

      }
    }
  }

LABEL_33:
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);

}

- (void)_completeNavigationToDestination:(id)a3 result:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "type") == 8 && objc_msgSend(v8, "assetCollectionSubtype") == 218)
  {
    if (objc_msgSend(v8, "renderAlbumAssetsWithDeferredProcessing"))
    {
      -[PXPhotosUIViewController currentDataSource](self, "currentDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "px_isCinematicSmartAlbum");

      if (v12)
      {
        if (a4 == 1)
        {
          v13 = (void *)MEMORY[0x1E0D09910];
          v25 = *MEMORY[0x1E0D09830];
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.navigateToCinematicAlbumWithRender"), v16);

          -[PXPhotosUIViewController viewModel](self, "viewModel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "dataSourceManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dataSource");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "containerCollection");
          v20 = objc_claimAutoreleasedReturnValue();

          if (-[NSObject conformsToProtocol:](v20, "conformsToProtocol:", &unk_1EEA14980))
          {
            v21 = v20;
            PXCreateDefaultAssetSharingHelper(self);
            v22 = objc_claimAutoreleasedReturnValue();
            -[NSObject ensureRenderingForAssetsWithDeferredProcessingInCollection:completion:](v22, "ensureRenderingForAssetsWithDeferredProcessingInCollection:completion:", v21, &__block_literal_global_679);

          }
          else
          {
            PLGridZeroGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v23) = 0;
              _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "PXPhotosUIViewController: Navigation to cinematic album failed, data source collection is not an asset collection.", (uint8_t *)&v23, 2u);
            }
          }

        }
        else
        {
          PLGridZeroGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v23 = 138412290;
            v24 = v9;
            _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "PXPhotosUIViewController: Navigation to cinematic album failed. with error %@", (uint8_t *)&v23, 0xCu);
          }
        }

      }
    }
  }

}

- (id)px_navigationDestination
{
  void *v2;
  void *v3;
  id v4;
  PXProgrammaticNavigationDestination *v5;

  -[PXPhotosUIViewController currentDataSource](self, "currentDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
    goto LABEL_6;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = -[PXProgrammaticNavigationDestination initWithObject:revealMode:]([PXProgrammaticNavigationDestination alloc], "initWithObject:revealMode:", v4, 0);
LABEL_7:

  return v5;
}

- (void)_waitForAvailabilityOfAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void (*v12)(void);
  id v13;

  v13 = a3;
  if (v13)
  {
    v6 = a4;
    +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultNavigationTimeoutDuration");
    v9 = v8;

    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "waitForAvailabilityOfAsset:timeout:completionHandler:", v13, v6, v9);

  }
  else
  {
    v12 = (void (*)(void))*((_QWORD *)a4 + 2);
    v10 = a4;
    v12();
  }

}

- (void)navigateToAssetReference:(id)a3
{
  id v4;
  PXProgrammaticNavigationDestination *v5;
  void *v6;
  void *v7;
  PXProgrammaticNavigationDestination *v8;

  v4 = a3;
  v5 = [PXProgrammaticNavigationDestination alloc];
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXProgrammaticNavigationDestination initWithType:revealMode:asset:assetCollection:](v5, "initWithType:revealMode:asset:assetCollection:", 7, 2, v6, v7);
  -[PXPhotosUIViewController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v8, 0, &__block_literal_global_683);

}

- (void)navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v7;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  PXProgrammaticNavigationDestination *v16;

  v7 = a6;
  if (a5)
    v11 = 1;
  else
    v11 = 2;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v16 = -[PXProgrammaticNavigationDestination initWithType:revealMode:asset:assetCollection:]([PXProgrammaticNavigationDestination alloc], "initWithType:revealMode:asset:assetCollection:", 7, v11, v14, v13);

  if (v7)
    v15 = 2;
  else
    v15 = 0;
  -[PXPhotosUIViewController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v16, v15, v12);

}

- (void)_waitUntilOneUpPresentationCanStartAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "waitUntilPresentationCanStartAnimated:completionHandler:", v4, v6);

}

- (NSString)authenticationTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "px_isHiddenSmartAlbum");
  v7 = objc_msgSend(v5, "px_isRecentlyDeletedSmartAlbum");
  v8 = objc_msgSend(v5, "px_isRecoveredSmartAlbum");
  v9 = CFSTR("PXContentPrivacyAuthenticationTouchIDTitle_Generic");
  if (v8)
    v9 = CFSTR("PXContentPrivacyAuthenticationTouchIDTitle_Recovered");
  if (v7)
    v9 = CFSTR("PXContentPrivacyAuthenticationTouchIDTitle_RecentlyDeleted");
  if (v6)
    v10 = CFSTR("PXContentPrivacyAuthenticationTouchIDTitle_Hidden");
  else
    v10 = (__CFString *)v9;
  PXLocalizedStringFromTable(v10, CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)passcodeAuthenticationReason
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;

  PXLocalizedStringFromTable(CFSTR("PXContentPrivacyAuthenticationPasscodeReason_Generic"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "px_isHiddenSmartAlbum");
  v9 = objc_msgSend(v7, "px_isRecentlyDeletedSmartAlbum");
  v10 = objc_msgSend(v7, "px_isRecoveredSmartAlbum");
  if ((v8 & 1) != 0 || (v9 & 1) != 0 || v10)
  {
    v11 = CFSTR("PXContentPrivacyAuthenticationPasscodeReason_Recovered");
    if (v9)
      v11 = CFSTR("PXContentPrivacyAuthenticationPasscodeReason_RecentlyDeleted");
    if (v8)
      v12 = CFSTR("PXContentPrivacyAuthenticationPasscodeReason_Hidden");
    else
      v12 = (__CFString *)v11;
    PXLocalizedStringFromTable(v12, CFSTR("PhotosUICore"));
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }

  return (NSString *)v3;
}

- (id)barsControllerActionsForSelectionContextMenu:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "px_isRecentlyDeletedSmartAlbum");
  v9 = objc_msgSend(v7, "px_isRecoveredSmartAlbum");
  v10 = objc_msgSend(v5, "isAnyItemSelected");
  if (((v10 & 1) != 0 || (v8 & 1) != 0 || v9) && objc_msgSend(v4, "allowsMultiSelectMenu"))
  {
    if (v10)
    {
      v22 = 0u;
      v23 = 0u;
      if (v5)
        objc_msgSend(v5, "firstSelectedIndexPath");
      objc_msgSend(v5, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v22;
      v21[1] = v23;
      objc_msgSend(v11, "objectReferenceAtIndexPath:", v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosUIViewController interaction](self, "interaction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNavigatedAssetReference:", v12);

    }
    v14 = (void *)MEMORY[0x1E0C99DE8];
    -[PXPhotosUIViewController assetActionManager](self, "assetActionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = CFSTR("PXAssetActionTypeShare");
    v24[1] = CFSTR("PXAssetActionTypeTrash");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAssetActionMenuBuilder menuElementsForActionManager:excludedActionTypes:](PXAssetActionMenuBuilder, "menuElementsForActionManager:excludedActionTypes:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosUIViewController menuForPXAssetCollectionActionTypeTTRForLemonadeCollections](self, "menuForPXAssetCollectionActionTypeTTRForLemonadeCollections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v18, "insertObject:atIndex:", v19, 0);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)menuForPXAssetCollectionActionTypeTTRForLemonadeCollections
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotoKitAssetCollectionActionManager *v13;
  PXPhotoKitAssetCollectionActionManager *selectedAssetsAssetCollectionActionManager;
  void *v15;
  _QWORD v17[4];
  id v18;

  if (!PFOSVariantHasInternalUI())
    return 0;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAnyItemSelected"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "selectionSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __87__PXPhotosUIViewController_menuForPXAssetCollectionActionTypeTTRForLemonadeCollections__block_invoke;
    v17[3] = &unk_1E51351A0;
    v18 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateSelectedObjectsUsingBlock:", v17);

    -[PXPhotosUIViewController interaction](self, "interaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigatedAssetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v12, 0);
    selectedAssetsAssetCollectionActionManager = self->_selectedAssetsAssetCollectionActionManager;
    self->_selectedAssetsAssetCollectionActionManager = v13;

    -[PXActionManager setPerformerDelegate:](self->_selectedAssetsAssetCollectionActionManager, "setPerformerDelegate:", self);
    -[PXPhotoKitAssetCollectionActionManager standardActionForActionType:](self->_selectedAssetsAssetCollectionActionManager, "standardActionForActionType:", CFSTR("PXAssetCollectionActionTypeTTRForLemonadeCollections"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)photosBarsControllerDidUpdateBars:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[PXPhotosUIViewController gridPresentationBarsUpdateDelegate](self, "gridPresentationBarsUpdateDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PXPhotosUIViewController gridPresentationBarsUpdateDelegate](self, "gridPresentationBarsUpdateDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewController:didUpdateBarsAnimated:isSelecting:", self, 0, objc_msgSend(v6, "isInSelectMode"));

  }
}

- (void)photosBarsControllerDidUpdateNavigationItemAppearance:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[PXPhotosUIViewController gridPresentationBarsUpdateDelegate](self, "gridPresentationBarsUpdateDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PXPhotosUIViewController gridPresentationBarsUpdateDelegate](self, "gridPresentationBarsUpdateDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerDidUpdateNavigationItemAppearance:", self);

  }
}

- (void)photosBarsController:(id)a3 didRequestDismissWithSender:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  id v9;

  v9 = a4;
  -[PXPhotosUIViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customDismissHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXPhotosUIViewController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customDismissHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  else
  {
    -[PXPhotosUIViewController modalDismiss:](self, "modalDismiss:", v9);
  }

}

- (void)_showSearch
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PXPhotosUIViewController createSearchOverlayController](self, "createSearchOverlayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PXPhotosUIViewController currentDataSource](self, "currentDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Can't get a search overlay view controller (data source: %@).", (uint8_t *)&v8, 0xCu);

    }
    goto LABEL_7;
  }
  -[PXPhotosUIViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    objc_msgSend(v3, "px_createViewControllerWithHiddenStatusBarForMainViewController:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setModalPresentationStyle:](v6, "setModalPresentationStyle:", 5);
    -[NSObject setModalPresentationCapturesStatusBarAppearance:](v6, "setModalPresentationCapturesStatusBarAppearance:", 1);
    -[PXPhotosUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 0, 0);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v3, "setModalPresentationStyle:", 5);
  -[PXPhotosUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 0, 0);
LABEL_8:
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.search.session"), MEMORY[0x1E0C9AA70]);

}

- (id)presentationEnvironmentForPhotosBarsController:(id)a3 withSourceItem:(id)a4
{
  if (a4)
    -[PXPhotosUIViewController _popoverPresentationEnvironmentWithSourceItem:](self, "_popoverPresentationEnvironmentWithSourceItem:", a4);
  else
    -[PXPhotosUIViewController _defaultPresentationEnvironment](self, "_defaultPresentationEnvironment", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4
{
  -[PXPhotosUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
  return 1;
}

- (void)dismissPresentedViewControllerForContentController:(id)a3
{
  -[PXPhotosUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[PXPhotosUIViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXPhotosUIViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v5, 1);

  }
  return v6 != 0;
}

- (void)needsUpdateForContentController:(id)a3
{
  id v3;

  -[PXPhotosUIViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (UIEdgeInsets)maskPaddingForContentController:(id)a3
{
  PXSecondaryToolbarController *secondaryToolbarController;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  secondaryToolbarController = self->_secondaryToolbarController;
  if (secondaryToolbarController)
  {
    -[PXSecondaryToolbarController padding](secondaryToolbarController, "padding", a3);
  }
  else
  {
    v4 = *(double *)off_1E50B8020;
    v5 = *((double *)off_1E50B8020 + 1);
    v6 = *((double *)off_1E50B8020 + 2);
    v7 = *((double *)off_1E50B8020 + 3);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, _OWORD *, _BYTE *);
  void *v21;
  id v22;
  PXPhotosUIViewController *v23;
  uint64_t *v24;
  SEL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  objc_msgSend(v5, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EE99F750);

  if (v7)
  {
    objc_msgSend(v5, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_10:
      -[PXPhotosUIViewController barsController](self, "barsController", v18, v19, v20, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "existingBarItemForIdentifier:", CFSTR("PXBarItemIdentifierSelectModeMenu"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", self, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    objc_msgSend(v5, "selectionSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__200322;
    v30 = __Block_byref_object_dispose__200323;
    v31 = 0;
    objc_msgSend(v10, "selectedIndexPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __70__PXPhotosUIViewController_presentationEnvironmentForActionPerformer___block_invoke;
    v21 = &unk_1E51437D0;
    v24 = &v26;
    v12 = v10;
    v25 = a2;
    v22 = v12;
    v23 = self;
    objc_msgSend(v11, "enumerateItemIndexPathsUsingBlock:", &v18);

    if (!v27[5])
      goto LABEL_8;
    -[PXPhotosUIViewController regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v18, v19, v20, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PXPhotosUIViewController gridView](self, "gridView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rectInCoordinateSpace:", v14);
      +[PXViewControllerPresenter popoverPresenterWithViewController:sourceView:sourceRect:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceView:sourceRect:", self, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_8:
      v9 = 0;
    }

    _Block_object_dispose(&v26, 8);
    if (!v9)
      goto LABEL_10;
  }

  return v9;
}

- (id)regionOfInterestForActionPerformer:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "actionType");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("PXAssetActionTypeTrash");
  if (v4 == CFSTR("PXAssetActionTypeTrash"))
  {

    goto LABEL_5;
  }
  v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("PXAssetActionTypeTrash"));

  if (v6)
  {
LABEL_5:
    -[PXPhotosUIViewController interaction](self, "interaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigatedAssetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosUIViewController regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (BOOL)photosContentController:(id)a3 canPlayAssetInline:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "viewDelegateRespondsTo:", 4096))
  {
    objc_msgSend(v6, "viewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "photosViewController:canPlayAssetInline:", self, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)photosContentController:(id)a3 isDisplayAssetEligibleForAutoPlayback:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "viewDelegateRespondsTo:", 0x2000))
  {
    objc_msgSend(v6, "viewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "photosViewController:isAssetEligibleForAutoPlayback:", self, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)photosContentController:(id)a3 isDisplayAssetEligibleForPlaybackWithSettlingEffect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "viewDelegateRespondsTo:", 0x10000))
  {
    objc_msgSend(v6, "viewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "photosViewController:isAssetEligibleForPlaybackWithSettlingEffect:", self, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)photosContentControllerFilterSortedRecordsStrategy:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "viewDelegateRespondsTo:", 0x4000))
  {
    objc_msgSend(v4, "viewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "photosViewControllerFilterSortedRecordsStrategy:", self);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PXPhotosUIViewController contentController](self, "contentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placementInContext:forItemReference:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXPhotosUIViewController setPlacementOverride:](self, "setPlacementOverride:", v7);
  -[PXPhotosUIViewController contentController](self, "contentController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlacementOverride:forItemReference:", v7, v6);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD block[5];
  uint8_t buf[16];

  v8 = a3;
  if ((void *)ViewModelObserverContext_200319 != a5)
  {
    if ((a4 & 1) != 0 && (void *)SpecManagerObserverContext_200321 == a5)
    {
      -[PXPhotosUIViewController _updateScrollViewController](self, "_updateScrollViewController");
      -[PXPhotosUIViewController swift_specDidChange](self, "swift_specDidChange");
    }
    goto LABEL_44;
  }
  if ((a4 & 0x8000000000000) != 0)
    -[PXPhotosUIViewController setFallbackPlaceholderStatusController:](self, "setFallbackPlaceholderStatusController:", 0);
  if ((a4 & 0x8000200000001) != 0)
    -[PXPhotosUIViewController _updateEmptyBehaviorIfNeeded](self, "_updateEmptyBehaviorIfNeeded");
  if ((a4 & 4) != 0)
  {
    -[PXPhotosUIViewController contentController](self, "contentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearLastVisibleAreaAnchoringInformation");

    -[PXPhotosUIViewController invalidateBoopableItemsProvider](self, "invalidateBoopableItemsProvider");
    if ((a4 & 0x4000) == 0)
    {
LABEL_11:
      if ((a4 & 0x2000000000000) == 0)
        goto LABEL_12;
LABEL_16:
      -[PXPhotosUIViewController _showSearch](self, "_showSearch");
      if ((a4 & 2) == 0)
        goto LABEL_19;
      goto LABEL_17;
    }
  }
  else if ((a4 & 0x4000) == 0)
  {
    goto LABEL_11;
  }
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "singleSelectedAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController _requestFocusUpdateWithAssetReference:](self, "_requestFocusUpdateWithAssetReference:", v12);

  if ((a4 & 0x2000000000000) != 0)
    goto LABEL_16;
LABEL_12:
  if ((a4 & 2) == 0)
    goto LABEL_19;
LABEL_17:
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectionSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEmptySelectionAvoided");

  if (v15)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "singleSelectedAssetReference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController _requestFocusUpdateWithAssetReference:](self, "_requestFocusUpdateWithAssetReference:", v17);

  }
LABEL_19:
  if ((a4 & 0x40000000) != 0)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "dismissRequested");

    if (v19)
      -[PXPhotosUIViewController _dismissOnInternalRequest](self, "_dismissOnInternalRequest");
  }
  if ((a4 & 0x400000000) != 0)
  {
    -[PXPhotosUIViewController _updateUIFromViewModelPrivacyState](self, "_updateUIFromViewModelPrivacyState");
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "contentPrivacyState");

    if (v21 == 1)
    {
      -[PXPhotosUIViewController gridView](self, "gridView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scrollViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isScrolledAtEdge:tolerance:", 3, 100.0);

      -[PXPhotosUIViewController setShouldScrollToInitialPositionAfterUnlock:](self, "setShouldScrollToInitialPositionAfterUnlock:", v24);
    }
    else if (-[PXPhotosUIViewController shouldScrollToInitialPositionAfterUnlock](self, "shouldScrollToInitialPositionAfterUnlock"))
    {
      PLGridZeroGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEFAULT, "PXPhotosUIViewController: Scrolling to initial position after unlock.", buf, 2u);
      }

      -[PXPhotosUIViewController _scrollToInitialPositionAnimated:](self, "_scrollToInitialPositionAnimated:", 0);
      -[PXPhotosUIViewController setShouldScrollToInitialPositionAfterUnlock:](self, "setShouldScrollToInitialPositionAfterUnlock:", 0);
    }
    -[PXPhotosUIViewController invalidateBoopableItemsProvider](self, "invalidateBoopableItemsProvider");
  }
  if ((a4 & 0x30000000000) != 0)
    -[PXPhotosUIViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  if ((a4 & 0x80000000000) != 0)
    -[PXPhotosUIViewController _invalidateSecondaryToolbarController](self, "_invalidateSecondaryToolbarController");
  if (objc_msgSend((id)objc_opt_class(), "shouldReconfigureOpacityOfSecondaryToolbarControllerForViewModelChange:", a4))
  {
    -[PXPhotosUIViewController _invalidateSecondaryToolbarOpacity](self, "_invalidateSecondaryToolbarOpacity");
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_36:
      if ((a4 & 4) == 0)
        goto LABEL_37;
      goto LABEL_47;
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    goto LABEL_36;
  }
  -[PXPhotosUIViewController _invalidateIsModalInPresentation](self, "_invalidateIsModalInPresentation");
  if ((a4 & 4) == 0)
  {
LABEL_37:
    if ((a4 & 0x100000000000) == 0)
      goto LABEL_38;
LABEL_48:
    -[PXPhotosUIViewController _invalidateOneUpPresentationInteraction](self, "_invalidateOneUpPresentationInteraction");
    if ((a4 & 0x20) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_47:
  -[PXPhotosUIViewController _invalidateSecondaryToolbarController](self, "_invalidateSecondaryToolbarController");
  if ((a4 & 0x100000000000) != 0)
    goto LABEL_48;
LABEL_38:
  if ((a4 & 0x20) != 0)
  {
LABEL_39:
    -[PXPhotosUIViewController _invalidateDismissalInteractionControllerProperties](self, "_invalidateDismissalInteractionControllerProperties");
    -[PXPhotosUIViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  }
LABEL_40:
  -[PXPhotosUIViewController swift_handleViewModelChange:](self, "swift_handleViewModelChange:", a4);
  if ((a4 & 0x400000000001) != 0)
    -[PXPhotosUIViewController _updateScrollViewController](self, "_updateScrollViewController");
  if ((a4 & 0x800000000000) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PXPhotosUIViewController_observable_didChange_context___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
LABEL_44:

}

- (BOOL)scrollViewController:(id)a3 shouldBeginScrollingWithPanAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 velocity:(CGPoint)a6
{
  return -[PXPhotosUIViewController shouldBeginScrollingContentWithPanAtLocation:inCoordinateSpace:velocity:](self, "shouldBeginScrollingContentWithPanAtLocation:inCoordinateSpace:velocity:", a5, a4.x, a4.y, a6.x, a6.y);
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "viewDelegateRespondsTo:", 0x20000);

  if (v5)
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photosViewController:scrollViewControllerWillBeginScrolling:", self, v8);

  }
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  void *v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldMimicSystemChromelessUsingManualScrollEdgeAppearance");

  if (v5)
  {
    objc_msgSend(v12, "visibleOrigin");
    v7 = v6;
    -[PXPhotosUIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaInsets");
    v10 = floor(v7 + v9);

    -[PXPhotosUIViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setManualScrollEdgeAppearanceProgress:", fmax(fmin(v10, 16.0), 0.0) * 0.0625);

  }
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  void *v4;
  id v5;

  -[PXPhotosUIViewController _handleDidEndScrolling:](self, "_handleDidEndScrolling:", a3);
  -[PXPhotosUIViewController scrollBehavior](self, "scrollBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotosUIViewController contentController](self, "contentController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldEnablePlaybackDuringAnimatedScroll:", 0);

  }
}

- (void)_handleDidEndScrolling:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PXPhotosUIViewController scrollBehavior](self, "scrollBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "visibleRect");
    objc_msgSend(v5, "axis");
    PXPointValueForAxis();
    objc_msgSend(v5, "detentAtContentOffset:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__PXPhotosUIViewController__handleDidEndScrolling___block_invoke;
    v9[3] = &unk_1E51437F8;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "performChanges:", v9);

  }
}

- (void)scrollViewControllerWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;

  y = a6.y;
  x = a6.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = a3;
  -[PXPhotosUIViewController scrollBehavior](self, "scrollBehavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v65 = 0.0;
    v66 = 0;
    v64 = 0.0;
    v14 = objc_msgSend(v12, "isInterruptingScrollWithDirection:", &v64);
    if (v14)
      v15 = v64;
    else
      v15 = v10;
    if (v14)
      v16 = v65;
    else
      v16 = v9;
    objc_msgSend(v13, "adjustedScrollTargetContentOffsetForProposedTargetContentOffset:velocity:currentContentOffset:decelerationRate:", &v66, a5->x, a5->y, v15, v16, x, y);
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "setDecelerationRate:", v66);

    if (v20 != a5->y)
    {
      -[PXPhotosUIViewController contentController](self, "contentController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShouldEnablePlaybackDuringAnimatedScroll:", 1);

    }
    a5->x = v18;
    a5->y = v20;
  }
  else
  {
    v22 = a5->y;
    v63 = a5->x;
    v64 = COERCE_DOUBLE(objc_msgSend(v12, "decelerationRate"));
    -[PXPhotosUIViewController contentController](self, "contentController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "rootLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "convertRect:toDescendantLayout:", v24, a5->x, a5->y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v27 = v26;
    v29 = v28;

    objc_msgSend(v24, "adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:", &v64, v27, v29, v10, v9);
    v61 = v22 + v30 - v29;
    objc_msgSend(v24, "lastScrollDirection");
    v32 = v31;
    v62 = v31;
    v33 = v9;
    v60 = v9;
    v35 = v34;
    objc_msgSend(v12, "visibleRect");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    objc_msgSend(v24, "topCollapsibleArea");
    v46 = PXScrollViewContentOffsetSnappedToRange(1, v37, v39, v41, v43, v63, v61, v10, v33, v32, v35, v44, v45);
    v48 = v47;
    objc_msgSend(v12, "visibleRect");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    objc_msgSend(v24, "bottomCollapsibleArea");
    a5->x = PXScrollViewContentOffsetSnappedToRange(1, v50, v52, v54, v56, v46, v48, v10, v60, v62, v35, v57, v58);
    a5->y = v59;
    objc_msgSend(v12, "setDecelerationRate:", *(_QWORD *)&v64);

  }
}

- (CGRect)layout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PXPhotosUIViewController scrollBehavior](self, "scrollBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "activeAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "adjustedScrollTargetContentOffsetForProposedTargetContentOffset:velocity:currentContentOffset:decelerationRate:", 0, x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), x, y);
      x = v12;
      y = v13;
    }
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)regionOfInterestForTransitioningAssetReference:(id)a3
{
  return -[PXPhotosUIViewController regionOfInterestForAssetReference:image:shouldSnapshotPlaceholder:](self, "regionOfInterestForAssetReference:image:shouldSnapshotPlaceholder:", a3, 0, 0);
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PXDiagnosticsItemProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(PXDiagnosticsItemProvider);
  objc_msgSend(v10, "containerCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EEA14980))
    -[PXDiagnosticsItemProvider registerItem:forIdentifier:](v11, "registerItem:forIdentifier:", v12, CFSTR("PXDiagnosticsItemIdentifierAssetCollection"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosUIViewController;
  -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v16, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectsFromArray:", v14);
  return v13;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[PXPhotosUIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

  v6.receiver = self;
  v6.super_class = (Class)PXPhotosUIViewController;
  -[PXPhotosUIViewController setTitle:](&v6, sel_setTitle_, v4);

}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  -[PXPhotosUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
  return a4 != 0;
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[PXPhotosUIViewController presentedViewController](self, "presentedViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
    -[PXPhotosUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

  return v9 == v8;
}

- (id)windowForProgressPresentationInAssetsSharingHelper:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotosUIViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)secondaryToolbarController:(id)a3 scrollToBottomAnimated:(BOOL)a4
{
  return -[PXPhotosUIViewController scrollToBottomAnimated:](self, "scrollToBottomAnimated:", a4);
}

- (PXSelectionContainer)selectionContainer
{
  void *v3;
  PXSelectionContainer *v4;
  void *v5;
  void *v6;
  void *v7;
  PXSelectionContainer *v8;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXSelectionContainer alloc];
  objc_msgSend(v3, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController undoManager](self, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSelectionContainer initWithSelectionSnapshot:undoManager:context:](v4, "initWithSelectionSnapshot:undoManager:context:", v6, v7, objc_msgSend(v3, "selectionContext"));

  return v8;
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  PXBoopableItemsProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contentPrivacyState");

  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsShareAction");

  v7 = 0;
  if (v6 && !v4)
  {
    -[PXPhotosUIViewController boopableItemsProvider](self, "boopableItemsProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc_init(PXBoopableItemsProvider);
      -[PXPhotosUIViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", v9);

      -[PXPhotosUIViewController viewModel](self, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosUIViewController boopableItemsProvider](self, "boopableItemsProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectionManager:", v11);

      -[PXPhotosUIViewController viewModel](self, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosUIViewController boopableItemsProvider](self, "boopableItemsProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImagePreviewMediaProvider:", v14);

    }
    -[PXPhotosUIViewController boopableItemsProvider](self, "boopableItemsProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIActivityItemsConfigurationReading *)v7;
}

- (void)invalidateBoopableItemsProvider
{
  -[PXPhotosUIViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", 0);
}

- (void)uiInteraction:(id)a3 didChangeNavigatedAssetReference:(id)a4
{
  -[PXPhotosUIViewController setPreferredFocusAssetReference:](self, "setPreferredFocusAssetReference:", a4);
}

- (void)uiInteractionDidExtendSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  -[PXPhotosUIViewController viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  if (v6)
  {
    objc_msgSend(v6, "cursorIndexPath");
    v7 = v11;
  }
  else
  {
    v7 = 0;
  }
  if (v7 != *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v11;
    v10[1] = v12;
    objc_msgSend(v8, "objectReferenceAtIndexPath:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosUIViewController _requestFocusUpdateWithAssetReference:](self, "_requestFocusUpdateWithAssetReference:", v9);
  }

}

- (void)prepareForDismissal
{
  id v2;

  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimated:", 0);

}

- (void)preferencesDidChange
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int AppBooleanValue;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t v13[15];
  Boolean keyExistsAndHasValidFormat;

  if (_os_feature_enabled_impl())
  {
    -[PXPhotosUIViewController viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "px_isHiddenSmartAlbum");

    if (v6)
    {
      keyExistsAndHasValidFormat = 0;
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("HiddenAlbumVisible"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
      {
        if (!AppBooleanValue)
        {
          PLGridZeroGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXPhotosUIViewController: Show Hidden Album was disabled in preferences, popping view.", v13, 2u);
          }

          v9 = -[UIViewController px_isVisible](self, "px_isVisible");
          -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stopAnimated:", v9);

          -[PXPhotosUIViewController navigationController](self, "navigationController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (id)objc_msgSend(v11, "px_popToViewControllerPrecedingViewController:animated:", self, v9);

        }
      }
    }
  }
}

- (id)popoverPresentationEnvironmentForPhotosStatusToggleButtonController:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController _popoverPresentationEnvironmentWithSourceItem:](self, "_popoverPresentationEnvironmentWithSourceItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)photosCloseButtonControllerHandleAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v5, "photosViewControllerDismiss:", self) & 1) == 0)
    -[PXPhotosUIViewController modalDismiss:](self, "modalDismiss:", v6);

}

- (id)popoverPresentationEnvironmentForPhotosCloseButtonController:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController _popoverPresentationEnvironmentWithSourceItem:](self, "_popoverPresentationEnvironmentWithSourceItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_viewControllerForPresentationEnvironment
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosUIViewController containerViewController](self, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (id)_defaultPresentationEnvironment
{
  void *v2;
  void *v3;

  -[PXPhotosUIViewController _viewControllerForPresentationEnvironment](self, "_viewControllerForPresentationEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_popoverPresentationEnvironmentWithSourceItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotosUIViewController _viewControllerForPresentationEnvironment](self, "_viewControllerForPresentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXGridPresentationBarsUpdateDelegate)gridPresentationBarsUpdateDelegate
{
  return (PXGridPresentationBarsUpdateDelegate *)objc_loadWeakRetained((id *)&self->_gridPresentationBarsUpdateDelegate);
}

- (void)setGridPresentationBarsUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_gridPresentationBarsUpdateDelegate, a3);
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (unint64_t)allowedInteractiveDismissBehaviors
{
  return self->_allowedInteractiveDismissBehaviors;
}

- (PXPhotosDragController)emptyPlaceholderDragController
{
  return self->_emptyPlaceholderDragController;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PXAssetSelectionUserActivityController)userActivityController
{
  return self->_userActivityController;
}

- (PXViewControllerDismissalInteractionController)dismissalInteractionController
{
  return self->_dismissalInteractionController;
}

- (PXSplitViewController)observedSplitViewController
{
  return (PXSplitViewController *)objc_loadWeakRetained((id *)&self->_observedSplitViewController);
}

- (PXProgrammaticNavigationRequest)pendingInitialNavigationRequest
{
  return self->_pendingInitialNavigationRequest;
}

- (void)setPendingInitialNavigationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInitialNavigationRequest, a3);
}

- (BOOL)hasScrolledToInitialPosition
{
  return self->_hasScrolledToInitialPosition;
}

- (void)setHasScrolledToInitialPosition:(BOOL)a3
{
  self->_hasScrolledToInitialPosition = a3;
}

- (BOOL)shouldScrollToInitialPositionAfterUnlock
{
  return self->_shouldScrollToInitialPositionAfterUnlock;
}

- (void)setShouldScrollToInitialPositionAfterUnlock:(BOOL)a3
{
  self->_shouldScrollToInitialPositionAfterUnlock = a3;
}

- (PXAssetReference)preferredFocusAssetReference
{
  return self->_preferredFocusAssetReference;
}

- (void)setPreferredFocusAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFocusAssetReference, a3);
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setBoopableItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, a3);
}

- (PXStatusController)placeholderStatusController
{
  return self->_placeholderStatusController;
}

- (void)setPlaceholderStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderStatusController, a3);
}

- (PXPhotosGridPlaceholderStatusController)fallbackPlaceholderStatusController
{
  return self->_fallbackPlaceholderStatusController;
}

- (void)setFallbackPlaceholderStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackPlaceholderStatusController, a3);
}

- (BOOL)isShowingInitialLoadingPlaceholder
{
  return self->_showingInitialLoadPlaceholder;
}

- (PXSecondaryToolbarController)secondaryToolbarController
{
  return self->_secondaryToolbarController;
}

- (void)setSecondaryToolbarController:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryToolbarController, a3);
}

- (UIView)fullscreenOverlay
{
  return self->_fullscreenOverlay;
}

- (PXGItemPlacement)placementOverride
{
  return self->_placementOverride;
}

- (UIColor)backgroundColorBeforeOverride
{
  return self->_backgroundColorBeforeOverride;
}

- (void)setBackgroundColorBeforeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorBeforeOverride, a3);
}

- (PXPhotosViewConfiguration)configuration
{
  return self->_configuration;
}

- (PXPhotosBarsController)barsController
{
  return self->_barsController;
}

- (PXScrollBehavior)scrollBehavior
{
  return self->_scrollBehavior;
}

- (void)setScrollBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_scrollBehavior, a3);
}

- (double)secondaryToolbarAlpha
{
  return self->_secondaryToolbarAlpha;
}

- (UIView)alternateContentView
{
  return self->_alternateContentView;
}

- (id)explicitRepresentedItem
{
  return self->_explicitRepresentedItem;
}

- (void)setExplicitRepresentedItem:(id)a3
{
  objc_storeStrong(&self->_explicitRepresentedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_explicitRepresentedItem, 0);
  objc_storeStrong((id *)&self->_alternateContentView, 0);
  objc_storeStrong((id *)&self->_scrollBehavior, 0);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_backgroundColorBeforeOverride, 0);
  objc_storeStrong((id *)&self->_placementOverride, 0);
  objc_storeStrong((id *)&self->_fullscreenOverlay, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarController, 0);
  objc_storeStrong((id *)&self->_fallbackPlaceholderStatusController, 0);
  objc_storeStrong((id *)&self->_placeholderStatusController, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_preferredFocusAssetReference, 0);
  objc_storeStrong((id *)&self->_pendingInitialNavigationRequest, 0);
  objc_destroyWeak((id *)&self->_observedSplitViewController);
  objc_storeStrong((id *)&self->_dismissalInteractionController, 0);
  objc_storeStrong((id *)&self->_userActivityController, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderDragController, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_toolbarBackdropGroupName, 0);
  objc_destroyWeak((id *)&self->_gridPresentationBarsUpdateDelegate);
  objc_storeStrong((id *)&self->_closeButtonController, 0);
  objc_storeStrong((id *)&self->_statusButtonController, 0);
  objc_storeStrong((id *)&self->_filterButtonController, 0);
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_selectedAssetsAssetCollectionActionManager, 0);
}

uint64_t __51__PXPhotosUIViewController__handleDidEndScrolling___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLastPreferredScrollDetent:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__PXPhotosUIViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewController");
}

void __70__PXPhotosUIViewController_presentationEnvironmentForActionPerformer___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  uint64_t v3;
  void *v4;
  void *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  _OWORD v22[2];

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(_QWORD *)(v3 + 40) = 0;

    *a3 = 1;
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a2[1];
  v22[0] = *a2;
  v22[1] = v9;
  objc_msgSend(v8, "objectReferenceAtIndexPath:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("PXPhotosUIViewController.m"), 2280, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]"), v17);
LABEL_9:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 40);
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("PXPhotosUIViewController.m"), 2280, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]"), v17, v21);

    goto LABEL_9;
  }
LABEL_5:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __87__PXPhotosUIViewController_menuForPXAssetCollectionActionTypeTTRForLemonadeCollections__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __74__PXPhotosUIViewController__completeNavigationToDestination_result_error___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    PLGridZeroGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotosUIViewController: Cinematic local asset rendering did not complete: It failed or was cancelled.", v3, 2u);
    }

  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id WeakRetained;
  id v7;

  v5 = (id *)(a1 + 48);
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_completeNavigationToDestination:result:error:", *(_QWORD *)(a1 + 32), a2, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "hasSharedLibraryOrPreview"))
    {
      objc_msgSend(*(id *)(a1 + 32), "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "libraryFilterState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "viewMode") != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_315(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 72);
    v7 = (*(_QWORD *)(a1 + 80) >> 1) & 1;
    v8 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_316;
    v18[3] = &unk_1E51350E8;
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v21 = v9;
    v18[4] = v10;
    v19 = v11;
    v20 = v5;
    v22 = v7;
    objc_msgSend(v8, "_waitUntilOneUpPresentationCanStartAnimated:completionHandler:", v7, v18);

  }
  else if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 40), "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "libraryFilterState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setViewMode:", 0);

    objc_msgSend(*(id *)(a1 + 40), "navigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Photos view %@ timed out waiting for asset %@ to go to 1-up for navigation destination %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_4_326(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_327;
    v14[3] = &unk_1E5140638;
    v16 = *(id *)(a1 + 72);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v6, "scrollToRevealAsset:completionHandler:", v7, v14);

  }
  else if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 40), "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryFilterState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setViewMode:", 0);

    objc_msgSend(*(id *)(a1 + 40), "navigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Photos view %@ timed out waiting for asset %@ to reveal navigation destination %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_330(uint64_t a1, char a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("failed to scroll to initial position"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, 5, v3);

  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_327(uint64_t a1, char a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("failed to scroll to reveal asset %@"), *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, 5, v3);

  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_316(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  char v15;

  if ((a2 & 1) != 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "wantsEditMode");
    objc_msgSend(*(id *)(a1 + 40), "completionKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "interaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_320;
    v12[3] = &unk_1E51350C0;
    v15 = *(_BYTE *)(a1 + 64);
    v13 = v4;
    v14 = v3;
    v10 = v4;
    LOBYTE(v6) = objc_msgSend(v5, "presentOneUpForAssetReference:configurationHandler:", v6, v12);

    v7 = *(_QWORD *)(a1 + 56);
    if ((v6 & 1) != 0)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v7 + 16))(*(_QWORD *)(a1 + 56), 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("failed to present 1-up for %@"), *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 5, v9);

    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("unable to present 1-up from %@"), *(_QWORD *)(a1 + 32));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, 5, v11);

  }
}

void __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2_320(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setAnimated:", v3);
  objc_msgSend(v4, "setActivity:", *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3_321;
  v5[3] = &unk_1E5149198;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setActivityCompletion:", v5);

}

void *__76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_3_321(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)notify_post((const char *)objc_msgSend(objc_retainAutorelease(result), "UTF8String"));
  return result;
}

uint64_t __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSortOrder:", 2);
}

uint64_t __76__PXPhotosUIViewController_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetToInitialSelectionAndFilteringState");
}

void __57__PXPhotosUIViewController_resetToInitialStateIfPossible__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  id v4;

  v4 = a2;
  v2 = (double)objc_msgSend(v4, "defaultZoomStep");
  objc_msgSend(v4, "zoomStep");
  if (v3 != v2)
    objc_msgSend(v4, "setZoomStep:isInteractive:shouldAnimate:anchorAssetReference:", 0, 0, 0, v2);
  objc_msgSend(v4, "signalChange:", 0x400000000000000);

}

void __40__PXPhotosUIViewController_visibleUUIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __45__PXPhotosUIViewController_cancelSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsInSelectMode:", 0);
}

uint64_t __40__PXPhotosUIViewController_deselectAll___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

void __38__PXPhotosUIViewController_selectAll___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "attemptSetInSelectMode:", 1))
    objc_msgSend(v2, "selectAll");

}

void __34__PXPhotosUIViewController_paste___block_invoke(uint64_t a1, char a2, void *a3)
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
    PLGridZeroGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Paste of assets failed with error:%@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __86__PXPhotosUIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackButtonBehavior");
}

uint64_t __45__PXPhotosUIViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppearState:", 0);
}

uint64_t __46__PXPhotosUIViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppearState:", 3);
}

uint64_t __42__PXPhotosUIViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppearState:", 2);
}

uint64_t __44__PXPhotosUIViewController_viewIsAppearing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppearState:", 1);
}

void __61__PXPhotosUIViewController__scrollToInitialPositionAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentViewDidScrollToInitialPosition");

}

void __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  _QWORD v8[5];

  v5 = a3;
  if (a2 == 1 && objc_msgSend(a1[4], "revealMode"))
  {
    objc_msgSend(a1[5], "contentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentViewDidScrollToInitialPosition");
  }
  else
  {
    objc_msgSend(a1[5], "contentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke_2;
    v8[3] = &unk_1E5147360;
    v8[4] = a1[5];
    objc_msgSend(v6, "scrollToInitialPositionAnimated:withCompletionHandler:", 0, v8);
  }

  objc_msgSend(a1[6], "completionHandler");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, id))v7)[2](v7, a2, v5);

}

void __63__PXPhotosUIViewController__scrollToInitialPositionIfNecessary__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentViewDidScrollToInitialPosition");

}

void __53__PXPhotosUIViewController__createPlayAsMemoryButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playCollectionAsMemory");

}

void __45__PXPhotosUIViewController__createSortButton__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PXCollectionSortOrderMenuBuilder sortOrderMenuActionsForCollection:](PXCollectionSortOrderMenuBuilder, "sortOrderMenuActionsForCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);

  }
}

void __85__PXPhotosUIViewController__createButtonForScrollingToNeighboringSectionInDirection___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollToNeighboringSectionInDirection:animated:", *(_QWORD *)(a1 + 40), 1);

}

void __39__PXPhotosUIViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateBackgroundColor");

}

uint64_t __39__PXPhotosUIViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setKeepsTabBarAlwaysHidden:", 1);
}

void __39__PXPhotosUIViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setCplActionManagerClass:", objc_opt_class());

}

uint64_t __39__PXPhotosUIViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewBasedDecorationsEnabled:", 1);
}

uint64_t __83__PXPhotosUIViewController_setShouldAlwaysRespectToolbarActionPlacementPreference___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldAlwaysRespectToolbarActionPlacementPreference:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __44__PXPhotosUIViewController_setHidesToolbar___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidesToolbar:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __43__PXPhotosUIViewController_setHidesNavbar___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidesNavbar:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __53__PXPhotosUIViewController__dismissOnInternalRequest__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDismissRequested:", 0);
}

id __53__PXPhotosUIViewController__dismissOnInternalRequest__block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", CFSTR("PXPhotosUIViewController"), 1.0);
}

uint64_t __76__PXPhotosUIViewController__presentOneUpForSingleSelectedAssetWithActivity___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivity:", *(_QWORD *)(a1 + 32));
}

void __77__PXPhotosUIViewController__updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "privacyController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "performUserAuthenticationIfNeededFromContext:", v3);

}

uint64_t __52__PXPhotosUIViewController_setAlternateContentView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShowingAlternateContent:", *(unsigned __int8 *)(a1 + 32));
}

+ (void)configureOpacityOfSecondaryToolbarController:(id)a3 withViewModel:(id)a4
{
  objc_msgSend(a1, "_configureOpacityOfSecondaryToolbarController:withViewModel:secondaryToolbarAlpha:", a3, a4, 1.0);
}

+ (void)_configureOpacityOfSecondaryToolbarController:(id)a3 withViewModel:(id)a4 secondaryToolbarAlpha:(double)a5
{
  id v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "chromeOpacity");
  else
    v9 = 1.0;
  objc_msgSend(v10, "setAlpha:", v9 * a5);
  objc_msgSend(v10, "setShouldAlwaysBeConsideredVisibleForLayoutPurpose:", ((unint64_t)objc_msgSend(v8, "chromeItemsToBeConsideredVisibleForLayoutPurpose") >> 5) & 1);

}

+ (BOOL)shouldReconfigureOpacityOfSecondaryToolbarControllerForViewModelChange:(unint64_t)a3
{
  return (a3 >> 61) & 1;
}

+ (id)_roundedButtonConfigurationWithSymbolName:(id)a3 inset:(double)a4 fontSize:(double)a5 weight:(int64_t)a6 groupName:(id)a7
{
  return (id)objc_msgSend(a1, "_roundedButtonConfigurationWithSymbolName:useOriginalSymbolAppearance:inset:fontSize:weight:groupName:", a3, 0, a6, a7, a4, a5);
}

+ (id)_roundedButtonConfigurationWithSymbolName:(id)a3 useOriginalSymbolAppearance:(BOOL)a4 inset:(double)a5 fontSize:(double)a6 weight:(int64_t)a7 groupName:(id)a8
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v13 = a3;
  v14 = (void *)MEMORY[0x1E0DC3520];
  v15 = a8;
  objc_msgSend(v14, "grayButtonConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", a7, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:withConfiguration:", v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!a4)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithTintColor:renderingMode:", v19, 1);
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v20;
  }
LABEL_4:
  objc_msgSend(v16, "setImage:", v18);
  objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setVisualEffectGroupName:", v15);

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setVisualEffect:", v22);

  objc_msgSend(v16, "setBackground:", v21);
  objc_msgSend(v16, "setContentInsets:", a5, a5, a5, a5);
  objc_msgSend(v16, "setCornerStyle:", 4);

  return v16;
}

- (void)ppt_navigateToAsset:(id)a3 inAssetContainer:(id)a4 revealInOneUp:(BOOL)a5 completionHandler:(id)a6
{
  -[PXPhotosUIViewController navigateToAsset:inAssetContainer:revealInOneUp:animated:completionHandler:](self, "navigateToAsset:inAssetContainer:revealInOneUp:animated:completionHandler:", a3, a4, a5, 1, a6);
}

- (id)ppt_navigateToBottom
{
  -[PXPhotosUIViewController scrollToBottomAnimated:](self, "scrollToBottomAnimated:", 0);
  return -[PXPhotosUIViewController assetReferenceForCurrentScrollPosition](self, "assetReferenceForCurrentScrollPosition");
}

- (id)ppt_scrollToPreviousAssetOfAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v6 = a3;
  v7 = a4;
  -[PXPhotosUIViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  if (v9)
    objc_msgSend(v9, "indexPathForAssetReference:", v6);
  -[PXPhotosUIViewController contentController](self, "contentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v14[0] = v17;
    v14[1] = v18;
    objc_msgSend(v10, "selectableIndexPathClosestToIndexPath:inDirection:", v14, 6);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  v17 = v15;
  v18 = v16;

  v15 = v17;
  v16 = v18;
  objc_msgSend(v9, "assetReferenceAtItemIndexPath:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosUIViewController scrollToCenterAssetReference:completion:](self, "scrollToCenterAssetReference:completion:", v12, v7);

  return v12;
}

- (void)ppt_navigateToAssetReference:(id)a3 revealInOneUp:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__PXPhotosUIViewController_PPT__ppt_navigateToAssetReference_revealInOneUp_completionHandler___block_invoke;
  v13[3] = &unk_1E5142E28;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  -[PXPhotosUIViewController ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:](self, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:", v10, v11, v5, v13);

}

void __94__PXPhotosUIViewController_PPT__ppt_navigateToAssetReference_revealInOneUp_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = 0;
  v11 = v5;
  if (a2 == 1 && !v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "topViewController");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = v8;
      }
      v10 = v9;

      v6 = v10;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
