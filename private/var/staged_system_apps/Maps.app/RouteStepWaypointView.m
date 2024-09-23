@implementation RouteStepWaypointView

- (RouteStepWaypointView)initWithFrame:(CGRect)a3
{
  RouteStepWaypointView *v3;
  RouteStepWaypointView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UIView *v8;
  UIImageView *v9;
  UIImageView *pinImageView;
  UILabel *v11;
  UILabel *primaryTextLabel;
  UILabel *v13;
  UILabel *secondaryTextLabel;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *containerWidthConstraint;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *imageWidthConstraint;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *imageHeightConstraint;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *primaryTopConstraint;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSLayoutConstraint *primaryTrailingConstraint;
  void *v33;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *secondaryTopConstraint;
  void *v37;
  void *v38;
  uint64_t v39;
  NSLayoutConstraint *primaryCenterYConstraint;
  void *v41;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *textToBottomConstraint;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  UIView *v72;
  objc_super v73;
  _QWORD v74[12];

  v73.receiver = self;
  v73.super_class = (Class)RouteStepWaypointView;
  v3 = -[RouteStepListView initWithFrame:](&v73, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[RouteStepWaypointView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("LeadingContainer"));
    -[RouteStepWaypointView addSubview:](v4, "addSubview:", v8);
    v9 = objc_opt_new(UIImageView);
    pinImageView = v4->_pinImageView;
    v4->_pinImageView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_pinImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_pinImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIdentifier:](v4->_pinImageView, "setAccessibilityIdentifier:", CFSTR("PinImageView"));
    v72 = v8;
    -[UIView addSubview:](v8, "addSubview:", v4->_pinImageView);
    v11 = objc_opt_new(UILabel);
    primaryTextLabel = v4->_primaryTextLabel;
    v4->_primaryTextLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_primaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_primaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_primaryTextLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryTextLabel"));
    -[RouteStepWaypointView addSubview:](v4, "addSubview:", v4->_primaryTextLabel);
    v13 = objc_opt_new(UILabel);
    secondaryTextLabel = v4->_secondaryTextLabel;
    v4->_secondaryTextLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_secondaryTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_secondaryTextLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_secondaryTextLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryTextLabel"));
    -[RouteStepWaypointView addSubview:](v4, "addSubview:", v4->_secondaryTextLabel);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v8, "widthAnchor"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
    containerWidthConstraint = v4->_containerWidthConstraint;
    v4->_containerWidthConstraint = (NSLayoutConstraint *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v4->_pinImageView, "widthAnchor"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 0.0));
    imageWidthConstraint = v4->_imageWidthConstraint;
    v4->_imageWidthConstraint = (NSLayoutConstraint *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v4->_pinImageView, "heightAnchor"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 0.0));
    imageHeightConstraint = v4->_imageHeightConstraint;
    v4->_imageHeightConstraint = (NSLayoutConstraint *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_primaryTextLabel, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView topAnchor](v4, "topAnchor"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    primaryTopConstraint = v4->_primaryTopConstraint;
    v4->_primaryTopConstraint = (NSLayoutConstraint *)v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_primaryTextLabel, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView safeAreaLayoutGuide](v4, "safeAreaLayoutGuide"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
    primaryTrailingConstraint = v4->_primaryTrailingConstraint;
    v4->_primaryTrailingConstraint = (NSLayoutConstraint *)v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_secondaryTextLabel, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_primaryTextLabel, "bottomAnchor"));
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    secondaryTopConstraint = v4->_secondaryTopConstraint;
    v4->_secondaryTopConstraint = (NSLayoutConstraint *)v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_primaryTextLabel, "centerYAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v72, "centerYAnchor"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    primaryCenterYConstraint = v4->_primaryCenterYConstraint;
    v4->_primaryCenterYConstraint = (NSLayoutConstraint *)v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_secondaryTextLabel, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView bottomAnchor](v4, "bottomAnchor"));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
    textToBottomConstraint = v4->_textToBottomConstraint;
    v4->_textToBottomConstraint = (NSLayoutConstraint *)v43;

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v72, "leadingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView safeAreaLayoutGuide](v4, "safeAreaLayoutGuide"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
    v74[0] = v67;
    v74[1] = v4->_containerWidthConstraint;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v72, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView topAnchor](v4, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
    v74[2] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v72, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView bottomAnchor](v4, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
    v74[3] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v4->_pinImageView, "centerXAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v72, "centerXAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
    v74[4] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_pinImageView, "centerYAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v72, "centerYAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
    v74[5] = v55;
    v74[6] = v4->_imageWidthConstraint;
    v74[7] = v4->_imageHeightConstraint;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_primaryTextLabel, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v72, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v45));
    v74[8] = v46;
    v74[9] = v4->_primaryTrailingConstraint;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_secondaryTextLabel, "leadingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_primaryTextLabel, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));
    v74[10] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_secondaryTextLabel, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_primaryTextLabel, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
    v74[11] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v53);

  }
  return v4;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  if (self->_shouldUseTextToBottomConstraint != a3)
  {
    self->_shouldUseTextToBottomConstraint = a3;
    -[NSLayoutConstraint setActive:](self->_textToBottomConstraint, "setActive:");
  }
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;

  v6 = a3;
  v7 = objc_opt_class(RouteStepWaypointItem);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v10, "imageAreaWidth");
  v12 = a4 - v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v13, "textTrailingMargin");
  v15 = v12 - v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v16, "imageTopMargin");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v19, "waypointImageHeight");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v22, "imageBottomMargin");
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryText"));
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
    objc_msgSend(v26, "primaryTextTopMargin");
    v28 = v27 + 0.0;

    objc_msgSend(v25, "boundingRectWithSize:options:context:", 1, 0, v15, 1.79769313e308);
    v30 = v28 + ceil(v29);
  }
  else
  {
    v30 = 0.0;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondaryText"));
  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
    objc_msgSend(v32, "secondaryTextTopMargin");
    v34 = v30 + v33;

    objc_msgSend(v31, "boundingRectWithSize:options:context:", 1, 0, v15, 1.79769313e308);
    v30 = v34 + ceil(v35);
  }
  v36 = v18 + v21 + v24;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metrics"));
  objc_msgSend(v37, "textBottomMargin");
  v39 = v30 + v38;

  if (v36 <= v39)
    v36 = v39;

  return v36;
}

