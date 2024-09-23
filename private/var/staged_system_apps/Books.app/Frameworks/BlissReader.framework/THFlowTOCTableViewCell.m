@implementation THFlowTOCTableViewCell

- (THFlowTOCTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  THFlowTOCTableViewCell *v4;
  THFlowTOCTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THFlowTOCTableViewCell;
  v4 = -[THFlowTOCTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[THFlowTOCTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[THFlowTOCTableViewCell p_setupContentView](v5, "p_setupContentView");
  }
  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[THFlowTOCTableViewCell setDelegate:](self, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell openCloseButton](self, "openCloseButton"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell pageNumberLabel](self, "pageNumberLabel"));
  objc_msgSend(v5, "setHidden:", 1);

  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCTableViewCell;
  -[THFlowTOCTableViewCell prepareForReuse](&v6, "prepareForReuse");
}

- (void)updateBackgroundImage
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell backgroundView](self, "backgroundView"));

  if (!v3)
  {
    v4 = objc_alloc((Class)UIView);
    -[THFlowTOCTableViewCell frame](self, "frame");
    v5 = objc_msgSend(v4, "initWithFrame:");
    -[THFlowTOCTableViewCell setBackgroundView:](self, "setBackgroundView:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell delegate](self, "delegate"));
  v7 = objc_msgSend(v6, "tableViewCellShouldStayHighlighted:", self);

  v8 = -[THFlowTOCTableViewCell isHighlighted](self, "isHighlighted") | v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell delegate](self, "delegate"));
  objc_msgSend(v9, "tableViewCell:hideSeparators:", self, v8);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tableViewCellBackgroundColor:", self));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell backgroundView](self, "backgroundView"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

}

- (void)startProgressIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell openCloseButton](self, "openCloseButton"));
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v5, "setHidden:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v6, "startAnimating");

  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_B8ABC;
  v8[3] = &unk_426D30;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B8B18;
  v7[3] = &unk_426DA8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, v7, 0.0, 0.25);
}

- (void)stopProgressIndicator
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B8BE0;
  v3[3] = &unk_426D30;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_B8C3C;
  v2[3] = &unk_426DA8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v3, v2, 0.0, 0.0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCTableViewCell;
  -[THFlowTOCTableViewCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell delegate](self, "delegate"));
  objc_msgSend(v5, "tableViewCellHighlightDidChange:", self);

  -[THFlowTOCTableViewCell updateBackgroundImage](self, "updateBackgroundImage");
}

- (void)p_setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *mOrdinalLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *mRowLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *mPageNumberLabel;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIButton *v28;
  UIButton *mOpenCloseButton;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UIActivityIndicatorView *v34;
  UIActivityIndicatorView *mActivityIndicatorView;
  void *v36;

  if (self->mOrdinalLabel)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupContentView]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 226, CFSTR("expected nil value for '%s'"), "mOrdinalLabel");

  }
  v6 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mOrdinalLabel = self->mOrdinalLabel;
  self->mOrdinalLabel = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v12, "addSubview:", self->mOrdinalLabel);

  if (self->mRowLabel)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupContentView]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 230, CFSTR("expected nil value for '%s'"), "mRowLabel");

  }
  v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mRowLabel = self->mRowLabel;
  self->mRowLabel = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v18, "addSubview:", self->mRowLabel);

  if (self->mPageNumberLabel)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupContentView]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, v21, 234, CFSTR("expected nil value for '%s'"), "mPageNumberLabel");

  }
  v22 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mPageNumberLabel = self->mPageNumberLabel;
  self->mPageNumberLabel = v22;

  -[UILabel setHidden:](self->mPageNumberLabel, "setHidden:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v24, "addSubview:", self->mPageNumberLabel);

  if (self->mOpenCloseButton)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupContentView]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 239, CFSTR("expected nil value for '%s'"), "mOpenCloseButton");

  }
  v28 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mOpenCloseButton = self->mOpenCloseButton;
  self->mOpenCloseButton = v28;

  -[UIButton setHidden:](self->mOpenCloseButton, "setHidden:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v30, "addSubview:", self->mOpenCloseButton);

  if (self->mActivityIndicatorView)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupContentView]"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, v33, 244, CFSTR("expected nil value for '%s'"), "mActivityIndicatorView");

  }
  v34 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  mActivityIndicatorView = self->mActivityIndicatorView;
  self->mActivityIndicatorView = v34;

  -[UIActivityIndicatorView setHidden:](self->mActivityIndicatorView, "setHidden:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v36, "addSubview:", self->mActivityIndicatorView);

  -[THFlowTOCTableViewCell p_setupConstraints](self, "p_setupConstraints");
}

