@implementation PearlIDAboutController

- (PearlIDAboutController)initWithTitle:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  PearlIDAboutController *v8;
  PearlIDAboutController *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PearlIDAboutController;
  v8 = -[PearlIDAboutController init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PearlIDAboutController setTitle:](v8, "setTitle:", v6);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel_backgrounded_, *MEMORY[0x24BEBDF98], 0);

    v11 = objc_alloc(MEMORY[0x24BEBDA88]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v12, "setText:", v7);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    objc_msgSend(v12, "setEditable:", 0);
    objc_msgSend(v12, "textContainerInset");
    objc_msgSend(v12, "setContentOffset:animated:", 0, 0.0, -v14);
    -[PearlIDAboutController setView:](v9, "setView:", v12);
    -[PearlIDAboutController navigationItem](v9, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v9, sel_donePressed);
    objc_msgSend(v15, "setRightBarButtonItem:", v16);

  }
  return v9;
}

- (void)backgrounded:(id)a3
{
  id v3;

  -[PearlIDAboutController parentViewController](self, "parentViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)donePressed
{
  id v2;

  -[PearlIDAboutController parentViewController](self, "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
