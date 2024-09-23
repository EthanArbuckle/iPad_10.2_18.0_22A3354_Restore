@implementation MTATimerControlsView

- (MTATimerControlsView)initWithDelegate:(id)a3 style:(unint64_t)a4 timerControlState:(unint64_t)a5
{
  id v8;
  double y;
  double width;
  double height;
  MTATimerControlsView *v12;
  MTATimerControlsView *v13;
  MTATimerButtonsController *v14;
  MTATimerButtonsController *buttonsController;
  uint64_t v16;
  NSMutableArray *layoutGuides;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  MTUITimerCountdownView *v22;
  MTUITimerCountdownView *countdownView;
  id *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  MTUIGlyphTimeView *v29;
  MTUIGlyphTimeView *expectedTimeView;
  MTATimerIntervalPickerView *v31;
  MTATimerIntervalPickerView *timePicker;
  void *v33;
  MTATimerPickerCell *v34;
  MTATimerPickerCell *pickerCell;
  MTATimerTonePickerCell *v36;
  UITableViewCell *toneChooserCell;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  UITableViewCell *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double left;
  double bottom;
  double right;
  MTALabelEditCell *v58;
  void *v59;
  void *v60;
  MTALabelEditCell *v61;
  MTALabelEditCell *editLabelCell;
  MTALabelEditCell *v63;
  void *v64;
  MTALabelEditCell *v65;
  id v66;
  void *v67;
  UITableView *v68;
  UITableView *tableView;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id currentDateProvider;
  uint64_t v75;
  uint64_t v76;
  void *v78;
  void *v79;
  objc_super v80;

  v8 = a3;
  v80.receiver = self;
  v80.super_class = (Class)MTATimerControlsView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12 = -[MTATimerControlsView initWithFrame:](&v80, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v8);
    -[MTATimerControlsView setTimerControlState:](v13, "setTimerControlState:", a5);
    v14 = -[MTATimerButtonsController initWithTarget:]([MTATimerButtonsController alloc], "initWithTarget:", v8);
    buttonsController = v13->_buttonsController;
    v13->_buttonsController = v14;

    -[MTATimerControlsView buildTableRowsWithStyle:](v13, "buildTableRowsWithStyle:", a4);
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    layoutGuides = v13->_layoutGuides;
    v13->_layoutGuides = (NSMutableArray *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    -[MTATimerControlsView setBackgroundColor:](v13, "setBackgroundColor:", v18);

    v19 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.32));
    v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    v21 = objc_alloc((Class)MTUITimerCountdownView);
    objc_msgSend((id)objc_opt_class(v13), "barWidthForStyle:", a4);
    v22 = (MTUITimerCountdownView *)objc_msgSend(v21, "initWithBarColor:backgroundBarColor:barWidth:", v20, v19);
    countdownView = v13->_countdownView;
    v13->_countdownView = v22;

    -[MTATimerControlsView addSubview:](v13, "addSubview:", v13->_countdownView);
    -[MTUITimerCountdownView setTranslatesAutoresizingMaskIntoConstraints:](v13->_countdownView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v78 = (void *)v20;
    v79 = (void *)v19;
    if (a4 - 3 > 4)
      v24 = (id *)&UIFontTextStyleTitle3;
    else
      v24 = (id *)*(&off_100099CB8 + a4 - 3);
    v25 = *v24;
    -[MTATimerControlsView setupTimerNameLabelForTimerStyle:withFontStyle:](v13, "setupTimerNameLabelForTimerStyle:withFontStyle:", a4, v25);
    v26 = objc_alloc((Class)MTUIGlyphTimeView);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v25));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v29 = (MTUIGlyphTimeView *)objc_msgSend(v26, "initWithFont:textColor:glyphName:style:", v27, v28, CFSTR("bell.fill"), a4);
    expectedTimeView = v13->_expectedTimeView;
    v13->_expectedTimeView = v29;

    -[MTATimerControlsView addSubview:](v13, "addSubview:", v13->_expectedTimeView);
    -[MTUIGlyphTimeView setTranslatesAutoresizingMaskIntoConstraints:](v13->_expectedTimeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = -[MTATimerIntervalPickerView initWithFrame:]([MTATimerIntervalPickerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    timePicker = v13->_timePicker;
    v13->_timePicker = v31;

    -[MTATimerIntervalPickerView setDelegate:](v13->_timePicker, "setDelegate:", v13);
    -[MTATimerControlsView addSubview:](v13, "addSubview:", v13->_timePicker);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTATimerIntervalPickerView setBackgroundColor:](v13->_timePicker, "setBackgroundColor:", v33);

    -[MTATimerIntervalPickerView setTranslatesAutoresizingMaskIntoConstraints:](v13->_timePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = -[MTATimerPickerCell initWithPicker:timeView:expectedTimeView:countdownView:reuseIdentifier:]([MTATimerPickerCell alloc], "initWithPicker:timeView:expectedTimeView:countdownView:reuseIdentifier:", v13->_timePicker, v13->_timeView, v13->_expectedTimeView, v13->_countdownView, CFSTR("PICKER"));
    pickerCell = v13->_pickerCell;
    v13->_pickerCell = v34;

    v36 = -[MTATimerTonePickerCell initWithStyle:reuseIdentifier:]([MTATimerTonePickerCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("TONE"));
    toneChooserCell = v13->_toneChooserCell;
    v13->_toneChooserCell = &v36->super.super;

    v38 = sub_100042584();
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v13->_toneChooserCell, "textLabel"));
    objc_msgSend(v40, "setFont:", v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v13->_toneChooserCell, "detailTextLabel"));
    objc_msgSend(v41, "setFont:", v39);

    -[UITableViewCell setAccessoryType:](v13->_toneChooserCell, "setAccessoryType:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v13->_toneChooserCell, "textLabel"));
    objc_msgSend(v43, "setTextColor:", v42);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v13->_toneChooserCell, "detailTextLabel"));
    objc_msgSend(v45, "setTextColor:", v44);

    v46 = v13->_toneChooserCell;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    -[UITableViewCell setSelectedBackgroundColor:](v46, "setSelectedBackgroundColor:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("WHEN_TIMER_ENDS"), &stru_10009A4D0, 0));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v13->_toneChooserCell, "textLabel"));
    objc_msgSend(v50, "setText:", v49);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v13->_toneChooserCell, "textLabel"));
    objc_msgSend(v51, "setAdjustsFontForContentSizeCategory:", 1);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v13->_toneChooserCell, "textLabel"));
    objc_msgSend(v52, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityMedium);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v13->_toneChooserCell, "detailTextLabel"));
    objc_msgSend(v53, "setAdjustsFontForContentSizeCategory:", 1);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](v13->_toneChooserCell, "detailTextLabel"));
    objc_msgSend(v54, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityMedium);

    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    -[UITableViewCell setSeparatorInset:](v13->_toneChooserCell, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
    v58 = [MTALabelEditCell alloc];
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView displayTitle](v13, "displayTitle"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView getCurrentLabel](v13, "getCurrentLabel"));
    v61 = -[MTALabelEditCell initWithDelegate:currentTitle:isEmpty:](v58, "initWithDelegate:currentTitle:isEmpty:", v8, v59, objc_msgSend(v60, "length") == 0);
    editLabelCell = v13->_editLabelCell;
    v13->_editLabelCell = v61;

    v63 = v13->_editLabelCell;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_buttonBackgroundColor](UIColor, "mtui_buttonBackgroundColor"));
    -[MTALabelEditCell setBackgroundColor:](v63, "setBackgroundColor:", v64);

    v65 = v13->_editLabelCell;
    v66 = sub_100042584();
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    -[MTALabelEditCell setFont:](v65, "setFont:", v67);

    v68 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
    tableView = v13->_tableView;
    v13->_tableView = v68;

    -[UITableView setDataSource:](v13->_tableView, "setDataSource:", v13);
    -[UITableView setDelegate:](v13->_tableView, "setDelegate:", v13);
    -[UITableView setScrollEnabled:](v13->_tableView, "setScrollEnabled:", 0);
    -[UITableView setLayoutMarginsFollowReadableWidth:](v13->_tableView, "setLayoutMarginsFollowReadableWidth:", 1);
    -[UITableView setSeparatorInset:](v13->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
    -[UITableView setEstimatedRowHeight:](v13->_tableView, "setEstimatedRowHeight:", 52.0);
    -[UITableView setRowHeight:](v13->_tableView, "setRowHeight:", 52.0);
    -[MTATimerControlsView addSubview:](v13, "addSubview:", v13->_tableView);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v13->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView layer](v13->_tableView, "layer"));
    objc_msgSend(v70, "setCornerRadius:", 10.0);

    -[MTATimerControlsView setState:animate:](v13, "setState:animate:", 1, 0);
    -[MTATimerControlsView setStyle:](v13, "setStyle:", a4);
    -[MTATimerControlsView setupTimeView](v13, "setupTimeView");
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v71, "addObserver:selector:name:object:", v13, "handleLocaleChange", NSCurrentLocaleDidChangeNotification, 0);

    v72 = MTCurrentDateProvider();
    v73 = objc_claimAutoreleasedReturnValue(v72);
    currentDateProvider = v13->_currentDateProvider;
    v13->_currentDateProvider = (id)v73;

    if (MTIdiomIpad(v75, v76) && a4 <= 4 && ((1 << a4) & 0x1A) != 0)
      -[MTATimerControlsView setupConstraints](v13, "setupConstraints", v78, v79);

  }
  return v13;
}

+ (double)barWidthForStyle:(unint64_t)a3
{
  double result;

  result = 8.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    return 6.0;
  return result;
}

- (id)displayTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView getCurrentLabel](self, "getCurrentLabel"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    v4 = v3;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Timer"), &stru_10009A4D0, 0));

  }
  return v4;
}

- (void)setControlsViewDelegate:(id)a3
{
  id v4;

  v4 = a3;
  -[MTATimerControlsView setDelegate:](self, "setDelegate:", v4);
  -[MTATimerButtonsController setTarget:](self->_buttonsController, "setTarget:", v4);
  -[MTALabelEditCell setDelegate:](self->_editLabelCell, "setDelegate:", v4);

}

- (void)buildTableRowsWithStyle:(unint64_t)a3
{
  NSMutableArray *v4;
  void *v5;
  id v6;

  v4 = objc_opt_new(NSMutableArray);
  -[MTATimerControlsView setTableRows:](self, "setTableRows:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  objc_msgSend(v5, "addObject:", &off_10009CDB8);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  objc_msgSend(v6, "addObject:", &off_10009CDD0);

}

- (void)applyBackgroundColor:(id)a3
{
  MTUITimerCountdownView *countdownView;
  id v5;

  countdownView = self->_countdownView;
  v5 = a3;
  -[MTUITimerCountdownView setBackgroundColor:](countdownView, "setBackgroundColor:", v5);
  -[MTATimerPickerCell setBackgroundColor:](self->_pickerCell, "setBackgroundColor:", v5);
  -[MTATimerIntervalPickerView setBackgroundColor:](self->_timePicker, "setBackgroundColor:", v5);
  -[MTATimerControlsView setBackgroundColor:](self, "setBackgroundColor:", v5);
  -[MTALabelEditCell setBackgroundColor:](self->_editLabelCell, "setBackgroundColor:", v5);
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v5);
  -[UITableViewCell setBackgroundColor:](self->_toneChooserCell, "setBackgroundColor:", v5);

}

