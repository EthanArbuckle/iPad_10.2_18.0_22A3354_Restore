@implementation ListViewController

- (ListViewController)initWithModel:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ListViewController *v9;
  ListViewController *v10;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Non-nil 'model' required."), 0));
    objc_exception_throw(v12);
  }
  v8 = v7;
  v13.receiver = self;
  v13.super_class = (Class)ListViewController;
  v9 = -[MainViewController initWithWindow:model:](&v13, "initWithWindow:model:", v7, v6);
  v10 = v9;
  if (v9)
  {
    v9->_needsRefresh = 1;
    v9->_overrideExtendedEdges = 1;
  }

  return v10;
}

- (NSString)description
{
  id v3;
  NSString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc((Class)CalDescriptionBuilder);
  v10.receiver = self;
  v10.super_class = (Class)ListViewController;
  v4 = -[ListViewController description](&v10, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithSuperclassDescription:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v6, "setKey:withObject:", CFSTR("model"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "build"));
  return (NSString *)v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)ListViewController;
  -[MainViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EKCalendarDate *v10;
  EKCalendarDate *dateToShowWhenVisible;
  ListTableView *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  UITapGestureRecognizer *v26;
  UITapGestureRecognizer *multiSelectGestureRecognizer;
  void *v28;
  void *v29;
  DayNavigationViewController *v30;
  DayNavigationViewController *scrubberController;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ListViewController;
  -[ListViewController loadView](&v32, "loadView");
  v3 = (id)-[ListViewController overrideExtendedEdges](self, "overrideExtendedEdges");
  if ((_DWORD)v3)
    v3 = -[ListViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  if (!self->_dateToShowWhenVisible)
  {
    v5 = CUIKTodayDate(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
    v10 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v6, v9));
    dateToShowWhenVisible = self->_dateToShowWhenVisible;
    self->_dateToShowWhenVisible = v10;

  }
  v12 = -[ListTableView initWithFrame:style:]([ListTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[ListTableView setDelegate:](v12, "setDelegate:", self);
  -[ListTableView setDataSource:](v12, "setDataSource:", self);
  -[ListTableView _setMarginWidth:](v12, "_setMarginWidth:", 0.0);
  -[ListTableView setSectionHeaderHeight:](v12, "setSectionHeaderHeight:", UITableViewAutomaticDimension);
  -[ListTableView setRowHeight:](v12, "setRowHeight:", UITableViewAutomaticDimension);
  -[ListTableView setShowsHorizontalScrollIndicator:](v12, "setShowsHorizontalScrollIndicator:", 0);
  -[ListTableView setShowsVerticalScrollIndicator:](v12, "setShowsVerticalScrollIndicator:", 0);
  -[ListTableView setScrollsToTop:](v12, "setScrollsToTop:", 0);
  -[ListTableView setAllowsFocus:](v12, "setAllowsFocus:", 0);
  -[ListTableView setAllowsMultipleSelection:](v12, "setAllowsMultipleSelection:", 1);
  -[ListTableView registerClass:forHeaderFooterViewReuseIdentifier:](v12, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(EKUICalendarListViewHeader), CFSTR("ListViewSectionHeaderView"));
  v13 = objc_opt_class(EKUIListViewAllDayEventCell);
  v14 = (objc_class *)objc_opt_class(EKUIListViewAllDayEventCell);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[ListTableView registerClass:forCellReuseIdentifier:](v12, "registerClass:forCellReuseIdentifier:", v13, v16);

  v17 = objc_opt_class(EKUIListViewReminderCell);
  v18 = (objc_class *)objc_opt_class(EKUIListViewReminderCell);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[ListTableView registerClass:forCellReuseIdentifier:](v12, "registerClass:forCellReuseIdentifier:", v17, v20);

  v21 = objc_opt_class(EKUIListViewTimedEventCell);
  v22 = (objc_class *)objc_opt_class(EKUIListViewTimedEventCell);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[ListTableView registerClass:forCellReuseIdentifier:](v12, "registerClass:forCellReuseIdentifier:", v21, v24);

  if ((id)-[ListViewController destination](self, "destination") == (id)2)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    -[ListTableView setBackgroundColor:](v12, "setBackgroundColor:", v25);

  }
  -[ListViewController setTableView:](self, "setTableView:", v12);
  v26 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_multiSelect:");
  multiSelectGestureRecognizer = self->_multiSelectGestureRecognizer;
  self->_multiSelectGestureRecognizer = v26;

  -[UITapGestureRecognizer setAllowedTouchTypes:](self->_multiSelectGestureRecognizer, "setAllowedTouchTypes:", &off_1001BC718);
  -[UITapGestureRecognizer setDelegate:](self->_multiSelectGestureRecognizer, "setDelegate:", self);
  -[ListTableView addGestureRecognizer:](v12, "addGestureRecognizer:", self->_multiSelectGestureRecognizer);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController view](self, "view"));
  objc_msgSend(v28, "addSubview:", v12);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController cellFactory](self, "cellFactory"));
  if (v29)
  {
    v30 = -[DayNavigationViewController initWithModel:]([DayNavigationViewController alloc], "initWithModel:", self->super._model);
    scrubberController = self->_scrubberController;
    self->_scrubberController = v30;

    -[DayNavigationViewController setCellFactory:](self->_scrubberController, "setCellFactory:", v29);
    -[DayNavigationViewController setDelegate:](self->_scrubberController, "setDelegate:", self);
    -[ListViewController addChildViewController:](self, "addChildViewController:", self->_scrubberController);
    -[DayNavigationViewController didMoveToParentViewController:](self->_scrubberController, "didMoveToParentViewController:", self);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSDate *v10;
  NSDate *firstVisibleHeaderDate;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ListViewController;
  -[ListViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  -[ListViewController setUpViewConstraints](self, "setUpViewConstraints");
  self->_isVisible = 1;
  -[ListViewController _addAllObservers](self, "_addAllObservers");
  -[ListViewController refresh](self, "refresh");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleRows"));

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    v7 = objc_msgSend(v6, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    objc_msgSend(v8, "fetchCachedDaysInBackgroundStartingFromSection:usingFilter:", v7, -[ListViewController showFilteredData](self, "showFilteredData"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super._model, "selectedDay"));
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
  firstVisibleHeaderDate = self->_firstVisibleHeaderDate;
  self->_firstVisibleHeaderDate = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDay](self->super._model, "selectedDay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "date"));
  self->_cachedTopHeaderSection = (int64_t)objc_msgSend(v12, "sectionForCachedOccurrencesOnDate:usingFilter:", v14, -[ListViewController showFilteredData](self, "showFilteredData"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ListViewController;
  -[MainViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ListViewController_ViewDidAppearNotification"), self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v5, "startNotificationMonitor");

  -[CUIKCalendarModel simulateFirstLoadFinished](self->super._model, "simulateFirstLoadFinished");
  if (!-[ListViewController preventScrollingForNextViewAppear](self, "preventScrollingForNextViewAppear"))
    -[ListViewController scrollToSelectedDateAnimated:](self, "scrollToSelectedDateAnimated:", 0);
  -[ListViewController setPreventScrollingForNextViewAppear:](self, "setPreventScrollingForNextViewAppear:", 0);
}

- (void)setUpViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 3, 0, v9, 3, 1.0, 0.0));
    objc_msgSend(v6, "setActive:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 4, 0, v4, 4, 1.0, 0.0));
    objc_msgSend(v7, "setActive:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 7, 0, v4, 7, 1.0, 0.0));
    objc_msgSend(v8, "setActive:", 1);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  self->_isVisible = 0;
  self->_userIsScrolling = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  if (!-[ListViewController _selectedDateIsVisible](self, "_selectedDateIsVisible"))
    -[ListViewController _setTopVisibleDateAsSelectedDate](self, "_setTopVisibleDateAsSelectedDate");
  v6.receiver = self;
  v6.super_class = (Class)ListViewController;
  -[ListViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ListViewController;
  -[ListViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[ListViewController _deselectAllSelectedRowsAnimated:](self, "_deselectAllSelectedRowsAnimated:", 0);
}

- (void)setSelectedDateAndFirstVisibleHeaderDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSDate *v9;
  NSDate *firstVisibleHeaderDate;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "listViewController:didScrollToDate:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    objc_msgSend(v7, "listViewController:didScrollToDate:", self, v8);

  }
  else
  {
    -[CUIKCalendarModel setSelectedDate:](self->super._model, "setSelectedDate:", v4);
  }
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));

  firstVisibleHeaderDate = self->_firstVisibleHeaderDate;
  self->_firstVisibleHeaderDate = v9;

}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (id)cellFactory
{
  return 0;
}

- (void)updatePalette:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setTodayButtonVisible:", 0);
  objc_msgSend(v3, "setDateStringVisible:", 0);
  objc_msgSend(v3, "setWeekdayHeaderVisible:", 0);
  objc_msgSend(v3, "setDividerLineVisible:", 0);
  objc_msgSend(v3, "setDayScrubberController:", 0);
  objc_msgSend(v3, "setFocusBannerPlacement:", 1);

}

- (void)_updatePaletteWeekDayHeaderDayFrames
{
  double y;
  double x;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  int IsLeftToRight;
  void *v13;
  id v14;
  CGRect v15;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  v5 = -[ListViewController scrubberCellSize](self, "scrubberCellSize");
  v8 = v7;
  v10 = v9;
  v11 = 7;
  do
  {
    IsLeftToRight = CalTimeDirectionIsLeftToRight(v5, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, v8, v10));
    if (IsLeftToRight)
      objc_msgSend(v14, "addObject:", v13);
    else
      objc_msgSend(v14, "insertObject:atIndex:", v13, 0);

    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = v8;
    v15.size.height = v10;
    x = CGRectGetMaxX(v15);
    --v11;
  }
  while (v11);
  -[PaletteView setDayHeaderFrames:](self->_palette, "setDayHeaderFrames:", v14);

}

