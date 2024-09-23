@implementation SiriSharedUIViewStackContainerController

- (void)loadView
{
  SiriSharedUIViewStackContainer *v3;
  SiriSharedUIViewStackContainer *v4;

  v3 = [SiriSharedUIViewStackContainer alloc];
  v4 = -[SiriSharedUIViewStackContainer initWithFrame:contentViews:](v3, "initWithFrame:contentViews:", MEMORY[0x1E0C9AA60], *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SiriSharedUIViewStackContainer setDelegate:](v4, "setDelegate:", self);
  -[SiriSharedUIViewStackContainerController setView:](self, "setView:", v4);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUIViewStackContainerController;
  v6 = a4;
  -[SiriSharedUIViewStackContainerController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__SiriSharedUIViewStackContainerController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1EA89CE40;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

}

void __102__SiriSharedUIViewStackContainerController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewStackContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "relayout");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUIViewStackContainerController;
  v7 = a4;
  -[SiriSharedUIViewStackContainerController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__SiriSharedUIViewStackContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1EA89CE40;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __95__SiriSharedUIViewStackContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewStackContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateConstraints");

}

- (SiriSharedUIViewStackContainer)viewStackContainer
{
  void *v2;
  void *v3;
  SiriSharedUIViewStackContainer *v4;

  -[SiriSharedUIViewStackContainerController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)viewStackContainer:(id)a3 willBeginHostingChildViewController:(id)a4
{
  -[SiriSharedUIViewStackContainerController addChildViewController:](self, "addChildViewController:", a4);
}

- (void)viewStackContainer:(id)a3 didBeginHostingChildViewController:(id)a4
{
  objc_msgSend(a4, "didMoveToParentViewController:", self);
}

- (BOOL)_canShowWhileLocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DA7A40], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSiriSafeForLockScreen");

  return v3;
}

@end
