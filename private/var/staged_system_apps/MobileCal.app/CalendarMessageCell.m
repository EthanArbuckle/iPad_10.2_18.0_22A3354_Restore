@implementation CalendarMessageCell

+ (id)_authorCache
{
  if (qword_1001F61E0 != -1)
    dispatch_once(&qword_1001F61E0, &stru_1001B3500);
  return (id)qword_1001F61D8;
}

+ (void)emptyAuthorCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_authorCache"));
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)authorCacheObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_authorCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

+ (void)authorCacheSetObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_authorCache"));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (CalendarMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CalendarMessageCell *v4;
  CalendarMessageCell *v5;
  uint64_t v6;
  UIView *authorView;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CalendarMessageCell;
  v4 = -[CalendarMessageCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_didSetupColorBarConstraints = 0;
    v4->_didSetupLabelConstraints = 0;
    v4->_didSetupDisclosureConstraints = 0;
    v6 = objc_claimAutoreleasedReturnValue(-[CalendarMessageCell provideAuthorView](v4, "provideAuthorView"));
    authorView = v5->_authorView;
    v5->_authorView = (UIView *)v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_authorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](v5, "contentView"));
    objc_msgSend(v8, "addSubview:", v5->_authorView);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)layoutSubviews
{
  int IsLeftToRight;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  objc_super v32;

  IsLeftToRight = CalInterfaceIsLeftToRight(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell superview](self, "superview"));
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  v8 = v7;

  v9 = -[CalendarMessageCell _shouldWrapTextUnderAuthor](self, "_shouldWrapTextUnderAuthor");
  if (v9)
  {
    v11 = CalRoundToScreenScale(v9, v10, 4.0);
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v11 + CalRoundToScreenScale(v12, v13, 6.0));
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    objc_msgSend(v16, "layoutMargins");
    v18 = v15 + v17;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    v19 = objc_msgSend(v16, "layoutMargins");
    v22 = v21 + CalRoundToScreenScale(v19, v20, 4.0);
    v25 = v22 + CalRoundToScreenScale(v23, v24, 6.0);
    v28 = v25 + CalRoundToScreenScale(v26, v27, 36.0);
    v18 = v28 + CalRoundToScreenScale(v29, v30, 6.0);
  }
  if (IsLeftToRight)
    v31 = v6;
  else
    v31 = v8;
  -[CalendarMessageCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v31 + v18, 0.0, 0.0);

  v32.receiver = self;
  v32.super_class = (Class)CalendarMessageCell;
  -[CalendarMessageCell layoutSubviews](&v32, "layoutSubviews");
}

- (id)provideAuthorView
{
  return objc_opt_new(EKUILabeledAvatarView);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalendarMessageCell;
  -[CalendarMessageCell prepareForReuse](&v3, "prepareForReuse");
  self->_didSetupColorBarConstraints = 0;
  self->_didSetupLabelConstraints = 0;
  self->_didSetupDisclosureConstraints = 0;
  -[CalendarMessageCell setConflictDict:](self, "setConflictDict:", 0);
}

- (void)setDestination:(unint64_t)a3
{
  uint64_t v4;
  id v5;

  if (self->_destination != a3)
  {
    self->_destination = a3;
    if (a3 == 2)
      v4 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listSidebarCellConfiguration](UIBackgroundConfiguration, "listSidebarCellConfiguration"));
    else
      v4 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
    v5 = (id)v4;
    -[CalendarMessageCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v4);

  }
}

+ (Class)cellClassForNotification:(id)a3
{
  __objc2_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  switch((unint64_t)objc_msgSend(a3, "type"))
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
      v5 = CalendarMessageEventInvitationCell;
      goto LABEL_9;
    case 3uLL:
      v5 = CalendarMessageAttendeeReplyCell;
      goto LABEL_9;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 0xBuLL:
      v5 = CalendarMessageResourceChangeCell;
      goto LABEL_9;
    case 8uLL:
      v5 = CalendarMessageSharedCalendarCell;
      goto LABEL_9;
    case 9uLL:
    case 0xAuLL:
      v5 = CalendarMessageInviteReplyCell;
      goto LABEL_9;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      v5 = CalendarMessageSuggestionCell;
LABEL_9:
      v8 = objc_opt_class(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    default:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CalendarMessageCell.m"), 241, CFSTR("Unexpected notification type"));

      v7 = 0;
      break;
  }
  return (Class)v7;
}

+ (id)strikethroughTitleColor:(unint64_t)a3
{
  uint64_t *v3;
  void *v4;
  Block_layout *v5;
  uint64_t v6;
  void *v7;

  if (a3 == 2)
  {
    v3 = &qword_1001F61E8;
    v4 = (void *)qword_1001F61E8;
    if (!qword_1001F61E8)
    {
      v5 = &stru_1001B3540;
LABEL_6:
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v5));
      v7 = (void *)*v3;
      *v3 = v6;

      v4 = (void *)*v3;
    }
  }
  else
  {
    v3 = &qword_1001F61F0;
    v4 = (void *)qword_1001F61F0;
    if (!qword_1001F61F0)
    {
      v5 = &stru_1001B3560;
      goto LABEL_6;
    }
  }
  return v4;
}

