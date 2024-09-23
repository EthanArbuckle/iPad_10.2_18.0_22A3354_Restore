@implementation CHFriendListTableViewCell

- (void)_setupCell
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGFloat y;
  double width;
  double height;
  UILabel *v16;
  UILabel *detailLineOneLabel;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *detailLineTwoLabel;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  ARUIRingsView *v26;
  ARUIRingsView *ringsView;
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  id v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[CHFriendListTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = sub_100032490();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v8, "setCornerRadius:", 12.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v11, "setLineBreakMode:", 4);

  v12 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v16 = (UILabel *)objc_msgSend(v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  detailLineOneLabel = self->_detailLineOneLabel;
  self->_detailLineOneLabel = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell detailLineOneLabel](self, "detailLineOneLabel"));
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  detailLineTwoLabel = self->_detailLineTwoLabel;
  self->_detailLineTwoLabel = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  objc_msgSend(v22, "addSubview:", self->_detailLineTwoLabel);

  v23 = objc_alloc((Class)ARUIRingsView);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIRingGroup activityRingGroupForRingType:](ARUIRingGroup, "activityRingGroupForRingType:", 3));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "forCompanion"));
  v26 = (ARUIRingsView *)objc_msgSend(v23, "initWithRingGroup:", v25);
  ringsView = self->_ringsView;
  self->_ringsView = v26;

  -[CHFriendListTableViewCell valueForSmallWidth:mediumWidth:largeWidth:](self, "valueForSmallWidth:mediumWidth:largeWidth:", 0.788, 0.923, 1.0);
  v29 = v28;
  *(float *)&y = v28 * 52.0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
  LODWORD(v31) = LODWORD(y);
  objc_msgSend(v30, "setGroupDiameter:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
  *(float *)&y = v29 * 6.0;
  LODWORD(v33) = LODWORD(y);
  objc_msgSend(v32, "setThickness:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
  *(float *)&v29 = v29 * 1.0;
  LODWORD(v35) = LODWORD(v29);
  objc_msgSend(v34, "setInterspacing:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ARUIRingsView setBackgroundColor:](self->_ringsView, "setBackgroundColor:", v36);

  v37 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  objc_msgSend(v37, "addSubview:", self->_ringsView);

}

- (CHFriendListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHFriendListTableViewCell *v4;
  CHFriendListTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHFriendListTableViewCell;
  v4 = -[CHFriendListTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[CHFriendListTableViewCell _setupCell](v4, "_setupCell");
  return v5;
}

- (CHFriendListTableViewCell)initWithFrame:(CGRect)a3
{
  CHFriendListTableViewCell *v3;
  CHFriendListTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHFriendListTableViewCell;
  v3 = -[CHFriendListTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHFriendListTableViewCell _setupCell](v3, "_setupCell");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  void *v45;
  void *v46;
  UILabel **p_detailLineOneLabel;
  unint64_t displayMode;
  double v49;
  UIImageView *competitionBadgeView;
  double MidX;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  CGRect recta;
  void *v63;
  void *v64;
  void *v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = CHFriendListTableViewCell;
  -[CGFloat layoutSubviews]((objc_super *)&recta.origin.y, "layoutSubviews");
  v3 = sub_100032C10();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "frame");
  v12 = v5 + v11;
  v14 = v3 + v13;
  v16 = v15 - (v5 + v9);
  v18 = v17 - (v3 + v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[CHFriendListTableViewCell valueForSmallWidth:mediumWidth:largeWidth:](self, "valueForSmallWidth:mediumWidth:largeWidth:", 0.788, 0.923, 1.0);
  v30 = 52.0 * v29 + 1.0;
  -[CHFriendListTableViewCell valueForSmallWidth:mediumWidth:largeWidth:](self, "valueForSmallWidth:mediumWidth:largeWidth:", 17.0, 20.0, 22.0);
  v32 = v31;
  v66.origin.x = v22;
  v66.origin.y = v24;
  v66.size.width = v26;
  v66.size.height = v28;
  -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", v32, CGRectGetMidY(v66) + v30 * -0.5, v30, v30);
  -[ARUIRingsView frame](self->_ringsView, "frame");
  v33 = v32 + CGRectGetMaxX(v67);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "font"));
  objc_msgSend(v35, "_scaledValueForValue:", 28.0);
  v37 = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v38, "sizeToFit");

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v39, "frame");
  v41 = v40;
  v43 = v42;

  recta.origin.x = v22;
  v68.origin.x = v22;
  v68.origin.y = v24;
  v68.size.width = v26;
  v68.size.height = v28;
  v44 = CGRectGetMaxX(v68) - v33 + -4.0;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v45, "setFrame:", v33, v41, v44, v43);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v46, "_setFirstLineBaselineFrameOriginY:", v37);

  p_detailLineOneLabel = &self->_detailLineOneLabel;
  -[UILabel sizeToFit](self->_detailLineOneLabel, "sizeToFit");
  -[UILabel frame](self->_detailLineOneLabel, "frame");
  -[UILabel setFrame:](self->_detailLineOneLabel, "setFrame:", v33);
  displayMode = self->_displayMode;
  if (displayMode < 4)
  {
    -[UILabel _setLastLineBaselineFrameOriginY:](*p_detailLineOneLabel, "_setLastLineBaselineFrameOriginY:", v37 + 28.0);
    v49 = v37 + 28.0 + 28.0;
LABEL_3:
    p_detailLineOneLabel = &self->_detailLineTwoLabel;
    -[UILabel sizeToFit](self->_detailLineTwoLabel, "sizeToFit", *(_QWORD *)&recta.origin.x);
    -[UILabel frame](self->_detailLineTwoLabel, "frame");
    -[UILabel setFrame:](self->_detailLineTwoLabel, "setFrame:", v33);
LABEL_4:
    -[UILabel _setLastLineBaselineFrameOriginY:](*p_detailLineOneLabel, "_setLastLineBaselineFrameOriginY:", v49, *(_QWORD *)&recta.origin.x);
    goto LABEL_5;
  }
  if (displayMode == 4)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](*p_detailLineOneLabel, "font"));
    objc_msgSend(v58, "_scaledValueForValue:", 20.0);
    v60 = v59;

    v61 = v37 + v60;
    -[UILabel _setLastLineBaselineFrameOriginY:](*p_detailLineOneLabel, "_setLastLineBaselineFrameOriginY:", v61);
    v49 = v61 + 28.0;
    goto LABEL_3;
  }
  if (displayMode == 5)
  {
    v49 = v37 + 42.0;
    goto LABEL_4;
  }