- (CGSize)scrubberCellSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController weekScrollView](self->_scrubberController, "weekScrollView"));
  objc_msgSend(v2, "cellSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  v8 = a4;
  v20 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController parentViewController](self, "parentViewController"));
  if (!objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___ListViewControllerDelegate))
    goto LABEL_6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController parentViewController](self, "parentViewController"));
  v13 = objc_opt_class(MainViewController);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController parentViewController](self, "parentViewController"));
  v15 = objc_msgSend(v14, "listViewControllerContainerHandlesShowEvent");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController parentViewController](self, "parentViewController"));
    objc_msgSend(v16, "showEvent:animated:showMode:context:", v20, v8, a5, v10);
    goto LABEL_14;
  }
LABEL_7:
  if (a5 == 3)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:](AddEventViewController, "editOrAddViewControllerForEventOrIntegrationWithEvent:model:creationMethod:eventEditViewDelegate:", v20, self->super._model, 0, self));
    v18 = v20;
    v16 = (void *)v17;
  }
  else
  {
    if (a5)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController augmentEventDetailsContext:](self, "augmentEventDetailsContext:", v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[EKEventViewController eventDetailViewControllerWithEvent:delegate:context:](EKEventViewController, "eventDetailViewControllerWithEvent:delegate:context:", v20, self, v19));
      objc_msgSend(v16, "ekui_adjustNavBarToTransparentStyle");

    }
    else
    {
      v16 = 0;
    }
    v18 = v20;
  }
  -[ListViewController _showEvent:viewController:animated:showComments:modal:](self, "_showEvent:viewController:animated:showComments:modal:", v18, v16, v8, a5 == 2, a5 == 3);
LABEL_14:

}