+ (id)layoutMetrics
{
  void *v2;
  double v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  NSNumber *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumber *v12;
  void *v13;
  uint64_t v14;
  NSNumber *v15;
  void *v16;
  uint64_t v17;
  NSNumber *v18;
  void *v19;
  uint64_t v20;
  NSNumber *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[7];
  _QWORD v32[7];

  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10006AD40;
  v29 = &unk_1001B2DA0;
  v30 = a1;
  if (qword_1001F61F8 != -1)
    dispatch_once(&qword_1001F61F8, &v26);
  v2 = (void *)qword_1001F6200;
  if (!qword_1001F6200)
  {
    v3 = CalRoundToScreenScale(0, a2, 6.0);
    v4 = +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v3, v26, v27, v28, v29, v30);
    v6 = v5;
    v31[0] = CFSTR("verticalContainerPadding");
    v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CalRoundToScreenScale(v4, v7, 10.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v32[0] = v9;
    v31[1] = CFSTR("avatarPadding");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    v32[1] = v10;
    v31[2] = CFSTR("interLabelPadding");
    v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CalRoundToScreenScale(v10, v11, 4.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v32[2] = v13;
    v31[3] = CFSTR("verticalButtonPadding");
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CalRoundToScreenScale(v13, v14, 4.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v32[3] = v16;
    v31[4] = CFSTR("avatarSize");
    v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CalRoundToScreenScale(v16, v17, 36.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v32[4] = v19;
    v31[5] = CFSTR("colorBarWidth");
    v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CalRoundToScreenScale(v19, v20, 4.0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v31[6] = CFSTR("disclosureTrailingPadding");
    v32[5] = v22;
    v32[6] = &off_1001BCA50;
    v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 7));
    v24 = (void *)qword_1001F6200;
    qword_1001F6200 = v23;

    v2 = (void *)qword_1001F6200;
  }
  return v2;
}

+ (void)clearMetrics
{
  void *v2;

  v2 = (void *)qword_1001F6200;
  qword_1001F6200 = 0;

}

- (void)setupColorBarConstraintsIfNeeded
{
  id v3;
  NSDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (!self->_didSetupColorBarConstraints)
  {
    -[CalendarMessageCell _removeColorBarConstraintsIfNeeded](self, "_removeColorBarConstraintsIfNeeded");
    v3 = objc_msgSend((id)objc_opt_class(self), "layoutMetrics");
    v17 = (id)objc_claimAutoreleasedReturnValue(v3);
    v4 = _NSDictionaryOfVariableBindings(CFSTR("_colorBar"), self->_colorBar, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_colorBar]"), 512, v17, v5));
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageCellColorBarView widthAnchor](self->_colorBar, "widthAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell traitCollection](self, "traitCollection"));
    v11 = EKUIUsesLargeTextLayout(v9, v10);
    v13 = 6.0;
    if ((v11 & 1) == 0)
      v13 = CalRoundToScreenScale(v11, v12, 4.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", v13));
    objc_msgSend(v6, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(verticalContainerPadding)-[_colorBar]-(verticalContainerPadding)-|"), 0, v17, v5));
    objc_msgSend(v6, "addObjectsFromArray:", v15);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
    -[CalendarMessageCell setColorBarConstraints:](self, "setColorBarConstraints:", v16);

    self->_didSetupColorBarConstraints = 1;
  }
}

- (BOOL)_shouldWrapTextUnderAuthor
{
  void *v2;
  NSString *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell traitCollection](self, "traitCollection"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  v4 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityMedium) == NSOrderedDescending;

  return v4;
}

- (void)_removeColorBarConstraintsIfNeeded
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell colorBarConstraints](self, "colorBarConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell colorBarConstraints](self, "colorBarConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    -[CalendarMessageCell setColorBarConstraints:](self, "setColorBarConstraints:", 0);
  }
}

- (void)setupLabelConstraintsIfNeeded
{
  id v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSDictionary *v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *firstTitleLabelToContentViewTopConstraint;
  void *v37;
  double v38;
  double v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UILabel *v49;
  UILabel *senderLabel;
  UILabel *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  NSLayoutConstraint *v79;
  NSLayoutConstraint *lastTitleLabelToFirstBodyLabelConstraint;
  void *v81;
  void *v82;
  UILabel *v83;
  uint64_t j;
  UILabel *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  MessageCellWarningView *v92;
  MessageCellWarningView *warningView;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  MessageCellWarningView *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  NSLayoutConstraint *v110;
  NSLayoutConstraint *lastBodyLabelToResponseButtonsConstraint;
  unsigned int v112;
  void *v113;
  void *v114;
  void *v115;
  NSLayoutConstraint *v116;
  NSLayoutConstraint *statusButtonLeadingConstraint;
  void *v118;
  void *v119;
  NSLayoutConstraint *v120;
  NSLayoutConstraint *statusButtonTrailingConstraint;
  void *v122;
  void *v123;
  void *v124;
  NSLayoutConstraint *v125;
  NSLayoutConstraint *bottomMostViewToContentViewBottomConstraint;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  UILabel *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  NSUInteger v140;
  UILabel *v141;
  NSUInteger v142;
  id firstValue;
  id v144;

  if (!self->_didSetupLabelConstraints)
  {
    -[CalendarMessageCell _removeLabelRelatedConstraintsIfNeeded](self, "_removeLabelRelatedConstraintsIfNeeded");
    v144 = objc_alloc_init((Class)NSMutableArray);
    v139 = objc_alloc_init((Class)NSMutableArray);
    v138 = objc_alloc_init((Class)NSMutableArray);
    v3 = objc_msgSend((id)objc_opt_class(self), "layoutMetrics");
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = -[NSArray count](self->_titleLabels, "count");
    firstValue = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", 0));
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:"));
    v6 = -[NSArray count](self->_actionLabels, "count");
    v140 = v6;
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_actionLabels, "objectAtIndexedSubscript:", 0));
      if (v7 == 1)
      {
        v135 = v8;
        v137 = v135;
      }
      else
      {
        v137 = v8;
        v135 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_actionLabels, "objectAtIndexedSubscript:", v7 - 1));
      }
    }
    else
    {
      v135 = 0;
      v137 = 0;
    }
    v142 = -[NSArray count](self->_bodyLabels, "count");
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_bodyLabels, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_authorView, "heightAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_authorView, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v144, "addObject:", v11);

    v12 = _NSDictionaryOfVariableBindings(CFSTR("_colorBar, _authorView"), self->_colorBar, self->_authorView, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_colorBar]-(avatarPadding)-[_authorView(==avatarSize)]"), 0, v4, v13));
    objc_msgSend(v144, "addObjectsFromArray:", v14);

    v134 = (void *)v4;
    if (-[CalendarMessageCell _shouldWrapTextUnderAuthor](self, "_shouldWrapTextUnderAuthor"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_authorView, "centerYAnchor"));
      v16 = firstValue;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(firstValue, "firstBaselineAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(firstValue, "font"));
      v19 = objc_msgSend(v18, "capHeight");
      v22 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -CalRoundToScreenScale(v19, v21, v20 * 0.5));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      objc_msgSend(v144, "addObject:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_authorView, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(firstValue, "leadingAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
      objc_msgSend(v144, "addObject:", v26);

    }
    else
    {
      v27 = _NSDictionaryOfVariableBindings(CFSTR("_authorView"), self->_authorView, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(verticalContainerPadding)-[_authorView]"), 0, v4, v28));
      objc_msgSend(v144, "addObjectsFromArray:", v29);

      v30 = _NSDictionaryOfVariableBindings(CFSTR("topTitleLabel,_authorView"), firstValue, self->_authorView, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v31 = v4;
      v16 = firstValue;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_authorView]-(avatarPadding)-[topTitleLabel]"), 0, v31, v24));
      objc_msgSend(v144, "addObjectsFromArray:", v25);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    v34 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 3, 0, v16, 3, 1.0, -(CalRoundToScreenScale(v32, v33, 10.0) + -1.0));
    v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v34);
    firstTitleLabelToContentViewTopConstraint = self->_firstTitleLabelToContentViewTopConstraint;
    self->_firstTitleLabelToContentViewTopConstraint = v35;

    objc_msgSend(v138, "addObject:", self->_firstTitleLabelToContentViewTopConstraint);
    -[CalendarMessageCell setHasDisclosure:](self, "setHasDisclosure:", self->_hasDisclosure);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "font"));
    objc_msgSend(v37, "_scaledValueForValue:", 4.0);
    v39 = v38;

    if (v5 >= 2)
    {
      for (i = 1; i != v5; ++i)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", i));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", i - 1));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "topAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, v39));
        objc_msgSend(v144, "addObject:", v45);

        v16 = firstValue;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 5, 0, v41, 5, 1.0, 0.0));
        objc_msgSend(v144, "addObject:", v46);

        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 6, 0, v41, 6, 1.0, 0.0));
        objc_msgSend(v144, "addObject:", v47);

        if (i == v5 - 1)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 6, 0, firstValue, 6, 1.0, 0.0));
          objc_msgSend(v144, "addObject:", v48);

        }
      }
    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v144);
    objc_storeStrong((id *)&self->_titleLabelConstraints, v144);
    v49 = v132;
    senderLabel = self->_senderLabel;
    v51 = v49;
    if (senderLabel)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](senderLabel, "topAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v49, "bottomAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, 0.0));
      objc_msgSend(v139, "addObject:", v54);

      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_senderLabel, 5, 0, v49, 5, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v55);

      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_senderLabel, 6, 0, v49, 6, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v56);

      v51 = self->_senderLabel;
    }
    v141 = v49;
    if (v140)
    {
      v57 = v137;
      v58 = 0.0;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 5, 0, v16, 5, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v59);

      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
      v133 = v51;
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v51, "bottomAnchor"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, v39));
      objc_msgSend(v139, "addObject:", v62);

      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v135, 6, -1, v16, 6, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v63);

      LODWORD(v64) = 1148846080;
      objc_msgSend(v57, "setContentHuggingPriority:forAxis:", 0, v64);
      LODWORD(v65) = 1148846080;
      objc_msgSend(v57, "setContentCompressionResistancePriority:forAxis:", 0, v65);
      LODWORD(v66) = 1148846080;
      objc_msgSend(v57, "setContentHuggingPriority:forAxis:", 1, v66);
      LODWORD(v67) = 1148846080;
      objc_msgSend(v57, "setContentCompressionResistancePriority:forAxis:", 1, v67);
      v68 = v57;
      if (v140 != 1)
      {
        v69 = 1;
        v70 = v57;
        do
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_actionLabels, "objectAtIndexedSubscript:", v69));
          LODWORD(v71) = 1148846080;
          objc_msgSend(v68, "setContentHuggingPriority:forAxis:", 0, v71);
          LODWORD(v72) = 1148846080;
          objc_msgSend(v68, "setContentCompressionResistancePriority:forAxis:", 0, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v68, 5, 0, v70, 6, 1.0, 0.0));
          objc_msgSend(v139, "addObject:", v73);

          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v68, 12, 0, v57, 12, 1.0, 0.0));
          objc_msgSend(v139, "addObject:", v74);

          objc_msgSend(v68, "sizeToFit");
          objc_msgSend(v68, "frame");
          v58 = v58 + v75;

          ++v69;
          v70 = v68;
        }
        while (v140 != v69);
      }
      v16 = firstValue;
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 6, -1, firstValue, 6, 1.0, -v58));
      objc_msgSend(v139, "addObject:", v76);

      v51 = (UILabel *)v57;
    }
    if (v136)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "topAnchor"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v51, "bottomAnchor"));
      v79 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, v39));
      lastTitleLabelToFirstBodyLabelConstraint = self->_lastTitleLabelToFirstBodyLabelConstraint;
      self->_lastTitleLabelToFirstBodyLabelConstraint = v79;

      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v136, 5, 0, v16, 5, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v81);

      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v136, 6, 0, v16, 6, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v82);

      objc_msgSend(v138, "addObject:", self->_lastTitleLabelToFirstBodyLabelConstraint);
      v83 = v136;

      v51 = v83;
    }
    if (v142 < 2)
    {
      v85 = v51;
    }
    else
    {
      for (j = 1; j != v142; ++j)
      {
        v85 = (UILabel *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_bodyLabels, "objectAtIndexedSubscript:", j));
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_bodyLabels, "objectAtIndexedSubscript:", j - 1));
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v85, "topAnchor"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "bottomAnchor"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, v39));
        objc_msgSend(v139, "addObject:", v89);

        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v85, 5, 0, firstValue, 5, 1.0, 0.0));
        objc_msgSend(v139, "addObject:", v90);

        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v85, 6, 0, firstValue, 6, 1.0, 0.0));
        objc_msgSend(v139, "addObject:", v91);

        v51 = v85;
      }
    }
    v92 = (MessageCellWarningView *)v85;
    warningView = self->_warningView;
    if (warningView)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[MessageCellWarningView topAnchor](warningView, "topAnchor"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v85, "bottomAnchor"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, v39));
      v97 = v139;
      objc_msgSend(v139, "addObject:", v96);

      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_warningView, 5, 0, firstValue, 5, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v98);

      v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_warningView, 6, 0, firstValue, 6, 1.0, 0.0));
      objc_msgSend(v139, "addObject:", v99);

      v100 = self->_warningView;
      v92 = v100;
      v101 = v138;
    }
    else
    {
      v101 = v138;
      v97 = v139;
    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v97);
    objc_storeStrong((id *)&self->_bodyLabelConstraints, v97);
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "leadingButton"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "titleLabel"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "font"));
    objc_msgSend(v105, "_scaledValueForValue:", -10.0);
    v107 = v106;

    if (objc_msgSend(v102, "shouldUseVerticalLayout"))
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "topAnchor"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[MessageCellWarningView lastBaselineAnchor](v92, "lastBaselineAnchor"));
      v110 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v109, 1.125));
    }
    else
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "leadingButton"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "titleLabel"));
      v110 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v92, 4, 0, v109, 3, 1.0, v107));
    }
    lastBodyLabelToResponseButtonsConstraint = self->_lastBodyLabelToResponseButtonsConstraint;
    self->_lastBodyLabelToResponseButtonsConstraint = v110;

    objc_msgSend(v101, "addObject:", self->_lastBodyLabelToResponseButtonsConstraint);
    v112 = objc_msgSend(v102, "shouldUseVerticalLayout");
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "leadingAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(firstValue, "leadingAnchor"));
    if (v112)
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v114));
      objc_msgSend(v101, "addObject:", v115);

    }
    else
    {
      v116 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v114, 0.0));
      statusButtonLeadingConstraint = self->_statusButtonLeadingConstraint;
      self->_statusButtonLeadingConstraint = v116;

      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "trailingAnchor"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(firstValue, "trailingAnchor"));
      v120 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:constant:", v119, 0.0));
      statusButtonTrailingConstraint = self->_statusButtonTrailingConstraint;
      self->_statusButtonTrailingConstraint = v120;

      objc_msgSend(v101, "addObject:", self->_statusButtonLeadingConstraint);
      objc_msgSend(v101, "addObject:", self->_statusButtonTrailingConstraint);
    }
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "trailingButton"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "titleLabel"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    v125 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v123, 4, 0, v124, 4, 1.0, v107));
    bottomMostViewToContentViewBottomConstraint = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v125;

    objc_msgSend(v101, "addObject:", self->_bottomMostViewToContentViewBottomConstraint);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v101);
    v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_titleLabelConstraints));
    -[CalendarMessageCell setLabelRelatedConstraints:](self, "setLabelRelatedConstraints:", v127);

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell labelRelatedConstraints](self, "labelRelatedConstraints"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "arrayByAddingObjectsFromArray:", self->_bodyLabelConstraints));
    -[CalendarMessageCell setLabelRelatedConstraints:](self, "setLabelRelatedConstraints:", v129);

    v130 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell labelRelatedConstraints](self, "labelRelatedConstraints"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "arrayByAddingObjectsFromArray:", v101));
    -[CalendarMessageCell setLabelRelatedConstraints:](self, "setLabelRelatedConstraints:", v131);

    self->_didSetupLabelConstraints = 1;
  }
}