LABEL_5:
  if (self->_competitionBadgeView)
  {
    -[CHFriendListTableViewCell bounds](self, "bounds");
    -[UIImageView setFrame:](self->_competitionBadgeView, "setFrame:", CGRectGetWidth(v69) + -34.0 + -21.0, 0.0, 21.0, 21.0);
    competitionBadgeView = self->_competitionBadgeView;
    -[UIImageView frame](competitionBadgeView, "frame");
    MidX = CGRectGetMidX(v70);
    v71.origin.x = recta.origin.x;
    v71.origin.y = v24;
    v71.size.width = v26;
    v71.size.height = v28;
    -[UIImageView setCenter:](competitionBadgeView, "setCenter:", MidX, CGRectGetMidY(v71));
  }
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0, *(_QWORD *)&recta.origin.x) == (id)1)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
    *(_QWORD *)&recta.size.height = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell detailLineOneLabel](self, "detailLineOneLabel"));
    v63 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell detailLineTwoLabel](self, "detailLineTwoLabel"));
    v64 = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell ringsView](self, "ringsView"));
    v65 = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &recta.size.height, 4));

    if (self->_competitionBadgeView)
    {
      v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "arrayByAddingObject:"));

      v56 = (void *)v57;
    }
    -[CHFriendListTableViewCell ch_transformViewsForRightToLeftLanguages:](self, "ch_transformViewsForRightToLeftLanguages:", v56);

  }
}

