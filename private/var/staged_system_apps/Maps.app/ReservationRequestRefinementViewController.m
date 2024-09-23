@implementation ReservationRequestRefinementViewController

- (ReservationRequestRefinementViewController)initWithDate:(id)a3 partySize:(unint64_t)a4 minimumPartySize:(unint64_t)a5 maximumPartySize:(unint64_t)a6 analyticsCaptor:(id)a7 timeZone:(id)a8 analyticsBookingSession:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  ReservationRequestRefinementViewController *v19;
  ReservationRequestRefinementViewController *v20;
  objc_super v22;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ReservationRequestRefinementViewController;
  v19 = -[ReservationRequestRefinementViewController initWithStyle:](&v22, "initWithStyle:", 1);
  v20 = v19;
  if (v19)
  {
    -[ReservationRequestRefinementViewController setDefaultPartySize:](v19, "setDefaultPartySize:", a4);
    -[ReservationRequestRefinementViewController setDefaultDate:](v20, "setDefaultDate:", v15);
    -[ReservationRequestRefinementViewController setMinimumPartySize:](v20, "setMinimumPartySize:", a5);
    -[ReservationRequestRefinementViewController setMaximumPartySize:](v20, "setMaximumPartySize:", a6);
    -[ReservationRequestRefinementViewController setPreviousPartySize:](v20, "setPreviousPartySize:", -[ReservationRequestRefinementViewController defaultPartySize](v20, "defaultPartySize"));
    -[ReservationRequestRefinementViewController setAnalyticsCaptor:](v20, "setAnalyticsCaptor:", v16);
    -[ReservationRequestRefinementViewController setTimeZone:](v20, "setTimeZone:", v17);
    -[ReservationRequestRefinementViewController setAnalyticsBookingSession:](v20, "setAnalyticsBookingSession:", v18);
  }

  return v20;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ReservationRequestRefinementViewController;
  -[ReservationRequestRefinementViewController viewDidLoad](&v3, "viewDidLoad");
  -[ReservationRequestRefinementViewController configureTableView](self, "configureTableView");
  -[ReservationRequestRefinementViewController configureNavBar](self, "configureNavBar");
}

- (void)configureTableView
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController tableView](self, "tableView"));
  v4 = objc_opt_class(ReservationTableViewCell);
  v5 = (objc_class *)objc_opt_class(ReservationTableViewCell);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController tableView](self, "tableView"));
  v9 = objc_opt_class(ReservationRefinementPartySizeTableViewCell);
  v10 = (objc_class *)objc_opt_class(ReservationRefinementPartySizeTableViewCell);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v9, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController tableView](self, "tableView"));
  v14 = objc_opt_class(DatePickerTableViewCell);
  v15 = (objc_class *)objc_opt_class(DatePickerTableViewCell);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", v14, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController tableView](self, "tableView"));
  objc_msgSend(v18, "setRowHeight:", UITableViewAutomaticDimension);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController tableView](self, "tableView"));
  objc_msgSend(v19, "setScrollEnabled:", 0);

}

- (void)configureNavBar
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("reservation_date_and_party_size_key"), CFSTR("localized string not found"), 0));
  -[ReservationRequestRefinementViewController setTitle:](self, "setTitle:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ReservationRequestRefinementViewController;
  -[ReservationRequestRefinementViewController viewWillDisappear:](&v11, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController analyticsCaptor](self, "analyticsCaptor"));
  objc_msgSend(v4, "captureMoreOptionsSubmit");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v5, "setCurrentView:", 5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController date](self, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController defaultDate](self, "defaultDate"));
  if (!objc_msgSend(v6, "isEqualToDate:", v7))
  {

    goto LABEL_5;
  }
  v8 = -[ReservationRequestRefinementViewController partySize](self, "partySize");
  v9 = -[ReservationRequestRefinementViewController defaultPartySize](self, "defaultPartySize");

  if (v8 != v9)
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController refinementDelegate](self, "refinementDelegate"));
    objc_msgSend(v10, "reservationRequestRefinementViewControllerDidRefine:", self);

  }
}

- (void)stepperChanged:(id)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "value");
  if (v4 > (double)-[ReservationRequestRefinementViewController previousPartySize](self, "previousPartySize"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController analyticsCaptor](self, "analyticsCaptor"));
    objc_msgSend(v5, "captureMoreOptionsIncreaseTableSize");
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v8, "value");
  if (v6 < (double)-[ReservationRequestRefinementViewController previousPartySize](self, "previousPartySize"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController analyticsCaptor](self, "analyticsCaptor"));
    objc_msgSend(v5, "captureMoreOptionsDecreaseTableSize");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v8, "value");
  -[ReservationRequestRefinementViewController setPreviousPartySize:](self, "setPreviousPartySize:", (unint64_t)v7);

}

