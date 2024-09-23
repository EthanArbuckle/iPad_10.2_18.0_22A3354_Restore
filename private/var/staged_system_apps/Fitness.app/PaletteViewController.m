@implementation PaletteViewController

- (PaletteViewController)initWithSizingDelegate:(id)a3 dateProvider:(id)a4
{
  return -[PaletteViewController initWithSizingDelegate:dateProvider:pauseRingsCoordinator:](self, "initWithSizingDelegate:dateProvider:pauseRingsCoordinator:", a3, a4, 0);
}

- (PaletteViewController)initWithSizingDelegate:(id)a3 dateProvider:(id)a4 pauseRingsCoordinator:(id)a5
{
  id v9;
  id v10;
  id v11;
  PaletteViewController *v12;
  PaletteViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PaletteViewController;
  v12 = -[PaletteViewController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sizingDelegate, a3);
    objc_storeStrong((id *)&v13->_dateProvider, a4);
    objc_storeStrong((id *)&v13->_pauseRingsCoordinator, a5);
    -[PaletteViewController _registerForNotifications](v13, "_registerForNotifications");
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  PaletteWeekdayHeaderView *v4;
  PaletteWeekdayHeaderView *paletteView;
  void *v6;
  PaletteScrollViewController *v7;
  PaletteScrollViewController *paletteScrollVC;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PaletteViewController;
  -[PaletteViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteViewController view](self, "view"));
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = objc_alloc_init(PaletteWeekdayHeaderView);
  paletteView = self->_paletteView;
  self->_paletteView = v4;

  -[PaletteWeekdayHeaderView setIsExpanded:](self->_paletteView, "setIsExpanded:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", self->_paletteView);

  v7 = -[PaletteScrollViewController initWithPauseRingsCoordinator:]([PaletteScrollViewController alloc], "initWithPauseRingsCoordinator:", self->_pauseRingsCoordinator);
  paletteScrollVC = self->_paletteScrollVC;
  self->_paletteScrollVC = v7;

  -[PaletteScrollViewController setDelegate:](self->_paletteScrollVC, "setDelegate:", self);
  -[PaletteViewController addChildViewController:](self, "addChildViewController:", self->_paletteScrollVC);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self->_paletteScrollVC, "view"));
  objc_msgSend(v9, "addSubview:", v10);

}

- (void)viewWillLayoutSubviews
{
  PaletteWeekdayHeaderView *paletteView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PaletteViewController;
  -[PaletteViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  paletteView = self->_paletteView;
  -[CHPaletteViewControllerSizingDelegate bounds](self->_sizingDelegate, "bounds");
  -[PaletteWeekdayHeaderView setFrame:](paletteView, "setFrame:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self->_paletteScrollVC, "view"));
  -[CHPaletteViewControllerSizingDelegate bounds](self->_sizingDelegate, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)setActivitySummaryProvider:(id)a3
{
  PaletteWeekdayHeaderView *paletteView;
  id v5;

  paletteView = self->_paletteView;
  v5 = a3;
  -[PaletteWeekdayHeaderView adjustWeekLabelsByOffset:](paletteView, "adjustWeekLabelsByOffset:", objc_msgSend(v5, "fitnessStartOfWeekOffset"));
  -[PaletteScrollViewController setActivitySummaryProvider:](self->_paletteScrollVC, "setActivitySummaryProvider:", v5);

}

- (void)setPauseRingsCoordinator:(id)a3
{
  -[PaletteScrollViewController setPauseRingsCoordinator:](self->_paletteScrollVC, "setPauseRingsCoordinator:", a3);
}

- (void)setIsUserInteractionEnabled:(BOOL)a3
{
  -[PaletteScrollViewController setIsUserInteractionEnabled:](self->_paletteScrollVC, "setIsUserInteractionEnabled:", a3);
}

- (void)_registerForNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "currentSelectedDateChanged:", CFSTR("FitnessCurrentSelectedDateChangedNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PaletteViewController;
  -[PaletteViewController dealloc](&v4, "dealloc");
}

- (void)currentSelectedDateChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  PaletteScrollViewController *paletteScrollVC;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
  v6 = objc_opt_class(self, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateProviding currentSelectedDate](self->_dateProvider, "currentSelectedDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
    v11 = objc_opt_class(MonthViewController, v10);
    v12 = objc_opt_isKindOfClass(v9, v11);

    paletteScrollVC = self->_paletteScrollVC;
    if ((v12 & 1) != 0)
      -[PaletteScrollViewController reloadViewDataAtDate:](paletteScrollVC, "reloadViewDataAtDate:", v8);
    else
      -[PaletteScrollViewController scrollOrRelayoutWeekIfNeededToDate:](paletteScrollVC, "scrollOrRelayoutWeekIfNeededToDate:", v8);
    -[PaletteWeekdayHeaderView highlightWeekdayLabelForDateAndSetDay:](self->_paletteView, "highlightWeekdayLabelForDateAndSetDay:", v8);

  }
}

- (void)setIsExpanded:(BOOL)a3 collapseDayMarkers:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  PaletteWeekdayHeaderView *paletteView;
  id v11;

  v4 = a4;
  v5 = a3;
  -[PaletteWeekdayHeaderView setIsExpanded:](self->_paletteView, "setIsExpanded:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteScrollViewController view](self->_paletteScrollVC, "view"));
  v8 = v7;
  v9 = 0.0;
  if (v5)
    v9 = 1.0;
  objc_msgSend(v7, "setAlpha:", v9);

  -[CHPaletteViewControllerSizingDelegate size](self->_sizingDelegate, "size");
  if (v5)
  {
    -[PaletteWeekdayHeaderView setAlpha:](self->_paletteView, "setAlpha:", 1.0);
    paletteView = self->_paletteView;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[ActivityDateProviding currentSelectedDate](self->_dateProvider, "currentSelectedDate"));
    -[PaletteWeekdayHeaderView highlightWeekdayLabelForDateAndSetDay:](paletteView, "highlightWeekdayLabelForDateAndSetDay:", v11);

  }
  else if (v4)
  {
    -[PaletteWeekdayHeaderView setAlpha:](self->_paletteView, "setAlpha:", 0.0);
  }
}

- (void)paletteScrolledInDirection:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;

  if (a3)
    v4 = -1;
  else
    v4 = 1;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDateProviding currentSelectedDate](self->_dateProvider, "currentSelectedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingUnit:value:toDate:options:", 0x2000, v4, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startOfDayForDate:", v7));

  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  if (v10 > v11)
  {
    v12 = v8;

    v6 = v12;
  }
  -[ActivityDateProviding setWithCurrentSelectedDate:caller:](self->_dateProvider, "setWithCurrentSelectedDate:caller:", v6, self);
  -[PaletteWeekdayHeaderView highlightWeekdayLabelForDateAndSetDay:](self->_paletteView, "highlightWeekdayLabelForDateAndSetDay:", v6);

}

- (void)paletteDateSelected:(id)a3
{
  _TtP10FitnessApp21ActivityDateProviding_ *dateProvider;
  id v5;

  dateProvider = self->_dateProvider;
  v5 = a3;
  -[ActivityDateProviding setWithCurrentSelectedDate:caller:](dateProvider, "setWithCurrentSelectedDate:caller:", v5, self);
  -[PaletteWeekdayHeaderView highlightWeekdayLabelForDateAndSetDay:](self->_paletteView, "highlightWeekdayLabelForDateAndSetDay:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_paletteScrollVC, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_sizingDelegate, 0);
}

@end
