@implementation MacRapImageSingleLineCell

- (MacRapImageSingleLineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MacRapImageSingleLineCell *v4;
  MacRapImageSingleLineCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  UILabel *v9;
  UILabel *textLabel;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MacRapImageSingleLineCell;
  v4 = -[MacRapImageSingleLineCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[MacRapImageSingleLineCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    textLabel = v5->_textLabel;
    v5->_textLabel = v9;

    -[MacRapImageSingleLineCell _setupSubviews](v5, "_setupSubviews");
    -[MacRapImageSingleLineCell _setupConstraints](v5, "_setupConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, "_contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)_setupSubviews
{
  void *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  id v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_textLabel, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacRapImageSingleLineCell contentView](self, "contentView"));
  objc_msgSend(v3, "addSubview:", self->_textLabel);

  -[MacRapImageSingleLineCell _updateFonts](self, "_updateFonts");
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v4;

  -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MacRapImageSingleLineCell contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_imageView);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *topToFirstBaselineConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *lastBaselineToBottomConstraint;
  NSLayoutConstraint *v14;
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
  _QWORD v34[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacRapImageSingleLineCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_textLabel, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v6, "_scaledValueForValue:", 23.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5));
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_textLabel, "lastBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v11, "_scaledValueForValue:", -12.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10));
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v12;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_textLabel, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_imageView, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 15.0));
  v34[0] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_textLabel, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -30.0));
  v14 = self->_topToFirstBaselineConstraint;
  v34[1] = v28;
  v34[2] = v14;
  v34[3] = self->_lastBaselineToBottomConstraint;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_imageView, "leadingAnchor"));
  v27 = v3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 30.0));
  v34[4] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_imageView, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v34[5] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 20.0));
  v34[6] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageView, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v34[7] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)_contentSizeChanged
{
  -[MacRapImageSingleLineCell _updateFonts](self, "_updateFonts");
  -[MacRapImageSingleLineCell _updateConstraints](self, "_updateConstraints");
}

- (void)_updateFonts
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  -[UILabel setFont:](self->_textLabel, "setFont:", v3);

}

- (void)_updateConstraints
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 23.0);
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v4, "_scaledValueForValue:", -12.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("MacRapImageSingleLineCell");
}

- (void)setImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
}

@end