- (void)_removeLabelRelatedConstraintsIfNeeded
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell labelRelatedConstraints](self, "labelRelatedConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell labelRelatedConstraints](self, "labelRelatedConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    -[CalendarMessageCell setLabelRelatedConstraints:](self, "setLabelRelatedConstraints:", 0);
    self->_didSetupLabelConstraints = 0;
  }
}

- (void)setupDisclosureConstraintsIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  UIView *v6;
  void *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell disclosureConstraints](self, "disclosureConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

  v12 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_msgSend((id)objc_opt_class(self), "layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = self->_disclosureIndicatorView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", 0));
  if (v7)
  {
    v8 = _NSDictionaryOfVariableBindings(CFSTR("topTitleLabel, disclosureView"), v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[topTitleLabel]-[disclosureView]-|"), 4096, v5, v9));
    objc_msgSend(v12, "addObjectsFromArray:", v10);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v12));
    -[CalendarMessageCell setDisclosureConstraints:](self, "setDisclosureConstraints:", v11);

  }
}

- (void)_removeDisclosureConstraintsIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell disclosureConstraints](self, "disclosureConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

  v11 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_msgSend((id)objc_opt_class(self), "layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", 0));
  if (v6)
  {
    v7 = _NSDictionaryOfVariableBindings(CFSTR("topTitleLabel"), v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[topTitleLabel]-|"), 0, v5, v8));
    objc_msgSend(v11, "addObjectsFromArray:", v9);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v11));
    -[CalendarMessageCell setDisclosureConstraints:](self, "setDisclosureConstraints:", v10);

  }
}