- (void)_showEvent:(id)a3 viewController:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6 modal:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startCalendarDate"));
  -[ListViewController setSelectedDateAndFirstVisibleHeaderDate:](self, "setSelectedDateAndFirstVisibleHeaderDate:", v14);

  -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", v12);
  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
  if (!v13)
  {
    -[ListViewController selectEvent:animated:](self, "selectEvent:animated:", v12, v9);
    goto LABEL_10;
  }
  if (!v8 || (v15 = objc_opt_class(EKEventViewController), (objc_opt_isKindOfClass(v13, v15) & 1) == 0))
  {
    v16 = 0;
    if (!v7)
      goto LABEL_5;
LABEL_7:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController navigationController](self, "navigationController"));
    objc_msgSend(v17, "presentViewController:animated:completion:", v13, v9, v16);

    goto LABEL_8;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000245AC;
  v18[3] = &unk_1001B2538;
  v19 = v13;
  v16 = objc_retainBlock(v18);

  if (v7)
    goto LABEL_7;
LABEL_5:
  -[ListViewController showViewController:sender:animated:completion:](self, "showViewController:sender:animated:completion:", v13, self, v9, v16);
LABEL_8:

LABEL_10:
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController parentViewController](self, "parentViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController backButtonTitleForEventDetails](self, "backButtonTitleForEventDetails"));
  objc_msgSend(v14, "setBackButtonTitle:", v15);

  v16.receiver = self;
  v16.super_class = (Class)ListViewController;
  -[MainViewController showViewController:sender:animated:completion:](&v16, "showViewController:sender:animated:completion:", v12, v11, v6, v10);

}

- (id)backButtonTitleForEventDetails
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super._model, "selectedDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dayComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
  v6 = CUIKStringForDateComponents(v4, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 0;
}

- (BOOL)isTodayVisible
{
  return 0;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id *p_dateToShowWhenVisible;
  id v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[ListViewController setSelectedDateAndFirstVisibleHeaderDate:](self, "setSelectedDateAndFirstVisibleHeaderDate:");
  -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
  -[ListViewController setNeedsRefresh:](self, "setNeedsRefresh:", 1);
  p_dateToShowWhenVisible = (id *)&self->_dateToShowWhenVisible;
  if (self->_isVisible)
  {
    v8 = *p_dateToShowWhenVisible;
    *p_dateToShowWhenVisible = 0;

    -[ListViewController scrollToSelectedDateAnimated:](self, "scrollToSelectedDateAnimated:", v4);
  }
  else
  {
    objc_storeStrong(p_dateToShowWhenVisible, a3);
  }
  -[ListViewController updateUIToTopHeaderDate](self, "updateUIToTopHeaderDate");

}

- (void)_selectTodayDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = CUIKTodayDate(self, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));

  v7 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithDate:timeZone:", v8, v6);
  -[ListViewController selectDate:animated:](self, "selectDate:animated:", v7, 0);

}

- (id)bestDateForNewEvent
{
  return -[CUIKCalendarModel selectedDate](self->super._model, "selectedDate");
}

- (BOOL)showEventDetailsWhenNewEventAdded
{
  return 0;
}

- (id)sceneTitle
{
  NSDate *v3;
  uint64_t v4;
  void *v5;

  v3 = self->_firstVisibleHeaderDate;
  if (v3
    || (v3 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ListViewController _dateForFirstVisibleRow](self, "_dateForFirstVisibleRow"))) != 0)
  {
    v4 = CUIKStringForDateWithCommaAndYear(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)toolbarVisibleInSplitBehavior:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)shouldAutoScrollToSelectedDateAfterFirstRefresh
{
  return 1;
}

- (BOOL)shouldPreserveDateAcrossRefresh
{
  return 1;
}

- (ListTableView)tableView
{
  return self->_tableView;
}

- (UITableView)tableViewForTesting
{
  return (UITableView *)self->_tableView;
}

- (void)refresh
{
  -[ListViewController setNeedsRefresh:](self, "setNeedsRefresh:", 1);
  -[ListViewController refreshIfNeeded](self, "refreshIfNeeded");
}

- (BOOL)_isVisible
{
  if (self->_isVisible)
    return -[ListViewController isViewLoaded](self, "isViewLoaded");
  else
    return 0;
}

- (void)refreshIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  uint64_t v11;
  EKCalendarDate *dateToShowWhenVisible;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (-[ListViewController _isVisible](self, "_isVisible"))
  {
    if (self->_needsRefresh)
    {
      -[ListViewController setNeedsRefresh:](self, "setNeedsRefresh:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedRows"));
      objc_msgSend(v3, "reloadData");
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            -[ListViewController _selectRowAtIndexPath:animated:scrollPosition:](self, "_selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 0, 0, (_QWORD)v14);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

      if (-[ListViewController shouldPreserveDateAcrossRefresh](self, "shouldPreserveDateAcrossRefresh")
        && !self->_preventScrollingForNextViewAppear)
      {
        -[ListViewController scrollToDate:animated:](self, "scrollToDate:animated:", self->_firstVisibleHeaderDate, 0);
      }
      v10 = objc_msgSend(v3, "numberOfSections", (_QWORD)v14);
      if (v3)
      {
        v11 = objc_opt_class(ListTableView);
        if ((objc_opt_isKindOfClass(v3, v11) & 1) != 0)
          -[ListViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
      }
      if (v10 && self->_dateToShowWhenVisible)
      {
        if (-[ListViewController shouldAutoScrollToSelectedDateAfterFirstRefresh](self, "shouldAutoScrollToSelectedDateAfterFirstRefresh"))
        {
          -[ListViewController setSelectedDateAndFirstVisibleHeaderDate:](self, "setSelectedDateAndFirstVisibleHeaderDate:", self->_dateToShowWhenVisible);
          dateToShowWhenVisible = self->_dateToShowWhenVisible;
          self->_dateToShowWhenVisible = 0;

          -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
          -[ListViewController scrollToSelectedDateAnimated:](self, "scrollToSelectedDateAnimated:", 0);
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("ListViewController_DidRefreshNotification"), self);

    }
  }
  else
  {
    -[ListViewController setNeedsRefresh:](self, "setNeedsRefresh:", 1);
  }
}

- (void)setNeedsRefresh:(BOOL)a3
{
  if (self->_needsRefresh != a3)
    self->_needsRefresh = a3;
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  v3 = objc_msgSend(v2, "numberOfSections") != 0;

  return v3;
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ListViewController hasContent](self, "hasContent"))
  {
    -[ListViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController contentUnavailableConfigurationForState:](self, "contentUnavailableConfigurationForState:", v5));
    -[ListViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v4);

  }
}

