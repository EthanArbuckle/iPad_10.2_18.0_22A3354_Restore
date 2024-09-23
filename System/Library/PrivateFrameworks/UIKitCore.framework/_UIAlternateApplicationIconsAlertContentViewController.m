@implementation _UIAlternateApplicationIconsAlertContentViewController

- (NSString)messageText
{
  id v3;

  v3 = -[UIViewController view](self, "view");
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setMessageText:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = -[UIViewController view](self, "view");
  -[UILabel setText:](self->_messageLabel, "setText:", v5);

}

- (void)_containingAlertControllerDidChangeVisualStyle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIAlternateApplicationIconsAlertContentViewController;
  v4 = a3;
  -[UIViewController _containingAlertControllerDidChangeVisualStyle:](&v5, sel__containingAlertControllerDidChangeVisualStyle_, v4);
  -[_UIAlternateApplicationIconsAlertContentViewController __updateWithVisualStyle:](self, "__updateWithVisualStyle:", v4, v5.receiver, v5.super_class);

}

- (void)__updateWithVisualStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "messageLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_messageLabel, "setFont:", v5);

  objc_msgSend(v4, "messageLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v6);

  v7 = objc_msgSend(v4, "maximumNumberOfLinesInMessageLabel");
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", v7);
}

- (void)_updateWithContainingAlertControllerVisualStyle
{
  void *v3;
  void *v4;

  -[UIViewController _visualStyleOfContainingAlertController](self, "_visualStyleOfContainingAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[_UIAlternateApplicationIconsAlertContentViewController __updateWithVisualStyle:](self, "__updateWithVisualStyle:", v3);
    v3 = v4;
  }

}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIAlternateApplicationIconsAlertContentViewController;
  -[UIViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[_UIAlternateApplicationIconsAlertContentViewController _updateWithContainingAlertControllerVisualStyle](self, "_updateWithContainingAlertControllerVisualStyle");
}

- (void)loadView
{
  UILabel *v3;
  _UIAlternateApplicationIconsAlertContentViewController *v4;
  UILabel *messageLabel;
  void *v6;
  void *v7;
  UIImageView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIStackView *v13;
  void *v14;
  UIStackView *v15;
  void *v16;
  UIStackView *v17;
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
  UIStackView *v30;
  UIImageView *v31;
  UILabel *v32;
  void *v33;
  _UIAlternateApplicationIconsAlertContentViewController *v34;
  _QWORD v35[2];
  const __CFString *v36;
  UIStackView *v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = (UILabel *)objc_opt_new();
  -[_UIAlternateApplicationIconsAlertContentViewController _updateWithContainingAlertControllerVisualStyle](self, "_updateWithContainingAlertControllerVisualStyle");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = self;
  v34 = self;
  messageLabel = self->_messageLabel;
  v4->_messageLabel = v3;
  v32 = v3;

  _UIMainBundleIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v33);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  LODWORD(v11) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 0, v11);
  v31 = v8;
  LODWORD(v12) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 1, v12);
  v13 = [UIStackView alloc];
  v39[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[UIStackView initWithArrangedSubviews:](v13, "initWithArrangedSubviews:", v14);

  -[UIStackView setAxis:](v30, "setAxis:", 1);
  -[UIStackView setAlignment:](v30, "setAlignment:", 3);
  -[UIStackView setDistribution:](v30, "setDistribution:", 3);
  -[UIStackView setSpacing:](v30, "setSpacing:", 8.0);
  v15 = [UIStackView alloc];
  v38[0] = v8;
  v38[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UIStackView initWithArrangedSubviews:](v15, "initWithArrangedSubviews:", v16);

  -[UIStackView setAxis:](v17, "setAxis:", 0);
  -[UIStackView setAlignment:](v17, "setAlignment:", 3);
  -[UIStackView setDistribution:](v17, "setDistribution:", 3);
  -[UIStackView setSpacing:](v17, "setSpacing:", 8.0);
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "addSubview:", v17);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = CFSTR("hStackView");
  v37 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v17, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v21;
  -[UIView centerYAnchor](v17, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(spc)-[hStackView]-(spc)-|"), 0, &unk_1E1A9B478, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(spc)-[hStackView]-(spc)-|"), 0, &unk_1E1A9B478, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v28);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v26);
  -[UIViewController setView:](v34, "setView:", v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end
