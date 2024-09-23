@implementation EditShortcutTitleCell

- (EditShortcutTitleCell)initWithShortcut:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  EditShortcutTitleCell *v9;
  EditShortcutTitleCell *v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  id v16;
  UIImageView *v17;
  UIImageView *imageView;
  UIImageView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  objc_super v62;
  _QWORD v63[5];
  _QWORD v64[4];

  v7 = a3;
  v8 = a4;
  v62.receiver = self;
  v62.super_class = (Class)EditShortcutTitleCell;
  v9 = -[EditShortcutTitleCell initWithStyle:reuseIdentifier:](&v62, "initWithStyle:reuseIdentifier:", 0, CFSTR("EditShortcutTitleCell"));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shortcut, a3);
    -[EditShortcutTitleCell setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("EditShortcutTitleCell"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutTitleCell contentView](v10, "contentView"));
    v60 = v7;
    v61 = v8;
    if (sub_1002A8AA0(v10) == 5)
    {
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
    }
    else
    {
      v16 = objc_alloc((Class)UIImageView);
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v17 = (UIImageView *)objc_msgSend(v16, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setAccessibilityIdentifier:](v17, "setAccessibilityIdentifier:", CFSTR("EditShortcutTitleImage"));
      objc_msgSend(v11, "addSubview:", v17);
      imageView = v10->_imageView;
      v10->_imageView = v17;
      v19 = v17;

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v19, "heightAnchor"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:", 30.0));
      v64[0] = v57;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v19, "widthAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToConstant:", 30.0));
      v64[1] = v53;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v19, "centerYAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
      v64[2] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v19, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 16.0));
      v64[3] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

      v8 = v61;
    }
    v27 = objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", x, y, width, height);
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v27, "setDelegate:", v8);
    if (sub_1002A8AA0(v10) == 5)
      v28 = 3;
    else
      v28 = 0;
    objc_msgSend(v27, "setBorderStyle:", v28);
    objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("EditShortcutTitleTextField"));
    objc_msgSend(v11, "addSubview:", v27);
    objc_storeStrong((id *)&v10->_textField, v27);
    v29 = 15.0;
    if (sub_1002A8AA0(v10) == 5)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "heightAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", 32.0));
      objc_msgSend(v31, "setActive:", 1);

      v29 = 0.0;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
    if (sub_1002A8AA0(v10) == 5)
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    else
      v33 = objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v10->_imageView, "trailingAnchor"));
    v34 = v33;
    v47 = (void *)v33;
    v35 = sub_1002A8AA0(v10);
    v36 = 10.0;
    if (v35 == 5)
      v36 = 16.0;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, v36));
    v63[0] = v59;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v54, -16.0));
    v63[1] = v52;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v48));
    v63[2] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v29));
    v63[3] = v40;
    v49 = v32;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, -v29));
    v63[4] = v43;
    v51 = v11;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v45, "addObserver:selector:name:object:", v10, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    -[EditShortcutTitleCell updateContent](v10, "updateContent");
    v7 = v60;
    v8 = v61;
  }

  return v10;
}

- (void)updateContent
{
  void *v3;
  void *v4;
  UIImageView *v5;
  void *v6;
  UIImageView *v7;
  _QWORD v8[4];
  UIImageView *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcutLike title](self->_shortcut, "title"));
  -[UITextField setText:](self->_textField, "setText:", v3);

  if (sub_1002A8AA0(self) != 5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcutLike styleAttributes](self->_shortcut, "styleAttributes"));
    v5 = self->_imageView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10053949C;
    v8[3] = &unk_1011BAA70;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "getImageForStyleAttributes:completion:", v4, v8);

  }
  -[EditShortcutTitleCell _updateFonts](self, "_updateFonts");
}

- (NSString)titleText
{
  return -[UITextField text](self->_textField, "text");
}

- (BOOL)makeFirstResponder
{
  return -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)resignResponder
{
  -[UITextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (void)_updateFonts
{
  uint64_t v3;
  id v4;

  if (sub_1002A8AA0(self) == 5)
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system20Semibold](UIFont, "system20Semibold"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v4 = (id)v3;
  -[UITextField setFont:](self->_textField, "setFont:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