+ (double)preferredHeight
{
  return 100.0;
}

+ (double)measuredHeightWithDisplayMode:(int64_t)a3 formattingManager:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = qword_10083DF18;
  v6 = a4;
  if (v5 != -1)
    dispatch_once(&qword_10083DF18, &stru_100778028);
  objc_msgSend((id)qword_10083DF10, "setDisplayMode:", a3);
  objc_msgSend((id)qword_10083DF10, "setFriend:snapshot:formattingManager:animated:", 0, 0, v6, 0);

  objc_msgSend((id)qword_10083DF10, "layoutIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v7, "_scaledValueForValue:", 21.0);
  v9 = v8;
  objc_msgSend((id)qword_10083DF10, "_lastBaseline");
  v11 = v9 + v10;

  return v11;
}

- (void)setFriend:(id)a3 snapshot:(id)a4 formattingManager:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HKActivitySummary *v20;
  void *v21;
  id v22;
  void *v23;
  UIImageView *competitionBadgeView;
  UIImageView *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  UIImageView *v30;
  UIImageView *v31;
  int64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UILabel *detailLineTwoLabel;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;

  v6 = a6;
  v63 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ASDisplayContext displayContextWithName:](ASDisplayContext, "displayContextWithName:", kASDisplayContextCompanion));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nameFont"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "font"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyColorForDisplayMode:", -[CHFriendListTableViewCell displayMode](self, "displayMode")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "as_friendListNameStringWithDotPrefix:keyColor:", v16, v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v19, "setAttributedText:", v18);

  if ((objc_msgSend(v10, "hasCarriedForwardGoals") & 1) != 0)
    v20 = 0;
  else
    v20 = (HKActivitySummary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activitySummary"));
  -[ARUIRingsView hk_configureWithActivitySummary:animated:](self->_ringsView, "hk_configureWithActivitySummary:animated:", v20, v6);
  if (objc_msgSend(v10, "hasCarriedForwardGoals"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activitySummary"));
    v22 = objc_msgSend(v21, "_isStandalonePhoneSummary");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ARUIRingsView ringGroup](self->_ringsView, "ringGroup"));
    objc_msgSend(v23, "setIsStandalonePhoneFitnessMode:animated:", v22, v6);

  }
  competitionBadgeView = self->_competitionBadgeView;
  if (competitionBadgeView)
  {
    -[UIImageView removeFromSuperview](competitionBadgeView, "removeFromSuperview");
    v25 = self->_competitionBadgeView;
    self->_competitionBadgeView = 0;

  }
  if (objc_msgSend(v63, "isAwaitingCompetitionResponseFromMe"))
  {
    v26 = objc_alloc((Class)UIImageView);
    v27 = ActivitySharingBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("InvitationPendingBadge"), v28));
    v30 = (UIImageView *)objc_msgSend(v26, "initWithImage:", v29);
    v31 = self->_competitionBadgeView;
    self->_competitionBadgeView = v30;

    -[CHFriendListTableViewCell addSubview:](self, "addSubview:", self->_competitionBadgeView);
  }
  if (!v20)
    v20 = objc_opt_new(HKActivitySummary);
  v32 = -[CHFriendListTableViewCell displayMode](self, "displayMode");
  v33 = v63;
  switch(v32)
  {
    case 0:
    case 1:
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[HKActivitySummary as_movePercentStringWithContext:snapshot:](v20, "as_movePercentStringWithContext:snapshot:", v12, v10));
      -[UILabel setAttributedText:](self->_detailLineOneLabel, "setAttributedText:", v34);

      v35 = objc_claimAutoreleasedReturnValue(-[HKActivitySummary as_moveProgressStringWithContext:formattingManager:snapshot:](v20, "as_moveProgressStringWithContext:formattingManager:snapshot:", v12, v11, v10));
      goto LABEL_16;
    case 2:
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[HKActivitySummary as_exerciseProgressStringWithContext:](v20, "as_exerciseProgressStringWithContext:", v12));
      -[UILabel setAttributedText:](self->_detailLineOneLabel, "setAttributedText:", v36);

      v35 = objc_claimAutoreleasedReturnValue(-[HKActivitySummary as_exerciseDurationStringWithContext:](v20, "as_exerciseDurationStringWithContext:", v12));
      goto LABEL_16;
    case 3:
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[HKActivitySummary as_stepsStringWithContext:](v20, "as_stepsStringWithContext:", v12));
      -[UILabel setAttributedText:](self->_detailLineOneLabel, "setAttributedText:", v37);

      v35 = objc_claimAutoreleasedReturnValue(-[HKActivitySummary as_distanceStringWithContext:formattingManager:](v20, "as_distanceStringWithContext:formattingManager:", v12, v11));
