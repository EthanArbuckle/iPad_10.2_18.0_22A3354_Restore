@implementation DayNavigationViewController

- (DayNavigationViewController)initWithModel:(id)a3
{
  id v5;
  DayNavigationViewController *v6;
  DayNavigationViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DayNavigationViewController;
  v6 = -[DayNavigationViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (void)dayNavigationView:(id)a3 didChangeCellWidth:(double)a4
{
  void *v6;
  char v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate", a3));
  v7 = objc_opt_respondsToSelector(v6, "dayNavigationViewController:didChangeCellWidth:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate"));
    objc_msgSend(v8, "dayNavigationViewController:didChangeCellWidth:", self, a4);

  }
}

- (DayNavigationViewControllerDelegate)delegate
{
  return (DayNavigationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)loadView
{
  void *v3;
  void *v4;
  DayNavigationView *v5;
  void *v6;
  DayNavigationView *v7;
  DayNavigationView *navigationView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->_model, "selectedDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));

  v5 = [DayNavigationView alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController cellFactory](self, "cellFactory"));
  v7 = -[DayNavigationView initWithCalendar:selectedDate:cellFactory:eventSpringLoadingEnabled:](v5, "initWithCalendar:selectedDate:cellFactory:eventSpringLoadingEnabled:", v14, v4, v6, self->_eventSpringLoadingEnabled);
  navigationView = self->_navigationView;
  self->_navigationView = v7;

  -[DayNavigationView setDelegate:](self->_navigationView, "setDelegate:", self);
  -[DayNavigationViewController setView:](self, "setView:", self->_navigationView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView weekScrollView](self->_navigationView, "weekScrollView"));
  objc_msgSend(v9, "updateDayBadges");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "_timeZoneChanged:", CUIKCalendarModelTimeZoneChangedNotification, self->_model);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "_localeChanged:", CUIKLocaleChangedNotification, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_contentSizeCategoryChanged", UIContentSizeCategoryDidChangeNotification, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_cachedOccurrencesChanged:", CUIKCalendarModelCachedOccurrencesChangedNotification, self->_model);

}

- (DayNavigationWeekScrollView)weekScrollView
{
  return -[DayNavigationView weekScrollView](self->_navigationView, "weekScrollView");
}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
  -[DayNavigationView setSelectedDate:animated:](self->_navigationView, "setSelectedDate:animated:", a3, a4);
}

- (id)dayNavigationView:(id)a3 dayDataForDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  char v12;

  v5 = a4;
  if (!_os_feature_enabled_impl("MobileCal", "mark_holidays"))
    goto LABEL_9;
  if (!-[CUIKCalendarModel cachedOccurrencesAreLoaded](self->_model, "cachedOccurrencesAreLoaded"))
  {
    if (!self->_loadingOccurrenceCache)
    {
      self->_loadingOccurrenceCache = 1;
      if (qword_1001F6538 != -1)
        dispatch_once(&qword_1001F6538, &stru_1001B54A0);
      v8 = qword_1001F6530;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001C9F0;
      block[3] = &unk_1001B26A0;
      block[4] = self;
      v11 = v5;
      dispatch_async(v8, block);

    }
    goto LABEL_9;
  }
  v12 = 0;
  v6 = -[CUIKCalendarModel sectionForCachedOccurrencesOnDate:sectionExistsForDay:](self->_model, "sectionForCachedOccurrencesOnDate:sectionExistsForDay:", v5, &v12);
  if (!v12)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel cachedSpecialDayDataForSection:](self->_model, "cachedSpecialDayDataForSection:", v6));
LABEL_10:

  return v7;
}

- (BOOL)dayNavigationViewIsLoadingSpecialDayData:(id)a3
{
  return self->_loadingOccurrenceCache;
}

- (void)setPaletteSafeAreaInsets:(UIEdgeInsets)a3
{
  -[DayNavigationView setPaletteSafeAreaInsets:](self->_navigationView, "setPaletteSafeAreaInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCellFactory:(id)a3
{
  objc_storeStrong((id *)&self->_cellFactory, a3);
}

- (DayNavigationViewCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  -[DayNavigationView willTransitionToSize](self->_navigationView, "willTransitionToSize", a4, a3.width, a3.height);
}

- (void)dayNavigationView:(id)a3 selectedDateChanged:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate"));
    objc_msgSend(v6, "dayNavigationViewController:didSelectDate:", self, v7);

  }
}

- (void)dayNavigationViewFailedToSelectDate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "dayNavigationViewControllerFailedToChangeDate:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate"));
    objc_msgSend(v6, "dayNavigationViewControllerFailedToChangeDate:", v7);

  }
}

- (BOOL)dayNavigationViewAllowedToChangeSelectedDate
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "dayNavigationViewControllerAllowedToChangeSelectedDate");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "dayNavigationViewControllerAllowedToChangeSelectedDate");

  return v6;
}

- (void)_localeChanged:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EB6F4;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_timeZoneChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->_model, "calendar", a3));
  -[DayNavigationView setCalendar:](self->_navigationView, "setCalendar:", v4);

}

- (void)_contentSizeCategoryChanged
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController cellFactory](self, "cellFactory"));
  objc_msgSend(v3, "contentSizeCategoryChanged");

  -[DayNavigationView contentSizeCategoryChanged](self->_navigationView, "contentSizeCategoryChanged");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)_cachedOccurrencesChanged:(id)a3
{
  id v4;

  if (_os_feature_enabled_impl("MobileCal", "mark_holidays"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationView weekScrollView](self->_navigationView, "weekScrollView"));
    objc_msgSend(v4, "updateDayBadges");

  }
}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController view](self, "view"));
  objc_msgSend(v4, "setHidden:", v3 ^ 1);
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (BOOL)canAnimateToDate:(id)a3
{
  return -[DayNavigationView canAnimateToDate:](self->_navigationView, "canAnimateToDate:", a3);
}

- (void)significantTimeChangeOccurred
{
  -[DayNavigationView significantTimeChangeOccurred](self->_navigationView, "significantTimeChangeOccurred");
}

- (void)pulseToday
{
  -[DayNavigationView pulseToday](self->_navigationView, "pulseToday");
}

- (BOOL)eventSpringLoadingEnabled
{
  return self->_eventSpringLoadingEnabled;
}

- (void)setEventSpringLoadingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_eventSpringLoadingEnabled = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationViewController weekScrollView](self, "weekScrollView"));
  objc_msgSend(v4, "setEventSpringLoadingEnabled:", v3);

}

- (UIEdgeInsets)paletteSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[DayNavigationView paletteSafeAreaInsets](self->_navigationView, "paletteSafeAreaInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)visibleCellDayTypes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView weekScrollView](self->_navigationView, "weekScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleCellDayTypes"));

  return v3;
}

- (id)visibleCellBadgeColors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView weekScrollView](self->_navigationView, "weekScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleCellBadgeColors"));

  return v3;
}

- (id)visibleCellBadgeLocales
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView weekScrollView](self->_navigationView, "weekScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleCellBadgeLocales"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationView, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
