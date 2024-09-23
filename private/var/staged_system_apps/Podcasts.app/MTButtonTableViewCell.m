@implementation MTButtonTableViewCell

- (void)setupCell
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
  void *v13;
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
  objc_super v31;
  _QWORD v32[4];

  v31.receiver = self;
  v31.super_class = (Class)MTButtonTableViewCell;
  -[MTTableViewCell setupCell](&v31, "setupCell");
  v3 = objc_alloc_init((Class)UILabel);
  -[MTButtonTableViewCell setButtonLabel:](self, "setButtonLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  objc_msgSend(v4, "setNumberOfLines:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  objc_msgSend(v5, "setLineBreakMode:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell contentView](self, "contentView"));
  objc_msgSend(v9, "setLayoutMargins:", 12.0, 0.0, 12.0, 0.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMarginsGuide"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  objc_msgSend(v12, "addSubview:", v13);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v32[0] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v32[1] = v23;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v32[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v32[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)MTButtonTableViewCell;
  -[MTTableViewCell layoutSubviews](&v7, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTButtonTableViewCell buttonLabel](self, "buttonLabel"));
  objc_msgSend(v6, "setPreferredMaxLayoutWidth:", Width);

}

- (CGSize)fittingSize
{
  double v3;
  double v4;
  CGSize result;

  -[MTButtonTableViewCell layoutIfNeeded](self, "layoutIfNeeded");
  -[MTButtonTableViewCell systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UILabel)buttonLabel
{
  return self->_buttonLabel;
}

- (void)setButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLabel, 0);
}

@end