- (void)setupTimeView
{
  UILabel *v3;
  UILabel *timeView;
  UILabel *v5;
  void *v6;
  unint64_t v7;
  UILabel *v8;
  uint64_t v9;
  void *v10;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  timeView = self->_timeView;
  self->_timeView = v3;

  -[MTATimerControlsView addSubview:](self, "addSubview:", self->_timeView);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_timeView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v6);

  v7 = -[MTATimerControlsView style](self, "style");
  v8 = self->_timeView;
  if (v7 == 7)
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
  else
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  v10 = (void *)v9;
  -[UILabel setTextColor:](v8, "setTextColor:", v9);

  -[UILabel setTextAlignment:](self->_timeView, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_timeView, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setBaselineAdjustment:](self->_timeView, "setBaselineAdjustment:", 1);
  -[UILabel setLineBreakMode:](self->_timeView, "setLineBreakMode:", 2);
}

- (void)setupTimerNameLabelForTimerStyle:(unint64_t)a3 withFontStyle:(id)a4
{
  id v6;
  UILabel *v7;
  UILabel *timerNameLabel;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;

  v6 = a4;
  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  timerNameLabel = self->_timerNameLabel;
  self->_timerNameLabel = v7;

  -[MTATimerControlsView addSubview:](self, "addSubview:", self->_timerNameLabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timerNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v6));

  -[UILabel setFont:](self->_timerNameLabel, "setFont:", v9);
  v10 = self->_timerNameLabel;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

  v12 = self->_timerNameLabel;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  -[UILabel setTextAlignment:](self->_timerNameLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_timerNameLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setBaselineAdjustment:](self->_timerNameLabel, "setBaselineAdjustment:", 1);
  -[UILabel setLineBreakMode:](self->_timerNameLabel, "setLineBreakMode:", 2);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_timerNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](self->_timerNameLabel, "setMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge);
  }
}

- (void)handleContentSizeChange
{
  -[MTATimerButtonsController handleContentSizeChange](self->_buttonsController, "handleContentSizeChange");
  -[MTATimerControlsView setNeedsLayout](self, "setNeedsLayout");
  -[MTATimerControlsView setupConstraints](self, "setupConstraints");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)resetLayout
{
  -[MTATimerControlsView setupConstraints](self, "setupConstraints");
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[MTATimerControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRemainingTime:(double)a3 duration:(double)a4 state:(unint64_t)a5 title:(id)a6 forceRefresh:(BOOL)a7
{
  _BOOL8 v7;
  id v12;

  v7 = a7;
  v12 = a6;
  -[MTATimerControlsView processCountdownState:previousState:remainingTime:duration:forceRefresh:](self, "processCountdownState:previousState:remainingTime:duration:forceRefresh:", a5, -[MTATimerControlsView state](self, "state"), v7, a3, a4);
  if (self->_state != a5)
    -[MTATimerControlsView setState:](self, "setState:", a5);
  -[MTALabelEditCell setCurrentTitle:](self->_editLabelCell, "setCurrentTitle:", v12);
  -[UILabel setText:](self->_timerNameLabel, "setText:", v12);

}

- (void)setDurationTime:(double)a3 title:(id)a4
{
  MTUITimerCountdownView *countdownView;
  id v7;

  countdownView = self->_countdownView;
  v7 = a4;
  -[MTUITimerCountdownView stop](countdownView, "stop");
  -[UILabel setText:](self->_timerNameLabel, "setText:", v7);

  -[MTATimerControlsView setTime:](self, "setTime:", a3);
}

- (void)processCountdownState:(unint64_t)a3 previousState:(unint64_t)a4 remainingTime:(double)a5 duration:(double)a6 forceRefresh:(BOOL)a7
{
  _BOOL4 v7;
  double v13;
  double v14;
  MTATimerControlsView *v15;
  uint64_t v16;
  unsigned int v17;
  MTUITimerCountdownView *countdownView;

  v7 = a7;
  -[MTUITimerCountdownView duration](self->_countdownView, "duration");
  v14 = v13;
  if (a3 == a4 && v13 == a6 && !v7 && !-[MTATimerControlsView stateNeedsReset](self, "stateNeedsReset"))
    return;
  -[MTUITimerCountdownView setAnimationRemainingTime:totalTime:](self->_countdownView, "setAnimationRemainingTime:totalTime:", a5, a6);
  -[MTUITimerCountdownView setNeedsLayout](self->_countdownView, "setNeedsLayout");
  if (a3 != 1)
  {
    if (a3 != 3)
    {
      if (a3 == 2)
      {
        if (a4 == 3)
          -[MTUITimerCountdownView pause](self->_countdownView, "pause");
        -[MTATimerControlsView showExpectedTimeWithRemainingTime:](self, "showExpectedTimeWithRemainingTime:", a5);
        -[MTATimerControlsView greyOutExpectedTime](self, "greyOutExpectedTime");
        v15 = self;
        v16 = 1;
        goto LABEL_13;
      }
      return;
    }
    -[MTATimerControlsView showExpectedTimeWithRemainingTime:](self, "showExpectedTimeWithRemainingTime:", a5);
    -[MTATimerControlsView setTimerControlState:](self, "setTimerControlState:", 1);
    if (a4 != 3 || v7)
    {
      if (a4 != 1 && a4 != 3)
      {
        if (a4 != 2)
          return;
        v17 = -[MTUITimerCountdownView isStarted](self->_countdownView, "isStarted");
        countdownView = self->_countdownView;
        if (v17)
        {
          -[MTUITimerCountdownView resume](countdownView, "resume");
          return;
        }
LABEL_26:
        -[MTUITimerCountdownView start](countdownView, "start");
        return;
      }
    }
    else if (v14 == a6)
    {
      if (-[MTATimerControlsView stateNeedsReset](self, "stateNeedsReset"))
      {
        -[MTUITimerCountdownView start](self->_countdownView, "start");
        -[MTATimerControlsView setStateNeedsReset:](self, "setStateNeedsReset:", 0);
      }
      return;
    }
    countdownView = self->_countdownView;
    goto LABEL_26;
  }
  -[MTATimerControlsView hideExpectedTime](self, "hideExpectedTime");
  -[MTUITimerCountdownView stop](self->_countdownView, "stop");
  if (a4 == 3)
  {
    v15 = self;
    v16 = 2;
LABEL_13:
    -[MTATimerControlsView setTimerControlState:](v15, "setTimerControlState:", v16);
  }
}

- (void)showExpectedTimeWithRemainingTime:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MTUIGlyphTimeView *expectedTimeView;
  void *v17;
  id v18;

  v5 = (*((uint64_t (**)(void))self->_currentDateProvider + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", a3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDateFormatting sharedInstance](MTDateFormatting, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v18 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedTimeStringFromDate:forTimeZone:timeDesignator:", v7, v9, &v18));
  v11 = v18;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDateFormatting sharedInstance](MTDateFormatting, "sharedInstance"));
  if (objc_msgSend(v12, "timeDesignatorAppearsBeforeTime"))
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v11, v10);
  else
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView timeLabel](self->_expectedTimeView, "timeLabel"));
  objc_msgSend(v15, "setText:", v14);

  expectedTimeView = self->_expectedTimeView;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
  -[MTUIGlyphTimeView setComponentColor:](expectedTimeView, "setComponentColor:", v17);

  -[MTUIGlyphTimeView setHidden:](self->_expectedTimeView, "setHidden:", 0);
}

- (void)hideExpectedTime
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView timeLabel](self->_expectedTimeView, "timeLabel"));
  objc_msgSend(v3, "setText:", &stru_10009A4D0);

  -[MTUIGlyphTimeView setHidden:](self->_expectedTimeView, "setHidden:", 1);
}

- (void)greyOutExpectedTime
{
  MTUIGlyphTimeView *expectedTimeView;
  void *v4;

  expectedTimeView = self->_expectedTimeView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_quaternaryColor](UIColor, "mtui_quaternaryColor"));
  -[MTUIGlyphTimeView setComponentColor:](expectedTimeView, "setComponentColor:", v4);

  -[MTUIGlyphTimeView setHidden:](self->_expectedTimeView, "setHidden:", 0);
}

- (void)setTime:(double)a3
{
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  v4 = round(a3);
  v5 = 0.0;
  if (self->_state == 2)
    v5 = 1.0;
  if (v4 < v5)
    v4 = v5;
  v6 = FormatTime(0, 0, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[UILabel setText:](self->_timeView, "setText:", v7);

}

- (double)countDownDuration
{
  double result;

  -[MTATimerIntervalPickerView selectedDuration](self->_timePicker, "selectedDuration");
  return result;
}

- (void)setCountDownDuration:(double)a3
{
  -[MTATimerIntervalPickerView setDuration:](self->_timePicker, "setDuration:");
  -[MTATimerButtonsController setShouldEnableStartButton:](self->_buttonsController, "setShouldEnableStartButton:", a3 != 0.0);
}

- (void)handleLocaleChange
{
  ResetTimeFormatter(self, a2);
  -[MTATimerControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (id)getCurrentLabel
{
  return -[MTALabelEditCell getCurrentLabel](self->_editLabelCell, "getCurrentLabel");
}

- (void)setCurrentLabel:(id)a3
{
  -[MTALabelEditCell setCurrentTitle:](self->_editLabelCell, "setCurrentTitle:", a3);
}

- (void)setTimerToneName:(id)a3
{
  NSString *v4;
  NSString *toneName;
  NSString *v6;
  id v7;

  if (self->_toneName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    toneName = self->_toneName;
    self->_toneName = v4;

    -[MTATimerControlsView setNeedsLayout](self, "setNeedsLayout");
    v6 = self->_toneName;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](self->_toneChooserCell, "detailTextLabel"));
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  MTATimerIntervalPickerView *timePicker;
  id v7;
  id v8;
  objc_super v9;

  timePicker = self->_timePicker;
  v7 = a4;
  v8 = a3;
  -[MTATimerIntervalPickerView endEditing:](timePicker, "endEditing:", 0);
  v9.receiver = self;
  v9.super_class = (Class)MTATimerControlsView;
  -[MTATimerControlsView touchesBegan:withEvent:](&v9, "touchesBegan:withEvent:", v8, v7);

}

- (void)setState:(unint64_t)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  BOOL v7;
  double v8;
  double v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = a4;
  self->_state = a3;
  v7 = a3 == 1;
  -[MTATimerButtonsController setState:](self->_buttonsController, "setState:");
  if (self->_style == 6)
    -[MTATimerControlsView updatePauseResumeButtonWithState:](self, "updatePauseResumeButtonWithState:", a3);
  if (v4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003ABCC;
    v10[3] = &unk_1000997B8;
    v10[4] = self;
    v11 = v7;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.2);
  }
  else
  {
    if (a3 == 1)
      v8 = 1.0;
    else
      v8 = 0.0;
    if (a3 == 1)
      v9 = 0.0;
    else
      v9 = 1.0;
    -[MTATimerIntervalPickerView setAlpha:](self->_timePicker, "setAlpha:", v8);
    -[UILabel setAlpha:](self->_timeView, "setAlpha:", v9);
    -[MTUITimerCountdownView setAlpha:](self->_countdownView, "setAlpha:", v9);
    -[MTUIGlyphTimeView setAlpha:](self->_expectedTimeView, "setAlpha:", v9);
  }
  -[MTATimerPickerCell setState:animated:](self->_pickerCell, "setState:animated:", a3, v4);
}

