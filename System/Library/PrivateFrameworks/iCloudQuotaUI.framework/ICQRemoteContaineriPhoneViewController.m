@implementation ICQRemoteContaineriPhoneViewController

- (ICQRemoteContaineriPhoneViewController)init
{
  return -[ICQRemoteContaineriPhoneViewController initWithRootViewController:](self, "initWithRootViewController:", 0);
}

- (ICQRemoteContaineriPhoneViewController)initWithRootViewController:(id)a3
{
  ICQRemoteContaineriPhoneViewController *v3;
  ICQRemoteContaineriPhoneViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  v3 = -[ICQRemoteContainerViewController initWithRootViewController:](&v6, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
  {
    -[ICQRemoteContaineriPhoneViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 4);
    -[ICQRemoteContaineriPhoneViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4);
  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  -[ICQRemoteContaineriPhoneViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[ICQRemoteContaineriPhoneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  -[ICQRemoteContaineriPhoneViewController viewWillAppear:](&v25, sel_viewWillAppear_, a3);
  if (-[ICQRemoteContaineriPhoneViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[ICQRemoteContainerViewController rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSize");
    v6 = v5;
    v8 = v7;

    -[ICQRemoteContaineriPhoneViewController _dismissalFrameForContentSize:](self, "_dismissalFrameForContentSize:", v6, v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[ICQRemoteContainerViewController rootViewController](self, "rootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "viewIfLoaded");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    -[ICQRemoteContainerViewController rootViewController](self, "rootViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "viewIfLoaded");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutIfNeeded");

    -[ICQRemoteContaineriPhoneViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v22);

    -[ICQRemoteContaineriPhoneViewController transitionCoordinator](self, "transitionCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __57__ICQRemoteContaineriPhoneViewController_viewWillAppear___block_invoke;
    v24[3] = &unk_24E3F4438;
    v24[4] = self;
    *(double *)&v24[5] = v6;
    *(double *)&v24[6] = v8;
    objc_msgSend(v23, "animateAlongsideTransition:completion:", v24, 0);

  }
}

void __57__ICQRemoteContaineriPhoneViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setContainerContentSize:animated:", objc_msgSend(a2, "isAnimated"), *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.800000012);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  -[ICQRemoteContaineriPhoneViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (-[ICQRemoteContaineriPhoneViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[ICQRemoteContaineriPhoneViewController transitionCoordinator](self, "transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __60__ICQRemoteContaineriPhoneViewController_viewWillDisappear___block_invoke;
    v5[3] = &unk_24E3F4460;
    v5[4] = self;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

  }
}

void __60__ICQRemoteContaineriPhoneViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "containerContentSize");
  objc_msgSend(v2, "_dismissalFrameForContentSize:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewIfLoaded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewIfLoaded");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

}

- (void)setContainerContentSize:(CGSize)a3
{
  -[ICQRemoteContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1, a3.width, a3.height);
}

- (void)setContainerContentSize:(CGSize)a3 animated:(BOOL)a4
{
  double height;
  double width;
  CGSize *p_containerContentSize;
  _BOOL8 v8;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  p_containerContentSize = &self->_containerContentSize;
  if (self->_containerContentSize.width != a3.width || self->_containerContentSize.height != a3.height)
  {
    v8 = a4;
    -[ICQRemoteContaineriPhoneViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v21.origin.x = v12;
    v21.origin.y = v14;
    v21.size.width = v16;
    v21.size.height = v18;
    v19 = CGRectGetWidth(v21);
    if (v19 < width)
      width = v19;
    v22.origin.x = v12;
    v22.origin.y = v14;
    v22.size.width = v16;
    v22.size.height = v18;
    v20 = CGRectGetHeight(v22);
    if (v20 >= height)
      v20 = height;
    p_containerContentSize->width = width;
    p_containerContentSize->height = v20;
    -[ICQRemoteContaineriPhoneViewController _layoutContainerView:](self, "_layoutContainerView:", v8);
  }
}

- (void)_layoutContainerView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;

  v3 = a3;
  -[ICQRemoteContainerViewController rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICQRemoteContaineriPhoneViewController containerContentSize](self, "containerContentSize");
    -[ICQRemoteContaineriPhoneViewController _layoutFrameForContentSize:](self, "_layoutFrameForContentSize:");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "frame");
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    if (!CGRectEqualToRect(v25, v26))
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__ICQRemoteContaineriPhoneViewController__layoutContainerView___block_invoke;
      aBlock[3] = &unk_24E3F4488;
      v20 = v6;
      v21 = v8;
      v22 = v10;
      v23 = v12;
      v24 = v14;
      v15 = _Block_copy(aBlock);
      v16 = v15;
      if (v3)
      {
        v17 = objc_alloc_init(MEMORY[0x24BEBD970]);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB20]), "initWithDuration:timingParameters:", v17, 0.35);
        objc_msgSend(v18, "addAnimations:", v16);
        objc_msgSend(v18, "startAnimation");

      }
      else
      {
        (*((void (**)(void *))v15 + 2))(v15);
      }

    }
  }

}

uint64_t __63__ICQRemoteContaineriPhoneViewController__layoutContainerView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)_layoutFrameForContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[ICQRemoteContaineriPhoneViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    x = v17.origin.x;
    y = v17.origin.y;
    v9 = v17.size.width;
    v10 = v17.size.height;
    v11 = (CGRectGetWidth(v17) - width) * 0.5;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = v9;
    v18.size.height = v10;
    v12 = CGRectGetHeight(v18) - height;
  }
  else
  {
    v11 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v13 = v11;
  v14 = v12;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_dismissalFrameForContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[ICQRemoteContaineriPhoneViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v7 = CGRectGetHeight(v13);
    v8 = 0.0;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v9 = v8;
  v10 = v7;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  -[ICQRemoteContaineriPhoneViewController preferredContentSizeDidChangeForChildContentContainer:](&v10, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  if ((-[ICQRemoteContaineriPhoneViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    -[ICQRemoteContainerViewController rootViewController](self, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v4)
    {
      objc_msgSend(v4, "transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __96__ICQRemoteContaineriPhoneViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
        v7[3] = &unk_24E3F44F0;
        v7[4] = self;
        v8 = v4;
        v9 = &__block_literal_global_11;
        objc_msgSend(v6, "animateAlongsideTransition:completion:", v7);

      }
      else
      {
        objc_msgSend(v4, "preferredContentSize");
        -[ICQRemoteContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1);
      }

    }
  }

}

void __96__ICQRemoteContaineriPhoneViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

}

void __96__ICQRemoteContaineriPhoneViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v7 = a2;
  objc_msgSend(v4, "preferredContentSize");
  objc_msgSend(v3, "setContainerContentSize:animated:", objc_msgSend(v7, "isAnimated"), v5, v6);
  (*(void (**)(void))(a1[6] + 16))();

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
  v9.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  v7 = a4;
  -[ICQRemoteContaineriPhoneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__ICQRemoteContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24E3F4460;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __93__ICQRemoteContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutContainerView:", objc_msgSend(a2, "isAnimated"));
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[ICQRemoteContainerViewControllerAnimator initWithPresenting:]([ICQRemoteContainerViewControllerAnimator alloc], "initWithPresenting:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[ICQRemoteContainerViewControllerAnimator initWithPresenting:]([ICQRemoteContainerViewControllerAnimator alloc], "initWithPresenting:", 0);
}

- (CGSize)containerContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerContentSize.width;
  height = self->_containerContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
