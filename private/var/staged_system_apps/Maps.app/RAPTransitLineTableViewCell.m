@implementation RAPTransitLineTableViewCell

+ (id)measuringCell
{
  NSString *v3;
  void *v4;
  id v5;

  if (qword_1014D1E50 != -1)
    dispatch_once(&qword_1014D1E50, &stru_1011ADEE8);
  v3 = NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D1E48, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = objc_msgSend(objc_alloc((Class)a1), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend((id)qword_1014D1E48, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (RAPTransitLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPTransitLineTableViewCell *v4;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RAPTransitLineTableViewCell;
  v4 = -[RAPTransitLineTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v7, "addSubview:", v4->_imageView);

    LODWORD(v8) = 1148829696;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *leadingConstraint;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *imageViewWidthConstraint;
  void *v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)RAPTransitLineTableViewCell;
  -[RAPTransitLineTableViewCell updateConstraints](&v17, "updateConstraints");
  if (self->_didSetupConstraints)
  {
    -[RAPTransitLineTableViewCell updateImageConstraints](self, "updateImageConstraints");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_imageView, "leadingAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutMarginsGuide"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v6));
    leadingConstraint = self->_leadingConstraint;
    self->_leadingConstraint = v7;

    if (self->_shieldWidth > 0.0)
      -[RAPTransitLineTableViewCell alignWithShieldWidth:](self, "alignWithShieldWidth:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
    objc_msgSend(v10, "size");
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:"));
    imageViewWidthConstraint = self->_imageViewWidthConstraint;
    self->_imageViewWidthConstraint = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
    objc_msgSend(v13, "addObject:", self->_leadingConstraint);
    objc_msgSend(v13, "addObject:", self->_imageViewWidthConstraint);
    v14 = _NSDictionaryOfVariableBindings(CFSTR("_imageView"), self->_imageView, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_imageView]-|"), 0, 0, v15));
    objc_msgSend(v13, "addObjectsFromArray:", v16);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);
    self->_didSetupConstraints = 1;

  }
}

- (void)layoutMarginsDidChange
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPTransitLineTableViewCell;
  -[RAPTransitLineTableViewCell layoutMarginsDidChange](&v4, "layoutMarginsDidChange");
  -[RAPTransitLineTableViewCell layoutMargins](self, "layoutMargins");
  -[RAPTransitLineTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v3 + self->_shieldWidth + 12.0, 0.0, 0.0);
}

- (void)updateImageConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[NSLayoutConstraint constant](self->_imageViewWidthConstraint, "constant");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
  objc_msgSend(v5, "size");
  v7 = v6;

  if (v4 != v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
    objc_msgSend(v8, "size");
    -[NSLayoutConstraint setConstant:](self->_imageViewWidthConstraint, "setConstant:");

  }
}

- (void)setContentsFromTransitLine:(id)a3
{
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
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "primaryDescriptionText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v6, "setNumberOfLines:", 4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "secondaryDescriptionText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v9, "setNumberOfLines:", 4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell window](self, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "scale");
    v14 = v13;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v15, "scale");
    v14 = v16;

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "artwork"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v17, 6, v14));

  -[RAPTransitLineTableViewCell setImage:](self, "setImage:", v18);
  objc_msgSend(v18, "size");
  -[RAPTransitLineTableViewCell alignWithShieldWidth:](self, "alignWithShieldWidth:");

}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
  -[RAPTransitLineTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)alignWithShieldWidth:(double)a3
{
  double v5;
  id v6;

  self->_shieldWidth = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
  objc_msgSend(v6, "size");
  -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:", a3 - v5);

}

- (double)preferredHeightInTableView:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTransitLineTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", v5, 0.0);
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