- (void)updatePauseResumeButtonWithState:(unint64_t)a3
{
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithWeight:](UIImageSymbolConfiguration, "configurationWithWeight:", 7));
  if (a3 == 2)
    v6 = CFSTR("play.fill");
  else
    v6 = CFSTR("pause");
  v18 = (id)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6));
  if (a3 == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "normalShade"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v11 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "normalShade"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v11 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  }
  v15 = (void *)v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  objc_msgSend(v16, "setTintColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  objc_msgSend(v17, "setImage:forState:", v7, 0);

}

- (void)setState:(unint64_t)a3
{
  -[MTATimerControlsView setState:animate:](self, "setState:animate:", a3, 1);
}

- (BOOL)isRunningTimer
{
  return (id)-[MTATimerControlsView timerControlState](self, "timerControlState") == (id)1;
}

- (void)setStyle:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  unint64_t style;
  _BOOL4 v7;
  _BOOL8 v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;

  style = self->_style;
  if (style == a3 && !a4)
    return;
  if (a3 == 4 && style == 5)
  {
    self->_style = 4;
    v7 = 1;
  }
  else
  {
    self->_style = a3;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      -[UITableView setHidden:](self->_tableView, "setHidden:", 1, a4);
      -[MTUIGlyphTimeView setHidden:](self->_expectedTimeView, "setHidden:", self->_style == 7);
      -[UILabel setHidden:](self->_timerNameLabel, "setHidden:", 0);
      -[UILabel setNumberOfLines:](self->_timerNameLabel, "setNumberOfLines:", 2);
      -[UILabel setLineBreakMode:](self->_timerNameLabel, "setLineBreakMode:", 0);
      -[MTATimerControlsView setupCellButtons](self, "setupCellButtons");
      return;
    }
    v7 = style == 2 && a3 == 4;
    if (a3 > 4 || ((1 << a3) & 0x16) == 0)
      goto LABEL_17;
  }
  -[UILabel setHidden:](self->_timerNameLabel, "setHidden:", 1, a4);
LABEL_17:
  v8 = -[MTATimerControlsView isRunningTimer](self, "isRunningTimer");
  v10 = self->_style;
  if (v8 || (v10 != 4 ? (v11 = v10 == 2) : (v11 = 1), v11))
  {
    if (v10 - 3 > 1)
    {
      v12 = 0;
    }
    else
    {
      v12 = MTUIIsPadIdiom(v8, v9);
      -[UILabel setHidden:](self->_timerNameLabel, "setHidden:", 1);
    }
    -[MTATimerControlsView setButtonSize:](self, "setButtonSize:", v12);
  }
  if (v7)
    -[MTATimerControlsView setupConstraints](self, "setupConstraints");
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[MTATimerControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStyle:(unint64_t)a3
{
  -[MTATimerControlsView setStyle:forceRefresh:](self, "setStyle:forceRefresh:", a3, 0);
}

- (void)setupCellButtons
{
  MTATimerCollectionControlButton *v3;
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
  MTATimerCollectionControlButton *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t style;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
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
  id v47;

  v47 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 17.0));
  v3 = objc_opt_new(MTATimerCollectionControlButton);
  -[MTATimerControlsView setStopButton:](self, "setStopButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 20.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v7, "setMasksToBounds:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 0.1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  objc_msgSend(v10, "setNormalBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "highlightedShade"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  objc_msgSend(v13, "setHighlightedBackgroundColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "colorWithAlphaComponent:", 0.1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  objc_msgSend(v16, "setBackgroundColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v47));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  objc_msgSend(v18, "setImage:forState:", v17, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  -[MTATimerControlsView addSubview:](self, "addSubview:", v19);

  v20 = objc_opt_new(MTATimerCollectionControlButton);
  -[MTATimerControlsView setPauseResumeButton:](self, "setPauseResumeButton:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
  objc_msgSend(v22, "setCornerRadius:", 20.0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
  objc_msgSend(v24, "setMasksToBounds:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  -[MTATimerControlsView addSubview:](self, "addSubview:", v25);

  style = self->_style;
  if (style == 7)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
    objc_msgSend(v37, "addTarget:action:forControlEvents:", self, "deleteRecent", 64);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
    objc_msgSend(v39, "setTintColor:", v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v40, "addTarget:action:forControlEvents:", self, "startRecent", 64);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("play.fill"), v47));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v41, "setImage:forState:", v31, 0);

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "normalShade"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v44, "setBackgroundColor:", v43);

    v36 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    goto LABEL_5;
  }
  if (style == 6)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
    objc_msgSend(v27, "addTarget:action:forControlEvents:", self, "stopTimer", 64);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
    objc_msgSend(v29, "setTintColor:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v30, "addTarget:action:forControlEvents:", self, "pauseResumeTimer", 64);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("pause"), v47));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v32, "setImage:forState:", v31, 0);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "normalShade"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v35, "setBackgroundColor:", v34);

    v36 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
LABEL_5:
    v45 = (void *)v36;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
    objc_msgSend(v46, "setTintColor:", v45);

  }
}

- (void)deleteRecent
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "deleteRecent:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView delegate](self, "delegate"));
    objc_msgSend(v5, "deleteRecent:", self);

  }
}

- (void)startRecent
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView delegate](self, "delegate"));
  objc_msgSend(v3, "startTimer:", self);

}

- (void)stopTimer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView delegate](self, "delegate"));
  objc_msgSend(v3, "cancelTimer:", self);

}

- (void)pauseResumeTimer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView delegate](self, "delegate"));
  objc_msgSend(v3, "pauseResumeTimer:", self);

}

- (void)_configureAndAddButton:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "sizeToFit");
  -[MTATimerControlsView addSubview:](self, "addSubview:", v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)setButtonSize:(unint64_t)a3
{
  void *v4;
  id v5;

  -[MTATimerButtonsController setButtonSize:](self->_buttonsController, "setButtonSize:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](self->_buttonsController, "startStopButton"));
  -[MTATimerControlsView _configureAndAddButton:](self, "_configureAndAddButton:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](self->_buttonsController, "cancelButton"));
  -[MTATimerControlsView _configureAndAddButton:](self, "_configureAndAddButton:", v5);

}

- (void)setTimerControlState:(unint64_t)a3
{
  self->_timerControlState = a3;
  if ((MTIdiomIpad() & 1) == 0)
    -[MTATimerControlsView setButtonControlViewsHidden:](self, "setButtonControlViewsHidden:", self->_timerControlState == 0);
}

- (void)setupConstraints
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView styleSpecificConstraints](self, "styleSpecificConstraints"));
  v6 = objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView constraints](self, "constraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
  -[MTATimerControlsView setConstraints:](self, "setConstraints:", v6);

}

- (id)styleSpecificConstraints
{
  int v3;
  unint64_t style;
  void *v5;

  v3 = MTIdiomIpad(self, a2);
  style = self->_style;
  if (!v3)
  {
    if (style == 2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView setupCompactNewTimerConstraints](self, "setupCompactNewTimerConstraints"));
      return v5;
    }
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView setupMultipleTimerConstraints](self, "setupMultipleTimerConstraints"));
    return v5;
  }
  if (style - 6 < 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView setupCollectionViewConstraints](self, "setupCollectionViewConstraints"));
    return v5;
  }
  if (style == 1)
    goto LABEL_8;
  if (style == 4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView iPadSingleCellNewTimerConstraints](self, "iPadSingleCellNewTimerConstraints"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView setupSingleTimerConstraints](self, "setupSingleTimerConstraints"));
  return v5;
}

- (id)setupMultipleTimerConstraints
{
  NSMutableArray *v3;
  UILayoutGuide *v4;
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
  UILayoutGuide *v21;
  unsigned __int8 v22;
  MTATimerButtonsController *buttonsController;
  uint64_t v24;
  void *v25;
  unsigned __int8 v26;
  MTATimerButtonsController *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
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
  void *v54;
  void *v55;
  UILayoutGuide *v56;
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
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _UNKNOWN **v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  int v157;
  double v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  double v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v194;
  UILayoutGuide *v195;
  double v196;
  double v197;
  double v198;

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(UILayoutGuide);
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  v195 = objc_opt_new(UILayoutGuide);
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:");
  v21 = objc_opt_new(UILayoutGuide);
  v22 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  buttonsController = self->_buttonsController;
  if ((v22 & 1) != 0)
    v24 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](buttonsController, "startStopButton"));
  else
    v24 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](buttonsController, "cancelButton"));
  v25 = (void *)v24;
  v26 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  v27 = self->_buttonsController;
  if ((v26 & 1) != 0)
    v28 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](v27, "cancelButton"));
  else
    v28 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](v27, "startStopButton"));
  v29 = (void *)v28;
  if (-[MTATimerControlsView isRunningTimer](self, "isRunningTimer")
    || (v30 = 0.0, v31 = 0.0, (id)-[MTATimerControlsView timerControlState](self, "timerControlState") == (id)2))
  {
    +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, objc_msgSend(v29, "buttonCircleSize"));
    v31 = v196;
    v30 = v198;
    -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    -[NSMutableArray addObject:](v3, "addObject:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
    -[NSMutableArray addObject:](v3, "addObject:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
    -[NSMutableArray addObject:](v3, "addObject:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
    -[NSMutableArray addObject:](v3, "addObject:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", v197));
    -[NSMutableArray addObject:](v3, "addObject:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
    -[NSMutableArray addObject:](v3, "addObject:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToConstant:", v197));
    -[NSMutableArray addObject:](v3, "addObject:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    -[NSMutableArray addObject:](v3, "addObject:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v21, "heightAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", v197));
    -[NSMutableArray addObject:](v3, "addObject:", v55);

  }
  v194 = v25;
  v56 = objc_opt_new(UILayoutGuide);
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v56, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
  -[NSMutableArray addObject:](v3, "addObject:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v56, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  -[NSMutableArray addObject:](v3, "addObject:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v56, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
  -[NSMutableArray addObject:](v3, "addObject:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView topAnchor](self->_countdownView, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v56, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, v30));
  -[NSMutableArray addObject:](v3, "addObject:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v56, "centerXAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v70));
  -[NSMutableArray addObject:](v3, "addObject:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView heightAnchor](self->_countdownView, "heightAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v73));
  -[NSMutableArray addObject:](v3, "addObject:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView bottomAnchor](self->_countdownView, "bottomAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v56, "bottomAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v76));
  -[NSMutableArray addObject:](v3, "addObject:", v77);

  -[MTUITimerCountdownView frame](self->_countdownView, "frame");
  v79 = v78 * v78;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
  objc_msgSend(v80, "pointSize");
  v82 = sqrt(v79 + v81 * v81);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v195, "widthAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToConstant:", v82 * 0.8));
  -[NSMutableArray addObject:](v3, "addObject:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](self->_timeView, "leftAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v195, "leftAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v86));
  -[NSMutableArray addObject:](v3, "addObject:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](self->_timeView, "rightAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](v195, "rightAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v89));
  -[NSMutableArray addObject:](v3, "addObject:", v90);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_timeView, "heightAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
  objc_msgSend(v92, "pointSize");
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToConstant:"));
  -[NSMutableArray addObject:](v3, "addObject:", v93);

  -[MTATimerControlsView compactSizeFont](self, "compactSizeFont");
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "mtui_fontByAddingTimeFontAttributes"));
  -[UILabel setFont:](self->_timeView, "setFont:", v95);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView topAnchor](self->_expectedTimeView, "topAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v195, "topAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v97));
  -[NSMutableArray addObject:](v3, "addObject:", v98);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView bottomAnchor](self->_expectedTimeView, "bottomAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_timeView, "topAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v100));
  -[NSMutableArray addObject:](v3, "addObject:", v101);

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView centerXAnchor](self->_expectedTimeView, "centerXAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v195, "centerXAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v103));
  -[NSMutableArray addObject:](v3, "addObject:", v104);

  if (MTUIIsLargeText(v105, v106))
  {
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView widthAnchor](self->_expectedTimeView, "widthAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToConstant:", v82 * 0.5));
    -[NSMutableArray addObject:](v3, "addObject:", v108);

  }
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView heightAnchor](self->_expectedTimeView, "heightAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView timeLabel](self->_expectedTimeView, "timeLabel"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "font"));
  objc_msgSend(v111, "lineHeight");
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToConstant:"));
  -[NSMutableArray addObject:](v3, "addObject:", v112);

  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_timeView, "bottomAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v195, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:", v114));
  -[NSMutableArray addObject:](v3, "addObject:", v115);

  v116 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_timeView, "centerXAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:", v117));
  -[NSMutableArray addObject:](v3, "addObject:", v118);

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_timeView, "centerYAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerYAnchor](self->_countdownView, "centerYAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v120));
  -[NSMutableArray addObject:](v3, "addObject:", v121);

  if (-[MTATimerControlsView isIpadAddSheet](self, "isIpadAddSheet"))
  {
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v56, "heightAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToConstant:", 275.3));
    -[NSMutableArray addObject:](v3, "addObject:", v123);
    v124 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV015ForegroundColorB0OAA19AttributedStringKeyADMc_ptr;