- (id)contentUnavailableConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedConfigurationForState:", v4));

  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("No Events"), &stru_1001B67C0, 0));
  objc_msgSend(v6, "setText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
  objc_msgSend(v11, "setColor:", v10);

  return v6;
}

- (BOOL)_selectedDateIsVisible
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  BOOL v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleRows"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v17 = v4;
      v18 = v3;
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateForCachedOccurrencesInSection:usingFilter:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "section", v17, v18, (_QWORD)v19), -[ListViewController showFilteredData](self, "showFilteredData")));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedDay"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "date"));
          v14 = objc_msgSend(v11, "isEqualToDate:", v13);

          if ((v14 & 1) != 0)
          {
            v15 = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          continue;
        break;
      }
      v15 = 0;
LABEL_12:
      v4 = v17;
      v3 = v18;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_dateForFirstVisibleRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleRows"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:](self->super._model, "dateForCachedOccurrencesInSection:usingFilter:", objc_msgSend(v5, "section"), -[ListViewController showFilteredData](self, "showFilteredData")));
    v7 = objc_opt_class(NSDate);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    {

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)scrollToSelectedDateAnimated:(BOOL)a3
{
  -[ListViewController scrollToDate:animated:](self, "scrollToDate:animated:", self->_firstVisibleHeaderDate, a3);
}

- (void)scrollToTodayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  v5 = CUIKTodayDate(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[ListViewController scrollToDate:animated:](self, "scrollToDate:animated:", v6, v3);

}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  char *v13;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v31 = v6;
    if (-[ListViewController _isVisible](self, "_isVisible"))
    {
      v7 = (uint64_t)-[CUIKCalendarModel numberOfDaysWithCachedOccurrencesUsingFilter:](self->super._model, "numberOfDaysWithCachedOccurrencesUsingFilter:", -[ListViewController showFilteredData](self, "showFilteredData"));
      if (v7 >= 1)
      {
        v9 = CUIKTodayDate(v7, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (char *)-[CUIKCalendarModel sectionForCachedOccurrencesOnDate:usingFilter:](self->super._model, "sectionForCachedOccurrencesOnDate:usingFilter:", v10, -[ListViewController showFilteredData](self, "showFilteredData"));
        v12 = -[CUIKCalendarModel numberOfCachedOccurrencesInSection:usingFilter:](self->super._model, "numberOfCachedOccurrencesInSection:usingFilter:", v11, -[ListViewController showFilteredData](self, "showFilteredData"));
        v13 = (char *)-[CUIKCalendarModel sectionForCachedOccurrencesOnDate:usingFilter:](self->super._model, "sectionForCachedOccurrencesOnDate:usingFilter:", v31, -[ListViewController showFilteredData](self, "showFilteredData"));
        if (!v12 && (v13 == v11 || v13 - 1 == v11))
        {
          v15 = v10;

          v31 = v15;
        }
        v16 = objc_claimAutoreleasedReturnValue(-[ListViewController _dateForFirstVisibleRow](self, "_dateForFirstVisibleRow"));
        if (v16)
        {
          v17 = (void *)v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "calendar"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _dateForFirstVisibleRow](self, "_dateForFirstVisibleRow"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "components:fromDate:toDate:options:", 16, v20, v31, 0));
          v22 = (uint64_t)objc_msgSend(v21, "day");

          if (v22 >= 0)
            v23 = v22;
          else
            v23 = -v22;

          if (v23 < 7)
            v4 = v4;
          else
            v4 = 0;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _indexPathForDate:](self, "_indexPathForDate:", v31));
        objc_msgSend(v24, "scrollToRowAtIndexPath:atScrollPosition:animated:", v25, 1, v4);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _indexPathForDate:](self, "_indexPathForDate:", v31));
        v27 = objc_msgSend(v26, "section");
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
        v29 = objc_msgSend(v28, "numberOfSections");

        if ((uint64_t)v27 <= (uint64_t)v29)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
          objc_msgSend(v30, "scrollToRowAtIndexPath:atScrollPosition:animated:", v26, 1, v4);

        }
      }
    }
    v6 = v31;
  }

}

- (id)_indexPathForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[CUIKCalendarModel numberOfDaysWithCachedOccurrencesUsingFilter:](self->super._model, "numberOfDaysWithCachedOccurrencesUsingFilter:", -[ListViewController showFilteredData](self, "showFilteredData")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](self->super._model, "eventStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateForDayInTimeZone:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, -[CUIKCalendarModel sectionForCachedOccurrencesOnDate:usingFilter:](self->super._model, "sectionForCachedOccurrencesOnDate:usingFilter:", v7, -[ListViewController showFilteredData](self, "showFilteredData"))));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0));
  }

  return v8;
}

- (BOOL)shouldUpdateModelSelectedDate
{
  return 1;
}

- (void)_setTopVisibleDateAsSelectedDate
{
  void *v3;
  void *v4;
  void *v5;
  NSComparisonResult v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate *v10;

  if (-[ListViewController shouldUpdateModelSelectedDate](self, "shouldUpdateModelSelectedDate"))
  {
    v10 = self->_firstVisibleHeaderDate;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    if (v10)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedDate"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
      v6 = -[NSDate compare:](v10, "compare:", v5);

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendar"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v10, v8));
        -[ListViewController setSelectedDateAndFirstVisibleHeaderDate:](self, "setSelectedDateAndFirstVisibleHeaderDate:", v9);

      }
    }

  }
}

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController navigationController](self, "navigationController"));
  if ((objc_opt_respondsToSelector(v4, "updateBackButtonToDate:") & 1) != 0)
    objc_msgSend(v4, "updateBackButtonToDate:", v5);

}

