@implementation GuidesGenericSectionHeader

- (GuidesGenericSectionHeader)initWithFrame:(CGRect)a3
{
  GuidesGenericSectionHeader *v3;
  GuidesGenericSectionHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GuidesGenericSectionHeader;
  v3 = -[GuidesGenericSectionHeader initWithFrame:](&v6, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    -[GuidesGenericSectionHeader setupSubviews](v3, "setupSubviews");
    -[GuidesGenericSectionHeader setupConstraints](v4, "setupConstraints");
    -[GuidesGenericSectionHeader setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("GuidesSectionHeader"));
  }
  return v4;
}

+ (id)reuseIdentifier
{
  return CFSTR("GuidesGenericSectionHeader");
}

- (void)configureWithTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (void)configureWithTitle:(id)a3 actionButtonTitle:(id)a4 actionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setAttributedText:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v12, "setTitle:forState:", v9, 0);

  -[GuidesGenericSectionHeader setActionHandler:](self, "setActionHandler:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v13, "setHidden:", 0);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GuidesGenericSectionHeader;
  -[GuidesGenericSectionHeader prepareForReuse](&v7, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setAttributedText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
  objc_msgSend(v5, "setText:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v6, "setHidden:", 1);

  -[GuidesGenericSectionHeader setActionHandler:](self, "setActionHandler:", 0);
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init((Class)UILabel);
  -[GuidesGenericSectionHeader setTitleLabel:](self, "setTitleLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setNumberOfLines:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  -[GuidesGenericSectionHeader addSubview:](self, "addSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
  -[GuidesGenericSectionHeader setActionButton:](self, "setActionButton:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  LODWORD(v10) = 1144750080;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  LODWORD(v12) = 1144750080;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v14, "setTitleColorProvider:", &stru_1011BBDE0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "titleLabel"));
  objc_msgSend(v17, "setFont:", v15);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v18, "_setTouchInsets:", -7.0, -7.0, -7.0, -7.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, "_didTapActionButton", 64);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("ActionButton"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  -[GuidesGenericSectionHeader addSubview:](self, "addSubview:", v21);

  -[MapsThemeButton setHidden:](self->_actionButton, "setHidden:", 1);
}

- (void)setupConstraints
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
  _QWORD v39[8];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader leadingAnchor](self, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v39[0] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader trailingAnchor](self, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v32));
  v39[1] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader topAnchor](self, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v39[2] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader bottomAnchor](self, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v39[3] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v39[4] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader trailingAnchor](self, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v39[5] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v39[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionButton](self, "actionButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v39[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_didTapActionButton
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionHandler](self, "actionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[GuidesGenericSectionHeader actionHandler](self, "actionHandler"));
    v4[2]();

  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MapsThemeButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
