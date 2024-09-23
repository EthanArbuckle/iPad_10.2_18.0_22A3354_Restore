@implementation CHWorkoutDetailTwoValueTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  return 74.0;
}

- (CHWorkoutDetailTwoValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailTwoValueTableViewCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *titleLabel1;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel2;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *valueLabel1;
  void *v18;
  void *v19;
  void *v20;
  UILabel *v21;
  UILabel *valueLabel2;
  void *v23;
  void *v24;
  void *v25;
  UIView *v26;
  UIView *separatorView;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CHWorkoutDetailTwoValueTableViewCell;
  v4 = -[CHWorkoutDetailTwoValueTableViewCell initWithStyle:reuseIdentifier:](&v31, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[CHWorkoutDetailTwoValueTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel1 = v4->_titleLabel1;
    v4->_titleLabel1 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_titleLabel1, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel1, "setTextColor:", v9);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v10, "addSubview:", v4->_titleLabel1);

    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel2 = v4->_titleLabel2;
    v4->_titleLabel2 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_titleLabel2, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel2, "setTextColor:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v15, "addSubview:", v4->_titleLabel2);

    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel1 = v4->_valueLabel1;
    v4->_valueLabel1 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fu_sausageFontOfSize:](UIFont, "fu_sausageFontOfSize:", 30.0));
    -[UILabel setFont:](v4->_valueLabel1, "setFont:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_valueLabel1, "setTextColor:", v19);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_valueLabel1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_valueLabel1, "setNumberOfLines:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v20, "addSubview:", v4->_valueLabel1);

    v21 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel2 = v4->_valueLabel2;
    v4->_valueLabel2 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fu_sausageFontOfSize:](UIFont, "fu_sausageFontOfSize:", 30.0));
    -[UILabel setFont:](v4->_valueLabel2, "setFont:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_valueLabel2, "setTextColor:", v24);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_valueLabel2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_valueLabel2, "setNumberOfLines:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v25, "addSubview:", v4->_valueLabel2);

    v26 = (UIView *)objc_alloc_init((Class)UIView);
    separatorView = v4->_separatorView;
    v4->_separatorView = v26;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v4->_separatorView, "setBackgroundColor:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v29, "addSubview:", v4->_separatorView);

    -[CHWorkoutDetailTwoValueTableViewCell _constrainViews](v4, "_constrainViews");
  }
  return v4;
}

- (void)configureWithTitle1:(id)a3 value1:(id)a4
{
  UILabel *titleLabel1;
  id v7;

  titleLabel1 = self->_titleLabel1;
  v7 = a4;
  -[UILabel setText:](titleLabel1, "setText:", a3);
  -[UILabel setAttributedText:](self->_valueLabel1, "setAttributedText:", v7);

}

- (void)configureWithTitle2:(id)a3 value2:(id)a4
{
  UILabel *titleLabel2;
  id v7;

  titleLabel2 = self->_titleLabel2;
  v7 = a4;
  -[UILabel setText:](titleLabel2, "setText:", a3);
  -[UILabel setAttributedText:](self->_valueLabel2, "setAttributedText:", v7);

}

- (void)setHidesSeparator:(BOOL)a3
{
  self->_hidesSeparator = a3;
  -[UIView setHidden:](self->_separatorView, "setHidden:");
}

