@implementation MTAAlarmCollectionViewCell

- (MTAAlarmCollectionViewCell)initWithFrame:(CGRect)a3
{
  MTAAlarmCollectionViewCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UISwitch *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIView *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NUIContainerGridView *gridView;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  UIView *v72;
  objc_super v73;
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[5];

  v73.receiver = self;
  v73.super_class = (Class)MTAAlarmCollectionViewCell;
  v3 = -[MTAAlarmCollectionViewCell initWithFrame:](&v73, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)MTUIDigitalClockLabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[MTAAlarmCollectionViewCell setTimeLabel:](v3, "setTimeLabel:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_thinTimeFontOfSize:](UIFont, "mtui_thinTimeFontOfSize:", 58.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](v3, "timeLabel"));
    objc_msgSend(v6, "setFont:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _lightSystemFontOfSize:](UIFont, "_lightSystemFontOfSize:", 30.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](v3, "timeLabel"));
    objc_msgSend(v8, "setTimeDesignatorFont:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](v3, "timeLabel"));
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](v3, "timeLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateLabel"));
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

    v13 = objc_opt_new(UILabel);
    -[MTAAlarmCollectionViewCell setNameLabel:](v3, "setNameLabel:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](v3, "nameLabel"));
    objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](v3, "nameLabel"));
    objc_msgSend(v16, "setFont:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](v3, "nameLabel"));
    objc_msgSend(v17, "setAdjustsFontSizeToFitWidth:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](v3, "nameLabel"));
    objc_msgSend(v18, "setMinimumFontSize:", 10.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](v3, "nameLabel"));
    objc_msgSend(v19, "setLineBreakMode:", 4);

    v20 = objc_opt_new(UILabel);
    -[MTAAlarmCollectionViewCell setRepeatLabel:](v3, "setRepeatLabel:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell repeatLabel](v3, "repeatLabel"));
    objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell repeatLabel](v3, "repeatLabel"));
    objc_msgSend(v23, "setFont:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell repeatLabel](v3, "repeatLabel"));
    objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);

    v25 = objc_opt_new(UILabel);
    -[MTAAlarmCollectionViewCell setSoundLabel:](v3, "setSoundLabel:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell soundLabel](v3, "soundLabel"));
    objc_msgSend(v26, "setAdjustsFontForContentSizeCategory:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell soundLabel](v3, "soundLabel"));
    objc_msgSend(v28, "setFont:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell soundLabel](v3, "soundLabel"));
    objc_msgSend(v29, "setAdjustsFontSizeToFitWidth:", 1);

    v30 = objc_opt_new(UISwitch);
    -[MTAAlarmCollectionViewCell setEnableSwitch:](v3, "setEnableSwitch:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_switchTintColor](UIColor, "mtui_switchTintColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell enableSwitch](v3, "enableSwitch"));
    objc_msgSend(v32, "setTintColor:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell enableSwitch](v3, "enableSwitch"));
    objc_msgSend(v33, "addTarget:action:forControlEvents:", v3, "toggleEnabled:", 4096);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell enableSwitch](v3, "enableSwitch"));
    objc_msgSend(v34, "setPreferredStyle:", 2);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    -[MTAAlarmCollectionViewCell setDeleteButton:](v3, "setDeleteButton:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](v3, "deleteButton"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mtui_deleteButtonImage](UIImage, "mtui_deleteButtonImage"));
    objc_msgSend(v36, "setImage:forState:", v37, 0);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](v3, "deleteButton"));
    objc_msgSend(v38, "addTarget:action:forControlEvents:", v3, "deleteTapped:", 64);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](v3, "deleteButton"));
    LODWORD(v40) = 1148846080;
    objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 0, v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](v3, "deleteButton"));
    LODWORD(v42) = 1148846080;
    objc_msgSend(v41, "setContentHuggingPriority:forAxis:", 0, v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIShape circleShape](UIShape, "circleShape"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](v3, "deleteButton"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "hoverStyle"));
    objc_msgSend(v45, "setShape:", v43);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](v3, "deleteButton"));
    objc_msgSend(v46, "setAlpha:", 0.0);

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v48, "setBackgroundColor:", v47);

    v49 = objc_opt_new(UIView);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v49, "setBackgroundColor:", v50);

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](v3, "deleteButton"));
    v78[0] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](v3, "timeLabel"));
    v78[1] = v70;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 2));
    v79[0] = v69;
    v77[0] = v49;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](v3, "nameLabel"));
    v77[1] = v68;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 2));
    v79[1] = v51;
    v76[0] = v49;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell repeatLabel](v3, "repeatLabel"));
    v76[1] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 2));
    v79[2] = v53;
    v75[0] = v49;
    v72 = v49;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell soundLabel](v3, "soundLabel"));
    v75[1] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 2));
    v79[3] = v55;
    v74[0] = v49;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell enableSwitch](v3, "enableSwitch"));
    v74[1] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 2));
    v79[4] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 5));
    v59 = objc_claimAutoreleasedReturnValue(+[NUIContainerGridView containerGridViewWithArrangedSubviewRows:](NUIContainerGridView, "containerGridViewWithArrangedSubviewRows:", v58));
    gridView = v3->_gridView;
    v3->_gridView = (NUIContainerGridView *)v59;

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v61, "bounds");
    -[NUIContainerGridView setFrame:](v3->_gridView, "setFrame:");

    -[NUIContainerGridView setAutoresizingMask:](v3->_gridView, "setAutoresizingMask:", 18);
    -[NUIContainerGridView setVerticalAlignment:](v3->_gridView, "setVerticalAlignment:", 3);
    -[NUIContainerGridView setHorizontalAlignment:](v3->_gridView, "setHorizontalAlignment:", 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell gridView](v3, "gridView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "columnAtIndex:", 0));

    objc_msgSend(v63, "setAlignment:", 3);
    objc_msgSend(v63, "setLength:", 38.0);
    -[NUIContainerGridView setColumnSpacing:](v3->_gridView, "setColumnSpacing:", 0.0);
    -[NUIContainerGridView setDirectionalLayoutMargins:](v3->_gridView, "setDirectionalLayoutMargins:", 98.0, 0.0, 53.0, 16.0);
    -[NUIContainerGridView setBaselineRelativeLayoutMarginsForArrangement:](v3->_gridView, "setBaselineRelativeLayoutMarginsForArrangement:", 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v64, "addSubview:", v3->_gridView);

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell contentView](v3, "contentView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "layer"));
    objc_msgSend(v66, "setCornerRadius:", 16.0);

  }
  return v3;
}