LABEL_16:

    goto LABEL_17;
  }
  v124 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV015ForegroundColorB0OAA19AttributedStringKeyADMc_ptr;
  if (!-[MTATimerControlsView isRunningTimer](self, "isRunningTimer"))
  {
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v56, "heightAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v123, "bounds");
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToConstant:", v125 * 0.64));
    -[NSMutableArray addObject:](v3, "addObject:", v126);

    goto LABEL_16;
  }
LABEL_17:
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView centerYAnchor](self->_timePicker, "centerYAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v56, "centerYAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:constant:", v128, -12.0));
  -[NSMutableArray addObject:](v3, "addObject:", v129);

  v130 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView heightAnchor](self->_timePicker, "heightAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v56, "heightAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:", v131));
  -[NSMutableArray addObject:](v3, "addObject:", v132);

  v133 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView widthAnchor](self->_timePicker, "widthAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "constraintEqualToConstant:", 320.0));
  -[NSMutableArray addObject:](v3, "addObject:", v134);

  v135 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView centerXAnchor](self->_timePicker, "centerXAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v56, "centerXAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToAnchor:", v136));
  -[NSMutableArray addObject:](v3, "addObject:", v137);

  v138 = (void *)objc_opt_new(v124[353]);
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v138);
  if (-[MTATimerControlsView isRunningTimer](self, "isRunningTimer")
    || (id)-[MTATimerControlsView timerControlState](self, "timerControlState") == (id)2)
  {
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:constant:", v140, v31));
    -[NSMutableArray addObject:](v3, "addObject:", v141);

    v142 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v21, "leadingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:", v143));
    -[NSMutableArray addObject:](v3, "addObject:", v144);

    v145 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v21, "trailingAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:", v146));
    -[NSMutableArray addObject:](v3, "addObject:", v147);

    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "leadingAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v21, "leadingAnchor"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintEqualToAnchor:constant:", v149, 16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v150);

    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v21, "trailingAnchor"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:constant:", v152, -16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v153);

    v154 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v56, "bottomAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
    v157 = MTUIIsLargeText(v155, v156);
    v158 = 24.0;
    if (v157)
      v158 = 0.0;
    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "constraintEqualToAnchor:constant:", v155, v158));
    -[NSMutableArray addObject:](v3, "addObject:", v159);

    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "topAnchor"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
    v162 = objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "constraintEqualToAnchor:constant:", v161, 34.0));
  }
  else
  {
    if (!-[MTATimerControlsView isIpadAddSheet](self, "isIpadAddSheet"))
    {
      v163 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v56, "bottomAnchor"));
      v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "topAnchor"));
      v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:", v164));
      -[NSMutableArray addObject:](v3, "addObject:", v165);

    }
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "bottomAnchor"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
    v162 = objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "constraintLessThanOrEqualToAnchor:", v161));
  }
  v166 = (void *)v162;
  -[NSMutableArray addObject:](v3, "addObject:", v162);

  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "leadingAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "constraintEqualToAnchor:", v168));
  -[NSMutableArray addObject:](v3, "addObject:", v169);

  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "trailingAnchor"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "constraintEqualToAnchor:", v171));
  -[NSMutableArray addObject:](v3, "addObject:", v172);

  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "heightAnchor"));
  if (MTUIIsLargeText(v173, v174))
    v175 = 104.0;
  else
    v175 = 52.0;
  v176 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "constraintEqualToConstant:", v175 * (double)(unint64_t)objc_msgSend(v176, "count")));
  -[NSMutableArray addObject:](v3, "addObject:", v177);

  v178 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "topAnchor"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "constraintEqualToAnchor:", v179));
  -[NSMutableArray addObject:](v3, "addObject:", v180);

  v181 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "trailingAnchor"));
  v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "constraintEqualToAnchor:constant:", v182, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v183);

  v184 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "leadingAnchor"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "constraintEqualToAnchor:constant:", v185, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v186);

  v187 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "bottomAnchor"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "constraintEqualToAnchor:", v188));
  -[NSMutableArray addObject:](v3, "addObject:", v189);

  v190 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v195, "centerXAnchor"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "constraintEqualToAnchor:", v191));
  -[NSMutableArray addObject:](v3, "addObject:", v192);

  return v3;
}

- (id)setupCompactNewTimerConstraints
{
  NSMutableArray *v3;
  UILayoutGuide *v4;
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
  UILayoutGuide *v21;
  unsigned __int8 v22;
  MTATimerButtonsController *buttonsController;
  uint64_t v24;
  void *v25;
  unsigned __int8 v26;
  MTATimerButtonsController *v27;
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
  UILayoutGuide *v54;
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
  double v65;
  double v66;
  MTATimerIntervalPickerView *timePicker;
  double v68;
  double v69;
  double v70;
  _BOOL4 v71;
  double v72;
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
  void *v85;
  UILayoutGuide *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  int v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v135;
  double v136;

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v4, "setIdentifier:", CFSTR("Parent"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  v21 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v21, "setIdentifier:", CFSTR("buttonsContainer"));
  v22 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  buttonsController = self->_buttonsController;
  if ((v22 & 1) != 0)
    v24 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](buttonsController, "startStopButton"));
  else
    v24 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](buttonsController, "cancelButton"));
  v25 = (void *)v24;
  v26 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  v27 = self->_buttonsController;
  if ((v26 & 1) != 0)
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](v27, "cancelButton"));
  else
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](v27, "startStopButton"));
  v29 = v28;
  +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, objc_msgSend(v28, "buttonCircleSize"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  -[NSMutableArray addObject:](v3, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
  -[NSMutableArray addObject:](v3, "addObject:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  -[NSMutableArray addObject:](v3, "addObject:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
  -[NSMutableArray addObject:](v3, "addObject:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", v136));
  -[NSMutableArray addObject:](v3, "addObject:", v43);

  v135 = v29;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v45));
  -[NSMutableArray addObject:](v3, "addObject:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", v136));
  -[NSMutableArray addObject:](v3, "addObject:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "widthAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  -[NSMutableArray addObject:](v3, "addObject:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v21, "heightAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToConstant:", v136));
  -[NSMutableArray addObject:](v3, "addObject:", v53);

  v54 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v54, "setIdentifier:", CFSTR("pickerCountdownContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v54, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
  -[NSMutableArray addObject:](v3, "addObject:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v54, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
  -[NSMutableArray addObject:](v3, "addObject:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v54, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v62));
  -[NSMutableArray addObject:](v3, "addObject:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v64, "bounds");
  v66 = v65 * 0.64;

  timePicker = self->_timePicker;
  -[MTATimerControlsView bounds](self, "bounds");
  -[MTATimerIntervalPickerView sizeThatFits:](timePicker, "sizeThatFits:", v68, v69);
  v71 = v66 > v70;
  if (v66 < v70)
    v66 = v70;
  v72 = dbl_10007AA10[v71] * v66;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v54, "heightAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToConstant:", v66));
  -[NSMutableArray addObject:](v3, "addObject:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView topAnchor](self->_timePicker, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v54, "topAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v76));
  -[NSMutableArray addObject:](v3, "addObject:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView heightAnchor](self->_timePicker, "heightAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v54, "heightAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v79));
  -[NSMutableArray addObject:](v3, "addObject:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView widthAnchor](self->_timePicker, "widthAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToConstant:", 320.0));
  -[NSMutableArray addObject:](v3, "addObject:", v82);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView centerXAnchor](self->_timePicker, "centerXAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v54, "centerXAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v84));
  -[NSMutableArray addObject:](v3, "addObject:", v85);

  v86 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v86, "setIdentifier:", CFSTR("tableViewContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v21, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v88));
  -[NSMutableArray addObject:](v3, "addObject:", v89);

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v21, "trailingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v91));
  -[NSMutableArray addObject:](v3, "addObject:", v92);

  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v21, "leadingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v95);

  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v21, "trailingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v98);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v54, "bottomAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
  v102 = MTUIIsLargeText(v100, v101);
  v103 = 0.0;
  if (!v102)
    v103 = v72;
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100, v103));
  -[NSMutableArray addObject:](v3, "addObject:", v104);

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v86, "topAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, 34.0));
  -[NSMutableArray addObject:](v3, "addObject:", v107);

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v86, "leadingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:", v109));
  -[NSMutableArray addObject:](v3, "addObject:", v110);

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v86, "trailingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v112));
  -[NSMutableArray addObject:](v3, "addObject:", v113);

  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v86, "heightAnchor"));
  if (MTUIIsLargeText(v114, v115))
    v116 = 104.0;
  else
    v116 = 52.0;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToConstant:", v116 * (double)(unint64_t)objc_msgSend(v117, "count")));
  -[NSMutableArray addObject:](v3, "addObject:", v118);

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v86, "topAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v120));
  -[NSMutableArray addObject:](v3, "addObject:", v121);

  v122 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v86, "trailingAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:constant:", v123, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v124);

  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v86, "leadingAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "constraintEqualToAnchor:constant:", v126, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v127);

  v128 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v86, "bottomAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:", v129));
  -[NSMutableArray addObject:](v3, "addObject:", v130);

  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v86, "bottomAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintLessThanOrEqualToAnchor:", v132));
  -[NSMutableArray addObject:](v3, "addObject:", v133);

  return v3;
}