- (void)removeLeadingPadding
{
  -[NSLayoutConstraint setActive:](self->_title1Leading, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_separatorLeading, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_separatorTrailing, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_title1NoLeading, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_separatorNoLeading, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_separatorNoTrailing, "setActive:", 1);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailTwoValueTableViewCell;
  -[CHWorkoutDetailTwoValueTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[UILabel setText:](self->_titleLabel1, "setText:", 0);
  -[UILabel setAttributedText:](self->_valueLabel1, "setAttributedText:", 0);
  -[UILabel setText:](self->_titleLabel2, "setText:", 0);
  -[UILabel setAttributedText:](self->_valueLabel2, "setAttributedText:", 0);
}

- (void)_constrainViews
{
  UILabel *titleLabel1;
  void *v4;
  UILabel *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *title1Leading;
  UILabel *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *title1NoLeading;
  void *v14;
  NSLayoutConstraint *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  UILabel *titleLabel2;
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
  UIView *separatorView;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *separatorNoLeading;
  UIView *v35;
  void *v36;
  NSLayoutConstraint *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *separatorTrailing;
  UIView *v40;
  void *v41;
  id v42;
  void *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *separatorLeading;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *separatorNoTrailing;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];

  if (!self->_didAddConstraints)
  {
    titleLabel1 = self->_titleLabel1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", titleLabel1, 11, 0, v4, 3, 1.0, 28.0));

    v5 = self->_titleLabel1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v7 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 5, 0, v6, 5, 1.0, sub_10005F11C());
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v7);
    title1Leading = self->_title1Leading;
    self->_title1Leading = v8;

    v10 = self->_titleLabel1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 5, 0, v11, 5, 1.0, 0.0));
    title1NoLeading = self->_title1NoLeading;
    self->_title1NoLeading = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v15 = self->_title1Leading;
    v65[0] = v60;
    v65[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 2));
    objc_msgSend(v14, "addConstraints:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v17, "bounds");
    v19 = v18 * 0.5;

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel2, 11, 0, self->_titleLabel1, 11, 1.0, 0.0));
    titleLabel2 = self->_titleLabel2;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", titleLabel2, 5, 0, v21, 5, 1.0, v19));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v64[0] = v59;
    v64[1] = v58;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 2));
    objc_msgSend(v22, "addConstraints:", v23);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueLabel1, 11, 0, self->_titleLabel1, 11, 1.0, 30.0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueLabel1, 5, 0, self->_titleLabel1, 5, 1.0, 0.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v63[0] = v57;
    v63[1] = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 2));
    objc_msgSend(v25, "addConstraints:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueLabel2, 11, 0, self->_valueLabel1, 11, 1.0, 0.0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueLabel2, 5, 0, self->_titleLabel2, 5, 1.0, 0.0));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v62[0] = v27;
    v62[1] = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 2));
    objc_msgSend(v29, "addConstraints:", v30);

    separatorView = self->_separatorView;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", separatorView, 5, 0, v32, 5, 1.0, 0.0));
    separatorNoLeading = self->_separatorNoLeading;
    self->_separatorNoLeading = v33;

    v35 = self->_separatorView;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v37 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 6, 0, v36, 6, 1.0, -sub_10005F11C());
    v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v37);
    separatorTrailing = self->_separatorTrailing;
    self->_separatorTrailing = v38;

    v40 = self->_separatorView;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v42 = sub_10005F46C(v40, v41, 0, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);

    v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", 0));
    separatorLeading = self->_separatorLeading;
    self->_separatorLeading = v44;

    v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", 2));
    separatorNoTrailing = self->_separatorNoTrailing;
    self->_separatorNoTrailing = v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v61[0] = self->_separatorLeading;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", 1));
    v50 = self->_separatorTrailing;
    v61[1] = v49;
    v61[2] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", 3));
    v61[3] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 4));
    objc_msgSend(v48, "addConstraints:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailTwoValueTableViewCell contentView](self, "contentView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "heightAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", 74.0));

    LODWORD(v56) = 1148829696;
    objc_msgSend(v55, "setPriority:", v56);
    objc_msgSend(v55, "setActive:", 1);
    self->_didAddConstraints = 1;

  }
}

- (BOOL)hidesSeparator
{
  return self->_hidesSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorNoTrailing, 0);
  objc_storeStrong((id *)&self->_separatorTrailing, 0);
  objc_storeStrong((id *)&self->_separatorNoLeading, 0);
  objc_storeStrong((id *)&self->_separatorLeading, 0);
  objc_storeStrong((id *)&self->_title1NoLeading, 0);
  objc_storeStrong((id *)&self->_title1Leading, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_valueLabel2, 0);
  objc_storeStrong((id *)&self->_valueLabel1, 0);
  objc_storeStrong((id *)&self->_titleLabel2, 0);
  objc_storeStrong((id *)&self->_titleLabel1, 0);
}

@end
