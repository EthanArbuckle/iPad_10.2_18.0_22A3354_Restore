@implementation CHWorkoutDetailSummaryTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  double result;

  v3 = a3;
  v4 = objc_msgSend(v3, "_goalType");
  v5 = objc_msgSend(v3, "workoutActivityType");

  if (v4)
    v6 = 1;
  else
    v6 = v5 == (id)46;
  result = 184.0;
  if (!v6)
    return 128.0;
  return result;
}

+ (id)_geocoder
{
  if (qword_10083E0C8 != -1)
    dispatch_once(&qword_10083E0C8, &stru_10077A168);
  return (id)qword_10083E0C0;
}

+ (id)_locationArrowImage
{
  if (qword_10083E0D8 != -1)
    dispatch_once(&qword_10083E0D8, &stru_10077A188);
  return (id)qword_10083E0D0;
}

- (CHWorkoutDetailSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailSummaryTableViewCell *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *ringImageView;
  void *v8;
  UIImageView *v9;
  UIImageView *iconImageView;
  void *v11;
  UIImageView *v12;
  UIImageView *workoutTypeIconImageView;
  void *v14;
  UIStackView *v15;
  UIStackView *summaryContainer;
  double v17;
  void *v18;
  UILabel *v19;
  UILabel *workoutTypeLabel;
  void *v21;
  void *v22;
  double v23;
  UILabel *v24;
  UILabel *brandLabel;
  void *v26;
  void *v27;
  double v28;
  UILabel *v29;
  UILabel *completionLabel;
  void *v31;
  void *v32;
  double v33;
  _CHWorkoutDetailTextSpacerView *v34;
  double y;
  double width;
  double height;
  _CHWorkoutDetailTextSpacerView *v38;
  UILabel *v39;
  UILabel *swimmingDistanceByStrokeStyleLabel;
  void *v41;
  void *v42;
  double v43;
  _CHWorkoutDetailTextSpacerView *v44;
  _CHWorkoutDetailTextSpacerView *swimmingDistanceByStrokeStyleLabelTrailingSpacer;
  _CHWorkoutDetailTextSpacerView *v46;
  UILabel *v47;
  UILabel *timeRangeLabel;
  void *v49;
  void *v50;
  double v51;
  UILabel *v52;
  UILabel *locationLabel;
  void *v54;
  void *v55;
  double v56;
  UIView *v57;
  UIView *contentViewLayoutView;
  void *v59;
  id v60;
  void *v61;
  objc_super v63;

  v63.receiver = self;
  v63.super_class = (Class)CHWorkoutDetailSummaryTableViewCell;
  v4 = -[CHWorkoutDetailSummaryTableViewCell initWithStyle:reuseIdentifier:](&v63, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[CHWorkoutDetailSummaryTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    ringImageView = v4->_ringImageView;
    v4->_ringImageView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_ringImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v8, "addSubview:", v4->_ringImageView);

    v9 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](v4->_iconImageView, "setUserInteractionEnabled:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v11, "addSubview:", v4->_iconImageView);

    v12 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    workoutTypeIconImageView = v4->_workoutTypeIconImageView;
    v4->_workoutTypeIconImageView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_workoutTypeIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v14, "addSubview:", v4->_workoutTypeIconImageView);

    v15 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", &__NSArray0__struct);
    summaryContainer = v4->_summaryContainer;
    v4->_summaryContainer = v15;

    -[UIStackView setAxis:](v4->_summaryContainer, "setAxis:", 1);
    -[UIStackView setDistribution:](v4->_summaryContainer, "setDistribution:", 3);
    -[UIStackView setAlignment:](v4->_summaryContainer, "setAlignment:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_summaryContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v17) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v4->_summaryContainer, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v18, "addSubview:", v4->_summaryContainer);

    v19 = (UILabel *)objc_alloc_init((Class)UILabel);
    workoutTypeLabel = v4->_workoutTypeLabel;
    v4->_workoutTypeLabel = v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_workoutTypeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_workoutTypeLabel, "setNumberOfLines:", 0);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v4->_workoutTypeLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_workoutTypeLabel, "setFont:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_workoutTypeLabel, "setTextColor:", v22);

    LODWORD(v23) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_workoutTypeLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v4->_workoutTypeLabel);
    v24 = (UILabel *)objc_alloc_init((Class)UILabel);
    brandLabel = v4->_brandLabel;
    v4->_brandLabel = v24;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_brandLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_brandLabel, "setNumberOfLines:", 0);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v4->_brandLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_brandLabel, "setFont:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_brandLabel, "setTextColor:", v27);

    LODWORD(v28) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_brandLabel, "setContentCompressionResistancePriority:forAxis:", 1, v28);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v4->_brandLabel);
    v29 = (UILabel *)objc_alloc_init((Class)UILabel);
    completionLabel = v4->_completionLabel;
    v4->_completionLabel = v29;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_completionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v4->_completionLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setNumberOfLines:](v4->_completionLabel, "setNumberOfLines:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_completionLabel, "setFont:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_completionLabel, "setTextColor:", v32);

    LODWORD(v33) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_completionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v33);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v4->_completionLabel);
    v34 = [_CHWorkoutDetailTextSpacerView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v38 = -[_CHWorkoutDetailTextSpacerView initWithFrame:](v34, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v38);
    v39 = (UILabel *)objc_alloc_init((Class)UILabel);
    swimmingDistanceByStrokeStyleLabel = v4->_swimmingDistanceByStrokeStyleLabel;
    v4->_swimmingDistanceByStrokeStyleLabel = v39;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_swimmingDistanceByStrokeStyleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v4->_swimmingDistanceByStrokeStyleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_swimmingDistanceByStrokeStyleLabel, "setFont:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_swimmingDistanceByStrokeStyleLabel, "setTextColor:", v42);

    -[UILabel setNumberOfLines:](v4->_swimmingDistanceByStrokeStyleLabel, "setNumberOfLines:", 0);
    LODWORD(v43) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_swimmingDistanceByStrokeStyleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v43);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v4->_swimmingDistanceByStrokeStyleLabel);
    v44 = -[_CHWorkoutDetailTextSpacerView initWithFrame:]([_CHWorkoutDetailTextSpacerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v44);
    swimmingDistanceByStrokeStyleLabelTrailingSpacer = v4->_swimmingDistanceByStrokeStyleLabelTrailingSpacer;
    v4->_swimmingDistanceByStrokeStyleLabelTrailingSpacer = v44;
    v46 = v44;

    v47 = (UILabel *)objc_alloc_init((Class)UILabel);
    timeRangeLabel = v4->_timeRangeLabel;
    v4->_timeRangeLabel = v47;

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_timeRangeLabel, "setFont:", v49);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_timeRangeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_timeRangeLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v4->_timeRangeLabel, "setMinimumScaleFactor:", 0.8);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_timeRangeLabel, "setTextColor:", v50);

    LODWORD(v51) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_timeRangeLabel, "setContentCompressionResistancePriority:forAxis:", 1, v51);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v4->_timeRangeLabel);
    v52 = (UILabel *)objc_alloc_init((Class)UILabel);
    locationLabel = v4->_locationLabel;
    v4->_locationLabel = v52;

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v4->_locationLabel, "setFont:", v54);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_locationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_locationLabel, "setTextColor:", v55);

    LODWORD(v56) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_locationLabel, "setContentCompressionResistancePriority:forAxis:", 1, v56);
    -[UIStackView addArrangedSubview:](v4->_summaryContainer, "addArrangedSubview:", v4->_locationLabel);
    v57 = (UIView *)objc_alloc_init((Class)UIView);
    contentViewLayoutView = v4->_contentViewLayoutView;
    v4->_contentViewLayoutView = v57;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentViewLayoutView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v59, "addSubview:", v4->_contentViewLayoutView);

    v60 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "_navigateToSeymourWorkout");
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v61, "addGestureRecognizer:", v60);

    -[CHWorkoutDetailSummaryTableViewCell _constrainViews](v4, "_constrainViews");
  }
  return v4;
}