- (void)setupCommentPromptConstraintsIfNeeded
{
  id v3;
  void *v4;
  UITextField *commentPrompt;
  UITextField *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *responseButtonsToCommentLabelConstraint;
  NSLayoutConstraint *v18;
  UITextField *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *bottomMostViewToContentViewBottomConstraint;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *v29;
  void *v30;
  id v31;

  -[CalendarMessageCell _removeCommentPromptRelatedConstraintsIfNeeded](self, "_removeCommentPromptRelatedConstraintsIfNeeded");
  v31 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = v3;
  commentPrompt = self->_commentPrompt;
  if (commentPrompt)
  {
    v6 = commentPrompt;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, v7, 5, 1.0, 0.0));

    objc_msgSend(v31, "addObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    v11 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 6, 0, v9, 6, 1.0, CalRoundToScreenScale(v9, v10, -29.0));
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v11);

    objc_msgSend(v31, "addObject:", v12);
    objc_msgSend(v4, "addObject:", self->_bottomMostViewToContentViewBottomConstraint);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
    v15 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 4, 0, self->_commentPrompt, 12, 1.0, -5.0 - CalRoundToScreenScale(v13, v14, 19.5));
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v15);

    objc_msgSend(v31, "addObject:", v16);
    responseButtonsToCommentLabelConstraint = self->_responseButtonsToCommentLabelConstraint;
    self->_responseButtonsToCommentLabelConstraint = v16;
    v18 = v16;

    v19 = self->_commentPrompt;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    v22 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 4, 0, v20, 4, 1.0, -CalRoundToScreenScale(v20, v21, 10.0));
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v22);

    objc_msgSend(v31, "addObject:", v23);
    bottomMostViewToContentViewBottomConstraint = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v23;

  }
  else
  {
    objc_msgSend(v3, "addObject:", self->_bottomMostViewToContentViewBottomConstraint);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    v28 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 4, 0, v26, 4, 1.0, -CalRoundToScreenScale(v26, v27, 10.0));
    v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v28);

    objc_msgSend(v31, "addObject:", v29);
    v12 = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v29;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v31));
  -[CalendarMessageCell setCommentPromptRelatedConstraints:](self, "setCommentPromptRelatedConstraints:", v30);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

}

- (void)_removeCommentPromptRelatedConstraintsIfNeeded
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell commentPromptRelatedConstraints](self, "commentPromptRelatedConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell commentPromptRelatedConstraints](self, "commentPromptRelatedConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    -[CalendarMessageCell setCommentPromptRelatedConstraints:](self, "setCommentPromptRelatedConstraints:", 0);
  }
}

