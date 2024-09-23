@implementation PSAboutTextSheetViewController

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v5 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v5, "setEditable:", 0);
  -[PSAboutTextSheetViewController setView:](self, "setView:", v5);

}

- (void)setAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSAboutTextSheetViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (void)donePressed
{
  id v2;

  -[PSAboutTextSheetViewController parentViewController](self, "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

+ (void)presentAboutSheetTitled:(id)a3 attributedText:(id)a4 fromViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v14 = objc_alloc_init((Class)a1);
  objc_msgSend(v14, "setTitle:", v10);

  objc_msgSend(v14, "setAttributedText:", v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v14);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v14, sel_donePressed);
  objc_msgSend(v14, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  objc_msgSend(v8, "presentViewController:animated:completion:", v11, 1, 0);
}

@end
