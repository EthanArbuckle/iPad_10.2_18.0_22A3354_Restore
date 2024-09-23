@implementation SearchLoadingTableViewCell

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (SearchLoadingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SearchLoadingTableViewCell *v4;
  id v5;
  double y;
  double width;
  double height;
  UILabel *v9;
  UILabel *loadingLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIActivityIndicatorView *v16;
  UIActivityIndicatorView *loadingIndicator;
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
  objc_super v42;
  _QWORD v43[5];

  v42.receiver = self;
  v42.super_class = (Class)SearchLoadingTableViewCell;
  v4 = -[SearchLoadingTableViewCell initWithStyle:reuseIdentifier:](&v42, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UILabel *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    loadingLabel = v4->_loadingLabel;
    v4->_loadingLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_loadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_loadingLabel, "setNumberOfLines:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_loadingLabel, "setTextColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
    -[UILabel setFont:](v4->_loadingLabel, "setFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Loading ..."), CFSTR("localized string not found"), 0));
    -[UILabel setText:](v4->_loadingLabel, "setText:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchLoadingTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v15, "addSubview:", v4->_loadingLabel);

    v16 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    loadingIndicator = v4->_loadingIndicator;
    v4->_loadingIndicator = v16;

    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v4->_loadingIndicator, "setActivityIndicatorViewStyle:", 100);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_loadingIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UIActivityIndicatorView setColor:](v4->_loadingIndicator, "setColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchLoadingTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v19, "addSubview:", v4->_loadingIndicator);

    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_loadingIndicator, "setHidesWhenStopped:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SearchLoadingTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v20);

    -[UIActivityIndicatorView startAnimating](v4->_loadingIndicator, "startAnimating");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](v4->_loadingIndicator, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchLoadingTableViewCell contentView](v4, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 10.0));
    v43[0] = v38;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v4->_loadingIndicator, "centerYAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SearchLoadingTableViewCell contentView](v4, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v43[1] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_loadingLabel, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](v4->_loadingIndicator, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 6.0));
    v43[2] = v31;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_loadingLabel, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchLoadingTableViewCell contentView](v4, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:constant:", v23, -10.0));
    v43[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_loadingLabel, "centerYAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchLoadingTableViewCell contentView](v4, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
    v43[4] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

  }
  return v4;
}

- (void)clearHeightConstraint
{
  NSLayoutConstraint *heightConstraint;

  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 0);
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = 0;

}

- (void)setHeightConstraint:(double)a3 withPriority:(float)a4
{
  NSLayoutConstraint *heightConstraint;
  float v8;
  float v9;
  NSLayoutConstraint *v11;
  double v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  double v17;

  heightConstraint = self->_heightConstraint;
  if (!heightConstraint)
    goto LABEL_12;
  -[NSLayoutConstraint priority](heightConstraint, "priority");
  if (v8 != a4)
  {
    -[NSLayoutConstraint priority](self->_heightConstraint, "priority");
    if (a4 == 1000.0 || v9 == 1000.0)
      -[SearchLoadingTableViewCell clearHeightConstraint](self, "clearHeightConstraint");
  }
  v11 = self->_heightConstraint;
  if (v11)
  {
    -[NSLayoutConstraint setConstant:](v11, "setConstant:", a3);
    -[NSLayoutConstraint priority](self->_heightConstraint, "priority");
    if (*(float *)&v12 != a4)
    {
      *(float *)&v12 = a4;
      -[NSLayoutConstraint setPriority:](self->_heightConstraint, "setPriority:", v12);
    }
  }
  else
  {
LABEL_12:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchLoadingTableViewCell contentView](self, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightAnchor"));
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", a3));
    v16 = self->_heightConstraint;
    self->_heightConstraint = v15;

    *(float *)&v17 = a4;
    -[NSLayoutConstraint setPriority:](self->_heightConstraint, "setPriority:", v17);
    -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchLoadingTableViewCell;
  -[SearchLoadingTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
}

@end
