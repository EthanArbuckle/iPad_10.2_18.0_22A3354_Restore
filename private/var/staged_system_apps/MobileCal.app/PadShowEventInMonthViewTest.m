@implementation PadShowEventInMonthViewTest

- (void)_setupViewToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v5, "setSelectedDate:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootNavigationController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resetToMonthView"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v8, "setSelectedDate:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  objc_msgSend(v10, "showDate:animated:", v9, 0);

  -[PadShowEventTest setController:](self, "setController:", v10);
}

- (id)_getEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PadShowEventTest controller](self, "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviewForDate:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "occurrencesView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstNonAllDayEvent"));

  return v8;
}

@end