- (void)setShowsCommentPrompt:(BOOL)a3 animated:(BOOL)a4 initialValue:(id)a5
{
  _BOOL4 v6;
  id v8;
  UITextField *v9;
  UITextField *commentPrompt;
  NSBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  UITextField *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  BOOL v20;

  v6 = a3;
  v8 = a5;
  if (self->_showsCommentPrompt == v6)
  {
    if (!v6)
      goto LABEL_12;
    goto LABEL_11;
  }
  self->_showsCommentPrompt = v6;
  if (v6)
  {
    v9 = objc_opt_new(UITextField);
    commentPrompt = self->_commentPrompt;
    self->_commentPrompt = v9;

    -[UITextField setBorderStyle:](self->_commentPrompt, "setBorderStyle:", 3);
    v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Comment to Organizer"), &stru_1001B67C0, 0));
    -[UITextField setPlaceholder:](self->_commentPrompt, "setPlaceholder:", v13);

    -[UITextField setClearButtonMode:](self->_commentPrompt, "setClearButtonMode:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    -[UITextField setFont:](self->_commentPrompt, "setFont:", v14);

    -[UITextField addTarget:action:forControlEvents:](self->_commentPrompt, "addTarget:action:forControlEvents:", self, "_commentPromptDone:", 0x80000);
    -[UITextField setDelegate:](self->_commentPrompt, "setDelegate:", self);
    -[UITextField setText:](self->_commentPrompt, "setText:", v8);
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_commentPrompt, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1144750080;
    -[UITextField setContentCompressionResistancePriority:forAxis:](self->_commentPrompt, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    v16 = (UITextField *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    -[UITextField addSubview:](v16, "addSubview:", self->_commentPrompt);
  }
  else
  {
    if (a4)
    {
      -[CalendarMessageCell updateSelectedResponseButton](self, "updateSelectedResponseButton");
      -[CalendarMessageCell setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_10;
    }
    -[CalendarMessageCell _removeCommentPromptRelatedConstraintsIfNeeded](self, "_removeCommentPromptRelatedConstraintsIfNeeded");
    -[UITextField removeFromSuperview](self->_commentPrompt, "removeFromSuperview");
    v16 = self->_commentPrompt;
    self->_commentPrompt = 0;
  }

  -[CalendarMessageCell updateSelectedResponseButton](self, "updateSelectedResponseButton");
  -[CalendarMessageCell setNeedsLayout](self, "setNeedsLayout");
  if (!a4)
  {
LABEL_11:
    -[CalendarMessageCell setupCommentPromptConstraintsIfNeeded](self, "setupCommentPromptConstraintsIfNeeded");
    goto LABEL_12;
  }
LABEL_10:
  -[CalendarMessageCell layoutIfNeeded](self, "layoutIfNeeded");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006C990;
  v19[3] = &unk_1001B2510;
  v19[4] = self;
  v20 = v6;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v19, 0.3);
  -[CalendarMessageCell setupCommentPromptConstraintsIfNeeded](self, "setupCommentPromptConstraintsIfNeeded");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _tableView](self, "_tableView"));
  objc_msgSend(v17, "beginUpdates");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _tableView](self, "_tableView"));
  objc_msgSend(v18, "endUpdates");

LABEL_12:
}

- (id)comment
{
  return -[UITextField text](self->_commentPrompt, "text");
}

- (void)_commentPromptDone:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  id v5;

  if (self->_commentPrompt == a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell delegate](self, "delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_commentPrompt, "text"));
    objc_msgSend(v5, "messageCell:committedComment:", self, v4);

  }
}

- (void)updateAuthor
{
  UIView *authorView;
  uint64_t v4;
  UIView *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  authorView = self->_authorView;
  v4 = objc_opt_class(EKUILabeledAvatarView);
  if ((objc_opt_isKindOfClass(authorView, v4) & 1) != 0)
  {
    v5 = self->_authorView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorCacheKeyForIdentity:](self, "authorCacheKeyForIdentity:", self->_notification));
    v7 = objc_msgSend((id)objc_opt_class(self), "authorCacheObjectForKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)v8;
    if (v8)
    {
      v17 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
      -[UIView updateWithContacts:](v5, "updateWithContacts:", v10);

    }
    else
    {
      if (-[UIView loadContactsAsynchronously](v5, "loadContactsAsynchronously"))
        -[UIView updateWithContacts:](v5, "updateWithContacts:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorAddressForIdentity:](self, "authorAddressForIdentity:", self->_notification));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarNotification name](self->_notification, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarNotification firstName](self->_notification, "firstName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarNotification lastName](self->_notification, "lastName"));
      -[UIView updateWithAddress:fullName:firstName:lastName:](v5, "updateWithAddress:fullName:firstName:lastName:", v11, v12, v13, v14);

      if ((-[UIView loadContactsAsynchronously](v5, "loadContactsAsynchronously") & 1) == 0)
      {
        v15 = (void *)objc_opt_class(self);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView contact](v5, "contact"));
        objc_msgSend(v15, "authorCacheSetObject:forKey:", v16, v6);

      }
    }

  }
}

- (id)authorAddressForIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddress"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resourceSpecifier"));

  }
  return v6;
}

- (id)authorCacheKeyForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorAddressForIdentity:](self, "authorAddressForIdentity:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastName"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v5, v6, v7, v8));
  return v9;
}