- (BOOL)isIpadAddSheet
{
  int v3;

  v3 = MTIdiomIpad(self, a2);
  if (v3)
    LOBYTE(v3) = self->_style == 1;
  return v3;
}

- (id)setupSingleTimerConstraints
{
  NSMutableArray *v3;
  UILayoutGuide *v4;
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
  UILayoutGuide *v21;
  UILayoutGuide *v22;
  unsigned __int8 v23;
  MTATimerButtonsController *buttonsController;
  uint64_t v25;
  void *v26;
  unsigned __int8 v27;
  MTATimerButtonsController *v28;
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
  UILayoutGuide *v67;
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
  double v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  UILayoutGuide *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  int v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  double v185;
  void *v186;
  void *v187;
  double v188;
  void *v189;
  UILayoutGuide *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  UILayoutGuide *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  double v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  double v244;
  double v245;
  void *v246;
  double v247;
  double v248;
  double v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  double v281;
  void *v282;
  void *v283;
  double v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  double v292;
  double v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  uint64_t v298;
  double v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v309;
  void *v310;
  UILayoutGuide *v311;
  UILayoutGuide *v312;
  UILayoutGuide *v313;
  UILayoutGuide *v314;

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v4, "setIdentifier:", CFSTR("parentContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v314 = v4;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  v21 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v21, "setIdentifier:", CFSTR("groupedTimeContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v21);
  v22 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v22, "setIdentifier:", CFSTR("buttonsContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v22);
  v23 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  buttonsController = self->_buttonsController;
  if ((v23 & 1) != 0)
    v25 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](buttonsController, "startStopButton"));
  else
    v25 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](buttonsController, "cancelButton"));
  v26 = (void *)v25;
  v27 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  v28 = self->_buttonsController;
  v313 = v21;
  if ((v27 & 1) != 0)
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](v28, "cancelButton"));
  else
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](v28, "startStopButton"));
  v30 = v29;
  +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, objc_msgSend(v29, "buttonCircleSize"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  -[NSMutableArray addObject:](v3, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  -[NSMutableArray addObject:](v3, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v22, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
  -[NSMutableArray addObject:](v3, "addObject:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v22, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  -[NSMutableArray addObject:](v3, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "widthAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:", 0.0));
  -[NSMutableArray addObject:](v3, "addObject:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "widthAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "heightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
  -[NSMutableArray addObject:](v3, "addObject:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 0.0));
  -[NSMutableArray addObject:](v3, "addObject:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "heightAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
  -[NSMutableArray addObject:](v3, "addObject:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v22, "heightAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 0.0));
  -[NSMutableArray addObject:](v3, "addObject:", v54);

  v312 = v22;
  if (self->_style == 3)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v22, "leadingAnchor", v30, v26));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
    -[NSMutableArray addObject:](v3, "addObject:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v22, "trailingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
    -[NSMutableArray addObject:](v3, "addObject:", v60);

    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v22, "leadingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v22, "trailingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, -16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v66);

    v67 = objc_opt_new(UILayoutGuide);
    -[UILayoutGuide setIdentifier:](v67, "setIdentifier:", CFSTR("pickerCountdownContainer"));
    -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v67);
    if (+[MTAUtilities isLandscape](MTAUtilities, "isLandscape"))
    {
      v68 = v30;
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v22, "centerYAnchor"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView centerYAnchor](self, "centerYAnchor"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v70));
      -[NSMutableArray addObject:](v3, "addObject:", v71);

      v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v67, "centerYAnchor"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v4, "centerYAnchor"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v73));
      -[NSMutableArray addObject:](v3, "addObject:", v74);

      v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v67, "centerXAnchor"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v4, "centerXAnchor"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v76));
      -[NSMutableArray addObject:](v3, "addObject:", v77);

      v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v67, "heightAnchor"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v79, "bounds");
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:", v80 * 0.64));

      LODWORD(v82) = 1144750080;
      objc_msgSend(v81, "setPriority:", v82);
      -[NSMutableArray addObject:](v3, "addObject:", v81);
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v67, "heightAnchor"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v67, "widthAnchor"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v84));
      -[NSMutableArray addObject:](v3, "addObject:", v85);

      v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v67, "leadingAnchor"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintGreaterThanOrEqualToAnchor:constant:", v87, 8.0));
      -[NSMutableArray addObject:](v3, "addObject:", v88);

      v89 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v67, "trailingAnchor"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintLessThanOrEqualToAnchor:constant:", v90, 8.0));
      -[NSMutableArray addObject:](v3, "addObject:", v91);

      v92 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView topAnchor](self->_countdownView, "topAnchor"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v67, "topAnchor"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v93));
      -[NSMutableArray addObject:](v3, "addObject:", v94);

    }
    else
    {
      v218 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor"));
      v219 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
      v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "constraintEqualToAnchor:constant:", v219, 0.0));
      -[NSMutableArray addObject:](v3, "addObject:", v220);

      v221 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v67, "topAnchor"));
      v222 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
      v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "constraintEqualToAnchor:", v222));
      -[NSMutableArray addObject:](v3, "addObject:", v223);

      v224 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v67, "leadingAnchor"));
      v225 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
      v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v224, "constraintEqualToAnchor:", v225));
      -[NSMutableArray addObject:](v3, "addObject:", v226);

      v227 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v67, "trailingAnchor"));
      v228 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
      v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "constraintEqualToAnchor:", v228));
      -[NSMutableArray addObject:](v3, "addObject:", v229);

      v230 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v67, "bottomAnchor"));
      v231 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v22, "bottomAnchor"));
      v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "constraintEqualToAnchor:constant:", v231, -24.0));
      -[NSMutableArray addObject:](v3, "addObject:", v232);

      v81 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView topAnchor](self->_countdownView, "topAnchor"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v67, "topAnchor"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v92, 0.0));
      -[NSMutableArray addObject:](v3, "addObject:", v93);
    }

    v233 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
    v234 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v67, "centerXAnchor"));
    v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "constraintEqualToAnchor:", v234));
    -[NSMutableArray addObject:](v3, "addObject:", v235);

    v236 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
    v237 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView heightAnchor](self->_countdownView, "heightAnchor"));
    v238 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v236, "constraintEqualToAnchor:", v237));
    -[NSMutableArray addObject:](v3, "addObject:", v238);

    v239 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView bottomAnchor](self->_countdownView, "bottomAnchor"));
    v240 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v67, "bottomAnchor"));
    v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "constraintEqualToAnchor:", v240));
    -[NSMutableArray addObject:](v3, "addObject:", v241);

    v242 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 130.0, UIFontWeightThin));
    v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "mtui_fontByAddingTimeFontAttributes"));
    -[UILabel setFont:](self->_timeView, "setFont:", v243);

    -[MTUITimerCountdownView frame](self->_countdownView, "frame");
    v245 = v244 * v244;
    v246 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
    objc_msgSend(v246, "pointSize");
    v248 = sqrt(v245 + v247 * v247);

    if (v248 >= 288.0)
      v249 = v248;
    else
      v249 = 288.0;
    v311 = v67;
    v21 = v313;
    v250 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v313, "widthAnchor"));
    v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v250, "constraintEqualToConstant:", v249));
    -[NSMutableArray addObject:](v3, "addObject:", v251);

    v252 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView topAnchor](self->_expectedTimeView, "topAnchor"));
    v253 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v313, "topAnchor"));
    v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v252, "constraintEqualToAnchor:", v253));
    -[NSMutableArray addObject:](v3, "addObject:", v254);

    v255 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView heightAnchor](self->_expectedTimeView, "heightAnchor"));
    v256 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView timeLabel](self->_expectedTimeView, "timeLabel"));
    v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "font"));
    objc_msgSend(v257, "lineHeight");
    v258 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "constraintEqualToConstant:"));
    -[NSMutableArray addObject:](v3, "addObject:", v258);

    v259 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView centerXAnchor](self->_expectedTimeView, "centerXAnchor"));
    v260 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v313, "centerXAnchor"));
    v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v259, "constraintEqualToAnchor:", v260));
    -[NSMutableArray addObject:](v3, "addObject:", v261);

    v262 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_timeView, "topAnchor"));
    v263 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView bottomAnchor](self->_expectedTimeView, "bottomAnchor"));
    v264 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v262, "constraintEqualToAnchor:", v263));
    -[NSMutableArray addObject:](v3, "addObject:", v264);

    v265 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_timeView, "centerXAnchor"));
    v266 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
    v267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v265, "constraintEqualToAnchor:", v266));
    -[NSMutableArray addObject:](v3, "addObject:", v267);

    v268 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_timeView, "heightAnchor"));
    v269 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
    objc_msgSend(v269, "lineHeight");
    v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "constraintEqualToConstant:"));
    -[NSMutableArray addObject:](v3, "addObject:", v270);

    v271 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_timeView, "widthAnchor"));
    v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "constraintEqualToConstant:", v248 * 0.8));
    -[MTATimerControlsView setTimerCountdownWidthConstraint:](self, "setTimerCountdownWidthConstraint:", v272);

    v273 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView timerCountdownWidthConstraint](self, "timerCountdownWidthConstraint"));
    -[NSMutableArray addObject:](v3, "addObject:", v273);

    v274 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView centerXAnchor](self->_timePicker, "centerXAnchor"));
    v275 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v311, "centerXAnchor"));
    v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "constraintEqualToAnchor:", v275));
    -[NSMutableArray addObject:](v3, "addObject:", v276);

    v277 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView bottomAnchor](self->_timePicker, "bottomAnchor"));
    v278 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
    v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v277, "constraintEqualToAnchor:constant:", v278, -34.0));
    -[NSMutableArray addObject:](v3, "addObject:", v279);

    v280 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView heightAnchor](self->_timePicker, "heightAnchor"));
    -[MTATimerIntervalPickerView frame](self->_timePicker, "frame");
    v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "constraintEqualToConstant:", v281));
    -[NSMutableArray addObject:](v3, "addObject:", v282);

    v283 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView widthAnchor](self->_timePicker, "widthAnchor"));
    -[MTATimerIntervalPickerView frame](self->_timePicker, "frame");
    v285 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "constraintEqualToConstant:", v284));
    -[NSMutableArray addObject:](v3, "addObject:", v285);

    v286 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
    v287 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_timeView, "bottomAnchor"));
    v288 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v286, "constraintEqualToAnchor:constant:", v287, 17.0));
    -[NSMutableArray addObject:](v3, "addObject:", v288);

    v289 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView centerXAnchor](self->_tableView, "centerXAnchor"));
    v290 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v313, "centerXAnchor"));
    v291 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v289, "constraintEqualToAnchor:", v290));
    -[NSMutableArray addObject:](v3, "addObject:", v291);

    -[MTUITimerCountdownView size](self->_countdownView, "size");
    v293 = sqrt(v292 * v292 * 0.5) * 0.9;
    v294 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView widthAnchor](self->_tableView, "widthAnchor"));
    v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "constraintEqualToConstant:", fmin(v293, 332.0)));
    -[MTATimerControlsView setTableWidthConstraint:](self, "setTableWidthConstraint:", v295);

    v296 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableWidthConstraint](self, "tableWidthConstraint"));
    -[NSMutableArray addObject:](v3, "addObject:", v296);

    v297 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView heightAnchor](self->_tableView, "heightAnchor"));
    if (MTUIIsLargeText(v297, v298))
      v299 = 104.0;
    else
      v299 = 52.0;
    v300 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
    v301 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v297, "constraintEqualToConstant:", v299 * (double)(unint64_t)objc_msgSend(v300, "count")));
    -[NSMutableArray addObject:](v3, "addObject:", v301);

    v190 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
    v215 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v313, "bottomAnchor"));
    v216 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide constraintEqualToAnchor:](v190, "constraintEqualToAnchor:", v215));
    -[NSMutableArray addObject:](v3, "addObject:", v216);
    v195 = v4;
  }
  else
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor", v30, v26));
    v96 = v30;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v314, "topAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:constant:", v97, 0.0));
    -[NSMutableArray addObject:](v3, "addObject:", v98);

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v22, "leadingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v314, "leadingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v100));
    -[NSMutableArray addObject:](v3, "addObject:", v101);

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v22, "trailingAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v314, "trailingAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:", v103));
    -[NSMutableArray addObject:](v3, "addObject:", v104);

    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v22, "leadingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, 16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v107);

    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "trailingAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v22, "trailingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, -16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v110);

    v111 = objc_opt_new(UILayoutGuide);
    -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v111, "topAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v314, "topAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v113));
    -[NSMutableArray addObject:](v3, "addObject:", v114);

    v115 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v111, "leadingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v314, "leadingAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v116));
    -[NSMutableArray addObject:](v3, "addObject:", v117);

    v118 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v111, "trailingAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v314, "trailingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v119));
    -[NSMutableArray addObject:](v3, "addObject:", v120);

    v121 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v111, "bottomAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor"));
    v124 = MTUIIsLargeText(v122, v123);
    v125 = 24.0;
    v126 = 0.0;
    if (v124)
      v125 = 0.0;
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v122, v125));
    -[NSMutableArray addObject:](v3, "addObject:", v127);

    if (self->_style == 5)
      v126 = 12.0;
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView topAnchor](self->_countdownView, "topAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v111, "topAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:constant:", v129, v126 + 0.0));
    -[NSMutableArray addObject:](v3, "addObject:", v130);

    v131 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v111, "centerXAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v132));
    -[NSMutableArray addObject:](v3, "addObject:", v133);

    v134 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView heightAnchor](self->_countdownView, "heightAnchor"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v135));
    -[NSMutableArray addObject:](v3, "addObject:", v136);

    v137 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView bottomAnchor](self->_countdownView, "bottomAnchor"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v111, "bottomAnchor"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:constant:", v138, -v126));
    -[NSMutableArray addObject:](v3, "addObject:", v139);

    -[MTUITimerCountdownView frame](self->_countdownView, "frame");
    v141 = v140 * v140;
    v142 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
    objc_msgSend(v142, "pointSize");
    v144 = sqrt(v141 + v143 * v143);

    v145 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v21, "widthAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToConstant:", v144 * 0.8));
    -[NSMutableArray addObject:](v3, "addObject:", v146);

    v147 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_timeView, "topAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v148));
    -[NSMutableArray addObject:](v3, "addObject:", v149);

    v150 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](self->_timeView, "leftAnchor"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v21, "leftAnchor"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v151));
    -[NSMutableArray addObject:](v3, "addObject:", v152);

    v153 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](self->_timeView, "rightAnchor"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](v21, "rightAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintEqualToAnchor:", v154));
    -[NSMutableArray addObject:](v3, "addObject:", v155);

    v156 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_timeView, "heightAnchor"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
    objc_msgSend(v157, "pointSize");
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToConstant:"));
    -[NSMutableArray addObject:](v3, "addObject:", v158);

    -[MTATimerControlsView compactSizeFont](self, "compactSizeFont");
    v159 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "mtui_fontByAddingTimeFontAttributes"));
    -[UILabel setFont:](self->_timeView, "setFont:", v160);

    v161 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView centerXAnchor](self->_expectedTimeView, "centerXAnchor"));
    v162 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_timeView, "centerXAnchor"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "constraintEqualToAnchor:", v162));
    -[NSMutableArray addObject:](v3, "addObject:", v163);

    v164 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView topAnchor](self->_expectedTimeView, "topAnchor"));
    v165 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_timeView, "bottomAnchor"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "constraintEqualToAnchor:constant:", v165, 12.0));
    -[NSMutableArray addObject:](v3, "addObject:", v166);

    if (MTUIIsLargeText(v167, v168))
    {
      v169 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView widthAnchor](self->_expectedTimeView, "widthAnchor"));
      v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "constraintEqualToConstant:", v144 * 0.5));
      -[NSMutableArray addObject:](v3, "addObject:", v170);

    }
    v171 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView heightAnchor](self->_expectedTimeView, "heightAnchor"));
    v172 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView timeLabel](self->_expectedTimeView, "timeLabel"));
    v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "font"));
    objc_msgSend(v173, "lineHeight");
    v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToConstant:"));
    -[NSMutableArray addObject:](v3, "addObject:", v174);

    v175 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView bottomAnchor](self->_expectedTimeView, "bottomAnchor"));
    v176 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
    v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "constraintEqualToAnchor:", v176));
    -[NSMutableArray addObject:](v3, "addObject:", v177);

    v178 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView centerYAnchor](self->_timePicker, "centerYAnchor"));
    v179 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v111, "centerYAnchor"));
    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "constraintEqualToAnchor:constant:", v179, -12.0));
    -[NSMutableArray addObject:](v3, "addObject:", v180);

    v181 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView centerXAnchor](self->_timePicker, "centerXAnchor"));
    v311 = v111;
    v182 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v111, "centerXAnchor"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "constraintEqualToAnchor:", v182));
    -[NSMutableArray addObject:](v3, "addObject:", v183);

    v184 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView heightAnchor](self->_timePicker, "heightAnchor"));
    -[MTATimerIntervalPickerView frame](self->_timePicker, "frame");
    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "constraintEqualToConstant:", v185));
    -[NSMutableArray addObject:](v3, "addObject:", v186);

    v187 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView widthAnchor](self->_timePicker, "widthAnchor"));
    -[MTATimerIntervalPickerView frame](self->_timePicker, "frame");
    v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "constraintEqualToConstant:", v188));
    -[NSMutableArray addObject:](v3, "addObject:", v189);

    v190 = objc_opt_new(UILayoutGuide);
    -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v190, "topAnchor"));
    v192 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v312, "bottomAnchor"));
    v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "constraintEqualToAnchor:constant:", v192, 34.0));
    -[NSMutableArray addObject:](v3, "addObject:", v193);

    v194 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v190, "leadingAnchor"));
    v195 = v314;
    v196 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v314, "leadingAnchor"));
    v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "constraintEqualToAnchor:", v196));
    -[NSMutableArray addObject:](v3, "addObject:", v197);

    v198 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v190, "trailingAnchor"));
    v199 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v314, "trailingAnchor"));
    v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "constraintEqualToAnchor:", v199));
    -[NSMutableArray addObject:](v3, "addObject:", v200);

    v201 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v190, "heightAnchor"));
    if (MTUIIsLargeText(v201, v202))
      v203 = 104.0;
    else
      v203 = 52.0;
    v204 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
    v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "constraintEqualToConstant:", v203 * (double)(unint64_t)objc_msgSend(v204, "count")));
    -[NSMutableArray addObject:](v3, "addObject:", v205);

    v206 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
    v207 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v190, "topAnchor"));
    v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "constraintEqualToAnchor:", v207));
    -[NSMutableArray addObject:](v3, "addObject:", v208);

    v209 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
    v210 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v190, "trailingAnchor"));
    v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "constraintEqualToAnchor:constant:", v210, -16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v211);

    v212 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
    v213 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v190, "leadingAnchor"));
    v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v212, "constraintEqualToAnchor:constant:", v213, 16.0));
    -[NSMutableArray addObject:](v3, "addObject:", v214);

    v215 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
    v216 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v190, "bottomAnchor"));
    v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "constraintEqualToAnchor:", v216));
    -[NSMutableArray addObject:](v3, "addObject:", v217);

  }
  v302 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v21, "centerXAnchor"));
  v303 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v302, "constraintEqualToAnchor:", v303));
  -[NSMutableArray addObject:](v3, "addObject:", v304);

  v305 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v21, "centerYAnchor"));
  v306 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerYAnchor](self->_countdownView, "centerYAnchor"));
  v307 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v305, "constraintEqualToAnchor:", v306));
  -[NSMutableArray addObject:](v3, "addObject:", v307);

  return v3;
}