- (void)setItem:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)RouteStepWaypointView;
  -[RouteStepListView setItem:](&v49, "setItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListView item](self, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v5, "imageAreaWidth");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView containerWidthConstraint](self, "containerWidthConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v9, "waypointImageWidth");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView imageWidthConstraint](self, "imageWidthConstraint"));
  objc_msgSend(v12, "setConstant:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v13, "waypointImageHeight");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView imageHeightConstraint](self, "imageHeightConstraint"));
  objc_msgSend(v16, "setConstant:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v17, "primaryTextTopMargin");
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView primaryTopConstraint](self, "primaryTopConstraint"));
  objc_msgSend(v20, "setConstant:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v21, "primaryTextTrailingMargin");
  v23 = -v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView primaryTrailingConstraint](self, "primaryTrailingConstraint"));
  objc_msgSend(v24, "setConstant:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v25, "secondaryTextTopMargin");
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView secondaryTopConstraint](self, "secondaryTopConstraint"));
  objc_msgSend(v28, "setConstant:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metrics"));
  objc_msgSend(v29, "textBottomMargin");
  v31 = -v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView textToBottomConstraint](self, "textToBottomConstraint"));
  objc_msgSend(v32, "setConstant:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryText"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryText"));
  if (objc_msgSend(v33, "length") && objc_msgSend(v34, "length"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView primaryCenterYConstraint](self, "primaryCenterYConstraint"));
    objc_msgSend(v35, "setActive:", 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView primaryTopConstraint](self, "primaryTopConstraint"));
    objc_msgSend(v36, "setActive:", 1);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView secondaryTopConstraint](self, "secondaryTopConstraint"));
    objc_msgSend(v37, "setActive:", 1);

    v38 = -[RouteStepWaypointView shouldUseTextToBottomConstraint](self, "shouldUseTextToBottomConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView textToBottomConstraint](self, "textToBottomConstraint"));
    v40 = v39;
    v41 = v38;
  }
  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView primaryTopConstraint](self, "primaryTopConstraint"));
    objc_msgSend(v42, "setActive:", 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView secondaryTopConstraint](self, "secondaryTopConstraint"));
    objc_msgSend(v43, "setActive:", 0);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView primaryCenterYConstraint](self, "primaryCenterYConstraint"));
    objc_msgSend(v44, "setActive:", 1);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView textToBottomConstraint](self, "textToBottomConstraint"));
    v40 = v39;
    v41 = 0;
  }
  objc_msgSend(v39, "setActive:", v41);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView primaryTextLabel](self, "primaryTextLabel"));
  objc_msgSend(v45, "setAttributedText:", v33);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView secondaryTextLabel](self, "secondaryTextLabel"));
  objc_msgSend(v46, "setAttributedText:", v34);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pinImage"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointView pinImageView](self, "pinImageView"));
  objc_msgSend(v48, "setImage:", v47);

}

- (BOOL)shouldUseTextToBottomConstraint
{
  return self->_shouldUseTextToBottomConstraint;
}

- (UIImageView)pinImageView
{
  return self->_pinImageView;
}

- (void)setPinImageView:(id)a3
{
  objc_storeStrong((id *)&self->_pinImageView, a3);
}

- (UILabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextLabel, a3);
}

- (UILabel)secondaryTextLabel
{
  return self->_secondaryTextLabel;
}

- (void)setSecondaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextLabel, a3);
}

- (NSLayoutConstraint)containerWidthConstraint
{
  return self->_containerWidthConstraint;
}

- (void)setContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerWidthConstraint, a3);
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

- (NSLayoutConstraint)primaryTopConstraint
{
  return self->_primaryTopConstraint;
}

- (void)setPrimaryTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTopConstraint, a3);
}

- (NSLayoutConstraint)primaryTrailingConstraint
{
  return self->_primaryTrailingConstraint;
}

- (void)setPrimaryTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, a3);
}

- (NSLayoutConstraint)secondaryTopConstraint
{
  return self->_secondaryTopConstraint;
}

- (void)setSecondaryTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTopConstraint, a3);
}

- (NSLayoutConstraint)primaryCenterYConstraint
{
  return self->_primaryCenterYConstraint;
}

- (void)setPrimaryCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCenterYConstraint, a3);
}

- (NSLayoutConstraint)textToBottomConstraint
{
  return self->_textToBottomConstraint;
}

- (void)setTextToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_pinImageView, 0);
}

@end