- (void)_updateLabels
{
  NSMutableSet *v3;
  NSMutableSet *v4;
  NSArray *titleLabels;
  UILabel *senderLabel;
  NSArray *actionLabels;
  NSArray *bodyLabels;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  NSMutableArray *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  UILabel *v27;
  UILabel *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  MessageCellWarningView *v57;
  MessageCellWarningView *v58;
  MessageCellWarningView *v59;
  void *v60;
  void *v61;
  MessageCellWarningView *warningView;
  NSMutableSet *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *j;
  NSArray *v68;
  NSArray *v69;
  NSArray *v70;
  NSArray *v71;
  NSArray *v72;
  NSMutableArray *v73;
  void *v74;
  MessageCellWarningView *v75;
  void *v76;
  void *v77;
  void *v78;
  NSArray *v79;
  NSMutableSet *v80;
  void *v81;
  void *v82;
  void *v83;
  NSArray *p_super;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  NSMutableArray *v94;
  id v95;
  _QWORD v96[5];
  NSMutableArray *v97;
  id v98;
  _QWORD v99[4];
  NSMutableSet *v100;
  CalendarMessageCell *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _QWORD v104[5];

  -[CalendarMessageCell _removeLabelRelatedConstraintsIfNeeded](self, "_removeLabelRelatedConstraintsIfNeeded");
  v3 = objc_opt_new(NSMutableSet);
  v4 = v3;
  if (self->_titleLabels)
  {
    -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:");
    titleLabels = self->_titleLabels;
    self->_titleLabels = 0;

  }
  if (self->_senderLabel)
  {
    -[NSMutableSet addObject:](v4, "addObject:");
    senderLabel = self->_senderLabel;
    self->_senderLabel = 0;

  }
  if (self->_actionLabels)
  {
    -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:");
    actionLabels = self->_actionLabels;
    self->_actionLabels = 0;

  }
  if (self->_bodyLabels)
  {
    -[NSMutableSet addObjectsFromArray:](v4, "addObjectsFromArray:");
    bodyLabels = self->_bodyLabels;
    self->_bodyLabels = 0;

  }
  v9 = objc_opt_new(NSMutableArray);
  v10 = objc_opt_new(NSMutableArray);
  v11 = objc_opt_new(NSMutableArray);
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_10006D6A4;
  v99[3] = &unk_1001B35B0;
  v80 = v4;
  v100 = v80;
  v101 = self;
  v12 = objc_retainBlock(v99);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell titleStrings](self, "titleStrings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell preActionBodyStrings](self, "preActionBodyStrings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell bodyStringDict](self, "bodyStringDict"));
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_10006DA94;
  v96[3] = &unk_1001B35D8;
  v96[4] = self;
  v16 = v12;
  v98 = v16;
  v17 = v9;
  v97 = v17;
  v83 = v13;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v96);
  p_super = &v17->super;
  if (!-[NSMutableArray count](v17, "count"))
  {
    v18 = ((uint64_t (*)(_QWORD *, _QWORD, uint64_t, double))v16[2])(v16, 0, 1, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NSArray addObject:](p_super, "addObject:", v19);

  }
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_10006DB44;
  v93[3] = &unk_1001B3600;
  v20 = v16;
  v95 = v20;
  v21 = v10;
  v94 = v21;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v93);
  v22 = objc_claimAutoreleasedReturnValue(-[CalendarMessageCell actionBodyString](self, "actionBodyString"));
  if (v22)
  {
    v23 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, double))v20[2])(v20, v22, 4, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v24, "setNumberOfLines:", 1);
    -[NSMutableArray addObject:](v21, "addObject:", v24);

  }
  v79 = &v21->super;
  v81 = (void *)v22;
  v82 = v14;
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyPerson));
  if (v25)
  {
    v26 = ((uint64_t (*)(_QWORD *, uint64_t, _QWORD, double))v20[2])(v20, v25, 0, 0.0);
    v27 = (UILabel *)objc_claimAutoreleasedReturnValue(v26);
    v28 = self->_senderLabel;
    self->_senderLabel = v27;

  }
  v78 = (void *)v25;
  v104[0] = CUIKNotificationDescriptionKeySecondPerson;
  v104[1] = CUIKNotificationDescriptionKeyAction;
  v104[2] = CUIKNotificationDescriptionKeyApp;
  v104[3] = CUIKNotificationDescriptionKeyComment;
  v104[4] = CUIKNotificationDescriptionKeyRecurrence;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 5));
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v90 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i)));
        if (v34)
        {
          v35 = ((uint64_t (*)(_QWORD *, void *, _QWORD, double))v20[2])(v20, v34, 0, 0.0);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          -[NSMutableArray addObject:](v11, "addObject:", v36);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
    }
    while (v31);
  }

  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyTimeSensitive));
  if (v37)
  {
    v38 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, double))v20[2])(v20, v37, 3, 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    -[NSMutableArray addObject:](v11, "addObject:", v39);

  }
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyDate));
  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyHintCancelled));
    v42 = v41 == 0;

    v43 = ((uint64_t (*)(_QWORD *, uint64_t, _QWORD, double))v20[2])(v20, v40, (2 * v42), 0.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    -[NSMutableArray addObject:](v11, "addObject:", v44);

  }
  v77 = (void *)v37;
  v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyError));
  v76 = (void *)v40;
  if (v45)
  {
    v75 = (MessageCellWarningView *)v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v46));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), v47));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "imageWithTintColor:renderingMode:", v49, 1));
    v74 = 0;
  }
  else
  {
    v51 = CUIKNotificationDescriptionKeyConflict;
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyConflict));
    if (!v52)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell conflictDict](self, "conflictDict"));
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v51));

      if (!v52)
      {
        -[MessageCellWarningView removeFromSuperview](self->_warningView, "removeFromSuperview");
        warningView = self->_warningView;
        self->_warningView = 0;
        goto LABEL_38;
      }
    }
    v75 = (MessageCellWarningView *)v52;
    v54 = CUIKNotificationDescriptionKeyConflictEventRange;
    v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyConflictEventRange));
    if (!v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell conflictDict](self, "conflictDict"));
      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v54));

    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote, v55));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v46));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v47));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "imageWithTintColor:renderingMode:", v49, 1));
  }

  v57 = self->_warningView;
  if (!v57)
  {
    v58 = objc_opt_new(MessageCellWarningView);
    v59 = self->_warningView;
    self->_warningView = v58;

    -[MessageCellWarningView setTranslatesAutoresizingMaskIntoConstraints:](self->_warningView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    objc_msgSend(v60, "addSubview:", self->_warningView);

    v57 = self->_warningView;
  }
  v61 = v74;
  warningView = v75;
  -[MessageCellWarningView setImage:warningString:emphasizedRangeValue:](v57, "setImage:warningString:emphasizedRangeValue:", v50, v75, v74, v74);

LABEL_38:
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v63 = v80;
  v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v65; j = (char *)j + 1)
      {
        if (*(_QWORD *)v86 != v66)
          objc_enumerationMutation(v63);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j), "removeFromSuperview");
      }
      v65 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
    }
    while (v65);
  }

  v68 = self->_titleLabels;
  self->_titleLabels = p_super;
  v69 = p_super;

  v70 = self->_actionLabels;
  self->_actionLabels = v79;
  v71 = v79;

  v72 = self->_bodyLabels;
  self->_bodyLabels = &v11->super;
  v73 = v11;

  -[CalendarMessageCell setupLabelConstraintsIfNeeded](self, "setupLabelConstraintsIfNeeded");
}