- (id)iPadSingleCellNewTimerConstraints
{
  NSMutableArray *v3;
  UILayoutGuide *v4;
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
  UILayoutGuide *v21;
  UILayoutGuide *v22;
  unsigned __int8 v23;
  MTATimerButtonsController *buttonsController;
  uint64_t v25;
  void *v26;
  unsigned __int8 v27;
  MTATimerButtonsController *v28;
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
  UILayoutGuide *v67;
  void *v68;
  void *v69;
  void *v70;
  UILayoutGuide *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  UILayoutGuide *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  double v166;
  void *v167;
  void *v168;
  double v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  uint64_t v183;
  double v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  UILayoutGuide *v197;
  UILayoutGuide *v198;
  void *v199;
  void *v200;

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v4, "setIdentifier:", CFSTR("parentContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  v21 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v21, "setIdentifier:", CFSTR("groupedTimeContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v21);
  v22 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v22, "setIdentifier:", CFSTR("buttonsContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v22);
  v23 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  buttonsController = self->_buttonsController;
  if ((v23 & 1) != 0)
    v25 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](buttonsController, "startStopButton"));
  else
    v25 = objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](buttonsController, "cancelButton"));
  v26 = (void *)v25;
  v27 = -[MTATimerControlsView mtui_isRTL](self, "mtui_isRTL");
  v28 = self->_buttonsController;
  if ((v27 & 1) != 0)
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](v28, "cancelButton"));
  else
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](v28, "startStopButton"));
  v30 = v29;
  +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", self, objc_msgSend(v29, "buttonCircleSize"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  -[NSMutableArray addObject:](v3, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  -[NSMutableArray addObject:](v3, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v22, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
  -[NSMutableArray addObject:](v3, "addObject:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v22, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  -[NSMutableArray addObject:](v3, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "widthAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:", 0.0));
  -[NSMutableArray addObject:](v3, "addObject:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "widthAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "heightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
  -[NSMutableArray addObject:](v3, "addObject:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 0.0));
  -[NSMutableArray addObject:](v3, "addObject:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "heightAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
  -[NSMutableArray addObject:](v3, "addObject:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v22, "heightAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToConstant:", 0.0));
  -[NSMutableArray addObject:](v3, "addObject:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v22, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
  -[NSMutableArray addObject:](v3, "addObject:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v22, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
  -[NSMutableArray addObject:](v3, "addObject:", v60);

  v199 = v26;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v22, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v63);

  v200 = v30;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v22, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, -16.0));
  -[NSMutableArray addObject:](v3, "addObject:", v66);

  v67 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v67, "setIdentifier:", CFSTR("pickerCountdownContainer"));
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v67);
  v197 = v4;
  v198 = v22;
  if (+[MTAUtilities isLandscape](MTAUtilities, "isLandscape"))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "delegate"));

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v22, "centerYAnchor"));
    v71 = v4;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView topAnchor](self, "topAnchor"));
    objc_msgSend(v69, "visibleViewHeight");
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v72, v73 * 0.5));
    -[NSMutableArray addObject:](v3, "addObject:", v74);

    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v67, "centerYAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v71, "centerYAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v76));
    -[NSMutableArray addObject:](v3, "addObject:", v77);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v67, "centerXAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v71, "centerXAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v79));
    -[NSMutableArray addObject:](v3, "addObject:", v80);

    v81 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v81, "bounds");
    v83 = v82;

    v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v84, "bounds");
    v86 = v85;

    if (v83 >= v86)
      v83 = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v67, "heightAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToConstant:", v83 * 0.64));

    LODWORD(v89) = 1144750080;
    objc_msgSend(v88, "setPriority:", v89);
    -[NSMutableArray addObject:](v3, "addObject:", v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v67, "heightAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v67, "widthAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v91));
    -[NSMutableArray addObject:](v3, "addObject:", v92);

    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v67, "leadingAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "trailingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintGreaterThanOrEqualToAnchor:constant:", v94, 8.0));
    -[NSMutableArray addObject:](v3, "addObject:", v95);

    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v67, "trailingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "leadingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintLessThanOrEqualToAnchor:constant:", v97, 8.0));
    -[NSMutableArray addObject:](v3, "addObject:", v98);

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView topAnchor](self->_countdownView, "topAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v67, "topAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v100));
    -[NSMutableArray addObject:](v3, "addObject:", v101);

  }
  else
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v22, "topAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
    v104 = v22;
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, 0.0));
    -[NSMutableArray addObject:](v3, "addObject:", v105);

    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v67, "topAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v107));
    -[NSMutableArray addObject:](v3, "addObject:", v108);

    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v67, "leadingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v110));
    -[NSMutableArray addObject:](v3, "addObject:", v111);

    v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v67, "trailingAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:", v113));
    -[NSMutableArray addObject:](v3, "addObject:", v114);

    v115 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v67, "bottomAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v104, "bottomAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:constant:", v116, -24.0));
    -[NSMutableArray addObject:](v3, "addObject:", v117);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView topAnchor](self->_countdownView, "topAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v67, "topAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v88, 0.0));
    -[NSMutableArray addObject:](v3, "addObject:", v99);
  }

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v67, "centerXAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:", v119));
  -[NSMutableArray addObject:](v3, "addObject:", v120);

  v121 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView heightAnchor](self->_countdownView, "heightAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v122));
  -[NSMutableArray addObject:](v3, "addObject:", v123);

  v124 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView bottomAnchor](self->_countdownView, "bottomAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v67, "bottomAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v125));
  -[NSMutableArray addObject:](v3, "addObject:", v126);

  v127 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 130.0, UIFontWeightThin));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "mtui_fontByAddingTimeFontAttributes"));
  -[UILabel setFont:](self->_timeView, "setFont:", v128);

  -[MTUITimerCountdownView frame](self->_countdownView, "frame");
  v130 = v129 * v129;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
  objc_msgSend(v131, "pointSize");
  v133 = sqrt(v130 + v132 * v132);

  if (v133 >= 288.0)
    v134 = v133;
  else
    v134 = 288.0;
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v21, "widthAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToConstant:", v134));
  -[NSMutableArray addObject:](v3, "addObject:", v136);

  v137 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView topAnchor](self->_expectedTimeView, "topAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v21, "topAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:", v138));
  -[NSMutableArray addObject:](v3, "addObject:", v139);

  v140 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView heightAnchor](self->_expectedTimeView, "heightAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView timeLabel](self->_expectedTimeView, "timeLabel"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "font"));
  objc_msgSend(v142, "lineHeight");
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToConstant:"));
  -[NSMutableArray addObject:](v3, "addObject:", v143);

  v144 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView centerXAnchor](self->_expectedTimeView, "centerXAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v21, "centerXAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:", v145));
  -[NSMutableArray addObject:](v3, "addObject:", v146);

  v147 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_timeView, "topAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView bottomAnchor](self->_expectedTimeView, "bottomAnchor"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v148));
  -[NSMutableArray addObject:](v3, "addObject:", v149);

  v150 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_timeView, "centerXAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v151));
  -[NSMutableArray addObject:](v3, "addObject:", v152);

  v153 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_timeView, "heightAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
  objc_msgSend(v154, "lineHeight");
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintEqualToConstant:"));
  -[NSMutableArray addObject:](v3, "addObject:", v155);

  v156 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_timeView, "widthAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToConstant:", v133 * 0.8));
  -[MTATimerControlsView setTimerCountdownWidthConstraint:](self, "setTimerCountdownWidthConstraint:", v157);

  v158 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView timerCountdownWidthConstraint](self, "timerCountdownWidthConstraint"));
  -[NSMutableArray addObject:](v3, "addObject:", v158);

  v159 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView centerXAnchor](self->_timePicker, "centerXAnchor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v67, "centerXAnchor"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:", v160));
  -[NSMutableArray addObject:](v3, "addObject:", v161);

  v162 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView bottomAnchor](self->_timePicker, "bottomAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToAnchor:constant:", v163, -34.0));
  -[NSMutableArray addObject:](v3, "addObject:", v164);

  v165 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView heightAnchor](self->_timePicker, "heightAnchor"));
  -[MTATimerIntervalPickerView frame](self->_timePicker, "frame");
  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "constraintEqualToConstant:", v166));
  -[NSMutableArray addObject:](v3, "addObject:", v167);

  v168 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerView widthAnchor](self->_timePicker, "widthAnchor"));
  -[MTATimerIntervalPickerView frame](self->_timePicker, "frame");
  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToConstant:", v169));
  -[NSMutableArray addObject:](v3, "addObject:", v170);

  v171 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_timeView, "bottomAnchor"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToAnchor:constant:", v172, 17.0));
  -[NSMutableArray addObject:](v3, "addObject:", v173);

  v174 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView centerXAnchor](self->_tableView, "centerXAnchor"));
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v21, "centerXAnchor"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "constraintEqualToAnchor:", v175));
  -[NSMutableArray addObject:](v3, "addObject:", v176);

  -[MTUITimerCountdownView size](self->_countdownView, "size");
  v178 = sqrt(v177 * v177 * 0.5) * 0.9;
  v179 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView widthAnchor](self->_tableView, "widthAnchor"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "constraintEqualToConstant:", fmin(v178, 332.0)));
  -[MTATimerControlsView setTableWidthConstraint:](self, "setTableWidthConstraint:", v180);

  v181 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableWidthConstraint](self, "tableWidthConstraint"));
  -[NSMutableArray addObject:](v3, "addObject:", v181);

  v182 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView heightAnchor](self->_tableView, "heightAnchor"));
  if (MTUIIsLargeText(v182, v183))
    v184 = 104.0;
  else
    v184 = 52.0;
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "constraintEqualToConstant:", v184 * (double)(unint64_t)objc_msgSend(v185, "count")));
  -[NSMutableArray addObject:](v3, "addObject:", v186);

  v187 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v21, "bottomAnchor"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "constraintEqualToAnchor:", v188));
  -[NSMutableArray addObject:](v3, "addObject:", v189);

  v190 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v21, "centerXAnchor"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "constraintEqualToAnchor:", v191));
  -[NSMutableArray addObject:](v3, "addObject:", v192);

  v193 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v21, "centerYAnchor"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerYAnchor](self->_countdownView, "centerYAnchor"));
  v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "constraintEqualToAnchor:", v194));
  -[NSMutableArray addObject:](v3, "addObject:", v195);

  return v3;
}