- (double)contentInset
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  objc_msgSend(v2, "contentInset");
  v4 = v3;

  return v4;
}

- (BOOL)_processScrollingMessagesOnEveryFrameFromListViewController
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "wantsScrollingMessagesOnEveryFrameFromListViewController:") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController delegate](self, "delegate"));
    v5 = objc_msgSend(v4, "wantsScrollingMessagesOnEveryFrameFromListViewController:", self);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)defaultEventForSelectedDate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _dateForFirstVisibleRow](self, "_dateForFirstVisibleRow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _indexPathForDate:](self, "_indexPathForDate:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(v4, "section")));

  if (objc_msgSend(v5, "section") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));

    v5 = (void *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", v5));

  return v7;
}

- (void)selectEvent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel indexPathsForOccurrence:usingFilter:](self->super._model, "indexPathsForOccurrence:usingFilter:", v6, -[ListViewController showFilteredData](self, "showFilteredData")));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[ListViewController _selectRowAtIndexPath:animated:scrollPosition:](self, "_selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), v4, 0);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((uint64_t)objc_msgSend(v5, "row") >= 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v5, "row") - 1, objc_msgSend(v5, "section")));
    -[ListViewController _updateSeparatorVisibilityForRowAtIndexPath:](self, "_updateSeparatorVisibilityForRowAtIndexPath:", v4);

  }
  -[ListViewController _updateSeparatorVisibilityForRowAtIndexPath:](self, "_updateSeparatorVisibilityForRowAtIndexPath:", v5);

}

- (void)_addAllObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_eventStoreChanged:", CUIKCalendarModelCachedOccurrencesChangedNotification, self->super._model);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_timeChangedSignificantly:", CUIKCalendarModelSignificantTimeChangeNotification, self->super._model);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_localeChanged:", CUIKLocaleChangedNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_weekNumberChanged:", CUIKPreferencesNotification_ShowWeekNumbers, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_selectedOccurrencesChanged:", CUIKCalendarModelSelectedOccurrencesChangedNotification, self->super._model);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_contentCategorySizeChangedNotification:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_timeChangedSignificantly:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CUIKCalendarModelSignificantTimeChangeNotificationDayChangedKey));

  v5 = objc_msgSend(v8, "BOOLValue");
  v6 = v8;
  if ((v5 & 1) != 0 || !v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    objc_msgSend(v7, "reloadData");

    v6 = v8;
  }

}

- (void)_localeChanged:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

}

- (void)_weekNumberChanged:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

}

- (void)_selectedOccurrencesChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedOccurrences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ListTableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cachedOccurrenceAtIndexPath:", v12));

        if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
          -[ListViewController _deselectRowAtIndexPath:animated:](self, "_deselectRowAtIndexPath:animated:", v12, 1);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "indexPathsForOccurrence:usingFilter:", v20, -[ListViewController showFilteredData](self, "showFilteredData")));

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v29;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v29 != v26)
                objc_enumerationMutation(v23);
              -[ListViewController _selectRowAtIndexPath:animated:scrollPosition:](self, "_selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v27), 1, 0);
              v27 = (char *)v27 + 1;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          }
          while (v25);
        }

        v19 = (char *)v19 + 1;
      }
      while (v19 != v17);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v17);
  }

}

- (void)_contentCategorySizeChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ListViewController _dateForFirstVisibleRow](self, "_dateForFirstVisibleRow", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  v5 = v6;
  if (v6)
  {
    -[ListViewController scrollToDate:animated:](self, "scrollToDate:animated:", v6, 0);
    v5 = v6;
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSIndexPath *swipedRow;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = objc_msgSend(v5, "numberOfDaysWithCachedOccurrencesUsingFilter:", -[ListViewController showFilteredData](self, "showFilteredData"));

  swipedRow = self->_swipedRow;
  if (swipedRow)
    v6 = (id)((__PAIR128__((unint64_t)v6, -[ListViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v4, -[NSIndexPath section](swipedRow, "section")))- 1) >> 64);

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  id v7;
  NSIndexPath *swipedRow;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v7 = objc_msgSend(v6, "numberOfCachedOccurrencesInSection:usingFilter:", a4, -[ListViewController showFilteredData](self, "showFilteredData"));

  swipedRow = self->_swipedRow;
  if (swipedRow)
    return (int64_t)v7 - (-[NSIndexPath section](swipedRow, "section") == a4);
  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int IsLeftToRight;
  id v40;
  double v41;
  double v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  uint64_t v49;
  void *v50;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cachedOccurrenceAtIndexPath:usingFilter:", v7, -[ListViewController showFilteredData](self, "showFilteredData")));

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:](self->super._model, "dateForCachedOccurrencesInSection:usingFilter:", objc_msgSend(v7, "section"), -[ListViewController showFilteredData](self, "showFilteredData")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
  v11 = CUIKNowDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = CUIKCalendar();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if ((objc_msgSend(v10, "isBeforeDate:", v12) & 1) != 0)
    v15 = 1;
  else
    v15 = (uint64_t)objc_msgSend(v50, "isBeforeDayForDate:inCalendar:", v12, v14);
  if (objc_msgSend(v9, "isReminderIntegrationEvent"))
  {
    v16 = (objc_class *)objc_opt_class(EKUIListViewReminderCell);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v18, v7));

    objc_msgSend(v19, "setDelegate:", self);
LABEL_8:
    objc_msgSend(v19, "updateWithEvent:dimmed:", v9, v15);
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isAllDay"))
  {
    v20 = (objc_class *)objc_opt_class(EKUIListViewAllDayEventCell);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v22, v7));

    goto LABEL_8;
  }
  v23 = (objc_class *)objc_opt_class(EKUIListViewTimedEventCell);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v25, v7));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  HIDWORD(v49) = v15;
  v27 = v12;
  v28 = v10;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDateUnadjustedForLegacyClients"));
  LODWORD(v49) = objc_msgSend(v14, "cal_isMultidayEventForUIWithStartDate:endDate:", v26, v29);

  v10 = v28;
  v12 = v27;

  objc_msgSend(v19, "updateWithEvent:isMultiday:occurrenceStartDate:dimmed:", v9, v49, v50, HIDWORD(v49));
