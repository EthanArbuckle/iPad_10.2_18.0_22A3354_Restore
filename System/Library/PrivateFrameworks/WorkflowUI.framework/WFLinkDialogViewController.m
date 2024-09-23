@implementation WFLinkDialogViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIViewController *v7;
  UIViewController *snippetViewController;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFLinkDialogViewController;
  -[WFLinkDialogViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPurpleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[WFCompactDialogViewController request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewSnippet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__WFLinkDialogViewController_viewDidLoad__block_invoke;
  v9[3] = &unk_24E6046F0;
  v9[4] = self;
  objc_msgSend(v6, "viewControllerWithTapHandler:", v9);
  v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v7);
  snippetViewController = self->_snippetViewController;
  self->_snippetViewController = v7;

}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[WFLinkDialogViewController snippetViewController](self, "snippetViewController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;

  return v7;
}

- (id)snippetInteractedResponseWithURL:(id)a3
{
  return 0;
}

- (UIViewController)snippetViewController
{
  return self->_snippetViewController;
}

- (void)setSnippetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_snippetViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetViewController, 0);
}

void __41__WFLinkDialogViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "snippetInteractedResponseWithURL:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "finishWithResponse:", v3);
    v3 = v4;
  }

}

@end
