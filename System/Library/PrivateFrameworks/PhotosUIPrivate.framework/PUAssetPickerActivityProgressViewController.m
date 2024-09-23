@implementation PUAssetPickerActivityProgressViewController

- (PUAssetPickerActivityProgressViewController)init
{
  PUAssetPickerActivityProgressViewController *v2;
  uint64_t v3;
  UIProgressView *progressView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAssetPickerActivityProgressViewController;
  v2 = -[PUAssetPickerActivityProgressViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 1);
    progressView = v2->_progressView;
    v2->_progressView = (UIProgressView *)v3;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PUAssetPickerActivityProgressViewController;
  -[PUAssetPickerActivityProgressViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PUAssetPickerActivityProgressViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_progressView);
  -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[UIProgressView leadingAnchor](self->_progressView, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  -[UIProgressView trailingAnchor](self->_progressView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  -[UIProgressView bottomAnchor](self->_progressView, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  -[UIProgressView topAnchor](self->_progressView, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)setProgress:(id)a3
{
  -[UIProgressView setObservedProgress:](self->_progressView, "setObservedProgress:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