- (void)_updateResponseButtons
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell actions](self, "actions"));
  objc_msgSend(v4, "setActions:", v3);

  objc_msgSend(v4, "setSelectedAction:", 0);
}

- (void)_updateColorBar
{
  MessageCellColorBarView *v3;
  MessageCellColorBarView *colorBar;
  double v5;
  void *v6;
  void *v7;

  if (!self->_colorBar)
  {
    v3 = objc_alloc_init(MessageCellColorBarView);
    colorBar = self->_colorBar;
    self->_colorBar = v3;

    -[MessageCellColorBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_colorBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1144750080;
    -[MessageCellColorBarView setContentCompressionResistancePriority:forAxis:](self->_colorBar, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_colorBar);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell color](self, "color"));
  -[MessageCellColorBarView setColor:](self->_colorBar, "setColor:", v7);

  -[CalendarMessageCell setupColorBarConstraintsIfNeeded](self, "setupColorBarConstraintsIfNeeded");
}

+ (double)defaultRowHeight
{
  return 201.0;
}

- (void)actionLabelTap
{
  void *v3;
  char v4;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "performAction:forCell:appliesToAll:ifCancelled:");

  if ((v4 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "performAction:forCell:appliesToAll:ifCancelled:", -[CalendarMessageCell actionBodyStringAction](self, "actionBodyStringAction"), self, 0, 0);

  }
}

- (id)_responseButtons
{
  EKUIEventStatusButtonsView *responseButtons;
  id v4;
  void *v5;
  EKUIEventStatusButtonsView *v6;
  EKUIEventStatusButtonsView *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  responseButtons = self->_responseButtons;
  if (!responseButtons)
  {
    v4 = objc_alloc((Class)EKUIEventStatusButtonsView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell actions](self, "actions"));
    v6 = (EKUIEventStatusButtonsView *)objc_msgSend(v4, "initWithFrame:actions:delegate:options:", v5, self, -[CalendarMessageCell options](self, "options") | 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = self->_responseButtons;
    self->_responseButtons = v6;

    -[EKUIEventStatusButtonsView setButtonsTouchInsets:](self->_responseButtons, "setButtonsTouchInsets:", -15.0, -15.0, -15.0, -15.0);
    -[EKUIEventStatusButtonsView setTranslatesAutoresizingMaskIntoConstraints:](self->_responseButtons, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell traitCollection](self, "traitCollection"));
    -[EKUIEventStatusButtonsView setShouldUseVerticalLayout:](self->_responseButtons, "setShouldUseVerticalLayout:", EKUIUsesLargeTextLayout(v8, v9));

    -[EKUIEventStatusButtonsView updateFonts](self->_responseButtons, "updateFonts");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    objc_msgSend(v10, "addSubview:", self->_responseButtons);

    responseButtons = self->_responseButtons;
  }
  return responseButtons;
}

- (void)updateSelectedResponseButton
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *bottomMostViewToContentViewBottomConstraint;

  if (self->_showsCommentPrompt)
    v3 = 4;
  else
    v3 = -[CalendarMessageCell selectedResponseButton](self, "selectedResponseButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
  objc_msgSend(v4, "setSelectedAction:", v3);

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
    bottomMostViewToContentViewBottomConstraint = self->_bottomMostViewToContentViewBottomConstraint;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &bottomMostViewToContentViewBottomConstraint, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
    objc_msgSend(v9, "_scaledValueForValue:", -10.0);
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 4, 0, v13, 4, 1.0, v11));
    v15 = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v14;

    -[NSLayoutConstraint setActive:](self->_bottomMostViewToContentViewBottomConstraint, "setActive:", 1);
    -[CalendarMessageCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id WeakRetained;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    v19 = 138543874;
    v20 = v14;
    v21 = 2114;
    v22 = v10;
    v23 = 2114;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Event status buttons view did select action: [%{public}@]. Event status buttons view: %{public}@, appliesToAll: %{public}@.", (uint8_t *)&v19, 0x20u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell delegate](self, "delegate"));
  v17 = objc_opt_respondsToSelector(v16, "performAction:forCell:appliesToAll:ifCancelled:");

  if ((v17 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "performAction:forCell:appliesToAll:ifCancelled:", a4, self, v7, v11);

  }
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_cachedStatusButtonsFontSize = a4;
}

- (id)eventStatusButtonsViewButtonFont:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontWithSize:", self->_cachedStatusButtonsFontSize));

  return v5;
}

- (void)setNotification:(id)a3
{
  EKCalendarNotification *v5;
  void *v6;
  EKCalendarNotification *v7;

  v5 = (EKCalendarNotification *)a3;
  if (self->_notification != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_notification, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell _responseButtons](self, "_responseButtons"));
    objc_msgSend(v6, "setActions:", &__NSArray0__struct);

    -[CalendarMessageCell _updateColorBar](self, "_updateColorBar");
    -[CalendarMessageCell _updateResponseButtons](self, "_updateResponseButtons");
    -[CalendarMessageCell _updateLabels](self, "_updateLabels");
    -[CalendarMessageCell updateAuthor](self, "updateAuthor");
    -[CalendarMessageCell updateSelectedResponseButton](self, "updateSelectedResponseButton");
    -[CalendarMessageCell setNeedsLayout](self, "setNeedsLayout");
    -[CalendarMessageCell setNeedsDisplay](self, "setNeedsDisplay");
    -[CalendarMessageCell _updateAppEntityAnnotation](self, "_updateAppEntityAnnotation");
    v5 = v7;
  }

}

- (void)_updateAppEntityAnnotation
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  -[CalendarMessageCell Cal_annotateWithNotification:](self, "Cal_annotateWithNotification:", v3);

  -[CalendarMessageCell _updateAppEntityAnnotationState](self, "_updateAppEntityAnnotationState");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalendarMessageCell;
  -[CalendarMessageCell setSelected:animated:](&v5, "setSelected:animated:", a3, a4);
  -[CalendarMessageCell _updateAppEntityAnnotationState](self, "_updateAppEntityAnnotationState");
}

