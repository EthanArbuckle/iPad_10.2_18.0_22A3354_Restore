@implementation TUIReportDetailsViewController

- (TUIReportDetailsViewController)initWithReportManager:(id)a3
{
  id v5;
  TUIReportDetailsViewController *v6;
  TUIReportDetailsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIReportDetailsViewController;
  v6 = -[TUIReportDetailsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reportManager, a3);

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_opt_new();
  -[TUIReportDetailsViewController setView:](self, "setView:", v3);

  -[TUIReportDetailsViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  UITextView *v6;
  UITextView *reportDetailsTextView;
  UITextView *v8;
  void *v9;
  UITextView *v10;
  void *v11;
  void *v12;
  UITextView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)TUIReportDetailsViewController;
  -[TUIReportDetailsViewController viewDidLoad](&v37, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAILS_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportDetailsViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x24BDF6EF8]);
  v6 = (UITextView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  reportDetailsTextView = self->_reportDetailsTextView;
  self->_reportDetailsTextView = v6;

  -[UITextView setEditable:](self->_reportDetailsTextView, "setEditable:", 0);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_reportDetailsTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = self->_reportDetailsTextView;
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](v8, "setTextColor:", v9);

  v10 = self->_reportDetailsTextView;
  v11 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  objc_msgSend(v11, "monospacedSystemFontOfSize:weight:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v10, "setFont:", v12);

  v13 = self->_reportDetailsTextView;
  -[TUIReportManager reportDetails](self->_reportManager, "reportDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](v13, "setText:", v14);

  -[UITextView setTextContainerInset:](self->_reportDetailsTextView, "setTextContainerInset:", 0.0, 8.0, 0.0, 8.0);
  -[TUIReportDetailsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_reportDetailsTextView);

  v28 = (void *)MEMORY[0x24BDD1628];
  -[UITextView topAnchor](self->_reportDetailsTextView, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportDetailsViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v32;
  -[UITextView leadingAnchor](self->_reportDetailsTextView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportDetailsViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "safeAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v26;
  -[UITextView trailingAnchor](self->_reportDetailsTextView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportDetailsViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v20;
  -[UITextView bottomAnchor](self->_reportDetailsTextView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportDetailsViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v25);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIReportDetailsViewController;
  -[TUIReportDetailsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[UITextView setContentOffset:animated:](self->_reportDetailsTextView, "setContentOffset:animated:", 0, 0.0, 0.0);
}

- (UITextView)reportDetailsTextView
{
  return self->_reportDetailsTextView;
}

- (void)setReportDetailsTextView:(id)a3
{
  objc_storeStrong((id *)&self->_reportDetailsTextView, a3);
}

- (TUIReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
  objc_storeStrong((id *)&self->_reportManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_reportDetailsTextView, 0);
}

@end