- (void)summaryConfigureWithWorkout:(id)a3 workoutActivity:(id)a4 fitnessAppContext:(id)a5 catalogItemViewModel:(id)a6 formattingManager:(id)a7 resizeBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  id *v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  unsigned int v43;
  void *v44;
  void *v45;
  id *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id location[2];

  v15 = a3;
  v16 = a4;
  v50 = a5;
  v48 = a6;
  v17 = a7;
  v49 = a8;
  objc_storeStrong((id *)&self->_currentWorkout, a3);
  objc_storeStrong((id *)&self->_currentWorkoutActivity, a4);
  objc_storeStrong((id *)&self->_fitnessAppContext, a5);
  objc_storeStrong((id *)&self->_catalogItemViewModel, a6);
  objc_storeWeak((id *)&self->_formattingManager, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "formattedTypeForWorkout:workoutActivity:context:", v15, v16, CFSTR("WorkoutDetailDisplayContext")));
  -[UILabel setAttributedText:](self->_workoutTypeLabel, "setAttributedText:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "formattedTimeRangeForWorkout:workoutActivity:context:", v15, v16, CFSTR("WorkoutDetailDisplayContext")));
  -[UILabel setAttributedText:](self->_timeRangeLabel, "setAttributedText:", v19);

  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fiui_connectedGymBrandName"));
  v47 = (void *)v20;
  if (v20)
    -[UILabel setText:](self->_brandLabel, "setText:", v20);
  else
    -[UIStackView removeArrangedSubview:](self->_summaryContainer, "removeArrangedSubview:", self->_brandLabel);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sourceRevision", &self->_fitnessAppContext));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "source"));
  v23 = objc_msgSend(v22, "_hasFirstPartyBundleID");

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sourceRevision"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "source"));
  if ((objc_msgSend(v25, "_isAppleWatch") & 1) != 0)
    v26 = 1;
  else
    v26 = objc_msgSend(v15, "_isWatchWorkout");

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "seymourCatalogItemDataProvider"));
  v28 = objc_msgSend(v27, "isSeymourWorkout:", v15);

  if (objc_msgSend(v15, "fiui_isConnectedGymWorkout"))
  {
    v29 = objc_msgSend(v17, "hasConnectedGymVendorIconForWorkout:", v15);
    objc_initWeak(location, self);
    if (((v29 ^ 1 | v28) & 1) == 0)
    {
      -[UIImageView setHidden:](self->_ringImageView, "setHidden:", 1);
      v30 = v48;
      -[UIImageView setHidden:](self->_workoutTypeIconImageView, "setHidden:", 1);
      -[UIImageView setHidden:](self->_iconImageView, "setHidden:", 0);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1000BA3B8;
      v56[3] = &unk_100779730;
      v31 = &v57;
      objc_copyWeak(&v57, location);
      objc_msgSend(v17, "fetchIconImageForWorkout:context:completion:", v15, CFSTR("WorkoutDetailDisplayContext"), v56);
      -[UILabel setHidden:](self->_completionLabel, "setHidden:", 1);
      goto LABEL_30;
    }
  }
  else
  {
    objc_initWeak(location, self);
  }
  if (v48)
    v32 = v28;
  else
    v32 = 0;
  if (v32 == 1)
  {
    v33 = objc_msgSend(v48, "isSeymourPairedWorkout");
    v30 = v48;
    -[UIImageView setHidden:](self->_workoutTypeIconImageView, "setHidden:", 1);
    -[UIImageView setHidden:](self->_ringImageView, "setHidden:", 1);
    -[UILabel setHidden:](self->_swimmingDistanceByStrokeStyleLabel, "setHidden:", 1);
    -[_CHWorkoutDetailTextSpacerView setHidden:](self->_swimmingDistanceByStrokeStyleLabelTrailingSpacer, "setHidden:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_iconImageView, "layer"));
    objc_msgSend(v34, "setMasksToBounds:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_iconImageView, "layer"));
    v36 = v35;
    v37 = 12.0;
    if (v33)
      v37 = 10.0;
    objc_msgSend(v35, "setCornerRadius:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "title"));
    -[UILabel setAttributedText:](self->_workoutTypeLabel, "setAttributedText:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "subtitle"));
    -[UILabel setAttributedText:](self->_completionLabel, "setAttributedText:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v46, "seymourCatalogItemDataProvider"));
    if (v33)
      v41 = 76.0;
    else
      v41 = 85.0;
    if (v33)
      v42 = 135.0;
    else
      v42 = 85.0;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000BA410;
    v53[3] = &unk_10077A1B0;
    v31 = &v55;
    objc_copyWeak(&v55, location);
    v54 = v49;
    objc_msgSend(v40, "fetchCatalogArtworkForCatalogItemViewModel:imageSize:completion:", v48, v53, v42, v41);

  }
  else
  {
    v30 = v48;
    v43 = objc_msgSend(v15, "isMultiSportWorkout") ^ 1;
    if (!v16)
      LOBYTE(v43) = 1;
    if ((v43 & 1) == 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "defaultCircularRingImageForContext:", CFSTR("WorkoutDetailDisplayContext")));
      -[UIImageView setImage:](self->_ringImageView, "setImage:", v44);

      -[CHWorkoutDetailSummaryTableViewCell _treatAsFirstPartyWorkout:workoutActivity:formattingManager:](self, "_treatAsFirstPartyWorkout:workoutActivity:formattingManager:", v15, v16, v17);
      goto LABEL_31;
    }
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000BA49C;
    v51[3] = &unk_100779730;
    v31 = &v52;
    objc_copyWeak(&v52, location);
    objc_msgSend(v17, "fetchIconImageForWorkout:context:completion:", v15, CFSTR("WorkoutDetailDisplayContext"), v51);
    if ((v23 & v26) == 1)
      -[CHWorkoutDetailSummaryTableViewCell _treatAsFirstPartyWorkout:workoutActivity:formattingManager:](self, "_treatAsFirstPartyWorkout:workoutActivity:formattingManager:", v15, v16, v17);
  }
LABEL_30:
  objc_destroyWeak(v31);
LABEL_31:
  if (objc_msgSend(v15, "workoutActivityType") == (id)84)
    -[UILabel setHidden:](self->_completionLabel, "setHidden:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "locationForWorkout:workoutActivity:", v15, v16));
  if (v45)
    -[UILabel setText:](self->_locationLabel, "setText:", CFSTR(" "));
  -[CHWorkoutDetailSummaryTableViewCell setLocation:](self, "setLocation:", v45);
  -[CHWorkoutDetailSummaryTableViewCell setLocation:completion:](self, "setLocation:completion:", v45, 0);
  -[CHWorkoutDetailSummaryTableViewCell setNeedsLayout](self, "setNeedsLayout");

  objc_destroyWeak(location);
}

- (void)_navigateToSeymourWorkout
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourCatalogItemDataProvider](self->_fitnessAppContext, "seymourCatalogItemDataProvider"));
  v4 = objc_msgSend(v3, "isSeymourWorkout:", self->_currentWorkout);

  if (v4)
    -[CHFitnessAppContext navigateToWorkout:](self->_fitnessAppContext, "navigateToWorkout:", self->_currentWorkout);
}