- (void)p_setupConstraints
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *mOrdinalLabelLeadingConstraint;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *mOrdinalLabelWidthConstraint;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *mOpenCloseButtonTrailingConstraint;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *mOpenCloseButtonWidthConstraint;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *mPageNumberLabelTrailingConstraint;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *mPageNumberLabelWidthConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *mRowLabelLeadingConstraint;
  void *v45;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[18];

  if (self->mOrdinalLabelLeadingConstraint)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupConstraints]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 259, CFSTR("expected nil value for '%s'"), "mOrdinalLabelLeadingConstraint");

  }
  if (self->mOrdinalLabelWidthConstraint)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupConstraints]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 260, CFSTR("expected nil value for '%s'"), "mOrdinalLabelWidthConstraint");

  }
  if (self->mRowLabelLeadingConstraint)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupConstraints]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 261, CFSTR("expected nil value for '%s'"), "mRowLabelLeadingConstraint");

  }
  if (self->mPageNumberLabelTrailingConstraint)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupConstraints]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 262, CFSTR("expected nil value for '%s'"), "mPageNumberLabelTrailingConstraint");

  }
  if (self->mPageNumberLabelWidthConstraint)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupConstraints]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 263, CFSTR("expected nil value for '%s'"), "mPageNumberLabelWidthConstraint");

  }
  if (self->mOpenCloseButtonTrailingConstraint)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupConstraints]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 264, CFSTR("expected nil value for '%s'"), "mOpenCloseButtonTrailingConstraint");

  }
  if (self->mOpenCloseButtonWidthConstraint)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowTOCTableViewCell p_setupConstraints]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowTOCViewController.m"));
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 265, CFSTR("expected nil value for '%s'"), "mOpenCloseButtonWidthConstraint");

  }
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->mOrdinalLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->mRowLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->mPageNumberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->mOpenCloseButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->mActivityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell contentView](self, "contentView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->mOrdinalLabel, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
  v85[0] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->mOrdinalLabel, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v85[1] = v79;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->mOrdinalLabel, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
  mOrdinalLabelLeadingConstraint = self->mOrdinalLabelLeadingConstraint;
  self->mOrdinalLabelLeadingConstraint = v25;

  v85[2] = v25;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->mOrdinalLabel, "widthAnchor"));
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:", 0.0));
  mOrdinalLabelWidthConstraint = self->mOrdinalLabelWidthConstraint;
  self->mOrdinalLabelWidthConstraint = v27;

  v85[3] = v27;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->mOpenCloseButton, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v72));
  v85[4] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->mOpenCloseButton, "bottomAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
  v85[5] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->mOpenCloseButton, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
  mOpenCloseButtonTrailingConstraint = self->mOpenCloseButtonTrailingConstraint;
  self->mOpenCloseButtonTrailingConstraint = v29;

  v85[6] = v29;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->mOpenCloseButton, "widthAnchor"));
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", 0.0));
  mOpenCloseButtonWidthConstraint = self->mOpenCloseButtonWidthConstraint;
  self->mOpenCloseButtonWidthConstraint = v31;

  v85[7] = v31;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->mPageNumberLabel, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
  v85[8] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->mPageNumberLabel, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v85[9] = v59;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->mPageNumberLabel, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->mOpenCloseButton, "leadingAnchor"));
  v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  mPageNumberLabelTrailingConstraint = self->mPageNumberLabelTrailingConstraint;
  self->mPageNumberLabelTrailingConstraint = v33;

  v85[10] = v33;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->mPageNumberLabel, "widthAnchor"));
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToConstant:", 0.0));
  mPageNumberLabelWidthConstraint = self->mPageNumberLabelWidthConstraint;
  self->mPageNumberLabelWidthConstraint = v35;

  v85[11] = v35;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->mActivityIndicatorView, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](self->mOpenCloseButton, "centerXAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v55));
  v85[12] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->mActivityIndicatorView, "centerYAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->mOpenCloseButton, "centerYAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v85[13] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->mRowLabel, "topAnchor"));
  v58 = v24;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v85[14] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->mRowLabel, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  v85[15] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->mRowLabel, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->mOrdinalLabel, "trailingAnchor"));
  v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  mRowLabelLeadingConstraint = self->mRowLabelLeadingConstraint;
  self->mRowLabelLeadingConstraint = v43;

  v85[16] = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->mRowLabel, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->mPageNumberLabel, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
  v85[17] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 18));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

}

