@implementation ICNoteResultsSelectionIndicatorView

+ (id)selectionImageConfiguration
{
  if (qword_1005DDF00 != -1)
    dispatch_once(&qword_1005DDF00, &stru_1005541D8);
  return (id)qword_1005DDF08;
}

+ (id)selectionImageBackground
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C88D8;
  block[3] = &unk_1005525E8;
  block[4] = a1;
  if (qword_1005DDF10 != -1)
    dispatch_once(&qword_1005DDF10, block);
  return (id)qword_1005DDF18;
}

+ (id)selectionImageSelected
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C89B0;
  block[3] = &unk_1005525E8;
  block[4] = a1;
  if (qword_1005DDF20 != -1)
    dispatch_once(&qword_1005DDF20, block);
  return (id)qword_1005DDF28;
}

+ (id)selectionImageUnselected
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C8A88;
  block[3] = &unk_1005525E8;
  block[4] = a1;
  if (qword_1005DDF30 != -1)
    dispatch_once(&qword_1005DDF30, block);
  return (id)qword_1005DDF38;
}

- (ICNoteResultsSelectionIndicatorView)initWithCoder:(id)a3
{
  ICNoteResultsSelectionIndicatorView *v3;
  ICNoteResultsSelectionIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsSelectionIndicatorView;
  v3 = -[ICNoteResultsSelectionIndicatorView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ICNoteResultsSelectionIndicatorView commonInit](v3, "commonInit");
  return v4;
}

- (ICNoteResultsSelectionIndicatorView)initWithFrame:(CGRect)a3
{
  ICNoteResultsSelectionIndicatorView *v3;
  ICNoteResultsSelectionIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsSelectionIndicatorView;
  v3 = -[ICNoteResultsSelectionIndicatorView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICNoteResultsSelectionIndicatorView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  UIImageView *v3;
  UIImageView *backgroundImageView;
  UIImageView *v5;
  UIImageView *foregroundImageView;

  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView addImageViewSubview](self, "addImageViewSubview"));
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = v3;

  v5 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView addImageViewSubview](self, "addImageViewSubview"));
  foregroundImageView = self->_foregroundImageView;
  self->_foregroundImageView = v5;

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v3 = a3;
  self->_selected = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView backgroundImageView](self, "backgroundImageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));

  if (!v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "selectionImageBackground");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView backgroundImageView](self, "backgroundImageView"));
    objc_msgSend(v9, "setImage:", v8);

  }
  if (v3)
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v12, "setTintColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView backgroundImageView](self, "backgroundImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  if (v3)
  {
    LODWORD(v15) = 1.0;
    objc_msgSend(v14, "setOpacity:", v15);

    v16 = objc_msgSend((id)objc_opt_class(self), "selectionImageSelected");
  }
  else
  {
    LODWORD(v15) = *(_DWORD *)"fff?";
    objc_msgSend(v14, "setOpacity:", v15);

    v16 = objc_msgSend((id)objc_opt_class(self), "selectionImageUnselected");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView foregroundImageView](self, "foregroundImageView"));
  objc_msgSend(v18, "setImage:", v17);

  if (v3)
    v19 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v19 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v21 = (id)v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView foregroundImageView](self, "foregroundImageView"));
  objc_msgSend(v20, "setTintColor:", v21);

}

- (id)addImageViewSubview
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setContentMode:", 1);
  -[ICNoteResultsSelectionIndicatorView addSubview:](self, "addSubview:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView topAnchor](self, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v18[0] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView bottomAnchor](self, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v4));
  v18[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v18[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsSelectionIndicatorView trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v18[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  return v3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (UIImageView)foregroundImageView
{
  return self->_foregroundImageView;
}

- (void)setForegroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
