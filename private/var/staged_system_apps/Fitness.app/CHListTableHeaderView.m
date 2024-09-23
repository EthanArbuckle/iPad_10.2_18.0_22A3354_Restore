@implementation CHListTableHeaderView

+ (double)preferredHeight
{
  return 48.0;
}

+ (id)_monthYearDateFormatter
{
  if (qword_10083E028 != -1)
    dispatch_once(&qword_10083E028, &stru_100779B80);
  return (id)qword_10083E020;
}

- (CHListTableHeaderView)initWithReuseIdentifier:(id)a3
{
  CHListTableHeaderView *v3;
  CHListTableHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHListTableHeaderView;
  v3 = -[CHListTableHeaderView initWithReuseIdentifier:](&v6, "initWithReuseIdentifier:", a3);
  v4 = v3;
  if (v3)
    -[CHListTableHeaderView _commonInit](v3, "_commonInit");
  return v4;
}

- (CHListTableHeaderView)initWithFrame:(CGRect)a3
{
  CHListTableHeaderView *v3;
  CHListTableHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHListTableHeaderView;
  v3 = -[CHListTableHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHListTableHeaderView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *dateLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v16 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v16, "setBackgroundColor:", v7);

  -[CHListTableHeaderView setBackgroundView:](self, "setBackgroundView:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration extraProminentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "extraProminentInsetGroupedHeaderConfiguration"));
  objc_msgSend(v8, "directionalLayoutMargins");
  -[CHListTableHeaderView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:");
  v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  dateLabel = self->_dateLabel;
  self->_dateLabel = v9;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_dateLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "font"));
  -[UILabel setFont:](self->_dateLabel, "setFont:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_dateLabel, "setBackgroundColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHListTableHeaderView contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", self->_dateLabel);

  -[CHListTableHeaderView constrainViews](self, "constrainViews");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHListTableHeaderView;
  -[CHListTableHeaderView prepareForReuse](&v3, "prepareForReuse");
  -[UILabel setText:](self->_dateLabel, "setText:", 0);
}

- (void)setDate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "_monthYearDateFormatter");
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v4));

  -[UILabel setText:](self->_dateLabel, "setText:", v7);
  -[CHListTableHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)constrainViews
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
  double v19;
  void *v20;
  _QWORD v21[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_dateLabel, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHListTableHeaderView contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 14.0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_dateLabel, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHListTableHeaderView contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 15.0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_dateLabel, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHListTableHeaderView contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -15.0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_dateLabel, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHListTableHeaderView contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -0.0));

  LODWORD(v19) = 1132068864;
  objc_msgSend(v18, "setPriority:", v19);
  v21[0] = v6;
  v21[1] = v10;
  v21[2] = v14;
  v21[3] = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