- (id)setupCollectionViewConstraints
{
  NSMutableArray *v3;
  UILayoutGuide *v4;
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
  UILayoutGuide *v17;
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
  double v46;
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
  double v61;
  double v62;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v4, "setIdentifier:", CFSTR("parentContainer"));
  -[MTATimerControlsView _addLayoutGuide:](self, "_addLayoutGuide:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView topAnchor](self, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView bottomAnchor](self, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView leadingAnchor](self, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView trailingAnchor](self, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  v17 = objc_opt_new(UILayoutGuide);
  -[UILayoutGuide setIdentifier:](v17, "setIdentifier:", CFSTR("groupedTimeView"));
  -[MTATimerControlsView _addLayoutGuide:](self, "_addLayoutGuide:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v4, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v17, "centerYAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v4, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  -[NSMutableArray addObject:](v3, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_timeView, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v17, "centerXAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_timeView, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v17, "centerYAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  -[NSMutableArray addObject:](v3, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v17, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  -[NSMutableArray addObject:](v3, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_timeView, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView leadingAnchor](self->_countdownView, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 12.0));
  -[NSMutableArray addObject:](v3, "addObject:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_timeView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView trailingAnchor](self->_countdownView, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -12.0));
  -[NSMutableArray addObject:](v3, "addObject:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 64.0, UIFontWeightThin));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mtui_fontByAddingTimeFontAttributes"));

  -[UILabel setFont:](self->_timeView, "setFont:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView centerXAnchor](self->_expectedTimeView, "centerXAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v17, "centerXAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  -[NSMutableArray addObject:](v3, "addObject:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView lastBaselineAnchor](self->_expectedTimeView, "lastBaselineAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_timeView, "lastBaselineAnchor"));
  objc_msgSend(v40, "capHeight");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -(v46 + 20.0)));
  -[NSMutableArray addObject:](v3, "addObject:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView topAnchor](self->_expectedTimeView, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v17, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v49));
  -[NSMutableArray addObject:](v3, "addObject:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView leadingAnchor](self->_expectedTimeView, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_timeView, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:", v52));
  -[NSMutableArray addObject:](v3, "addObject:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIGlyphTimeView trailingAnchor](self->_expectedTimeView, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_timeView, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:", v55));
  -[NSMutableArray addObject:](v3, "addObject:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_timerNameLabel, "centerXAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v17, "centerXAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
  -[NSMutableArray addObject:](v3, "addObject:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timerNameLabel, "font"));
  objc_msgSend(v60, "lineHeight");
  v62 = v61 * 0.5;

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_timerNameLabel, "centerYAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_timeView, "lastBaselineAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, v62 + 20.0));
  -[NSMutableArray addObject:](v3, "addObject:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_timerNameLabel, "bottomAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v17, "bottomAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintLessThanOrEqualToAnchor:", v67));
  -[NSMutableArray addObject:](v3, "addObject:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_timerNameLabel, "widthAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:multiplier:", v70, 0.6));
  -[NSMutableArray addObject:](v3, "addObject:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v4, "widthAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:multiplier:", v73, 0.78));
  -[NSMutableArray addObject:](v3, "addObject:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView heightAnchor](self->_countdownView, "heightAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v76));
  -[NSMutableArray addObject:](v3, "addObject:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerXAnchor](self->_countdownView, "centerXAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v4, "centerXAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v79));
  -[NSMutableArray addObject:](v3, "addObject:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerYAnchor](self->_countdownView, "centerYAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v4, "centerYAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v82));
  -[NSMutableArray addObject:](v3, "addObject:", v83);

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView widthAnchor](self->_countdownView, "widthAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView heightAnchor](self->_countdownView, "heightAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v85));
  -[NSMutableArray addObject:](v3, "addObject:", v86);

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MTUITimerCountdownView centerYAnchor](self->_countdownView, "centerYAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v17, "centerYAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v88));
  -[NSMutableArray addObject:](v3, "addObject:", v89);

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "widthAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToConstant:", 40.0));
  -[NSMutableArray addObject:](v3, "addObject:", v92);

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "heightAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "widthAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v96));
  -[NSMutableArray addObject:](v3, "addObject:", v97);

  v98 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100, 15.0));
  -[NSMutableArray addObject:](v3, "addObject:", v101);

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView stopButton](self, "stopButton"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "bottomAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:constant:", v104, -15.0));
  -[NSMutableArray addObject:](v3, "addObject:", v105);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "widthAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToConstant:", 40.0));
  -[NSMutableArray addObject:](v3, "addObject:", v108);

  v109 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "heightAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "widthAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v112));
  -[NSMutableArray addObject:](v3, "addObject:", v113);

  v114 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "trailingAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4, "trailingAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:constant:", v116, -15.0));
  -[NSMutableArray addObject:](v3, "addObject:", v117);

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView pauseResumeButton](self, "pauseResumeButton"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "bottomAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4, "bottomAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:constant:", v120, -15.0));
  -[NSMutableArray addObject:](v3, "addObject:", v121);

  return v3;
}

