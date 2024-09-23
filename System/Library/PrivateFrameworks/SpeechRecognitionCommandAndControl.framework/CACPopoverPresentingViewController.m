@implementation CACPopoverPresentingViewController

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CACPopoverPresentingViewController setView:](self, "setView:", v4);
}

- (void)viewDidAppear:(BOOL)a3
{
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
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CACPopoverPresentingViewController;
  -[CACPopoverPresentingViewController viewDidAppear:](&v19, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BEBD860], "_setAlwaysAllowPopoverPresentations:", 1);
  -[CACPopoverPresentingViewController viewControllerInPopover](self, "viewControllerInPopover");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModalPresentationStyle:", 7);

  -[CACPopoverPresentingViewController viewControllerInPopover](self, "viewControllerInPopover");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACPopoverPresentingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceView:", v7);

  -[CACPopoverPresentingViewController portraitUpSourceRect](self, "portraitUpSourceRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CACPopoverPresentingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceRect:", CACViewRectFromPortraitUpRect(v16, v9, v11, v13, v15));

  objc_msgSend(v6, "setCanOverlapSourceViewRect:", 1);
  -[CACPopoverPresentingViewController popoverPresentationDelegate](self, "popoverPresentationDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v17);

  objc_msgSend(v6, "setPermittedArrowDirections:", -[CACPopoverPresentingViewController permittedArrowDirections](self, "permittedArrowDirections"));
  -[CACPopoverPresentingViewController viewControllerInPopover](self, "viewControllerInPopover");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACPopoverPresentingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD860], "_setAlwaysAllowPopoverPresentations:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CACPopoverPresentingViewController;
  -[CACPopoverPresentingViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  -[CACPopoverPresentingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIPopoverPresentationControllerDelegate)popoverPresentationDelegate
{
  return (UIPopoverPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_popoverPresentationDelegate);
}

- (void)setPopoverPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_popoverPresentationDelegate, a3);
}

- (UIViewController)viewControllerInPopover
{
  return self->_viewControllerInPopover;
}

- (void)setViewControllerInPopover:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerInPopover, a3);
}

- (CGRect)portraitUpSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_portraitUpSourceRect.origin.x;
  y = self->_portraitUpSourceRect.origin.y;
  width = self->_portraitUpSourceRect.size.width;
  height = self->_portraitUpSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPortraitUpSourceRect:(CGRect)a3
{
  self->_portraitUpSourceRect = a3;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerInPopover, 0);
  objc_destroyWeak((id *)&self->_popoverPresentationDelegate);
}

@end