- (void)_updateAppEntityAnnotationState
{
  -[CalendarMessageCell Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:](self, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", -[CalendarMessageCell isSelected](self, "isSelected"), 0, 0, 0, 0, 0);
}

+ (int64_t)numberOfLinesForTitleLabels
{
  if (EKUIUsesLargeTextLayout(0, a2))
    return 0;
  else
    return 2;
}

+ (int64_t)numberOfLinesForBodyLabels
{
  if (EKUIUsesLargeTextLayout(0, a2))
    return 0;
  else
    return 2;
}

- (id)preActionBodyStrings
{
  return 0;
}

- (id)actionBodyString
{
  return 0;
}

- (int64_t)actionBodyStringAction
{
  return 0;
}

- (BOOL)showAsCancelledOrDeclined
{
  return self->_showsCommentPrompt;
}

- (id)color
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = objc_msgSend(v3, "dotColor");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v5, "dotColor")));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
  }
  return v6;
}

- (int64_t)selectedResponseButton
{
  return 0;
}

- (void)setHasDisclosure:(BOOL)a3
{
  _BOOL4 v3;
  UIView *disclosureIndicatorView;
  void *v6;
  void *v7;
  UIView *v8;
  void *v9;
  UIView *v10;
  UIView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v3 = a3;
  self->_hasDisclosure = a3;
  -[CalendarMessageCell _removeDisclosureConstraintsIfNeeded](self, "_removeDisclosureConstraintsIfNeeded");
  -[UIView removeFromSuperview](self->_disclosureIndicatorView, "removeFromSuperview");
  disclosureIndicatorView = self->_disclosureIndicatorView;
  self->_disclosureIndicatorView = 0;

  self->_didSetupDisclosureConstraints = 0;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inboxDisclosureImage"));

    v8 = (UIView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIView setTintColor:](v8, "setTintColor:", v9);

    v10 = self->_disclosureIndicatorView;
    self->_disclosureIndicatorView = v8;
    v11 = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_disclosureIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_disclosureIndicatorView, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_disclosureIndicatorView, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](self->_disclosureIndicatorView, "setContentHuggingPriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](self->_disclosureIndicatorView, "setContentHuggingPriority:forAxis:", 1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell contentView](self, "contentView"));
    objc_msgSend(v16, "addSubview:", self->_disclosureIndicatorView);

    -[CalendarMessageCell setupDisclosureConstraintsIfNeeded](self, "setupDisclosureConstraintsIfNeeded");
  }
  -[CalendarMessageCell setNeedsLayout](self, "setNeedsLayout");
  -[CalendarMessageCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell traitCollection](self, "traitCollection", a3));
  -[EKUIEventStatusButtonsView setShouldUseVerticalLayout:](self->_responseButtons, "setShouldUseVerticalLayout:", EKUIUsesLargeTextLayout(v4, v5));

  self->_didSetupColorBarConstraints = 0;
  self->_didSetupLabelConstraints = 0;
  -[CalendarMessageCell _updateColorBar](self, "_updateColorBar");
  -[CalendarMessageCell _updateLabels](self, "_updateLabels");
  -[EKUIEventStatusButtonsView updateFonts](self->_responseButtons, "updateFonts");
}

- (EKCalendarNotification)notification
{
  return self->_notification;
}

- (CalendarMessageCellDelegate)delegate
{
  return (CalendarMessageCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasDisclosure
{
  return self->_hasDisclosure;
}

- (UIView)authorView
{
  return self->_authorView;
}

- (void)setAuthorView:(id)a3
{
  objc_storeStrong((id *)&self->_authorView, a3);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (NSDictionary)conflictDict
{
  return self->_conflictDict;
}

- (void)setConflictDict:(id)a3
{
  objc_storeStrong((id *)&self->_conflictDict, a3);
}

- (NSArray)labelRelatedConstraints
{
  return self->_labelRelatedConstraints;
}

- (void)setLabelRelatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_labelRelatedConstraints, a3);
}

- (NSArray)colorBarConstraints
{
  return self->_colorBarConstraints;
}

- (void)setColorBarConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_colorBarConstraints, a3);
}

- (NSArray)disclosureConstraints
{
  return self->_disclosureConstraints;
}

- (void)setDisclosureConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureConstraints, a3);
}

- (NSArray)commentPromptRelatedConstraints
{
  return self->_commentPromptRelatedConstraints;
}

- (void)setCommentPromptRelatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_commentPromptRelatedConstraints, a3);
}

- (NSIndexSet)indexSetOfTruncatedTitleStrings
{
  return self->_indexSetOfTruncatedTitleStrings;
}

- (NSIndexSet)indexSetOfTruncatedBodyStrings
{
  return self->_indexSetOfTruncatedBodyStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSetOfTruncatedBodyStrings, 0);
  objc_storeStrong((id *)&self->_indexSetOfTruncatedTitleStrings, 0);
  objc_storeStrong((id *)&self->_commentPromptRelatedConstraints, 0);
  objc_storeStrong((id *)&self->_disclosureConstraints, 0);
  objc_storeStrong((id *)&self->_colorBarConstraints, 0);
  objc_storeStrong((id *)&self->_labelRelatedConstraints, 0);
  objc_storeStrong((id *)&self->_conflictDict, 0);
  objc_storeStrong((id *)&self->_authorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_bodyLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_statusButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_statusButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMostViewToContentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_responseButtonsToCommentLabelConstraint, 0);
  objc_storeStrong((id *)&self->_lastBodyLabelToResponseButtonsConstraint, 0);
  objc_storeStrong((id *)&self->_lastTitleLabelToFirstBodyLabelConstraint, 0);
  objc_storeStrong((id *)&self->_firstTitleLabelToContentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_commentPrompt, 0);
  objc_storeStrong((id *)&self->_warningView, 0);
  objc_storeStrong((id *)&self->_responseButtons, 0);
  objc_storeStrong((id *)&self->_disclosureIndicatorView, 0);
  objc_storeStrong((id *)&self->_colorBar, 0);
  objc_storeStrong((id *)&self->_bodyLabels, 0);
  objc_storeStrong((id *)&self->_actionLabels, 0);
  objc_storeStrong((id *)&self->_senderLabel, 0);
  objc_storeStrong((id *)&self->_titleLabels, 0);
}

- (id)titleStrings
{
  uint64_t v2;
  id result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

- (id)bodyStringDict
{
  uint64_t v2;
  id result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

- (id)actions
{
  uint64_t v2;
  id result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

- (unint64_t)options
{
  uint64_t v2;
  unint64_t result;

  v2 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v2);
  sub_10004DF54();
  return result;
}

@end