- (void)setButtonControlViewsHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController cancelButton](self->_buttonsController, "cancelButton"));
  objc_msgSend(v5, "setHidden:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerButtonsController startStopButton](self->_buttonsController, "startStopButton"));
  objc_msgSend(v6, "setHidden:", v3);

}

- (void)resetLayoutGuides
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView layoutGuides](self, "layoutGuides", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[MTATimerControlsView removeLayoutGuide:](self, "removeLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView layoutGuides](self, "layoutGuides"));
  objc_msgSend(v8, "removeAllObjects");

}

- (void)_addLayoutGuide:(id)a3
{
  id v4;

  v4 = a3;
  -[MTATimerControlsView addLayoutGuide:](self, "addLayoutGuide:", v4);
  -[NSMutableArray addObject:](self->_layoutGuides, "addObject:", v4);

}

- (void)layoutSubviews
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTATimerControlsView;
  v3 = -[MTATimerControlsView layoutSubviews](&v14, "layoutSubviews");
  if (MTIdiomIpad(v3, v4) && self->_style - 3 <= 1)
  {
    -[MTUITimerCountdownView size](self->_countdownView, "size");
    v6 = fmin(sqrt(v5 * v5 * 0.5) * 0.9, 332.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableWidthConstraint](self, "tableWidthConstraint"));
    objc_msgSend(v7, "setConstant:", v6);

    -[MTUITimerCountdownView frame](self->_countdownView, "frame");
    v9 = v8 * v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_timeView, "font"));
    objc_msgSend(v10, "pointSize");
    v12 = sqrt(v9 + v11 * v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView timerCountdownWidthConstraint](self, "timerCountdownWidthConstraint"));
    objc_msgSend(v13, "setConstant:", v12 * 0.8);

  }
  else if (-[MTATimerControlsView shouldSetupConstraintsAtLayout](self, "shouldSetupConstraintsAtLayout"))
  {
    -[MTATimerControlsView setupConstraints](self, "setupConstraints");
  }
}

- (BOOL)shouldSetupConstraintsAtLayout
{
  return !MTIdiomIpad(self, a2) || self->_style != 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
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
  NSString *toneName;
  void *v24;
  MTALabelEditCell *v25;
  MTALabelEditCell *editLabelCell;
  id v27;
  void *v28;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedIntValue");

  if (v9)
  {
    if (v9 == 1)
    {
      v10 = sub_100042584();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_toneChooserCell, "textLabel"));
      objc_msgSend(v12, "setFont:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_toneChooserCell, "textLabel"));
      objc_msgSend(v13, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityMedium);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_toneChooserCell, "textLabel"));
      objc_msgSend(v15, "setTextColor:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WHEN_TIMER_ENDS"), &stru_10009A4D0, 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_toneChooserCell, "textLabel"));
      objc_msgSend(v18, "setText:", v17);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](self->_toneChooserCell, "detailTextLabel"));
      objc_msgSend(v19, "setFont:", v11);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](self->_toneChooserCell, "detailTextLabel"));
      objc_msgSend(v20, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityMedium);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](self->_toneChooserCell, "detailTextLabel"));
      objc_msgSend(v22, "setTextColor:", v21);

      toneName = self->_toneName;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell detailTextLabel](self->_toneChooserCell, "detailTextLabel"));
      objc_msgSend(v24, "setText:", toneName);

      -[UITableViewCell setLayoutMargins:](self->_toneChooserCell, "setLayoutMargins:", 0.0, 16.0, 0.0, 0.0);
      v25 = self->_toneChooserCell;

    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    editLabelCell = self->_editLabelCell;
    v27 = sub_100042584();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[MTALabelEditCell setFont:](editLabelCell, "setFont:", v28);

    v25 = self->_editLabelCell;
  }
  return v25;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  v9 = objc_msgSend(v8, "unsignedIntValue");

  if (v9 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForRowAtIndexPath:", v6));
    objc_msgSend(WeakRetained, "showSoundPicker:", v11);

    objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView tableRows](self, "tableRows"));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  LODWORD(v7) = objc_msgSend(v8, "unsignedIntValue");

  return (_DWORD)v7 == 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  int v4;
  double result;

  v4 = MTUIIsLargeText(self, a2, a3, a4);
  result = 52.0;
  if (v4)
    return 104.0;
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4;
  id v5;
  double v6;
  double v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)UIView);
  objc_msgSend(v4, "bounds");
  v7 = v6;

  v8 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  objc_msgSend(v8, "setBackgroundColor:", v9);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 1.0;
}

- (void)pickerView:(id)a3 didChangeSelectedDuration:(double)a4
{
  void *v6;
  char v7;
  id v8;

  -[MTATimerControlsView setEdited:](self, "setEdited:", 1);
  -[MTATimerButtonsController setShouldEnableStartButton:](self->_buttonsController, "setShouldEnableStartButton:", a4 != 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "timePickerDidSelectDuration:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView delegate](self, "delegate"));
    objc_msgSend(v8, "timePickerDidSelectDuration:", a4);

  }
}

- (BOOL)isRunningInThirdSplitView
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView window](self, "window"));
  objc_msgSend(v2, "size");
  v4 = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  return v4 < v7 * 0.5;
}

- (double)compactSizeFont
{
  unsigned int v2;
  double *v3;

  v2 = -[MTATimerControlsView isRunningInThirdSplitView](self, "isRunningInThirdSplitView");
  v3 = (double *)&unk_10007AB80;
  if (!v2)
    v3 = (double *)&qword_10007AB88;
  return *v3;
}

+ (double)estimatedViewWidth
{
  return 0.0;
}

+ (double)estimatedViewHeight
{
  unsigned int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CGRect v15;

  if (!MTUIIsPadIdiom(a1, a2))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "bounds");
    v10 = v9;
    objc_msgSend(a1, "estimatedNonCountdownElementHeight");
    v8 = v11 + v10 * 0.64;
LABEL_6:

    return v8;
  }
  v3 = +[MTAUtilities isLandscape](MTAUtilities, "isLandscape");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  if (!v3)
  {
    v12 = 0.542 * v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v13, "bounds");
    v8 = fmin(v12, CGRectGetWidth(v15)) + 24.0;

    goto LABEL_6;
  }
  v6 = v5 * 0.5;

  objc_msgSend(a1, "estimatedCountdownViewHeight");
  return v6 + v7 / 3.0;
}

+ (double)estimatedCountdownViewHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3 * 0.64;

  return v4;
}

+ (double)estimatedNonCountdownElementHeight
{
  double v2;

  objc_msgSend(a1, "estimatedTonePickerHeight");
  return v2 + 84.0;
}

+ (double)estimatedNonCountdownElementHeightWithSpacing
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "estimatedNonCountdownElementHeight");
  v4 = v3;
  objc_msgSend(a1, "estimatedElementSpacing");
  return v4 + v5;
}

+ (double)estimatedElementSpacing
{
  return 48.0;
}

+ (double)estimatedTonePickerHeight
{
  int v2;
  double result;

  v2 = MTUIIsLargeText(a1, a2);
  result = 104.0;
  if (v2)
    return 208.0;
  return result;
}

+ (double)estimatedTimePickerHeight
{
  return 275.3;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)timerControlState
{
  return self->_timerControlState;
}

- (BOOL)isNewTimer
{
  return self->_isNewTimer;
}

- (void)setIsNewTimer:(BOOL)a3
{
  self->_isNewTimer = a3;
}

- (BOOL)edited
{
  return self->_edited;
}

- (void)setEdited:(BOOL)a3
{
  self->_edited = a3;
}

- (BOOL)stateNeedsReset
{
  return self->_stateNeedsReset;
}

- (void)setStateNeedsReset:(BOOL)a3
{
  self->_stateNeedsReset = a3;
}

- (MTALabelEditCell)editLabelCell
{
  return self->_editLabelCell;
}

- (void)setEditLabelCell:(id)a3
{
  objc_storeStrong((id *)&self->_editLabelCell, a3);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSMutableArray)tableRows
{
  return self->_tableRows;
}

- (void)setTableRows:(id)a3
{
  objc_storeStrong((id *)&self->_tableRows, a3);
}

- (NSMutableArray)layoutGuides
{
  return self->_layoutGuides;
}

- (void)setLayoutGuides:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuides, a3);
}

- (TimerControlsTarget)delegate
{
  return (TimerControlsTarget *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSLayoutConstraint)tableWidthConstraint
{
  return self->_tableWidthConstraint;
}

- (void)setTableWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tableWidthConstraint, a3);
}

- (NSLayoutConstraint)timerCountdownWidthConstraint
{
  return self->_timerCountdownWidthConstraint;
}

- (void)setTimerCountdownWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timerCountdownWidthConstraint, a3);
}

- (MTATimerCollectionControlButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_stopButton, a3);
}

- (MTATimerCollectionControlButton)pauseResumeButton
{
  return self->_pauseResumeButton;
}

- (void)setPauseResumeButton:(id)a3
{
  objc_storeStrong((id *)&self->_pauseResumeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseResumeButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_timerCountdownWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tableWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutGuides, 0);
  objc_storeStrong((id *)&self->_tableRows, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_editLabelCell, 0);
  objc_storeStrong((id *)&self->_buttonsController, 0);
  objc_storeStrong((id *)&self->_toneName, 0);
  objc_storeStrong((id *)&self->_toneChooserCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_pickerCell, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_expectedTimeView, 0);
  objc_storeStrong((id *)&self->_timerNameLabel, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
}

@end
