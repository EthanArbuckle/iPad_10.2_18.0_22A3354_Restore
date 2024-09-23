@implementation BKTOCBookmarksDescription

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  NSAttributedStringKey v29;
  void *v30;
  NSAttributedStringKey v31;
  void *v32;
  CGRect v33;

  -[BKTOCBookmarksDescription bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v7 + -50.0;
  v12 = objc_alloc_init((Class)NSStringDrawingContext);
  v31 = NSFontAttributeName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  v32 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 3, v14, v12, v11, 200.0);
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_descriptionLabel, "text"));
  v29 = NSFontAttributeName;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_descriptionLabel, "font"));
  v30 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  objc_msgSend(v18, "boundingRectWithSize:options:attributes:context:", 3, v20, v12, v11, v10 - v17);
  v22 = v21;

  v23 = ceil(v17);
  v24 = ceil(v22);
  if (isPad(v25, v26))
    v27 = 11.0;
  else
    v27 = 15.0;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  v28 = round((CGRectGetHeight(v33) - (v24 + v23 + v27)) * 0.5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 25.0, v28, v11, v23);
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", 25.0, v23 + v27 + v28, v11, v24);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription backgroundColor](self, "backgroundColor"));

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKTOCBookmarksDescription;
    -[BKTOCBookmarksDescription setBackgroundColor:](&v6, "setBackgroundColor:", v4);
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
    -[UILabel setBackgroundColor:](self->_descriptionLabel, "setBackgroundColor:", v4);
  }

}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 26.0));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription backgroundColor](self, "backgroundColor"));
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v7);

    -[BKTOCBookmarksDescription addSubview:](self, "addSubview:", self->_titleLabel);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)descriptionLabel
{
  UILabel *descriptionLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_descriptionLabel;
    self->_descriptionLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 16.0));
    -[UILabel setFont:](self->_descriptionLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 10);
    -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_descriptionLabel, "setLineBreakMode:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription backgroundColor](self, "backgroundColor"));
    -[UILabel setBackgroundColor:](self->_descriptionLabel, "setBackgroundColor:", v7);

    -[BKTOCBookmarksDescription addSubview:](self, "addSubview:", self->_descriptionLabel);
    descriptionLabel = self->_descriptionLabel;
  }
  return descriptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
