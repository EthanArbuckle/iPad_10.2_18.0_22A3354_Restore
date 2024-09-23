@implementation MTInformativeTableViewCell

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
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
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
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[4];

  v40.receiver = self;
  v40.super_class = (Class)MTInformativeTableViewCell;
  -[MTTableViewCell setupCell](&v40, "setupCell");
  -[MTInformativeTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_alloc_init((Class)UILabel);
  -[MTInformativeTableViewCell setMessageLabel:](self, "setMessageLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v4, "setNumberOfLines:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v5, "setLineBreakMode:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v6, "setTextAlignment:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSecondaryTextColor](UIColor, "cellSecondaryTextColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v11, "setTextColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  LODWORD(v13) = 1144750080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  LODWORD(v15) = 1144750080;
  objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 1, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  LODWORD(v17) = 1144750080;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 0, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  objc_msgSend(v18, "setLayoutMargins:", 27.0, 27.0, 27.0, 27.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutMarginsGuide"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v21, "addSubview:", v22);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v41[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v41[1] = v32;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v41[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  v41[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

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
  v7.super_class = (Class)MTInformativeTableViewCell;
  -[MTTableViewCell layoutSubviews](&v7, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  objc_msgSend(v6, "setPreferredMaxLayoutWidth:", Width);

}

- (CGSize)fittingSize
{
  double v3;
  double v4;
  CGSize result;

  -[MTInformativeTableViewCell layoutIfNeeded](self, "layoutIfNeeded");
  -[MTInformativeTableViewCell systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end