LABEL_16:
      v38 = (void *)v35;
      -[UILabel setAttributedText:](self->_detailLineTwoLabel, "setAttributedText:", v35);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
      v40 = v39;
      detailLineTwoLabel = self->_detailLineTwoLabel;
      goto LABEL_17;
    case 4:
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "friendWorkouts"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v10, "snapshotIndex")));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v54));
      v56 = ASWorkoutNameString(v55, v12);
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      -[UILabel setAttributedText:](self->_detailLineOneLabel, "setAttributedText:", v57);

      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "friendWorkouts"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v10, "snapshotIndex")));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v59));
      v61 = ASWorkoutCaloriesString(v60, v12, v11);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      -[UILabel setAttributedText:](self->_detailLineTwoLabel, "setAttributedText:", v62);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendListTableViewCell contentView](self, "contentView"));
      v40 = v39;
      detailLineTwoLabel = self->_detailLineTwoLabel;
LABEL_17:
      objc_msgSend(v39, "addSubview:", detailLineTwoLabel);

      goto LABEL_18;
    case 5:
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[HKActivitySummary as_pushesStringWithContext:](v20, "as_pushesStringWithContext:", v12));
      -[UILabel setAttributedText:](self->_detailLineOneLabel, "setAttributedText:", v52);

      -[UILabel removeFromSuperview](self->_detailLineTwoLabel, "removeFromSuperview");
LABEL_18:
      v33 = v63;
      break;
    default:
      break;
  }
  if (v33)
  {
    if ((objc_msgSend(v33, "isMe") & 1) != 0)
    {
      v42 = CFSTR("me");
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "UUID"));
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "UUIDString"));

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    v45 = v44;
    if (v44)
      v46 = v44;
    else
      v46 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v47 = v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "components:fromDate:toDate:options:", 16, v47, v49, 0));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("friend_row_%ld_%@"), objc_msgSend(v50, "day"), v42));
    -[CHFriendListTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v51);

  }
  -[CHFriendListTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (double)_lastBaseline
{
  UILabel **p_detailLineTwoLabel;
  void *v4;
  double result;

  p_detailLineTwoLabel = &self->_detailLineTwoLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_detailLineTwoLabel, "superview"));

  if (!v4)
    p_detailLineTwoLabel = &self->_detailLineOneLabel;
  -[UILabel _lastLineBaselineFrameOriginY](*p_detailLineTwoLabel, "_lastLineBaselineFrameOriginY");
  return result;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (ARUIRingsView)ringsView
{
  return self->_ringsView;
}

- (void)setRingsView:(id)a3
{
  objc_storeStrong((id *)&self->_ringsView, a3);
}

- (UILabel)detailLineOneLabel
{
  return self->_detailLineOneLabel;
}

- (void)setDetailLineOneLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLineOneLabel, a3);
}

- (UILabel)detailLineTwoLabel
{
  return self->_detailLineTwoLabel;
}

- (void)setDetailLineTwoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLineTwoLabel, a3);
}

- (UIImageView)competitionBadgeView
{
  return self->_competitionBadgeView;
}

- (void)setCompetitionBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_competitionBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_competitionBadgeView, 0);
  objc_storeStrong((id *)&self->_detailLineTwoLabel, 0);
  objc_storeStrong((id *)&self->_detailLineOneLabel, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end