+ (double)cellHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v2, "lineHeight");
  v4 = v3 * 3.0 + 7.0 + 115.0;
  objc_msgSend(v2, "_scaledValueForValue:", 8.0);
  v6 = v4 + v5 + 31.0 + 53.0;

  return v6;
}

- (void)deleteTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "deleteCell:", self);

}

- (void)toggleEnabled:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];

  v4 = objc_msgSend(a3, "isOn");
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = (_DWORD)v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CollectionViewCell: alarm active toggled to %d", (uint8_t *)v9, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell delegate](self, "delegate"));
  objc_msgSend(v8, "setAlarmEnabled:forCell:", v4, self);

}

- (CGRect)editingPopoverSourceRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](self, "timeLabel"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell contentView](self, "contentView"));
  -[MTAAlarmCollectionViewCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setEditing:(BOOL)a3
{
  double v4;
  void *v5;
  double v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a3)
      v4 = 1.0;
    else
      v4 = 0.0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell deleteButton](self, "deleteButton"));
    objc_msgSend(v5, "setAlpha:", v4);

    if (self->_editing)
      v6 = 0.0;
    else
      v6 = 1.0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell enableSwitch](self, "enableSwitch"));
    objc_msgSend(v7, "setAlpha:", v6);

    v8 = !self->_editing;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell enableSwitch](self, "enableSwitch"));
    objc_msgSend(v9, "setEnabled:", v8);

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a3;
  if (a4)
  {
    +[UIView beginAnimations:](UIView, "beginAnimations:", CFSTR("MTAlarmCollectionCellEditing"));
    -[MTAAlarmCollectionViewCell setEditing:](self, "setEditing:", v4);
    +[UIView commitAnimations](UIView, "commitAnimations");
  }
  else
  {
    -[MTAAlarmCollectionViewCell setEditing:](self, "setEditing:", a3);
  }
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  __CFString *v33;
  NSBundle *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v43 = a3;
  v5 = objc_msgSend(v43, "isEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](self, "timeLabel"));
  objc_msgSend(v6, "setHour:minute:", objc_msgSend(v43, "hour"), objc_msgSend(v43, "minute"));

  if ((_DWORD)v5)
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell timeLabel](self, "timeLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "displayTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](self, "nameLabel"));
  objc_msgSend(v11, "setText:", v10);

  if ((v5 & 1) != 0)
    v12 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  else
    v12 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell nameLabel](self, "nameLabel"));
  objc_msgSend(v14, "setTextColor:", v13);

  v15 = DateMaskToString(objc_msgSend(v43, "repeatSchedule"), 0, 1, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAAlarmCollectionViewCell, v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("EDIT_REPEAT_FORMAT"), &stru_10009A4D0, CFSTR("Localizable")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v16));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell repeatLabel](self, "repeatLabel"));
  objc_msgSend(v22, "setText:", v21);

  if ((_DWORD)v5)
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
  else
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell repeatLabel](self, "repeatLabel"));
  objc_msgSend(v25, "setTextColor:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "sound"));
  if (objc_msgSend(v27, "soundType") == (id)2)
  {
    v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "toneIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "nameForToneIdentifier:", v28));
LABEL_14:
    v33 = (__CFString *)v29;

    goto LABEL_16;
  }
  if (objc_msgSend(v27, "soundType") == (id)3)
  {
    v31 = objc_alloc((Class)MPMediaItem);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mediaItemIdentifier"));
    v28 = objc_msgSend(v31, "initWithPersistentID:", objc_msgSend(v32, "longLongValue"));

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "valueForProperty:", MPMediaItemPropertyTitle));
    goto LABEL_14;
  }
  v33 = &stru_10009A4D0;