LABEL_10:
  v30 = objc_msgSend((id)objc_opt_class(v19), "adjustedSeparatorInsets");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  IsLeftToRight = CalInterfaceIsLeftToRight(v30);
  v40 = objc_msgSend(v6, "safeAreaInsets");
  if (IsLeftToRight)
    v43 = v41;
  else
    v43 = v42;
  v44 = CalInterfaceIsLeftToRight(v40);
  objc_msgSend(v6, "safeAreaInsets");
  if (v44)
    v47 = v46;
  else
    v47 = v45;
  objc_msgSend(v19, "setSeparatorInset:", v32, v34 + v43, v36, v38 + v47, v49);
  objc_msgSend(v19, "setDrawsOwnRowSeparators:", 1);
  -[ListViewController _updateSeparatorVisibilityForOccurrenceCell:atIndexPath:](self, "_updateSeparatorVisibilityForOccurrenceCell:atIndexPath:", v19, v7);

  return v19;
}

- (void)_updateSeparatorVisibilityForRowAtIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListTableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:"));
  v5 = objc_opt_class(EKUITableViewCell);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    -[ListViewController _updateSeparatorVisibilityForOccurrenceCell:atIndexPath:](self, "_updateSeparatorVisibilityForOccurrenceCell:atIndexPath:", v4, v6);

}

- (void)_updateSeparatorVisibilityForOccurrenceCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = (char *)objc_msgSend(v7, "numberOfCachedOccurrencesInSection:usingFilter:", objc_msgSend(v12, "section"), -[ListViewController showFilteredData](self, "showFilteredData"));

  if ((uint64_t)objc_msgSend(v12, "row") >= (uint64_t)(v8 - 1)
    || -[ListViewController _rowDrawsBackground:](self, "_rowDrawsBackground:", v12))
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v12, "row") + 1, objc_msgSend(v12, "section")));
    v11 = -[ListViewController _rowDrawsBackground:](self, "_rowDrawsBackground:", v10);

    if (v11)
      v9 = 0;
    else
      v9 = 4;
  }
  objc_msgSend(v6, "setSeparatorEdges:", v9 | (objc_msgSend(v12, "row") == 0));

}

- (BOOL)_rowDrawsBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListTableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows"));
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cachedOccurrenceAtIndexPath:usingFilter:", v4, -[ListViewController showFilteredData](self, "showFilteredData")));

    v7 = +[EKUIListViewCell drawsBackgroundForEvent:](EKUIListViewCell, "drawsBackgroundForEvent:", v9);
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateForCachedOccurrencesInSection:usingFilter:", a4, -[ListViewController showFilteredData](self, "showFilteredData")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("ListViewSectionHeaderView")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
  objc_msgSend(v9, "configureWithDate:timeZone:", v8, v12);

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  if (self->_userIsScrolling)
  {
    if (self->_cachedTopHeaderSection > a5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:](self->super._model, "dateForCachedOccurrencesInSection:usingFilter:", a5, -[ListViewController showFilteredData](self, "showFilteredData")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v9, v11));

      -[ListViewController setSelectedDateAndFirstVisibleHeaderDate:](self, "setSelectedDateAndFirstVisibleHeaderDate:", v12);
      -[ListViewController updateUIToTopHeaderDate](self, "updateUIToTopHeaderDate");

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathsForVisibleRows"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    if ((uint64_t)objc_msgSend(v15, "section") >= a5)
      self->_cachedTopHeaderSection = a5;

  }
}

- (void)tableView:(id)a3 didEndDisplayingHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  id cachedTopHeaderSection;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_userIsScrolling && self->_cachedTopHeaderSection >= a5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView", a3, a4));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForVisibleRows"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    v8 = v7;
    if (v7)
      cachedTopHeaderSection = objc_msgSend(v7, "section");
    else
      cachedTopHeaderSection = (id)self->_cachedTopHeaderSection;
    self->_cachedTopHeaderSection = (int64_t)cachedTopHeaderSection;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:](self->super._model, "dateForCachedOccurrencesInSection:usingFilter:", cachedTopHeaderSection, -[ListViewController showFilteredData](self, "showFilteredData")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v10, v12));

    -[ListViewController setSelectedDateAndFirstVisibleHeaderDate:](self, "setSelectedDateAndFirstVisibleHeaderDate:", v13);
    -[ListViewController updateUIToTopHeaderDate](self, "updateUIToTopHeaderDate");

  }
}

- (void)updateUIToTopHeaderDate
{
  void *v3;
  id v4;

  if (!-[ListViewController _processScrollingMessagesOnEveryFrameFromListViewController](self, "_processScrollingMessagesOnEveryFrameFromListViewController"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super._model, "selectedDate"));
    -[ListViewController _updateBackButtonOnBackViewControllerToDate:](self, "_updateBackButtonOnBackViewControllerToDate:", v3);

    -[MainViewController setSceneTitleNeedsUpdate](self, "setSceneTitleNeedsUpdate");
  }
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PaletteView dayScrubberController](self->_palette, "dayScrubberController"));
  objc_msgSend(v4, "setSelectedDate:animated:", self->_firstVisibleHeaderDate, 1);

}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController presentedViewController](self, "presentedViewController"));

  if (!v5)
  {
    -[ListViewController setPreventScrollingForNextViewAppear:](self, "setPreventScrollingForNextViewAppear:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cachedOccurrenceAtIndexPath:usingFilter:", v8, -[ListViewController showFilteredData](self, "showFilteredData")));

    -[ListViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v7, 1, 1, 0);
  }
  -[ListViewController updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:](self, "updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:", v8);

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[ListViewController showFilteredData](self, "showFilteredData"))
  {
    -[ListViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v9, v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cachedOccurrenceAtIndexPath:usingFilter:", v6, -[ListViewController showFilteredData](self, "showFilteredData")));

    -[CUIKCalendarModel deselectOccurrence:](self->super._model, "deselectOccurrence:", v8);
    -[ListViewController updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:](self, "updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:", v6);

  }
}