- (void)_treatAsFirstPartyWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  UIImageView *workoutTypeIconImageView;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  id v49;
  const __CFString *v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  char *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  NSAttributedStringKey v78;
  void *v79;
  NSAttributedStringKey v80;
  void *v81;
  _QWORD v82[2];
  _QWORD v83[2];
  void *v84;
  UIFontDescriptorAttributeName v85;
  void *v86;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors metricColorsForWorkout:](ARUIMetricColors, "metricColorsForWorkout:", v8));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nonGradientTextColor"));

  -[UIImageView setHidden:](self->_ringImageView, "setHidden:", 0);
  if (v9)
    v13 = v9;
  else
    v13 = v8;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fiui_activityType"));
  v14 = objc_msgSend(v8, "fiui_isConnectedGymWorkout");
  workoutTypeIconImageView = self->_workoutTypeIconImageView;
  v75 = (void *)v12;
  if ((v14 & 1) != 0)
  {
    -[UIImageView setHidden:](workoutTypeIconImageView, "setHidden:", 1);
  }
  else
  {
    -[UIImageView setHidden:](workoutTypeIconImageView, "setHidden:", 0);
    v16 = FIUIStaticWorkoutIconImage(v76, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithRenderingMode:", 2));

    -[UIImageView setImage:](self->_workoutTypeIconImageView, "setImage:", v18);
    -[UIImageView setTintColor:](self->_workoutTypeIconImageView, "setTintColor:", v12);

  }
  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", 1);
  v19 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", &stru_1007AE1D0);
  if (!v9)
  {
    v68 = (char *)objc_msgSend(v8, "_goalType") - 1;
    v73 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fitnessUIFormattingManager"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayDetail:", v20));

    v74 = (__CFString *)v21;
    if (!v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fitnessUIFormattingManager"));
      v77 = &stru_1007AE1D0;
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedGoalDescriptionForWorkout:withValue:appendActivityType:", v8, &v77, 0));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_completionLabel, "font"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fontDescriptor"));
    v85 = UIFontDescriptorFeatureSettingsAttribute;
    v82[0] = UIFontFeatureTypeIdentifierKey;
    v82[1] = UIFontFeatureSelectorIdentifierKey;
    v83[0] = &off_1007B3DD0;
    v83[1] = &off_1007B3DE8;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 2));
    v84 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v84, 1));
    v86 = v26;
    v27 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));

    v70 = (void *)v27;
    v71 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "fontDescriptorByAddingAttributes:", v27));
    v72 = v23;
    objc_msgSend(v23, "pointSize");
    v29 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v28));
    v30 = (void *)v29;
    if ((unint64_t)v68 > 2)
    {
      if (!objc_msgSend(v8, "isRaceWorkout"))
      {
        v57 = objc_alloc((Class)NSAttributedString);
        v31 = v74;
        if (v74)
          v58 = v74;
        else
          v58 = &stru_1007AE1D0;
        v43 = objc_msgSend(v57, "initWithString:", v58);
        goto LABEL_29;
      }
      v67 = v28;
      v69 = v30;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "fitnessUIFormattingManager"));
      objc_msgSend(v8, "raceWorkoutDisplayDistance");
      v46 = v45;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fiui_activityType"));
      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedCompactGoalDescriptionForGoalType:goalValue:activityType:", 1, v47, v46));

      v49 = objc_alloc((Class)NSMutableAttributedString);
      v31 = v74;
      if (v74)
        v50 = v74;
      else
        v50 = &stru_1007AE1D0;
      v51 = objc_msgSend(v49, "initWithString:", v50);
      v52 = -[__CFString rangeOfString:](v74, "rangeOfString:", v48);
      if (v52 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v54 = v52;
        v55 = v53;
        v78 = NSFontAttributeName;
        v79 = v69;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
        objc_msgSend(v51, "addAttributes:range:", v56, v54, v55);

        v31 = v74;
      }
      v43 = objc_msgSend(v51, "copy");

      v19 = (id)v48;
    }
    else
    {
      v67 = v28;
      v69 = (void *)v29;
      v31 = v74;
      v32 = objc_claimAutoreleasedReturnValue(-[__CFString localizedLowercaseString](v74, "localizedLowercaseString"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SUMMARY_GOAL_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      if (v32)
        v35 = (const __CFString *)v32;
      else
        v35 = &stru_1007AE1D0;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v35));

      v37 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v36);
      v38 = objc_msgSend(v36, "rangeOfString:", v32);
      if (v38 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v40 = v38;
        v41 = v39;
        v80 = NSFontAttributeName;
        v81 = v69;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1));
        objc_msgSend(v37, "addAttributes:range:", v42, v40, v41);

        v31 = v74;
      }
      v43 = objc_msgSend(v37, "copy");

      v19 = (id)v32;
      v9 = 0;
    }
    v28 = v67;
    v30 = v69;