LABEL_16:
  v34 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAAlarmCollectionViewCell, v30));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("EDIT_SOUND_FORMAT"), &stru_10009A4D0, CFSTR("Localizable")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v33));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell soundLabel](self, "soundLabel"));
  objc_msgSend(v38, "setText:", v37);

  if ((_DWORD)v5)
    v39 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
  else
    v39 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  v40 = (void *)v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell soundLabel](self, "soundLabel"));
  objc_msgSend(v41, "setTextColor:", v40);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell enableSwitch](self, "enableSwitch"));
  objc_msgSend(v42, "setOn:", v5);

  -[MTAAlarmCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewCell gridView](self, "gridView"));
  objc_msgSend(v5, "effectiveLayoutSizeFittingSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (MTAAlarmCollectionViewCellDelegate)delegate
{
  return (MTAAlarmCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (NUIContainerGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
  objc_storeStrong((id *)&self->_gridView, a3);
}

- (MTUIDigitalClockLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)repeatLabel
{
  return self->_repeatLabel;
}

- (void)setRepeatLabel:(id)a3
{
  objc_storeStrong((id *)&self->_repeatLabel, a3);
}

- (UILabel)soundLabel
{
  return self->_soundLabel;
}

- (void)setSoundLabel:(id)a3
{
  objc_storeStrong((id *)&self->_soundLabel, a3);
}

- (UISwitch)enableSwitch
{
  return self->_enableSwitch;
}

- (void)setEnableSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_enableSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableSwitch, 0);
  objc_storeStrong((id *)&self->_soundLabel, 0);
  objc_storeStrong((id *)&self->_repeatLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