- (void)updateConstraintsWithConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "sectionLabelRightMargin");
  v6 = v5;
  objc_msgSend(v4, "discloseButtonLeftMargin");
  -[NSLayoutConstraint setConstant:](self->mPageNumberLabelTrailingConstraint, "setConstant:", -(v6 + v7));
  objc_msgSend(v4, "discloseButtonRightMargin");
  -[NSLayoutConstraint setConstant:](self->mOpenCloseButtonTrailingConstraint, "setConstant:", -v8);
  objc_msgSend(v4, "discloseButtonWidth");
  v10 = v9;

  -[NSLayoutConstraint setConstant:](self->mOpenCloseButtonWidthConstraint, "setConstant:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue(-[THFlowTOCTableViewCell contentView](self, "contentView"));
  objc_msgSend(v11, "setNeedsLayout");

}

- (void)updateOrdinalLabelFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NSLayoutConstraint setConstant:](self->mOrdinalLabelLeadingConstraint, "setConstant:", CGRectGetMinX(a3));
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  -[NSLayoutConstraint setConstant:](self->mOrdinalLabelWidthConstraint, "setConstant:", CGRectGetWidth(v8));
}

- (void)updatePageNumberLabelWidth:(double)a3
{
  double v5;
  void *v6;

  -[NSLayoutConstraint constant](self->mPageNumberLabelWidthConstraint, "constant");
  if (v5 != a3)
  {
    -[NSLayoutConstraint setConstant:](self->mPageNumberLabelWidthConstraint, "setConstant:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->mPageNumberLabel, "superview"));
    objc_msgSend(v6, "setNeedsLayout");

    -[UILabel setNeedsLayout](self->mPageNumberLabel, "setNeedsLayout");
    -[UILabel setNeedsLayout](self->mRowLabel, "setNeedsLayout");
  }
}

- (THFlowTOCTableViewCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THFlowTOCTableViewCellDelegate *)a3;
}

- (NSIndexPath)indexPath
{
  return self->mIndexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->mIndexPath, a3);
}

- (UILabel)ordinalLabel
{
  return self->mOrdinalLabel;
}

- (UILabel)rowLabel
{
  return self->mRowLabel;
}

- (UILabel)pageNumberLabel
{
  return self->mPageNumberLabel;
}

- (UIButton)openCloseButton
{
  return self->mOpenCloseButton;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->mActivityIndicatorView;
}

- (BOOL)introMovieWillTransitionToTOC
{
  return self->_introMovieWillTransitionToTOC;
}

- (void)setIntroMovieWillTransitionToTOC:(BOOL)a3
{
  self->_introMovieWillTransitionToTOC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->mOpenCloseButton, 0);
  objc_storeStrong((id *)&self->mPageNumberLabel, 0);
  objc_storeStrong((id *)&self->mRowLabel, 0);
  objc_storeStrong((id *)&self->mOrdinalLabel, 0);
  objc_storeStrong((id *)&self->mIndexPath, 0);
  objc_storeStrong((id *)&self->mOpenCloseButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->mPageNumberLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->mOpenCloseButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->mPageNumberLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->mRowLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->mOrdinalLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->mOrdinalLabelLeadingConstraint, 0);
}

@end
