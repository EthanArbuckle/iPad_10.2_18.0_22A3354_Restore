@implementation VideosExtrasPresenter

- (VideosExtrasPresenter)initWithExtrasContext:(id)a3 extrasMenuBarFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  VideosExtrasPresenter *v11;
  VideosExtrasPresenter *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasPresenter;
  v11 = -[VideosExtrasPresenter init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extrasContext, a3);
    v12->_extrasMenuBarFrame.origin.x = x;
    v12->_extrasMenuBarFrame.origin.y = y;
    v12->_extrasMenuBarFrame.size.width = width;
    v12->_extrasMenuBarFrame.size.height = height;
    objc_msgSend(v10, "extrasRootViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setModalPresentationStyle:", 4);

    objc_msgSend(v10, "extrasRootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTransitioningDelegate:", v12);

  }
  return v12;
}

- (void)presentExtrasWith:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (!v10)
    {
      -[VideosExtrasPresenter extrasContext](self, "extrasContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "extrasRootViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setIgnoreAppSupportedOrientations:", 1);

    }
    -[VideosExtrasPresenter extrasContext](self, "extrasContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extrasRootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v14, v6, v8);

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)dismissExtrasAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);

  v4 = a3;
  v12 = (void (**)(void))a4;
  -[VideosExtrasPresenter extrasContext](self, "extrasContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extrasRootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VideosExtrasPresenter extrasContext](self, "extrasContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extrasRootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v4, v12);

  }
  else if (v12)
  {
    v12[2]();
  }

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[VideosTransitionFadeAnimator initWithTransitionType:andDuration:]([VideosTransitionFadeAnimator alloc], "initWithTransitionType:andDuration:", 0, 0.3);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[VideosTransitionFadeAnimator initWithTransitionType:andDuration:]([VideosTransitionFadeAnimator alloc], "initWithTransitionType:andDuration:", 1, 0.3);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  VideosExtrasPresentationController *v9;
  void *v10;
  void *v11;
  void *v12;
  VideosExtrasPresentationController *v13;

  v7 = a4;
  v8 = a3;
  v9 = [VideosExtrasPresentationController alloc];
  -[VideosExtrasPresenter extrasContext](self, "extrasContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extrasRootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extrasMenuBarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasPresenter extrasMenuBarFrame](self, "extrasMenuBarFrame");
  v13 = -[VideosExtrasPresentationController initWithPresentedViewController:presentingViewController:extrasMenuBarView:extrasmenuBarFrame:](v9, "initWithPresentedViewController:presentingViewController:extrasMenuBarView:extrasmenuBarFrame:", v8, v7, v12);

  return v13;
}

- (VideosExtrasContext)extrasContext
{
  return self->_extrasContext;
}

- (void)setExtrasContext:(id)a3
{
  objc_storeStrong((id *)&self->_extrasContext, a3);
}

- (CGRect)extrasMenuBarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_extrasMenuBarFrame.origin.x;
  y = self->_extrasMenuBarFrame.origin.y;
  width = self->_extrasMenuBarFrame.size.width;
  height = self->_extrasMenuBarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExtrasMenuBarFrame:(CGRect)a3
{
  self->_extrasMenuBarFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extrasContext, 0);
}

@end
