@implementation PRComplicationGalleryApplicationTitleView

- (PRComplicationGalleryApplicationTitleView)initWithFrame:(CGRect)a3
{
  PRComplicationGalleryApplicationTitleView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  uint64_t v7;
  NSLayoutConstraint *imageWidthConstraint;
  double v9;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *imageHeightConstraint;
  double v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *textLabel;
  UILabel *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *contentLeadingConstraint;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *contentTrailingConstraint;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *contentTopConstraint;
  void *v36;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *contentBottomConstraint;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;
  _QWORD v45[4];
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)PRComplicationGalleryApplicationTitleView;
  v3 = -[PRComplicationGalleryApplicationTitleView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRComplicationGalleryApplicationTitleView addSubview:](v3, "addSubview:", v3->_imageView);
    v3->_imageSize = (CGSize)vdupq_n_s64(0x4048000000000000uLL);
    -[UIImageView widthAnchor](v3->_imageView, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 48.0);
    v7 = objc_claimAutoreleasedReturnValue();
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v7;

    LODWORD(v9) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_imageWidthConstraint, "setPriority:", v9);
    -[UIImageView heightAnchor](v3->_imageView, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 48.0);
    v11 = objc_claimAutoreleasedReturnValue();
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v11;

    LODWORD(v13) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_imageHeightConstraint, "setPriority:", v13);
    v14 = (void *)MEMORY[0x1E0CB3718];
    v47[0] = v3->_imageWidthConstraint;
    v47[1] = v3->_imageHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateConstraints:", v15);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v16;

    v18 = v3->_textLabel;
    -[PRComplicationGalleryApplicationTitleView _textLabelFont](v3, "_textLabelFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", -[PRComplicationGalleryApplicationTitleView _textLabelNumberOfLines](v3, "_textLabelNumberOfLines"));
    LODWORD(v20) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_textLabel, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    v21 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v46[0] = v3->_imageView;
    v46[1] = v3->_textLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithArrangedSubviews:", v22);

    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v23, "setAxis:", 0);
    objc_msgSend(v23, "setSpacing:", 16.0);
    -[PRComplicationGalleryApplicationTitleView addSubview:](v3, "addSubview:", v23);
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryApplicationTitleView leadingAnchor](v3, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    contentLeadingConstraint = v3->_contentLeadingConstraint;
    v3->_contentLeadingConstraint = (NSLayoutConstraint *)v26;

    objc_msgSend(v23, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryApplicationTitleView trailingAnchor](v3, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    contentTrailingConstraint = v3->_contentTrailingConstraint;
    v3->_contentTrailingConstraint = (NSLayoutConstraint *)v30;

    objc_msgSend(v23, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryApplicationTitleView topAnchor](v3, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    contentTopConstraint = v3->_contentTopConstraint;
    v3->_contentTopConstraint = (NSLayoutConstraint *)v34;

    objc_msgSend(v23, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryApplicationTitleView bottomAnchor](v3, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    contentBottomConstraint = v3->_contentBottomConstraint;
    v3->_contentBottomConstraint = (NSLayoutConstraint *)v38;

    v45[0] = v3->_contentLeadingConstraint;
    v45[1] = v3->_contentTrailingConstraint;
    v40 = (void *)MEMORY[0x1E0CB3718];
    v45[2] = v3->_contentTopConstraint;
    v45[3] = v3->_contentBottomConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v41);

    -[PRComplicationGalleryApplicationTitleView setContentInsets:](v3, "setContentInsets:", 12.0, 27.0, 12.0, 27.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PRComplicationGalleryApplicationTitleView;
  -[PRComplicationGalleryApplicationTitleView dealloc](&v4, sel_dealloc);
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_textLabel, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_textLabel, "text");
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:");
  -[UIImageView setHidden:](self->_imageView, "setHidden:", a3 == 0);
}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_imageView, "image");
}

- (NSLayoutAnchor)titleLabelLeadingAnchor
{
  return (NSLayoutAnchor *)-[UILabel leadingAnchor](self->_textLabel, "leadingAnchor");
}

- (void)setImageSize:(CGSize)a3
{
  CGSize *p_imageSize;

  p_imageSize = &self->_imageSize;
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    p_imageSize->width = a3.width;
    self->_imageSize.height = a3.height;
    -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:");
    -[NSLayoutConstraint setConstant:](self->_imageHeightConstraint, "setConstant:", p_imageSize->height);
  }
}

+ (CGSize)iconImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  NSDirectionalEdgeInsets *p_contentInsets;

  p_contentInsets = &self->_contentInsets;
  if (self->_contentInsets.leading != a3.leading
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.trailing != a3.trailing
    || self->_contentInsets.bottom != a3.bottom)
  {
    p_contentInsets->top = a3.top;
    self->_contentInsets.leading = a3.leading;
    self->_contentInsets.bottom = a3.bottom;
    self->_contentInsets.trailing = a3.trailing;
    -[NSLayoutConstraint setConstant:](self->_contentLeadingConstraint, "setConstant:", a3.leading);
    -[NSLayoutConstraint setConstant:](self->_contentTrailingConstraint, "setConstant:", -p_contentInsets->trailing);
    -[NSLayoutConstraint setConstant:](self->_contentTopConstraint, "setConstant:", p_contentInsets->top);
    -[NSLayoutConstraint setConstant:](self->_contentBottomConstraint, "setConstant:", -p_contentInsets->bottom);
  }
}

- (id)_textLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  -[PRComplicationGalleryApplicationTitleView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_textLabelNumberOfLines
{
  void *v2;
  NSString *v3;
  unint64_t v4;

  -[PRComplicationGalleryApplicationTitleView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  id v5;

  -[PRComplicationGalleryApplicationTitleView textLabel](self, "textLabel", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryApplicationTitleView _textLabelFont](self, "_textLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v5, "setNumberOfLines:", -[PRComplicationGalleryApplicationTitleView _textLabelNumberOfLines](self, "_textLabelNumberOfLines"));
  -[PRComplicationGalleryApplicationTitleView setNeedsLayout](self, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRComplicationGalleryApplicationTitleView;
  v4 = a3;
  -[PRComplicationGalleryApplicationTitleView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PRComplicationGalleryApplicationTitleView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[PRComplicationGalleryApplicationTitleView _contentSizeCategoryDidChange:](self, "_contentSizeCategoryDidChange:", 0);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, a3);
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, a3);
}

- (NSLayoutConstraint)contentLeadingConstraint
{
  return self->_contentLeadingConstraint;
}

- (void)setContentLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentLeadingConstraint, a3);
}

- (NSLayoutConstraint)contentTrailingConstraint
{
  return self->_contentTrailingConstraint;
}

- (void)setContentTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentTrailingConstraint, a3);
}

- (NSLayoutConstraint)contentTopConstraint
{
  return self->_contentTopConstraint;
}

- (void)setContentTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentTopConstraint, a3);
}

- (NSLayoutConstraint)contentBottomConstraint
{
  return self->_contentBottomConstraint;
}

- (void)setContentBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