- (void)_deselectRowAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  ListTableView *tableView;
  id v7;

  v4 = a4;
  tableView = self->_tableView;
  v7 = a3;
  -[ListTableView deselectRowAtIndexPath:animated:](tableView, "deselectRowAtIndexPath:animated:", v7, v4);
  -[ListViewController updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:](self, "updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:", v7);

}

- (void)_selectRowAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(int64_t)a5
{
  _BOOL8 v6;
  ListTableView *tableView;
  id v9;

  v6 = a4;
  tableView = self->_tableView;
  v9 = a3;
  -[ListTableView selectRowAtIndexPath:animated:scrollPosition:](tableView, "selectRowAtIndexPath:animated:scrollPosition:", v9, v6, a5);
  -[ListViewController updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:](self, "updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:", v9);

}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "popViewControllersAfterAndIncluding:animated:", v5, !self->_editorDismissedFromDelete);

  self->_editorDismissedFromDelete = 0;
}

- (void)eventViewControllerWillDisappear:(id)a3
{
  -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", 0);
}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[ListViewController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void ***v8;
  void **v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  ListViewController *v13;
  id v14;

  v6 = a5;
  v7 = v6;
  if (v6)
  {
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100026BE0;
    v12 = &unk_1001B2600;
    v13 = self;
    v14 = v6;
    v8 = objc_retainBlock(&v9);

  }
  else
  {
    v8 = 0;
  }
  -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", 0, v9, v10, v11, v12);
  -[ListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (id)calendarModel
{
  return self->super._model;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_userIsScrolling = 1;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    self->_userIsScrolling = 0;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_userIsScrolling = 0;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController presentedViewController](self, "presentedViewController")),
        v10 = objc_msgSend(v9, "isBeingDismissed"),
        v9,
        (v10 & 1) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", v8));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
      v14 = objc_msgSend(v13, "containsObject:", v12);

      if ((v14 & 1) == 0)
      {
        v20 = v12;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
        -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", v15);

      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100026DFC;
      v18[3] = &unk_1001B2628;
      v19 = v12;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100026E2C;
      v17[3] = &unk_1001B2678;
      v17[4] = self;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v8, v18, v17));

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v16;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v16 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

  if (v8)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v11)
    {
      v12 = objc_alloc((Class)UITargetedPreview);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
      v14 = objc_alloc_init((Class)UIPreviewParameters);
      v11 = objc_msgSend(v12, "initWithView:parameters:", v13, v14);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  v8 = objc_opt_class(EKUIReadonlyEventViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewViewController"));
  else
    v9 = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "event"));
  objc_msgSend(v9, "willCommitPreview");
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002719C;
    v11[3] = &unk_1001B26A0;
    v11[4] = self;
    v12 = v10;
    objc_msgSend(v6, "addAnimations:", v11);

  }
}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences", a3, a4, a5));
  v7 = objc_msgSend(v6, "count");

  if (v7 == (id)1)
    -[CUIKCalendarModel setSelectedOccurrences:](self->super._model, "setSelectedOccurrences:", &__NSArray0__struct);
}

- (id)_eventForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cachedOccurrenceAtIndexPath:usingFilter:", v4, -[ListViewController showFilteredData](self, "showFilteredData")));

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSIndexPath *swipedRow;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v11 = objc_msgSend(v10, "swipeToDeleteEnabled");

  if (a4 == 1 && v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100027400;
    v13[3] = &unk_1001B26C8;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    -[ListViewController _deleteEventAtIndexPath:withCompletionHandler:](self, "_deleteEventAtIndexPath:withCompletionHandler:", v14, v13);

  }
  else
  {
    swipedRow = self->_swipedRow;
    self->_swipedRow = 0;

  }
}

- (void)_clearSwipedRow
{
  NSIndexPath *swipedRow;

  swipedRow = self->_swipedRow;
  self->_swipedRow = 0;

}

- (void)_deleteEventAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  EKUIRecurrenceAlertController *v13;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", a3));
  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1001B67C0, 0));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000276B4;
  v15[3] = &unk_1001B26F0;
  v15[4] = self;
  v16 = v7;
  v17 = v6;
  v11 = v6;
  v12 = v7;
  v13 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue(+[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:barButtonItem:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:barButtonItem:forEvent:stringForDeleteButton:withCompletionHandler:", 0, self, 0, v12, v10, v15));
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v13;

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  int64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  if (!objc_msgSend(v5, "swipeToDeleteEnabled"))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v4, "isEditable");

  if ((v6 & 1) == 0)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = 1;
LABEL_6:

  return v7;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  BOOL v20;
  void *v21;
  int64_t v23;
  int64_t v24;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextOccurrence"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
      v10 = -[ListViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController tableView](self, "tableView"));
      v12 = -[ListViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v11, --v10);

      v23 = v10;
      v24 = v12 - 1;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", &v23, 2));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cachedOccurrenceAtIndexPath:usingFilter:", v13, -[ListViewController showFilteredData](self, "showFilteredData")));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
      v18 = objc_msgSend(v16, "isBeforeDate:", v17);
LABEL_8:
      v20 = v18;

      goto LABEL_9;
    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousOccurrence"));
    v8 = v19;
    if (v19 && objc_msgSend(v19, "reminderOccurrenceType") != (id)1)
    {
      v23 = 0;
      v24 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", &v23, 2));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cachedOccurrenceAtIndexPath:usingFilter:", v13, -[ListViewController showFilteredData](self, "showFilteredData")));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
      v18 = objc_msgSend(v16, "isAfterDate:", v17);
      goto LABEL_8;
    }
  }
  v20 = 0;
