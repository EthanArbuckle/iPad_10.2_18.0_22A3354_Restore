@implementation CACCorrectionsPresentationViewController

- (CACCorrectionsPresentationViewController)init
{
  CACCorrectionsPresentationViewController *v2;
  CACCorrectionsCandidatesViewController *v3;
  CACPopoverPresentingViewController *v4;
  void *v5;
  CACCorrectionsCandidatesViewController *correctionViewController;
  CACCorrectionsCandidatesViewController *v7;
  CACPopoverPresentingViewController *popoverPresentingViewController;
  CACPopoverPresentingViewController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CACCorrectionsPresentationViewController;
  v2 = -[CACCorrectionsPresentationViewController init](&v11, sel_init);
  if (v2)
  {
    v3 = (CACCorrectionsCandidatesViewController *)objc_opt_new();
    -[CACCorrectionsCandidatesViewController setDelegate:](v3, "setDelegate:", v2);
    v4 = (CACPopoverPresentingViewController *)objc_opt_new();
    -[CACPopoverPresentingViewController setPopoverPresentationDelegate:](v4, "setPopoverPresentationDelegate:", v2);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v3);
    objc_msgSend(v5, "setNavigationBarHidden:", 1);
    -[CACPopoverPresentingViewController setViewControllerInPopover:](v4, "setViewControllerInPopover:", v5);
    -[CACPopoverPresentingViewController setPermittedArrowDirections:](v4, "setPermittedArrowDirections:", 3);
    correctionViewController = v2->_correctionViewController;
    v2->_correctionViewController = v3;
    v7 = v3;

    popoverPresentingViewController = v2->_popoverPresentingViewController;
    v2->_popoverPresentingViewController = v4;
    v9 = v4;

    -[CACCorrectionsPresentationViewController addChildViewController:](v2, "addChildViewController:", v9);
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CACCorrectionsPresentationViewController;
  -[CACCorrectionsPresentationViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[CACCorrectionsPresentationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsPresentationViewController popoverPresentingViewController](self, "popoverPresentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);

  -[CACCorrectionsPresentationViewController popoverPresentingViewController](self, "popoverPresentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", self);

}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACCorrectionsPresentationViewController correctionViewController](self, "correctionViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSArray)alternatives
{
  void *v2;
  void *v3;

  -[CACCorrectionsPresentationViewController correctionViewController](self, "correctionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternatives");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setAlternatives:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACCorrectionsPresentationViewController correctionViewController](self, "correctionViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlternatives:", v4);

}

- (NSArray)emojis
{
  void *v2;
  void *v3;

  -[CACCorrectionsPresentationViewController correctionViewController](self, "correctionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emojis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setEmojis:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACCorrectionsPresentationViewController correctionViewController](self, "correctionViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEmojis:", v4);

}

- (void)setPortraitUpSourceRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CACCorrectionsPresentationViewController popoverPresentingViewController](self, "popoverPresentingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPortraitUpSourceRect:", x, y, width, height);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  NSLog(CFSTR("tiger: popover dismissed"), a2, a3);
  -[CACCorrectionsPresentationViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissCorrectionsPresentationViewController:", self);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 7;
}

- (void)correctionsCandidatesViewController:(id)a3 didSelectItemWithText:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CACCorrectionsPresentationViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "correctionsPresentationViewController:didSelectItemWithText:", self, v5);

}

- (void)dismissCorrectionsCandidatesViewController:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CACCorrectionsPresentationViewController popoverPresentingViewController](self, "popoverPresentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__CACCorrectionsPresentationViewController_dismissCorrectionsCandidatesViewController___block_invoke;
  v5[3] = &unk_24F2AA860;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __87__CACCorrectionsPresentationViewController_dismissCorrectionsCandidatesViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissCorrectionsPresentationViewController:", *(_QWORD *)(a1 + 32));

}

- (int64_t)zOrder
{
  return 5;
}

- (BOOL)isOverlay
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCorrectionsPresentationDelegate)delegate
{
  return (CACCorrectionsPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)text
{
  return self->_text;
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

- (CACPopoverPresentingViewController)popoverPresentingViewController
{
  return self->_popoverPresentingViewController;
}

- (void)setPopoverPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverPresentingViewController, a3);
}

- (CACCorrectionsCandidatesViewController)correctionViewController
{
  return self->_correctionViewController;
}

- (void)setCorrectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_correctionViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionViewController, 0);
  objc_storeStrong((id *)&self->_popoverPresentingViewController, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
