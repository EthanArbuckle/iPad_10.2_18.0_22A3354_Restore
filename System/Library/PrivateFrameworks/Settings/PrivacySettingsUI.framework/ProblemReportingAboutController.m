@implementation ProblemReportingAboutController

- (ProblemReportingAboutController)initWithTitle:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  ProblemReportingAboutController *v8;
  ProblemReportingAboutController *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ProblemReportingAboutController;
  v8 = -[ProblemReportingAboutController init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ProblemReportingAboutController setTitle:](v8, "setTitle:", v6);
    v10 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v11 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v11, "setText:", v7);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(v11, "setEditable:", 0);
    objc_msgSend(v11, "textContainerInset");
    objc_msgSend(v11, "setContentOffset:animated:", 0, 0.0, -v13);
    -[ProblemReportingAboutController setView:](v9, "setView:", v11);
    -[ProblemReportingAboutController navigationItem](v9, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v9, sel_donePressed);
    objc_msgSend(v14, "setRightBarButtonItem:", v15);

  }
  return v9;
}

- (void)donePressed
{
  id v2;

  -[ProblemReportingAboutController parentViewController](self, "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