LABEL_9:

  return v20;
}

- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v10 = v6;
  if (v4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextOccurrence"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousOccurrence"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startCalendarDate"));
    -[ListViewController selectDate:animated:](self, "selectDate:animated:", v9, 1);

    -[ListViewController selectEvent:animated:](self, "selectEvent:animated:", v8, 1);
  }

}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 1;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextOccurrence"));

  if (v5)
  {
    -[ListViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
    -[ListViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v6);

  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previousOccurrence"));

  if (v5)
  {
    -[ListViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
    -[ListViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v5, 1, 1, v6);

  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ListViewController eventViewController:didCompleteWithAction:](self, "eventViewController:didCompleteWithAction:", v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));

  -[ListViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", v6, 1, 1, v8);
}

- (id)pasteboardManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pasteboardManager"));

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  BOOL v6;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  v6 = self->_multiSelectGestureRecognizer != v4
    || ((unint64_t)-[UITapGestureRecognizer modifierFlags](v4, "modifierFlags") & 0x120000) != 0;

  return v6;
}

- (void)_multiSelect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "locationInView:", self->_tableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListTableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:"));
  if (v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListTableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cachedOccurrenceAtIndexPath:usingFilter:", v8, -[ListViewController showFilteredData](self, "showFilteredData")));

    if (objc_msgSend(v5, "containsObject:", v8))
    {
      -[ListViewController _deselectRowAtIndexPath:animated:](self, "_deselectRowAtIndexPath:animated:", v8, 1);
      -[CUIKCalendarModel deselectOccurrence:](self->super._model, "deselectOccurrence:", v7);
    }
    else
    {
      -[ListViewController _selectRowAtIndexPath:animated:scrollPosition:](self, "_selectRowAtIndexPath:animated:scrollPosition:", v8, 1, 0);
      -[CUIKCalendarModel selectOccurrence:](self->super._model, "selectOccurrence:", v7);
    }

    v4 = v8;
  }

}

- (void)_deselectAllSelectedRowsAnimated:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ListTableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows", a3));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[ListViewController _deselectRowAtIndexPath:animated:](self, "_deselectRowAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), 1);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v6 = a4;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:withSender:](CUIKPasteboardUtilities, "declinesToPerformCutCopyPasteAction:withSender:", a3, v6) & 1) == 0)
  {
    if ("paste:" == a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
      v7 = objc_msgSend(v8, "canPerformPaste");

      goto LABEL_11;
    }
    if ("copy:" == a3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
      v10 = 1;
    }
    else
    {
      if ("cut:" != a3)
      {
        v12.receiver = self;
        v12.super_class = (Class)ListViewController;
        v7 = -[ListViewController canPerformAction:withSender:](&v12, "canPerformAction:withSender:", a3, v6);
        goto LABEL_11;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences"));
      v10 = 0;
    }
    v7 = +[CUIKPasteboardUtilities allEventsValidForAction:fromEvents:](CUIKPasteboardUtilities, "allEventsValidForAction:fromEvents:", v10, v9);

    goto LABEL_11;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)cut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences", a3));
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    objc_msgSend(v4, "cutEvents:delegate:", v5, self);

  }
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super._model, "selectedOccurrences", a3));
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    objc_msgSend(v4, "copyEvents:delegate:", v5, self);

  }
}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->super._model, "selectedOccurrence", a3));
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v4, "setDateForPaste:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel pasteboardManager](self->super._model, "pasteboardManager"));
  objc_msgSend(v6, "pasteEventsWithDateMode:delegate:", 0, self);

}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  objc_msgSend(a4, "presentFromSource:", self);
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  -[ListViewController showEvent:animated:showMode:context:](self, "showEvent:animated:showMode:context:", a4, 1, 3, 0);
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5)
    -[MainViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt", a3);
}

- (void)eventIconButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "event"));
  objc_msgSend(v4, "setCompleted:", objc_msgSend(v4, "completed") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ListViewController EKUI_editor](self, "EKUI_editor"));
  v9 = 0;
  v6 = objc_msgSend(v5, "saveEvent:span:error:", v4, 0, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
    }
  }

}

- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4
{
  -[ListViewController scrollToDate:animated:](self, "scrollToDate:animated:", a4, 1);
}

- (BOOL)allowExtendedHeightCells
{
  return self->_allowExtendedHeightCells;
}

- (void)setAllowExtendedHeightCells:(BOOL)a3
{
  self->_allowExtendedHeightCells = a3;
}

- (BOOL)preventScrollingForNextViewAppear
{
  return self->_preventScrollingForNextViewAppear;
}

- (void)setPreventScrollingForNextViewAppear:(BOOL)a3
{
  self->_preventScrollingForNextViewAppear = a3;
}

- (BOOL)overrideExtendedEdges
{
  return self->_overrideExtendedEdges;
}

- (void)setOverrideExtendedEdges:(BOOL)a3
{
  self->_overrideExtendedEdges = a3;
}

- (ListViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (EKEvent)currentSelectedEvent
{
  return self->_currentSelectedEvent;
}

- (void)setCurrentSelectedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelectedEvent, a3);
}

- (BOOL)showFilteredData
{
  return self->_showFilteredData;
}

- (void)setShowFilteredData:(BOOL)a3
{
  self->_showFilteredData = a3;
}

- (BOOL)showScrubber
{
  return self->_showScrubber;
}

- (void)setShowScrubber:(BOOL)a3
{
  self->_showScrubber = a3;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentSelectedEvent, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_multiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dateToShowWhenVisible, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_swipedRow, 0);
  objc_storeStrong((id *)&self->_firstVisibleHeaderDate, 0);
  objc_storeStrong((id *)&self->_scrubberController, 0);
  objc_storeStrong((id *)&self->_palette, 0);
}

@end