LABEL_29:

    v19 = v43;
    v10 = v73;
  }
  v59 = v75;
  -[UILabel setAttributedText:](self->_completionLabel, "setAttributedText:", v19);
  -[UILabel setColor:](self->_completionLabel, "setColor:", v75);
  if (objc_msgSend(v76, "identifier") == (id)46)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell swimDistanceByStrokeStyle](self, "swimDistanceByStrokeStyle"));

    if (v60)
    {
      if (v9)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutConfiguration"));
        v62 = objc_msgSend(v61, "swimmingLocationType");

      }
      else
      {
        v62 = objc_msgSend(v8, "fi_swimmingLocationType");
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell swimDistanceByStrokeStyle](self, "swimDistanceByStrokeStyle"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "formattedDistanceByStrokeStyle:isPoolSwim:context:", v63, v62 == (id)1, CFSTR("WorkoutDetailDisplayContext")));
      -[UILabel setAttributedText:](self->_swimmingDistanceByStrokeStyleLabel, "setAttributedText:", v64);

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_swimmingDistanceByStrokeStyleLabel, "attributedText"));
      v66 = objc_msgSend(v65, "length");

      v59 = v75;
      if (v66)
        self->_shouldShowSubtypeLabel = 1;
    }
  }
  -[UILabel setHidden:](self->_swimmingDistanceByStrokeStyleLabel, "setHidden:", !self->_shouldShowSubtypeLabel);
  -[_CHWorkoutDetailTextSpacerView setHidden:](self->_swimmingDistanceByStrokeStyleLabelTrailingSpacer, "setHidden:", !self->_shouldShowSubtypeLabel);

}

