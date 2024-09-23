@implementation PKCellAccessoryBadge

+ (id)accessoryBadgeWithTitle:(id)a3
{
  id v3;
  PKCellAccessoryBadge *v4;
  PKCellAccessoryBadge *v5;
  void *v6;

  v3 = a3;
  v4 = [PKCellAccessoryBadge alloc];
  v5 = -[PKCellAccessoryBadge initWithFrame:title:](v4, "initWithFrame:title:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v5, 1);
  return v6;
}

- (PKCellAccessoryBadge)initWithFrame:(CGRect)a3 title:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PKCellAccessoryBadge *v10;
  UILabel *v11;
  UILabel *titleLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKCellAccessoryBadge;
  v10 = -[PKCellAccessoryBadge initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v11;

    v13 = v10->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    v15 = v10->_titleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4938]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setNumberOfLines:](v10->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v10->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setText:](v10->_titleLabel, "setText:", v9);
    -[PKCellAccessoryBadge addSubview:](v10, "addSubview:", v10->_titleLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCellAccessoryBadge setBackgroundColor:](v10, "setBackgroundColor:", v17);

  }
  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + 10.0;
  v6 = fmax(v5, v3 + 10.0);
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  -[PKCellAccessoryBadge bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v3, v5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", (v4 - v7) * 0.5, 5.0, v7, v8);
  -[PKCellAccessoryBadge layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v10 = v6 * 0.5;
  if (v6 != v4)
    v10 = 5.0;
  objc_msgSend(v9, "setCornerRadius:", v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  UILabel *titleLabel;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCellAccessoryBadge;
  -[PKCellAccessoryBadge traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  titleLabel = self->_titleLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4938]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
