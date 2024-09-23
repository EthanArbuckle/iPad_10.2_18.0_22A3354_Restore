@implementation TSIDSSimTransferringViewController

- (TSIDSSimTransferringViewController)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  TSIDSSimTransferringViewController *v8;
  TSIDSSimTransferringViewController *v9;
  id v10;
  uint64_t v11;
  UILabel *placeHolderLabel;
  uint64_t v13;
  UIActivityIndicatorView *indicatorView;
  UIActivityIndicatorView *v15;
  id v16;
  void *v17;
  uint64_t v18;
  UIStackView *stackView;
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
  TSIDSSimTransferringViewController *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  objc_super v44;
  _QWORD v45[3];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)TSIDSSimTransferringViewController;
  v8 = -[TSIDSSimTransferringViewController init](&v44, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TSIDSSimTransferringViewController setTitle:](v8, "setTitle:", v6);
    -[TSIDSSimTransferringViewController setSubtitle:](v9, "setSubtitle:", v7);
    v10 = objc_alloc(MEMORY[0x24BEBD708]);
    v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v41 = v6;
    placeHolderLabel = v9->_placeHolderLabel;
    v9->_placeHolderLabel = (UILabel *)v11;

    -[UILabel setText:](v9->_placeHolderLabel, "setText:", CFSTR(" "));
    -[UILabel setNumberOfLines:](v9->_placeHolderLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v9->_placeHolderLabel, "setTextAlignment:", 1);
    -[UILabel setHidden:](v9->_placeHolderLabel, "setHidden:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_placeHolderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    indicatorView = v9->_indicatorView;
    v9->_indicatorView = (UIActivityIndicatorView *)v13;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v9->_indicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    CGAffineTransformMakeScale(&v43, 1.5, 1.5);
    v15 = v9->_indicatorView;
    v42 = v43;
    -[UIActivityIndicatorView setTransform:](v15, "setTransform:", &v42);
    -[UIActivityIndicatorView startAnimating](v9->_indicatorView, "startAnimating");
    v40 = v7;
    v16 = objc_alloc(MEMORY[0x24BEBD978]);
    v46[0] = v9->_placeHolderLabel;
    v46[1] = v9->_indicatorView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithArrangedSubviews:", v17);
    stackView = v9->_stackView;
    v9->_stackView = (UIStackView *)v18;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v9->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v9->_stackView, "setAxis:", 1);
    -[UIStackView setSpacing:](v9->_stackView, "setSpacing:", 16.0);
    -[UIStackView setAlignment:](v9->_stackView, "setAlignment:", 3);
    -[TSIDSSimTransferringViewController contentView](v9, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v9->_stackView);

    -[TSIDSSimTransferringViewController setDismissalType:](v9, "setDismissalType:", 0);
    v33 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](v9->_stackView, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSIDSSimTransferringViewController contentView](v9, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "mainContentGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v35;
    -[UIStackView centerXAnchor](v9->_stackView, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSIDSSimTransferringViewController contentView](v9, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "mainContentGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v23;
    -[UIStackView centerYAnchor](v9->_stackView, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSIDSSimTransferringViewController contentView](v9, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mainContentGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v29);

    v7 = v40;
    v6 = v41;

    v30 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_indicatorView, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)TSIDSSimTransferringViewController;
  -[TSIDSSimTransferringViewController dealloc](&v3, sel_dealloc);
}

- (UILabel)placeHolderLabel
{
  return self->_placeHolderLabel;
}

- (void)setPlaceHolderLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIActivityIndicatorView)indicatorView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setIndicatorView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeHolderLabel, 0);
}

@end