- (void)setLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  if (a3)
  {
    v7 = a3;
    *(_QWORD *)&v9 = objc_opt_class(self, v8).n128_u64[0];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geocoder", v9));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BAD58;
    v12[3] = &unk_100778848;
    v12[4] = self;
    v13 = v6;
    objc_msgSend(v11, "reverseGeocodeLocation:completionHandler:", v7, v12);

  }
}

- (void)setSwimDistanceByStrokeStyle:(id)a3
{
  id WeakRetained;
  HKWorkout *currentWorkout;
  HKWorkoutActivity *currentWorkoutActivity;
  CHFitnessAppContext *fitnessAppContext;
  CHCatalogItemViewModel *catalogItemViewModel;
  id v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, a3);
  if (self->_currentWorkout)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_formattingManager);

    if (WeakRetained)
    {
      currentWorkout = self->_currentWorkout;
      currentWorkoutActivity = self->_currentWorkoutActivity;
      fitnessAppContext = self->_fitnessAppContext;
      catalogItemViewModel = self->_catalogItemViewModel;
      v10 = objc_loadWeakRetained((id *)&self->_formattingManager);
      -[CHWorkoutDetailSummaryTableViewCell summaryConfigureWithWorkout:workoutActivity:fitnessAppContext:catalogItemViewModel:formattingManager:resizeBlock:](self, "summaryConfigureWithWorkout:workoutActivity:fitnessAppContext:catalogItemViewModel:formattingManager:resizeBlock:", currentWorkout, currentWorkoutActivity, fitnessAppContext, catalogItemViewModel, v10, 0);

    }
  }

}

