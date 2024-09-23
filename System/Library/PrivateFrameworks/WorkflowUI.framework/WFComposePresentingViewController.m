@implementation WFComposePresentingViewController

- (WFComposePresentingViewController)initWithComposeViewController:(id)a3
{
  id v5;
  WFComposePresentingViewController *v6;
  WFComposePresentingViewController *v7;
  WFComposePresentingViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFComposePresentingViewController;
  v6 = -[WFComposePresentingViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[WFComposePresentingViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 0);
    objc_msgSend(v5, "setPresenter:", v7);
    objc_storeStrong((id *)&v7->_composeViewController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFComposePresentingViewController;
  -[WFComposePresentingViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[WFComposePresentingViewController addChildViewController:](self, "addChildViewController:", self->_composeViewController);
  -[WFComposePresentingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WFComposeViewController view](self->_composeViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[WFComposeViewController view](self->_composeViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 18);

  -[WFComposePresentingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController view](self->_composeViewController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[WFComposeViewController didMoveToParentViewController:](self->_composeViewController, "didMoveToParentViewController:", self);
  -[WFComposePresentingViewController presentationController](self, "presentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[WFComposeViewController didTapDone](self->_composeViewController, "didTapDone", a3);
}

- (WFComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);
}

@end
