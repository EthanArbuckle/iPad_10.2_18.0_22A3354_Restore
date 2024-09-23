@implementation VUIAppCell

+ (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  if (!self->_didLayout)
    -[VUIAppCell layoutSubviews](self, "layoutSubviews");
  self->_iconSize.width = width;
  self->_iconSize.height = height;
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  UIImage *image;
  UIImage *v6;

  v4 = (UIImage *)a3;
  if (!self->_didLayout)
    -[VUIAppCell layoutSubviews](self, "layoutSubviews");
  image = self->_image;
  self->_image = v4;
  v6 = v4;

  -[UIImageView setImage:](self->_imageView, "setImage:", self->_image);
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *title;
  id v6;

  v4 = a3;
  if (!self->_didLayout)
    -[VUIAppCell layoutSubviews](self, "layoutSubviews");
  if (!-[NSString length](self->_title, "length") && objc_msgSend(v4, "length"))
    -[VUIAppCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  title = self->_title;
  self->_title = (NSString *)v4;
  v6 = v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
}

- (void)layoutSubviews
{
  id v3;
  UILabel *v4;
  UIImageView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  UIImageView *imageView;
  UIImageView *v14;
  UILabel *titleLabel;
  id v16;

  if (!self->_didLayout)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC48D8]);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v4, "setTextColor:", v10);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
      v16 = (id)v9;
    }
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](v4, "setFont:", v16);
    -[UILabel setText:](v4, "setText:", self->_title);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
    -[UILabel setMinimumScaleFactor:](v4, "setMinimumScaleFactor:", 0.7);
    -[UILabel setTextColor:](v4, "setTextColor:", v6);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VUIAppCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5);
    objc_msgSend(v12, "addSubview:", v4);
    imageView = self->_imageView;
    self->_imageView = v5;
    v14 = v5;

    titleLabel = self->_titleLabel;
    self->_titleLabel = v4;

    self->_didLayout = 1;
  }
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  unint64_t v13;
  double v14;
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
  double v26;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)VUIAppCell;
  -[VUIAppCell updateConstraints](&v56, sel_updateConstraints);
  +[VUIAppCell contentInsets](VUIAppCell, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIAppCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_title, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v14 = 20.0;
    if (v13 <= 6)
      v14 = dbl_1DA1C1960[v13];
    -[UIImageView topAnchor](self->_imageView, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[UIImageView centerXAnchor](self->_imageView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v22, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -v10;
    objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:constant:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", self->_iconSize.height);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", self->_iconSize.width);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, v14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v41;
    v44 = v42;
    v45 = v26;
  }
  else
  {
    -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, v6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -v10);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);

    -[UIImageView topAnchor](self->_imageView, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, v4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    -[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -v8;
    v43 = v41;
    v44 = v42;
  }
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, v45);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