- (BOOL)_workoutIsThirdParty:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sourceRevision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "source"));
  v5 = objc_msgSend(v4, "_isAppleWatch") ^ 1;

  return v5;
}

- (void)_constrainViews
{
  id v3;
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
  void *v25;
  void *v26;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSArray *v54;
  NSArray *addedConstraints;
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
  _QWORD v71[7];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];

  if (!-[NSArray count](self->_addedConstraints, "count"))
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_ringImageView, "leadingAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_ringImageView, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 14.0));

    v75[0] = v70;
    v75[1] = v69;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 2));
    objc_msgSend(v3, "addObjectsFromArray:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_workoutTypeIconImageView, "centerXAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_ringImageView, "centerXAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_workoutTypeIconImageView, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_ringImageView, "centerYAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));

    v74[0] = v68;
    v74[1] = v67;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 2));
    objc_msgSend(v3, "addObjectsFromArray:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_iconImageView, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 14.0));

    v73[0] = v66;
    v73[1] = v65;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 2));
    objc_msgSend(v3, "addObjectsFromArray:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_summaryContainer, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_ringImageView, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 16.0));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_summaryContainer, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 16.0));
    v61 = v3;
    objc_msgSend(v3, "addObject:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_summaryContainer, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_summaryContainer, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 14.0));

    v72[0] = v64;
    v72[1] = v63;
    v72[2] = v62;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 3));
    objc_msgSend(v3, "addObjectsFromArray:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_contentViewLayoutView, "widthAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 30.0));

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentViewLayoutView, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 14.0));

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentViewLayoutView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, -14.0));

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentViewLayoutView, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailSummaryTableViewCell contentView](self, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v44));

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_contentViewLayoutView, "heightAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](self->_summaryContainer, "heightAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v46));

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_contentViewLayoutView, "heightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_iconImageView, "heightAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v48));

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_contentViewLayoutView, "heightAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_ringImageView, "heightAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v51));

    v71[0] = v60;
    v71[1] = v59;
    v71[2] = v58;
    v71[3] = v57;
    v71[4] = v56;
    v71[5] = v49;
    v71[6] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 7));
    objc_msgSend(v61, "addObjectsFromArray:", v53);

    v54 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v61);
    addedConstraints = self->_addedConstraints;
    self->_addedConstraints = v54;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_addedConstraints);
  }
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSDictionary)swimDistanceByStrokeStyle
{
  return self->_swimDistanceByStrokeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_addedConstraints, 0);
  objc_storeStrong((id *)&self->_contentViewLayoutView, 0);
  objc_storeStrong((id *)&self->_swimmingDistanceByStrokeStyleLabelTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_timeRangeLabel, 0);
  objc_storeStrong((id *)&self->_swimmingDistanceByStrokeStyleLabel, 0);
  objc_storeStrong((id *)&self->_completionLabel, 0);
  objc_storeStrong((id *)&self->_brandLabel, 0);
  objc_storeStrong((id *)&self->_workoutTypeLabel, 0);
  objc_storeStrong((id *)&self->_summaryContainer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_workoutTypeIconImageView, 0);
  objc_storeStrong((id *)&self->_ringImageView, 0);
  objc_destroyWeak((id *)&self->_formattingManager);
  objc_storeStrong((id *)&self->_catalogItemViewModel, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_currentWorkoutActivity, 0);
  objc_storeStrong((id *)&self->_currentWorkout, 0);
}

@end
