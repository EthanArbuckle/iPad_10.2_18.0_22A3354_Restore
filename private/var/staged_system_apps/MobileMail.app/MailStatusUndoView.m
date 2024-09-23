@implementation MailStatusUndoView

- (MailStatusUndoView)initWithFrame:(CGRect)a3
{
  MailStatusUndoView *v3;
  MailStatusUndoView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *undoButton;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  v26.receiver = self;
  v26.super_class = (Class)MailStatusUndoView;
  v3 = -[MailStatusUndoView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusUndoView _buttonConfiguration](v3, "_buttonConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphUndoSend));
    objc_msgSend(v25, "setImage:", v5);

    objc_msgSend(v25, "setImagePadding:", 3.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 1));
    objc_msgSend(v25, "setPreferredSymbolConfigurationForImage:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNDO_SEND_BUTTON_TITLE"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v25, "setTitle:", v8);

    objc_msgSend(v25, "setButtonSize:", 1);
    v9 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v25, 0));
    -[UIButton setShowsLargeContentViewer:](v9, "setShowsLargeContentViewer:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", v4, "_undoButtonTapped:", 64);
    -[MailStatusUndoView addSubview:](v4, "addSubview:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v9, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusUndoView centerXAnchor](v4, "centerXAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:"));
    v27[0] = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v9, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusUndoView centerYAnchor](v4, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:"));
    v27[1] = v19;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v9, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusUndoView leadingAnchor](v4, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v27[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v9, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusUndoView trailingAnchor](v4, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v27[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    undoButton = v4->_undoButton;
    v4->_undoButton = v9;

  }
  return v4;
}

- (void)_undoButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MailStatusUndoView delegate](self, "delegate", a3));
  objc_msgSend(v4, "mailStatusUndoViewUndoButtonTapped:", self);

}

- (id)_buttonConfiguration
{
  return +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
}

- (MailStatusUndoViewDelegate)delegate
{
  return (MailStatusUndoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
  objc_storeStrong((id *)&self->_undoButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
