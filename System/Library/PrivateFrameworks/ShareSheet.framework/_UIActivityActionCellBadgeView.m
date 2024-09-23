@implementation _UIActivityActionCellBadgeView

- (_UIActivityActionCellBadgeView)initWithFrame:(CGRect)a3
{
  _UIActivityActionCellBadgeView *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
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
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)_UIActivityActionCellBadgeView;
  v3 = -[_UIActivityActionCellBadgeView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v4, "setTextAlignment:", 1);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1144766464;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1144766464;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    -[_UIActivityActionCellBadgeView addSubview:](v3, "addSubview:", v4);
    -[_UIActivityActionCellBadgeView setTitleLabel:](v3, "setTitleLabel:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellBadgeView leadingAnchor](v3, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 6.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    -[_UIActivityActionCellBadgeView trailingAnchor](v3, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 6.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

    objc_msgSend(v4, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellBadgeView topAnchor](v3, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 3.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v18) = 1144766464;
    objc_msgSend(v17, "setPriority:", v18);
    objc_msgSend(v8, "addObject:", v17);
    -[_UIActivityActionCellBadgeView bottomAnchor](v3, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 3.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v22) = 1144766464;
    objc_msgSend(v21, "setPriority:", v22);
    objc_msgSend(v8, "addObject:", v21);
    -[_UIActivityActionCellBadgeView widthAnchor](v3, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellBadgeView heightAnchor](v3, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v25);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
  }
  return v3;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  void *v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)_UIActivityActionCellBadgeView;
  -[_UIActivityActionCellBadgeView layoutSubviews](&v6, sel_layoutSubviews);
  -[_UIActivityActionCellBadgeView bounds](self, "bounds");
  Width = CGRectGetWidth(v7);
  -[_UIActivityActionCellBadgeView bounds](self, "bounds");
  v4 = fmin(Width, CGRectGetHeight(v8)) * 0.5;
  -[_UIActivityActionCellBadgeView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