- (void)datePickerChanged
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v3, "setTappedDatePicker:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController analyticsCaptor](self, "analyticsCaptor"));
  objc_msgSend(v4, "captureMoreOptionsSelectDateTime");

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v4;
  double v5;

  v4 = a4;
  if (objc_msgSend(v4, "row"))
  {
    if (objc_msgSend(v4, "row") == (id)1)
      v5 = 120.0;
    else
      v5 = 1000.0;
  }
  else
  {
    v5 = 120.0;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  UITableViewCell *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") != (id)1)
    {
      v11 = objc_opt_new(UITableViewCell);
      goto LABEL_7;
    }
    v8 = (objc_class *)objc_opt_class(DatePickerTableViewCell);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 60.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell datePicker](v11, "datePicker"));
    objc_msgSend(v13, "setMinimumDate:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell datePicker](v11, "datePicker"));
    objc_msgSend(v14, "setMinuteInterval:", 30);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController timeZone](self, "timeZone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell datePicker](v11, "datePicker"));
    objc_msgSend(v16, "setTimeZone:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController defaultDate](self, "defaultDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell datePicker](v11, "datePicker"));
    objc_msgSend(v18, "setDate:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell datePicker](v11, "datePicker"));
    v20 = v19;
    v21 = "datePickerChanged";
  }
  else
  {
    v22 = (objc_class *)objc_opt_class(ReservationRefinementPartySizeTableViewCell);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v11 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v24));

    v25 = (double)-[ReservationRequestRefinementViewController minimumPartySize](self, "minimumPartySize");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell stepperControl](v11, "stepperControl"));
    objc_msgSend(v26, "setMinimumValue:", v25);

    v27 = (double)-[ReservationRequestRefinementViewController maximumPartySize](self, "maximumPartySize");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell stepperControl](v11, "stepperControl"));
    objc_msgSend(v28, "setMaximumValue:", v27);

    -[UITableViewCell updateStepperValueToValue:](v11, "updateStepperValueToValue:", -[ReservationRequestRefinementViewController defaultPartySize](self, "defaultPartySize"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell stepperControl](v11, "stepperControl"));
    v20 = v19;
    v21 = "stepperChanged:";
  }
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, v21, 4096);

LABEL_7:
  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Preferred Date & Time");
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Table Size");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

LABEL_7:
  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (unint64_t)partySize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t defaultPartySize;
  void *v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellForRowAtIndexPath:", v4));

  v6 = objc_opt_class(ReservationRefinementPartySizeTableViewCell);
  defaultPartySize = 0;
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stepperControl"));
    objc_msgSend(v8, "value");
    defaultPartySize = (unint64_t)v9;

    if (!defaultPartySize)
      defaultPartySize = self->_defaultPartySize;
  }

  return defaultPartySize;
}

- (NSDate)date
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationRequestRefinementViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cellForRowAtIndexPath:", v3));

  v5 = objc_opt_class(DatePickerTableViewCell);
  v6 = 0;
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "datePicker"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));

  }
  return (NSDate *)v6;
}

- (ReservationRequestRefinementViewControllerDelegate)refinementDelegate
{
  return (ReservationRequestRefinementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_refinementDelegate);
}

- (void)setRefinementDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_refinementDelegate, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (unint64_t)defaultPartySize
{
  return self->_defaultPartySize;
}

- (void)setDefaultPartySize:(unint64_t)a3
{
  self->_defaultPartySize = a3;
}

- (NSDate)defaultDate
{
  return self->_defaultDate;
}

- (void)setDefaultDate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDate, a3);
}

- (unint64_t)minimumPartySize
{
  return self->_minimumPartySize;
}

- (void)setMinimumPartySize:(unint64_t)a3
{
  self->_minimumPartySize = a3;
}

- (unint64_t)maximumPartySize
{
  return self->_maximumPartySize;
}

- (void)setMaximumPartySize:(unint64_t)a3
{
  self->_maximumPartySize = a3;
}

- (unint64_t)previousPartySize
{
  return self->_previousPartySize;
}

- (void)setPreviousPartySize:(unint64_t)a3
{
  self->_previousPartySize = a3;
}

- (ReservationAnalyticsCaptor)analyticsCaptor
{
  return self->_analyticsCaptor;
}

- (void)setAnalyticsCaptor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCaptor, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (RestaurantReservationAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_analyticsCaptor, 0);
  objc_storeStrong((id *)&self->_defaultDate, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_refinementDelegate);
}

@end
